; ModuleID = '../linear-algebra/kernels/2mm/2mm.c'
source_filename = "../linear-algebra/kernels/2mm/2mm.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %nl = alloca i32, align 4
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %tmp = alloca [800 x [900 x double]]*, align 8
  %A = alloca [800 x [1100 x double]]*, align 8
  %B = alloca [1100 x [900 x double]]*, align 8
  %C = alloca [900 x [1200 x double]]*, align 8
  %D = alloca [800 x [1200 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %ni to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 800, i32* %ni, align 4, !tbaa !3
  %1 = bitcast i32* %nj to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 900, i32* %nj, align 4, !tbaa !3
  %2 = bitcast i32* %nk to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 1100, i32* %nk, align 4, !tbaa !3
  %3 = bitcast i32* %nl to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3
  store i32 1200, i32* %nl, align 4, !tbaa !3
  %4 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %5 = bitcast double* %beta to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %6 = bitcast [800 x [900 x double]]** %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #3
  %call = call i8* @polybench_alloc_data(i64 720000, i32 8)
  %7 = bitcast i8* %call to [800 x [900 x double]]*
  store [800 x [900 x double]]* %7, [800 x [900 x double]]** %tmp, align 8, !tbaa !7
  %8 = bitcast [800 x [1100 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #3
  %call1 = call i8* @polybench_alloc_data(i64 880000, i32 8)
  %9 = bitcast i8* %call1 to [800 x [1100 x double]]*
  store [800 x [1100 x double]]* %9, [800 x [1100 x double]]** %A, align 8, !tbaa !7
  %10 = bitcast [1100 x [900 x double]]** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #3
  %call2 = call i8* @polybench_alloc_data(i64 990000, i32 8)
  %11 = bitcast i8* %call2 to [1100 x [900 x double]]*
  store [1100 x [900 x double]]* %11, [1100 x [900 x double]]** %B, align 8, !tbaa !7
  %12 = bitcast [900 x [1200 x double]]** %C to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #3
  %call3 = call i8* @polybench_alloc_data(i64 1080000, i32 8)
  %13 = bitcast i8* %call3 to [900 x [1200 x double]]*
  store [900 x [1200 x double]]* %13, [900 x [1200 x double]]** %C, align 8, !tbaa !7
  %14 = bitcast [800 x [1200 x double]]** %D to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %14) #3
  %call4 = call i8* @polybench_alloc_data(i64 960000, i32 8)
  %15 = bitcast i8* %call4 to [800 x [1200 x double]]*
  store [800 x [1200 x double]]* %15, [800 x [1200 x double]]** %D, align 8, !tbaa !7
  %16 = load i32, i32* %ni, align 4, !tbaa !3
  %17 = load i32, i32* %nj, align 4, !tbaa !3
  %18 = load i32, i32* %nk, align 4, !tbaa !3
  %19 = load i32, i32* %nl, align 4, !tbaa !3
  %20 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %20, i32 0, i32 0
  %21 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %B, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [1100 x [900 x double]], [1100 x [900 x double]]* %21, i32 0, i32 0
  %22 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %22, i32 0, i32 0
  %23 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %D, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %23, i32 0, i32 0
  call void @init_array(i32 %16, i32 %17, i32 %18, i32 %19, double* %alpha, double* %beta, [1100 x double]* %arraydecay, [900 x double]* %arraydecay5, [1200 x double]* %arraydecay6, [1200 x double]* %arraydecay7)
  %24 = load i32, i32* %ni, align 4, !tbaa !3
  %25 = load i32, i32* %nj, align 4, !tbaa !3
  %26 = load i32, i32* %nk, align 4, !tbaa !3
  %27 = load i32, i32* %nl, align 4, !tbaa !3
  %28 = load double, double* %alpha, align 8, !tbaa !9
  %29 = load double, double* %beta, align 8, !tbaa !9
  %30 = load [800 x [900 x double]]*, [800 x [900 x double]]** %tmp, align 8, !tbaa !7
  %arraydecay8 = getelementptr inbounds [800 x [900 x double]], [800 x [900 x double]]* %30, i32 0, i32 0
  %31 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %A, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %31, i32 0, i32 0
  %32 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %B, align 8, !tbaa !7
  %arraydecay10 = getelementptr inbounds [1100 x [900 x double]], [1100 x [900 x double]]* %32, i32 0, i32 0
  %33 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8, !tbaa !7
  %arraydecay11 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %33, i32 0, i32 0
  %34 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %D, align 8, !tbaa !7
  %arraydecay12 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %34, i32 0, i32 0
  call void @kernel_2mm(i32 %24, i32 %25, i32 %26, i32 %27, double %28, double %29, [900 x double]* %arraydecay8, [1100 x double]* %arraydecay9, [900 x double]* %arraydecay10, [1200 x double]* %arraydecay11, [1200 x double]* %arraydecay12)
  %35 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %35, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %36 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %36, i64 0
  %37 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call13 = call i32 @strcmp(i8* %37, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call13, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %38 = load i32, i32* %ni, align 4, !tbaa !3
  %39 = load i32, i32* %nl, align 4, !tbaa !3
  %40 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %D, align 8, !tbaa !7
  %arraydecay14 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %40, i32 0, i32 0
  call void @print_array(i32 %38, i32 %39, [1200 x double]* %arraydecay14)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %41 = load [800 x [900 x double]]*, [800 x [900 x double]]** %tmp, align 8, !tbaa !7
  %42 = bitcast [800 x [900 x double]]* %41 to i8*
  call void @free(i8* %42)
  %43 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %A, align 8, !tbaa !7
  %44 = bitcast [800 x [1100 x double]]* %43 to i8*
  call void @free(i8* %44)
  %45 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %B, align 8, !tbaa !7
  %46 = bitcast [1100 x [900 x double]]* %45 to i8*
  call void @free(i8* %46)
  %47 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8, !tbaa !7
  %48 = bitcast [900 x [1200 x double]]* %47 to i8*
  call void @free(i8* %48)
  %49 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %D, align 8, !tbaa !7
  %50 = bitcast [800 x [1200 x double]]* %49 to i8*
  call void @free(i8* %50)
  %51 = bitcast [800 x [1200 x double]]** %D to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %51) #3
  %52 = bitcast [900 x [1200 x double]]** %C to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %52) #3
  %53 = bitcast [1100 x [900 x double]]** %B to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %53) #3
  %54 = bitcast [800 x [1100 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %54) #3
  %55 = bitcast [800 x [900 x double]]** %tmp to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %55) #3
  %56 = bitcast double* %beta to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %56) #3
  %57 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %57) #3
  %58 = bitcast i32* %nl to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %58) #3
  %59 = bitcast i32* %nk to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %59) #3
  %60 = bitcast i32* %nj to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %60) #3
  %61 = bitcast i32* %ni to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %61) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %alpha, double* %beta, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %A.addr = alloca [1100 x double]*, align 8
  %B.addr = alloca [900 x double]*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %D.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4, !tbaa !3
  store i32 %nj, i32* %nj.addr, align 4, !tbaa !3
  store i32 %nk, i32* %nk.addr, align 4, !tbaa !3
  store i32 %nl, i32* %nl.addr, align 4, !tbaa !3
  store double* %alpha, double** %alpha.addr, align 8, !tbaa !7
  store double* %beta, double** %beta.addr, align 8, !tbaa !7
  store [1100 x double]* %A, [1100 x double]** %A.addr, align 8, !tbaa !7
  store [900 x double]* %B, [900 x double]** %B.addr, align 8, !tbaa !7
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8, !tbaa !7
  store [1200 x double]* %D, [1200 x double]** %D.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = load double*, double** %alpha.addr, align 8, !tbaa !7
  store double 1.500000e+00, double* %2, align 8, !tbaa !9
  %3 = load double*, double** %beta.addr, align 8, !tbaa !7
  store double 1.200000e+00, double* %3, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %5 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %7 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %j, align 4, !tbaa !3
  %mul = mul nsw i32 %8, %9
  %add = add nsw i32 %mul, 1
  %10 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %rem = srem i32 %add, %10
  %conv = sitofp i32 %rem to double
  %11 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %conv4 = sitofp i32 %11 to double
  %div = fdiv double %conv, %conv4
  %12 = load [1100 x double]*, [1100 x double]** %A.addr, align 8, !tbaa !7
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %13 to i64
  %arrayidx = getelementptr inbounds [1100 x double], [1100 x double]* %12, i64 %idxprom
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom5 = sext i32 %14 to i64
  %arrayidx6 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx, i64 0, i64 %idxprom5
  store double %div, double* %arrayidx6, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %inc8 = add nsw i32 %16, 1
  store i32 %inc8, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc31, %for.end9
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %18 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %cmp11 = icmp slt i32 %17, %18
  br i1 %cmp11, label %for.body13, label %for.end33

