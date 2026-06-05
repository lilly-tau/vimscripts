if !exists("main_syntax")
	if exists("b:current_syntax")
		finish
	endif
	let main_syntax = "qlank"
elseif exists("b:current_syntax") && b:current_syntax == "qlank"
	finish
endif

setlocal ignorecase
syn match	qlankNumber		/[\-uU]\?\d\x*/
syn match	qlankIdentifier		/@[A-Za-z_]\+/
syn match	qlankVariable		/\$[A-Za-z_]\+/
syn keyword	qlankStructural		using USING outputs OUTPUTS with WITH
syn keyword	qlankStructural		do DO done DONE IF if WHILE while
syn keyword	qlankType		ptr PTR word WORD int INT char CHAR
syn keyword	qlankType		byte BYTE offset OFFSET
syn keyword	qlankInstruction	ret RET set SET
syn region	qlankComment		start=/;/ end=/$/

hi def link	qlankNumber		Constant
hi def link	qlankIdentifier		Identifier
hi def link	qlankVariable		Special
hi def link	qlankStructural		Keyword
hi def link	qlankType		Type
hi def link	qlankInstruction	Keyword
hi def link	qlankComment		Comment

let b:current_syntax = "qlank"
