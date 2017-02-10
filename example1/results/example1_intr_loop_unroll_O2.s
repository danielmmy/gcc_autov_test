	.arch armv8-a
	.file	"example1_intr_loop_unroll.c"
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
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x23, x24, [sp, 48]
	adrp	x23, __stack_chk_guard
	add	x1, x23, :lo12:__stack_chk_guard
	stp	x19, x20, [sp, 16]
	ldr	x2, [x1]
	str	x2, [x29, 3272]
	mov	x2,0
	mov	w19, 26215
	stp	x21, x22, [sp, 32]
	movk	w19, 0x6666, lsl 16
	mov	x22, 0
	bl	time
	bl	srand
.L3:
	add	x0, x29, 1216
	mov	x24, 0
	add	x21, x0, x22
	add	x0, x29, 2240
	add	x20, x0, x22
	.p2align 2
.L4:
	bl	rand
	smull	x1, w0, w19
	asr	x1, x1, 33
	sub	w1, w1, w0, asr 31
	add	w1, w1, w1, lsl 2
	sub	w1, w0, w1
	str	w1, [x21, x24]
	bl	rand
	smull	x1, w0, w19
	asr	x1, x1, 33
	sub	w1, w1, w0, asr 31
	add	w1, w1, w1, lsl 2
	sub	w1, w0, w1
	str	w1, [x20, x24]
	add	x24, x24, 4
	cmp	x24, 256
	bne	.L4
	add	x22, x22, 16
	cmp	x22, 64
	bne	.L3
	add	x0, x29, 104
	add	x1, x29, 72
	add	x6, x29, 88
	mov	w5, 96
	mov	w4, -1
	mov	x2, 3
	stp	xzr, xzr, [x0]
	mov	w3, w4
	mov	x20, 1
	ldrb	w0, [x29, 112]
	stp	xzr, xzr, [x1]
	stp	xzr, xzr, [x6]
	add	x6, x29, 120
	orr	w0, w0, 1
	str	w5, [x29, 76]
	orr	w0, w0, w5
	str	x2, [x29, 104]
	stp	xzr, xzr, [x6]
	add	x6, x29, 136
	strb	w0, [x29, 112]
	mov	x5, 0
	mov	x0, 241
	mov	w2, 0
	stp	xzr, xzr, [x6]
	add	x6, x29, 152
	str	x20, [x29, 80]
	stp	xzr, xzr, [x6]
	bl	syscall
	cmn	w0, #1
	mov	x19, x0
	beq	.L17
	mov	w2, 0
	mov	x1, 9219
	add	x20, x29, 192
	bl	ioctl
	mov	w0, w19
	mov	w2, 0
	mov	x1, 9216
	bl	ioctl
	add	x1, x29, 2240
	add	x0, x29, 1216
	mov	x3, x1
	add	x2, x29, 192
.L7:
	ldr	q18, [x0]
	add	x0, x0, 256
	ldr	q17, [x0, -240]
	add	x2, x2, 256
	ldr	q16, [x0, -224]
	add	x1, x1, 256
	ldr	q7, [x0, -208]
	ldr	q6, [x0, -192]
	ldr	q5, [x0, -176]
	ldr	q4, [x0, -160]
	ldr	q3, [x0, -144]
	ldr	q2, [x0, -128]
	ldr	q1, [x0, -112]
	ldr	q29, [x1, -256]
	ldr	q28, [x1, -240]
	ldr	q27, [x1, -224]
	ldr	q26, [x1, -208]
	ldr	q25, [x1, -192]
	ldr	q24, [x1, -176]
	ldr	q23, [x1, -160]
	ldr	q22, [x1, -144]
	ldr	q21, [x1, -128]
	ldr	q20, [x1, -112]
	ldr	q0, [x0, -96]
	cmp	x3, x0
	ldr	q19, [x1, -96]
	add	v17.4s, v17.4s, v28.4s
	add	v16.4s, v16.4s, v27.4s
	add	v7.4s, v7.4s, v26.4s
	add	v6.4s, v6.4s, v25.4s
	add	v5.4s, v5.4s, v24.4s
	add	v4.4s, v4.4s, v23.4s
	str	q17, [x2, -240]
	add	v3.4s, v3.4s, v22.4s
	str	q16, [x2, -224]
	add	v2.4s, v2.4s, v21.4s
	str	q7, [x2, -208]
	add	v1.4s, v1.4s, v20.4s
	str	q6, [x2, -192]
	add	v18.4s, v18.4s, v29.4s
	str	q5, [x2, -176]
	add	v0.4s, v0.4s, v19.4s
	str	q4, [x2, -160]
	str	q3, [x2, -144]
	str	q2, [x2, -128]
	str	q1, [x2, -112]
	str	q18, [x2, -256]
	str	q0, [x2, -96]
	ldr	q17, [x1, -80]
	ldr	q16, [x1, -64]
	ldr	q7, [x1, -48]
	ldr	q6, [x1, -32]
	ldr	q5, [x1, -16]
	ldr	q4, [x0, -80]
	ldr	q3, [x0, -64]
	ldr	q2, [x0, -48]
	ldr	q1, [x0, -32]
	ldr	q0, [x0, -16]
	add	v4.4s, v4.4s, v17.4s
	add	v3.4s, v3.4s, v16.4s
	add	v2.4s, v2.4s, v7.4s
	add	v1.4s, v1.4s, v6.4s
	add	v0.4s, v0.4s, v5.4s
	str	q4, [x2, -80]
	str	q3, [x2, -64]
	str	q2, [x2, -48]
	str	q1, [x2, -32]
	str	q0, [x2, -16]
	bne	.L7
	mov	w0, w19
	mov	w2, 0
	mov	x1, 9217
	adrp	x21, .LC1
	add	x22, x29, 256
	add	x21, x21, :lo12:.LC1
	bl	ioctl
	add	x1, x29, 168
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
	add	x23, x23, :lo12:__stack_chk_guard
	bl	putchar
	ldp	x2, x3, [x29, 168]
	adrp	x1, .LC2
	ldr	x4, [x29, 184]
	add	x1, x1, :lo12:.LC2
	mov	w0, 1
	bl	__printf_chk
	ldp	x0, x3, [x29, 168]
	adrp	x1, .LC3
	ucvtf	s0, x0
	ldr	x2, [x29, 184]
	ucvtf	s2, x3
	add	x1, x1, :lo12:.LC3
	ucvtf	s1, x2
	mov	w0, 1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	bl	__printf_chk
	ldr	x0, [x29, 3272]
	ldr	x1, [x23]
	eor	x1, x0, x1
	mov	w0, 0
	cbnz	x1, .L18
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
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
