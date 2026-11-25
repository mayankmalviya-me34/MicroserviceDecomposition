from tree_sitter import Language

Language.build_library(
    'build/my-languages.dll',   # DLL path
    ['tree-sitter-javascript']   # grammar folder
)
