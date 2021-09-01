.386
.model flat, stdcall
.stack 4096
extrn MessageBoxA@16: PROC
; ExitProcess PROTO, dwExitCode:DWORD
extrn ExitProcess@4: PROC

.data
mytitle db 'Good First Step', 0
mymsg db 'Hello World!', 0

.code
main PROC
	push 0       ; uType = MB_OK
	push offset mytitle   ; LPCSTR lpCaption
	push offset mymsg   ; LPCSTR lpText
	push 0       ; hWnd = HWND_DESKTOP
	call MessageBoxA@16
	mov ebx, eax     ; uExitCode = MessageBox(...)
	push 0
	call ExitProcess@4

main ENDP

END main        ;specify the program's entry point