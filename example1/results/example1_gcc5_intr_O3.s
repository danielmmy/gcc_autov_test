	.arch armv8-a
	.file	"example1_intr.c"
	.text
	.align	2
	.p2align 3,,7
	.global	perf_event_open
	.type	perf_event_open, %function
perf_event_open:
	mov	x5, x4
	mov	w4, w3
	mov	w3, w2
	mov	w2, w1
	mov	x1, x0
	mov	x0, 241
	b	syscall
	.size	perf_event_open, .-perf_event_open
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 3,,7
	.global	main
	.type	main, %function
main:
	sub	sp, sp, #3216
	mov	x0, 0
	stp	x29, x30, [sp, -80]!
	add	x29, sp, 0
	stp	x25, x26, [sp, 64]
	adrp	x25, __stack_chk_guard
	add	x1, x25, :lo12:__stack_chk_guard
	stp	x23, x24, [sp, 48]
	stp	x19, x20, [sp, 16]
	ldr	x2, [x1]
	str	x2, [x29, 3288]
	mov	x2,0
	stp	x21, x22, [sp, 32]
	mov	w19, 26215
	add	x22, x29, 1232
	add	x23, x29, 2256
	mov	x24, 0
	movk	w19, 0x6666, lsl 16
	bl	time
	bl	srand
.L3:
	add	x21, x22, x24
	add	x20, x23, x24
	mov	x26, 0
	.p2align 2
.L4:
	bl	rand
	smull	x1, w0, w19
	asr	x1, x1, 33
	sub	w1, w1, w0, asr 31
	add	w1, w1, w1, lsl 2
	sub	w1, w0, w1
	str	w1, [x21, x26]
	bl	rand
	smull	x1, w0, w19
	asr	x1, x1, 33
	sub	w1, w1, w0, asr 31
	add	w1, w1, w1, lsl 2
	sub	w1, w0, w1
	str	w1, [x20, x26]
	add	x26, x26, 4
	cmp	x26, 256
	bne	.L4
	add	x24, x24, 16
	cmp	x24, 64
	bne	.L3
	add	x0, x29, 120
	add	x1, x29, 88
	add	x6, x29, 104
	mov	w5, 96
	mov	w4, -1
	mov	x2, 3
	stp	xzr, xzr, [x0]
	mov	w3, w4
	mov	x20, 1
	ldrb	w0, [x29, 128]
	stp	xzr, xzr, [x1]
	stp	xzr, xzr, [x6]
	add	x6, x29, 136
	orr	w0, w0, 1
	str	w5, [x29, 92]
	orr	w0, w0, w5
	str	x2, [x29, 120]
	stp	xzr, xzr, [x6]
	add	x6, x29, 152
	strb	w0, [x29, 128]
	mov	x5, 0
	mov	x0, 241
	mov	w2, 0
	stp	xzr, xzr, [x6]
	add	x6, x29, 168
	str	x20, [x29, 96]
	stp	xzr, xzr, [x6]
	bl	syscall
	cmn	w0, #1
	mov	x19, x0
	beq	.L17
	mov	w2, 0
	mov	x1, 9219
	add	x20, x29, 208
	bl	ioctl
	mov	w0, w19
	mov	w2, 0
	mov	x1, 9216
	bl	ioctl
	mov	x0, 0
	.p2align 2
.L7:
	ldr	q0, [x22, x0]
	ldr	q1, [x23, x0]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x20, x0]
	add	x0, x0, 16
	cmp	x0, 1024
	bne	.L7
	mov	w0, w19
	mov	w2, 0
	mov	x1, 9217
	adrp	x21, .LC1
	add	x22, x20, 64
	add	x21, x21, :lo12:.LC1
	bl	ioctl
	add	x1, x29, 184
	mov	w0, w19
	mov	x2, 24
	bl	read
.L8:
	mov	x19, 0
	.p2align 2
.L9:
	ldr	w2, [x20, x19]
	mov	x1, x21
	mov	w0, 1
	add	x19, x19, 4
	bl	__printf_chk
	cmp	x19, 256
	bne	.L9
	add	x20, x20, 16
	cmp	x22, x20
	bne	.L8
	mov	w0, 10
	add	x25, x25, :lo12:__stack_chk_guard
	bl	putchar
	ldp	x2, x3, [x29, 184]
	adrp	x1, .LC2
	ldr	x4, [x29, 200]
	add	x1, x1, :lo12:.LC2
	mov	w0, 1
	bl	__printf_chk
	ldp	x0, x3, [x29, 184]
	adrp	x1, .LC3
	ucvtf	s0, x0
	ldr	x2, [x29, 200]
	ucvtf	s2, x3
	add	x1, x1, :lo12:.LC3
	ucvtf	s1, x2
	mov	w0, 1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	bl	__printf_chk
	ldr	x0, [x29, 3288]
	ldr	x1, [x25]
	eor	x1, x0, x1
	mov	w0, 0
	cbnz	x1, .L18
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	add	sp, sp, 3216
	ret
.L17:
	adrp	x1, .LC0
	mov	w0, w20
	add	x1, x1, :lo12:.LC0
	bl	__printf_chk
	mov	w0, 0
	bl	exit
.L18:
	bl	__stack_chk_fail
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
