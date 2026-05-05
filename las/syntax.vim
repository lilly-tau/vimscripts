if !exists("main_syntax")
	if exists("b:current_syntax")
		finish
	endif
	let main_syntax = "las"
elseif exists("b:current_syntax") && b:current_syntax == "las"
	finish
endif

setlocal ignorecase

syn match	lasNumber	/\x\x\(\x\x\(\x\x\x\x\(\x\x\x\x\x\x\x\x\)\?\)\?\)\?/ contained
syn match	lasSymbol	/[{}[\]]/
syn match	lasBuiltin	/\\\\\|\\null/
syn match	lasDefineIdent	/\(\\\\\)\@<=\([~!@#$%^&*()-+=`{}[\]|;'",.<>/]\|\a\+\)/
syn match	lasInvoke	/\\\([~!@#$%^&*()-+=`{}[\]|;'",.<>/]\|\a\+\)/
syn region	lasComment	start=/;/ end=/$/
syn region	lasByteList	start=/\(`\@<!\[\)\@<=./ end=/\(`\@<!\]\)\@=/ contains=lasNumber

hi def link	lasNumber	Number
hi def link	lasSymbol	Special
hi def link	lasBuiltin	Special
hi def link	lasDefineIdent	Identifier
hi def link	lasInvoke	Identifier
hi def link 	lasComment	Comment

let b:current_syntax = "las"
