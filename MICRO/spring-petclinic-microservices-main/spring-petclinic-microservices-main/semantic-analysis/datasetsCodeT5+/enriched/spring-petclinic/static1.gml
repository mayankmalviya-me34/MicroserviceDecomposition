graph [
  directed 1
  node [
    id 0
    label "file::unknown.java"
    type "file"
  ]
  node [
    id 1
    label "class::UnknownClass"
    type "class"
  ]
  node [
    id 2
    label "method::UnknownClass::None"
    type "method"
  ]
  edge [
    source 0
    target 1
    relation "contains"
  ]
  edge [
    source 1
    target 2
    relation "defines"
  ]
]
