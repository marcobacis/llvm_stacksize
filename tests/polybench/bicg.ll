; ModuleID = '../linear-algebra/kernels/bicg/bicg.c'
source_filename = "../linear-algebra/kernels/bicg/bicg.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %A = alloca [2100 x [1900 x double]]*, align 8
  %s = alloca [1900 x double]*, align 8
  %q = alloca [2100 x double]*, align 8
  %p = alloca [1900 x double]*, align 8
  %r = alloca [2100 x double]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 2100, i32* %n, align 4, !tbaa !3
  %1 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 1900, i32* %m, align 4, !tbaa !3
  %2 = bitcast [2100 x [1900 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %call = call i8* @polybench_alloc_data(i64 3990000, i32 8)
  %3 = bitcast i8* %call to [2100 x [1900 x double]]*
  store [2100 x [1900 x double]]* %3, [2100 x [1900 x double]]** %A, align 8, !tbaa !7
  %4 = bitcast [1900 x double]** %s to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %call1 = call i8* @polybench_alloc_data(i64 1900, i32 8)
  %5 = bitcast i8* %call1 to [1900 x double]*
  store [1900 x double]* %5, [1900 x double]** %s, align 8, !tbaa !7
  %6 = bitcast [2100 x double]** %q to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #3
  %call2 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %7 = bitcast i8* %call2 to [2100 x double]*
  store [2100 x double]* %7, [2100 x double]** %q, align 8, !tbaa !7
  %8 = bitcast [1900 x double]** %p to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #3
  %call3 = call i8* @polybench_alloc_data(i64 1900, i32 8)
  %9 = bitcast i8* %call3 to [1900 x double]*
  store [1900 x double]* %9, [1900 x double]** %p, align 8, !tbaa !7
  %10 = bitcast [2100 x double]** %r to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #3
  %call4 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %11 = bitcast i8* %call4 to [2100 x double]*
  store [2100 x double]* %11, [2100 x double]** %r, align 8, !tbaa !7
  %12 = load i32, i32* %m, align 4, !tbaa !3
  %13 = load i32, i32* %n, align 4, !tbaa !3
  %14 = load [2100 x [1900 x double]]*, [2100 x [1900 x double]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [2100 x [1900 x double]], [2100 x [1900 x double]]* %14, i32 0, i32 0
  %15 = load [2100 x double]*, [2100 x double]** %r, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [2100 x double], [2100 x double]* %15, i32 0, i32 0
  %16 = load [1900 x double]*, [1900 x double]** %p, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [1900 x double], [1900 x double]* %16, i32 0, i32 0
  call void @init_array(i32 %12, i32 %13, [1900 x double]* %arraydecay, double* %arraydecay5, double* %arraydecay6)
  %17 = load i32, i32* %m, align 4, !tbaa !3
  %18 = load i32, i32* %n, align 4, !tbaa !3
  %19 = load [2100 x [1900 x double]]*, [2100 x [1900 x double]]** %A, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [2100 x [1900 x double]], [2100 x [1900 x double]]* %19, i32 0, i32 0
  %20 = load [1900 x double]*, [1900 x double]** %s, align 8, !tbaa !7
  %arraydecay8 = getelementptr inbounds [1900 x double], [1900 x double]* %20, i32 0, i32 0
  %21 = load [2100 x double]*, [2100 x double]** %q, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [2100 x double], [2100 x double]* %21, i32 0, i32 0
  %22 = load [1900 x double]*, [1900 x double]** %p, align 8, !tbaa !7
  %arraydecay10 = getelementptr inbounds [1900 x double], [1900 x double]* %22, i32 0, i32 0
  %23 = load [2100 x double]*, [2100 x double]** %r, align 8, !tbaa !7
  %arraydecay11 = getelementptr inbounds [2100 x double], [2100 x double]* %23, i32 0, i32 0
  call void @kernel_bicg(i32 %17, i32 %18, [1900 x double]* %arraydecay7, double* %arraydecay8, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11)
  %24 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %24, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %25 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %25, i64 0
  %26 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call12 = call i32 @strcmp(i8* %26, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call12, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %27 = load i32, i32* %m, align 4, !tbaa !3
  %28 = load i32, i32* %n, align 4, !tbaa !3
  %29 = load [1900 x double]*, [1900 x double]** %s, align 8, !tbaa !7
  %arraydecay13 = getelementptr inbounds [1900 x double], [1900 x double]* %29, i32 0, i32 0
  %30 = load [2100 x double]*, [2100 x double]** %q, align 8, !tbaa !7
  %arraydecay14 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i32 0, i32 0
  call void @print_array(i32 %27, i32 %28, double* %arraydecay13, double* %arraydecay14)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %31 = load [2100 x [1900 x double]]*, [2100 x [1900 x double]]** %A, align 8, !tbaa !7
  %32 = bitcast [2100 x [1900 x double]]* %31 to i8*
  call void @free(i8* %32)
  %33 = load [1900 x double]*, [1900 x double]** %s, align 8, !tbaa !7
  %34 = bitcast [1900 x double]* %33 to i8*
  call void @free(i8* %34)
  %35 = load [2100 x double]*, [2100 x double]** %q, align 8, !tbaa !7
  %36 = bitcast [2100 x double]* %35 to i8*
  call void @free(i8* %36)
  %37 = load [1900 x double]*, [1900 x double]** %p, align 8, !tbaa !7
  %38 = bitcast [1900 x double]* %37 to i8*
  call void @free(i8* %38)
  %39 = load [2100 x double]*, [2100 x double]** %r, align 8, !tbaa !7
  %40 = bitcast [2100 x double]* %39 to i8*
  call void @free(i8* %40)
  %41 = bitcast [2100 x double]** %r to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #3
  %42 = bitcast [1900 x double]** %p to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %42) #3
  %43 = bitcast [2100 x double]** %q to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %43) #3
  %44 = bitcast [1900 x double]** %s to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %44) #3
  %45 = bitcast [2100 x [1900 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %45) #3
  %46 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %46) #3
  %47 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %47) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %m, i32 %n, [1900 x double]* %A, double* %r, double* %p) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1900 x double]*, align 8
  %r.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1900 x double]* %A, [1900 x double]** %A.addr, align 8, !tbaa !7
  store double* %r, double** %r.addr, align 8, !tbaa !7
  store double* %p, double** %p.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %5 = load i32, i32* %m.addr, align 4, !tbaa !3
  %rem = srem i32 %4, %5
  %conv = sitofp i32 %rem to double
  %6 = load i32, i32* %m.addr, align 4, !tbaa !3
  %conv1 = sitofp i32 %6 to double
  %div = fdiv double %conv, %conv1
  %7 = load double*, double** %p.addr, align 8, !tbaa !7
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom
  store double %div, double* %arrayidx, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc27, %for.end
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %11 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %10, %11
  br i1 %cmp3, label %for.body5, label %for.end29

