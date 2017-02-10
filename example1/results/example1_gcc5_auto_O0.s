	.arch armv8-a
	.file	"example1_auto.c"
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
	sub	sp, sp, #3216
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	adrp	x0, __stack_chk_guard
	add	x0, x0, :lo12:__stack_chk_guard
	ldr	x1, [x0]
	str	x1, [x29, 3224]
	mov	x1,0
	mov	x0, 0
	bl	time
	bl	srand
	str	wzr, [x29, 24]
	b	.L6
.L7:
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
	ldrsw	x0, [x29, 24]
	lsl	x0, x0, 2
	add	x2, x29, 3232
	add	x0, x2, x0
	sub	x0, x0, #4096
	str	w1, [x0, 2040]
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
	ldrsw	x0, [x29, 24]
	lsl	x0, x0, 2
	add	x2, x29, 3232
	add	x0, x2, x0
	sub	x0, x0, #4096
	str	w1, [x0, 3064]
	ldr	w0, [x29, 24]
	add	w0, w0, 1
	str	w0, [x29, 24]
.L6:
	ldr	w0, [x29, 24]
	cmp	w0, 255
	ble	.L7
	add	x0, x29, 32
	mov	x2, 96
	mov	w1, 0
	bl	memset
	str	wzr, [x29, 32]
	mov	w0, 96
	str	w0, [x29, 36]
	mov	x0, 3
	str	x0, [x29, 64]
	mov	x0, 1
	str	x0, [x29, 40]
	ldrb	w0, [x29, 72]
	orr	w0, w0, 1
	strb	w0, [x29, 72]
	ldrb	w0, [x29, 72]
	orr	w0, w0, 32
	strb	w0, [x29, 72]
	ldrb	w0, [x29, 72]
	orr	w0, w0, 64
	strb	w0, [x29, 72]
	add	x0, x29, 32
	mov	x4, 0
	mov	w3, -1
	mov	w2, -1
	mov	w1, 0
	bl	perf_event_open
	str	w0, [x29, 28]
	ldr	w0, [x29, 28]
	cmn	w0, #1
	bne	.L8
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	mov	w0, 0
	bl	exit
.L8:
	mov	w2, 0
	mov	x1, 9219
	ldr	w0, [x29, 28]
	bl	ioctl
	mov	w2, 0
	mov	x1, 9216
	ldr	w0, [x29, 28]
	bl	ioctl
	str	wzr, [x29, 24]
	b	.L9
.L10:
	ldrsw	x0, [x29, 24]
	lsl	x0, x0, 2
	add	x1, x29, 3232
	add	x0, x1, x0
	sub	x0, x0, #4096
	ldr	w1, [x0, 2040]
	ldrsw	x0, [x29, 24]
	lsl	x0, x0, 2
	add	x2, x29, 3232
	add	x0, x2, x0
	sub	x0, x0, #4096
	ldr	w0, [x0, 3064]
	add	w0, w1, w0
	ldrsw	x1, [x29, 24]
	lsl	x1, x1, 2
	add	x2, x29, 3232
	add	x1, x2, x1
	sub	x1, x1, #4096
	str	w0, [x1, 1016]
	ldr	w0, [x29, 24]
	add	w0, w0, 1
	str	w0, [x29, 24]
.L9:
	ldr	w0, [x29, 24]
	cmp	w0, 255
	ble	.L10
	mov	w2, 0
	mov	x1, 9217
	ldr	w0, [x29, 28]
	bl	ioctl
	add	x0, x29, 128
	mov	x2, 24
	mov	x1, x0
	ldr	w0, [x29, 28]
	bl	read
	str	wzr, [x29, 24]
	b	.L11
.L12:
	ldrsw	x0, [x29, 24]
	lsl	x0, x0, 2
	add	x1, x29, 3232
	add	x0, x1, x0
	sub	x0, x0, #4096
	ldr	w1, [x0, 1016]
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	ldr	w0, [x29, 24]
	add	w0, w0, 1
	str	w0, [x29, 24]
.L11:
	ldr	w0, [x29, 24]
	cmp	w0, 255
	ble	.L12
	mov	w0, 10
	bl	putchar
	add	x0, x29, 128
	bl	perf_count
	mov	x1, x0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	printf
	mov	w0, 0
	adrp	x1, __stack_chk_guard
	add	x1, x1, :lo12:__stack_chk_guard
	ldr	x2, [x29, 3224]
	ldr	x1, [x1]
	eor	x1, x2, x1
	cmp	x1, 0
	beq	.L14
	bl	__stack_chk_fail
.L14:
	ldp	x29, x30, [sp], 16
	add	sp, sp, 3216
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
