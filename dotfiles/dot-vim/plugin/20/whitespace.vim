command! -range=% CondenseEmptyLines call PreserveView("silent " . <line1> . "," . <line2> . "g/\\v^\\n\\n/d")
command! -range=% TrimWhitespace call PreserveView(<line1> . "," . <line2> . "s/\\v\\s+$//e")