for.body13:                                       ; preds = %for.cond10
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc28, %for.body13
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %20 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp15 = icmp slt i32 %19, %20
  br i1 %cmp15, label %for.body17, label %for.end30

for.body17:                                       ; preds = %for.cond14
  %21 = load i32, i32* %i, align 4, !tbaa !3
  %22 = load i32, i32* %j, align 4, !tbaa !3
  %add18 = add nsw i32 %22, 1
  %mul19 = mul nsw i32 %21, %add18
  %23 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %rem20 = srem i32 %mul19, %23
  %conv21 = sitofp i32 %rem20 to double
  %24 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %conv22 = sitofp i32 %24 to double
  %div23 = fdiv double %conv21, %conv22
  %25 = load [900 x double]*, [900 x double]** %B.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom24 = sext i32 %26 to i64
  %arrayidx25 = getelementptr inbounds [900 x double], [900 x double]* %25, i64 %idxprom24
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom26 = sext i32 %27 to i64
  %arrayidx27 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx25, i64 0, i64 %idxprom26
  store double %div23, double* %arrayidx27, align 8, !tbaa !9
  br label %for.inc28

for.inc28:                                        ; preds = %for.body17
  %28 = load i32, i32* %j, align 4, !tbaa !3
  %inc29 = add nsw i32 %28, 1
  store i32 %inc29, i32* %j, align 4, !tbaa !3
  br label %for.cond14

