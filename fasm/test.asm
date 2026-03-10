format elf64 executable
entry _start

; define a string in memory
macro strdef name*, dat&
	label name
	dd @f-$-4
	db dat
@@:
end macro

segment readable executable

_start:
	; print(msg)
	mov rsi, msg
	lodsd
	xchg eax, edx
	xor eax, eax
	inc eax
	mov edi, eax
	syscall

	xor eax, eax
	xor edi, edi
	mov al, 0x3C
	syscall

strdef msg, "Hello World!", 0x0A
