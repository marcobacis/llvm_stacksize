; ModuleID = '../medley/deriche/deriche.c'
source_filename = "../medley/deriche/deriche.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %w = alloca i32, align 4
  %h = alloca i32, align 4
  %alpha = alloca float, align 4
  %imgIn = alloca [4096 x [2160 x float]]*, align 8
  %imgOut = alloca [4096 x [2160 x float]]*, align 8
  %y1 = alloca [4096 x [2160 x float]]*, align 8
  %y2 = alloca [4096 x [2160 x float]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %w to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  store i32 4096, i32* %w, align 4, !tbaa !3
  %1 = bitcast i32* %h to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  store i32 2160, i32* %h, align 4, !tbaa !3
  %2 = bitcast float* %alpha to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #4
  %3 = bitcast [4096 x [2160 x float]]** %imgIn to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #4
  %call = call i8* @polybench_alloc_data(i64 8847360, i32 4)
  %4 = bitcast i8* %call to [4096 x [2160 x float]]*
  store [4096 x [2160 x float]]* %4, [4096 x [2160 x float]]** %imgIn, align 8, !tbaa !7
  %5 = bitcast [4096 x [2160 x float]]** %imgOut to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #4
  %call1 = call i8* @polybench_alloc_data(i64 8847360, i32 4)
  %6 = bitcast i8* %call1 to [4096 x [2160 x float]]*
  store [4096 x [2160 x float]]* %6, [4096 x [2160 x float]]** %imgOut, align 8, !tbaa !7
  %7 = bitcast [4096 x [2160 x float]]** %y1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #4
  %call2 = call i8* @polybench_alloc_data(i64 8847360, i32 4)
  %8 = bitcast i8* %call2 to [4096 x [2160 x float]]*
  store [4096 x [2160 x float]]* %8, [4096 x [2160 x float]]** %y1, align 8, !tbaa !7
  %9 = bitcast [4096 x [2160 x float]]** %y2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #4
  %call3 = call i8* @polybench_alloc_data(i64 8847360, i32 4)
  %10 = bitcast i8* %call3 to [4096 x [2160 x float]]*
  store [4096 x [2160 x float]]* %10, [4096 x [2160 x float]]** %y2, align 8, !tbaa !7
  %11 = load i32, i32* %w, align 4, !tbaa !3
  %12 = load i32, i32* %h, align 4, !tbaa !3
  %13 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %imgIn, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %13, i32 0, i32 0
  %14 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %imgOut, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %14, i32 0, i32 0
  call void @init_array(i32 %11, i32 %12, float* %alpha, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4)
  %15 = load i32, i32* %w, align 4, !tbaa !3
  %16 = load i32, i32* %h, align 4, !tbaa !3
  %17 = load float, float* %alpha, align 4, !tbaa !9
  %18 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %imgIn, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %18, i32 0, i32 0
  %19 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %imgOut, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %19, i32 0, i32 0
  %20 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %y1, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %20, i32 0, i32 0
  %21 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %y2, align 8, !tbaa !7
  %arraydecay8 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %21, i32 0, i32 0
  call void @kernel_deriche(i32 %15, i32 %16, float %17, [2160 x float]* %arraydecay5, [2160 x float]* %arraydecay6, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
  %22 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %22, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %23 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %23, i64 0
  %24 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call9 = call i32 @strcmp(i8* %24, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call9, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %25 = load i32, i32* %w, align 4, !tbaa !3
  %26 = load i32, i32* %h, align 4, !tbaa !3
  %27 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %imgOut, align 8, !tbaa !7
  %arraydecay10 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %27, i32 0, i32 0
  call void @print_array(i32 %25, i32 %26, [2160 x float]* %arraydecay10)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %28 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %imgIn, align 8, !tbaa !7
  %29 = bitcast [4096 x [2160 x float]]* %28 to i8*
  call void @free(i8* %29)
  %30 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %imgOut, align 8, !tbaa !7
  %31 = bitcast [4096 x [2160 x float]]* %30 to i8*
  call void @free(i8* %31)
  %32 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %y1, align 8, !tbaa !7
  %33 = bitcast [4096 x [2160 x float]]* %32 to i8*
  call void @free(i8* %33)
  %34 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %y2, align 8, !tbaa !7
  %35 = bitcast [4096 x [2160 x float]]* %34 to i8*
  call void @free(i8* %35)
  %36 = bitcast [4096 x [2160 x float]]** %y2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #4
  %37 = bitcast [4096 x [2160 x float]]** %y1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %37) #4
  %38 = bitcast [4096 x [2160 x float]]** %imgOut to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #4
  %39 = bitcast [4096 x [2160 x float]]** %imgIn to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %39) #4
  %40 = bitcast float* %alpha to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #4
  %41 = bitcast i32* %h to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #4
  %42 = bitcast i32* %w to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %w, i32 %h, float* %alpha, [2160 x float]* %imgIn, [2160 x float]* %imgOut) #0 {
