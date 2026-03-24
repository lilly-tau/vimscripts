; SYNTAX (CBNF)
;
; <program>	::=	*<list | invoke | SP>
; <list>	::=	"[".*(*<SP>.<number>).*<SP>."]"
; <invoke>	::=	"\".<identifier>
; <number>	::=	<HEX.HEX.[HEX.HEX.[HEX.HEX.HEX.HEX
;		.	[HEX.HEX.HEX.HEX.HEX.HEX.HEX.HEX]]]>
; <identifier>	::=	"`" | "~" | "!" | "@" | "#" | "$" | "%" | "^" | "&"
;		|	"*" | "(" | ")" | "-" | "=" | "+" | "[" | "]" | "{"
;		|	"}" | "\" | "|" | ";" | ":" | $22 | "'" | "," | "."
;		|	"<" | ">" | "/" | "?" | *<ALPHA>
; <SP>		::=	$20 | $0D | $0A | $09
; <HEX>		::=	$30-$39 | $41-$5A | $61-$7A
; <ALPHA>	::=	$41-$5A | $61-$7A
;
; BUILTIN MACROS
;
; \null
;	Equivalent to [ 00 ]
; \\
;	Reads in an identifier (using the rules from SYNTAX above) and a scope
;	of the form (CBNF) ::: "{".<program>."}" ::: or a byte list of the
;	form of <list>. In either case a new macro is defined of the identifier
;	specified with the contents specified.


\\program{ ; This is a text macro
\\movax{[B8 $$]\purge$}
\\int[CD]
\\incax[40]

\movax
\int[10]
\incax
\int[10]
}

\program