for.body5:                                        ; preds = %for.cond2
  %12 = load i32, i32* %i, align 4, !tbaa !3
  %13 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem6 = srem i32 %12, %13
  %conv7 = sitofp i32 %rem6 to double
  %14 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv8 = sitofp i32 %14 to double
  %div9 = fdiv double %conv7, %conv8
  %15 = load double*, double** %r.addr, align 8, !tbaa !7
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom10 = sext i32 %16 to i64
  %arrayidx11 = getelementptr inbounds double, double* %15, i64 %idxprom10
  store double %div9, double* %arrayidx11, align 8, !tbaa !9
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc24, %for.body5
  %17 = load i32, i32* %j, align 4, !tbaa !3
  %18 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp13 = icmp slt i32 %17, %18
  br i1 %cmp13, label %for.body15, label %for.end26

for.body15:                                       ; preds = %for.cond12
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %20 = load i32, i32* %j, align 4, !tbaa !3
  %add = add nsw i32 %20, 1
  %mul = mul nsw i32 %19, %add
  %21 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem16 = srem i32 %mul, %21
  %conv17 = sitofp i32 %rem16 to double
  %22 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv18 = sitofp i32 %22 to double
  %div19 = fdiv double %conv17, %conv18
  %23 = load [1900 x double]*, [1900 x double]** %A.addr, align 8, !tbaa !7
  %24 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom20 = sext i32 %24 to i64
  %arrayidx21 = getelementptr inbounds [1900 x double], [1900 x double]* %23, i64 %idxprom20
  %25 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom22 = sext i32 %25 to i64
  %arrayidx23 = getelementptr inbounds [1900 x double], [1900 x double]* %arrayidx21, i64 0, i64 %idxprom22
  store double %div19, double* %arrayidx23, align 8, !tbaa !9
  br label %for.inc24

for.inc24:                                        ; preds = %for.body15
  %26 = load i32, i32* %j, align 4, !tbaa !3
  %inc25 = add nsw i32 %26, 1
  store i32 %inc25, i32* %j, align 4, !tbaa !3
  br label %for.cond12

for.end26:                                        ; preds = %for.cond12
  br label %for.inc27

for.inc27:                                        ; preds = %for.end26
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %inc28 = add nsw i32 %27, 1
  store i32 %inc28, i32* %i, align 4, !tbaa !3
  br label %for.cond2

for.end29:                                        ; preds = %for.cond2
  %28 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #3
  %29 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* %A, double* %s, double* %q, double* %p, double* %r) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1900 x double]*, align 8
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %r.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1900 x double]* %A, [1900 x double]** %A.addr, align 8, !tbaa !7
  store double* %s, double** %s.addr, align 8, !tbaa !7
  store double* %q, double** %q.addr, align 8, !tbaa !7
  store double* %p, double** %p.addr, align 8, !tbaa !7
  store double* %r, double** %r.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load double*, double** %s.addr, align 8, !tbaa !7
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc34, %for.end
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %7, %8
  br i1 %cmp2, label %for.body3, label %for.end36

for.body3:                                        ; preds = %for.cond1
  %9 = load double*, double** %q.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom4 = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds double, double* %9, i64 %idxprom4
  store double 0.000000e+00, double* %arrayidx5, align 8, !tbaa !9
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc31, %for.body3
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %12 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp7 = icmp slt i32 %11, %12
  br i1 %cmp7, label %for.body8, label %for.end33

