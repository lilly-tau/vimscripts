if !exists("main_syntax")
	if exists("b:current_syntax")
		finish
	endif
	let main_syntax = "fasm"
elseif exists("b:current_syntax") && b:current_syntax == "fasm"
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

syn keyword	fasmCalminstruction	containedin=fasmCALM
syn keyword	fasmCalminstruction	assemble jyes jno jump exit
syn keyword	fasmCalminstruction	arrange compute check publish
syn keyword	fasmCalminstruction	transform stringify take call taketext

syn keyword	fasmInstruction		aaa aad aam aas adc adcx add addox and
syn keyword	fasmInstruction		andn bextr blcfill blci blcic blcmsk
syn keyword	fasmInstruction		blcs blsfill blsi blsic blsmsk blsr
syn keyword	fasmInstruction		bound bsf bsr bswap bt btc btr bts
syn keyword	fasmInstruction		bzhi call cbw cwde cdqe cwd cdq cqo
syn keyword	fasmInstruction		clc cld clflush clflushopt clwb clzero
syn keyword	fasmInstruction		cmc cmovo cmovno cmovb cmovnb cmovc
syn keyword	fasmInstruction		cmovnc cmovae cmovnae cmovz cmovnz
syn keyword	fasmInstruction		cmove cmovne cmovbe cmovnbe cmova
syn keyword	fasmInstruction		cmovna cmovs cmovns cmovp cmovnp
syn keyword	fasmInstruction		cmovpe cmovpo cmovl cmovnl cmovge
syn keyword	fasmInstruction		cmovnge cmovle cmovnle cmovg cmovng
syn keyword	fasmInstruction		cmp cmps cmpsb cmpsw cmpsd cmpsq
syn keyword	fasmInstruction		cmpxchg cmpxchg8b cmpxchg16b cpuid
syn keyword	fasmInstruction		crc32 daa das dec div enter idiv imul
syn keyword	fasmInstruction		in inc ins insb insw insd int into
syn keyword	fasmInstruction		jo jno jb jnb jc jnc jae jnae jz jnz
syn keyword	fasmInstruction		je jne jbe jnbe ja jna js jns jp jnp
syn keyword	fasmInstruction		jpe jpo jl jnl jg jng jge jnge jle
syn keyword	fasmInstruction		jnle jcxz jecxz jrcxz jmp lahf lds les
syn keyword	fasmInstruction		lfs lgs lss lea leave lfence llwpcb
syn keyword	fasmInstruction		lods lodsb lodsw lodsd lodsq loop
syn keyword	fasmInstruction		loope loopne loopz loopnz lwpins
syn keyword	fasmInstruction		lwpval lzcnt mcommit mfence monitorx
syn keyword	fasmInstruction		mov movbe movd movmskpd movmskps
syn keyword	fasmInstruction		movnti movs movsb movsw movsd movsq
syn keyword	fasmInstruction		movsx movsxd movzx mul mulx mwaitx neg
syn keyword	fasmInstruction		nop not or out outs outsb outsw outsd
syn keyword	fasmInstruction		pause pdep pext pop popa popad popcnt
syn keyword	fasmInstruction		popf popfd popfq prefetch prefetchw
syn keyword	fasmInstruction		prefetchnta prefetcht0 prefetcht1
syn keyword	fasmInstruction		prefetcht2 push pusha pushad pushf
syn keyword	fasmInstruction		pushfd pushfq rcl rcr rdfsbase
syn keyword	fasmInstruction		rdgsbase rdpid rdpru rdrand rdseed
syn keyword	fasmInstruction		ret rol ror rorx sahf sal shl sar sarx
syn keyword	fasmInstruction		sbb scas scasb scasw scasd scasq seto
syn keyword	fasmInstruction		setno setb setnb setc setnc setae
syn keyword	fasmInstruction		setnae setz setnz sete setne setbe
syn keyword	fasmInstruction		setnbe seta setna sets setns setp
syn keyword	fasmInstruction		setnp setpe setpo setl setnl setge
syn keyword	fasmInstruction		setle setnle netnge sfence shl shld
syn keyword	fasmInstruction		shlx shr shrd shrx slwpcb stc std stos
syn keyword	fasmInstruction		stosb stosw stosd stosq sub t1mskc test
syn keyword	fasmInstruction		tzcnt tzmsk ud0 ud1 ud2 wrfsbase
syn keyword	fasmInstruction		wrgsbase xadd xchg xlat xlatb xor
syn keyword	fasmInstructionModifier	rep repne repe repnz repz far near
syn keyword	fasmInstructionModifier	short

