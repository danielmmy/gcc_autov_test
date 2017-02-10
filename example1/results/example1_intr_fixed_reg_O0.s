	.arch armv8-a
	.file	"example1_intr_fixed_reg.c"
	.text
	.align	2
	.global	perf_event_open
	.type	perf_event_open, %function
perf_event_open:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x0, [x29, 40]
	str	w1, [x29, 36]
	str	w2, [x29, 32]
	str	w3, [x29, 28]
	str	x4, [x29, 16]
	ldr	x5, [x29, 16]
	ldr	w4, [x29, 28]
	ldr	w3, [x29, 32]
	ldr	w2, [x29, 36]
	ldr	x1, [x29, 40]
	mov	x0, 241
	bl	syscall
	ldp	x29, x30, [sp], 48
	ret
	.size	perf_event_open, .-perf_event_open
	.section	.rodata
	.align	3
.LC0:
	.string	"count:%llu\nenabled:%llu\nrunning:%llu\n"
	.text
	.align	2
	.type	perf_count, %function
perf_count:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x0, [x29, 24]
	ldr	x0, [x29, 24]
	ldr	x1, [x0]
	ldr	x0, [x29, 24]
	add	x0, x0, 8
	ldr	x2, [x0]
	ldr	x0, [x29, 24]
	add	x0, x0, 16
	ldr	x3, [x0]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	ldr	x0, [x29, 24]
	ldr	x0, [x0]
	ucvtf	s1, x0
	ldr	x0, [x29, 24]
	add	x0, x0, 8
	ldr	x0, [x0]
	ucvtf	s0, x0
	fmul	s1, s1, s0
	ldr	x0, [x29, 24]
	add	x0, x0, 16
	ldr	x0, [x0]
	ucvtf	s0, x0
	fdiv	s0, s1, s0
	fcvtzu	x0, s0
	ldp	x29, x30, [sp], 32
	ret
	.size	perf_count, .-perf_count
	.section	.rodata
	.align	3
.LC1:
	.string	"cannot open perf_counter for instructions"
	.align	3
.LC2:
	.string	"%i|"
	.align	3
.LC3:
	.string	"Instructions = %llu\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -208]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	adrp	x0, __stack_chk_guard
	add	x0, x0, :lo12:__stack_chk_guard
	ldr	x1, [x0]
	str	x1, [x29, 200]
	mov	x1,0
	mov	x0, 1024
	bl	malloc
	mov	x20, x0
	mov	x0, 1024
	bl	malloc
	mov	x21, x0
	mov	x0, 1024
	bl	malloc
	mov	x22, x0
	mov	w0, 1
	bl	srand
	mov	w19, 0
	b	.L6
.L9:
	str	wzr, [x29, 72]
	b	.L7
.L8:
	sxtw	x0, w19
	lsl	x0, x0, 4
	add	x23, x21, x0
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 1
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	sub	w1, w2, w0
	ldrsw	x0, [x29, 72]
	str	w1, [x23, x0, lsl 2]
	sxtw	x0, w19
	lsl	x0, x0, 4
	add	x23, x22, x0
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 1
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	sub	w1, w2, w0
	ldrsw	x0, [x29, 72]
	str	w1, [x23, x0, lsl 2]
	ldr	w0, [x29, 72]
	add	w0, w0, 1
	str	w0, [x29, 72]
.L7:
	ldr	w0, [x29, 72]
	cmp	w0, 63
	ble	.L8
	add	w19, w19, 1
.L6:
	cmp	w19, 3
	ble	.L9
	add	x0, x29, 80
	mov	x2, 96
	mov	w1, 0
	bl	memset
	str	wzr, [x29, 80]
	mov	w0, 96
	str	w0, [x29, 84]
	mov	x0, 3
	str	x0, [x29, 112]
	mov	x0, 1
	str	x0, [x29, 88]
	ldrb	w0, [x29, 120]
	orr	w0, w0, 1
	strb	w0, [x29, 120]
	ldrb	w0, [x29, 120]
	orr	w0, w0, 32
	strb	w0, [x29, 120]
	ldrb	w0, [x29, 120]
	orr	w0, w0, 64
	strb	w0, [x29, 120]
	add	x0, x29, 80
	mov	x4, 0
	mov	w3, -1
	mov	w2, -1
	mov	w1, 0
	bl	perf_event_open
	str	w0, [x29, 76]
	ldr	w0, [x29, 76]
	cmn	w0, #1
	bne	.L10
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	mov	w0, 0
	bl	exit
.L10:
	mov	w2, 0
	mov	x1, 9219
	ldr	w0, [x29, 76]
	bl	ioctl
	mov	w2, 0
	mov	x1, 9216
	ldr	w0, [x29, 76]
	bl	ioctl
	mov	w19, 0
	b	.L11
.L12:
	sxtw	x0, w19
	lsl	x0, x0, 4
	add	x0, x20, x0
	sxtw	x1, w19
	lsl	x1, x1, 4
	add	x1, x21, x1
	ldr	q1, [x1]
	sxtw	x1, w19
	lsl	x1, x1, 4
	add	x1, x22, x1
	ldr	q0, [x1]
	add	v0.4s, v1.4s, v0.4s
	str	q0, [x0]
	add	w19, w19, 1
.L11:
	cmp	w19, 63
	ble	.L12
	mov	w2, 0
	mov	x1, 9217
	ldr	w0, [x29, 76]
	bl	ioctl
	add	x0, x29, 176
	mov	x2, 24
	mov	x1, x0
	ldr	w0, [x29, 76]
	bl	read
	mov	w19, 0
	b	.L13
.L16:
	str	wzr, [x29, 72]
	b	.L14
.L15:
	sxtw	x0, w19
	lsl	x0, x0, 4
	add	x0, x20, x0
	ldrsw	x1, [x29, 72]
	ldr	w1, [x0, x1, lsl 2]
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	ldr	w0, [x29, 72]
	add	w0, w0, 1
	str	w0, [x29, 72]
.L14:
	ldr	w0, [x29, 72]
	cmp	w0, 63
	ble	.L15
	add	w19, w19, 1
.L13:
	cmp	w19, 3
	ble	.L16
	mov	w0, 10
	bl	putchar
	add	x0, x29, 176
	bl	perf_count
	mov	x1, x0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	printf
	mov	w0, 0
	adrp	x1, __stack_chk_guard
	add	x1, x1, :lo12:__stack_chk_guard
	ldr	x2, [x29, 200]
	ldr	x1, [x1]
	eor	x1, x2, x1
	cmp	x1, 0
	beq	.L18
	bl	__stack_chk_fail
.L18:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 208
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