entry:
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %alpha.addr = alloca float*, align 8
  %imgIn.addr = alloca [2160 x float]*, align 8
  %imgOut.addr = alloca [2160 x float]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %w, i32* %w.addr, align 4, !tbaa !3
  store i32 %h, i32* %h.addr, align 4, !tbaa !3
  store float* %alpha, float** %alpha.addr, align 8, !tbaa !7
  store [2160 x float]* %imgIn, [2160 x float]** %imgIn.addr, align 8, !tbaa !7
  store [2160 x float]* %imgOut, [2160 x float]** %imgOut.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = load float*, float** %alpha.addr, align 8, !tbaa !7
  store float 2.500000e-01, float* %2, align 4, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %w.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %h.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %mul = mul nsw i32 313, %7
  %8 = load i32, i32* %j, align 4, !tbaa !3
  %mul4 = mul nsw i32 991, %8
  %add = add nsw i32 %mul, %mul4
  %rem = srem i32 %add, 65536
  %conv = sitofp i32 %rem to float
  %div = fdiv float %conv, 6.553500e+04
  %9 = load [2160 x float]*, [2160 x float]** %imgIn.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [2160 x float], [2160 x float]* %9, i64 %idxprom
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom5 = sext i32 %11 to i64
  %arrayidx6 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx, i64 0, i64 %idxprom5
  store float %div, float* %arrayidx6, align 4, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %inc8 = add nsw i32 %13, 1
  store i32 %inc8, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %14 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #4
  %15 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #4
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_deriche(i32 %w, i32 %h, float %alpha, [2160 x float]* %imgIn, [2160 x float]* %imgOut, [2160 x float]* %y1, [2160 x float]* %y2) #0 {
entry:
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %imgIn.addr = alloca [2160 x float]*, align 8
  %imgOut.addr = alloca [2160 x float]*, align 8
  %y1.addr = alloca [2160 x float]*, align 8
  %y2.addr = alloca [2160 x float]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %xm1 = alloca float, align 4
  %tm1 = alloca float, align 4
  %ym1 = alloca float, align 4
  %ym2 = alloca float, align 4
  %xp1 = alloca float, align 4
  %xp2 = alloca float, align 4
  %tp1 = alloca float, align 4
  %tp2 = alloca float, align 4
  %yp1 = alloca float, align 4
  %yp2 = alloca float, align 4
  %k = alloca float, align 4
  %a1 = alloca float, align 4
  %a2 = alloca float, align 4
  %a3 = alloca float, align 4
  %a4 = alloca float, align 4
  %a5 = alloca float, align 4
  %a6 = alloca float, align 4
  %a7 = alloca float, align 4
  %a8 = alloca float, align 4
  %b1 = alloca float, align 4
  %b2 = alloca float, align 4
  %c1 = alloca float, align 4
  %c2 = alloca float, align 4
  store i32 %w, i32* %w.addr, align 4, !tbaa !3
  store i32 %h, i32* %h.addr, align 4, !tbaa !3
  store float %alpha, float* %alpha.addr, align 4, !tbaa !9
  store [2160 x float]* %imgIn, [2160 x float]** %imgIn.addr, align 8, !tbaa !7
  store [2160 x float]* %imgOut, [2160 x float]** %imgOut.addr, align 8, !tbaa !7
  store [2160 x float]* %y1, [2160 x float]** %y1.addr, align 8, !tbaa !7
  store [2160 x float]* %y2, [2160 x float]** %y2.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = bitcast float* %xm1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #4
  %3 = bitcast float* %tm1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #4
  %4 = bitcast float* %ym1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4
  %5 = bitcast float* %ym2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4
  %6 = bitcast float* %xp1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #4
  %7 = bitcast float* %xp2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #4
  %8 = bitcast float* %tp1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #4
  %9 = bitcast float* %tp2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #4
  %10 = bitcast float* %yp1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #4
  %11 = bitcast float* %yp2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #4
  %12 = bitcast float* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #4
  %13 = bitcast float* %a1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #4
  %14 = bitcast float* %a2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %14) #4
  %15 = bitcast float* %a3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #4
  %16 = bitcast float* %a4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %16) #4
  %17 = bitcast float* %a5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #4
  %18 = bitcast float* %a6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %18) #4
  %19 = bitcast float* %a7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %19) #4
  %20 = bitcast float* %a8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #4
  %21 = bitcast float* %b1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %21) #4
  %22 = bitcast float* %b2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %22) #4
  %23 = bitcast float* %c1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %23) #4
  %24 = bitcast float* %c2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %24) #4
  %25 = load float, float* %alpha.addr, align 4, !tbaa !9
  %sub = fsub float -0.000000e+00, %25
  %26 = call float @llvm.exp.f32(float %sub)
  %sub1 = fsub float 1.000000e+00, %26
  %27 = load float, float* %alpha.addr, align 4, !tbaa !9
  %sub2 = fsub float -0.000000e+00, %27
  %28 = call float @llvm.exp.f32(float %sub2)
  %sub3 = fsub float 1.000000e+00, %28
  %mul = fmul float %sub1, %sub3
  %29 = load float, float* %alpha.addr, align 4, !tbaa !9
  %mul4 = fmul float 2.000000e+00, %29
  %30 = load float, float* %alpha.addr, align 4, !tbaa !9
  %sub5 = fsub float -0.000000e+00, %30
  %31 = call float @llvm.exp.f32(float %sub5)
  %mul6 = fmul float %mul4, %31
  %add = fadd float 1.000000e+00, %mul6
  %32 = load float, float* %alpha.addr, align 4, !tbaa !9
  %mul7 = fmul float 2.000000e+00, %32
  %33 = call float @llvm.exp.f32(float %mul7)
  %sub8 = fsub float %add, %33
  %div = fdiv float %mul, %sub8
  store float %div, float* %k, align 4, !tbaa !9
  %34 = load float, float* %k, align 4, !tbaa !9
  store float %34, float* %a5, align 4, !tbaa !9
  store float %34, float* %a1, align 4, !tbaa !9
  %35 = load float, float* %k, align 4, !tbaa !9
  %36 = load float, float* %alpha.addr, align 4, !tbaa !9
  %sub9 = fsub float -0.000000e+00, %36
  %37 = call float @llvm.exp.f32(float %sub9)
  %mul10 = fmul float %35, %37
  %38 = load float, float* %alpha.addr, align 4, !tbaa !9
  %sub11 = fsub float %38, 1.000000e+00
  %mul12 = fmul float %mul10, %sub11
  store float %mul12, float* %a6, align 4, !tbaa !9
  store float %mul12, float* %a2, align 4, !tbaa !9
  %39 = load float, float* %k, align 4, !tbaa !9
  %40 = load float, float* %alpha.addr, align 4, !tbaa !9
  %sub13 = fsub float -0.000000e+00, %40
  %41 = call float @llvm.exp.f32(float %sub13)
  %mul14 = fmul float %39, %41
  %42 = load float, float* %alpha.addr, align 4, !tbaa !9
  %add15 = fadd float %42, 1.000000e+00
  %mul16 = fmul float %mul14, %add15
  store float %mul16, float* %a7, align 4, !tbaa !9
  store float %mul16, float* %a3, align 4, !tbaa !9
  %43 = load float, float* %k, align 4, !tbaa !9
  %sub17 = fsub float -0.000000e+00, %43
  %44 = load float, float* %alpha.addr, align 4, !tbaa !9
  %mul18 = fmul float -2.000000e+00, %44
  %45 = call float @llvm.exp.f32(float %mul18)
  %mul19 = fmul float %sub17, %45
  store float %mul19, float* %a8, align 4, !tbaa !9
  store float %mul19, float* %a4, align 4, !tbaa !9
  %46 = load float, float* %alpha.addr, align 4, !tbaa !9
  %sub20 = fsub float -0.000000e+00, %46
  %47 = call float @llvm.pow.f32(float 2.000000e+00, float %sub20)
  store float %47, float* %b1, align 4, !tbaa !9
  %48 = load float, float* %alpha.addr, align 4, !tbaa !9
  %mul21 = fmul float -2.000000e+00, %48
  %49 = call float @llvm.exp.f32(float %mul21)
  %sub22 = fsub float -0.000000e+00, %49
  store float %sub22, float* %b2, align 4, !tbaa !9
  store float 1.000000e+00, float* %c2, align 4, !tbaa !9
  store float 1.000000e+00, float* %c1, align 4, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc47, %entry
  %50 = load i32, i32* %i, align 4, !tbaa !3
  %51 = load i32, i32* %w.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %50, %51
  br i1 %cmp, label %for.body, label %for.end49

