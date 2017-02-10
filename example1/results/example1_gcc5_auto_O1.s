	.arch armv8-a
	.file	"example1_auto.c"
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
	sub	sp, sp, #3200
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	adrp	x0, __stack_chk_guard
	ldr	x1, [x0, #:lo12:__stack_chk_guard]
	str	x1, [x29, 3240]
	mov	x1,0
	mov	x0, 0
	bl	time
	bl	srand
	mov	x19, 0
	add	x22, x29, 1192
	mov	w20, 26215
	movk	w20, 0x6666, lsl 16
	add	x21, x29, 2216
.L4:
	bl	rand
	smull	x1, w0, w20
	asr	x1, x1, 33
	sub	w1, w1, w0, asr 31
	add	w1, w1, w1, lsl 2
	sub	w1, w0, w1
	str	w1, [x19, x22]
	bl	rand
	smull	x1, w0, w20
	asr	x1, x1, 33
	sub	w1, w1, w0, asr 31
	add	w1, w1, w1, lsl 2
	sub	w1, w0, w1
	str	w1, [x19, x21]
	add	x19, x19, 4
	cmp	x19, 1024
	bne	.L4
	stp	xzr, xzr, [x29, 48]
	stp	xzr, xzr, [x29, 64]
	stp	xzr, xzr, [x29, 80]
	stp	xzr, xzr, [x29, 96]
	stp	xzr, xzr, [x29, 112]
	stp	xzr, xzr, [x29, 128]
	mov	w0, 96
	str	w0, [x29, 52]
	mov	x0, 3
	str	x0, [x29, 80]
	mov	x0, 1
	str	x0, [x29, 56]
	ldrb	w0, [x29, 88]
	orr	w0, w0, 1
	orr	w0, w0, 96
	strb	w0, [x29, 88]
	mov	x4, 0
	mov	w3, -1
	mov	w2, w3
	mov	w1, 0
	add	x0, x29, 48
	bl	perf_event_open
	mov	x19, x0
	cmn	w0, #1
	bne	.L5
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	mov	w0, 1
	bl	__printf_chk
	mov	w0, 0
	bl	exit
.L5:
	mov	w2, 0
	mov	x1, 9219
	bl	ioctl
	mov	w2, 0
	mov	x1, 9216
	mov	w0, w19
	bl	ioctl
	mov	x0, 0
	add	x5, x29, 168
	add	x4, x29, 1192
	add	x3, x29, 2216
.L6:
	ldr	w2, [x0, x4]
	ldr	w1, [x0, x3]
	add	w1, w2, w1
	str	w1, [x0, x5]
	add	x0, x0, 4
	cmp	x0, 1024
	bne	.L6
	mov	w2, 0
	mov	x1, 9217
	mov	w0, w19
	bl	ioctl
	mov	x2, 24
	add	x1, x29, 144
	mov	w0, w19
	bl	read
	add	x19, x29, 168
	add	x22, x19, 1024
	adrp	x20, .LC1
	add	x20, x20, :lo12:.LC1
	mov	w21, 1
.L7:
	ldr	w2, [x19], 4
	mov	x1, x20
	mov	w0, w21
	bl	__printf_chk
	cmp	x22, x19
	bne	.L7
	mov	w0, 10
	bl	putchar
	ldr	x4, [x29, 160]
	ldr	x3, [x29, 152]
	ldr	x2, [x29, 144]
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	mov	w0, 1
	bl	__printf_chk
	ldr	x0, [x29, 144]
	ucvtf	s0, x0
	ldr	x0, [x29, 152]
	ucvtf	s1, x0
	fmul	s0, s0, s1
	ldr	x0, [x29, 160]
	ucvtf	s1, x0
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	w0, 1
	bl	__printf_chk
	mov	w0, 0
	adrp	x1, __stack_chk_guard
	ldr	x2, [x29, 3240]
	ldr	x1, [x1, #:lo12:__stack_chk_guard]
	eor	x1, x2, x1
	cbz	x1, .L8
	bl	__stack_chk_fail
.L8:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	add	sp, sp, 3200
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
