	.text
	.file	"laplace2d.c"
	.globl	StartTimer
	.p2align	4, 0x90
	.type	StartTimer,@function
StartTimer:                             # @StartTimer
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
.Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movabsq	$timerStart, %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	callq	gettimeofday
	movl	%eax, -4(%rbp)          # 4-byte Spill
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	StartTimer, .Lfunc_end0-StartTimer
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI1_0:
	.quad	4652007308841189376     # double 1000
	.text
	.globl	GetTimer
	.p2align	4, 0x90
	.type	GetTimer,@function
GetTimer:                               # @GetTimer
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi3:
	.cfi_def_cfa_offset 16
.Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi5:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	leaq	-16(%rbp), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	callq	gettimeofday
	movl	%eax, -36(%rbp)         # 4-byte Spill
# BB#1:
	movq	-16(%rbp), %rax
	subq	timerStart, %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	subq	timerStart+8, %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jge	.LBB1_3
# BB#2:
	movq	-32(%rbp), %rax
	addq	$-1, %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	addq	$1000000, %rax          # imm = 0xF4240
	movq	%rax, -24(%rbp)
.LBB1_3:
	jmp	.LBB1_4
.LBB1_4:
	movsd	.LCPI1_0(%rip), %xmm0   # xmm0 = mem[0],zero
	cvtsi2sdq	-32(%rbp), %xmm1
	mulsd	%xmm0, %xmm1
	cvtsi2sdq	-24(%rbp), %xmm2
	divsd	%xmm0, %xmm2
	addsd	%xmm2, %xmm1
	movaps	%xmm1, %xmm0
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	GetTimer, .Lfunc_end1-GetTimer
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI2_0:
	.long	1065353216              # float 1
.LCPI2_1:
	.long	925353388               # float 9.99999974E-6
.LCPI2_4:
	.long	1048576000              # float 0.25
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI2_2:
	.quad	4652007308841189376     # double 1000
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI2_3:
	.long	2147483647              # float NaN
	.long	2147483647              # float NaN
	.long	2147483647              # float NaN
	.long	2147483647              # float NaN
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi6:
	.cfi_def_cfa_offset 16
.Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$176, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$2, -8(%rbp)
	jge	.LBB2_2
# BB#1:
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	$1, %edi
	movl	%eax, -100(%rbp)        # 4-byte Spill
	callq	exit