for.end30:                                        ; preds = %for.cond14
  br label %for.inc31

for.inc31:                                        ; preds = %for.end30
  %29 = load i32, i32* %i, align 4, !tbaa !3
  %inc32 = add nsw i32 %29, 1
  store i32 %inc32, i32* %i, align 4, !tbaa !3
  br label %for.cond10

for.end33:                                        ; preds = %for.cond10
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc56, %for.end33
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %31 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp35 = icmp slt i32 %30, %31
  br i1 %cmp35, label %for.body37, label %for.end58

for.body37:                                       ; preds = %for.cond34
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc53, %for.body37
  %32 = load i32, i32* %j, align 4, !tbaa !3
  %33 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %cmp39 = icmp slt i32 %32, %33
  br i1 %cmp39, label %for.body41, label %for.end55

for.body41:                                       ; preds = %for.cond38
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %35 = load i32, i32* %j, align 4, !tbaa !3
  %add42 = add nsw i32 %35, 3
  %mul43 = mul nsw i32 %34, %add42
  %add44 = add nsw i32 %mul43, 1
  %36 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %rem45 = srem i32 %add44, %36
  %conv46 = sitofp i32 %rem45 to double
  %37 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %conv47 = sitofp i32 %37 to double
  %div48 = fdiv double %conv46, %conv47
  %38 = load [1200 x double]*, [1200 x double]** %C.addr, align 8, !tbaa !7
  %39 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom49 = sext i32 %39 to i64
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %38, i64 %idxprom49
  %40 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom51 = sext i32 %40 to i64
  %arrayidx52 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx50, i64 0, i64 %idxprom51
  store double %div48, double* %arrayidx52, align 8, !tbaa !9
  br label %for.inc53

