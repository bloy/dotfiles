syn region cssDefinition transparent fold matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Properties,cssComment,cssLength,cssColor,cssURL,cssImportant,cssError,cssString

syn region cssComment fold start="/\*" end="\*/"

set foldmethod=syntax
