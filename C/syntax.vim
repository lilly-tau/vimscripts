if !exists("main_syntax")
	if exists("b:current_syntax")
		finish
	endif
	let main_syntax = "C"
elseif exists("b:current_syntax") && b:current_syntax == "C"
	finish
endif

syn keyword 	CKeyword	break case continue default do else for goto if
syn keyword 	CKeyword	return sizeof switch while
syn keyword 	CType		char double float int long short void
syn keyword 	CNamespace	enum struct union
syn keyword 	CQualifier	auto const extern register signed unsigned
syn keyword 	CQualifier	static typedef volatile
syn match	CIdentifier	/[_a-zA-Z][_a-zA-Z0-9]*/
syn match	CFloatConst	/[0-9]\+\.[0-9]\+\([eE][+\-][0-9]\+\)\?[flFL]/
syn match	CFloatConst	/[0-9]\+\([eE][+\-][0-9]\+\)\?[flFL]/
syn match	CIntConst	/[1-9][0-9]*\([uU][lL]\|[lL][uU]\)/
syn match	CIntConst	/0[0-7]*\([uU][lL]\|[lL][uU]\)/
syn match	CIntConst	/0x[0-9A-Fa-f]\+\([uU][lL]\|[lL][uU]\)/
syn match	CEscapeSeq	/\\[abfnrtv'"?\\]\|\\[0-7]\+\|\\x[0-9A-Fa-f]\+/ contained
syn match	CCharConst	/'\(\\'\|[A-Za-z0-9!"#%&`()*+,\-./:;<=>?\[\\\]^_{|}\~ \t\v\f]\)\+'/ contains=CEscapeSeq
syn match	CStrConst	/"\(\\"\|[A-Za-z0-9!'#%&`()*+,\-./:;<=>?\[\\\]^_{|}\~ \t\v\f]\)\+"/ contains=CEscapeSeq
syn match	CHeaderName	/\(include[ \r\n\t\f\v]\+\)\@<=<[A-Za-z0-9!"'#%&`()*+,\-./:;<=?\[\\\]^_{|}\~ \t\v\f]*>/ contained
syn match	CHeaderName	/\(include[ \r\n\t\f\v]\+\)\@<="[A-Za-z0-9!'#%&`()*+,\-./:;<=>?\[\\\]^_{|}\~ \t\v\f]*"/ contained
syn match	CComment	/\/\*.*\*\//
syn match	CLabel		/[_a-zA-Z][_a-zA-Z0-9]\+:/
syn region	CPreproc	start=/#/ skip=/\\r\?\n/ end=/\r\?\n/ contains=CHeaderName,CStrConst,CIntConst,CFloatConst,CKeyword,CType,CQualifier,CComment,CLabel

hi def link	CKeyword	Keyword
hi def link	CType		Type
hi def link	CNamespace	Structure
hi def link	CQualifier	StorageClass
hi def link	CFloatConst	Float
hi def link	CIntConst	Number
hi def link	CEscapeSeq	SpecialChar
hi def link	CCharConst	Character
hi def link	CStrConst	String
hi def link	CComment	Comment
hi def link	CLabel		Label
hi def link	CPreproc	Preproc
hi def link	CHeaderName	String

let b:current_syntax = "C"