for.inc53:                                        ; preds = %for.body41
  %41 = load i32, i32* %j, align 4, !tbaa !3
  %inc54 = add nsw i32 %41, 1
  store i32 %inc54, i32* %j, align 4, !tbaa !3
  br label %for.cond38

for.end55:                                        ; preds = %for.cond38
  br label %for.inc56

for.inc56:                                        ; preds = %for.end55
  %42 = load i32, i32* %i, align 4, !tbaa !3
  %inc57 = add nsw i32 %42, 1
  store i32 %inc57, i32* %i, align 4, !tbaa !3
  br label %for.cond34

for.end58:                                        ; preds = %for.cond34
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc80, %for.end58
  %43 = load i32, i32* %i, align 4, !tbaa !3
  %44 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp60 = icmp slt i32 %43, %44
  br i1 %cmp60, label %for.body62, label %for.end82

for.body62:                                       ; preds = %for.cond59
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc77, %for.body62
  %45 = load i32, i32* %j, align 4, !tbaa !3
  %46 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %cmp64 = icmp slt i32 %45, %46
  br i1 %cmp64, label %for.body66, label %for.end79

for.body66:                                       ; preds = %for.cond63
  %47 = load i32, i32* %i, align 4, !tbaa !3
  %48 = load i32, i32* %j, align 4, !tbaa !3
  %add67 = add nsw i32 %48, 2
  %mul68 = mul nsw i32 %47, %add67
  %49 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %rem69 = srem i32 %mul68, %49
  %conv70 = sitofp i32 %rem69 to double
  %50 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %conv71 = sitofp i32 %50 to double
  %div72 = fdiv double %conv70, %conv71
  %51 = load [1200 x double]*, [1200 x double]** %D.addr, align 8, !tbaa !7
  %52 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom73 = sext i32 %52 to i64
  %arrayidx74 = getelementptr inbounds [1200 x double], [1200 x double]* %51, i64 %idxprom73
  %53 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom75 = sext i32 %53 to i64
  %arrayidx76 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx74, i64 0, i64 %idxprom75
  store double %div72, double* %arrayidx76, align 8, !tbaa !9
  br label %for.inc77

for.inc77:                                        ; preds = %for.body66
  %54 = load i32, i32* %j, align 4, !tbaa !3
  %inc78 = add nsw i32 %54, 1
  store i32 %inc78, i32* %j, align 4, !tbaa !3
  br label %for.cond63

for.end79:                                        ; preds = %for.cond63
  br label %for.inc80

for.inc80:                                        ; preds = %for.end79
  %55 = load i32, i32* %i, align 4, !tbaa !3
  %inc81 = add nsw i32 %55, 1
  store i32 %inc81, i32* %i, align 4, !tbaa !3
  br label %for.cond59

for.end82:                                        ; preds = %for.cond59
  %56 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %56) #3
  %57 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %57) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, [900 x double]* %tmp, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %tmp.addr = alloca [900 x double]*, align 8
  %A.addr = alloca [1100 x double]*, align 8
  %B.addr = alloca [900 x double]*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %D.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4, !tbaa !3
  store i32 %nj, i32* %nj.addr, align 4, !tbaa !3
  store i32 %nk, i32* %nk.addr, align 4, !tbaa !3
  store i32 %nl, i32* %nl.addr, align 4, !tbaa !3
  store double %alpha, double* %alpha.addr, align 8, !tbaa !9
  store double %beta, double* %beta.addr, align 8, !tbaa !9
  store [900 x double]* %tmp, [900 x double]** %tmp.addr, align 8, !tbaa !7
  store [1100 x double]* %A, [1100 x double]** %A.addr, align 8, !tbaa !7
  store [900 x double]* %B, [900 x double]** %B.addr, align 8, !tbaa !7
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8, !tbaa !7
  store [1200 x double]* %D, [1200 x double]** %D.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc25, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end27

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc22, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end24