.LBB2_2:
	xorl	%esi, %esi
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movl	%esi, -104(%rbp)        # 4-byte Spill
	callq	atoi
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	$1000, -28(%rbp)        # imm = 0x3E8
	movss	.LCPI2_0(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	callq	asinf
	addss	%xmm0, %xmm0
	movss	%xmm0, -32(%rbp)
	movl	$925353388, -36(%rbp)   # imm = 0x3727C5AC
	movl	$1065353216, -40(%rbp)  # imm = 0x3F800000
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	movq	%rsp, %rdx
	movq	%rdx, -48(%rbp)
	imulq	%rcx, %rdi
	leaq	15(,%rdi,4), %rdx
	andq	$-16, %rdx
	movq	%rsp, %rdi
	subq	%rdx, %rdi
	movq	%rdi, %rsp
	movl	-24(%rbp), %eax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	movl	%eax, %r8d
	imulq	%r8, %rdx
	leaq	15(,%rdx,4), %rdx
	andq	$-16, %rdx
	movq	%rsp, %r9
	subq	%rdx, %r9
	movq	%r9, %rsp
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	leaq	15(,%rdx,4), %rdx
	movabsq	$34359738352, %r10      # imm = 0x7FFFFFFF0
	andq	%r10, %rdx
	movq	%rsp, %r10
	subq	%rdx, %r10
	movq	%r10, %rsp
	movq	%rdi, %rdx
	movl	-20(%rbp), %eax
	imull	-24(%rbp), %eax
	movslq	%eax, %r11
	shlq	$2, %r11
	movq	%rdi, -112(%rbp)        # 8-byte Spill
	movq	%rdx, %rdi
	movl	-104(%rbp), %esi        # 4-byte Reload
	movq	%r11, %rdx
	movq	%rcx, -120(%rbp)        # 8-byte Spill
	movq	%r10, -128(%rbp)        # 8-byte Spill
	movq	%r8, -136(%rbp)         # 8-byte Spill
	movq	%r9, -144(%rbp)         # 8-byte Spill
	callq	memset
	movl	$0, -52(%rbp)
.LBB2_3:                                # =>This Inner Loop Header: Depth=1
	movl	-52(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB2_6
# BB#4:                                 #   in Loop: Header=BB2_3 Depth=1
	xorps	%xmm0, %xmm0
	movq	-120(%rbp), %rax        # 8-byte Reload
	imulq	$0, %rax, %rcx
	shlq	$2, %rcx
	movq	-112(%rbp), %rdx        # 8-byte Reload
	addq	%rcx, %rdx
	movslq	-52(%rbp), %rcx
	movss	%xmm0, (%rdx,%rcx,4)
	movl	-20(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rcx
	imulq	%rax, %rcx
	shlq	$2, %rcx
	movq	-112(%rbp), %rdx        # 8-byte Reload
	addq	%rcx, %rdx
	movslq	-52(%rbp), %rcx
	movss	%xmm0, (%rdx,%rcx,4)
# BB#5:                                 #   in Loop: Header=BB2_3 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB2_3
.LBB2_6:
	movl	$0, -56(%rbp)
.LBB2_7:                                # =>This Inner Loop Header: Depth=1
	movl	-56(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB2_10
# BB#8:                                 #   in Loop: Header=BB2_7 Depth=1
	movss	-32(%rbp), %xmm0        # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	-56(%rbp), %xmm1
	mulss	%xmm1, %xmm0
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cvtsi2ssl	%eax, %xmm1
	divss	%xmm1, %xmm0
	callq	sinf
	movslq	-56(%rbp), %rcx
	movq	-128(%rbp), %rdx        # 8-byte Reload
	movss	%xmm0, (%rdx,%rcx,4)
	movslq	-56(%rbp), %rcx
	movss	(%rdx,%rcx,4), %xmm0    # xmm0 = mem[0],zero,zero,zero
	movslq	-56(%rbp), %rcx
	movq	-120(%rbp), %rsi        # 8-byte Reload
	imulq	%rsi, %rcx
	movq	-112(%rbp), %rdi        # 8-byte Reload
	movss	%xmm0, (%rdi,%rcx,4)
	movslq	-56(%rbp), %rcx
	movss	(%rdx,%rcx,4), %xmm0    # xmm0 = mem[0],zero,zero,zero
	movss	-32(%rbp), %xmm1        # xmm1 = mem[0],zero,zero,zero
	movd	%xmm1, %eax
	xorl	$2147483648, %eax       # imm = 0x80000000
	movd	%eax, %xmm1
	movss	%xmm0, -148(%rbp)       # 4-byte Spill
	movaps	%xmm1, %xmm0
	callq	expf
	movss	-148(%rbp), %xmm1       # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm0, %xmm1
	movslq	-56(%rbp), %rcx
	movq	-120(%rbp), %rdx        # 8-byte Reload
	imulq	%rdx, %rcx
	shlq	$2, %rcx
	movq	-112(%rbp), %rsi        # 8-byte Reload
	addq	%rcx, %rsi
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	movss	%xmm1, (%rsi,%rcx,4)
# BB#9:                                 #   in Loop: Header=BB2_7 Depth=1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB2_7
.LBB2_10:
	movabsq	$.L.str.1, %rdi
	movl	-20(%rbp), %esi
	movl	-24(%rbp), %edx
	movb	$0, %al
	callq	printf
	movl	%eax, -152(%rbp)        # 4-byte Spill
	callq	StartTimer
	movl	$0, -60(%rbp)
	movl	$1, -64(%rbp)
.LBB2_11:                               # =>This Inner Loop Header: Depth=1
	movl	-64(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB2_14
# BB#12:                                #   in Loop: Header=BB2_11 Depth=1
	xorps	%xmm0, %xmm0
	movq	-136(%rbp), %rax        # 8-byte Reload
	imulq	$0, %rax, %rcx
	shlq	$2, %rcx
	movq	-144(%rbp), %rdx        # 8-byte Reload
	addq	%rcx, %rdx
	movslq	-64(%rbp), %rcx
	movss	%xmm0, (%rdx,%rcx,4)
	movl	-20(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rcx
	imulq	%rax, %rcx
	shlq	$2, %rcx
	movq	-144(%rbp), %rdx        # 8-byte Reload
	addq	%rcx, %rdx
	movslq	-64(%rbp), %rcx
	movss	%xmm0, (%rdx,%rcx,4)
# BB#13:                                #   in Loop: Header=BB2_11 Depth=1
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	.LBB2_11
.LBB2_14:
	movl	$1, -68(%rbp)
.LBB2_15:                               # =>This Inner Loop Header: Depth=1
	movl	-68(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB2_18
# BB#16:                                #   in Loop: Header=BB2_15 Depth=1
	movslq	-68(%rbp), %rax
	movq	-128(%rbp), %rcx        # 8-byte Reload
	movss	(%rcx,%rax,4), %xmm0    # xmm0 = mem[0],zero,zero,zero
	movslq	-68(%rbp), %rax
	movq	-136(%rbp), %rdx        # 8-byte Reload
	imulq	%rdx, %rax
	movq	-144(%rbp), %rsi        # 8-byte Reload
	movss	%xmm0, (%rsi,%rax,4)
	movslq	-68(%rbp), %rax
	movss	(%rcx,%rax,4), %xmm0    # xmm0 = mem[0],zero,zero,zero
	movss	-32(%rbp), %xmm1        # xmm1 = mem[0],zero,zero,zero
	movd	%xmm1, %edi
	xorl	$2147483648, %edi       # imm = 0x80000000
	movd	%edi, %xmm1
	movss	%xmm0, -156(%rbp)       # 4-byte Spill
	movaps	%xmm1, %xmm0
	callq	expf
	movss	-156(%rbp), %xmm1       # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm0, %xmm1
	movslq	-68(%rbp), %rax
	movq	-136(%rbp), %rcx        # 8-byte Reload
	imulq	%rcx, %rax
	shlq	$2, %rax
	movq	-144(%rbp), %rdx        # 8-byte Reload
	addq	%rax, %rdx
	movl	-24(%rbp), %edi
	subl	$1, %edi
	movslq	%edi, %rax
	movss	%xmm1, (%rdx,%rax,4)
# BB#17:                                #   in Loop: Header=BB2_15 Depth=1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	.LBB2_15
.LBB2_18:
	jmp	.LBB2_19
.LBB2_19:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_23 Depth 2
                                        #       Child Loop BB2_25 Depth 3
                                        #     Child Loop BB2_31 Depth 2
                                        #       Child Loop BB2_33 Depth 3
	xorl	%eax, %eax
	movb	%al, %cl
	movss	.LCPI2_1(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	movss	-40(%rbp), %xmm1        # xmm1 = mem[0],zero,zero,zero
	ucomiss	%xmm0, %xmm1
	movb	%cl, -157(%rbp)         # 1-byte Spill
	jbe	.LBB2_21
# BB#20:                                #   in Loop: Header=BB2_19 Depth=1
	movl	-60(%rbp), %eax
	cmpl	-28(%rbp), %eax
	setl	%cl
	movb	%cl, -157(%rbp)         # 1-byte Spill
.LBB2_21:                               #   in Loop: Header=BB2_19 Depth=1
	movb	-157(%rbp), %al         # 1-byte Reload
	testb	$1, %al
	jne	.LBB2_22
	jmp	.LBB2_41
.LBB2_22:                               #   in Loop: Header=BB2_19 Depth=1
	xorps	%xmm0, %xmm0
	movss	%xmm0, -40(%rbp)
	movl	$1, -72(%rbp)
.LBB2_23:                               #   Parent Loop BB2_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_25 Depth 3
	movl	-72(%rbp), %eax
	movl	-20(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB2_30
# BB#24:                                #   in Loop: Header=BB2_23 Depth=2
	movl	$1, -76(%rbp)
.LBB2_25:                               #   Parent Loop BB2_19 Depth=1
                                        #     Parent Loop BB2_23 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-76(%rbp), %eax
	movl	-24(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB2_28
# BB#26:                                #   in Loop: Header=BB2_25 Depth=3
	movss	.LCPI2_4(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	movslq	-72(%rbp), %rax
	movq	-120(%rbp), %rcx        # 8-byte Reload
	imulq	%rcx, %rax
	shlq	$2, %rax
	movq	-112(%rbp), %rdx        # 8-byte Reload
	addq	%rax, %rdx
	movl	-76(%rbp), %esi
	addl	$1, %esi
	movslq	%esi, %rax
	movss	(%rdx,%rax,4), %xmm1    # xmm1 = mem[0],zero,zero,zero
	movslq	-72(%rbp), %rax
	imulq	%rcx, %rax
	shlq	$2, %rax
	movq	-112(%rbp), %rdx        # 8-byte Reload
	addq	%rax, %rdx
	movl	-76(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rax
	addss	(%rdx,%rax,4), %xmm1
	movl	-72(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rax
	imulq	%rcx, %rax
	shlq	$2, %rax
	movq	-112(%rbp), %rdx        # 8-byte Reload
	addq	%rax, %rdx
	movslq	-76(%rbp), %rax
	addss	(%rdx,%rax,4), %xmm1
	movl	-72(%rbp), %esi
	addl	$1, %esi
	movslq	%esi, %rax
	imulq	%rcx, %rax
	shlq	$2, %rax
	movq	-112(%rbp), %rdx        # 8-byte Reload
	addq	%rax, %rdx
	movslq	-76(%rbp), %rax
	addss	(%rdx,%rax,4), %xmm1
	mulss	%xmm1, %xmm0
	movslq	-72(%rbp), %rax
	movq	-136(%rbp), %rdx        # 8-byte Reload
	imulq	%rdx, %rax
	shlq	$2, %rax
	movq	-144(%rbp), %rdi        # 8-byte Reload
	addq	%rax, %rdi
	movslq	-76(%rbp), %rax
	movss	%xmm0, (%rdi,%rax,4)
	movss	-40(%rbp), %xmm0        # xmm0 = mem[0],zero,zero,zero
	movslq	-72(%rbp), %rax
	imulq	%rdx, %rax
	shlq	$2, %rax
	movq	-144(%rbp), %rdi        # 8-byte Reload
	addq	%rax, %rdi
	movslq	-76(%rbp), %rax
	movss	(%rdi,%rax,4), %xmm1    # xmm1 = mem[0],zero,zero,zero
	movslq	-72(%rbp), %rax
	imulq	%rcx, %rax
	shlq	$2, %rax
	movq	-112(%rbp), %rdi        # 8-byte Reload
	addq	%rax, %rdi
	movslq	-76(%rbp), %rax
	subss	(%rdi,%rax,4), %xmm1
	movaps	.LCPI2_3(%rip), %xmm2   # xmm2 = [nan,nan,nan,nan]
	pand	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm3
	cmpunordss	%xmm3, %xmm3
	movaps	%xmm3, %xmm4
	andps	%xmm2, %xmm4
	maxss	%xmm0, %xmm1
	andnps	%xmm1, %xmm3
	orps	%xmm4, %xmm3
	movss	%xmm3, -40(%rbp)
# BB#27:                                #   in Loop: Header=BB2_25 Depth=3
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	jmp	.LBB2_25
.LBB2_28:                               #   in Loop: Header=BB2_23 Depth=2
	jmp	.LBB2_29
.LBB2_29:                               #   in Loop: Header=BB2_23 Depth=2
	movl	-72(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -72(%rbp)
	jmp	.LBB2_23
.LBB2_30:                               #   in Loop: Header=BB2_19 Depth=1
	movl	$1, -80(%rbp)
.LBB2_31:                               #   Parent Loop BB2_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_33 Depth 3
	movl	-80(%rbp), %eax
	movl	-20(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB2_38
# BB#32:                                #   in Loop: Header=BB2_31 Depth=2
	movl	$1, -84(%rbp)
.LBB2_33:                               #   Parent Loop BB2_19 Depth=1
                                        #     Parent Loop BB2_31 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-84(%rbp), %eax
	movl	-24(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB2_36
# BB#34:                                #   in Loop: Header=BB2_33 Depth=3
	movslq	-80(%rbp), %rax
	movq	-136(%rbp), %rcx        # 8-byte Reload
	imulq	%rcx, %rax
	shlq	$2, %rax
	movq	-144(%rbp), %rdx        # 8-byte Reload
	addq	%rax, %rdx
	movslq	-84(%rbp), %rax
	movss	(%rdx,%rax,4), %xmm0    # xmm0 = mem[0],zero,zero,zero
	movslq	-80(%rbp), %rax
	movq	-120(%rbp), %rdx        # 8-byte Reload
	imulq	%rdx, %rax
	shlq	$2, %rax
	movq	-112(%rbp), %rsi        # 8-byte Reload
	addq	%rax, %rsi
	movslq	-84(%rbp), %rax
	movss	%xmm0, (%rsi,%rax,4)
# BB#35:                                #   in Loop: Header=BB2_33 Depth=3
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	jmp	.LBB2_33
.LBB2_36:                               #   in Loop: Header=BB2_31 Depth=2
	jmp	.LBB2_37
.LBB2_37:                               #   in Loop: Header=BB2_31 Depth=2
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80(%rbp)
	jmp	.LBB2_31
.LBB2_38:                               #   in Loop: Header=BB2_19 Depth=1
	movl	$100, %eax
	movl	-60(%rbp), %ecx
	movl	%eax, -164(%rbp)        # 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	-164(%rbp), %ecx        # 4-byte Reload
	idivl	%ecx
	cmpl	$0, %edx
	jne	.LBB2_40
# BB#39:                                #   in Loop: Header=BB2_19 Depth=1
	movabsq	$.L.str.2, %rdi
	movl	-60(%rbp), %esi
	cvtss2sd	-40(%rbp), %xmm0
	movb	$1, %al
	callq	printf
	movl	%eax, -168(%rbp)        # 4-byte Spill
.LBB2_40:                               #   in Loop: Header=BB2_19 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB2_19
.LBB2_41:
	callq	GetTimer
	movabsq	$.L.str.3, %rdi
	movsd	.LCPI2_2(%rip), %xmm1   # xmm1 = mem[0],zero
	movsd	%xmm0, -96(%rbp)
	movsd	-96(%rbp), %xmm0        # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movb	$1, %al
	callq	printf
	movq	-48(%rbp), %rdi
	movq	%rdi, %rsp
	movl	-4(%rbp), %ecx
	movl	%eax, -172(%rbp)        # 4-byte Spill
	movl	%ecx, %eax
	movq	%rbp, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	timerStart,@object      # @timerStart
	.comm	timerStart,16,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Please pass a matrix size\n"
	.size	.L.str, 27

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"Jacobi relaxation Calculation: %d x %d mesh\n"
	.size	.L.str.1, 45

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%5d, %0.6f\n"
	.size	.L.str.2, 12

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	" total: %f s\n"
	.size	.L.str.3, 14


	.ident	"clang version 4.0.0 (https://github.com/clang-ykt/clang 3e4c82287ad23933ca05eaca06587554967cfd77) (https://github.com/clang-ykt/llvm 4abed2887b0b7a4973f07311a6ec4669507c5d87)"
	.section	".note.GNU-stack","",@progbits
