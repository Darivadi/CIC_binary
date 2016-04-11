	.file	"CIC.c"
	.text
.Ltext0:
	.comm	GV,1104,64
	.comm	part,8,8
	.comm	Header,256,64
	.comm	cells,8,8
	.globl	randr
	.type	randr, @function
randr:
.LFB2:
	.file 1 "functions.h"
	.loc 1 12 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -24(%rbp)
	.loc 1 13 0
	call	rand
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	.loc 1 15 0
	movsd	-24(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	mulsd	-8(%rbp), %xmm0
	subsd	-24(%rbp), %xmm0
	.loc 1 16 0
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
	.loc 1 18 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	.loc 1 19 0
	movq	$0, -32(%rbp)
	.loc 1 21 0
	movl	$0, -36(%rbp)
	.loc 1 25 0
	movl	$.LC1, %edi
	call	puts
	.loc 1 26 0
	movl	$GV+64, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	.loc 1 27 0
	movl	$.LC3, %esi
	movl	$GV+64, %edi
	call	fopen
	movq	%rax, -32(%rbp)
	.loc 1 28 0
	cmpq	$0, -32(%rbp)
	jne	.L4
	.loc 1 29 0
	movl	$GV+64, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.L4:
	.loc 1 32 0
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 33 0
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$256, %esi
	movl	$Header, %edi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 34 0
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 36 0
	movl	$0, -12(%rbp)
	.loc 1 38 0
	movl	$.LC5, %edi
	call	puts
	.loc 1 39 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 40 0
	movl	$.LC5, %edi
	call	puts
	.loc 1 41 0
	movl	$0, -4(%rbp)
	jmp	.L5
.L6:
	.loc 1 42 0 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	addl	%eax, -12(%rbp)
	.loc 1 43 0 discriminator 3
	movl	-4(%rbp), %eax
	cltq
	addq	$2, %rax
	movq	Header+8(,%rax,8), %rsi
	movl	-4(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %ecx
	movl	-4(%rbp), %eax
	cltq
	movl	Header(,%rax,4), %edx
	movl	-4(%rbp), %eax
	movq	%rsi, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$1, %eax
	call	printf
	.loc 1 41 0 discriminator 3
	addl	$1, -4(%rbp)
.L5:
	.loc 1 41 0 is_stmt 0 discriminator 1
	cmpl	$5, -4(%rbp)
	jle	.L6
	.loc 1 47 0 is_stmt 1
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	.loc 1 48 0
	movl	$.LC5, %edi
	call	puts
	.loc 1 49 0
	movq	Header+72(%rip), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC9, %edi
	movl	$1, %eax
	call	printf
	.loc 1 50 0
	movq	Header+80(%rip), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC10, %edi
	movl	$1, %eax
	call	printf
	.loc 1 51 0
	movl	Header+88(%rip), %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	.loc 1 52 0
	movl	Header+92(%rip), %eax
	movl	%eax, %esi
	movl	$.LC12, %edi
	movl	$0, %eax
	call	printf
	.loc 1 53 0
	movl	Header+120(%rip), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	.loc 1 54 0
	movl	Header+124(%rip), %eax
	movl	%eax, %esi
	movl	$.LC14, %edi
	movl	$0, %eax
	call	printf
	.loc 1 55 0
	movq	Header+128(%rip), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC15, %edi
	movl	$1, %eax
	call	printf
	.loc 1 56 0
	movq	Header+136(%rip), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC16, %edi
	movl	$1, %eax
	call	printf
	.loc 1 57 0
	movq	Header+144(%rip), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC17, %edi
	movl	$1, %eax
	call	printf
	.loc 1 58 0
	movq	Header+152(%rip), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC18, %edi
	movl	$1, %eax
	call	printf
	.loc 1 61 0
	movl	-12(%rbp), %eax
	cltq
	movl	$64, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, part(%rip)
	.loc 1 63 0
	movq	part(%rip), %rax
	testq	%rax, %rax
	jne	.L7
	.loc 1 64 0
	movl	$.LC19, %edi
	call	puts
	.loc 1 65 0
	movl	$0, %edi
	call	exit
.L7:
	.loc 1 71 0
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 72 0
	movl	$0, -4(%rbp)
	jmp	.L8
.L9:
	.loc 1 73 0 discriminator 3
	movq	-32(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 74 0 discriminator 3
	movq	part(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movss	-64(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, 8(%rdx)
	.loc 1 75 0 discriminator 3
	movq	part(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movss	-60(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, 16(%rdx)
	.loc 1 76 0 discriminator 3
	movq	part(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movss	-56(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rax
	movq	%rax, 24(%rdx)
	.loc 1 72 0 discriminator 3
	addl	$1, -4(%rbp)
.L8:
	.loc 1 72 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L9
	.loc 1 78 0 is_stmt 1
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 79 0
	movl	-40(%rbp), %eax
	movslq	%eax, %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	cmpq	%rax, %rcx
	je	.L10
	.loc 1 80 0
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	.loc 1 81 0
	movl	$0, %edi
	call	exit
.L10:
	.loc 1 87 0
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 88 0
	movl	$0, -4(%rbp)
	jmp	.L11
.L12:
	.loc 1 89 0 discriminator 3
	movq	-32(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 90 0 discriminator 3
	movq	part(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movss	-64(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rax
	movq	%rax, 32(%rdx)
	.loc 1 91 0 discriminator 3
	movq	part(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movss	-60(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm6
	movq	%xmm6, %rax
	movq	%rax, 40(%rdx)
	.loc 1 92 0 discriminator 3
	movq	part(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movss	-56(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm7
	movq	%xmm7, %rax
	movq	%rax, 48(%rdx)
	.loc 1 88 0 discriminator 3
	addl	$1, -4(%rbp)
.L11:
	.loc 1 88 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L12
	.loc 1 104 0 is_stmt 1
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 105 0
	movl	-40(%rbp), %eax
	movslq	%eax, %rcx
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	cmpq	%rax, %rcx
	je	.L13
	.loc 1 106 0
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	.loc 1 107 0
	movl	$0, %edi
	call	exit
.L13:
	.loc 1 113 0
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 114 0
	movl	$0, -4(%rbp)
	jmp	.L14
.L15:
	.loc 1 115 0 discriminator 3
	movq	-32(%rbp), %rdx
	leaq	-68(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 116 0 discriminator 3
	movq	part(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	-68(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 114 0 discriminator 3
	addl	$1, -4(%rbp)
.L14:
	.loc 1 114 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L15
	.loc 1 119 0 is_stmt 1
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 120 0
	movl	-40(%rbp), %eax
	cltq
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	cmpq	%rdx, %rax
	je	.L16
	.loc 1 121 0
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	.loc 1 122 0
	movl	$0, %edi
	call	exit
.L16:
	.loc 1 128 0
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 129 0
	movl	$0, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	.loc 1 130 0
	movl	$0, -8(%rbp)
	jmp	.L17
.L26:
	.loc 1 131 0
	movl	-8(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	addl	%eax, -20(%rbp)
	.loc 1 132 0
	movl	-8(%rbp), %eax
	cltq
	addq	$2, %rax
	movsd	Header+8(,%rax,8), %xmm0
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L18
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L18
	.loc 1 132 0 is_stmt 0 discriminator 1
	movl	-8(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	testl	%eax, %eax
	je	.L18
	.loc 1 133 0 is_stmt 1
	movl	-16(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L20
.L21:
	.loc 1 134 0 discriminator 3
	movq	-32(%rbp), %rdx
	leaq	-44(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 135 0 discriminator 3
	movq	part(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movss	-44(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, 56(%rdx)
	.loc 1 133 0 discriminator 3
	addl	$1, -4(%rbp)
.L20:
	.loc 1 133 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L21
.L18:
	.loc 1 138 0 is_stmt 1
	movl	-8(%rbp), %eax
	cltq
	addq	$2, %rax
	movsd	Header+8(,%rax,8), %xmm0
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L29
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	je	.L22
.L29:
	.loc 1 138 0 is_stmt 0 discriminator 1
	movl	-8(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	testl	%eax, %eax
	je	.L22
	.loc 1 139 0 is_stmt 1
	movl	-16(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L24
.L25:
	.loc 1 140 0 discriminator 3
	movq	part(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	addq	$2, %rax
	movq	Header+8(,%rax,8), %rax
	movq	%rax, 56(%rdx)
	.loc 1 139 0 discriminator 3
	addl	$1, -4(%rbp)
.L24:
	.loc 1 139 0 is_stmt 0 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L25
.L22:
	.loc 1 143 0 is_stmt 1 discriminator 2
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	.loc 1 130 0 discriminator 2
	addl	$1, -8(%rbp)
.L17:
	.loc 1 130 0 is_stmt 0 discriminator 1
	cmpl	$5, -8(%rbp)
	jle	.L26
	.loc 1 145 0 is_stmt 1
	movq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -36(%rbp)
	.loc 1 146 0
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 1 147 0
	movl	-12(%rbp), %eax
	.loc 1 148 0
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
	.loc 1 165 0
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
	.loc 1 200 0
	movsd	-40(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	-64(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L44
	.loc 1 201 0
	movsd	-40(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	.LC23(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -8(%rbp)
	jmp	.L33
.L44:
	.loc 1 203 0
	movl	$0, %eax
	movq	%rax, -8(%rbp)
.L33:
	.loc 1 206 0
	movsd	-48(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	-64(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L45
	.loc 1 207 0
	movsd	-48(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	.LC23(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -16(%rbp)
	jmp	.L36
.L45:
	.loc 1 209 0
	movl	$0, %eax
	movq	%rax, -16(%rbp)
.L36:
	.loc 1 212 0
	movsd	-56(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	-64(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L46
	.loc 1 213 0
	movsd	-56(%rbp), %xmm1
	movsd	.LC22(%rip), %xmm0
	andpd	%xmm1, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	.LC23(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -24(%rbp)
	jmp	.L39
.L46:
	.loc 1 215 0
	movl	$0, %eax
	movq	%rax, -24(%rbp)
.L39:
	.loc 1 248 0
	movsd	-8(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	.loc 1 254 0
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
	.loc 1 269 0
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
	.loc 1 276 0
	movsd	GV+8(%rip), %xmm1
	movsd	-40(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	GV(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, -20(%rbp)
	.loc 1 278 0
	movsd	GV+8(%rip), %xmm1
	movsd	-48(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	GV(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, -24(%rbp)
	.loc 1 280 0
	movsd	GV+8(%rip), %xmm1
	movsd	-56(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	GV(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, -28(%rbp)
	.loc 1 282 0
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	-24(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -32(%rbp)
	.loc 1 285 0
	movl	-32(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, (%rdx)
	.loc 1 286 0
	movl	-32(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	-72(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-32(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movl	-32(%rbp), %eax
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
	.loc 1 287 0
	movl	-32(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	8(%rax), %rdx
	movl	-32(%rbp), %eax
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
	.loc 1 288 0
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
	.loc 1 302 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	.loc 1 303 0
	movl	-20(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%edx, -4(%rbp)
	.loc 1 304 0
	jmp	.L49
.L50:
	.loc 1 305 0
	movl	-24(%rbp), %eax
	addl	%eax, -4(%rbp)
.L49:
	.loc 1 304 0
	cmpl	$0, -4(%rbp)
	js	.L50
	.loc 1 307 0
	movl	-4(%rbp), %eax
	.loc 1 308 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	mod, .-mod
	.section	.rodata
	.align 8
.LC24:
	.string	"grep -v \"#\" %s | grep -v \"^$\" | gawk -F\"=\" '{print $2}' > %s.dump"
	.text
	.globl	conf2dump
	.type	conf2dump, @function
conf2dump:
.LFB7:
	.file 2 "readWrite.h"
	.loc 2 10 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	.loc 2 12 0
	movq	-120(%rbp), %rcx
	movq	-120(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movl	$.LC24, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 2 15 0
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	system
	.loc 2 17 0
	movl	$0, %eax
	.loc 2 18 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	conf2dump, .-conf2dump
	.section	.rodata
	.align 8
.LC25:
	.string	"  * The file '%s' doesn't exist!\n"
.LC26:
	.string	"%s.dump"
.LC27:
	.string	"%d"
.LC28:
	.string	"%s"
	.align 8
.LC29:
	.string	"  * The file '%s' has been loaded!\n"
.LC30:
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
	subq	$240, %rsp
	movq	%rdi, -232(%rbp)
	.loc 2 34 0
	movq	-232(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	.loc 2 35 0
	cmpq	$0, -8(%rbp)
	jne	.L55
	.loc 2 36 0
	movq	-232(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	.loc 2 37 0
	movl	$1, %eax
	jmp	.L57
.L55:
	.loc 2 38 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 41 0
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	conf2dump
	.loc 2 42 0
	movq	-232(%rbp), %rdx
	leaq	-224(%rbp), %rax
	movl	$.LC26, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 2 43 0
	leaq	-224(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	.loc 2 51 0
	movq	-8(%rbp), %rax
	movl	$GV, %edx
	movl	$.LC27, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 2 52 0
	movq	-8(%rbp), %rax
	movl	$GV+64, %edx
	movl	$.LC28, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 2 54 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 56 0
	movq	-232(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC29, %edi
	movl	$0, %eax
	call	printf
	.loc 2 58 0
	movq	-232(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movl	$.LC30, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 2 59 0
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	system
	.loc 2 61 0
	movl	$0, %eax
.L57:
	.loc 2 62 0 discriminator 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	read_parameters, .-read_parameters
	.section	.rodata
.LC31:
	.string	"w"
	.align 8
.LC32:
	.string	"./../Processed_data/CIC_DenCon_field_256.bin"
	.text
	.globl	write_binary
	.type	write_binary, @function
write_binary:
.LFB9:
	.loc 2 125 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.loc 2 128 0
	movq	$0, -8(%rbp)
	.loc 2 129 0
	movl	$.LC31, %esi
	movl	$.LC32, %edi
	call	fopen
	movq	%rax, -8(%rbp)
	.loc 2 132 0
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+8, %edi
	call	fwrite
	.loc 2 133 0
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1064, %edi
	call	fwrite
	.loc 2 134 0
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1072, %edi
	call	fwrite
	.loc 2 135 0
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1080, %edi
	call	fwrite
	.loc 2 136 0
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1096, %edi
	call	fwrite
	.loc 2 138 0
	movl	$0, -12(%rbp)
	jmp	.L59
.L60:
	.loc 2 140 0 discriminator 3
	movq	-8(%rbp), %rdx
	leaq	-12(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 2 141 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fwrite
	.loc 2 144 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	88(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 2 145 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	96(%rax), %rax
	movq	%rax, -40(%rbp)
	.loc 2 146 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	104(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 2 148 0 discriminator 3
	movq	-8(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$8, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 2 149 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	leaq	40(%rax), %rdi
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	call	fwrite
	.loc 2 138 0 discriminator 3
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
.L59:
	.loc 2 138 0 is_stmt 0 discriminator 1
	movl	GV+24(%rip), %edx
	movl	-12(%rbp), %eax
	cmpl	%eax, %edx
	jg	.L60
	.loc 2 152 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 153 0
	movl	$0, %eax
	.loc 2 154 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	write_binary, .-write_binary
	.section	.rodata
.LC33:
	.string	"./parameters_file.dat"
	.align 8
.LC35:
	.string	"-----------------------------------------------"
.LC36:
	.string	"Cosmological parameters:"
	.align 8
.LC37:
	.string	"OmegaM0=%lf OmegaL0=%lf redshift=%lf HubbleParam=%lf\n"
.LC38:
	.string	"Simulation parameters:"
	.align 8
.LC39:
	.string	"NGRID=%d NGRID3=%d Particle_Mass=%lf NpTotal=%lf rhoMean=%lf L=%lf volCell=%lf dx=%lf Filename=%s\n"
.LC40:
	.string	"Particles located in the grid"
	.align 8
.LC41:
	.string	"Total momentum from particles in x:%12.6lf\n"
	.align 8
.LC42:
	.string	"Total momentum from particles in y:%12.6lf\n"
	.align 8
.LC43:
	.string	"Total momentum from particles in z:%12.6lf\n"
	.align 8
.LC44:
	.string	"Mean velocity from particles in x:%12.6lf\n"
	.align 8
.LC45:
	.string	"Mean velocity from particles in y:%12.6lf\n"
	.align 8
.LC46:
	.string	"Mean velocity from particles in z:%12.6lf\n"
	.align 8
.LC48:
	.string	"Normalization for momentum: aSF*Ngrid^3/NTotalParts=%lf\n"
	.align 8
.LC49:
	.string	"Total number of particles:%10d\n"
.LC50:
	.string	"Mass CIC = %lf\n"
.LC51:
	.string	"Mass Simulation = %lf\n"
	.align 8
.LC52:
	.string	"Total momentum from cells in x:%16.8lf\n"
	.align 8
.LC53:
	.string	"Total momentum from cells in y:%16.8lf\n"
	.align 8
.LC54:
	.string	"Total momentum from cells in z:%16.8lf\n"
	.align 8
.LC55:
	.string	"Mean velocity from cells in x:%16.8lf\n"
	.align 8
.LC56:
	.string	"Mean velocity from cells in y:%16.8lf\n"
	.align 8
.LC57:
	.string	"Mean velocity from cells in z:%16.8lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.file 3 "CIC.c"
	.loc 3 16 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$400, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	.loc 3 24 0
	movq	$0, -88(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -104(%rbp)
	.loc 3 26 0
	movl	$0, %eax
	movq	%rax, -112(%rbp)
	movl	$0, %eax
	movq	%rax, -72(%rbp)
	.loc 3 27 0
	movl	$0, -76(%rbp)
	.loc 3 36 0
	movl	$.LC33, %edi
	call	read_parameters
	.loc 3 37 0
	movl	$0, %eax
	call	readGADGETBinaryFile
	pxor	%xmm6, %xmm6
	cvtsi2sd	%eax, %xmm6
	movq	%xmm6, %rax
	movq	%rax, GV+16(%rip)
	.loc 3 40 0
	movq	Header+136(%rip), %rax
	movq	%rax, GV+1064(%rip)
	.loc 3 41 0
	movq	Header+144(%rip), %rax
	movq	%rax, GV+1072(%rip)
	.loc 3 42 0
	movq	Header+80(%rip), %rax
	movq	%rax, GV+1080(%rip)
	.loc 3 43 0
	movq	Header+152(%rip), %rax
	movq	%rax, GV+1096(%rip)
	.loc 3 44 0
	movsd	GV+1080(%rip), %xmm1
	movsd	.LC23(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC23(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, GV+1088(%rip)
	.loc 3 47 0
	movq	Header+128(%rip), %rax
	movq	%rax, GV+8(%rip)
	.loc 3 48 0
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	%eax, %edx
	movl	GV(%rip), %eax
	imull	%edx, %eax
	movl	%eax, GV+24(%rip)
	.loc 3 49 0
	movq	Header+32(%rip), %rax
	movq	%rax, GV+40(%rip)
	.loc 3 50 0
	movsd	GV+40(%rip), %xmm1
	movsd	GV+16(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, -424(%rbp)
	movq	GV+8(%rip), %rax
	movabsq	$4613937818241073152, %rdx
	movq	%rdx, -432(%rbp)
	movsd	-432(%rbp), %xmm1
	movq	%rax, -432(%rbp)
	movsd	-432(%rbp), %xmm0
	call	pow
	movsd	-424(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, GV+32(%rip)
	.loc 3 51 0
	movsd	GV+8(%rip), %xmm1
	movl	GV(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, GV+56(%rip)
	.loc 3 52 0
	movsd	GV+56(%rip), %xmm1
	movsd	GV+56(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	GV+56(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, GV+48(%rip)
	.loc 3 54 0
	movl	$.LC35, %edi
	call	puts
	.loc 3 55 0
	movl	$.LC36, %edi
	call	puts
	.loc 3 56 0
	movq	GV+1096(%rip), %rsi
	movq	GV+1080(%rip), %rcx
	movq	GV+1072(%rip), %rdx
	movq	GV+1064(%rip), %rax
	movq	%rsi, -424(%rbp)
	movsd	-424(%rbp), %xmm3
	movq	%rcx, -424(%rbp)
	movsd	-424(%rbp), %xmm2
	movq	%rdx, -424(%rbp)
	movsd	-424(%rbp), %xmm1
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC37, %edi
	movl	$4, %eax
	call	printf
	.loc 3 61 0
	movl	$.LC35, %edi
	call	puts
	.loc 3 62 0
	movl	$.LC38, %edi
	call	puts
	.loc 3 63 0
	movq	GV+56(%rip), %r11
	movq	GV+48(%rip), %r10
	movq	GV+8(%rip), %r9
	movq	GV+32(%rip), %r8
	movq	GV+16(%rip), %rdi
	movq	GV+40(%rip), %rsi
	movl	GV+24(%rip), %edx
	movl	GV(%rip), %eax
	movl	$GV+64, %ecx
	movq	%r11, -424(%rbp)
	movsd	-424(%rbp), %xmm5
	movq	%r10, -424(%rbp)
	movsd	-424(%rbp), %xmm4
	movq	%r9, -424(%rbp)
	movsd	-424(%rbp), %xmm3
	movq	%r8, -424(%rbp)
	movsd	-424(%rbp), %xmm2
	movq	%rdi, -424(%rbp)
	movsd	-424(%rbp), %xmm1
	movq	%rsi, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	%eax, %esi
	movl	$.LC39, %edi
	movl	$6, %eax
	call	printf
	.loc 3 73 0
	movl	$.LC35, %edi
	call	puts
	.loc 3 95 0
	movl	GV+24(%rip), %eax
	cltq
	movl	$112, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, cells(%rip)
	.loc 3 98 0
	movl	$0, -36(%rbp)
	jmp	.L63
.L64:
	.loc 3 99 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	.loc 3 100 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 40(%rdx)
	.loc 3 101 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 48(%rdx)
	.loc 3 102 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 16(%rdx)
	.loc 3 103 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 24(%rdx)
	.loc 3 104 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 32(%rdx)
	.loc 3 105 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 56(%rdx)
	.loc 3 106 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 64(%rdx)
	.loc 3 107 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 72(%rdx)
	.loc 3 108 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 80(%rdx)
	.loc 3 98 0 discriminator 3
	addl	$1, -36(%rbp)
.L63:
	.loc 3 98 0 is_stmt 0 discriminator 1
	movl	GV+24(%rip), %eax
	cmpl	-36(%rbp), %eax
	jg	.L64
	.loc 3 112 0 is_stmt 1
	movl	$0, -36(%rbp)
	jmp	.L65
.L66:
	.loc 3 113 0 discriminator 3
	movq	cells(%rip), %rcx
	movq	part(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	24(%rax), %r9
	movq	part(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	16(%rax), %r8
	movq	part(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movl	-36(%rbp), %edx
	movq	%rcx, %rsi
	movl	%edx, %edi
	movq	%r9, -424(%rbp)
	movsd	-424(%rbp), %xmm2
	movq	%r8, -424(%rbp)
	movsd	-424(%rbp), %xmm1
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	call	locateCell
	.loc 3 112 0 discriminator 3
	addl	$1, -36(%rbp)
.L65:
	.loc 3 112 0 is_stmt 0 discriminator 1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-36(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L66
	.loc 3 116 0 is_stmt 1
	movl	$.LC40, %edi
	call	puts
	.loc 3 117 0
	movl	$.LC35, %edi
	call	puts
	.loc 3 121 0
	movl	$0, %eax
	movq	%rax, -304(%rbp)
	movq	-304(%rbp), %rax
	movq	%rax, -312(%rbp)
	movq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
	.loc 3 122 0
	movl	$0, %eax
	movq	%rax, -336(%rbp)
	movq	-336(%rbp), %rax
	movq	%rax, -344(%rbp)
	movq	-344(%rbp), %rax
	movq	%rax, -352(%rbp)
	.loc 3 123 0
	movl	$0, -36(%rbp)
	jmp	.L67
.L68:
	.loc 3 125 0 discriminator 3
	movsd	-320(%rbp), %xmm1
	movsd	GV+40(%rip), %xmm2
	movq	part(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	32(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -320(%rbp)
	.loc 3 126 0 discriminator 3
	movsd	-312(%rbp), %xmm1
	movsd	GV+40(%rip), %xmm2
	movq	part(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	40(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -312(%rbp)
	.loc 3 127 0 discriminator 3
	movsd	-304(%rbp), %xmm1
	movsd	GV+40(%rip), %xmm2
	movq	part(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	48(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -304(%rbp)
	.loc 3 128 0 discriminator 3
	movsd	-352(%rbp), %xmm1
	movq	part(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	32(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -352(%rbp)
	.loc 3 129 0 discriminator 3
	movsd	-344(%rbp), %xmm1
	movq	part(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	40(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -344(%rbp)
	.loc 3 130 0 discriminator 3
	movsd	-336(%rbp), %xmm1
	movq	part(%rip), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movsd	48(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -336(%rbp)
	.loc 3 123 0 discriminator 3
	addl	$1, -36(%rbp)
.L67:
	.loc 3 123 0 is_stmt 0 discriminator 1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-36(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L68
	.loc 3 133 0 is_stmt 1
	movsd	-320(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, -320(%rbp)
	.loc 3 134 0
	movsd	-312(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, -312(%rbp)
	.loc 3 135 0
	movsd	-304(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, -304(%rbp)
	.loc 3 136 0
	movsd	-352(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, -352(%rbp)
	.loc 3 137 0
	movsd	-344(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, -344(%rbp)
	.loc 3 138 0
	movsd	-336(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, -336(%rbp)
	.loc 3 140 0
	movq	-320(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC41, %edi
	movl	$1, %eax
	call	printf
	.loc 3 141 0
	movq	-312(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC42, %edi
	movl	$1, %eax
	call	printf
	.loc 3 142 0
	movq	-304(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC43, %edi
	movl	$1, %eax
	call	printf
	.loc 3 143 0
	movq	-352(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC44, %edi
	movl	$1, %eax
	call	printf
	.loc 3 144 0
	movq	-344(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC45, %edi
	movl	$1, %eax
	call	printf
	.loc 3 145 0
	movq	-336(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC46, %edi
	movl	$1, %eax
	call	printf
	.loc 3 149 0
	movl	$0, -36(%rbp)
	jmp	.L69
.L82:
	.loc 3 150 0
	movl	$0, -40(%rbp)
	jmp	.L70
.L81:
	.loc 3 151 0
	movl	$0, -44(%rbp)
	jmp	.L71
.L80:
	.loc 3 154 0
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-36(%rbp), %eax
	movl	%eax, %ecx
	movl	-40(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-44(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -116(%rbp)
	.loc 3 157 0
	movsd	GV+56(%rip), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-36(%rbp), %xmm0
	movsd	.LC47(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -128(%rbp)
	.loc 3 158 0
	movsd	GV+56(%rip), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-40(%rbp), %xmm0
	movsd	.LC47(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -136(%rbp)
	.loc 3 159 0
	movsd	GV+56(%rip), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-44(%rbp), %xmm0
	movsd	.LC47(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -144(%rbp)
	.loc 3 162 0
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -148(%rbp)
	.loc 3 173 0
	movl	$0, -48(%rbp)
	jmp	.L72
.L79:
	.loc 3 175 0
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	%eax, -152(%rbp)
	.loc 3 178 0
	movq	part(%rip), %rax
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movq	%rax, -160(%rbp)
	.loc 3 179 0
	movq	part(%rip), %rax
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	16(%rax), %rax
	movq	%rax, -168(%rbp)
	.loc 3 180 0
	movq	part(%rip), %rax
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	24(%rax), %rax
	movq	%rax, -176(%rbp)
	.loc 3 183 0
	movq	part(%rip), %rax
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	32(%rax), %rax
	movq	%rax, -184(%rbp)
	.loc 3 184 0
	movq	part(%rip), %rax
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	40(%rax), %rax
	movq	%rax, -192(%rbp)
	.loc 3 185 0
	movq	part(%rip), %rax
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	48(%rax), %rax
	movq	%rax, -200(%rbp)
	.loc 3 201 0
	movl	$-1, -52(%rbp)
	jmp	.L73
.L78:
	.loc 3 202 0
	movl	$-1, -56(%rbp)
	jmp	.L74
.L77:
	.loc 3 203 0
	movl	$-1, -60(%rbp)
	jmp	.L75
.L76:
	.loc 3 205 0 discriminator 3
	movl	GV(%rip), %eax
	movl	-44(%rbp), %ecx
	movl	-60(%rbp), %edx
	addl	%ecx, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	mod
	movl	%eax, %r13d
	movl	GV(%rip), %ebx
	movl	GV(%rip), %eax
	movl	-40(%rbp), %ecx
	movl	-56(%rbp), %edx
	addl	%ecx, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	mod
	movl	%eax, %r14d
	movl	GV(%rip), %r12d
	movl	GV(%rip), %eax
	movl	-36(%rbp), %ecx
	movl	-52(%rbp), %edx
	addl	%ecx, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	mod
	imull	%r12d, %eax
	addl	%r14d, %eax
	imull	%ebx, %eax
	addl	%r13d, %eax
	movl	%eax, -204(%rbp)
	.loc 3 206 0 discriminator 3
	movsd	GV+56(%rip), %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sd	-36(%rbp), %xmm0
	movsd	.LC47(%rip), %xmm1
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-52(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, -128(%rbp)
	.loc 3 207 0 discriminator 3
	movsd	GV+56(%rip), %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sd	-40(%rbp), %xmm0
	movsd	.LC47(%rip), %xmm1
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-56(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, -136(%rbp)
	.loc 3 208 0 discriminator 3
	movsd	GV+56(%rip), %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sd	-44(%rbp), %xmm0
	movsd	.LC47(%rip), %xmm1
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-60(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, -144(%rbp)
	.loc 3 211 0 discriminator 3
	movq	GV+56(%rip), %rax
	movsd	-144(%rbp), %xmm0
	movapd	%xmm0, %xmm2
	subsd	-176(%rbp), %xmm2
	movsd	-136(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	subsd	-168(%rbp), %xmm1
	movsd	-128(%rbp), %xmm0
	subsd	-160(%rbp), %xmm0
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm3
	call	W
	movq	%xmm0, %rax
	movq	%rax, -216(%rbp)
	.loc 3 212 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	48(%rax), %xmm1
	movsd	GV+40(%rip), %xmm0
	mulsd	-216(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, 48(%rdx)
	.loc 3 219 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	56(%rax), %xmm1
	movsd	-184(%rbp), %xmm0
	mulsd	-216(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, 56(%rdx)
	.loc 3 220 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	64(%rax), %xmm1
	movsd	-192(%rbp), %xmm0
	mulsd	-216(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, 64(%rdx)
	.loc 3 221 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	72(%rax), %xmm1
	movsd	-200(%rbp), %xmm0
	mulsd	-216(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, 72(%rdx)
	.loc 3 222 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-204(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	80(%rax), %xmm0
	addsd	-216(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, 80(%rdx)
	.loc 3 203 0 discriminator 3
	addl	$1, -60(%rbp)
.L75:
	.loc 3 203 0 is_stmt 0 discriminator 1
	cmpl	$1, -60(%rbp)
	jle	.L76
	.loc 3 202 0 is_stmt 1 discriminator 2
	addl	$1, -56(%rbp)
.L74:
	.loc 3 202 0 is_stmt 0 discriminator 1
	cmpl	$1, -56(%rbp)
	jle	.L77
	.loc 3 201 0 is_stmt 1 discriminator 2
	addl	$1, -52(%rbp)
.L73:
	.loc 3 201 0 is_stmt 0 discriminator 1
	cmpl	$1, -52(%rbp)
	jle	.L78
	.loc 3 173 0 is_stmt 1 discriminator 2
	addl	$1, -48(%rbp)
.L72:
	.loc 3 173 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-148(%rbp), %eax
	jl	.L79
	.loc 3 151 0 is_stmt 1 discriminator 2
	addl	$1, -44(%rbp)
.L71:
	.loc 3 151 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-44(%rbp), %eax
	jg	.L80
	.loc 3 150 0 is_stmt 1 discriminator 2
	addl	$1, -40(%rbp)
.L70:
	.loc 3 150 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-40(%rbp), %eax
	jg	.L81
	.loc 3 149 0 is_stmt 1 discriminator 2
	addl	$1, -36(%rbp)
.L69:
	.loc 3 149 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-36(%rbp), %eax
	jg	.L82
	.loc 3 252 0 is_stmt 1
	movsd	GV+1088(%rip), %xmm1
	movl	GV+24(%rip), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	GV+16(%rip), %xmm2
	divsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -224(%rbp)
	.loc 3 253 0
	movl	$0, -36(%rbp)
	jmp	.L83
.L88:
	.loc 3 254 0
	movl	$0, -40(%rbp)
	jmp	.L84
.L87:
	.loc 3 255 0
	movl	$0, -44(%rbp)
	jmp	.L85
.L86:
	.loc 3 257 0 discriminator 3
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-36(%rbp), %eax
	movl	%eax, %ecx
	movl	-40(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-44(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -116(%rbp)
	.loc 3 268 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	56(%rax), %xmm0
	mulsd	-224(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, 56(%rdx)
	.loc 3 269 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	64(%rax), %xmm0
	mulsd	-224(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, 64(%rdx)
	.loc 3 270 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	72(%rax), %xmm0
	mulsd	-224(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, 72(%rdx)
	.loc 3 255 0 discriminator 3
	addl	$1, -44(%rbp)
.L85:
	.loc 3 255 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-44(%rbp), %eax
	jg	.L86
	.loc 3 254 0 is_stmt 1 discriminator 2
	addl	$1, -40(%rbp)
.L84:
	.loc 3 254 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-40(%rbp), %eax
	jg	.L87
	.loc 3 253 0 is_stmt 1 discriminator 2
	addl	$1, -36(%rbp)
.L83:
	.loc 3 253 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-36(%rbp), %eax
	jg	.L88
	.loc 3 274 0 is_stmt 1
	movq	-224(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC48, %edi
	movl	$1, %eax
	call	printf
	.loc 3 345 0
	movl	$0, %eax
	movq	%rax, -240(%rbp)
	movq	-240(%rbp), %rax
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, -256(%rbp)
	.loc 3 346 0
	movl	$0, %eax
	movq	%rax, -272(%rbp)
	movq	-272(%rbp), %rax
	movq	%rax, -280(%rbp)
	movq	-280(%rbp), %rax
	movq	%rax, -288(%rbp)
	.loc 3 348 0
	movl	$0, -36(%rbp)
	jmp	.L89
.L94:
	.loc 3 350 0
	movl	$0, -40(%rbp)
	jmp	.L90
.L93:
	.loc 3 352 0
	movl	$0, -44(%rbp)
	jmp	.L91
.L92:
	.loc 3 355 0 discriminator 3
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-36(%rbp), %eax
	movl	%eax, %ecx
	movl	-40(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-44(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -116(%rbp)
	.loc 3 358 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movsd	GV+56(%rip), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-36(%rbp), %xmm0
	movsd	.LC47(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, 88(%rdx)
	.loc 3 359 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movsd	GV+56(%rip), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-40(%rbp), %xmm0
	movsd	.LC47(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, 96(%rdx)
	.loc 3 360 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movsd	GV+56(%rip), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-44(%rbp), %xmm0
	movsd	.LC47(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, 104(%rdx)
	.loc 3 363 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	48(%rax), %xmm0
	movsd	-72(%rbp), %xmm1
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -72(%rbp)
	.loc 3 366 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rsi
	subq	%rax, %rsi
	movq	%rsi, %rax
	addq	%rcx, %rax
	movsd	48(%rax), %xmm0
	movsd	GV+48(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, 48(%rdx)
	.loc 3 370 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	%eax, -76(%rbp)
	.loc 3 371 0 discriminator 3
	movsd	-288(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	16(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -288(%rbp)
	.loc 3 372 0 discriminator 3
	movsd	-280(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	24(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -280(%rbp)
	.loc 3 373 0 discriminator 3
	movsd	-272(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	32(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -272(%rbp)
	.loc 3 374 0 discriminator 3
	movsd	-256(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	56(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -256(%rbp)
	.loc 3 375 0 discriminator 3
	movsd	-248(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	64(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -248(%rbp)
	.loc 3 376 0 discriminator 3
	movsd	-240(%rbp), %xmm1
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rdx, %rax
	movsd	72(%rax), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, -240(%rbp)
	.loc 3 379 0 discriminator 3
	movq	cells(%rip), %rdx
	movl	-116(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rdx
	movq	cells(%rip), %rcx
	movl	-116(%rbp), %eax
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
	movq	%xmm0, %rax
	movq	%rax, 40(%rdx)
	.loc 3 352 0 discriminator 3
	addl	$1, -44(%rbp)
.L91:
	.loc 3 352 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-44(%rbp), %eax
	jg	.L92
	.loc 3 350 0 is_stmt 1 discriminator 2
	addl	$1, -40(%rbp)
.L90:
	.loc 3 350 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-40(%rbp), %eax
	jg	.L93
	.loc 3 348 0 is_stmt 1 discriminator 2
	addl	$1, -36(%rbp)
.L89:
	.loc 3 348 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-36(%rbp), %eax
	jg	.L94
	.loc 3 384 0 is_stmt 1
	call	write_binary
	.loc 3 388 0
	movl	-76(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC49, %edi
	movl	$0, %eax
	call	printf
	.loc 3 389 0
	movq	-72(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC50, %edi
	movl	$1, %eax
	call	printf
	.loc 3 390 0
	movsd	GV+16(%rip), %xmm1
	movsd	GV+40(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movl	$.LC51, %edi
	movl	$1, %eax
	call	printf
	.loc 3 391 0
	movq	-256(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC52, %edi
	movl	$1, %eax
	call	printf
	.loc 3 392 0
	movq	-248(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC53, %edi
	movl	$1, %eax
	call	printf
	.loc 3 393 0
	movq	-240(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC54, %edi
	movl	$1, %eax
	call	printf
	.loc 3 394 0
	movq	-288(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC55, %edi
	movl	$1, %eax
	call	printf
	.loc 3 395 0
	movq	-280(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC56, %edi
	movl	$1, %eax
	call	printf
	.loc 3 396 0
	movq	-272(%rbp), %rax
	movq	%rax, -424(%rbp)
	movsd	-424(%rbp), %xmm0
	movl	$.LC57, %edi
	movl	$1, %eax
	call	printf
	.loc 3 399 0
	movq	part(%rip), %rax
	movq	%rax, %rdi
	call	free
	.loc 3 400 0
	movq	cells(%rip), %rax
	movq	%rax, %rdi
	call	free
	.loc 3 402 0
	movl	$0, %eax
	.loc 3 403 0
	addq	$400, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
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
.LC47:
	.long	0
	.long	1071644672
	.text
.Letext0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/4.9/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/libio.h"
	.file 8 "structures.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb3c
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF132
	.byte	0x1
	.long	.LASF133
	.long	.LASF134
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
	.long	.LASF135
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
	.byte	0xd
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF100
	.byte	0x1
	.byte	0x12
	.long	0x62
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x65b
	.uleb128 0x14
	.long	.LASF89
	.byte	0x1
	.byte	0x13
	.long	0x65b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x14
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x14
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.long	.LASF90
	.byte	0x1
	.byte	0x15
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.long	.LASF91
	.byte	0x1
	.byte	0x15
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.long	.LASF92
	.byte	0x1
	.byte	0x15
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.long	.LASF93
	.byte	0x1
	.byte	0x15
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x14
	.long	.LASF94
	.byte	0x1
	.byte	0x15
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x14
	.long	.LASF95
	.byte	0x1
	.byte	0x16
	.long	0x29f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x14
	.long	.LASF96
	.byte	0x1
	.byte	0x16
	.long	0x661
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x14
	.long	.LASF97
	.byte	0x1
	.byte	0x17
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0xb
	.long	0x29f
	.long	0x671
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0x17
	.string	"W"
	.byte	0x1
	.byte	0xa5
	.long	0x2a6
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x6ea
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0xa5
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0xa5
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.string	"z"
	.byte	0x1
	.byte	0xa5
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x18
	.string	"H"
	.byte	0x1
	.byte	0xa5
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x16
	.string	"Wx"
	.byte	0x1
	.byte	0xa6
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.string	"Wy"
	.byte	0x1
	.byte	0xa6
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.string	"Wz"
	.byte	0x1
	.byte	0xa6
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x19
	.long	.LASF101
	.byte	0x1
	.value	0x10d
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x788
	.uleb128 0x1a
	.string	"xp"
	.byte	0x1
	.value	0x10d
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.string	"yp"
	.byte	0x1
	.value	0x10d
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1a
	.string	"zp"
	.byte	0x1
	.value	0x10d
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1b
	.long	.LASF102
	.byte	0x1
	.value	0x10d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1b
	.long	.LASF103
	.byte	0x1
	.value	0x10d
	.long	0x788
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x111
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.string	"j"
	.byte	0x1
	.value	0x111
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.string	"k"
	.byte	0x1
	.value	0x111
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.string	"n"
	.byte	0x1
	.value	0x111
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4c8
	.uleb128 0x1d
	.string	"mod"
	.byte	0x1
	.value	0x12e
	.long	0x62
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x7da
	.uleb128 0x1a
	.string	"a"
	.byte	0x1
	.value	0x12e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.string	"b"
	.byte	0x1
	.value	0x12e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.string	"mod"
	.byte	0x1
	.value	0x12f
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.long	.LASF104
	.byte	0x2
	.byte	0x9
	.long	0x62
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x81a
	.uleb128 0x13
	.long	.LASF105
	.byte	0x2
	.byte	0x9
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x16
	.string	"cmd"
	.byte	0x2
	.byte	0xb
	.long	0x81a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.uleb128 0xb
	.long	0x95
	.long	0x82a
	.uleb128 0xc
	.long	0x86
	.byte	0x63
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
	.long	0x887
	.uleb128 0x13
	.long	.LASF105
	.byte	0x2
	.byte	0x1c
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x16
	.string	"cmd"
	.byte	0x2
	.byte	0x1e
	.long	0x81a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x14
	.long	.LASF107
	.byte	0x2
	.byte	0x1e
	.long	0x81a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x14
	.long	.LASF108
	.byte	0x2
	.byte	0x1f
	.long	0x65b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.long	.LASF109
	.byte	0x2
	.byte	0x7c
	.long	0x62
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x8dc
	.uleb128 0x16
	.string	"i"
	.byte	0x2
	.byte	0x7e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.long	.LASF94
	.byte	0x2
	.byte	0x7e
	.long	0x62
	.uleb128 0x14
	.long	.LASF110
	.byte	0x2
	.byte	0x7f
	.long	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x14
	.long	.LASF111
	.byte	0x2
	.byte	0x80
	.long	0x65b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF112
	.byte	0x3
	.byte	0x10
	.long	0x62
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0xae6
	.uleb128 0x16
	.string	"i"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x16
	.string	"j"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.string	"k"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x16
	.string	"l"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x14
	.long	.LASF113
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x14
	.long	.LASF114
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -220
	.uleb128 0x16
	.string	"Np"
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x14
	.long	.LASF115
	.byte	0x3
	.byte	0x12
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x16
	.string	"ii"
	.byte	0x3
	.byte	0x13
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x16
	.string	"jj"
	.byte	0x3
	.byte	0x13
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.string	"kk"
	.byte	0x3
	.byte	0x13
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x16
	.string	"xc"
	.byte	0x3
	.byte	0x14
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x16
	.string	"yc"
	.byte	0x3
	.byte	0x14
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x16
	.string	"zc"
	.byte	0x3
	.byte	0x14
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x16
	.string	"xp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x16
	.string	"yp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
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
	.sleb128 -200
	.uleb128 0x16
	.string	"vyp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x16
	.string	"vzp"
	.byte	0x3
	.byte	0x15
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x14
	.long	.LASF116
	.byte	0x3
	.byte	0x16
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x14
	.long	.LASF117
	.byte	0x3
	.byte	0x17
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x14
	.long	.LASF118
	.byte	0x3
	.byte	0x18
	.long	0x65b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x14
	.long	.LASF119
	.byte	0x3
	.byte	0x18
	.long	0x65b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x14
	.long	.LASF120
	.byte	0x3
	.byte	0x18
	.long	0x65b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x14
	.long	.LASF121
	.byte	0x3
	.byte	0x1a
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x14
	.long	.LASF122
	.byte	0x3
	.byte	0x1a
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x14
	.long	.LASF123
	.byte	0x3
	.byte	0x1b
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x14
	.long	.LASF124
	.byte	0x3
	.byte	0x1c
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x14
	.long	.LASF125
	.byte	0x3
	.byte	0x1c
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x14
	.long	.LASF126
	.byte	0x3
	.byte	0x1d
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x14
	.long	.LASF127
	.byte	0x3
	.byte	0x1d
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x14
	.long	.LASF128
	.byte	0x3
	.byte	0x1e
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x14
	.long	.LASF129
	.byte	0x3
	.byte	0x1e
	.long	0x553
	.uleb128 0x3
	.byte	0x91
	.sleb128 -432
	.byte	0
	.uleb128 0x1f
	.string	"GV"
	.byte	0x8
	.byte	0x19
	.long	0x2ad
	.uleb128 0x9
	.byte	0x3
	.quad	GV
	.uleb128 0x20
	.long	.LASF130
	.byte	0x8
	.byte	0x28
	.long	0xb0f
	.uleb128 0x9
	.byte	0x3
	.quad	part
	.uleb128 0x6
	.byte	0x8
	.long	0x376
	.uleb128 0x20
	.long	.LASF131
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
	.long	0x788
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
.LASF135:
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
.LASF122:
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
.LASF80:
	.string	"OmegaLambda"
.LASF84:
	.string	"id_part"
.LASF111:
	.string	"outFile"
.LASF88:
	.string	"scaled"
.LASF97:
	.string	"uintaux"
.LASF130:
	.string	"part"
.LASF46:
	.string	"_pos"
.LASF131:
	.string	"Header"
.LASF24:
	.string	"_IO_save_end"
.LASF49:
	.string	"float"
.LASF113:
	.string	"index"
.LASF125:
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
.LASF23:
	.string	"_IO_backup_base"
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
.LASF124:
	.string	"sumaMom"
.LASF59:
	.string	"OmegaM0"
.LASF16:
	.string	"_IO_read_base"
.LASF44:
	.string	"_next"
.LASF51:
	.string	"globalVariables"
.LASF98:
	.string	"randr"
.LASF11:
	.string	"char"
.LASF133:
	.string	"CIC.c"
.LASF118:
	.string	"outfile"
.LASF40:
	.string	"_mode"
.LASF105:
	.string	"filename"
.LASF115:
	.string	"idPart"
.LASF43:
	.string	"_IO_marker"
.LASF14:
	.string	"_IO_read_ptr"
.LASF70:
	.string	"Npart"
.LASF116:
	.string	"Window_fn"
.LASF82:
	.string	"Cell"
.LASF17:
	.string	"_IO_write_base"
.LASF47:
	.string	"long long int"
.LASF58:
	.string	"FILENAME"
.LASF126:
	.string	"sumaMomPart"
.LASF22:
	.string	"_IO_save_base"
.LASF106:
	.string	"read_parameters"
.LASF134:
	.string	"/home/dvalencia/SWcode/CIC_original/CIC_def"
.LASF107:
	.string	"filenamedump"
.LASF129:
	.string	"auxVel"
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
.LASF132:
	.string	"GNU C 4.9.2 -fpreprocessed -mtune=generic -march=x86-64 -g"
.LASF128:
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
.LASF117:
	.string	"norm_factor"
.LASF33:
	.string	"_lock"
.LASF10:
	.string	"sizetype"
.LASF114:
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
.LASF119:
	.string	"outfile1"
.LASF120:
	.string	"outfile2"
.LASF91:
	.string	"N_min"
.LASF109:
	.string	"write_binary"
.LASF123:
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
.LASF127:
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
.LASF2:
	.string	"short unsigned int"
.LASF112:
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
.LASF121:
	.string	"totalMass"
.LASF90:
	.string	"N_tot"
.LASF9:
	.string	"__off64_t"
.LASF41:
	.string	"_unused2"
.LASF20:
	.string	"_IO_buf_base"
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