for.body3:                                        ; preds = %for.cond1
  %7 = load [900 x double]*, [900 x double]** %tmp.addr, align 8, !tbaa !7
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %idxprom
  %9 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom4 = sext i32 %9 to i64
  %arrayidx5 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx, i64 0, i64 %idxprom4
  store double 0.000000e+00, double* %arrayidx5, align 8, !tbaa !9
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body3
  %10 = load i32, i32* %k, align 4, !tbaa !3
  %11 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %cmp7 = icmp slt i32 %10, %11
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %12 = load double, double* %alpha.addr, align 8, !tbaa !9
  %13 = load [1100 x double]*, [1100 x double]** %A.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds [1100 x double], [1100 x double]* %13, i64 %idxprom9
  %15 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom11 = sext i32 %15 to i64
  %arrayidx12 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx10, i64 0, i64 %idxprom11
  %16 = load double, double* %arrayidx12, align 8, !tbaa !9
  %mul = fmul double %12, %16
  %17 = load [900 x double]*, [900 x double]** %B.addr, align 8, !tbaa !7
  %18 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom13 = sext i32 %18 to i64
  %arrayidx14 = getelementptr inbounds [900 x double], [900 x double]* %17, i64 %idxprom13
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom15 = sext i32 %19 to i64
  %arrayidx16 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx14, i64 0, i64 %idxprom15
  %20 = load double, double* %arrayidx16, align 8, !tbaa !9
  %mul17 = fmul double %mul, %20
  %21 = load [900 x double]*, [900 x double]** %tmp.addr, align 8, !tbaa !7
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom18 = sext i32 %22 to i64
  %arrayidx19 = getelementptr inbounds [900 x double], [900 x double]* %21, i64 %idxprom18
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom20 = sext i32 %23 to i64
  %arrayidx21 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx19, i64 0, i64 %idxprom20
  %24 = load double, double* %arrayidx21, align 8, !tbaa !9
  %add = fadd double %24, %mul17
  store double %add, double* %arrayidx21, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %25 = load i32, i32* %k, align 4, !tbaa !3
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %k, align 4, !tbaa !3
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc22

for.inc22:                                        ; preds = %for.end
  %26 = load i32, i32* %j, align 4, !tbaa !3
  %inc23 = add nsw i32 %26, 1
  store i32 %inc23, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end24:                                        ; preds = %for.cond1
  br label %for.inc25

for.inc25:                                        ; preds = %for.end24
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %inc26 = add nsw i32 %27, 1
  store i32 %inc26, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end27:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond28

for.cond28:                                       ; preds = %for.inc62, %for.end27
  %28 = load i32, i32* %i, align 4, !tbaa !3
  %29 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp29 = icmp slt i32 %28, %29
  br i1 %cmp29, label %for.body30, label %for.end64

for.body30:                                       ; preds = %for.cond28
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc59, %for.body30
  %30 = load i32, i32* %j, align 4, !tbaa !3
  %31 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %cmp32 = icmp slt i32 %30, %31
  br i1 %cmp32, label %for.body33, label %for.end61

for.body33:                                       ; preds = %for.cond31
  %32 = load double, double* %beta.addr, align 8, !tbaa !9
  %33 = load [1200 x double]*, [1200 x double]** %D.addr, align 8, !tbaa !7
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom34 = sext i32 %34 to i64
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %idxprom34
  %35 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom36 = sext i32 %35 to i64
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx35, i64 0, i64 %idxprom36
  %36 = load double, double* %arrayidx37, align 8, !tbaa !9
  %mul38 = fmul double %36, %32
  store double %mul38, double* %arrayidx37, align 8, !tbaa !9
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond39