syn keyword	fasmSystemInstruction	arpl clac clgi cli clts clrssbsy hlt
syn keyword	fasmSystemInstruction	incssp int3 invd invlpg invlpga
syn keyword	fasmSystemInstruction	invlpgb invpcid iret iretd iretq lar
syn keyword	fasmSystemInstruction	lar lgdt lidt lldt lmsw lsl ltr
syn keyword	fasmSystemInstruction	monitor mwait psmash pvalidate rdmsr
syn keyword	fasmSystemInstruction	rdpkru rdpmc rdssp rdtsc rdtscp
syn keyword	fasmSystemInstruction	rmpadjust rmpquery rmpread rmpupdate
syn keyword	fasmSystemInstruction	rsm rstoressp saveprevssp setssbsy
syn keyword	fasmSystemInstruction	sgdt sidt skinit sldt smsw stac sti
syn keyword	fasmSystemInstruction	stgi str swapgs syscall sysenter
syn keyword	fasmSystemInstruction	sysexit sysret tlbsync verr verw vmload
syn keyword	fasmSystemInstruction	vmmcall vmgexit vmrun vmsave wbinvd
syn keyword	fasmSystemInstruction	wbnoinvd wrmsr wrpkru wrss wruss

syn keyword	fasmSSEInstruction	addpd vaddpd addps vaddps addsd vaddsd
syn keyword	fasmSSEInstruction	addss vaddss addsubpd vaddsubpd
syn keyword	fasmSSEInstruction	addsubps vaddsubps aesdec vaesdec
syn keyword	fasmSSEInstruction	aesdeclast vaesdeclast aesenc vaesenc
syn keyword	fasmSSEInstruction	aesenclast vaesenclast aesimc vaesimc
syn keyword	fasmSSEInstruction	aeskeygenassist vaeskeygenassist
syn keyword	fasmSSEInstruction	andnpd vandnpd andnps vandnps andpd
syn keyword	fasmSSEInstruction	vandpd andps vandps blendpd vblendpd
syn keyword	fasmSSEInstruction	blendps vblendps blendvbpd vblendvpd
syn keyword	fasmSSEInstruction	blendvps vblendvps cmppd vcmppd cmpps
syn keyword	fasmSSEInstruction	vcmpss comisd vcomisd comiss vcomiss
syn keyword	fasmSSEInstruction	cvtdq2pd vcvtdq2pd cvtdq2ps vcvtdq2ps
syn keyword	fasmSSEInstruction	cvtpd2dq vcvrpd2dq cvtpd2ps cvtps2dq
syn keyword	fasmSSEInstruction	cvtps2pd cvtsd2si cvtsd2ss cvtsi2sd
syn keyword	fasmSSEInstruction	cvtsiss cvtss2sd cvtss2si cvttpd2dq
syn keyword	fasmSSEInstruction	cvttps2dq cvttsd2si cvttsi2si vcvtpd2ps
syn keyword	fasmSSEInstruction	vcvtps2dq vcvtps2pd vcvtsd2si vcvtsd2ss
syn keyword	fasmSSEInstruction	vcvtsiss vcvtss2sd vcvtss2si vcvttpd2dq
syn keyword	fasmSSEInstruction	vcvttps2dq vcvttsd2si vcvttsi2si
syn keyword	fasmSSEInstruction	vcvtsi2sd divpd vdivpd divps vdivps
syn keyword	fasmSSEInstruction	divsd vdivsd divss vdivss dppd vdppd
syn keyword	fasmSSEInstruction	dpps vdpps extractps vextractps extrq
syn keyword	fasmSSEInstruction	haddpd vhaddpd haddps vhaddps hsubpd
syn keyword	fasmSSEInstruction	vhsubpd hsubps vhsubps insertps
syn keyword	fasmSSEInstruction	vinsertps insertq lddqu vlddqu ldmxcsr
syn keyword	fasmSSEInstruction	vldmxcsr maskmovdqu vmaskmovdqu maxpd
syn keyword	fasmSSEInstruction	vmaxpd maxps vmaxps maxsd vmaxsd maxss
syn keyword	fasmSSEInstruction	vmaxss minpd vminpd minps vminps minsd
syn keyword	fasmSSEInstruction	vminsd minss vminss movapd vmovapd
syn keyword	fasmSSEInstruction	movaps vmovaps movd vmovd movddup
syn keyword	fasmSSEInstruction	vmovddup vmovdqa vmovdqa movdqu
syn keyword	fasmSSEInstruction	vmovdqu movhlps vmovhlps movhpd vmovhpd
syn keyword	fasmSSEInstruction	movhps vmovhps movlhps vmovlhps movlpd
syn keyword	fasmSSEInstruction	vmovlpd movlps vmovlps movmskpd
syn keyword	fasmSSEInstruction	vmovmskpd movntdq vmovntdq movntdqa
syn keyword	fasmSSEInstruction	vmovntdqa movntpd vmovntpd movntps
syn keyword	fasmSSEInstruction	vmovntps movntsd movntss movq vmovq
syn keyword	fasmSSEInstruction	movsd vmovsd movshdup vmovshdup
syn keyword	fasmSSEInstruction	movsldup vmovsldup movss vmovss
syn keyword	fasmSSEInstruction	movupd vmovupd movups vmovups mpsadbw
syn keyword	fasmSSEInstruction	vmpsadbw mulpd vmulpd mulps vmulps
syn keyword	fasmSSEInstruction	mulsd vmulsd mulss vmulss orpd vorpd
syn keyword	fasmSSEInstruction	orps vorps pabsb vpabsb pabsd vpabsd
syn keyword	fasmSSEInstruction	pabsw vpabsw packssdw vpackssdw
syn keyword	fasmSSEInstruction	packsswb vpacksswb packusdw vpackusdw
syn keyword	fasmSSEInstruction	packuswb vpackuswb paddb vpaddb paddd
syn keyword	fasmSSEInstruction	vpaddd paddq vpaddq paddsb vpaddsb
syn keyword	fasmSSEInstruction	paddsw vpaddsw paddusb vpaddusb paddusw
syn keyword	fasmSSEInstruction	vpaddusw paddw vpaddw palignr vpalignr
syn keyword	fasmSSEInstruction	pand vpand pandn vpandn pavgb vpavgb
syn keyword	fasmSSEInstruction	pavgw vpavgw pblendvb pblendw vpblendw
syn keyword	fasmSSEInstruction	pclmulqdq vpclmulqdq pcmpeqb vpcmpeqb
syn keyword	fasmSSEInstruction	pcmpeqd vpcmpeqd pcmpeqq vpcmpeqq
syn keyword	fasmSSEInstruction	pcmpeqw vpcmpeqw pcmpestri vpcmpestri
syn keyword	fasmSSEInstruction	pcmpestrm vpcmpestrm pcmpgtb vpcmpgtb
syn keyword	fasmSSEInstruction	pcmpgtd vpcmpgtd pcmpgtq vpcmpgtq
syn keyword	fasmSSEInstruction	pcmpgtw vpcmpgtw pcmpistri vpcmpistri
syn keyword	fasmSSEInstruction	pcmpistrm vpcmpistrm pextrb vpextrb
syn keyword	fasmSSEInstruction	pextrd vpextrd pextrq vpextrq pextrw
syn keyword	fasmSSEInstruction	vpextrw phaddd vphaddd phaddsw vphaddsw
syn keyword	fasmSSEInstruction	phaddw vphaddw phminposuw vphminposuw
syn keyword	fasmSSEInstruction	phsubd vphsubd phsubsw vphsubsw phsubw
syn keyword	fasmSSEInstruction	vphsubw pinsrb vpinsrb pinsrd vpinsrd
syn keyword	fasmSSEInstruction	pinsrq vpinsrq pinsrw vpinsrw pmaddubsw
syn keyword	fasmSSEInstruction	vpmaddubsw pmaddwd vpmaddwd pmaxsb
syn keyword	fasmSSEInstruction	vpmaxsb pmaxsd vpmaxsd pmaxsw vpmaxsw
syn keyword	fasmSSEInstruction	pmaxub vpmaxub pmaxud vpmaxud pmaxuw
syn keyword	fasmSSEInstruction	vpmaxuw pminsb vpminsb pminsd vpminsd
syn keyword	fasmSSEInstruction	pminub vpminub pminud vpminud pminuw
syn keyword	fasmSSEInstruction	vpminuw pmovmskb vpmovmskb pmovsxbd
syn keyword	fasmSSEInstruction	vpmovsxbd pmovsxbq vpmovsxbw pmovsxdq
syn keyword	fasmSSEInstruction	vpmovsxdq pmovsxwd vpmovsxwd pmovsxwq
syn keyword	fasmSSEInstruction	vpmovsxwqp pmovzxbd pmovzxwq vpmovzxwq
syn keyword	fasmSSEInstruction	vpmovzxbd pmovzxbq vpmovzxbw pmovzxdq
syn keyword	fasmSSEInstruction	vpmovzxdq pmovzxwd vpmovzxwd pmuldq
syn keyword	fasmSSEInstruction	vpmuldq pmulhrsw vpmulhsrw pmulhuw
syn keyword	fasmSSEInstruction	vpmulhuw pmulhw vpmulhw pmulld vpmulld
syn keyword	fasmSSEInstruction	pmullw vpmullw pmuludq vpmuludq por
syn keyword	fasmSSEInstruction	vpor psadbw vpsadbw pshufb vpshufb
syn keyword	fasmSSEInstruction	pshufd vpshufd pshufhw vpshufhw pshuflw
syn keyword	fasmSSEInstruction	vpshuflw psignb vpsignb psignd vpsignd
syn keyword	fasmSSEInstruction	psignw vpsignw pslld vpslld pslldq
syn keyword	fasmSSEInstruction	vpslldq psllq vpsllq psllw vpsllw
syn keyword	fasmSSEInstruction	psrad vpsrad psraw vpsraw psrld vpsrld
syn keyword	fasmSSEInstruction	psrldq vpsrldq psrlq vpsrlq psrlw
syn keyword	fasmSSEInstruction	vpsrlw psubb vpsubb psubd vpsubd psubq
syn keyword	fasmSSEInstruction	vpsubq psubsb vpsubsb psubsw vpsubsw
syn keyword	fasmSSEInstruction	psubusb vpsubusb psubw vpsubw ptest
syn keyword	fasmSSEInstruction	vptest punpckhbw vpunpckhbw punpckhdq
syn keyword	fasmSSEInstruction	vpunpckhdq punpckhqdq vpunpckhqdq
syn keyword	fasmSSEInstruction	punpckhwd vpunpckhwd punpcklbw
syn keyword	fasmSSEInstruction	vpunpcklbw punpckldq vpunpckldq
syn keyword	fasmSSEInstruction	punpcklqdq vpunpcklqdq punpcklwd
syn keyword	fasmSSEInstruction	vpunpcklwd pxor vpxor rcpps vrcpps
syn keyword	fasmSSEInstruction	rcpps vrcpps rcpss vrcpss roundpd
syn keyword	fasmSSEInstruction	vroundpd roundps vroundps roundsd
syn keyword	fasmSSEInstruction	vroundsd roundss vroundss rsqrtps
syn keyword	fasmSSEInstruction	vrsqrtps rsqrtss vrsqrtss sha1rnds4
syn keyword	fasmSSEInstruction	sha1nexte sha1msg1 sha1msg2 sha256msg1
syn keyword	fasmSSEInstruction	sha256msg2 shufpd vshufpd shufps
syn keyword	fasmSSEInstruction	vshufps sqrtpd vsqrtps sqrtsd vsqrtsd
syn keyword	fasmSSEInstruction	sqrtss vsqrtss stmxcsr vstmxcsr subpd
syn keyword	fasmSSEInstruction	vsubpd subps vsubps subsd vsubsd subss
syn keyword	fasmSSEInstruction	vsubss ucomisd vucomisd ucomiss
syn keyword	fasmSSEInstruction	vucomiss unpckhpd vunpckhpd unpckhps
syn keyword	fasmSSEInstruction	vunpckhps unpcklpd vunpcklpd unpcklps
syn keyword	fasmSSEInstruction	vunpcklps vbroadcastf128 vbroadcasti128
syn keyword	fasmSSEInstruction	vbroadcastsd vbroadcastss vcvtph2ps
syn keyword	fasmSSEInstruction	vcvtps2ph vextractf128 vextracti128
syn keyword	fasmSSEInstruction	vfmaddpd vfmadd132pd vfmadd213pd
syn keyword	fasmSSEInstruction	vfmadd231pd vfmaddps vfmadd132ps
syn keyword	fasmSSEInstruction	vfmadd213ps vfmadd231ps vfmaddsd
syn keyword	fasmSSEInstruction	vfmadd132sd vfmadd213sd vfmadd231sd
syn keyword	fasmSSEInstruction	vfmaddss vfmadd132ss vfmadd213ss
syn keyword	fasmSSEInstruction	vfmadd231ss vfmaddsubpd vfmaddsub132pd
syn keyword	fasmSSEInstruction	vfmaddsub213pd vfmaddsub231pd
syn keyword	fasmSSEInstruction	vfmaddsubps vfmaddsub132ps
syn keyword	fasmSSEInstruction	vfmaddsub231ps vfmaddsub213ps
syn keyword	fasmSSEInstruction	vfmsubaddpd vfmsubadd132pd
syn keyword	fasmSSEInstruction	vfmsubadd231pd vfmsubadd213pd
syn keyword	fasmSSEInstruction	vfmsubaddps vfmsubadd132ps
syn keyword	fasmSSEInstruction	vfmsubadd231ps vfmsubadd213ps
syn keyword	fasmSSEInstruction	vfmsubpd vfmsub132pd vfmsub213pd
syn keyword	fasmSSEInstruction	vfmsubps vfmsub132ps vfmsub213ps
syn keyword	fasmSSEInstruction	vfmsub231ps vfmsub231pd
syn keyword	fasmSSEInstruction	vfmsubsd vfmsub132sd vfmsub213sd
syn keyword	fasmSSEInstruction	vfmsubss vfmsub132ss vfmsub213ss
syn keyword	fasmSSEInstruction	vfmsub231ss vfmsub231sd
syn keyword	fasmSSEInstruction	vfnaddpd vfnadd132pd vfnadd213pd
syn keyword	fasmSSEInstruction	vfnadd231ss vfnadd231sd vfnadd231pd
syn keyword	fasmSSEInstruction	vfnaddps vfnadd132ps vfnadd213ps
syn keyword	fasmSSEInstruction	vfnaddsd vfnadd132sd vfnadd213sd
syn keyword	fasmSSEInstruction	vfnaddss vfnadd132ss vfnadd213ss
syn keyword	fasmSSEInstruction	vfnsubpd vfnsub132pd vfnsub213pd
syn keyword	fasmSSEInstruction	vfnsubps vfnsub132ps vfnsub213ps
syn keyword	fasmSSEInstruction	vfnsub231ps vfnsub231pd vfnadd231ps
syn keyword	fasmSSEInstruction	vfnsubsd vfnsub132sd vfnsub213sd
syn keyword	fasmSSEInstruction	vfnsub231sd vfnsub231ss vfnsub213ss
syn keyword	fasmSSEInstruction	vfnsubss vfnsub132ss
syn keyword	fasmSSEInstruction	vfrczpd vfrczps vfrczsd vfrczss
syn keyword	fasmSSEInstruction	vgatherdpd vgatherdps vgatherqpd
syn keyword	fasmSSEInstruction	vgatherqps vinsertf128 vinserti128
syn keyword	fasmSSEInstruction	vmaskmovpd vmaskmovps vpblendd
syn keyword	fasmSSEInstruction	vpbroadcastb vpbroadcastd vpbroadcastq
syn keyword	fasmSSEInstruction	vpbroadcastw vpcmov vpcomb vpcomd
syn keyword	fasmSSEInstruction	vpcomq vpcomub vpcomud vpcomuw vpcomw
syn keyword	fasmSSEInstruction	vperm2f128 vperm2i128 vpermd vpermil2pd
syn keyword	fasmSSEInstruction	vpermil2ps vpermilpd vpermilps vpermpd
syn keyword	fasmSSEInstruction	vpermps vpermq vpgatherdd vpgatherdq
syn keyword	fasmSSEInstruction	vpgatherqd vpgatherqq vphaddbd vphaddbq
syn keyword	fasmSSEInstruction	vphaddbw vphadddq vphaddubd vphaddubq
syn keyword	fasmSSEInstruction	vphaddubw vphaddudq vphadduwd vphadduwq
syn keyword	fasmSSEInstruction	vphadd vphsubbw vphsubdq vphsubwd
syn keyword	fasmSSEInstruction	vpmacsdd vpmacsdqh vpmacsdql vpmacssdd
syn keyword	fasmSSEInstruction	vpmacssdqh vpmacssdql vpmacsswd
syn keyword	fasmSSEInstruction	vpmacssww vpmadcsswd vpmadcswd
syn keyword	fasmSSEInstruction	vpmaskmovd vpmaskmovq vpperm vprotb
syn keyword	fasmSSEInstruction	vprotd vprotq vprotw vpshab vpshad
syn keyword	fasmSSEInstruction	vpshaq vpshaw vpshlb vpshld vpshlq
syn keyword	fasmSSEInstruction	vpshlw vpsllvd vpsllvq vpsravd
syn keyword	fasmSSEInstruction	vpsrlvd vpsrlvq vtestpd vtestps
syn keyword	fasmSSEInstruction	vzeroall vzeroupper xgetbv xorpd
syn keyword	fasmSSEInstruction	vxorpd xorps vxorps xrstor xrstors
syn keyword	fasmSSEInstruction	xsave xsavec xsaveopt xsaves xsetbv