for.body8:                                        ; preds = %for.cond6
  %13 = load double*, double** %s.addr, align 8, !tbaa !7
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds double, double* %13, i64 %idxprom9
  %15 = load double, double* %arrayidx10, align 8, !tbaa !9
  %16 = load double*, double** %r.addr, align 8, !tbaa !7
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom11 = sext i32 %17 to i64
  %arrayidx12 = getelementptr inbounds double, double* %16, i64 %idxprom11
  %18 = load double, double* %arrayidx12, align 8, !tbaa !9
  %19 = load [1900 x double]*, [1900 x double]** %A.addr, align 8, !tbaa !7
  %20 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom13 = sext i32 %20 to i64
  %arrayidx14 = getelementptr inbounds [1900 x double], [1900 x double]* %19, i64 %idxprom13
  %21 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom15 = sext i32 %21 to i64
  %arrayidx16 = getelementptr inbounds [1900 x double], [1900 x double]* %arrayidx14, i64 0, i64 %idxprom15
  %22 = load double, double* %arrayidx16, align 8, !tbaa !9
  %mul = fmul double %18, %22
  %add = fadd double %15, %mul
  %23 = load double*, double** %s.addr, align 8, !tbaa !7
  %24 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom17 = sext i32 %24 to i64
  %arrayidx18 = getelementptr inbounds double, double* %23, i64 %idxprom17
  store double %add, double* %arrayidx18, align 8, !tbaa !9
  %25 = load double*, double** %q.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom19 = sext i32 %26 to i64
  %arrayidx20 = getelementptr inbounds double, double* %25, i64 %idxprom19
  %27 = load double, double* %arrayidx20, align 8, !tbaa !9
  %28 = load [1900 x double]*, [1900 x double]** %A.addr, align 8, !tbaa !7
  %29 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom21 = sext i32 %29 to i64
  %arrayidx22 = getelementptr inbounds [1900 x double], [1900 x double]* %28, i64 %idxprom21
  %30 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom23 = sext i32 %30 to i64
  %arrayidx24 = getelementptr inbounds [1900 x double], [1900 x double]* %arrayidx22, i64 0, i64 %idxprom23
  %31 = load double, double* %arrayidx24, align 8, !tbaa !9
  %32 = load double*, double** %p.addr, align 8, !tbaa !7
  %33 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom25 = sext i32 %33 to i64
  %arrayidx26 = getelementptr inbounds double, double* %32, i64 %idxprom25
  %34 = load double, double* %arrayidx26, align 8, !tbaa !9
  %mul27 = fmul double %31, %34
  %add28 = fadd double %27, %mul27
  %35 = load double*, double** %q.addr, align 8, !tbaa !7
  %36 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom29 = sext i32 %36 to i64
  %arrayidx30 = getelementptr inbounds double, double* %35, i64 %idxprom29
  store double %add28, double* %arrayidx30, align 8, !tbaa !9
  br label %for.inc31

for.inc31:                                        ; preds = %for.body8
  %37 = load i32, i32* %j, align 4, !tbaa !3
  %inc32 = add nsw i32 %37, 1
  store i32 %inc32, i32* %j, align 4, !tbaa !3
  br label %for.cond6

for.end33:                                        ; preds = %for.cond6
  br label %for.inc34

for.inc34:                                        ; preds = %for.end33
  %38 = load i32, i32* %i, align 4, !tbaa !3
  %inc35 = add nsw i32 %38, 1
  store i32 %inc35, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end36:                                        ; preds = %for.cond1
  %39 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #3
  %40 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %m, i32 %n, double* %s, double* %q) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %s, double** %s.addr, align 8, !tbaa !7
  store double* %q, double** %q.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %rem = srem i32 %5, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call3 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %7 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %8 = load double*, double** %s.addr, align 8, !tbaa !7
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds double, double* %8, i64 %idxprom
  %10 = load double, double* %arrayidx, align 8, !tbaa !9
  %call4 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %10)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call5 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %13 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call6 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %13, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc18, %for.end
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %15 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp8 = icmp slt i32 %14, %15
  br i1 %cmp8, label %for.body9, label %for.end20

for.body9:                                        ; preds = %for.cond7
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %rem10 = srem i32 %16, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %for.body9
  %17 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %for.body9
  %18 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %19 = load double*, double** %q.addr, align 8, !tbaa !7
  %20 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom15 = sext i32 %20 to i64
  %arrayidx16 = getelementptr inbounds double, double* %19, i64 %idxprom15
  %21 = load double, double* %arrayidx16, align 8, !tbaa !9
  %call17 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %21)
  br label %for.inc18

for.inc18:                                        ; preds = %if.end14
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %inc19 = add nsw i32 %22, 1
  store i32 %inc19, i32* %i, align 4, !tbaa !3
  br label %for.cond7

for.end20:                                        ; preds = %for.cond7
  %23 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call21 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %24 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call22 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %24, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  %25 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #3
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
