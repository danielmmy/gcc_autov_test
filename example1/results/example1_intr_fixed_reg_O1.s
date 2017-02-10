	.arch armv8-a
	.file	"example1_intr_fixed_reg.c"
	.text
	.align	2
	.global	perf_event_open
	.type	perf_event_open, %function
perf_event_open:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x5, x4
	mov	w4, w3
	mov	w3, w2
	mov	w2, w1
	mov	x1, x0
	mov	x0, 241
	bl	syscall
	ldp	x29, x30, [sp], 16
	ret
	.size	perf_event_open, .-perf_event_open
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -224]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	adrp	x0, __stack_chk_guard
	ldr	x1, [x0, #:lo12:__stack_chk_guard]
	str	x1, [x29, 216]
	mov	x1,0
	mov	x0, 1024
	bl	malloc
	mov	x23, x0
	mov	x0, 1024
	bl	malloc
	mov	x24, x0
	mov	x0, 1024
	bl	malloc
	mov	x25, x0
	mov	w0, 1
	bl	srand
	mov	x26, x24
	mov	x27, x25
	add	x28, x24, 64
	mov	w20, 26215
	movk	w20, 0x6666, lsl 16
	b	.L4
.L5:
	bl	rand
	smull	x1, w0, w20
	asr	x1, x1, 33
	sub	w1, w1, w0, asr 31
	add	w1, w1, w1, lsl 2
	sub	w1, w0, w1
	str	w1, [x22, x19]
	bl	rand
	smull	x1, w0, w20
	asr	x1, x1, 33
	sub	w1, w1, w0, asr 31
	add	w1, w1, w1, lsl 2
	sub	w1, w0, w1
	str	w1, [x21, x19]
	add	x19, x19, 4
	cmp	x19, 256
	bne	.L5
	add	x26, x26, 16
	add	x27, x27, 16
	cmp	x26, x28
	beq	.L6
.L4:
	mov	x22, x26
	mov	x21, x27
	mov	x19, 0
	b	.L5
.L6:
	stp	xzr, xzr, [x29, 96]
	stp	xzr, xzr, [x29, 112]
	stp	xzr, xzr, [x29, 128]
	stp	xzr, xzr, [x29, 144]
	stp	xzr, xzr, [x29, 160]
	stp	xzr, xzr, [x29, 176]
	mov	w0, 96
	str	w0, [x29, 100]
	mov	x0, 3
	str	x0, [x29, 128]
	mov	x0, 1
	str	x0, [x29, 104]
	ldrb	w0, [x29, 136]
	orr	w0, w0, 1
	orr	w0, w0, 96
	strb	w0, [x29, 136]
	mov	x4, 0
	mov	w3, -1
	mov	w2, w3
	mov	w1, 0
	add	x0, x29, 96
	bl	perf_event_open
	mov	x19, x0
	cmn	w0, #1
	bne	.L7
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	mov	w0, 1
	bl	__printf_chk
	mov	w0, 0
	bl	exit
.L7:
	mov	w2, 0
	mov	x1, 9219
	bl	ioctl
	mov	w2, 0
	mov	x1, 9216
	mov	w0, w19
	bl	ioctl
	mov	x0, 0
.L8:
	ldr	q0, [x24, x0]
	ldr	q1, [x25, x0]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x23, x0]
	add	x0, x0, 16
	cmp	x0, 1024
	bne	.L8
	mov	w2, 0
	mov	x1, 9217
	mov	w0, w19
	bl	ioctl
	mov	x2, 24
	add	x1, x29, 192
	mov	w0, w19
	bl	read
	mov	x24, x23
	add	x23, x23, 64
	adrp	x21, .LC1
	add	x21, x21, :lo12:.LC1
	mov	w22, 1
	b	.L9
.L10:
	ldr	w2, [x19], 4
	mov	x1, x21
	mov	w0, w22
	bl	__printf_chk
	cmp	x19, x20
	bne	.L10
	add	x24, x24, 16
	cmp	x23, x24
	beq	.L11
.L9:
	add	x20, x24, 256
	mov	x19, x24
	b	.L10
.L11:
	mov	w0, 10
	bl	putchar
	ldr	x4, [x29, 208]
	ldr	x3, [x29, 200]
	ldr	x2, [x29, 192]
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	mov	w0, 1
	bl	__printf_chk
	ldr	x0, [x29, 192]
	ucvtf	s0, x0
	ldr	x0, [x29, 200]
	ucvtf	s1, x0
	fmul	s0, s0, s1
	ldr	x0, [x29, 208]
	ucvtf	s1, x0
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	w0, 1
	bl	__printf_chk
	mov	w0, 0
	adrp	x1, __stack_chk_guard
	ldr	x2, [x29, 216]
	ldr	x1, [x1, #:lo12:__stack_chk_guard]
	eor	x1, x2, x1
	cbz	x1, .L12
	bl	__stack_chk_fail
.L12:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 224
	ret
	.size	main, .-main
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"cannot open perf_counter for instructions"
	.zero	6
.LC1:
	.string	"%i|"
	.zero	4
.LC2:
	.string	"count:%llu\nenabled:%llu\nrunning:%llu\n"
	.zero	2
.LC3:
	.string	"Instructions = %llu\n"
	.ident	"GCC: (Ubuntu/Linaro 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