syn keyword	fasmMediaInstruction	cvtpd2pi cvtpi2pd cvtpi2ps cvtps2pi
syn keyword	fasmMediaInstruction	cvttpd2pi cvttps2pi emms femms frstor
syn keyword	fasmMediaInstruction	fsave fnsave fxrstor fxsave maskmovq
syn keyword	fasmMediaInstruction	movd movdq2q movntq movq movq2dq
syn keyword	fasmMediaInstruction	packssdq packsswb packuswb paddb
syn keyword	fasmMediaInstruction	paddd paddq paddsb paddsw paddusb
syn keyword	fasmMediaInstruction	paddusw paddw pand pandn pavgb pavgw
syn keyword	fasmMediaInstruction	pcmpeqb pcmpeqd pcmpeqw pcmpgtb
syn keyword	fasmMediaInstruction	pcmpgtd pcmpgtw pextrw pf2id pf2iw
syn keyword	fasmMediaInstruction	pfacc pfadd pfcmpeq pfcmpge pfcmpgt
syn keyword	fasmMediaInstruction	pfmax pfmin pfmul pfnacc pfpnacc pfrcp
syn keyword	fasmMediaInstruction	pfrcpit2 pfrcpit2 pfrsqit1 pfrsqrt
syn keyword	fasmMediaInstruction	pfsub pfsubr pi2fd pi2fw pinsrw
syn keyword	fasmMediaInstruction	pmaddwd pmaxsw pmaxub pminsw pminub
syn keyword	fasmMediaInstruction	pmovmskb pmulhrw pmulhuw pmulhw pmullw
syn keyword	fasmMediaInstruction	pmuludq por psadbw pshufw pslld psllq
syn keyword	fasmMediaInstruction	psllw psrad psraw psrld psrlq psrlw
syn keyword	fasmMediaInstruction	psubb psubd psubq psubsb psubsw psubusb
syn keyword	fasmMediaInstruction	psubusw psubw pswapd punpckhbw
syn keyword	fasmMediaInstruction	punpckhdq punpckhwd punpcklbw punpckldq
syn keyword	fasmMediaInstruction	punpcklwd pxor