for.body:                                         ; preds = %for.cond
  store float 0.000000e+00, float* %ym1, align 4, !tbaa !9
  store float 0.000000e+00, float* %ym2, align 4, !tbaa !9
  store float 0.000000e+00, float* %xm1, align 4, !tbaa !9
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc, %for.body
  %52 = load i32, i32* %j, align 4, !tbaa !3
  %53 = load i32, i32* %h.addr, align 4, !tbaa !3
  %cmp24 = icmp slt i32 %52, %53
  br i1 %cmp24, label %for.body25, label %for.end

for.body25:                                       ; preds = %for.cond23
  %54 = load float, float* %a1, align 4, !tbaa !9
  %55 = load [2160 x float]*, [2160 x float]** %imgIn.addr, align 8, !tbaa !7
  %56 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %56 to i64
  %arrayidx = getelementptr inbounds [2160 x float], [2160 x float]* %55, i64 %idxprom
  %57 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom26 = sext i32 %57 to i64
  %arrayidx27 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx, i64 0, i64 %idxprom26
  %58 = load float, float* %arrayidx27, align 4, !tbaa !9
  %mul28 = fmul float %54, %58
  %59 = load float, float* %a2, align 4, !tbaa !9
  %60 = load float, float* %xm1, align 4, !tbaa !9
  %mul29 = fmul float %59, %60
  %add30 = fadd float %mul28, %mul29
  %61 = load float, float* %b1, align 4, !tbaa !9
  %62 = load float, float* %ym1, align 4, !tbaa !9
  %mul31 = fmul float %61, %62
  %add32 = fadd float %add30, %mul31
  %63 = load float, float* %b2, align 4, !tbaa !9
  %64 = load float, float* %ym2, align 4, !tbaa !9
  %mul33 = fmul float %63, %64
  %add34 = fadd float %add32, %mul33
  %65 = load [2160 x float]*, [2160 x float]** %y1.addr, align 8, !tbaa !7
  %66 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom35 = sext i32 %66 to i64
  %arrayidx36 = getelementptr inbounds [2160 x float], [2160 x float]* %65, i64 %idxprom35
  %67 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom37 = sext i32 %67 to i64
  %arrayidx38 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx36, i64 0, i64 %idxprom37
  store float %add34, float* %arrayidx38, align 4, !tbaa !9
  %68 = load [2160 x float]*, [2160 x float]** %imgIn.addr, align 8, !tbaa !7
  %69 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom39 = sext i32 %69 to i64
  %arrayidx40 = getelementptr inbounds [2160 x float], [2160 x float]* %68, i64 %idxprom39
  %70 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom41 = sext i32 %70 to i64
  %arrayidx42 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx40, i64 0, i64 %idxprom41
  %71 = load float, float* %arrayidx42, align 4, !tbaa !9
  store float %71, float* %xm1, align 4, !tbaa !9
  %72 = load float, float* %ym1, align 4, !tbaa !9
  store float %72, float* %ym2, align 4, !tbaa !9
  %73 = load [2160 x float]*, [2160 x float]** %y1.addr, align 8, !tbaa !7
  %74 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom43 = sext i32 %74 to i64
  %arrayidx44 = getelementptr inbounds [2160 x float], [2160 x float]* %73, i64 %idxprom43
  %75 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom45 = sext i32 %75 to i64
  %arrayidx46 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx44, i64 0, i64 %idxprom45
  %76 = load float, float* %arrayidx46, align 4, !tbaa !9
  store float %76, float* %ym1, align 4, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body25
  %77 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %77, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond23

