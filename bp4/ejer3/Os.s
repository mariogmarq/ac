	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Faltan n\303\202\302\272 componentes del vector"
.LC3:
	.string	"Tiempo:%11.9f\t / Dim vec:%u\t/ y[0](%f)/ / y[N-1](%f)/\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB6:
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	decl	%edi
	jg	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
.L2:
	movq	8(%rsi), %rdi
	call	atoi@PLT
	movl	$24567, 4(%rsp)
	movl	%eax, %r12d
	call	drand48@PLT
	movq	%r12, %rbp
	salq	$3, %r12
	movq	%r12, %rdi
	movq	%xmm0, %r15
	call	malloc@PLT
	movq	%r12, %rdi
	movq	%rax, %r13
	call	malloc@PLT
	movsd	.LC1(%rip), %xmm2
	movq	%rax, %r12
	xorl	%eax, %eax
	cmpl	$8, %ebp
	ja	.L17
.L3:
	cmpl	%eax, %ebp
	jbe	.L6
	cvtsi2sdl	%eax, %xmm1
	cvtsi2sdl	%ebp, %xmm0
	mulsd	%xmm2, %xmm1
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 0(%r13,%rax,8)
	movsd	%xmm0, (%r12,%rax,8)
	incq	%rax
	jmp	.L3
.L17:
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	leaq	4(%rsp), %r14
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
.L7:
	movq	%r14, %rdi
	call	rand_r@PLT
	movq	%r14, %rdi
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, 0(%r13,%rbx,8)
	call	rand_r@PLT
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpl	%ebx, %ebp
	ja	.L7
.L6:
	leaq	8(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
.L8:
	cmpl	%eax, %ebp
	jbe	.L18
	movq	%r15, %xmm0
	mulsd	0(%r13,%rax,8), %xmm0
	addsd	(%r12,%rax,8), %xmm0
	movsd	%xmm0, (%r12,%rax,8)
	incq	%rax
	jmp	.L8
.L18:
	xorl	%edi, %edi
	leaq	24(%rsp), %rsi
	call	clock_gettime@PLT
	movq	32(%rsp), %rax
	leal	-1(%rbp), %edx
	movl	%ebp, %esi
	subq	16(%rsp), %rax
	movsd	(%r12,%rdx,8), %xmm2
	leaq	.LC3(%rip), %rdi
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	divsd	.LC2(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movb	$3, %al
	addsd	%xmm1, %xmm0
	movsd	(%r12), %xmm1
	call	printf@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	addq	$56, %rsp
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
	.cfi_endproc
.LFE6:
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