syn keyword	fasmX87Instruction	f2xm1 fabs fadd faddp fiadd fbld fbstp
syn keyword	fasmX87Instruction	fchs fclex fnclex fcmovb fcmovnb
syn keyword	fasmX87Instruction	fcmovbe fcmovnbe fcmove fcmovne fcmovu
syn keyword	fasmX87Instruction	fcmovnu fcom fcomp fcompp fcomi fcomip
syn keyword	fasmX87Instruction	fcos fdecstp fdiv fdivp fidiv fdivr
syn keyword	fasmX87Instruction	fdivrp fidivr ffree ficom ficomp fild
syn keyword	fasmX87Instruction	fincstp finit fninit fist fistp fisttp
syn keyword	fasmX87Instruction	fld fld1 fldcw fldenv fldl2e fldl2t
syn keyword	fasmX87Instruction	fldlg2 fldln2 fldpi fldz fmul fmulp
syn keyword	fasmX87Instruction	fimul fnop fpatan fprem fprem1 fptan
syn keyword	fasmX87Instruction	frndint frstor fsave fnsave fscale
syn keyword	fasmX87Instruction	fsin fsincos fsqrt fst fstp fstcw
syn keyword	fasmX87Instruction	fnstcw fstenv fnstenv fstsw fnstenv
syn keyword	fasmX87Instruction	fstsw fnstsw fsub fsubp fisub fsubr
syn keyword	fasmX87Instruction	fsubrp fisubr ftst fucom fucomp fucompp
syn keyword	fasmX87Instruction	fucomi fucomip fwait wait fxam fxch
syn keyword	fasmX87Instruction	fxtract fyl2x fyl2xp1