for.end:                                          ; preds = %for.cond23
  br label %for.inc47

for.inc47:                                        ; preds = %for.end
  %78 = load i32, i32* %i, align 4, !tbaa !3
  %inc48 = add nsw i32 %78, 1
  store i32 %inc48, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end49:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc78, %for.end49
  %79 = load i32, i32* %i, align 4, !tbaa !3
  %80 = load i32, i32* %w.addr, align 4, !tbaa !3
  %cmp51 = icmp slt i32 %79, %80
  br i1 %cmp51, label %for.body52, label %for.end80

for.body52:                                       ; preds = %for.cond50
  store float 0.000000e+00, float* %yp1, align 4, !tbaa !9
  store float 0.000000e+00, float* %yp2, align 4, !tbaa !9
  store float 0.000000e+00, float* %xp1, align 4, !tbaa !9
  store float 0.000000e+00, float* %xp2, align 4, !tbaa !9
  %81 = load i32, i32* %h.addr, align 4, !tbaa !3
  %sub53 = sub nsw i32 %81, 1
  store i32 %sub53, i32* %j, align 4, !tbaa !3
  br label %for.cond54

for.cond54:                                       ; preds = %for.inc76, %for.body52
  %82 = load i32, i32* %j, align 4, !tbaa !3
  %cmp55 = icmp sge i32 %82, 0
  br i1 %cmp55, label %for.body56, label %for.end77

for.body56:                                       ; preds = %for.cond54
  %83 = load float, float* %a3, align 4, !tbaa !9
  %84 = load float, float* %xp1, align 4, !tbaa !9
  %mul57 = fmul float %83, %84
  %85 = load float, float* %a4, align 4, !tbaa !9
  %86 = load float, float* %xp2, align 4, !tbaa !9
  %mul58 = fmul float %85, %86
  %add59 = fadd float %mul57, %mul58
  %87 = load float, float* %b1, align 4, !tbaa !9
  %88 = load float, float* %yp1, align 4, !tbaa !9
  %mul60 = fmul float %87, %88
  %add61 = fadd float %add59, %mul60
  %89 = load float, float* %b2, align 4, !tbaa !9
  %90 = load float, float* %yp2, align 4, !tbaa !9
  %mul62 = fmul float %89, %90
  %add63 = fadd float %add61, %mul62
  %91 = load [2160 x float]*, [2160 x float]** %y2.addr, align 8, !tbaa !7
  %92 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom64 = sext i32 %92 to i64
  %arrayidx65 = getelementptr inbounds [2160 x float], [2160 x float]* %91, i64 %idxprom64
  %93 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom66 = sext i32 %93 to i64
  %arrayidx67 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx65, i64 0, i64 %idxprom66
  store float %add63, float* %arrayidx67, align 4, !tbaa !9
  %94 = load float, float* %xp1, align 4, !tbaa !9
  store float %94, float* %xp2, align 4, !tbaa !9
  %95 = load [2160 x float]*, [2160 x float]** %imgIn.addr, align 8, !tbaa !7
  %96 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom68 = sext i32 %96 to i64
  %arrayidx69 = getelementptr inbounds [2160 x float], [2160 x float]* %95, i64 %idxprom68
  %97 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom70 = sext i32 %97 to i64
  %arrayidx71 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx69, i64 0, i64 %idxprom70
  %98 = load float, float* %arrayidx71, align 4, !tbaa !9
  store float %98, float* %xp1, align 4, !tbaa !9
  %99 = load float, float* %yp1, align 4, !tbaa !9
  store float %99, float* %yp2, align 4, !tbaa !9
  %100 = load [2160 x float]*, [2160 x float]** %y2.addr, align 8, !tbaa !7
  %101 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom72 = sext i32 %101 to i64
  %arrayidx73 = getelementptr inbounds [2160 x float], [2160 x float]* %100, i64 %idxprom72
  %102 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom74 = sext i32 %102 to i64
  %arrayidx75 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx73, i64 0, i64 %idxprom74
  %103 = load float, float* %arrayidx75, align 4, !tbaa !9
  store float %103, float* %yp1, align 4, !tbaa !9
  br label %for.inc76

