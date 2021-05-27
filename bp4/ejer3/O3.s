	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\303\202\302\272 componentes del vector"
	.align 8
.LC7:
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
	jle	.L27
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	$24567, 28(%rsp)
	movq	%rax, %r13
	movl	%eax, 12(%rsp)
	call	drand48@PLT
	movl	%r13d, %r14d
	leaq	0(,%r14,8), %rbp
	movsd	%xmm0, (%rsp)
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	malloc@PLT
	movq	%rax, %rbp
	cmpl	$8, %r13d
	ja	.L3
	testl	%r13d, %r13d
	je	.L4
	pxor	%xmm0, %xmm0
	movsd	.LC1(%rip), %xmm2
	leal	-1(%r13), %ebx
	cvtsi2sdl	%r13d, %xmm0
	mulsd	%xmm2, %xmm0
	cmpl	$2, %ebx
	jbe	.L18
	movapd	.LC2(%rip), %xmm4
	movapd	.LC3(%rip), %xmm3
	movapd	%xmm0, %xmm1
	unpcklpd	%xmm1, %xmm1
	addpd	%xmm1, %xmm4
	addpd	%xmm1, %xmm3
	movups	%xmm4, (%rax)
	movups	%xmm3, 16(%rax)
	movl	%r13d, %eax
	shrl	$2, %eax
	movups	%xmm4, (%r15)
	movups	%xmm3, 16(%r15)
	cmpl	$2, %eax
	je	.L28
	cmpl	$4, %r13d
	je	.L7
	movl	$4, %eax
.L5:
	pxor	%xmm1, %xmm1
	movslq	%eax, %rcx
	cvtsi2sdl	%eax, %xmm1
	leaq	0(,%rcx,8), %rdx
	mulsd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%r15,%rcx,8)
	movsd	%xmm1, 0(%rbp,%rcx,8)
	leal	1(%rax), %ecx
	cmpl	%ecx, %r13d
	jbe	.L8
	pxor	%xmm1, %xmm1
	addl	$2, %eax
	cvtsi2sdl	%ecx, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%r15,%rdx)
	movsd	%xmm1, 8(%rbp,%rdx)
	cmpl	%eax, %r13d
	jbe	.L7
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%r15,%rdx)
	movsd	%xmm0, 16(%rbp,%rdx)
.L7:
	xorl	%edi, %edi
	leaq	32(%rsp), %rsi
	call	clock_gettime@PLT
	testl	%r13d, %r13d
	movl	$1, %ecx
	cmovne	%r13d, %ecx
.L16:
	movsd	(%rsp), %xmm1
	movl	%ecx, %edx
	xorl	%eax, %eax
	shrl	%edx
	unpcklpd	%xmm1, %xmm1
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L12:
	movupd	(%r15,%rax), %xmm0
	movupd	0(%rbp,%rax), %xmm5
	mulpd	%xmm1, %xmm0
	addpd	%xmm5, %xmm0
	movups	%xmm0, 0(%rbp,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L12
	movl	%ecx, %eax
	andl	$-2, %eax
	andl	$1, %ecx
	je	.L15
.L14:
	cltq
	movsd	(%rsp), %xmm0
	leaq	0(%rbp,%rax,8), %rdx
	mulsd	(%r15,%rax,8), %xmm0
	addsd	(%rdx), %xmm0
	movsd	%xmm0, (%rdx)
.L15:
	xorl	%edi, %edi
	leaq	48(%rsp), %rsi
	call	clock_gettime@PLT
	movq	56(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	40(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC6(%rip), %xmm0
	movl	12(%rsp), %esi
	movsd	0(%rbp,%rbx,8), %xmm2
	leaq	.LC7(%rip), %rdi
	movl	$3, %eax
	addsd	%xmm1, %xmm0
	movsd	0(%rbp), %xmm1
	call	printf@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r15, %rdi
	call	free@PLT
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L29
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
.L28:
	.cfi_restore_state
	movapd	.LC4(%rip), %xmm0
	addpd	%xmm1, %xmm0
	addpd	.LC5(%rip), %xmm1
	movups	%xmm0, 32(%r15)
	movups	%xmm1, 48(%r15)
	movups	%xmm0, 32(%rbp)
	movups	%xmm1, 48(%rbp)
	jmp	.L7
.L3:
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	leaq	28(%rsp), %rbx
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%rbx, %rdi
	call	rand_r@PLT
	pxor	%xmm0, %xmm0
	movq	%rbx, %rdi
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, (%r15,%r12,8)
	call	rand_r@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, 0(%rbp,%r12,8)
	addq	$1, %r12
	cmpq	%r12, %r14
	jne	.L9
	xorl	%edi, %edi
	leaq	32(%rsp), %rsi
	leal	-1(%r13), %ebx
	call	clock_gettime@PLT
	testl	%r13d, %r13d
	movl	$1, %ecx
	cmovne	%r13d, %ecx
	jmp	.L16
.L8:
	xorl	%edi, %edi
	leaq	32(%rsp), %rsi
	call	clock_gettime@PLT
	testl	%r13d, %r13d
	movl	$1, %ecx
	cmovne	%r13d, %ecx
	xorl	%eax, %eax
	subl	$1, %r13d
	je	.L14
	jmp	.L16
.L4:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	movl	$4294967295, %ebx
	call	clock_gettime@PLT
	jmp	.L15
.L18:
	xorl	%eax, %eax
	jmp	.L5
.L29:
	call	__stack_chk_fail@PLT
.L27:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.set	.LC1,.LC2+8
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	0
	.long	0
	.long	-1717986918
	.long	1069128089
	.align 16
.LC3:
	.long	-1717986918
	.long	1070176665
	.long	858993460
	.long	1070805811
	.align 16
.LC4:
	.long	-1717986918
	.long	1071225241
	.long	0
	.long	1071644672
	.align 16
.LC5:
	.long	858993460
	.long	1071854387
	.long	1717986919
	.long	1072064102
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