for.cond39:                                       ; preds = %for.inc56, %for.body33
  %37 = load i32, i32* %k, align 4, !tbaa !3
  %38 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp40 = icmp slt i32 %37, %38
  br i1 %cmp40, label %for.body41, label %for.end58

for.body41:                                       ; preds = %for.cond39
  %39 = load [900 x double]*, [900 x double]** %tmp.addr, align 8, !tbaa !7
  %40 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom42 = sext i32 %40 to i64
  %arrayidx43 = getelementptr inbounds [900 x double], [900 x double]* %39, i64 %idxprom42
  %41 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom44 = sext i32 %41 to i64
  %arrayidx45 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx43, i64 0, i64 %idxprom44
  %42 = load double, double* %arrayidx45, align 8, !tbaa !9
  %43 = load [1200 x double]*, [1200 x double]** %C.addr, align 8, !tbaa !7
  %44 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom46 = sext i32 %44 to i64
  %arrayidx47 = getelementptr inbounds [1200 x double], [1200 x double]* %43, i64 %idxprom46
  %45 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom48 = sext i32 %45 to i64
  %arrayidx49 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx47, i64 0, i64 %idxprom48
  %46 = load double, double* %arrayidx49, align 8, !tbaa !9
  %mul50 = fmul double %42, %46
  %47 = load [1200 x double]*, [1200 x double]** %D.addr, align 8, !tbaa !7
  %48 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom51 = sext i32 %48 to i64
  %arrayidx52 = getelementptr inbounds [1200 x double], [1200 x double]* %47, i64 %idxprom51
  %49 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom53 = sext i32 %49 to i64
  %arrayidx54 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx52, i64 0, i64 %idxprom53
  %50 = load double, double* %arrayidx54, align 8, !tbaa !9
  %add55 = fadd double %50, %mul50
  store double %add55, double* %arrayidx54, align 8, !tbaa !9
  br label %for.inc56

for.inc56:                                        ; preds = %for.body41
  %51 = load i32, i32* %k, align 4, !tbaa !3
  %inc57 = add nsw i32 %51, 1
  store i32 %inc57, i32* %k, align 4, !tbaa !3
  br label %for.cond39

for.end58:                                        ; preds = %for.cond39
  br label %for.inc59

for.inc59:                                        ; preds = %for.end58
  %52 = load i32, i32* %j, align 4, !tbaa !3
  %inc60 = add nsw i32 %52, 1
  store i32 %inc60, i32* %j, align 4, !tbaa !3
  br label %for.cond31

for.end61:                                        ; preds = %for.cond31
  br label %for.inc62

for.inc62:                                        ; preds = %for.end61
  %53 = load i32, i32* %i, align 4, !tbaa !3
  %inc63 = add nsw i32 %53, 1
  store i32 %inc63, i32* %i, align 4, !tbaa !3
  br label %for.cond28

for.end64:                                        ; preds = %for.cond28
  %54 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %54) #3
  %55 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %55) #3
  %56 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %56) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1200 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %D.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4, !tbaa !3
  store i32 %nl, i32* %nl.addr, align 4, !tbaa !3
  store [1200 x double]* %D, [1200 x double]** %D.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %5 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %7 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %6, %7
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %ni.addr, align 4, !tbaa !3
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
  %13 = load [1200 x double]*, [1200 x double]** %D.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds [1200 x double], [1200 x double]* %13, i64 %idxprom
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx, i64 0, i64 %idxprom7
  %16 = load double, double* %arrayidx8, align 8, !tbaa !9
  %call9 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %16)
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
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %20 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call14 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %21 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #3
  %22 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3
  ret void
}

declare void @free(i8*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #2

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

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
!10 = !{!"double", !5, i64 0}