for.inc76:                                        ; preds = %for.body56
  %104 = load i32, i32* %j, align 4, !tbaa !3
  %dec = add nsw i32 %104, -1
  store i32 %dec, i32* %j, align 4, !tbaa !3
  br label %for.cond54

for.end77:                                        ; preds = %for.cond54
  br label %for.inc78

for.inc78:                                        ; preds = %for.end77
  %105 = load i32, i32* %i, align 4, !tbaa !3
  %inc79 = add nsw i32 %105, 1
  store i32 %inc79, i32* %i, align 4, !tbaa !3
  br label %for.cond50

for.end80:                                        ; preds = %for.cond50
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond81

for.cond81:                                       ; preds = %for.inc104, %for.end80
  %106 = load i32, i32* %i, align 4, !tbaa !3
  %107 = load i32, i32* %w.addr, align 4, !tbaa !3
  %cmp82 = icmp slt i32 %106, %107
  br i1 %cmp82, label %for.body83, label %for.end106

for.body83:                                       ; preds = %for.cond81
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond84

for.cond84:                                       ; preds = %for.inc101, %for.body83
  %108 = load i32, i32* %j, align 4, !tbaa !3
  %109 = load i32, i32* %h.addr, align 4, !tbaa !3
  %cmp85 = icmp slt i32 %108, %109
  br i1 %cmp85, label %for.body86, label %for.end103

for.body86:                                       ; preds = %for.cond84
  %110 = load float, float* %c1, align 4, !tbaa !9
  %111 = load [2160 x float]*, [2160 x float]** %y1.addr, align 8, !tbaa !7
  %112 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom87 = sext i32 %112 to i64
  %arrayidx88 = getelementptr inbounds [2160 x float], [2160 x float]* %111, i64 %idxprom87
  %113 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom89 = sext i32 %113 to i64
  %arrayidx90 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx88, i64 0, i64 %idxprom89
  %114 = load float, float* %arrayidx90, align 4, !tbaa !9
  %115 = load [2160 x float]*, [2160 x float]** %y2.addr, align 8, !tbaa !7
  %116 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom91 = sext i32 %116 to i64
  %arrayidx92 = getelementptr inbounds [2160 x float], [2160 x float]* %115, i64 %idxprom91
  %117 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom93 = sext i32 %117 to i64
  %arrayidx94 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx92, i64 0, i64 %idxprom93
  %118 = load float, float* %arrayidx94, align 4, !tbaa !9
  %add95 = fadd float %114, %118
  %mul96 = fmul float %110, %add95
  %119 = load [2160 x float]*, [2160 x float]** %imgOut.addr, align 8, !tbaa !7
  %120 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom97 = sext i32 %120 to i64
  %arrayidx98 = getelementptr inbounds [2160 x float], [2160 x float]* %119, i64 %idxprom97
  %121 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom99 = sext i32 %121 to i64
  %arrayidx100 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx98, i64 0, i64 %idxprom99
  store float %mul96, float* %arrayidx100, align 4, !tbaa !9
  br label %for.inc101

for.inc101:                                       ; preds = %for.body86
  %122 = load i32, i32* %j, align 4, !tbaa !3
  %inc102 = add nsw i32 %122, 1
  store i32 %inc102, i32* %j, align 4, !tbaa !3
  br label %for.cond84

for.end103:                                       ; preds = %for.cond84
  br label %for.inc104

for.inc104:                                       ; preds = %for.end103
  %123 = load i32, i32* %i, align 4, !tbaa !3
  %inc105 = add nsw i32 %123, 1
  store i32 %inc105, i32* %i, align 4, !tbaa !3
  br label %for.cond81

for.end106:                                       ; preds = %for.cond81
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond107

