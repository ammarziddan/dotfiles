; inherits: html_tags

[
  (section)
  (conditional) 
  (verbatim) 
  (switch)
  (loop)
  (php_statement)
  (once)
  (stack)
] @indent.begin

[
  (conditional_keyword)
  (directive_end)
] @indent.branch

[
  (directive_end)
] @indent.end

; BUG: switch: @case, @break, & @default
; BUG: switch: @empty directive should be @indent.branch if in loop & does not have parameter
; BUG: switch: @empty directive should be @indent.branch if in loop & does not have parameter
