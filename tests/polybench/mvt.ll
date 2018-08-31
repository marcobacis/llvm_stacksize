; ModuleID = '../linear-algebra/kernels/mvt/mvt.c'
source_filename = "../linear-algebra/kernels/mvt/mvt.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %A = alloca [2000 x [2000 x double]]*, align 8
  %x1 = alloca [2000 x double]*, align 8
  %x2 = alloca [2000 x double]*, align 8
  %y_1 = alloca [2000 x double]*, align 8
  %y_2 = alloca [2000 x double]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 2000, i32* %n, align 4, !tbaa !3
  %1 = bitcast [2000 x [2000 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #3
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %2 = bitcast i8* %call to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %2, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %3 = bitcast [2000 x double]** %x1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %4 = bitcast i8* %call1 to [2000 x double]*
  store [2000 x double]* %4, [2000 x double]** %x1, align 8, !tbaa !7
  %5 = bitcast [2000 x double]** %x2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %6 = bitcast i8* %call2 to [2000 x double]*
  store [2000 x double]* %6, [2000 x double]** %x2, align 8, !tbaa !7
  %7 = bitcast [2000 x double]** %y_1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #3
  %call3 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %8 = bitcast i8* %call3 to [2000 x double]*
  store [2000 x double]* %8, [2000 x double]** %y_1, align 8, !tbaa !7
  %9 = bitcast [2000 x double]** %y_2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #3
  %call4 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %10 = bitcast i8* %call4 to [2000 x double]*
  store [2000 x double]* %10, [2000 x double]** %y_2, align 8, !tbaa !7
  %11 = load i32, i32* %n, align 4, !tbaa !3
  %12 = load [2000 x double]*, [2000 x double]** %x1, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [2000 x double], [2000 x double]* %12, i32 0, i32 0
  %13 = load [2000 x double]*, [2000 x double]** %x2, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i32 0, i32 0
  %14 = load [2000 x double]*, [2000 x double]** %y_1, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i32 0, i32 0
  %15 = load [2000 x double]*, [2000 x double]** %y_2, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i32 0, i32 0
  %16 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %arraydecay8 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i32 0, i32 0
  call void @init_array(i32 %11, double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
  %17 = load i32, i32* %n, align 4, !tbaa !3
  %18 = load [2000 x double]*, [2000 x double]** %x1, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i32 0, i32 0
  %19 = load [2000 x double]*, [2000 x double]** %x2, align 8, !tbaa !7
  %arraydecay10 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i32 0, i32 0
  %20 = load [2000 x double]*, [2000 x double]** %y_1, align 8, !tbaa !7
  %arraydecay11 = getelementptr inbounds [2000 x double], [2000 x double]* %20, i32 0, i32 0
  %21 = load [2000 x double]*, [2000 x double]** %y_2, align 8, !tbaa !7
  %arraydecay12 = getelementptr inbounds [2000 x double], [2000 x double]* %21, i32 0, i32 0
  %22 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %arraydecay13 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i32 0, i32 0
  call void @kernel_mvt(i32 %17, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, [2000 x double]* %arraydecay13)
  %23 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %23, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %24 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %24, i64 0
  %25 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call14 = call i32 @strcmp(i8* %25, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call14, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %26 = load i32, i32* %n, align 4, !tbaa !3
  %27 = load [2000 x double]*, [2000 x double]** %x1, align 8, !tbaa !7
  %arraydecay15 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i32 0, i32 0
  %28 = load [2000 x double]*, [2000 x double]** %x2, align 8, !tbaa !7
  %arraydecay16 = getelementptr inbounds [2000 x double], [2000 x double]* %28, i32 0, i32 0
  call void @print_array(i32 %26, double* %arraydecay15, double* %arraydecay16)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %29 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %30 = bitcast [2000 x [2000 x double]]* %29 to i8*
  call void @free(i8* %30)
  %31 = load [2000 x double]*, [2000 x double]** %x1, align 8, !tbaa !7
  %32 = bitcast [2000 x double]* %31 to i8*
  call void @free(i8* %32)
  %33 = load [2000 x double]*, [2000 x double]** %x2, align 8, !tbaa !7
  %34 = bitcast [2000 x double]* %33 to i8*
  call void @free(i8* %34)
  %35 = load [2000 x double]*, [2000 x double]** %y_1, align 8, !tbaa !7
  %36 = bitcast [2000 x double]* %35 to i8*
  call void @free(i8* %36)
  %37 = load [2000 x double]*, [2000 x double]** %y_2, align 8, !tbaa !7
  %38 = bitcast [2000 x double]* %37 to i8*
  call void @free(i8* %38)
  %39 = bitcast [2000 x double]** %y_2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %39) #3
  %40 = bitcast [2000 x double]** %y_1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %40) #3
  %41 = bitcast [2000 x double]** %x2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #3
  %42 = bitcast [2000 x double]** %x1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %42) #3
  %43 = bitcast [2000 x [2000 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %43) #3
  %44 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %n, double* %x1, double* %x2, double* %y_1, double* %y_2, [2000 x double]* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %x1.addr = alloca double*, align 8
  %x2.addr = alloca double*, align 8
  %y_1.addr = alloca double*, align 8
  %y_2.addr = alloca double*, align 8
  %A.addr = alloca [2000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %x1, double** %x1.addr, align 8, !tbaa !7
  store double* %x2, double** %x2.addr, align 8, !tbaa !7
  store double* %y_1, double** %y_1.addr, align 8, !tbaa !7
  store double* %y_2, double** %y_2.addr, align 8, !tbaa !7
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc34, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end36

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %5 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem = srem i32 %4, %5
  %conv = sitofp i32 %rem to double
  %6 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv1 = sitofp i32 %6 to double
  %div = fdiv double %conv, %conv1
  %7 = load double*, double** %x1.addr, align 8, !tbaa !7
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom
  store double %div, double* %arrayidx, align 8, !tbaa !9
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %add = add nsw i32 %9, 1
  %10 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem2 = srem i32 %add, %10
  %conv3 = sitofp i32 %rem2 to double
  %11 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv4 = sitofp i32 %11 to double
  %div5 = fdiv double %conv3, %conv4
  %12 = load double*, double** %x2.addr, align 8, !tbaa !7
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom6 = sext i32 %13 to i64
  %arrayidx7 = getelementptr inbounds double, double* %12, i64 %idxprom6
  store double %div5, double* %arrayidx7, align 8, !tbaa !9
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %add8 = add nsw i32 %14, 3
  %15 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem9 = srem i32 %add8, %15
  %conv10 = sitofp i32 %rem9 to double
  %16 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv11 = sitofp i32 %16 to double
  %div12 = fdiv double %conv10, %conv11
  %17 = load double*, double** %y_1.addr, align 8, !tbaa !7
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom13 = sext i32 %18 to i64
  %arrayidx14 = getelementptr inbounds double, double* %17, i64 %idxprom13
  store double %div12, double* %arrayidx14, align 8, !tbaa !9
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %add15 = add nsw i32 %19, 4
  %20 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem16 = srem i32 %add15, %20
  %conv17 = sitofp i32 %rem16 to double
  %21 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv18 = sitofp i32 %21 to double
  %div19 = fdiv double %conv17, %conv18
  %22 = load double*, double** %y_2.addr, align 8, !tbaa !7
  %23 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom20 = sext i32 %23 to i64
  %arrayidx21 = getelementptr inbounds double, double* %22, i64 %idxprom20
  store double %div19, double* %arrayidx21, align 8, !tbaa !9
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc, %for.body
  %24 = load i32, i32* %j, align 4, !tbaa !3
  %25 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp23 = icmp slt i32 %24, %25
  br i1 %cmp23, label %for.body25, label %for.end

for.body25:                                       ; preds = %for.cond22
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %mul = mul nsw i32 %26, %27
  %28 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem26 = srem i32 %mul, %28
  %conv27 = sitofp i32 %rem26 to double
  %29 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv28 = sitofp i32 %29 to double
  %div29 = fdiv double %conv27, %conv28
  %30 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %31 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom30 = sext i32 %31 to i64
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %idxprom30
  %32 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom32 = sext i32 %32 to i64
  %arrayidx33 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx31, i64 0, i64 %idxprom32
  store double %div29, double* %arrayidx33, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body25
  %33 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %33, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond22

for.end:                                          ; preds = %for.cond22
  br label %for.inc34

for.inc34:                                        ; preds = %for.end
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %inc35 = add nsw i32 %34, 1
  store i32 %inc35, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end36:                                        ; preds = %for.cond
  %35 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #3
  %36 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %36) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_mvt(i32 %n, double* %x1, double* %x2, double* %y_1, double* %y_2, [2000 x double]* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %x1.addr = alloca double*, align 8
  %x2.addr = alloca double*, align 8
  %y_1.addr = alloca double*, align 8
  %y_2.addr = alloca double*, align 8
  %A.addr = alloca [2000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %x1, double** %x1.addr, align 8, !tbaa !7
  store double* %x2, double** %x2.addr, align 8, !tbaa !7
  store double* %y_1, double** %y_1.addr, align 8, !tbaa !7
  store double* %y_2, double** %y_2.addr, align 8, !tbaa !7
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4, !tbaa !3
  %5 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load double*, double** %x1.addr, align 8, !tbaa !7
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds double, double* %6, i64 %idxprom
  %8 = load double, double* %arrayidx, align 8, !tbaa !9
  %9 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom4 = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %idxprom4
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx5, i64 0, i64 %idxprom6
  %12 = load double, double* %arrayidx7, align 8, !tbaa !9
  %13 = load double*, double** %y_1.addr, align 8, !tbaa !7
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds double, double* %13, i64 %idxprom8
  %15 = load double, double* %arrayidx9, align 8, !tbaa !9
  %mul = fmul double %12, %15
  %add = fadd double %8, %mul
  %16 = load double*, double** %x1.addr, align 8, !tbaa !7
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom10 = sext i32 %17 to i64
  %arrayidx11 = getelementptr inbounds double, double* %16, i64 %idxprom10
  store double %add, double* %arrayidx11, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %18 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %inc13 = add nsw i32 %19, 1
  store i32 %inc13, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc36, %for.end14
  %20 = load i32, i32* %i, align 4, !tbaa !3
  %21 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp16 = icmp slt i32 %20, %21
  br i1 %cmp16, label %for.body17, label %for.end38

for.body17:                                       ; preds = %for.cond15
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc33, %for.body17
  %22 = load i32, i32* %j, align 4, !tbaa !3
  %23 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp19 = icmp slt i32 %22, %23
  br i1 %cmp19, label %for.body20, label %for.end35

for.body20:                                       ; preds = %for.cond18
  %24 = load double*, double** %x2.addr, align 8, !tbaa !7
  %25 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom21 = sext i32 %25 to i64
  %arrayidx22 = getelementptr inbounds double, double* %24, i64 %idxprom21
  %26 = load double, double* %arrayidx22, align 8, !tbaa !9
  %27 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %28 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom23 = sext i32 %28 to i64
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i64 %idxprom23
  %29 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom25 = sext i32 %29 to i64
  %arrayidx26 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx24, i64 0, i64 %idxprom25
  %30 = load double, double* %arrayidx26, align 8, !tbaa !9
  %31 = load double*, double** %y_2.addr, align 8, !tbaa !7
  %32 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom27 = sext i32 %32 to i64
  %arrayidx28 = getelementptr inbounds double, double* %31, i64 %idxprom27
  %33 = load double, double* %arrayidx28, align 8, !tbaa !9
  %mul29 = fmul double %30, %33
  %add30 = fadd double %26, %mul29
  %34 = load double*, double** %x2.addr, align 8, !tbaa !7
  %35 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom31 = sext i32 %35 to i64
  %arrayidx32 = getelementptr inbounds double, double* %34, i64 %idxprom31
  store double %add30, double* %arrayidx32, align 8, !tbaa !9
  br label %for.inc33

for.inc33:                                        ; preds = %for.body20
  %36 = load i32, i32* %j, align 4, !tbaa !3
  %inc34 = add nsw i32 %36, 1
  store i32 %inc34, i32* %j, align 4, !tbaa !3
  br label %for.cond18

for.end35:                                        ; preds = %for.cond18
  br label %for.inc36

for.inc36:                                        ; preds = %for.end35
  %37 = load i32, i32* %i, align 4, !tbaa !3
  %inc37 = add nsw i32 %37, 1
  store i32 %inc37, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.end38:                                        ; preds = %for.cond15
  %38 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #3
  %39 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, double* %x1, double* %x2) #0 {
entry:
  %n.addr = alloca i32, align 4
  %x1.addr = alloca double*, align 8
  %x2.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %x1, double** %x1.addr, align 8, !tbaa !7
  store double* %x2, double** %x2.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %n.addr, align 4, !tbaa !3
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
  %8 = load double*, double** %x1.addr, align 8, !tbaa !7
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
  %call5 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  %13 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call6 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %13, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0))
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
  %19 = load double*, double** %x2.addr, align 8, !tbaa !7
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
  %call21 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0))
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