for.cond107:                                      ; preds = %for.inc139, %for.end106
  %124 = load i32, i32* %j, align 4, !tbaa !3
  %125 = load i32, i32* %h.addr, align 4, !tbaa !3
  %cmp108 = icmp slt i32 %124, %125
  br i1 %cmp108, label %for.body109, label %for.end141

for.body109:                                      ; preds = %for.cond107
  store float 0.000000e+00, float* %tm1, align 4, !tbaa !9
  store float 0.000000e+00, float* %ym1, align 4, !tbaa !9
  store float 0.000000e+00, float* %ym2, align 4, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond110

for.cond110:                                      ; preds = %for.inc136, %for.body109
  %126 = load i32, i32* %i, align 4, !tbaa !3
  %127 = load i32, i32* %w.addr, align 4, !tbaa !3
  %cmp111 = icmp slt i32 %126, %127
  br i1 %cmp111, label %for.body112, label %for.end138

for.body112:                                      ; preds = %for.cond110
  %128 = load float, float* %a5, align 4, !tbaa !9
  %129 = load [2160 x float]*, [2160 x float]** %imgOut.addr, align 8, !tbaa !7
  %130 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom113 = sext i32 %130 to i64
  %arrayidx114 = getelementptr inbounds [2160 x float], [2160 x float]* %129, i64 %idxprom113
  %131 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom115 = sext i32 %131 to i64
  %arrayidx116 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx114, i64 0, i64 %idxprom115
  %132 = load float, float* %arrayidx116, align 4, !tbaa !9
  %mul117 = fmul float %128, %132
  %133 = load float, float* %a6, align 4, !tbaa !9
  %134 = load float, float* %tm1, align 4, !tbaa !9
  %mul118 = fmul float %133, %134
  %add119 = fadd float %mul117, %mul118
  %135 = load float, float* %b1, align 4, !tbaa !9
  %136 = load float, float* %ym1, align 4, !tbaa !9
  %mul120 = fmul float %135, %136
  %add121 = fadd float %add119, %mul120
  %137 = load float, float* %b2, align 4, !tbaa !9
  %138 = load float, float* %ym2, align 4, !tbaa !9
  %mul122 = fmul float %137, %138
  %add123 = fadd float %add121, %mul122
  %139 = load [2160 x float]*, [2160 x float]** %y1.addr, align 8, !tbaa !7
  %140 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom124 = sext i32 %140 to i64
  %arrayidx125 = getelementptr inbounds [2160 x float], [2160 x float]* %139, i64 %idxprom124
  %141 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom126 = sext i32 %141 to i64
  %arrayidx127 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx125, i64 0, i64 %idxprom126
  store float %add123, float* %arrayidx127, align 4, !tbaa !9
  %142 = load [2160 x float]*, [2160 x float]** %imgOut.addr, align 8, !tbaa !7
  %143 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom128 = sext i32 %143 to i64
  %arrayidx129 = getelementptr inbounds [2160 x float], [2160 x float]* %142, i64 %idxprom128
  %144 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom130 = sext i32 %144 to i64
  %arrayidx131 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx129, i64 0, i64 %idxprom130
  %145 = load float, float* %arrayidx131, align 4, !tbaa !9
  store float %145, float* %tm1, align 4, !tbaa !9
  %146 = load float, float* %ym1, align 4, !tbaa !9
  store float %146, float* %ym2, align 4, !tbaa !9
  %147 = load [2160 x float]*, [2160 x float]** %y1.addr, align 8, !tbaa !7
  %148 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom132 = sext i32 %148 to i64
  %arrayidx133 = getelementptr inbounds [2160 x float], [2160 x float]* %147, i64 %idxprom132
  %149 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom134 = sext i32 %149 to i64
  %arrayidx135 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx133, i64 0, i64 %idxprom134
  %150 = load float, float* %arrayidx135, align 4, !tbaa !9
  store float %150, float* %ym1, align 4, !tbaa !9
  br label %for.inc136

for.inc136:                                       ; preds = %for.body112
  %151 = load i32, i32* %i, align 4, !tbaa !3
  %inc137 = add nsw i32 %151, 1
  store i32 %inc137, i32* %i, align 4, !tbaa !3
  br label %for.cond110

for.end138:                                       ; preds = %for.cond110
  br label %for.inc139

for.inc139:                                       ; preds = %for.end138
  %152 = load i32, i32* %j, align 4, !tbaa !3
  %inc140 = add nsw i32 %152, 1
  store i32 %inc140, i32* %j, align 4, !tbaa !3
  br label %for.cond107

for.end141:                                       ; preds = %for.cond107
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond142

for.cond142:                                      ; preds = %for.inc171, %for.end141
  %153 = load i32, i32* %j, align 4, !tbaa !3
  %154 = load i32, i32* %h.addr, align 4, !tbaa !3
  %cmp143 = icmp slt i32 %153, %154
  br i1 %cmp143, label %for.body144, label %for.end173

