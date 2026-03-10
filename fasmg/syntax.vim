if !exists("main_syntax")
	if exists("b:current_syntax")
		finish
	endif
	let main_syntax = "fasmg"
elseif exists("b:current_syntax") && b:current_syntax == 'fasmg'
	finish
endif

setlocal ignorecase

syn keyword	fasmgDirective		at label restore end namespace element
syn keyword	fasmgDirective		if else assert macro local purge esc
syn keyword	fasmgDirective		mvmacro struc restruc equ define
syn keyword	fasmgDirective		redefine reequ repeat while break irp
syn keyword	fasmgDirective		iterate indx postpone irpv outscope
syn keyword	fasmgDirective		rawmatch rmatch org virtual as load
syn keyword	fasmgDirective		store from restartout include eval
syn keyword	fasmgDirective		display err format executable binary
syn keyword	fasmgDirective		isolatelines removecomments match
syn keyword	fasmgDirective		retaincomments calminstruction

syn keyword	fasmgCalminstruction	assemble jyes jno jump exit
syn keyword	fasmgCalminstruction	arrange compute check publish
syn keyword	fasmgCalminstruction	transform stringify take call taketext

syn keyword	fasmgBuiltin		__time__ __file__ __line__ __source__

syn keyword	fasmgData		db dw dd dp dq dt ddq dqq ddqq dup
syn keyword	fasmgData		rb rw rd rp rq rt rdq rqq rdqq dbx
syn keyword	fasmgData		emit file

syn keyword	fasmgTypes		byte word dword fword pword qword
syn keyword	fasmgTypes		tbyte tword dqword xword qqword yword
syn keyword	fasmgTypes		dqqword zword

syn keyword	fasmgOperator		mod xor and or shl shr not bsf bsr
syn keyword	fasmgOperator		bswap string lengthof bappend metadata
syn keyword	fasmgOperator		sizeof elementof scaleof metadataof
syn keyword	fasmgOperator		elementsof float trunc relativeto
syn keyword	fasmgOperator		eqtype eq defined definite used

syn match	fasmgComment		/;.*$/
syn match	fasmgSymbol		/[+-/*=<>()[\]{}:?!,.|&~#`\\%]/
syn match	fasmgBinary		/\<[01]\+b\>/
syn match	fasmgOctal		/\<[0-7]\+[oq]\>/
syn match	fasmgDecimal		/\<\d\+d\?\>/
syn match 	fasmgHexadecimal		/\<0x\x\+\>/
syn match	fasmgHexadecimal		/\$\<\x\+\>/
syn match	fasmgHexadecimal		/\<\d\x*h\>/
syn match	fasmgFloat		/\<\d\+f\?\>/
syn match	fasmgFloat		/\<\d\+\.\d\+f\?\>/
syn match	fasmgFloat		/\<\d\+e\d\+f\?\>/
syn match	fasmgLabel		/?\?[A-Za-z._][A-Za-z0-9._]*?\?:/
syn match	fasmgLabel		/?[A-Za-z0-9._]\+?\?:/
syn match	fasmgLabel		/@@:/

syn region	fasmgString		start=/"/ end=/"/
syn region	fasmgString		start=/'/ end=/'/
syn region	fasmgUncommented	start=/retaincomments/ end=/removecomments/ contains=ALLBUT,fasmgComment

hi def link	fasmgBinary		fasmgNumeral
hi def link 	fasmgOctal		fasmgNumeral
hi def link 	fasmgDecimal		fasmgNumeral
hi def link	fasmgHexadecimal		fasmgNumeral
hi def link	fasmgFloat		fasmgNumeral

hi def link	fasmgSymbol		Special
hi def link	fasmgNumeral		Number
hi def link	fasmgString		String
hi def link	fasmgBuiltin		Function
hi def link	fasmgLabel		Keyword
hi def link	fasmgData		Type
hi def link	fasmgTypes		Type
hi def link	fasmgDirective		Special
hi def link	fasmgCalminstruction	Keyword
hi def link	fasmgOperator		Keyword
hi def link	fasmgComment		Comment

let b:current_syntax = "fasmg"
