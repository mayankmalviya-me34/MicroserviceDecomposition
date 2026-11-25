import axios from 'axios';

// Base URL from environment variable or fallback
const API_URL = process.env.REACT_APP_API_URL || "http://localhost:8000";

// Create axios instance
const api = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Set Authorization header if token exists
const setHeader = () => {
  const token = localStorage.getItem('token');
  if (token) {
    api.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  } else {
    delete api.defaults.headers.common['Authorization'];
  }
};

// GET request
export const GetData = async (endPoint, options = {}) => {
  try {
    setHeader();
    const response = await api.get(endPoint, options);
    return response;
  } catch (err) {
    console.error("GET Error:", err.response?.data || err.message);
    throw err;
  }
};

// POST request
export const PostData = async (endPoint, data = {}) => {
  try {
    setHeader();
    const response = await api.post(endPoint, data);
    return response;
  } catch (err) {
    console.error("POST Error:", err.response?.data || err.message);
    throw err;
  }
};

// PUT request
export const PutData = async (endPoint, data = {}) => {
  try {
    setHeader();
    const response = await api.put(endPoint, data);
    return response;
  } catch (err) {
    console.error("PUT Error:", err.response?.data || err.message);
    throw err;
  }
};

// DELETE request
export const DeleteData = async (endPoint) => {
  try {
    setHeader();
    const response = await api.delete(endPoint);
    return response;
  } catch (err) {
    console.error("DELETE Error:", err.response?.data || err.message);
    throw err;
  }
};

export default api;