for.body144:                                      ; preds = %for.cond142
  store float 0.000000e+00, float* %tp1, align 4, !tbaa !9
  store float 0.000000e+00, float* %tp2, align 4, !tbaa !9
  store float 0.000000e+00, float* %yp1, align 4, !tbaa !9
  store float 0.000000e+00, float* %yp2, align 4, !tbaa !9
  %155 = load i32, i32* %w.addr, align 4, !tbaa !3
  %sub145 = sub nsw i32 %155, 1
  store i32 %sub145, i32* %i, align 4, !tbaa !3
  br label %for.cond146

for.cond146:                                      ; preds = %for.inc168, %for.body144
  %156 = load i32, i32* %i, align 4, !tbaa !3
  %cmp147 = icmp sge i32 %156, 0
  br i1 %cmp147, label %for.body148, label %for.end170

for.body148:                                      ; preds = %for.cond146
  %157 = load float, float* %a7, align 4, !tbaa !9
  %158 = load float, float* %tp1, align 4, !tbaa !9
  %mul149 = fmul float %157, %158
  %159 = load float, float* %a8, align 4, !tbaa !9
  %160 = load float, float* %tp2, align 4, !tbaa !9
  %mul150 = fmul float %159, %160
  %add151 = fadd float %mul149, %mul150
  %161 = load float, float* %b1, align 4, !tbaa !9
  %162 = load float, float* %yp1, align 4, !tbaa !9
  %mul152 = fmul float %161, %162
  %add153 = fadd float %add151, %mul152
  %163 = load float, float* %b2, align 4, !tbaa !9
  %164 = load float, float* %yp2, align 4, !tbaa !9
  %mul154 = fmul float %163, %164
  %add155 = fadd float %add153, %mul154
  %165 = load [2160 x float]*, [2160 x float]** %y2.addr, align 8, !tbaa !7
  %166 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom156 = sext i32 %166 to i64
  %arrayidx157 = getelementptr inbounds [2160 x float], [2160 x float]* %165, i64 %idxprom156
  %167 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom158 = sext i32 %167 to i64
  %arrayidx159 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx157, i64 0, i64 %idxprom158
  store float %add155, float* %arrayidx159, align 4, !tbaa !9
  %168 = load float, float* %tp1, align 4, !tbaa !9
  store float %168, float* %tp2, align 4, !tbaa !9
  %169 = load [2160 x float]*, [2160 x float]** %imgOut.addr, align 8, !tbaa !7
  %170 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom160 = sext i32 %170 to i64
  %arrayidx161 = getelementptr inbounds [2160 x float], [2160 x float]* %169, i64 %idxprom160
  %171 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom162 = sext i32 %171 to i64
  %arrayidx163 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx161, i64 0, i64 %idxprom162
  %172 = load float, float* %arrayidx163, align 4, !tbaa !9
  store float %172, float* %tp1, align 4, !tbaa !9
  %173 = load float, float* %yp1, align 4, !tbaa !9
  store float %173, float* %yp2, align 4, !tbaa !9
  %174 = load [2160 x float]*, [2160 x float]** %y2.addr, align 8, !tbaa !7
  %175 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom164 = sext i32 %175 to i64
  %arrayidx165 = getelementptr inbounds [2160 x float], [2160 x float]* %174, i64 %idxprom164
  %176 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom166 = sext i32 %176 to i64
  %arrayidx167 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx165, i64 0, i64 %idxprom166
  %177 = load float, float* %arrayidx167, align 4, !tbaa !9
  store float %177, float* %yp1, align 4, !tbaa !9
  br label %for.inc168

for.inc168:                                       ; preds = %for.body148
  %178 = load i32, i32* %i, align 4, !tbaa !3
  %dec169 = add nsw i32 %178, -1
  store i32 %dec169, i32* %i, align 4, !tbaa !3
  br label %for.cond146

for.end170:                                       ; preds = %for.cond146
  br label %for.inc171

for.inc171:                                       ; preds = %for.end170
  %179 = load i32, i32* %j, align 4, !tbaa !3
  %inc172 = add nsw i32 %179, 1
  store i32 %inc172, i32* %j, align 4, !tbaa !3
  br label %for.cond142

for.end173:                                       ; preds = %for.cond142
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond174

for.cond174:                                      ; preds = %for.inc197, %for.end173
  %180 = load i32, i32* %i, align 4, !tbaa !3
  %181 = load i32, i32* %w.addr, align 4, !tbaa !3
  %cmp175 = icmp slt i32 %180, %181
  br i1 %cmp175, label %for.body176, label %for.end199

for.body176:                                      ; preds = %for.cond174
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond177

for.cond177:                                      ; preds = %for.inc194, %for.body176
  %182 = load i32, i32* %j, align 4, !tbaa !3
  %183 = load i32, i32* %h.addr, align 4, !tbaa !3
  %cmp178 = icmp slt i32 %182, %183
  br i1 %cmp178, label %for.body179, label %for.end196

