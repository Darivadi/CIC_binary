	.file	"CIC_noperiodic.c"
	.text
.Ltext0:
	.comm	GV,1104,32
	.comm	part,8,8
	.comm	Header,256,32
	.comm	cells,8,8
	.globl	randr
	.type	randr, @function
randr:
.LFB2:
	.file 1 "functions.h"
	.loc 1 13 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -24(%rbp)
	.loc 1 14 0
	call	rand
	cvtsi2sd	%eax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	.loc 1 16 0
	movsd	-24(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	mulsd	-8(%rbp), %xmm0
	subsd	-24(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-32(%rbp), %rax
	.loc 1 17 0
	movq	%rax, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	randr, .-randr
	.section	.rodata
	.align 8
.LC1:
	.string	"############################################################"
.LC2:
	.string	"Reading snapshot %s\n"
.LC3:
	.string	"r"
.LC4:
	.string	"File %s cannot be open\n"
	.align 8
.LC5:
	.string	"----------------------------------------"
.LC6:
	.string	"Reading snapshot with:"
	.align 8
.LC7:
	.string	"Type %d has Npart=%12d NpartTotal=%12d with mass %16.8lf\n"
	.align 8
.LC8:
	.string	" There is a total %d particles in the snapshot\n\n"
.LC9:
	.string	" * Frame's Time... %16.8f\n"
.LC10:
	.string	" * Redshift... %16.8f\n"
.LC11:
	.string	" * Flagsfr... %d\n"
.LC12:
	.string	" * Flagfed... %d\n"
.LC13:
	.string	" * Flagcool... %d\n"
.LC14:
	.string	" * numfiles... %d\n"
.LC15:
	.string	" * Boxsize... %16.8f\n"
.LC16:
	.string	" * Omega0... %16.8f\n"
.LC17:
	.string	" * OmageLa... %16.8f\n"
.LC18:
	.string	" * Hubbleparam... %16.8f\n"
	.align 8
.LC19:
	.string	"Structure particles could not be allocated"
	.align 8
.LC20:
	.string	" Can not read properly ids %d %lu\n"
	.text
	.globl	readGADGETBinaryFile
	.type	readGADGETBinaryFile, @function
readGADGETBinaryFile:
.LFB3:
	.loc 1 20 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.loc 1 21 0
	movq	$0, -24(%rbp)
	.loc 1 23 0
	movl	$0, -28(%rbp)
	.loc 1 27 0
	movl	$.LC1, %edi
	call	puts
	.loc 1 28 0
	movl	$GV+64, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	.loc 1 29 0
	movl	$.LC3, %esi
	movl	$GV+64, %edi
	call	fopen
	movq	%rax, -24(%rbp)
	.loc 1 30 0
	cmpq	$0, -24(%rbp)
	jne	.L4
	.loc 1 31 0
	movl	$GV+64, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.L4:
	.loc 1 34 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 35 0
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$256, %esi
	movl	$Header, %edi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 36 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 38 0
	movl	$0, -40(%rbp)
	.loc 1 40 0
	movl	$.LC5, %edi
	call	puts
	.loc 1 41 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 42 0
	movl	$.LC5, %edi
	call	puts
	.loc 1 43 0
	movl	$0, -48(%rbp)
	jmp	.L5
.L6:
	.loc 1 44 0 discriminator 2
	movl	-48(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	addl	%eax, -40(%rbp)
	.loc 1 45 0 discriminator 2
	movl	-48(%rbp), %eax
	cltq
	addq	$2, %rax
	movq	Header+8(,%rax,8), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	addq	$24, %rdx
	movl	Header(,%rdx,4), %ecx
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	movl	Header(,%rdx,4), %edx
	movl	-48(%rbp), %esi
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC7, %edi
	movl	$1, %eax
	call	printf
	.loc 1 43 0 discriminator 2
	addl	$1, -48(%rbp)
.L5:
	.loc 1 43 0 is_stmt 0 discriminator 1
	cmpl	$5, -48(%rbp)
	jle	.L6
	.loc 1 49 0 is_stmt 1
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	.loc 1 50 0
	movl	$.LC5, %edi
	call	puts
	.loc 1 51 0
	movq	Header+72(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC9, %edi
	movl	$1, %eax
	call	printf
	.loc 1 52 0
	movq	Header+80(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC10, %edi
	movl	$1, %eax
	call	printf
	.loc 1 53 0
	movl	Header+88(%rip), %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	.loc 1 54 0
	movl	Header+92(%rip), %eax
	movl	%eax, %esi
	movl	$.LC12, %edi
	movl	$0, %eax
	call	printf
	.loc 1 55 0
	movl	Header+120(%rip), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	.loc 1 56 0
	movl	Header+124(%rip), %eax
	movl	%eax, %esi
	movl	$.LC14, %edi
	movl	$0, %eax
	call	printf
	.loc 1 57 0
	movq	Header+128(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC15, %edi
	movl	$1, %eax
	call	printf
	.loc 1 58 0
	movq	Header+136(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC16, %edi
	movl	$1, %eax
	call	printf
	.loc 1 59 0
	movq	Header+144(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC17, %edi
	movl	$1, %eax
	call	printf
	.loc 1 60 0
	movq	Header+152(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC18, %edi
	movl	$1, %eax
	call	printf
	.loc 1 63 0
	movl	-40(%rbp), %eax
	cltq
	movl	$64, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, part(%rip)
	.loc 1 65 0
	movq	part(%rip), %rax
	testq	%rax, %rax
	jne	.L7
	.loc 1 66 0
	movl	$.LC19, %edi
	call	puts
	.loc 1 67 0
	movl	$0, %edi
	call	exit
.L7:
	.loc 1 73 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 74 0
	movl	$0, -48(%rbp)
	jmp	.L8
.L9:
	.loc 1 75 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 76 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-16(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 8(%rax)
	.loc 1 77 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-12(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 16(%rax)
	.loc 1 78 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-8(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 24(%rax)
	.loc 1 74 0 discriminator 2
	addl	$1, -48(%rbp)
.L8:
	.loc 1 74 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L9
	.loc 1 80 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 81 0
	movl	-60(%rbp), %eax
	movslq	%eax, %rcx
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	cmpq	%rax, %rcx
	je	.L10
	.loc 1 82 0
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	.loc 1 83 0
	movl	$0, %edi
	call	exit
.L10:
	.loc 1 89 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 90 0
	movl	$0, -48(%rbp)
	jmp	.L11
.L12:
	.loc 1 91 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 92 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-16(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 32(%rax)
	.loc 1 93 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-12(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 40(%rax)
	.loc 1 94 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-8(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 48(%rax)
	.loc 1 90 0 discriminator 2
	addl	$1, -48(%rbp)
.L11:
	.loc 1 90 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L12
	.loc 1 106 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 107 0
	movl	-60(%rbp), %eax
	movslq	%eax, %rcx
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	cmpq	%rax, %rcx
	je	.L13
	.loc 1 108 0
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	.loc 1 109 0
	movl	$0, %edi
	call	exit
.L13:
	.loc 1 115 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 116 0
	movl	$0, -48(%rbp)
	jmp	.L14
.L15:
	.loc 1 117 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-52(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 118 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	-52(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 116 0 discriminator 2
	addl	$1, -48(%rbp)
.L14:
	.loc 1 116 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L15
	.loc 1 121 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 122 0
	movl	-60(%rbp), %eax
	cltq
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	cmpq	%rdx, %rax
	je	.L16
	.loc 1 123 0
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	.loc 1 124 0
	movl	$0, %edi
	call	exit
.L16:
	.loc 1 130 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 131 0
	movl	$0, -32(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 132 0
	movl	$0, -44(%rbp)
	jmp	.L17
.L26:
	.loc 1 133 0
	movl	-44(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	addl	%eax, -32(%rbp)
	.loc 1 134 0
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	movsd	Header+8(,%rax,8), %xmm0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L18
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L18
	.loc 1 134 0 is_stmt 0 discriminator 1
	movl	-44(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	testl	%eax, %eax
	je	.L18
	.loc 1 135 0 is_stmt 1
	movl	-36(%rbp), %eax
	movl	%eax, -48(%rbp)
	jmp	.L20
.L21:
	.loc 1 136 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 137 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-56(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 56(%rax)
	.loc 1 135 0 discriminator 2
	addl	$1, -48(%rbp)
.L20:
	.loc 1 135 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L21
.L18:
	.loc 1 140 0 is_stmt 1
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	movsd	Header+8(,%rax,8), %xmm0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L29
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	je	.L22
.L29:
	.loc 1 140 0 is_stmt 0 discriminator 1
	movl	-44(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	testl	%eax, %eax
	je	.L22
	.loc 1 141 0 is_stmt 1
	movl	-36(%rbp), %eax
	movl	%eax, -48(%rbp)
	jmp	.L24
.L25:
	.loc 1 142 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	movq	Header+8(,%rax,8), %rax
	movq	%rax, 56(%rdx)
	.loc 1 141 0 discriminator 2
	addl	$1, -48(%rbp)
.L24:
	.loc 1 141 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L25
.L22:
	.loc 1 145 0 is_stmt 1
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 132 0
	addl	$1, -44(%rbp)
.L17:
	.loc 1 132 0 is_stmt 0 discriminator 1
	cmpl	$5, -44(%rbp)
	jle	.L26
	.loc 1 147 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 148 0
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 1 149 0
	movl	-40(%rbp), %eax
	.loc 1 150 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	readGADGETBinaryFile, .-readGADGETBinaryFile
	.globl	W
	.type	W, @function
W:
.LFB4:
	.loc 1 167 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -40(%rbp)
	movsd	%xmm1, -48(%rbp)
	movsd	%xmm2, -56(%rbp)
	movsd	%xmm3, -64(%rbp)
	.loc 1 217 0
	movsd	-40(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	-64(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L44
	.loc 1 219 0
	movsd	-40(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	.LC23(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	.L33
.L44:
	.loc 1 223 0
	movl	$0, %eax
	movq	%rax, -24(%rbp)
.L33:
	.loc 1 226 0
	movsd	-48(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	-64(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L45
	.loc 1 228 0
	movsd	-48(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	.LC23(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	jmp	.L36
.L45:
	.loc 1 232 0
	movl	$0, %eax
	movq	%rax, -16(%rbp)
.L36:
	.loc 1 235 0
	movsd	-56(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	-64(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L46
	.loc 1 237 0
	movsd	-56(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	.LC23(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L39
.L46:
	.loc 1 241 0
	movl	$0, %eax
	movq	%rax, -8(%rbp)
.L39:
	.loc 1 289 0
	movsd	-24(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-8(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movq	-72(%rbp), %rax
	.loc 1 295 0
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	W, .-W
	.globl	locateCell
	.type	locateCell, @function
locateCell:
.LFB5:
	.loc 1 310 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movsd	%xmm0, -40(%rbp)
	movsd	%xmm1, -48(%rbp)
	movsd	%xmm2, -56(%rbp)
	movl	%edi, -60(%rbp)
	movq	%rsi, -72(%rbp)
	.loc 1 317 0
	movsd	GV+8(%rip), %xmm1
	movsd	-40(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	GV(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, -32(%rbp)
	.loc 1 319 0
	movsd	GV+8(%rip), %xmm1
	movsd	-48(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	GV(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, -28(%rbp)
	.loc 1 321 0
	movsd	GV+8(%rip), %xmm1
	movsd	-56(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	GV(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, -24(%rbp)
	.loc 1 323 0
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-32(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	.loc 1 326 0
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, (%rdx)
	.loc 1 327 0
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	-72(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc
	movq	%rax, 8(%rbx)
	.loc 1 328 0
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	8(%rax), %rdx
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	subq	$8, %rax
	addq	%rax, %rdx
	movl	-60(%rbp), %eax
	cltq
	movq	%rax, (%rdx)
	.loc 1 329 0
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	locateCell, .-locateCell
	.globl	mod
	.type	mod, @function
mod:
.LFB6:
	.loc 1 344 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	.loc 1 345 0
	movl	-20(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%edx, -4(%rbp)
	.loc 1 346 0
	jmp	.L49
.L50:
	.loc 1 348 0
	movl	-24(%rbp), %eax
	addl	%eax, -4(%rbp)
.L49:
	.loc 1 346 0 discriminator 1
	cmpl	$0, -4(%rbp)
	js	.L50
	.loc 1 350 0
	movl	-4(%rbp), %eax
	.loc 1 351 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	mod, .-mod
	.section	.rodata
	.align 8
.LC24:
	.string	"grep -v \"#\" %s | grep -v \"^$\" | awk -F\"=\" '{print $2}' > %s.dump"
	.text
	.globl	conf2dump
	.type	conf2dump, @function
conf2dump:
.LFB7:
	.file 2 "readWrite.h"
	.loc 2 4 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1032, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1032(%rbp)
	.loc 2 4 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 2 11 0
	movq	-1032(%rbp), %rcx
	movq	-1032(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	movl	$.LC24, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 2 14 0
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	system
	.loc 2 16 0
	movl	$0, %eax
	.loc 2 17 0
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L54
	call	__stack_chk_fail
.L54:
	addq	$1032, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	conf2dump, .-conf2dump
	.section	.rodata
.LC25:
	.string	"Filename: %s\n"
	.align 8
.LC26:
	.string	"  * The file '%s' doesn't exist!\n"
.LC27:
	.string	"Converting to plain text"
.LC28:
	.string	"%s.dump"
.LC29:
	.string	"%d"
.LC30:
	.string	"%s"
	.align 8
.LC31:
	.string	"  * The file '%s' has been loaded!\n"
.LC32:
	.string	"rm -rf %s.dump"
	.text
	.globl	read_parameters
	.type	read_parameters, @function
read_parameters:
.LFB8:
	.loc 2 29 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2048, %rsp
	movq	%rdi, -2040(%rbp)
	.loc 2 29 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 34 0
	movq	-2040(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	.loc 2 35 0
	movq	-2040(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -2024(%rbp)
	.loc 2 36 0
	cmpq	$0, -2024(%rbp)
	jne	.L56
	.loc 2 38 0
	movq	-2040(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	movl	$0, %eax
	call	printf
	.loc 2 39 0
	movl	$1, %eax
	jmp	.L58
.L56:
	.loc 2 41 0
	movq	-2024(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 44 0
	movl	$.LC27, %edi
	call	puts
	.loc 2 45 0
	movq	-2040(%rbp), %rax
	movq	%rax, %rdi
	call	conf2dump
	.loc 2 46 0
	movq	-2040(%rbp), %rdx
	leaq	-1008(%rbp), %rax
	movl	$.LC28, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 2 47 0
	leaq	-1008(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -2024(%rbp)
	.loc 2 55 0
	movq	-2024(%rbp), %rax
	movl	$GV, %edx
	movl	$.LC29, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 2 56 0
	movq	-2024(%rbp), %rax
	movl	$GV+64, %edx
	movl	$.LC30, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 2 58 0
	movq	-2024(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 60 0
	movq	-2040(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC31, %edi
	movl	$0, %eax
	call	printf
	.loc 2 62 0
	movq	-2040(%rbp), %rdx
	leaq	-2016(%rbp), %rax
	movl	$.LC32, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 2 63 0
	leaq	-2016(%rbp), %rax
	movq	%rax, %rdi
	call	system
	.loc 2 65 0
	movl	$0, %eax
.L58:
	.loc 2 66 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L59
	call	__stack_chk_fail
.L59:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	read_parameters, .-read_parameters
	.section	.rodata
.LC33:
	.string	"w"
	.align 8
.LC34:
	.string	"./../../Processed_data/CIC_DenCon_vels_noperiodic_256.bin"
.LC35:
	.string	"Ntotalgrid=%15d\n"
	.text
	.globl	write_binary
	.type	write_binary, @function
write_binary:
.LFB9:
	.loc 2 78 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.loc 2 82 0
	movq	$0, -72(%rbp)
	.loc 2 85 0
	movl	$.LC33, %esi
	movl	$.LC34, %edi
	call	fopen
	movq	%rax, -72(%rbp)
	.loc 2 88 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+8, %edi
	call	fwrite
	.loc 2 89 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1064, %edi
	call	fwrite
	.loc 2 90 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1072, %edi
	call	fwrite
	.loc 2 91 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1080, %edi
	call	fwrite
	.loc 2 92 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1096, %edi
	call	fwrite
	.loc 2 94 0
	movl	GV+24(%rip), %eax
	movl	%eax, %esi
	movl	$.LC35, %edi
	movl	$0, %eax
	call	printf
	.loc 2 95 0
	movl	$0, -76(%rbp)
	jmp	.L61
.L62:
	.loc 2 98 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-76(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	88(%rax), %rax
	movq	%rax, -64(%rbp)
	.loc 2 99 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-76(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	96(%rax), %rax
	movq	%rax, -56(%rbp)
	.loc 2 100 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-76(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	104(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 2 102 0 discriminator 2
	movq	-72(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$8, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 2 105 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-76(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	56(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 2 106 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-76(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	64(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 2 107 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-76(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	72(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 2 109 0 discriminator 2
	movq	-72(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$8, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 2 112 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-76(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	leaq	40(%rax), %rdi
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	call	fwrite
	.loc 2 95 0 discriminator 2
	addl	$1, -76(%rbp)
.L61:
	.loc 2 95 0 is_stmt 0 discriminator 1
	movl	GV+24(%rip), %eax
	cmpl	-76(%rbp), %eax
	jg	.L62
	.loc 2 115 0 is_stmt 1
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 116 0
	movl	$0, %eax
	.loc 2 117 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	write_binary, .-write_binary
	.section	.rodata
	.align 8
.LC36:
	.string	"./../../Processed_data/Particles_pos_vels_test.bin"
	.align 8
.LC38:
	.string	"????????????????????????????????????????????????????????????????"
	.align 8
.LC39:
	.string	"Number of particles for velocity test: %16d\n"
	.text
	.globl	write_binary_parts
	.type	write_binary_parts, @function
write_binary_parts:
.LFB10:
	.loc 2 128 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.loc 2 132 0
	movq	$0, -72(%rbp)
	.loc 2 133 0
	movl	$0, -76(%rbp)
	.loc 2 135 0
	movl	$.LC33, %esi
	movl	$.LC36, %edi
	call	fopen
	movq	%rax, -72(%rbp)
	.loc 2 138 0
	movl	$0, -80(%rbp)
	jmp	.L65
.L68:
	.loc 2 141 0
	movq	part(%rip), %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	24(%rax), %xmm1
	movsd	.LC37(%rip), %xmm0
	ucomisd	%xmm1, %xmm0
	jb	.L66
	.loc 2 144 0
	movq	part(%rip), %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movq	%rax, -64(%rbp)
	.loc 2 145 0
	movq	part(%rip), %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	16(%rax), %rax
	movq	%rax, -56(%rbp)
	.loc 2 146 0
	movq	part(%rip), %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	24(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 2 148 0
	movq	-72(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$8, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 2 150 0
	movq	part(%rip), %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	32(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 2 151 0
	movq	part(%rip), %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	40(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 2 152 0
	movq	part(%rip), %rax
	movl	-80(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	48(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 2 155 0
	movq	-72(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$8, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 2 156 0
	addl	$1, -76(%rbp)
.L66:
	.loc 2 138 0
	addl	$1, -80(%rbp)
.L65:
	.loc 2 138 0 is_stmt 0 discriminator 1
	cvtsi2sd	-80(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L68
	.loc 2 161 0 is_stmt 1
	movl	$.LC38, %edi
	call	puts
	.loc 2 162 0
	movl	-76(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	.loc 2 163 0
	movl	$.LC38, %edi
	call	puts
	.loc 2 165 0
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 166 0
	movl	$0, %eax
	.loc 2 167 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	write_binary_parts, .-write_binary_parts
	.section	.rodata
	.align 8
.LC40:
	.string	"Error: Incomplete number of parameters. Execute as follows:"
.LC41:
	.string	"%s Parameters_file\n"
	.align 8
.LC43:
	.string	"-----------------------------------------------"
.LC44:
	.string	"Cosmological parameters:"
	.align 8
.LC45:
	.string	"OmegaM0=%lf OmegaL0=%lf redshift=%lf HubbleParam=%lf\n"
.LC46:
	.string	"Simulation parameters:"
	.align 8
.LC47:
	.string	"NGRID=%d NGRID3=%d Particle_Mass=%lf NpTotal=%lf rhoMean=%lf L=%lf volCell=%lf dx=%lf Filename=%s\n"
.LC48:
	.string	"Particles located in the grid"
	.align 8
.LC49:
	.string	"Total momentum from particles in x:%12.6lf\n"
	.align 8
.LC50:
	.string	"Total momentum from particles in y:%12.6lf\n"
	.align 8
.LC51:
	.string	"Total momentum from particles in z:%12.6lf\n"
	.align 8
.LC52:
	.string	"Mean velocity from particles in x:%12.6lf\n"
	.align 8
.LC53:
	.string	"Mean velocity from particles in y:%12.6lf\n"
	.align 8
.LC54:
	.string	"Mean velocity from particles in z:%12.6lf\n"
	.align 8
.LC55:
	.string	"Total mean velocity module is %12.6lf\n"
	.align 8
.LC57:
	.string	"Normalization for momentum: aSF*Ngrid^3/NTotalParts=%lf\n"
	.align 8
.LC58:
	.string	"Computing positions and Density contrast"
.LC59:
	.string	"Saving data"
	.align 8
.LC60:
	.string	"Total number of particles:%10d\n"
.LC61:
	.string	"Mass CIC = %lf\n"
.LC62:
	.string	"Mass Simulation = %lf\n"
	.align 8
.LC63:
	.string	"Total momentum from cells in x:%16.8lf\n"
	.align 8
.LC64:
	.string	"Total momentum from cells in y:%16.8lf\n"
	.align 8
.LC65:
	.string	"Total momentum from cells in z:%16.8lf\n"
	.align 8
.LC66:
	.string	"Mean velocity from cells in x:%16.8lf\n"
	.align 8
.LC67:
	.string	"Mean velocity from cells in y:%16.8lf\n"
	.align 8
.LC68:
	.string	"Mean velocity from cells in z:%16.8lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.file 3 "CIC_noperiodic.c"
	.loc 3 17 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$336, %rsp
	movl	%edi, -308(%rbp)
	movq	%rsi, -320(%rbp)
	.loc 3 24 0
	movq	$0, -248(%rbp)
	.loc 3 25 0
	movq	$0, -240(%rbp)
	.loc 3 27 0
	movl	$0, %eax
	movq	%rax, -232(%rbp)
	movl	$0, %eax
	movq	%rax, -256(%rbp)
	.loc 3 28 0
	movl	$0, -276(%rbp)
	.loc 3 37 0
	cmpl	$1, -308(%rbp)
	jg	.L72
	.loc 3 39 0
	movl	$.LC40, %edi
	call	puts
	.loc 3 40 0
	movq	-320(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC41, %edi
	movl	$0, %eax
	call	printf
	.loc 3 41 0
	movl	$0, %edi
	call	exit
.L72:
	.loc 3 44 0
	movq	-320(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -248(%rbp)
	.loc 3 45 0
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	read_parameters
	.loc 3 46 0
	movl	$0, %eax
	call	readGADGETBinaryFile
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, GV+16(%rip)
	.loc 3 49 0
	movq	Header+136(%rip), %rax
	movq	%rax, GV+1064(%rip)
	.loc 3 50 0
	movq	Header+144(%rip), %rax
	movq	%rax, GV+1072(%rip)
	.loc 3 51 0
	movq	Header+80(%rip), %rax
	movq	%rax, GV+1080(%rip)
	.loc 3 52 0
	movq	Header+152(%rip), %rax
	movq	%rax, GV+1096(%rip)
	.loc 3 53 0
	movsd	GV+1080(%rip), %xmm1
	movsd	.LC23(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC23(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, GV+1088(%rip)
	.loc 3 56 0
	movq	Header+128(%rip), %rax
	movq	%rax, GV+8(%rip)
	.loc 3 57 0
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	%eax, %edx
	movl	GV(%rip), %eax
	imull	%edx, %eax
	movl	%eax, GV+24(%rip)
	.loc 3 58 0
	movq	Header+32(%rip), %rax
	movq	%rax, GV+40(%rip)
	.loc 3 59 0
	movsd	GV+40(%rip), %xmm1
	movsd	GV+16(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, -328(%rbp)
	movq	GV+8(%rip), %rax
	movabsq	$4613937818241073152, %rdx
	movq	%rdx, -336(%rbp)
	movsd	-336(%rbp), %xmm1
	movq	%rax, -336(%rbp)
	movsd	-336(%rbp), %xmm0
	call	pow
	movsd	-328(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, GV+32(%rip)
	.loc 3 60 0
	movsd	GV+8(%rip), %xmm1
	movl	GV(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, GV+56(%rip)
	.loc 3 61 0
	movsd	GV+56(%rip), %xmm1
	movsd	GV+56(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	GV+56(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, GV+48(%rip)
	.loc 3 63 0
	movl	$.LC43, %edi
	call	puts
	.loc 3 64 0
	movl	$.LC44, %edi
	call	puts
	.loc 3 65 0
	movq	GV+1096(%rip), %rsi
	movq	GV+1080(%rip), %rcx
	movq	GV+1072(%rip), %rdx
	movq	GV+1064(%rip), %rax
	movq	%rsi, -328(%rbp)
	movsd	-328(%rbp), %xmm3
	movq	%rcx, -328(%rbp)
	movsd	-328(%rbp), %xmm2
	movq	%rdx, -328(%rbp)
	movsd	-328(%rbp), %xmm1
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC45, %edi
	movl	$4, %eax
	call	printf
	.loc 3 70 0
	movl	$.LC43, %edi
	call	puts
	.loc 3 71 0
	movl	$.LC46, %edi
	call	puts
	.loc 3 72 0
	movq	GV+56(%rip), %r9
	movq	GV+48(%rip), %r8
	movq	GV+8(%rip), %rdi
	movq	GV+32(%rip), %rsi
	movq	GV+16(%rip), %rdx
	movq	GV+40(%rip), %rax
	movl	GV+24(%rip), %r11d
	movl	GV(%rip), %r10d
	movl	$GV+64, %ecx
	movq	%r9, -328(%rbp)
	movsd	-328(%rbp), %xmm5
	movq	%r8, -328(%rbp)
	movsd	-328(%rbp), %xmm4
	movq	%rdi, -328(%rbp)
	movsd	-328(%rbp), %xmm3
	movq	%rsi, -328(%rbp)
	movsd	-328(%rbp), %xmm2
	movq	%rdx, -328(%rbp)
	movsd	-328(%rbp), %xmm1
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	%r11d, %edx
	movl	%r10d, %esi
	movl	$.LC47, %edi
	movl	$6, %eax
	call	printf
	.loc 3 82 0
	movl	$.LC43, %edi
	call	puts
	.loc 3 93 0
	movl	GV+24(%rip), %eax
	cltq
	movl	$112, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, cells(%rip)
	.loc 3 96 0
	movl	$0, -304(%rbp)
	jmp	.L73
.L74:
	.loc 3 98 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	.loc 3 99 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 40(%rdx)
	.loc 3 100 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 48(%rdx)
	.loc 3 101 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 16(%rdx)
	.loc 3 102 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 24(%rdx)
	.loc 3 103 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 32(%rdx)
	.loc 3 104 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 56(%rdx)
	.loc 3 105 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 64(%rdx)
	.loc 3 106 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 72(%rdx)
	.loc 3 107 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-304(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 80(%rdx)
	.loc 3 96 0 discriminator 2
	addl	$1, -304(%rbp)
.L73:
	.loc 3 96 0 is_stmt 0 discriminator 1
	movl	GV+24(%rip), %eax
	cmpl	-304(%rbp), %eax
	jg	.L74
	.loc 3 111 0 is_stmt 1
	movl	$0, -304(%rbp)
	jmp	.L75
.L76:
	.loc 3 113 0 discriminator 2
	movq	cells(%rip), %rsi
	movq	part(%rip), %rax
	movl	-304(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	24(%rax), %rcx
	movq	part(%rip), %rax
	movl	-304(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	16(%rax), %rdx
	movq	part(%rip), %rax
	movl	-304(%rbp), %edi
	movslq	%edi, %rdi
	salq	$6, %rdi
	addq	%rdi, %rax
	movq	8(%rax), %rax
	movl	-304(%rbp), %edi
	movq	%rcx, -328(%rbp)
	movsd	-328(%rbp), %xmm2
	movq	%rdx, -328(%rbp)
	movsd	-328(%rbp), %xmm1
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	call	locateCell
	.loc 3 111 0 discriminator 2
	addl	$1, -304(%rbp)
.L75:
	.loc 3 111 0 is_stmt 0 discriminator 1
	cvtsi2sd	-304(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L76
	.loc 3 116 0 is_stmt 1
	movl	$.LC48, %edi
	call	puts
	.loc 3 117 0
	movl	$.LC43, %edi
	call	puts
	.loc 3 121 0
	movl	$0, %eax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -64(%rbp)
	.loc 3 122 0
	movl	$0, %eax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 3 123 0
	movl	$0, -304(%rbp)
	jmp	.L77
.L78:
	.loc 3 125 0 discriminator 2
	movsd	-64(%rbp), %xmm1
	movsd	GV+40(%rip), %xmm2
	movq	part(%rip), %rax
	movl	-304(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	32(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 3 126 0 discriminator 2
	movsd	-56(%rbp), %xmm1
	movsd	GV+40(%rip), %xmm2
	movq	part(%rip), %rax
	movl	-304(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	40(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	.loc 3 127 0 discriminator 2
	movsd	-48(%rbp), %xmm1
	movsd	GV+40(%rip), %xmm2
	movq	part(%rip), %rax
	movl	-304(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	48(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	.loc 3 128 0 discriminator 2
	movsd	-32(%rbp), %xmm1
	movq	part(%rip), %rax
	movl	-304(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	32(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	.loc 3 129 0 discriminator 2
	movsd	-24(%rbp), %xmm1
	movq	part(%rip), %rax
	movl	-304(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	40(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	.loc 3 130 0 discriminator 2
	movsd	-16(%rbp), %xmm1
	movq	part(%rip), %rax
	movl	-304(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	48(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	.loc 3 123 0 discriminator 2
	addl	$1, -304(%rbp)
.L77:
	.loc 3 123 0 is_stmt 0 discriminator 1
	cvtsi2sd	-304(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L78
	.loc 3 133 0 is_stmt 1
	movsd	-64(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 3 134 0
	movsd	-56(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	.loc 3 135 0
	movsd	-48(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	.loc 3 136 0
	movsd	-32(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	.loc 3 137 0
	movsd	-24(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	.loc 3 138 0
	movsd	-16(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	.loc 3 140 0
	movq	-64(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC49, %edi
	movl	$1, %eax
	call	printf
	.loc 3 141 0
	movq	-56(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC50, %edi
	movl	$1, %eax
	call	printf
	.loc 3 142 0
	movq	-48(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC51, %edi
	movl	$1, %eax
	call	printf
	.loc 3 143 0
	movq	-32(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC52, %edi
	movl	$1, %eax
	call	printf
	.loc 3 144 0
	movq	-24(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC53, %edi
	movl	$1, %eax
	call	printf
	.loc 3 145 0
	movq	-16(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC54, %edi
	movl	$1, %eax
	call	printf
	.loc 3 147 0
	movsd	-32(%rbp), %xmm1
	movsd	-32(%rbp), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	-24(%rbp), %xmm2
	movsd	-24(%rbp), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movsd	-16(%rbp), %xmm2
	movsd	-16(%rbp), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	call	sqrt
	movsd	%xmm0, -328(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, -224(%rbp)
	.loc 3 148 0
	movq	-224(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC55, %edi
	movl	$1, %eax
	call	printf
	.loc 3 152 0
	movl	$0, -304(%rbp)
	jmp	.L79
.L98:
	.loc 3 153 0
	movl	$0, -300(%rbp)
	jmp	.L80
.L97:
	.loc 3 154 0
	movl	$0, -296(%rbp)
	jmp	.L81
.L96:
	.loc 3 157 0
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-304(%rbp), %eax
	movl	%eax, %ecx
	movl	-300(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-296(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -272(%rbp)
	.loc 3 160 0
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-304(%rbp), %xmm0
	movsd	.LC56(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -216(%rbp)
	.loc 3 161 0
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-300(%rbp), %xmm0
	movsd	.LC56(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -208(%rbp)
	.loc 3 162 0
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-296(%rbp), %xmm0
	movsd	.LC56(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -200(%rbp)
	.loc 3 165 0
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -268(%rbp)
	.loc 3 176 0
	movl	$0, -292(%rbp)
	jmp	.L82
.L95:
	.loc 3 178 0
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movl	-292(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	%eax, -264(%rbp)
	.loc 3 181 0
	movq	part(%rip), %rax
	movl	-264(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movq	%rax, -192(%rbp)
	.loc 3 182 0
	movq	part(%rip), %rax
	movl	-264(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	16(%rax), %rax
	movq	%rax, -184(%rbp)
	.loc 3 183 0
	movq	part(%rip), %rax
	movl	-264(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	24(%rax), %rax
	movq	%rax, -176(%rbp)
	.loc 3 186 0
	movq	part(%rip), %rax
	movl	-264(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	32(%rax), %rax
	movq	%rax, -168(%rbp)
	.loc 3 187 0
	movq	part(%rip), %rax
	movl	-264(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	40(%rax), %rax
	movq	%rax, -160(%rbp)
	.loc 3 188 0
	movq	part(%rip), %rax
	movl	-264(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	48(%rax), %rax
	movq	%rax, -152(%rbp)
	.loc 3 204 0
	movl	$-1, -288(%rbp)
	jmp	.L83
.L94:
	.loc 3 205 0
	movl	$-1, -284(%rbp)
	jmp	.L84
.L93:
	.loc 3 206 0
	movl	$-1, -280(%rbp)
	jmp	.L85
.L92:
	.loc 3 216 0
	movl	-288(%rbp), %eax
	movl	-304(%rbp), %edx
	addl	%edx, %eax
	testl	%eax, %eax
	js	.L86
	.loc 3 216 0 is_stmt 0 discriminator 1
	movl	-288(%rbp), %eax
	movl	-304(%rbp), %edx
	addl	%eax, %edx
	movl	GV(%rip), %eax
	cmpl	%eax, %edx
	jle	.L87
.L86:
	.loc 3 218 0 is_stmt 1
	movl	$0, -288(%rbp)
.L87:
	.loc 3 221 0
	movl	-284(%rbp), %eax
	movl	-300(%rbp), %edx
	addl	%edx, %eax
	testl	%eax, %eax
	js	.L88
	.loc 3 221 0 is_stmt 0 discriminator 1
	movl	-288(%rbp), %eax
	movl	-304(%rbp), %edx
	addl	%eax, %edx
	movl	GV(%rip), %eax
	cmpl	%eax, %edx
	jle	.L89
.L88:
	.loc 3 223 0 is_stmt 1
	movl	$0, -284(%rbp)
.L89:
	.loc 3 226 0
	movl	-280(%rbp), %eax
	movl	-296(%rbp), %edx
	addl	%edx, %eax
	testl	%eax, %eax
	js	.L90
	.loc 3 226 0 is_stmt 0 discriminator 1
	movl	-288(%rbp), %eax
	movl	-304(%rbp), %edx
	addl	%eax, %edx
	movl	GV(%rip), %eax
	cmpl	%eax, %edx
	jle	.L91
.L90:
	.loc 3 228 0 is_stmt 1
	movl	$0, -280(%rbp)
.L91:
	.loc 3 230 0
	movl	-280(%rbp), %eax
	movl	-296(%rbp), %edx
	leal	(%rdx,%rax), %edi
	movl	GV(%rip), %eax
	movl	-284(%rbp), %edx
	movl	-300(%rbp), %ecx
	leal	(%rcx,%rdx), %r8d
	movl	GV(%rip), %edx
	movl	-288(%rbp), %ecx
	movl	-304(%rbp), %esi
	addl	%esi, %ecx
	imull	%ecx, %edx
	addl	%r8d, %edx
	imull	%edx, %eax
	addl	%edi, %eax
	movl	%eax, -260(%rbp)
	.loc 3 231 0
	movsd	GV+56(%rip), %xmm2
	cvtsi2sd	-304(%rbp), %xmm0
	movsd	.LC56(%rip), %xmm1
	addsd	%xmm0, %xmm1
	cvtsi2sd	-288(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, -216(%rbp)
	.loc 3 232 0
	movsd	GV+56(%rip), %xmm2
	cvtsi2sd	-300(%rbp), %xmm0
	movsd	.LC56(%rip), %xmm1
	addsd	%xmm0, %xmm1
	cvtsi2sd	-284(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, -208(%rbp)
	.loc 3 233 0
	movsd	GV+56(%rip), %xmm2
	cvtsi2sd	-296(%rbp), %xmm0
	movsd	.LC56(%rip), %xmm1
	addsd	%xmm0, %xmm1
	cvtsi2sd	-280(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, -200(%rbp)
	.loc 3 236 0
	movq	GV+56(%rip), %rax
	movsd	-200(%rbp), %xmm0
	movapd	%xmm0, %xmm2
	subsd	-176(%rbp), %xmm2
	movsd	-208(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	subsd	-184(%rbp), %xmm1
	movsd	-216(%rbp), %xmm0
	subsd	-192(%rbp), %xmm0
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm3
	call	W
	movsd	%xmm0, -328(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, -144(%rbp)
	.loc 3 237 0
	movq	cells(%rip), %rdx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	48(%rax), %xmm1
	movsd	GV+40(%rip), %xmm0
	mulsd	-144(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 48(%rdx)
	.loc 3 245 0
	movq	cells(%rip), %rdx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	56(%rax), %xmm1
	movsd	-168(%rbp), %xmm0
	mulsd	-144(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 56(%rdx)
	.loc 3 246 0
	movq	cells(%rip), %rdx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	64(%rax), %xmm1
	movsd	-160(%rbp), %xmm0
	mulsd	-144(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 64(%rdx)
	.loc 3 247 0
	movq	cells(%rip), %rdx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	72(%rax), %xmm1
	movsd	-152(%rbp), %xmm0
	mulsd	-144(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 72(%rdx)
	.loc 3 248 0
	movq	cells(%rip), %rdx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-260(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	80(%rax), %xmm0
	addsd	-144(%rbp), %xmm0
	movsd	%xmm0, 80(%rdx)
	.loc 3 206 0
	addl	$1, -280(%rbp)
.L85:
	.loc 3 206 0 is_stmt 0 discriminator 1
	cmpl	$1, -280(%rbp)
	jle	.L92
	.loc 3 205 0 is_stmt 1
	addl	$1, -284(%rbp)
.L84:
	.loc 3 205 0 is_stmt 0 discriminator 1
	cmpl	$1, -284(%rbp)
	jle	.L93
	.loc 3 204 0 is_stmt 1
	addl	$1, -288(%rbp)
.L83:
	.loc 3 204 0 is_stmt 0 discriminator 1
	cmpl	$1, -288(%rbp)
	jle	.L94
	.loc 3 176 0 is_stmt 1
	addl	$1, -292(%rbp)
.L82:
	.loc 3 176 0 is_stmt 0 discriminator 1
	movl	-292(%rbp), %eax
	cmpl	-268(%rbp), %eax
	jl	.L95
	.loc 3 154 0 is_stmt 1
	addl	$1, -296(%rbp)
.L81:
	.loc 3 154 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-296(%rbp), %eax
	jg	.L96
	.loc 3 153 0 is_stmt 1
	addl	$1, -300(%rbp)
.L80:
	.loc 3 153 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-300(%rbp), %eax
	jg	.L97
	.loc 3 152 0 is_stmt 1
	addl	$1, -304(%rbp)
.L79:
	.loc 3 152 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-304(%rbp), %eax
	jg	.L98
	.loc 3 284 0 is_stmt 1
	movsd	GV+1088(%rip), %xmm1
	movl	GV+24(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	movsd	GV+16(%rip), %xmm2
	divsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -136(%rbp)
	.loc 3 285 0
	movl	$0, -304(%rbp)
	jmp	.L99
.L104:
	.loc 3 286 0
	movl	$0, -300(%rbp)
	jmp	.L100
.L103:
	.loc 3 287 0
	movl	$0, -296(%rbp)
	jmp	.L101
.L102:
	.loc 3 289 0 discriminator 2
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-304(%rbp), %eax
	movl	%eax, %ecx
	movl	-300(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-296(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -272(%rbp)
	.loc 3 300 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	56(%rax), %xmm0
	mulsd	-136(%rbp), %xmm0
	movsd	%xmm0, 56(%rdx)
	.loc 3 301 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	64(%rax), %xmm0
	mulsd	-136(%rbp), %xmm0
	movsd	%xmm0, 64(%rdx)
	.loc 3 302 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	72(%rax), %xmm0
	mulsd	-136(%rbp), %xmm0
	movsd	%xmm0, 72(%rdx)
	.loc 3 305 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	48(%rax), %xmm0
	movsd	GV+48(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 48(%rdx)
	.loc 3 287 0 discriminator 2
	addl	$1, -296(%rbp)
.L101:
	.loc 3 287 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-296(%rbp), %eax
	jg	.L102
	.loc 3 286 0 is_stmt 1
	addl	$1, -300(%rbp)
.L100:
	.loc 3 286 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-300(%rbp), %eax
	jg	.L103
	.loc 3 285 0 is_stmt 1
	addl	$1, -304(%rbp)
.L99:
	.loc 3 285 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-304(%rbp), %eax
	jg	.L104
	.loc 3 309 0 is_stmt 1
	movq	-136(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC57, %edi
	movl	$1, %eax
	call	printf
	.loc 3 314 0
	movl	$0, %eax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -128(%rbp)
	.loc 3 315 0
	movl	$0, %eax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -96(%rbp)
	.loc 3 316 0
	movl	$.LC58, %edi
	call	puts
	.loc 3 319 0
	movl	$0, -304(%rbp)
	jmp	.L105
.L110:
	.loc 3 321 0
	movl	$0, -300(%rbp)
	jmp	.L106
.L109:
	.loc 3 323 0
	movl	$0, -296(%rbp)
	jmp	.L107
.L108:
	.loc 3 326 0 discriminator 2
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-304(%rbp), %eax
	movl	%eax, %ecx
	movl	-300(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-296(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -272(%rbp)
	.loc 3 329 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-304(%rbp), %xmm0
	movsd	.LC56(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 88(%rax)
	.loc 3 330 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-300(%rbp), %xmm0
	movsd	.LC56(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 96(%rax)
	.loc 3 331 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-296(%rbp), %xmm0
	movsd	.LC56(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 104(%rax)
	.loc 3 334 0 discriminator 2
	movsd	GV+48(%rip), %xmm1
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	48(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-256(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	.loc 3 338 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	%eax, -276(%rbp)
	.loc 3 339 0 discriminator 2
	movsd	-96(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	16(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 3 340 0 discriminator 2
	movsd	-88(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 3 341 0 discriminator 2
	movsd	-80(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	32(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	.loc 3 342 0 discriminator 2
	movsd	-128(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	56(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)
	.loc 3 343 0 discriminator 2
	movsd	-120(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	64(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -120(%rbp)
	.loc 3 344 0 discriminator 2
	movsd	-112(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	72(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -112(%rbp)
	.loc 3 347 0 discriminator 2
	movq	cells(%rip), %rdx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-272(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	48(%rax), %xmm0
	movsd	GV+32(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	.LC23(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, 40(%rdx)
	.loc 3 323 0 discriminator 2
	addl	$1, -296(%rbp)
.L107:
	.loc 3 323 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-296(%rbp), %eax
	jg	.L108
	.loc 3 321 0 is_stmt 1
	addl	$1, -300(%rbp)
.L106:
	.loc 3 321 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-300(%rbp), %eax
	jg	.L109
	.loc 3 319 0 is_stmt 1
	addl	$1, -304(%rbp)
.L105:
	.loc 3 319 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-304(%rbp), %eax
	jg	.L110
	.loc 3 367 0 is_stmt 1
	movl	$.LC59, %edi
	call	puts
	.loc 3 368 0
	call	write_binary
	.loc 3 372 0
	movl	-276(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC60, %edi
	movl	$0, %eax
	call	printf
	.loc 3 373 0
	movq	-256(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC61, %edi
	movl	$1, %eax
	call	printf
	.loc 3 374 0
	movsd	GV+16(%rip), %xmm1
	movsd	GV+40(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movl	$.LC62, %edi
	movl	$1, %eax
	call	printf
	.loc 3 375 0
	movq	-128(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC63, %edi
	movl	$1, %eax
	call	printf
	.loc 3 376 0
	movq	-120(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC64, %edi
	movl	$1, %eax
	call	printf
	.loc 3 377 0
	movq	-112(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC65, %edi
	movl	$1, %eax
	call	printf
	.loc 3 378 0
	movq	-96(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC66, %edi
	movl	$1, %eax
	call	printf
	.loc 3 379 0
	movq	-88(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC67, %edi
	movl	$1, %eax
	call	printf
	.loc 3 380 0
	movq	-80(%rbp), %rax
	movq	%rax, -328(%rbp)
	movsd	-328(%rbp), %xmm0
	movl	$.LC68, %edi
	movl	$1, %eax
	call	printf
	.loc 3 383 0
	movq	part(%rip), %rax
	movq	%rax, %rdi
	call	free
	.loc 3 384 0
	movq	cells(%rip), %rax
	movq	%rax, %rdi
	call	free
	.loc 3 386 0
	movl	$0, %eax
	.loc 3 387 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	4290772992
	.long	1105199103
	.align 16
.LC22:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC23:
	.long	0
	.long	1072693248
	.align 8
.LC37:
	.long	0
	.long	1078198272
	.align 8
.LC56:
	.long	0
	.long	1071644672
	.text
.Letext0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/libio.h"
	.file 8 "structures.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xbe3
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF137
	.byte	0x1
	.long	.LASF138
	.long	.LASF139
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x4
	.byte	0xd4
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x5
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x5
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x6
	.byte	0x30
	.long	0xa7
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x7
	.byte	0xf5
	.long	0x227
	.uleb128 0x8
	.long	.LASF13
	.byte	0x7
	.byte	0xf6
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x7
	.byte	0xfb
	.long	0x8f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x7
	.byte	0xfc
	.long	0x8f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x7
	.byte	0xfd
	.long	0x8f
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x7
	.byte	0xfe
	.long	0x8f
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x7
	.byte	0xff
	.long	0x8f
	.byte	0x28
	.uleb128 0x9
	.long	.LASF19
	.byte	0x7
	.value	0x100
	.long	0x8f
	.byte	0x30
	.uleb128 0x9
	.long	.LASF20
	.byte	0x7
	.value	0x101
	.long	0x8f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF21
	.byte	0x7
	.value	0x102
	.long	0x8f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x7
	.value	0x104
	.long	0x8f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x7
	.value	0x105
	.long	0x8f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x7
	.value	0x106
	.long	0x8f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x7
	.value	0x108
	.long	0x25f
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x7
	.value	0x10a
	.long	0x265
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x7
	.value	0x10c
	.long	0x62
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x7
	.value	0x110
	.long	0x62
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x7
	.value	0x112
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x7
	.value	0x116
	.long	0x46
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x7
	.value	0x117
	.long	0x54
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x7
	.value	0x118
	.long	0x26b
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x7
	.value	0x11c
	.long	0x27b
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x7
	.value	0x125
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x7
	.value	0x12e
	.long	0x8d
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x7
	.value	0x12f
	.long	0x8d
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x7
	.value	0x130
	.long	0x8d
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x7
	.value	0x131
	.long	0x8d
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x7
	.value	0x132
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x7
	.value	0x134
	.long	0x62
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x7
	.value	0x136
	.long	0x281
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF140
	.byte	0x7
	.byte	0x9a
	.uleb128 0x7
	.long	.LASF43
	.byte	0x18
	.byte	0x7
	.byte	0xa0
	.long	0x25f
	.uleb128 0x8
	.long	.LASF44
	.byte	0x7
	.byte	0xa1
	.long	0x25f
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x7
	.byte	0xa2
	.long	0x265
	.byte	0x8
	.uleb128 0x8
	.long	.LASF46
	.byte	0x7
	.byte	0xa6
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22e
	.uleb128 0x6
	.byte	0x8
	.long	0xa7
	.uleb128 0xb
	.long	0x95
	.long	0x27b
	.uleb128 0xc
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x227
	.uleb128 0xb
	.long	0x95
	.long	0x291
	.uleb128 0xc
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF48
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF49
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF50
	.uleb128 0xd
	.long	.LASF51
	.value	0x450
	.byte	0x8
	.byte	0x7
	.long	0x365
	.uleb128 0x8
	.long	.LASF52
	.byte	0x8
	.byte	0x8
	.long	0x62
	.byte	0
	.uleb128 0xe
	.string	"L"
	.byte	0x8
	.byte	0x9
	.long	0x2a6
	.byte	0x8
	.uleb128 0x8
	.long	.LASF53
	.byte	0x8
	.byte	0xa
	.long	0x2a6
	.byte	0x10
	.uleb128 0x8
	.long	.LASF54
	.byte	0x8
	.byte	0xb
	.long	0x62
	.byte	0x18
	.uleb128 0x8
	.long	.LASF55
	.byte	0x8
	.byte	0xc
	.long	0x2a6
	.byte	0x20
	.uleb128 0x8
	.long	.LASF56
	.byte	0x8
	.byte	0xd
	.long	0x2a6
	.byte	0x28
	.uleb128 0x8
	.long	.LASF57
	.byte	0x8
	.byte	0xe
	.long	0x2a6
	.byte	0x30
	.uleb128 0xe
	.string	"dx"
	.byte	0x8
	.byte	0xf
	.long	0x2a6
	.byte	0x38
	.uleb128 0x8
	.long	.LASF58
	.byte	0x8
	.byte	0x10
	.long	0x365
	.byte	0x40
	.uleb128 0xf
	.long	.LASF59
	.byte	0x8
	.byte	0x13
	.long	0x2a6
	.value	0x428
	.uleb128 0xf
	.long	.LASF60
	.byte	0x8
	.byte	0x14
	.long	0x2a6
	.value	0x430
	.uleb128 0x10
	.string	"zRS"
	.byte	0x8
	.byte	0x15
	.long	0x2a6
	.value	0x438
	.uleb128 0x10
	.string	"aSF"
	.byte	0x8
	.byte	0x16
	.long	0x2a6
	.value	0x440
	.uleb128 0xf
	.long	.LASF61
	.byte	0x8
	.byte	0x17
	.long	0x2a6
	.value	0x448
	.byte	0
	.uleb128 0xb
	.long	0x95
	.long	0x376
	.uleb128 0x11
	.long	0x86
	.value	0x3e7
	.byte	0
	.uleb128 0x7
	.long	.LASF62
	.byte	0x40
	.byte	0x8
	.byte	0x1c
	.long	0x3e2
	.uleb128 0xe
	.string	"id"
	.byte	0x8
	.byte	0x1d
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.long	.LASF63
	.byte	0x8
	.byte	0x1f
	.long	0x2a6
	.byte	0x8
	.uleb128 0x8
	.long	.LASF64
	.byte	0x8
	.byte	0x20
	.long	0x2a6
	.byte	0x10
	.uleb128 0x8
	.long	.LASF65
	.byte	0x8
	.byte	0x21
	.long	0x2a6
	.byte	0x18
	.uleb128 0x8
	.long	.LASF66
	.byte	0x8
	.byte	0x23
	.long	0x2a6
	.byte	0x20
	.uleb128 0x8
	.long	.LASF67
	.byte	0x8
	.byte	0x24
	.long	0x2a6
	.byte	0x28
	.uleb128 0x8
	.long	.LASF68
	.byte	0x8
	.byte	0x25
	.long	0x2a6
	.byte	0x30
	.uleb128 0x8
	.long	.LASF56
	.byte	0x8
	.byte	0x27
	.long	0x2a6
	.byte	0x38
	.byte	0
	.uleb128 0xd
	.long	.LASF69
	.value	0x100
	.byte	0x8
	.byte	0x2b
	.long	0x498
	.uleb128 0x8
	.long	.LASF70
	.byte	0x8
	.byte	0x2c
	.long	0x498
	.byte	0
	.uleb128 0x8
	.long	.LASF56
	.byte	0x8
	.byte	0x2d
	.long	0x4a8
	.byte	0x18
	.uleb128 0x8
	.long	.LASF71
	.byte	0x8
	.byte	0x2e
	.long	0x2a6
	.byte	0x48
	.uleb128 0x8
	.long	.LASF72
	.byte	0x8
	.byte	0x2f
	.long	0x2a6
	.byte	0x50
	.uleb128 0x8
	.long	.LASF73
	.byte	0x8
	.byte	0x30
	.long	0x62
	.byte	0x58
	.uleb128 0x8
	.long	.LASF74
	.byte	0x8
	.byte	0x31
	.long	0x62
	.byte	0x5c
	.uleb128 0x8
	.long	.LASF75
	.byte	0x8
	.byte	0x32
	.long	0x498
	.byte	0x60
	.uleb128 0x8
	.long	.LASF76
	.byte	0x8
	.byte	0x33
	.long	0x62
	.byte	0x78
	.uleb128 0x8
	.long	.LASF77
	.byte	0x8
	.byte	0x34
	.long	0x62
	.byte	0x7c
	.uleb128 0x8
	.long	.LASF78
	.byte	0x8
	.byte	0x35
	.long	0x2a6
	.byte	0x80
	.uleb128 0x8
	.long	.LASF79
	.byte	0x8
	.byte	0x36
	.long	0x2a6
	.byte	0x88
	.uleb128 0x8
	.long	.LASF80
	.byte	0x8
	.byte	0x37
	.long	0x2a6
	.byte	0x90
	.uleb128 0x8
	.long	.LASF61
	.byte	0x8
	.byte	0x38
	.long	0x2a6
	.byte	0x98
	.uleb128 0x8
	.long	.LASF81
	.byte	0x8
	.byte	0x39
	.long	0x4b8
	.byte	0xa0
	.byte	0
	.uleb128 0xb
	.long	0x62
	.long	0x4a8
	.uleb128 0xc
	.long	0x86
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.long	0x2a6
	.long	0x4b8
	.uleb128 0xc
	.long	0x86
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.long	0x95
	.long	0x4c8
	.uleb128 0xc
	.long	0x86
	.byte	0x5f
	.byte	0
	.uleb128 0x7
	.long	.LASF82
	.byte	0x70
	.byte	0x8
	.byte	0x3d
	.long	0x54d
	.uleb128 0x8
	.long	.LASF83
	.byte	0x8
	.byte	0x3e
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF84
	.byte	0x8
	.byte	0x3f
	.long	0x54d
	.byte	0x8
	.uleb128 0x8
	.long	.LASF66
	.byte	0x8
	.byte	0x40
	.long	0x2a6
	.byte	0x10
	.uleb128 0x8
	.long	.LASF67
	.byte	0x8
	.byte	0x41
	.long	0x2a6
	.byte	0x18
	.uleb128 0x8
	.long	.LASF68
	.byte	0x8
	.byte	0x42
	.long	0x2a6
	.byte	0x20
	.uleb128 0x8
	.long	.LASF85
	.byte	0x8
	.byte	0x43
	.long	0x2a6
	.byte	0x28
	.uleb128 0xe
	.string	"rho"
	.byte	0x8
	.byte	0x44
	.long	0x2a6
	.byte	0x30
	.uleb128 0x8
	.long	.LASF86
	.byte	0x8
	.byte	0x45
	.long	0x553
	.byte	0x38
	.uleb128 0x8
	.long	.LASF87
	.byte	0x8
	.byte	0x4c
	.long	0x2a6
	.byte	0x50
	.uleb128 0xe
	.string	"pos"
	.byte	0x8
	.byte	0x4d
	.long	0x553
	.byte	0x58
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x69
	.uleb128 0xb
	.long	0x2a6
	.long	0x563
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0x12
	.long	.LASF98
	.byte	0x1
	.byte	0xc
	.long	0x2a6
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x5a1
	.uleb128 0x13
	.long	.LASF99
	.byte	0x1
	.byte	0xc
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.long	.LASF88
	.byte	0x1
	.byte	0xe
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF100
	.byte	0x1
	.byte	0x13
	.long	0x62
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x65c
	.uleb128 0x14
	.long	.LASF89
	.byte	0x1
	.byte	0x15
	.long	0x65c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x16
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x16
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x14
	.long	.LASF90
	.byte	0x1
	.byte	0x17
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x14
	.long	.LASF91
	.byte	0x1
	.byte	0x17
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x14
	.long	.LASF92
	.byte	0x1
	.byte	0x17
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.long	.LASF93
	.byte	0x1
	.byte	0x17
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x14
	.long	.LASF94
	.byte	0x1
	.byte	0x17
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.long	.LASF95
	.byte	0x1
	.byte	0x18
	.long	0x29f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x14
	.long	.LASF96
	.byte	0x1
	.byte	0x18
	.long	0x662
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.long	.LASF97
	.byte	0x1
	.byte	0x19
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0xb
	.long	0x29f
	.long	0x672
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0x17
	.string	"W"
	.byte	0x1
	.byte	0xa7
	.long	0x2a6
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x6eb
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0xa7
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0xa7
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.string	"z"
	.byte	0x1
	.byte	0xa7
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x18
	.string	"H"
	.byte	0x1
	.byte	0xa7
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x16
	.string	"Wx"
	.byte	0x1
	.byte	0xa8
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.string	"Wy"
	.byte	0x1
	.byte	0xa8
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.string	"Wz"
	.byte	0x1
	.byte	0xa8
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.long	.LASF101
	.byte	0x1
	.value	0x136
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x789
	.uleb128 0x1a
	.string	"xp"
	.byte	0x1
	.value	0x136
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.string	"yp"
	.byte	0x1
	.value	0x136
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1a
	.string	"zp"
	.byte	0x1
	.value	0x136
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1b
	.long	.LASF102
	.byte	0x1
	.value	0x136
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1b
	.long	.LASF103
	.byte	0x1
	.value	0x136
	.long	0x789
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x13a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.string	"j"
	.byte	0x1
	.value	0x13a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.string	"k"
	.byte	0x1
	.value	0x13a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.string	"n"
	.byte	0x1
	.value	0x13a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4c8
	.uleb128 0x1d
	.string	"mod"
	.byte	0x1
	.value	0x157
	.long	0x62
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x7db
	.uleb128 0x1a
	.string	"a"
	.byte	0x1
	.value	0x157
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.string	"b"
	.byte	0x1
	.value	0x157
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.string	"mod"
	.byte	0x1
	.value	0x159
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.long	.LASF104
	.byte	0x2
	.byte	0x3
	.long	0x62
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x81b
	.uleb128 0x13
	.long	.LASF105
	.byte	0x2
	.byte	0x3
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1048
	.uleb128 0x16
	.string	"cmd"
	.byte	0x2
	.byte	0x5
	.long	0x365
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1040
	.byte	0
	.uleb128 0x12
	.long	.LASF106
	.byte	0x2
	.byte	0x1c
	.long	0x62
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x879
	.uleb128 0x13
	.long	.LASF105
	.byte	0x2
	.byte	0x1c
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2056
	.uleb128 0x16
	.string	"cmd"
	.byte	0x2
	.byte	0x1e
	.long	0x365
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2032
	.uleb128 0x14
	.long	.LASF107
	.byte	0x2
	.byte	0x1e
	.long	0x365
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1024
	.uleb128 0x14
	.long	.LASF108
	.byte	0x2
	.byte	0x1f
	.long	0x65c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2040
	.byte	0
	.uleb128 0x12
	.long	.LASF109
	.byte	0x2
	.byte	0x4d
	.long	0x62
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x8df
	.uleb128 0x16
	.string	"i"
	.byte	0x2
	.byte	0x4f
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x1e
	.long	.LASF94
	.byte	0x2
	.byte	0x4f
	.long	0x62
	.uleb128 0x14
	.long	.LASF110
	.byte	0x2
	.byte	0x50
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x14
	.long	.LASF111
	.byte	0x2
	.byte	0x51
	.long	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.long	.LASF112
	.byte	0x2
	.byte	0x52
	.long	0x65c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x12
	.long	.LASF113
	.byte	0x2
	.byte	0x7f
	.long	0x62
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x954
	.uleb128 0x16
	.string	"i"
	.byte	0x2
	.byte	0x81
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1e
	.long	.LASF94
	.byte	0x2
	.byte	0x81
	.long	0x62
	.uleb128 0x14
	.long	.LASF110
	.byte	0x2
	.byte	0x82
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x14
	.long	.LASF111
	.byte	0x2
	.byte	0x83
	.long	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.long	.LASF112
	.byte	0x2
	.byte	0x84
	.long	0x65c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x14
	.long	.LASF114
	.byte	0x2
	.byte	0x85
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.uleb128 0x12
	.long	.LASF115
	.byte	0x3
	.byte	0x10
	.long	0x62
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0xb87
	.uleb128 0x13
	.long	.LASF116
	.byte	0x3
	.byte	0x10
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -324
	.uleb128 0x13
	.long	.LASF117
	.byte	0x3
	.byte	0x10
	.long	0xb87
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x16
	.string	"i"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x16
	.string	"j"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -316
	.uleb128 0x16
	.string	"k"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0x16
	.string	"l"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -308
	.uleb128 0x14
	.long	.LASF118
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x14
	.long	.LASF119
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -276
	.uleb128 0x16
	.string	"Np"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x14
	.long	.LASF120
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x16
	.string	"ii"
	.byte	0x3
	.byte	0x13
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x16
	.string	"jj"
	.byte	0x3
	.byte	0x13
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -300
	.uleb128 0x16
	.string	"kk"
	.byte	0x3
	.byte	0x13
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0x16
	.string	"xc"
	.byte	0x3
	.byte	0x14
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x16
	.string	"yc"
	.byte	0x3
	.byte	0x14
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x16
	.string	"zc"
	.byte	0x3
	.byte	0x14
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x16
	.string	"xp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x16
	.string	"yp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x16
	.string	"zp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x16
	.string	"vxp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x16
	.string	"vyp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x16
	.string	"vzp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1e
	.long	.LASF121
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x14
	.long	.LASF122
	.byte	0x3
	.byte	0x16
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x14
	.long	.LASF123
	.byte	0x3
	.byte	0x17
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x14
	.long	.LASF124
	.byte	0x3
	.byte	0x18
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x16
	.string	"pf"
	.byte	0x3
	.byte	0x19
	.long	0x65c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x14
	.long	.LASF125
	.byte	0x3
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x14
	.long	.LASF126
	.byte	0x3
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x14
	.long	.LASF127
	.byte	0x3
	.byte	0x1c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -292
	.uleb128 0x14
	.long	.LASF128
	.byte	0x3
	.byte	0x1d
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x14
	.long	.LASF129
	.byte	0x3
	.byte	0x1d
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x14
	.long	.LASF130
	.byte	0x3
	.byte	0x1d
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x14
	.long	.LASF131
	.byte	0x3
	.byte	0x1e
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x14
	.long	.LASF132
	.byte	0x3
	.byte	0x1e
	.long	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.long	.LASF133
	.byte	0x3
	.byte	0x1f
	.long	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.long	.LASF134
	.byte	0x3
	.byte	0x1f
	.long	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8f
	.uleb128 0x1f
	.string	"GV"
	.byte	0x8
	.byte	0x19
	.long	0x2ad
	.uleb128 0x9
	.byte	0x3
	.quad	GV
	.uleb128 0x20
	.long	.LASF135
	.byte	0x8
	.byte	0x28
	.long	0xbb6
	.uleb128 0x9
	.byte	0x3
	.quad	part
	.uleb128 0x6
	.byte	0x8
	.long	0x376
	.uleb128 0x20
	.long	.LASF136
	.byte	0x8
	.byte	0x3b
	.long	0x3e2
	.uleb128 0x9
	.byte	0x3
	.quad	Header
	.uleb128 0x20
	.long	.LASF103
	.byte	0x8
	.byte	0x4e
	.long	0x789
	.uleb128 0x9
	.byte	0x3
	.quad	cells
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF61:
	.string	"HubbleParam"
.LASF69:
	.string	"gadget_head"
.LASF32:
	.string	"_shortbuf"
.LASF140:
	.string	"_IO_lock_t"
.LASF86:
	.string	"momentum_p"
.LASF83:
	.string	"Np_cell"
.LASF21:
	.string	"_IO_buf_end"
.LASF72:
	.string	"redshift"
.LASF19:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF13:
	.string	"_flags"
.LASF126:
	.string	"totMassCIC"
.LASF53:
	.string	"NpTot"
.LASF93:
	.string	"dummy"
.LASF110:
	.string	"pos_aux"
.LASF52:
	.string	"NGRID"
.LASF25:
	.string	"_markers"
.LASF137:
	.string	"GNU C 4.8.4 -mtune=generic -march=x86-64 -g -fstack-protector"
.LASF84:
	.string	"id_part"
.LASF112:
	.string	"outFile"
.LASF88:
	.string	"scaled"
.LASF121:
	.string	"vmod"
.LASF97:
	.string	"uintaux"
.LASF135:
	.string	"part"
.LASF130:
	.string	"sumaVelModule"
.LASF46:
	.string	"_pos"
.LASF136:
	.string	"Header"
.LASF24:
	.string	"_IO_save_end"
.LASF49:
	.string	"float"
.LASF118:
	.string	"index"
.LASF129:
	.string	"sumaVel"
.LASF48:
	.string	"long long unsigned int"
.LASF108:
	.string	"file"
.LASF55:
	.string	"rhoMean"
.LASF81:
	.string	"fill"
.LASF95:
	.string	"Maux"
.LASF60:
	.string	"OmegaL0"
.LASF138:
	.string	"CIC_noperiodic.c"
.LASF89:
	.string	"fdata"
.LASF34:
	.string	"_offset"
.LASF71:
	.string	"time"
.LASF100:
	.string	"readGADGETBinaryFile"
.LASF78:
	.string	"BoxSize"
.LASF27:
	.string	"_fileno"
.LASF76:
	.string	"flag_cooling"
.LASF85:
	.string	"denCon"
.LASF7:
	.string	"size_t"
.LASF128:
	.string	"sumaMom"
.LASF59:
	.string	"OmegaM0"
.LASF16:
	.string	"_IO_read_base"
.LASF116:
	.string	"argc"
.LASF44:
	.string	"_next"
.LASF51:
	.string	"globalVariables"
.LASF98:
	.string	"randr"
.LASF124:
	.string	"infile"
.LASF11:
	.string	"char"
.LASF80:
	.string	"OmegaLambda"
.LASF40:
	.string	"_mode"
.LASF105:
	.string	"filename"
.LASF120:
	.string	"idPart"
.LASF43:
	.string	"_IO_marker"
.LASF14:
	.string	"_IO_read_ptr"
.LASF70:
	.string	"Npart"
.LASF122:
	.string	"Window_fn"
.LASF82:
	.string	"Cell"
.LASF17:
	.string	"_IO_write_base"
.LASF47:
	.string	"long long int"
.LASF58:
	.string	"FILENAME"
.LASF131:
	.string	"sumaMomPart"
.LASF22:
	.string	"_IO_save_base"
.LASF106:
	.string	"read_parameters"
.LASF107:
	.string	"filenamedump"
.LASF134:
	.string	"auxVel"
.LASF139:
	.string	"/home/darivadi/Documents/University/Master/Courses/Investigation_III/Codes_last_version/CIC_code"
.LASF111:
	.string	"momentum_aux"
.LASF23:
	.string	"_IO_backup_base"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF56:
	.string	"mass"
.LASF31:
	.string	"_vtable_offset"
.LASF117:
	.string	"argv"
.LASF133:
	.string	"auxMom"
.LASF15:
	.string	"_IO_read_end"
.LASF5:
	.string	"short int"
.LASF87:
	.string	"W_count"
.LASF96:
	.string	"faux"
.LASF6:
	.string	"long int"
.LASF101:
	.string	"locateCell"
.LASF102:
	.string	"indexPartArray"
.LASF75:
	.string	"npartTotal"
.LASF92:
	.string	"N_max"
.LASF73:
	.string	"flag_sfr"
.LASF103:
	.string	"cells"
.LASF57:
	.string	"volCell"
.LASF74:
	.string	"flag_feedback"
.LASF123:
	.string	"norm_factor"
.LASF33:
	.string	"_lock"
.LASF113:
	.string	"write_binary_parts"
.LASF10:
	.string	"sizetype"
.LASF119:
	.string	"indexaux"
.LASF0:
	.string	"long unsigned int"
.LASF62:
	.string	"particle"
.LASF29:
	.string	"_old_offset"
.LASF42:
	.string	"_IO_FILE"
.LASF54:
	.string	"NGRID3"
.LASF66:
	.string	"velx"
.LASF67:
	.string	"vely"
.LASF68:
	.string	"velz"
.LASF91:
	.string	"N_min"
.LASF109:
	.string	"write_binary"
.LASF127:
	.string	"sumaPart"
.LASF1:
	.string	"unsigned char"
.LASF104:
	.string	"conf2dump"
.LASF45:
	.string	"_sbuf"
.LASF79:
	.string	"Omega0"
.LASF18:
	.string	"_IO_write_ptr"
.LASF132:
	.string	"sumaVelPart"
.LASF63:
	.string	"posx"
.LASF64:
	.string	"posy"
.LASF65:
	.string	"posz"
.LASF8:
	.string	"__off_t"
.LASF94:
	.string	"nread"
.LASF4:
	.string	"signed char"
.LASF114:
	.string	"counter_b"
.LASF2:
	.string	"short unsigned int"
.LASF115:
	.string	"main"
.LASF99:
	.string	"A_range"
.LASF50:
	.string	"double"
.LASF26:
	.string	"_chain"
.LASF12:
	.string	"FILE"
.LASF28:
	.string	"_flags2"
.LASF77:
	.string	"num_files"
.LASF30:
	.string	"_cur_column"
.LASF125:
	.string	"totalMass"
.LASF90:
	.string	"N_tot"
.LASF9:
	.string	"__off64_t"
.LASF41:
	.string	"_unused2"
.LASF20:
	.string	"_IO_buf_base"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