syn keyword	fasmRegister		al bl cl dl sil dil spl bpl r8b r9b
syn keyword	fasmRegister		r10b r11b r12b r13b r14b r15b ah bh ch
syn keyword	fasmRegister		dh ax bx cx dx si di sp bp r8w r9w r10w
syn keyword	fasmRegister		r11w r12w r13w r14w r15w eax ebx ecx
syn keyword	fasmRegister		edx esi edi esp ebp r8d r9d r10d r11d
syn keyword	fasmRegister		r12d r13d r14d r15d rax rbx rcx rdx
syn keyword	fasmRegister		rsi rdi rsp rbp r8 r9 r10 r11 r12 r13
syn keyword	fasmRegister		r14 r15 ip eip rip cs ds ss es fs gs
syn keyword	fasmRegister		cr0 rflags cr2 cr3 cr4 cr8 cr1 cr5
syn keyword	fasmRegister		cr6 cr7 cr9 cr10 cr11 cr12 cr13 cr14
syn keyword	fasmRegister		cr15 dr0 dr1 dr2 dr3 dr6 dr7 tr3 tr4
syn keyword	fasmRegister		tr5 tr6 tr7 gdtr ldtr tr idtr
syn match	fasmX87Register		/\<[sS][tT]([0-7])\>/
syn match	fasmMediaRegister	/[mM][mM][0-7]/
syn match	fasmSSERegister		/[xX][mM][mM][0-7]/
syn match	fasmSSERegister		/[yY][mM][mM][0-7]/

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

