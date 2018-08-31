; ModuleID = '../linear-algebra/blas/syr2k/syr2k.c'
source_filename = "../linear-algebra/blas/syr2k/syr2k.c"
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
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %C = alloca [1200 x [1200 x double]]*, align 8
  %A = alloca [1200 x [1000 x double]]*, align 8
  %B = alloca [1200 x [1000 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 1200, i32* %n, align 4, !tbaa !3
  %1 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 1000, i32* %m, align 4, !tbaa !3
  %2 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %3 = bitcast double* %beta to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %4 = bitcast [1200 x [1200 x double]]** %C to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %call = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %5 = bitcast i8* %call to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %5, [1200 x [1200 x double]]** %C, align 8, !tbaa !7
  %6 = bitcast [1200 x [1000 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #3
  %call1 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %7 = bitcast i8* %call1 to [1200 x [1000 x double]]*
  store [1200 x [1000 x double]]* %7, [1200 x [1000 x double]]** %A, align 8, !tbaa !7
  %8 = bitcast [1200 x [1000 x double]]** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #3
  %call2 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %9 = bitcast i8* %call2 to [1200 x [1000 x double]]*
  store [1200 x [1000 x double]]* %9, [1200 x [1000 x double]]** %B, align 8, !tbaa !7
  %10 = load i32, i32* %n, align 4, !tbaa !3
  %11 = load i32, i32* %m, align 4, !tbaa !3
  %12 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %C, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %12, i32 0, i32 0
  %13 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %A, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %13, i32 0, i32 0
  %14 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %B, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %14, i32 0, i32 0
  call void @init_array(i32 %10, i32 %11, double* %alpha, double* %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  %15 = load i32, i32* %n, align 4, !tbaa !3
  %16 = load i32, i32* %m, align 4, !tbaa !3
  %17 = load double, double* %alpha, align 8, !tbaa !9
  %18 = load double, double* %beta, align 8, !tbaa !9
  %19 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %C, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %19, i32 0, i32 0
  %20 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %A, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %20, i32 0, i32 0
  %21 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %B, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %21, i32 0, i32 0
  call void @kernel_syr2k(i32 %15, i32 %16, double %17, double %18, [1200 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
  %22 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %22, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %23 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %23, i64 0
  %24 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call8 = call i32 @strcmp(i8* %24, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %25 = load i32, i32* %n, align 4, !tbaa !3
  %26 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %C, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %26, i32 0, i32 0
  call void @print_array(i32 %25, [1200 x double]* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %27 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %C, align 8, !tbaa !7
  %28 = bitcast [1200 x [1200 x double]]* %27 to i8*
  call void @free(i8* %28)
  %29 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %A, align 8, !tbaa !7
  %30 = bitcast [1200 x [1000 x double]]* %29 to i8*
  call void @free(i8* %30)
  %31 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %B, align 8, !tbaa !7
  %32 = bitcast [1200 x [1000 x double]]* %31 to i8*
  call void @free(i8* %32)
  %33 = bitcast [1200 x [1000 x double]]** %B to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %33) #3
  %34 = bitcast [1200 x [1000 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #3
  %35 = bitcast [1200 x [1200 x double]]** %C to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %35) #3
  %36 = bitcast double* %beta to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #3
  %37 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %37) #3
  %38 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #3
  %39 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %n, i32 %m, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) #0 {
entry:
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [1000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store double* %alpha, double** %alpha.addr, align 8, !tbaa !7
  store double* %beta, double** %beta.addr, align 8, !tbaa !7
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8, !tbaa !7
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8, !tbaa !7
  store [1000 x double]* %B, [1000 x double]** %B.addr, align 8, !tbaa !7
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

for.cond:                                         ; preds = %for.inc17, %entry
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %5 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end19

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %7 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %j, align 4, !tbaa !3
  %mul = mul nsw i32 %8, %9
  %add = add nsw i32 %mul, 1
  %10 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem = srem i32 %add, %10
  %conv = sitofp i32 %rem to double
  %11 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv4 = sitofp i32 %11 to double
  %div = fdiv double %conv, %conv4
  %12 = load [1000 x double]*, [1000 x double]** %A.addr, align 8, !tbaa !7
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %13 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %12, i64 %idxprom
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom5 = sext i32 %14 to i64
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom5
  store double %div, double* %arrayidx6, align 8, !tbaa !9
  %15 = load i32, i32* %i, align 4, !tbaa !3
  %16 = load i32, i32* %j, align 4, !tbaa !3
  %mul7 = mul nsw i32 %15, %16
  %add8 = add nsw i32 %mul7, 2
  %17 = load i32, i32* %m.addr, align 4, !tbaa !3
  %rem9 = srem i32 %add8, %17
  %conv10 = sitofp i32 %rem9 to double
  %18 = load i32, i32* %m.addr, align 4, !tbaa !3
  %conv11 = sitofp i32 %18 to double
  %div12 = fdiv double %conv10, %conv11
  %19 = load [1000 x double]*, [1000 x double]** %B.addr, align 8, !tbaa !7
  %20 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom13 = sext i32 %20 to i64
  %arrayidx14 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %idxprom13
  %21 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom15 = sext i32 %21 to i64
  %arrayidx16 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx14, i64 0, i64 %idxprom15
  store double %div12, double* %arrayidx16, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %22 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %23 = load i32, i32* %i, align 4, !tbaa !3
  %inc18 = add nsw i32 %23, 1
  store i32 %inc18, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end19:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc41, %for.end19
  %24 = load i32, i32* %i, align 4, !tbaa !3
  %25 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp21 = icmp slt i32 %24, %25
  br i1 %cmp21, label %for.body23, label %for.end43

for.body23:                                       ; preds = %for.cond20
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc38, %for.body23
  %26 = load i32, i32* %j, align 4, !tbaa !3
  %27 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp25 = icmp slt i32 %26, %27
  br i1 %cmp25, label %for.body27, label %for.end40

for.body27:                                       ; preds = %for.cond24
  %28 = load i32, i32* %i, align 4, !tbaa !3
  %29 = load i32, i32* %j, align 4, !tbaa !3
  %mul28 = mul nsw i32 %28, %29
  %add29 = add nsw i32 %mul28, 3
  %30 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem30 = srem i32 %add29, %30
  %conv31 = sitofp i32 %rem30 to double
  %31 = load i32, i32* %m.addr, align 4, !tbaa !3
  %conv32 = sitofp i32 %31 to double
  %div33 = fdiv double %conv31, %conv32
  %32 = load [1200 x double]*, [1200 x double]** %C.addr, align 8, !tbaa !7
  %33 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom34 = sext i32 %33 to i64
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %32, i64 %idxprom34
  %34 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom36 = sext i32 %34 to i64
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx35, i64 0, i64 %idxprom36
  store double %div33, double* %arrayidx37, align 8, !tbaa !9
  br label %for.inc38

for.inc38:                                        ; preds = %for.body27
  %35 = load i32, i32* %j, align 4, !tbaa !3
  %inc39 = add nsw i32 %35, 1
  store i32 %inc39, i32* %j, align 4, !tbaa !3
  br label %for.cond24

for.end40:                                        ; preds = %for.cond24
  br label %for.inc41

for.inc41:                                        ; preds = %for.end40
  %36 = load i32, i32* %i, align 4, !tbaa !3
  %inc42 = add nsw i32 %36, 1
  store i32 %inc42, i32* %i, align 4, !tbaa !3
  br label %for.cond20

for.end43:                                        ; preds = %for.cond20
  %37 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #3
  %38 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) #0 {
entry:
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [1000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store double %alpha, double* %alpha.addr, align 8, !tbaa !9
  store double %beta, double* %beta.addr, align 8, !tbaa !9
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8, !tbaa !7
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8, !tbaa !7
  store [1000 x double]* %B, [1000 x double]** %B.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc43, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end45

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %cmp2 = icmp sle i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %7 = load double, double* %beta.addr, align 8, !tbaa !9
  %8 = load [1200 x double]*, [1200 x double]** %C.addr, align 8, !tbaa !7
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %idxprom
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom4 = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx, i64 0, i64 %idxprom4
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

for.cond6:                                        ; preds = %for.inc40, %for.end
  %13 = load i32, i32* %k, align 4, !tbaa !3
  %14 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp7 = icmp slt i32 %13, %14
  br i1 %cmp7, label %for.body8, label %for.end42

for.body8:                                        ; preds = %for.cond6
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc37, %for.body8
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %cmp10 = icmp sle i32 %15, %16
  br i1 %cmp10, label %for.body11, label %for.end39

for.body11:                                       ; preds = %for.cond9
  %17 = load [1000 x double]*, [1000 x double]** %A.addr, align 8, !tbaa !7
  %18 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom12 = sext i32 %18 to i64
  %arrayidx13 = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 %idxprom12
  %19 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom14 = sext i32 %19 to i64
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx13, i64 0, i64 %idxprom14
  %20 = load double, double* %arrayidx15, align 8, !tbaa !9
  %21 = load double, double* %alpha.addr, align 8, !tbaa !9
  %mul16 = fmul double %20, %21
  %22 = load [1000 x double]*, [1000 x double]** %B.addr, align 8, !tbaa !7
  %23 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom17 = sext i32 %23 to i64
  %arrayidx18 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %idxprom17
  %24 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom19 = sext i32 %24 to i64
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx18, i64 0, i64 %idxprom19
  %25 = load double, double* %arrayidx20, align 8, !tbaa !9
  %mul21 = fmul double %mul16, %25
  %26 = load [1000 x double]*, [1000 x double]** %B.addr, align 8, !tbaa !7
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom22 = sext i32 %27 to i64
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %idxprom22
  %28 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom24 = sext i32 %28 to i64
  %arrayidx25 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx23, i64 0, i64 %idxprom24
  %29 = load double, double* %arrayidx25, align 8, !tbaa !9
  %30 = load double, double* %alpha.addr, align 8, !tbaa !9
  %mul26 = fmul double %29, %30
  %31 = load [1000 x double]*, [1000 x double]** %A.addr, align 8, !tbaa !7
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom27 = sext i32 %32 to i64
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %idxprom27
  %33 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom29 = sext i32 %33 to i64
  %arrayidx30 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx28, i64 0, i64 %idxprom29
  %34 = load double, double* %arrayidx30, align 8, !tbaa !9
  %mul31 = fmul double %mul26, %34
  %add = fadd double %mul21, %mul31
  %35 = load [1200 x double]*, [1200 x double]** %C.addr, align 8, !tbaa !7
  %36 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom32 = sext i32 %36 to i64
  %arrayidx33 = getelementptr inbounds [1200 x double], [1200 x double]* %35, i64 %idxprom32
  %37 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom34 = sext i32 %37 to i64
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx33, i64 0, i64 %idxprom34
  %38 = load double, double* %arrayidx35, align 8, !tbaa !9
  %add36 = fadd double %38, %add
  store double %add36, double* %arrayidx35, align 8, !tbaa !9
  br label %for.inc37

for.inc37:                                        ; preds = %for.body11
  %39 = load i32, i32* %j, align 4, !tbaa !3
  %inc38 = add nsw i32 %39, 1
  store i32 %inc38, i32* %j, align 4, !tbaa !3
  br label %for.cond9

for.end39:                                        ; preds = %for.cond9
  br label %for.inc40

for.inc40:                                        ; preds = %for.end39
  %40 = load i32, i32* %k, align 4, !tbaa !3
  %inc41 = add nsw i32 %40, 1
  store i32 %inc41, i32* %k, align 4, !tbaa !3
  br label %for.cond6

for.end42:                                        ; preds = %for.cond6
  br label %for.inc43

for.inc43:                                        ; preds = %for.end42
  %41 = load i32, i32* %i, align 4, !tbaa !3
  %inc44 = add nsw i32 %41, 1
  store i32 %inc44, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end45:                                        ; preds = %for.cond
  %42 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #3
  %43 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #3
  %44 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, [1200 x double]* %C) #0 {
entry:
  %n.addr = alloca i32, align 4
  %C.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8, !tbaa !7
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
  %5 = load i32, i32* %n.addr, align 4, !tbaa !3
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
  %9 = load i32, i32* %n.addr, align 4, !tbaa !3
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
  %13 = load [1200 x double]*, [1200 x double]** %C.addr, align 8, !tbaa !7
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
