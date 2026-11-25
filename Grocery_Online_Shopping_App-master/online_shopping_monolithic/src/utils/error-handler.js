const { createLogger, transports } = require('winston');
const { AppError } = require('./app-errors');


const LogErrors = createLogger({
    transports: [
      new transports.Console(),
      new transports.File({ filename: 'app_error.log' })
    ]
  });


class ErrorLogger {
    constructor(){}
    async logError(err){
        console.log('==================== Start Error Logger ===============');
        LogErrors.log({
            private: true,
            level: 'error',
            message: `${new Date()}-${JSON.stringify(err)}`
          });
        console.log('==================== End Error Logger ===============');
        // log error with Logger plugins

        return false;
    }

    isTrustError(error){
        if(error instanceof AppError){
            return error.isOperational;
        }else{
            return false;
        }
    }
}

// ---------------------------------------------------------------
// IMPORTANT: process-level crash handlers must be registered ONCE
// at application startup, NOT inside a per-request middleware.
// Registering them here (as the original code did) added a new
// listener on every single request, and one of those listeners
// re-threw the error, which crashes the entire Node.js process
// unconditionally. That was the actual cause of the container
// restart loop seen under load.
// ---------------------------------------------------------------
const errorLogger = new ErrorLogger();

process.on('unhandledRejection', (reason) => {
    console.log(reason, 'UNHANDLED_REJECTION');
    errorLogger.logError(reason);
});

process.on('uncaughtException', (error) => {
    console.log(error, 'UNCAUGHT_EXCEPTION');
    errorLogger.logError(error);
    // Do NOT re-throw and do NOT process.exit() here — for a load-tested
    // web server we want to log and keep serving other requests rather
    // than kill the whole process on a single bad request.
});

const ErrorHandler = async (err, req, res, next) => {
    await errorLogger.logError(err);

    // Always resolve to a valid numeric HTTP status code. A plain
    // `new Error(...)` (not an AppError) has no .statusCode at all,
    // and even AppError instances should be defensively checked —
    // res.status() throws a RangeError (crashing the process) if
    // given anything other than a valid integer status code.
    let statusCode = err && err.statusCode;
    if (typeof statusCode !== 'number' || statusCode < 100 || statusCode > 599) {
        statusCode = 500;
    }

    const message =
        (err && err.errorStack) ? err.errorStack :
        (err && err.message)    ? err.message    :
        'Internal Server Error';

    return res.status(statusCode).json({ message });
};

module.exports = ErrorHandler;