if !exists("main_syntax")
	if exists("b:current_syntax")
		finish
	endif
	let main_syntax = "fasm"
elseif exists("b:current_syntax") && b:current_syntax == 'fasm'
	finish
endif

setlocal ignorecase

syn keyword	fasmDirective		at label restore end namespace element
syn keyword	fasmDirective		if else assert macro local purge esc
syn keyword	fasmDirective		mvmacro struc restruc equ define
syn keyword	fasmDirective		redefine reequ repeat while break irp
syn keyword	fasmDirective		iterate indx postpone irpv outscope
syn keyword	fasmDirective		rawmatch rmatch org virtual as load
syn keyword	fasmDirective		store from restartout include eval
syn keyword	fasmDirective		display err format executable binary
syn keyword	fasmDirective		isolatelines removecomments match
syn keyword	fasmDirective		retaincomments calminstruction

syn keyword	fasmCalminstruction	assemble jyes jno jump exit
syn keyword	fasmCalminstruction	arrange compute check publish
syn keyword	fasmCalminstruction	transform stringify take call taketext

syn keyword	fasmInstruction		aaa aad aam aas adc adcx add addox and
syn keyword	fasmInstruction		andn bextr blcfill blci blcic blcmsk
syn keyword	fasmInstruction		blcs blsfill blsi blsic blsmsk blsr
syn keyword	fasmInstruction		bound bsf bsr bswap bt btc btr bts
syn keyword	fasmInstruction		bzhi call cbw cwde cdqe cwd cdq cqo
syn keyword	fasmInstruction		clc cld clflush clflushopt clwb clzero
syn keyword	fasmInstruction		cmc cmovo cmovno c

syn keyword	fasmBuiltin		__time__ __file__ __line__ __source__

syn keyword	fasmData		db dw dd dp dq dt ddq dqq ddqq dup
syn keyword	fasmData		rb rw rd rp rq rt rdq rqq rdqq dbx
syn keyword	fasmData		emit file

syn keyword	fasmTypes		byte word dword fword pword qword
syn keyword	fasmTypes		tbyte tword dqword xword qqword yword
syn keyword	fasmTypes		dqqword zword

syn keyword	fasmOperator		mod xor and or shl shr not bsf bsr
syn keyword	fasmOperator		bswap string lengthof bappend metadata
syn keyword	fasmOperator		sizeof elementof scaleof metadataof
syn keyword	fasmOperator		elementsof float trunc relativeto
syn keyword	fasmOperator		eqtype eq defined definite used

syn match	fasmComment		/;.*$/
syn match	fasmSymbol		/[+-/*=<>()[\]{}:?!,.|&~#`\\%]/
syn match	fasmBinary		/\<[01]\+b\>/
syn match	fasmOctal		/\<[0-7]\+[oq]\>/
syn match	fasmDecimal		/\<\d\+d\?\>/
syn match 	fasmHexadecimal		/\<0x\x\+\>/
syn match	fasmHexadecimal		/\$\<\x\+\>/
syn match	fasmHexadecimal		/\<\d\x*h\>/
syn match	fasmFloat		/\<\d\+f\?\>/
syn match	fasmFloat		/\<\d\+\.\d\+f\?\>/
syn match	fasmFloat		/\<\d\+e\d\+f\?\>/
syn match	fasmLabel		/?\?[A-Za-z._][A-Za-z0-9._]*?\?:/
syn match	fasmLabel		/?[A-Za-z0-9._]\+?\?:/
syn match	fasmLabel		/@@:/

syn region	fasmString		start=/"/ end=/"/
syn region	fasmString		start=/'/ end=/'/
syn region	fasmUncommented		start=/retaincomments/ end=/removecomments/ contains=ALLBUT,fasmComment

hi def link	fasmBinary		fasmNumeral
hi def link 	fasmOctal		fasmNumeral
hi def link 	fasmDecimal		fasmNumeral
hi def link	fasmHexadecimal		fasmNumeral
hi def link	fasmFloat		fasmNumeral

hi def link	fasmSymbol		Special
hi def link	fasmNumeral		Number
hi def link	fasmString		String
hi def link	fasmBuiltin		Function
hi def link	fasmLabel		Keyword
hi def link	fasmData		Type
hi def link	fasmTypes		Type
hi def link	fasmDirective		Special
hi def link	fasmCalminstruction	Keyword
hi def link	fasmOperator		Keyword
hi def link	fasmComment		Comment

let b:current_syntax = "vim"
