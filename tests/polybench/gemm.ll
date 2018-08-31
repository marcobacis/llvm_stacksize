; ModuleID = '../linear-algebra/blas/gemm/gemm.c'
source_filename = "../linear-algebra/blas/gemm/gemm.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
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
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %C = alloca [1000 x [1100 x double]]*, align 8
  %A = alloca [1000 x [1200 x double]]*, align 8
  %B = alloca [1200 x [1100 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %ni to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 1000, i32* %ni, align 4, !tbaa !3
  %1 = bitcast i32* %nj to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 1100, i32* %nj, align 4, !tbaa !3
  %2 = bitcast i32* %nk to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 1200, i32* %nk, align 4, !tbaa !3
  %3 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %4 = bitcast double* %beta to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %5 = bitcast [1000 x [1100 x double]]** %C to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %call = call i8* @polybench_alloc_data(i64 1100000, i32 8)
  %6 = bitcast i8* %call to [1000 x [1100 x double]]*
  store [1000 x [1100 x double]]* %6, [1000 x [1100 x double]]** %C, align 8, !tbaa !7
  %7 = bitcast [1000 x [1200 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #3
  %call1 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %8 = bitcast i8* %call1 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %8, [1000 x [1200 x double]]** %A, align 8, !tbaa !7
  %9 = bitcast [1200 x [1100 x double]]** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #3
  %call2 = call i8* @polybench_alloc_data(i64 1320000, i32 8)
  %10 = bitcast i8* %call2 to [1200 x [1100 x double]]*
  store [1200 x [1100 x double]]* %10, [1200 x [1100 x double]]** %B, align 8, !tbaa !7
  %11 = load i32, i32* %ni, align 4, !tbaa !3
  %12 = load i32, i32* %nj, align 4, !tbaa !3
  %13 = load i32, i32* %nk, align 4, !tbaa !3
  %14 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %C, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1000 x [1100 x double]], [1000 x [1100 x double]]* %14, i32 0, i32 0
  %15 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %A, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %15, i32 0, i32 0
  %16 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %B, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %16, i32 0, i32 0
  call void @init_array(i32 %11, i32 %12, i32 %13, double* %alpha, double* %beta, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  %17 = load i32, i32* %ni, align 4, !tbaa !3
  %18 = load i32, i32* %nj, align 4, !tbaa !3
  %19 = load i32, i32* %nk, align 4, !tbaa !3
  %20 = load double, double* %alpha, align 8, !tbaa !9
  %21 = load double, double* %beta, align 8, !tbaa !9
  %22 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %C, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [1000 x [1100 x double]], [1000 x [1100 x double]]* %22, i32 0, i32 0
  %23 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %A, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %23, i32 0, i32 0
  %24 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %B, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %24, i32 0, i32 0
  call void @kernel_gemm(i32 %17, i32 %18, i32 %19, double %20, double %21, [1100 x double]* %arraydecay5, [1200 x double]* %arraydecay6, [1100 x double]* %arraydecay7)
  %25 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %25, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %26 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %26, i64 0
  %27 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call8 = call i32 @strcmp(i8* %27, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %28 = load i32, i32* %ni, align 4, !tbaa !3
  %29 = load i32, i32* %nj, align 4, !tbaa !3
  %30 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %C, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [1000 x [1100 x double]], [1000 x [1100 x double]]* %30, i32 0, i32 0
  call void @print_array(i32 %28, i32 %29, [1100 x double]* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %31 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %C, align 8, !tbaa !7
  %32 = bitcast [1000 x [1100 x double]]* %31 to i8*
  call void @free(i8* %32)
  %33 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %A, align 8, !tbaa !7
  %34 = bitcast [1000 x [1200 x double]]* %33 to i8*
  call void @free(i8* %34)
  %35 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %B, align 8, !tbaa !7
  %36 = bitcast [1200 x [1100 x double]]* %35 to i8*
  call void @free(i8* %36)
  %37 = bitcast [1200 x [1100 x double]]** %B to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %37) #3
  %38 = bitcast [1000 x [1200 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #3
  %39 = bitcast [1000 x [1100 x double]]** %C to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %39) #3
  %40 = bitcast double* %beta to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %40) #3
  %41 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #3
  %42 = bitcast i32* %nk to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #3
  %43 = bitcast i32* %nj to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #3
  %44 = bitcast i32* %ni to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, double* %alpha, double* %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %C.addr = alloca [1100 x double]*, align 8
  %A.addr = alloca [1200 x double]*, align 8
  %B.addr = alloca [1100 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4, !tbaa !3
  store i32 %nj, i32* %nj.addr, align 4, !tbaa !3
  store i32 %nk, i32* %nk.addr, align 4, !tbaa !3
  store double* %alpha, double** %alpha.addr, align 8, !tbaa !7
  store double* %beta, double** %beta.addr, align 8, !tbaa !7
  store [1100 x double]* %C, [1100 x double]** %C.addr, align 8, !tbaa !7
  store [1200 x double]* %A, [1200 x double]** %A.addr, align 8, !tbaa !7
  store [1100 x double]* %B, [1100 x double]** %B.addr, align 8, !tbaa !7
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
  %7 = load i32, i32* %nj.addr, align 4, !tbaa !3
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
  %12 = load [1100 x double]*, [1100 x double]** %C.addr, align 8, !tbaa !7
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
  %18 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp11 = icmp slt i32 %17, %18
  br i1 %cmp11, label %for.body13, label %for.end33

for.body13:                                       ; preds = %for.cond10
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc28, %for.body13
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %20 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %cmp15 = icmp slt i32 %19, %20
  br i1 %cmp15, label %for.body17, label %for.end30

for.body17:                                       ; preds = %for.cond14
  %21 = load i32, i32* %i, align 4, !tbaa !3
  %22 = load i32, i32* %j, align 4, !tbaa !3
  %add18 = add nsw i32 %22, 1
  %mul19 = mul nsw i32 %21, %add18
  %23 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %rem20 = srem i32 %mul19, %23
  %conv21 = sitofp i32 %rem20 to double
  %24 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %conv22 = sitofp i32 %24 to double
  %div23 = fdiv double %conv21, %conv22
  %25 = load [1200 x double]*, [1200 x double]** %A.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom24 = sext i32 %26 to i64
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %idxprom24
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom26 = sext i32 %27 to i64
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx25, i64 0, i64 %idxprom26
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

for.cond34:                                       ; preds = %for.inc55, %for.end33
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %31 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %cmp35 = icmp slt i32 %30, %31
  br i1 %cmp35, label %for.body37, label %for.end57

for.body37:                                       ; preds = %for.cond34
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc52, %for.body37
  %32 = load i32, i32* %j, align 4, !tbaa !3
  %33 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp39 = icmp slt i32 %32, %33
  br i1 %cmp39, label %for.body41, label %for.end54

for.body41:                                       ; preds = %for.cond38
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %35 = load i32, i32* %j, align 4, !tbaa !3
  %add42 = add nsw i32 %35, 2
  %mul43 = mul nsw i32 %34, %add42
  %36 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %rem44 = srem i32 %mul43, %36
  %conv45 = sitofp i32 %rem44 to double
  %37 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %conv46 = sitofp i32 %37 to double
  %div47 = fdiv double %conv45, %conv46
  %38 = load [1100 x double]*, [1100 x double]** %B.addr, align 8, !tbaa !7
  %39 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom48 = sext i32 %39 to i64
  %arrayidx49 = getelementptr inbounds [1100 x double], [1100 x double]* %38, i64 %idxprom48
  %40 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom50 = sext i32 %40 to i64
  %arrayidx51 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx49, i64 0, i64 %idxprom50
  store double %div47, double* %arrayidx51, align 8, !tbaa !9
  br label %for.inc52

for.inc52:                                        ; preds = %for.body41
  %41 = load i32, i32* %j, align 4, !tbaa !3
  %inc53 = add nsw i32 %41, 1
  store i32 %inc53, i32* %j, align 4, !tbaa !3
  br label %for.cond38

for.end54:                                        ; preds = %for.cond38
  br label %for.inc55

for.inc55:                                        ; preds = %for.end54
  %42 = load i32, i32* %i, align 4, !tbaa !3
  %inc56 = add nsw i32 %42, 1
  store i32 %inc56, i32* %i, align 4, !tbaa !3
  br label %for.cond34

for.end57:                                        ; preds = %for.cond34
  %43 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #3
  %44 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca [1100 x double]*, align 8
  %A.addr = alloca [1200 x double]*, align 8
  %B.addr = alloca [1100 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4, !tbaa !3
  store i32 %nj, i32* %nj.addr, align 4, !tbaa !3
  store i32 %nk, i32* %nk.addr, align 4, !tbaa !3
  store double %alpha, double* %alpha.addr, align 8, !tbaa !9
  store double %beta, double* %beta.addr, align 8, !tbaa !9
  store [1100 x double]* %C, [1100 x double]** %C.addr, align 8, !tbaa !7
  store [1200 x double]* %A, [1200 x double]** %A.addr, align 8, !tbaa !7
  store [1100 x double]* %B, [1100 x double]** %B.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc32, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end34

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %7 = load double, double* %beta.addr, align 8, !tbaa !9
  %8 = load [1100 x double]*, [1100 x double]** %C.addr, align 8, !tbaa !7
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %idxprom
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom4 = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx, i64 0, i64 %idxprom4
  %11 = load double, double* %arrayidx5, align 8, !tbaa !9
  %mul = fmul double %11, %7
  store double %mul, double* %arrayidx5, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc29, %for.end
  %13 = load i32, i32* %k, align 4, !tbaa !3
  %14 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %cmp7 = icmp slt i32 %13, %14
  br i1 %cmp7, label %for.body8, label %for.end31

for.body8:                                        ; preds = %for.cond6
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc26, %for.body8
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %16 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp10 = icmp slt i32 %15, %16
  br i1 %cmp10, label %for.body11, label %for.end28

for.body11:                                       ; preds = %for.cond9
  %17 = load double, double* %alpha.addr, align 8, !tbaa !9
  %18 = load [1200 x double]*, [1200 x double]** %A.addr, align 8, !tbaa !7
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom12 = sext i32 %19 to i64
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %idxprom12
  %20 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom14 = sext i32 %20 to i64
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx13, i64 0, i64 %idxprom14
  %21 = load double, double* %arrayidx15, align 8, !tbaa !9
  %mul16 = fmul double %17, %21
  %22 = load [1100 x double]*, [1100 x double]** %B.addr, align 8, !tbaa !7
  %23 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom17 = sext i32 %23 to i64
  %arrayidx18 = getelementptr inbounds [1100 x double], [1100 x double]* %22, i64 %idxprom17
  %24 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom19 = sext i32 %24 to i64
  %arrayidx20 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx18, i64 0, i64 %idxprom19
  %25 = load double, double* %arrayidx20, align 8, !tbaa !9
  %mul21 = fmul double %mul16, %25
  %26 = load [1100 x double]*, [1100 x double]** %C.addr, align 8, !tbaa !7
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom22 = sext i32 %27 to i64
  %arrayidx23 = getelementptr inbounds [1100 x double], [1100 x double]* %26, i64 %idxprom22
  %28 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom24 = sext i32 %28 to i64
  %arrayidx25 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx23, i64 0, i64 %idxprom24
  %29 = load double, double* %arrayidx25, align 8, !tbaa !9
  %add = fadd double %29, %mul21
  store double %add, double* %arrayidx25, align 8, !tbaa !9
  br label %for.inc26

for.inc26:                                        ; preds = %for.body11
  %30 = load i32, i32* %j, align 4, !tbaa !3
  %inc27 = add nsw i32 %30, 1
  store i32 %inc27, i32* %j, align 4, !tbaa !3
  br label %for.cond9

for.end28:                                        ; preds = %for.cond9
  br label %for.inc29

for.inc29:                                        ; preds = %for.end28
  %31 = load i32, i32* %k, align 4, !tbaa !3
  %inc30 = add nsw i32 %31, 1
  store i32 %inc30, i32* %k, align 4, !tbaa !3
  br label %for.cond6

for.end31:                                        ; preds = %for.cond6
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %inc33 = add nsw i32 %32, 1
  store i32 %inc33, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end34:                                        ; preds = %for.cond
  %33 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #3
  %34 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #3
  %35 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %ni, i32 %nj, [1100 x double]* %C) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %C.addr = alloca [1100 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4, !tbaa !3
  store i32 %nj, i32* %nj.addr, align 4, !tbaa !3
  store [1100 x double]* %C, [1100 x double]** %C.addr, align 8, !tbaa !7
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
  %7 = load i32, i32* %nj.addr, align 4, !tbaa !3
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
  %13 = load [1100 x double]*, [1100 x double]** %C.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds [1100 x double], [1100 x double]* %13, i64 %idxprom
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx, i64 0, i64 %idxprom7
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