syn keyword	fasmFormatting		use16 use32 use64 mz segment entry
syn keyword	fasmFormatting		stack heap pe pe64 console gui native
syn keyword	fasmFormatting		efi efiboot efiruntime dll wdm large
syn keyword	fasmFormatting		nx on section code data readable
syn keyword	fasmFormatting		writeable executable shareable
syn keyword	fasmFormatting		discardable notpageable export import
syn keyword	fasmFormatting		resource fixups rva coff ms ms64
syn keyword	fasmFormatting		linkremove linkinfo align extrn public
syn keyword	fasmFormatting		static elf elf64 plt dynamic
syn keyword	fasmFormatting		interpreter note gnuehframe gnustack
syn keyword	fasmFormatting		gnurelro

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
syn region	fasmCALM		start=/calminstruction/ end=/end calminstruction/ contains=ALLBUT,fasmClashingDirective

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
hi def link	fasmFormatting		Special
hi def link	fasmClashingDirective	Special
hi def link	fasmCalminstruction	Keyword
hi def link	fasmInstruction		Keyword
hi def link	fasmSystemInstruction	Keyword
hi def link	fasmMediaInstruction	Identifier
hi def link	fasmSSEInstruction	Identifier
hi def link	fasmX86Instruction	Identifier
hi def link	fasmInstructionModifier	Special
hi def link	fasmOperator		Keyword
hi def link	fasmComment		Comment

hi def link	fasmRegister		Type
hi def link	fasmX87Register		Type
hi def link	fasmSSERegister		Type

let b:current_syntax = "fasm"
