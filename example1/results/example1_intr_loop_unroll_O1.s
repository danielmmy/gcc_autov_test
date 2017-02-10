	.arch armv8-a
	.file	"example1_intr_loop_unroll.c"
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
	sub	sp, sp, #3216
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	adrp	x0, __stack_chk_guard
	ldr	x1, [x0, #:lo12:__stack_chk_guard]
	str	x1, [x29, 3272]
	mov	x1,0
	mov	x0, 0
	bl	time
	bl	srand
	mov	x23, 0
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
	add	x23, x23, 16
	cmp	x23, 64
	beq	.L6
.L4:
	mov	x19, 0
	add	x0, x29, 1216
	add	x22, x0, x23
	add	x0, x29, 2240
	add	x21, x0, x23
	b	.L5
.L6:
	add	x0, x29, 72
	stp	xzr, xzr, [x0]
	add	x0, x29, 88
	stp	xzr, xzr, [x0]
	add	x0, x29, 104
	stp	xzr, xzr, [x0]
	add	x0, x29, 120
	stp	xzr, xzr, [x0]
	add	x0, x29, 136
	stp	xzr, xzr, [x0]
	add	x0, x29, 152
	stp	xzr, xzr, [x0]
	mov	w0, 96
	str	w0, [x29, 76]
	mov	x0, 3
	str	x0, [x29, 104]
	mov	x0, 1
	str	x0, [x29, 80]
	ldrb	w0, [x29, 112]
	orr	w0, w0, 1
	orr	w0, w0, 96
	strb	w0, [x29, 112]
	mov	x4, 0
	mov	w3, -1
	mov	w2, w3
	mov	w1, 0
	add	x0, x29, 72
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
	add	x0, x29, 1216
	add	x2, x29, 2240
	add	x20, x29, 192
	add	x3, x0, 1024
	mov	x1, x20
.L8:
	ldr	q0, [x0]
	ldr	q1, [x2]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1]
	ldr	q0, [x0, 16]
	ldr	q1, [x2, 16]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 16]
	ldr	q0, [x0, 32]
	ldr	q1, [x2, 32]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 32]
	ldr	q0, [x0, 48]
	ldr	q1, [x2, 48]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 48]
	ldr	q0, [x0, 64]
	ldr	q1, [x2, 64]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 64]
	ldr	q0, [x0, 80]
	ldr	q1, [x2, 80]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 80]
	ldr	q0, [x0, 96]
	ldr	q1, [x2, 96]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 96]
	ldr	q0, [x0, 112]
	ldr	q1, [x2, 112]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 112]
	ldr	q0, [x0, 128]
	ldr	q1, [x2, 128]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 128]
	ldr	q0, [x0, 144]
	ldr	q1, [x2, 144]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 144]
	ldr	q0, [x0, 160]
	ldr	q1, [x2, 160]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 160]
	ldr	q0, [x0, 176]
	ldr	q1, [x2, 176]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 176]
	ldr	q0, [x0, 192]
	ldr	q1, [x2, 192]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 192]
	ldr	q0, [x0, 208]
	ldr	q1, [x2, 208]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 208]
	ldr	q0, [x0, 224]
	ldr	q1, [x2, 224]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 224]
	ldr	q0, [x0, 240]
	ldr	q1, [x2, 240]
	add	v0.4s, v0.4s, v1.4s
	str	q0, [x1, 240]
	add	x0, x0, 256
	add	x2, x2, 256
	add	x1, x1, 256
	cmp	x0, x3
	bne	.L8
	mov	w2, 0
	mov	x1, 9217
	mov	w0, w19
	bl	ioctl
	mov	x2, 24
	add	x1, x29, 168
	mov	w0, w19
	bl	read
	add	x23, x29, 256
	adrp	x21, .LC1
	add	x21, x21, :lo12:.LC1
	mov	w22, 1
	b	.L9
.L10:
	ldr	w2, [x20, x19]
	mov	x1, x21
	mov	w0, w22
	bl	__printf_chk
	add	x19, x19, 4
	cmp	x19, 256
	bne	.L10
	add	x20, x20, 16
	cmp	x23, x20
	beq	.L11
.L9:
	mov	x19, 0
	b	.L10
.L11:
	mov	w0, 10
	bl	putchar
	ldr	x4, [x29, 184]
	ldr	x3, [x29, 176]
	ldr	x2, [x29, 168]
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	mov	w0, 1
	bl	__printf_chk
	ldr	x0, [x29, 168]
	ucvtf	s0, x0
	ldr	x0, [x29, 176]
	ucvtf	s1, x0
	fmul	s0, s0, s1
	ldr	x0, [x29, 184]
	ucvtf	s1, x0
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	w0, 1
	bl	__printf_chk
	mov	w0, 0
	adrp	x1, __stack_chk_guard
	ldr	x2, [x29, 3272]
	ldr	x1, [x1, #:lo12:__stack_chk_guard]
	eor	x1, x2, x1
	cbz	x1, .L12
	bl	__stack_chk_fail
.L12:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 3216
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
