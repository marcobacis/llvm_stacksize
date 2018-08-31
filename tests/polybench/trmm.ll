; ModuleID = '../linear-algebra/blas/trmm/trmm.c'
source_filename = "../linear-algebra/blas/trmm/trmm.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
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
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %alpha = alloca double, align 8
  %A = alloca [1000 x [1000 x double]]*, align 8
  %B = alloca [1000 x [1200 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 1000, i32* %m, align 4, !tbaa !3
  %1 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 1200, i32* %n, align 4, !tbaa !3
  %2 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %3 = bitcast [1000 x [1000 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %call = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %4 = bitcast i8* %call to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %4, [1000 x [1000 x double]]** %A, align 8, !tbaa !7
  %5 = bitcast [1000 x [1200 x double]]** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %call1 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %6 = bitcast i8* %call1 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %6, [1000 x [1200 x double]]** %B, align 8, !tbaa !7
  %7 = load i32, i32* %m, align 4, !tbaa !3
  %8 = load i32, i32* %n, align 4, !tbaa !3
  %9 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %9, i32 0, i32 0
  %10 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %B, align 8, !tbaa !7
  %arraydecay2 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %10, i32 0, i32 0
  call void @init_array(i32 %7, i32 %8, double* %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  %11 = load i32, i32* %m, align 4, !tbaa !3
  %12 = load i32, i32* %n, align 4, !tbaa !3
  %13 = load double, double* %alpha, align 8, !tbaa !9
  %14 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %A, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %14, i32 0, i32 0
  %15 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %B, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %15, i32 0, i32 0
  call void @kernel_trmm(i32 %11, i32 %12, double %13, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  %16 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %16, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %17 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %17, i64 0
  %18 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call5 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call5, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %19 = load i32, i32* %m, align 4, !tbaa !3
  %20 = load i32, i32* %n, align 4, !tbaa !3
  %21 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %B, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %21, i32 0, i32 0
  call void @print_array(i32 %19, i32 %20, [1200 x double]* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %22 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %A, align 8, !tbaa !7
  %23 = bitcast [1000 x [1000 x double]]* %22 to i8*
  call void @free(i8* %23)
  %24 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %B, align 8, !tbaa !7
  %25 = bitcast [1000 x [1200 x double]]* %24 to i8*
  call void @free(i8* %25)
  %26 = bitcast [1000 x [1200 x double]]** %B to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %26) #3
  %27 = bitcast [1000 x [1000 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %27) #3
  %28 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %28) #3
  %29 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3
  %30 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %alpha, double** %alpha.addr, align 8, !tbaa !7
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8, !tbaa !7
  store [1200 x double]* %B, [1200 x double]** %B.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = load double*, double** %alpha.addr, align 8, !tbaa !7
  store double 1.500000e+00, double* %2, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc27, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end29

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %8 = load i32, i32* %j, align 4, !tbaa !3
  %add = add nsw i32 %7, %8
  %9 = load i32, i32* %m.addr, align 4, !tbaa !3
  %rem = srem i32 %add, %9
  %conv = sitofp i32 %rem to double
  %10 = load i32, i32* %m.addr, align 4, !tbaa !3
  %conv4 = sitofp i32 %10 to double
  %div = fdiv double %conv, %conv4
  %11 = load [1000 x double]*, [1000 x double]** %A.addr, align 8, !tbaa !7
  %12 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %11, i64 %idxprom
  %13 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom5 = sext i32 %13 to i64
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom5
  store double %div, double* %arrayidx6, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %15 = load [1000 x double]*, [1000 x double]** %A.addr, align 8, !tbaa !7
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom7 = sext i32 %16 to i64
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %15, i64 %idxprom7
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom9 = sext i32 %17 to i64
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx8, i64 0, i64 %idxprom9
  store double 1.000000e+00, double* %arrayidx10, align 8, !tbaa !9
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc24, %for.end
  %18 = load i32, i32* %j, align 4, !tbaa !3
  %19 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp12 = icmp slt i32 %18, %19
  br i1 %cmp12, label %for.body14, label %for.end26

for.body14:                                       ; preds = %for.cond11
  %20 = load i32, i32* %n.addr, align 4, !tbaa !3
  %21 = load i32, i32* %i, align 4, !tbaa !3
  %22 = load i32, i32* %j, align 4, !tbaa !3
  %sub = sub nsw i32 %21, %22
  %add15 = add nsw i32 %20, %sub
  %23 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem16 = srem i32 %add15, %23
  %conv17 = sitofp i32 %rem16 to double
  %24 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv18 = sitofp i32 %24 to double
  %div19 = fdiv double %conv17, %conv18
  %25 = load [1200 x double]*, [1200 x double]** %B.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom20 = sext i32 %26 to i64
  %arrayidx21 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %idxprom20
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom22 = sext i32 %27 to i64
  %arrayidx23 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx21, i64 0, i64 %idxprom22
  store double %div19, double* %arrayidx23, align 8, !tbaa !9
  br label %for.inc24

for.inc24:                                        ; preds = %for.body14
  %28 = load i32, i32* %j, align 4, !tbaa !3
  %inc25 = add nsw i32 %28, 1
  store i32 %inc25, i32* %j, align 4, !tbaa !3
  br label %for.cond11

for.end26:                                        ; preds = %for.cond11
  br label %for.inc27

for.inc27:                                        ; preds = %for.end26
  %29 = load i32, i32* %i, align 4, !tbaa !3
  %inc28 = add nsw i32 %29, 1
  store i32 %inc28, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end29:                                        ; preds = %for.cond
  %30 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #3
  %31 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double %alpha, double* %alpha.addr, align 8, !tbaa !9
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8, !tbaa !7
  store [1200 x double]* %B, [1200 x double]** %B.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc30, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end32

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc27, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end29

for.body3:                                        ; preds = %for.cond1
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %add = add nsw i32 %7, 1
  store i32 %add, i32* %k, align 4, !tbaa !3
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %8 = load i32, i32* %k, align 4, !tbaa !3
  %9 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp5 = icmp slt i32 %8, %9
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %10 = load [1000 x double]*, [1000 x double]** %A.addr, align 8, !tbaa !7
  %11 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %idxprom
  %12 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom7 = sext i32 %12 to i64
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom7
  %13 = load double, double* %arrayidx8, align 8, !tbaa !9
  %14 = load [1200 x double]*, [1200 x double]** %B.addr, align 8, !tbaa !7
  %15 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom9 = sext i32 %15 to i64
  %arrayidx10 = getelementptr inbounds [1200 x double], [1200 x double]* %14, i64 %idxprom9
  %16 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom11 = sext i32 %16 to i64
  %arrayidx12 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx10, i64 0, i64 %idxprom11
  %17 = load double, double* %arrayidx12, align 8, !tbaa !9
  %mul = fmul double %13, %17
  %18 = load [1200 x double]*, [1200 x double]** %B.addr, align 8, !tbaa !7
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom13 = sext i32 %19 to i64
  %arrayidx14 = getelementptr inbounds [1200 x double], [1200 x double]* %18, i64 %idxprom13
  %20 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom15 = sext i32 %20 to i64
  %arrayidx16 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx14, i64 0, i64 %idxprom15
  %21 = load double, double* %arrayidx16, align 8, !tbaa !9
  %add17 = fadd double %21, %mul
  store double %add17, double* %arrayidx16, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %22 = load i32, i32* %k, align 4, !tbaa !3
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %k, align 4, !tbaa !3
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %23 = load double, double* %alpha.addr, align 8, !tbaa !9
  %24 = load [1200 x double]*, [1200 x double]** %B.addr, align 8, !tbaa !7
  %25 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom18 = sext i32 %25 to i64
  %arrayidx19 = getelementptr inbounds [1200 x double], [1200 x double]* %24, i64 %idxprom18
  %26 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom20 = sext i32 %26 to i64
  %arrayidx21 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx19, i64 0, i64 %idxprom20
  %27 = load double, double* %arrayidx21, align 8, !tbaa !9
  %mul22 = fmul double %23, %27
  %28 = load [1200 x double]*, [1200 x double]** %B.addr, align 8, !tbaa !7
  %29 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom23 = sext i32 %29 to i64
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %28, i64 %idxprom23
  %30 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom25 = sext i32 %30 to i64
  %arrayidx26 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx24, i64 0, i64 %idxprom25
  store double %mul22, double* %arrayidx26, align 8, !tbaa !9
  br label %for.inc27

for.inc27:                                        ; preds = %for.end
  %31 = load i32, i32* %j, align 4, !tbaa !3
  %inc28 = add nsw i32 %31, 1
  store i32 %inc28, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end29:                                        ; preds = %for.cond1
  br label %for.inc30

for.inc30:                                        ; preds = %for.end29
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %inc31 = add nsw i32 %32, 1
  store i32 %inc31, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end32:                                        ; preds = %for.cond
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
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %B) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %B.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1200 x double]* %B, [1200 x double]** %B.addr, align 8, !tbaa !7
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
  %5 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %7 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %6, %7
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %m.addr, align 4, !tbaa !3
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
  %13 = load [1200 x double]*, [1200 x double]** %B.addr, align 8, !tbaa !7
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
