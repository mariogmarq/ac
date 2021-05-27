	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\303\202\302\272 componentes del vector"
	.align 8
.LC3:
	.string	"Tiempo:%11.9f\t / Dim vec:%u\t/ y[0](%f)/ / y[N-1](%f)/\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L17
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	$24567, 28(%rsp)
	movq	%rax, %rbx
	movl	%eax, %r15d
	call	drand48@PLT
	movl	%ebx, %eax
	leaq	0(,%rax,8), %rbp
	movsd	%xmm0, (%rsp)
	movq	%rbp, %rdi
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc@PLT
	movq	%rax, %rbp
	cmpl	$8, %ebx
	ja	.L3
	testl	%ebx, %ebx
	je	.L4
	pxor	%xmm1, %xmm1
	movsd	.LC1(%rip), %xmm2
	xorl	%eax, %eax
	cvtsi2sdl	%ebx, %xmm1
	mulsd	%xmm2, %xmm1
	.p2align 4,,10
	.p2align 3
.L5:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%r12,%rax,8)
	movsd	%xmm0, 0(%rbp,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r15d
	ja	.L5
.L6:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	(%rsp), %xmm0
	mulsd	(%r12,%rax,8), %xmm0
	addsd	0(%rbp,%rax,8), %xmm0
	movsd	%xmm0, 0(%rbp,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r15d
	ja	.L8
.L9:
	xorl	%edi, %edi
	leaq	48(%rsp), %rsi
	call	clock_gettime@PLT
	movq	56(%rsp), %rax
	leal	-1(%rbx), %edx
	movl	%r15d, %esi
	subq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movsd	0(%rbp,%rdx,8), %xmm2
	cvtsi2sdq	%rax, %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	divsd	.LC2(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	leaq	.LC3(%rip), %rdi
	movl	$3, %eax
	addsd	%xmm1, %xmm0
	movsd	0(%rbp), %xmm1
	call	printf@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L18
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	xorl	%edi, %edi
	xorl	%r14d, %r14d
	leaq	28(%rsp), %r13
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%r13, %rdi
	call	rand_r@PLT
	pxor	%xmm0, %xmm0
	movq	%r13, %rdi
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, (%r12,%r14,8)
	call	rand_r@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, 0(%rbp,%r14,8)
	addq	$1, %r14
	cmpq	%r14, 8(%rsp)
	jne	.L7
	jmp	.L6
.L4:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	jmp	.L9
.L18:
	call	__stack_chk_fail@PLT
.L17:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
