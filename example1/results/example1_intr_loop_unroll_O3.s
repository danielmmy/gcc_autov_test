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
	add	x8, x29, 88
	mov	w7, 96
	mov	w4, -1
	mov	x6, 3
	stp	xzr, xzr, [x0]
	mov	w3, w4
	mov	x20, 1
	mov	x5, 0
	ldrb	w0, [x29, 112]
	mov	w2, 0
	stp	xzr, xzr, [x1]
	stp	xzr, xzr, [x8]
	add	x8, x29, 120
	orr	w0, w0, 1
	str	w7, [x29, 76]
	orr	w0, w0, w7
	str	x20, [x29, 80]
	stp	xzr, xzr, [x8]
	add	x8, x29, 136
	strb	w0, [x29, 112]
	mov	x0, 241
	str	x6, [x29, 104]
	stp	xzr, xzr, [x8]
	add	x8, x29, 152
	stp	xzr, xzr, [x8]
	bl	syscall
	cmn	w0, #1
	mov	x19, x0
	beq	.L15
	mov	w2, 0
	mov	x1, 9219
	add	x20, x29, 192
	adrp	x21, .LC1
	bl	ioctl
	add	x22, x20, 64
	mov	w0, w19
	mov	w2, 0
	mov	x1, 9216
	add	x21, x21, :lo12:.LC1
	bl	ioctl
	ldr	q0, [x29, 1216]
	mov	w0, w19
	ldr	q6, [x29, 1232]
	mov	w2, 0
	ldr	q4, [x29, 2240]
	mov	x1, 9217
	ldr	q3, [x29, 2256]
	ldr	q7, [x29, 1264]
	ldr	q1, [x29, 2288]
	add	v4.4s, v4.4s, v0.4s
	add	v3.4s, v3.4s, v6.4s
	ldr	q0, [x29, 2304]
	ldr	q6, [x29, 1280]
	str	q4, [x29, 192]
	ldr	q5, [x29, 1248]
	str	q3, [x29, 208]
	add	v1.4s, v1.4s, v7.4s
	ldr	q2, [x29, 2272]
	add	v0.4s, v0.4s, v6.4s
	ldr	q4, [x29, 2336]
	str	q1, [x29, 240]
	ldr	q6, [x29, 1312]
	str	q0, [x29, 256]
	add	v2.4s, v2.4s, v5.4s
	ldr	q7, [x29, 1296]
	ldr	q1, [x29, 1328]
	ldr	q5, [x29, 2320]
	str	q2, [x29, 224]
	ldr	q3, [x29, 2352]
	add	v4.4s, v4.4s, v6.4s
	add	v5.4s, v5.4s, v7.4s
	ldr	q6, [x29, 1360]
	ldr	q7, [x29, 1344]
	str	q4, [x29, 288]
	add	v3.4s, v3.4s, v1.4s
	str	q5, [x29, 272]
	ldr	q2, [x29, 2368]
	ldr	q1, [x29, 2384]
	str	q3, [x29, 304]
	ldr	q4, [x29, 1376]
	ldr	q0, [x29, 2400]
	add	v2.4s, v2.4s, v7.4s
	add	v1.4s, v1.4s, v6.4s
	add	v0.4s, v0.4s, v4.4s
	str	q2, [x29, 320]
	str	q1, [x29, 336]
	str	q0, [x29, 352]
	ldr	q6, [x29, 1392]
	ldr	q1, [x29, 1408]
	ldr	q3, [x29, 2416]
	ldr	q0, [x29, 2432]
	ldr	q7, [x29, 1424]
	ldr	q4, [x29, 1440]
	add	v3.4s, v3.4s, v6.4s
	add	v0.4s, v0.4s, v1.4s
	ldr	q6, [x29, 1456]
	ldr	q5, [x29, 2448]
	str	q3, [x29, 368]
	ldr	q2, [x29, 2464]
	str	q0, [x29, 384]
	ldr	q1, [x29, 2480]
	add	v5.4s, v5.4s, v7.4s
	add	v2.4s, v2.4s, v4.4s
	ldr	q7, [x29, 1472]
	add	v1.4s, v1.4s, v6.4s
	ldr	q4, [x29, 2496]
	str	q5, [x29, 400]
	ldr	q6, [x29, 1488]
	str	q2, [x29, 416]
	ldr	q0, [x29, 2512]
	str	q1, [x29, 432]
	add	v4.4s, v4.4s, v7.4s
	ldr	q5, [x29, 1536]
	add	v0.4s, v0.4s, v6.4s
	ldr	q7, [x29, 1504]
	str	q4, [x29, 448]
	ldr	q6, [x29, 1520]
	str	q0, [x29, 464]
	ldr	q3, [x29, 2528]
	ldr	q2, [x29, 2544]
	ldr	q1, [x29, 2560]
	ldr	q4, [x29, 1552]
	ldr	q0, [x29, 2576]
	add	v3.4s, v3.4s, v7.4s
	add	v2.4s, v2.4s, v6.4s
	add	v1.4s, v1.4s, v5.4s
	add	v0.4s, v0.4s, v4.4s
	str	q3, [x29, 480]
	str	q2, [x29, 496]
	str	q1, [x29, 512]
	str	q0, [x29, 528]
	ldr	q6, [x29, 1568]
	ldr	q1, [x29, 1584]
	ldr	q3, [x29, 2592]
	ldr	q0, [x29, 2608]
	ldr	q7, [x29, 1600]
	ldr	q4, [x29, 1616]
	add	v3.4s, v3.4s, v6.4s
	add	v0.4s, v0.4s, v1.4s
	ldr	q6, [x29, 2656]
	ldr	q5, [x29, 2624]
	str	q3, [x29, 544]
	ldr	q2, [x29, 2640]
	str	q0, [x29, 560]
	ldr	q1, [x29, 1632]
	add	v5.4s, v5.4s, v7.4s
	add	v2.4s, v2.4s, v4.4s
	ldr	q7, [x29, 2672]
	add	v1.4s, v1.4s, v6.4s
	ldr	q4, [x29, 1648]
	str	q5, [x29, 576]
	ldr	q6, [x29, 2688]
	str	q2, [x29, 592]
	ldr	q0, [x29, 1664]
	str	q1, [x29, 608]
	add	v4.4s, v4.4s, v7.4s
	ldr	q5, [x29, 2736]
	add	v0.4s, v0.4s, v6.4s
	ldr	q7, [x29, 2704]
	str	q4, [x29, 624]
	ldr	q6, [x29, 2720]
	str	q0, [x29, 640]
	ldr	q3, [x29, 1680]
	ldr	q2, [x29, 1696]
	ldr	q1, [x29, 1712]
	ldr	q4, [x29, 2752]
	ldr	q0, [x29, 1728]
	add	v3.4s, v3.4s, v7.4s
	add	v2.4s, v2.4s, v6.4s
	add	v1.4s, v1.4s, v5.4s
	add	v0.4s, v0.4s, v4.4s
	str	q3, [x29, 656]
	str	q2, [x29, 672]
	str	q1, [x29, 688]
	str	q0, [x29, 704]
	ldr	q6, [x29, 2768]
	ldr	q1, [x29, 2784]
	ldr	q3, [x29, 1744]
	ldr	q0, [x29, 1760]
	ldr	q7, [x29, 2800]
	ldr	q4, [x29, 2816]
	add	v3.4s, v3.4s, v6.4s
	add	v0.4s, v0.4s, v1.4s
	ldr	q6, [x29, 2832]
	ldr	q5, [x29, 1776]
	str	q3, [x29, 720]
	ldr	q2, [x29, 1792]
	str	q0, [x29, 736]
	ldr	q1, [x29, 1808]
	add	v5.4s, v5.4s, v7.4s
	add	v2.4s, v2.4s, v4.4s
	ldr	q7, [x29, 2848]
	add	v1.4s, v1.4s, v6.4s
	ldr	q4, [x29, 1824]
	str	q5, [x29, 752]
	ldr	q6, [x29, 2864]
	str	q2, [x29, 768]
	ldr	q0, [x29, 1840]
	str	q1, [x29, 784]
	add	v4.4s, v4.4s, v7.4s
	ldr	q5, [x29, 2912]
	add	v0.4s, v0.4s, v6.4s
	ldr	q7, [x29, 2880]
	str	q4, [x29, 800]
	ldr	q6, [x29, 2896]
	str	q0, [x29, 816]
	ldr	q3, [x29, 1856]
	ldr	q2, [x29, 1872]
	ldr	q1, [x29, 1888]
	ldr	q4, [x29, 2928]
	ldr	q0, [x29, 1904]
	add	v3.4s, v3.4s, v7.4s
	add	v2.4s, v2.4s, v6.4s
	add	v1.4s, v1.4s, v5.4s
	add	v0.4s, v0.4s, v4.4s
	str	q3, [x29, 832]
	str	q2, [x29, 848]
	str	q1, [x29, 864]
	str	q0, [x29, 880]
	ldr	q6, [x29, 2944]
	ldr	q1, [x29, 2960]
	ldr	q3, [x29, 1920]
	ldr	q0, [x29, 1936]
	ldr	q7, [x29, 2976]
	ldr	q4, [x29, 2992]
	add	v3.4s, v3.4s, v6.4s
	add	v0.4s, v0.4s, v1.4s
	ldr	q6, [x29, 3008]
	ldr	q5, [x29, 1952]
	str	q3, [x29, 896]
	ldr	q2, [x29, 1968]
	str	q0, [x29, 912]
	ldr	q1, [x29, 1984]
	add	v5.4s, v5.4s, v7.4s
	add	v2.4s, v2.4s, v4.4s
	ldr	q7, [x29, 3024]
	add	v1.4s, v1.4s, v6.4s
	ldr	q4, [x29, 2000]
	str	q5, [x29, 928]
	ldr	q6, [x29, 3040]
	str	q2, [x29, 944]
	ldr	q0, [x29, 2016]
	str	q1, [x29, 960]
	add	v4.4s, v4.4s, v7.4s
	ldr	q5, [x29, 3088]
	add	v0.4s, v0.4s, v6.4s
	ldr	q7, [x29, 3056]
	str	q4, [x29, 976]
	ldr	q6, [x29, 3072]
	str	q0, [x29, 992]
	ldr	q3, [x29, 2032]
	ldr	q2, [x29, 2048]
	ldr	q1, [x29, 2064]
	ldr	q4, [x29, 3104]
	ldr	q0, [x29, 2080]
	add	v3.4s, v3.4s, v7.4s
	add	v2.4s, v2.4s, v6.4s
	add	v1.4s, v1.4s, v5.4s
	add	v0.4s, v0.4s, v4.4s
	str	q3, [x29, 1008]
	str	q2, [x29, 1024]
	str	q1, [x29, 1040]
	str	q0, [x29, 1056]
	ldr	q6, [x29, 3120]
	ldr	q0, [x29, 3136]
	ldr	q2, [x29, 2096]
	ldr	q1, [x29, 2112]
	ldr	q7, [x29, 3152]
	ldr	q3, [x29, 3168]
	add	v2.4s, v2.4s, v6.4s
	add	v1.4s, v1.4s, v0.4s
	ldr	q6, [x29, 3184]
	ldr	q5, [x29, 2128]
	str	q2, [x29, 1072]
	ldr	q4, [x29, 2144]
	str	q1, [x29, 1088]
	ldr	q0, [x29, 2160]
	add	v5.4s, v5.4s, v7.4s
	add	v4.4s, v4.4s, v3.4s
	ldr	q7, [x29, 3200]
	add	v0.4s, v0.4s, v6.4s
	ldr	q3, [x29, 2176]
	str	q5, [x29, 1104]
	ldr	q6, [x29, 3216]
	str	q4, [x29, 1120]
	ldr	q5, [x29, 3232]
	str	q0, [x29, 1136]
	ldr	q4, [x29, 3248]
	ldr	q2, [x29, 2192]
	ldr	q1, [x29, 2208]
	ldr	q0, [x29, 2224]
	add	v3.4s, v3.4s, v7.4s
	add	v2.4s, v2.4s, v6.4s
	add	v1.4s, v1.4s, v5.4s
	add	v0.4s, v0.4s, v4.4s
	str	q3, [x29, 1152]
	str	q2, [x29, 1168]
	str	q1, [x29, 1184]
	str	q0, [x29, 1200]
	bl	ioctl
	add	x1, x29, 168
	mov	w0, w19
	mov	x2, 24
	bl	read
.L7:
	mov	x19, 0
	.p2align 2
.L8:
	ldr	w2, [x20, x19]
	mov	x1, x21
	mov	w0, 1
	add	x19, x19, 4
	bl	__printf_chk
	cmp	x19, 256
	bne	.L8
	add	x20, x20, 16
	cmp	x20, x22
	bne	.L7
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
	cbnz	x1, .L16
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	add	sp, sp, 3216
	ret
.L15:
	adrp	x1, .LC0
	mov	w0, w20
	add	x1, x1, :lo12:.LC0
	bl	__printf_chk
	mov	w0, 0
	bl	exit
.L16:
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
