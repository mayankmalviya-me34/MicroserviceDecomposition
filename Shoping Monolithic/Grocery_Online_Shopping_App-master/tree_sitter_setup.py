from tree_sitter import Language

# Build a shared library with JS + JSX grammar
Language.build_library(
    # Output library
    'build/my-languages.so',

    # List of grammar repositories
    [
        'tree-sitter-javascript',  # JS grammar
        'tree-sitter-jsx'          # JSX grammar (React)
    ]
)

print("Tree-sitter JS/JSX setup complete. Library saved at build/my-languages.so")
