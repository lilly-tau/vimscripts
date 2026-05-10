if !exists("main_syntax")
	if exists("b:current_syntax")
		finish
	endif
	let main_syntax = "mkproj"
elseif exists("b:current_syntax") && b:current_syntax == "mkproj"
	finish
endif

syn match mkprojExprSymbol /[,]/ contained
syn match mkprojIdentifier /[A-Za-z_]\+/ contained
syn region mkprojString start=/\"/ skip=/\\\"/ end=/\"/ contained
syn match mkprojStringEscape /\\[nrt"]\|\\x\x\x/ contained containedin=mkprojString
syn match mkprojVar /\$[A-Za-z_]\+/ contained
syn keyword mkprojExprKeyword eq not cat curdir car cdr cons atom contained
syn match mkprojVarIdentifier /[A-Za-z_]/ contained

syn region mkprojComment start=/@/ end=/$/
syn region mkprojLabel start=/\(@\)\@<!@\(@\)\@!\(.*:\)\@=/ end=/:/ contained containedin=mkprojComment
syn region mkprojType start=/@@\(.*:\)\@=/ end=/:/ contained containedin=mkprojComment
syn match mkprojExit /@@\(.*:\)\@!/ contained containedin=mkprojComment

syn region mkprojSet start=/\\[ \t]/ end=/[ \t,]\+/ contains=mkprojVarIdentifier
syn region mkprojSetValue start=/\(\\[ \t]\+[A-Za-z_]\+[ \t,]\+\)\@<=/ end=/$/ contains=mkprojString,mkprojIdentifier,mkprojVar
syn region mkprojSetValueExpr start=/\(\\[ \t]\+[A-Za-z_]\+[ \t,]\+\)\@<=[ \t]*([ \t]\@=/ end=/[ \t]\@<=)/ contains=mkprojExprKeyword,mkprojExprSymbol,mkprojString,mkprojVar,mkprojVar,mkprojIdentifier,mkprojSet,mkprojSetValueExpr

syn match mkprojPipe /^[ \t,]*|[|&$]*/

syn region mkprojPipeVar start=/\(^|[|&]*$[|&]*[ \t,]*\)\@<=/ end=/$/ contains=mkprojVarIdentifier
syn region mkprojPipeNoVar start=/\(^|[|&]*[ \t,]*\)\@<=/ end=/$/

syn region mkprojGotoIfVar start=/?/ end=/$\|[ \t,]\+/ contains=mkprojVarIdentifier
syn region mkprojGotoIfExpr start=/?(/ end=/)/ contains=mkprojExprKeyword,mkprojExprSymbol,mkprojString,mkprojVar,mkprojVar,mkprojIdentifier,mkprojSet,mkprojSetValueExpr
syn region mkprojGoto start=/%\$\@!/ end=/\([ \t,\r\n]\|\$\)\@=/
syn region mkprojGotoVar start=/%\$/ end=/\([ \t,\r\n]\|\$\)\@=/ contains=mkprojVarIdentifier

syn region mkprojMkdir start=/\~[ \t,]\+/ end=/$/ contains=mkprojIdentifier,mkprojString,mkprojVar

syn region mkprojOutput start=/>[012]\?[ \t]/ end=/$/ contains=mkprojIdentifier,mkprojString,mkprojVar
syn region mkprojInput start=/<[ \t]/ end=/$/ contains=mkprojVarIdentifier

syn keyword mkprojDirectiveKeyword include call return execute contained
syn region mkprojDirective start=/#[A-Za-z_]\+/ end=/$/ contains=mkprojDirectiveKeyword,mkprojIdentifier,mkprojString,mkprojVar,mkprojGoto

hi def link mkprojComment	Comment
hi def link mkprojLabel		Keyword
hi def link mkprojType		Identifier
hi def link mkprojExit		Identifier

hi def link mkprojExprKeyword	Keyword
hi def link mkprojExprSymbol	Special
hi def link mkprojIdentifier	String
hi def link mkprojString	String
hi def link mkprojStringEscape	Special

hi def link mkprojVarIdentifier	Identifier
hi def link mkprojVar		Identifier
hi def link mkprojGoto		Type
hi def link mkprojGotoVar	Type

hi def link mkprojPipeVar	Identifier
hi def link mkprojPipeNoVar	String
hi def link mkprojPipe		Special

hi def link mkprojGotoIfExpr	Special
hi def link mkprojGotoIfVar	Special

hi def link mkprojSet		Special
hi def link mkprojSetValue	String

hi def link mkprojMkdir		Special

hi def link mkprojOutput	Special
hi def link mkprojInput		Special

hi def link mkprojDirectiveKeyword	Special
hi def link mkprojDirective		Special

let b:current_syntax = "mkproj"