for.body179:                                      ; preds = %for.cond177
  %184 = load float, float* %c2, align 4, !tbaa !9
  %185 = load [2160 x float]*, [2160 x float]** %y1.addr, align 8, !tbaa !7
  %186 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom180 = sext i32 %186 to i64
  %arrayidx181 = getelementptr inbounds [2160 x float], [2160 x float]* %185, i64 %idxprom180
  %187 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom182 = sext i32 %187 to i64
  %arrayidx183 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx181, i64 0, i64 %idxprom182
  %188 = load float, float* %arrayidx183, align 4, !tbaa !9
  %189 = load [2160 x float]*, [2160 x float]** %y2.addr, align 8, !tbaa !7
  %190 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom184 = sext i32 %190 to i64
  %arrayidx185 = getelementptr inbounds [2160 x float], [2160 x float]* %189, i64 %idxprom184
  %191 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom186 = sext i32 %191 to i64
  %arrayidx187 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx185, i64 0, i64 %idxprom186
  %192 = load float, float* %arrayidx187, align 4, !tbaa !9
  %add188 = fadd float %188, %192
  %mul189 = fmul float %184, %add188
  %193 = load [2160 x float]*, [2160 x float]** %imgOut.addr, align 8, !tbaa !7
  %194 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom190 = sext i32 %194 to i64
  %arrayidx191 = getelementptr inbounds [2160 x float], [2160 x float]* %193, i64 %idxprom190
  %195 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom192 = sext i32 %195 to i64
  %arrayidx193 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx191, i64 0, i64 %idxprom192
  store float %mul189, float* %arrayidx193, align 4, !tbaa !9
  br label %for.inc194

for.inc194:                                       ; preds = %for.body179
  %196 = load i32, i32* %j, align 4, !tbaa !3
  %inc195 = add nsw i32 %196, 1
  store i32 %inc195, i32* %j, align 4, !tbaa !3
  br label %for.cond177

for.end196:                                       ; preds = %for.cond177
  br label %for.inc197

for.inc197:                                       ; preds = %for.end196
  %197 = load i32, i32* %i, align 4, !tbaa !3
  %inc198 = add nsw i32 %197, 1
  store i32 %inc198, i32* %i, align 4, !tbaa !3
  br label %for.cond174

for.end199:                                       ; preds = %for.cond174
  %198 = bitcast float* %c2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %198) #4
  %199 = bitcast float* %c1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %199) #4
  %200 = bitcast float* %b2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %200) #4
  %201 = bitcast float* %b1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %201) #4
  %202 = bitcast float* %a8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %202) #4
  %203 = bitcast float* %a7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %203) #4
  %204 = bitcast float* %a6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %204) #4
  %205 = bitcast float* %a5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %205) #4
  %206 = bitcast float* %a4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %206) #4
  %207 = bitcast float* %a3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %207) #4
  %208 = bitcast float* %a2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %208) #4
  %209 = bitcast float* %a1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %209) #4
  %210 = bitcast float* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %210) #4
  %211 = bitcast float* %yp2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %211) #4
  %212 = bitcast float* %yp1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %212) #4
  %213 = bitcast float* %tp2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %213) #4
  %214 = bitcast float* %tp1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %214) #4
  %215 = bitcast float* %xp2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %215) #4
  %216 = bitcast float* %xp1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %216) #4
  %217 = bitcast float* %ym2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %217) #4
  %218 = bitcast float* %ym1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %218) #4
  %219 = bitcast float* %tm1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %219) #4
  %220 = bitcast float* %xm1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %220) #4
  %221 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %221) #4
  %222 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %222) #4
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %w, i32 %h, [2160 x float]* %imgOut) #0 {
entry:
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %imgOut.addr = alloca [2160 x float]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %w, i32* %w.addr, align 4, !tbaa !3
  store i32 %h, i32* %h.addr, align 4, !tbaa !3
  store [2160 x float]* %imgOut, [2160 x float]** %imgOut.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %5 = load i32, i32* %w.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %7 = load i32, i32* %h.addr, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %6, %7
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %h.addr, align 4, !tbaa !3
  %mul = mul nsw i32 %8, %9
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %add = add nsw i32 %mul, %10
  %rem = srem i32 %add, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %11 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call6 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %12 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %13 = load [2160 x float]*, [2160 x float]** %imgOut.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds [2160 x float], [2160 x float]* %13, i64 %idxprom
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds [2160 x float], [2160 x float]* %arrayidx, i64 0, i64 %idxprom7
  %16 = load float, float* %arrayidx8, align 4, !tbaa !9
  %conv = fpext float %16 to double
  %call9 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), double %conv)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %17 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %inc11 = add nsw i32 %18, 1
  store i32 %inc11, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  %19 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  %20 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call14 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %21 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #4
  %22 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #4
  ret void
}

declare void @free(i8*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable
declare float @llvm.exp.f32(float) #3

; Function Attrs: nounwind readnone speculatable
declare float @llvm.pow.f32(float, float) #3

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #2

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 6.0.0 (tags/RELEASE_600/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !5, i64 0}
