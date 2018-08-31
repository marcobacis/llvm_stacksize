; ModuleID = '../linear-algebra/solvers/gramschmidt/gramschmidt.c'
source_filename = "../linear-algebra/solvers/gramschmidt/gramschmidt.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %A = alloca [1000 x [1200 x double]]*, align 8
  %R = alloca [1200 x [1200 x double]]*, align 8
  %Q = alloca [1000 x [1200 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  store i32 1000, i32* %m, align 4, !tbaa !3
  %1 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  store i32 1200, i32* %n, align 4, !tbaa !3
  %2 = bitcast [1000 x [1200 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #4
  %call = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %3 = bitcast i8* %call to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %3, [1000 x [1200 x double]]** %A, align 8, !tbaa !7
  %4 = bitcast [1200 x [1200 x double]]** %R to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #4
  %call1 = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %5 = bitcast i8* %call1 to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %5, [1200 x [1200 x double]]** %R, align 8, !tbaa !7
  %6 = bitcast [1000 x [1200 x double]]** %Q to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #4
  %call2 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %7 = bitcast i8* %call2 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %7, [1000 x [1200 x double]]** %Q, align 8, !tbaa !7
  %8 = load i32, i32* %m, align 4, !tbaa !3
  %9 = load i32, i32* %n, align 4, !tbaa !3
  %10 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %10, i32 0, i32 0
  %11 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %R, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %11, i32 0, i32 0
  %12 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %Q, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %12, i32 0, i32 0
  call void @init_array(i32 %8, i32 %9, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  %13 = load i32, i32* %m, align 4, !tbaa !3
  %14 = load i32, i32* %n, align 4, !tbaa !3
  %15 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %A, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %15, i32 0, i32 0
  %16 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %R, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %16, i32 0, i32 0
  %17 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %Q, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %17, i32 0, i32 0
  call void @kernel_gramschmidt(i32 %13, i32 %14, [1200 x double]* %arraydecay5, [1200 x double]* %arraydecay6, [1200 x double]* %arraydecay7)
  %18 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %18, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %19 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %19, i64 0
  %20 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call8 = call i32 @strcmp(i8* %20, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %21 = load i32, i32* %m, align 4, !tbaa !3
  %22 = load i32, i32* %n, align 4, !tbaa !3
  %23 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %A, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %23, i32 0, i32 0
  %24 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %R, align 8, !tbaa !7
  %arraydecay10 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %24, i32 0, i32 0
  %25 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %Q, align 8, !tbaa !7
  %arraydecay11 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %25, i32 0, i32 0
  call void @print_array(i32 %21, i32 %22, [1200 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %26 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %A, align 8, !tbaa !7
  %27 = bitcast [1000 x [1200 x double]]* %26 to i8*
  call void @free(i8* %27)
  %28 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %R, align 8, !tbaa !7
  %29 = bitcast [1200 x [1200 x double]]* %28 to i8*
  call void @free(i8* %29)
  %30 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %Q, align 8, !tbaa !7
  %31 = bitcast [1000 x [1200 x double]]* %30 to i8*
  call void @free(i8* %31)
  %32 = bitcast [1000 x [1200 x double]]** %Q to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %32) #4
  %33 = bitcast [1200 x [1200 x double]]** %R to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %33) #4
  %34 = bitcast [1000 x [1200 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #4
  %35 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #4
  %36 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %36) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1200 x double]*, align 8
  %R.addr = alloca [1200 x double]*, align 8
  %Q.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1200 x double]* %A, [1200 x double]** %A.addr, align 8, !tbaa !7
  store [1200 x double]* %R, [1200 x double]** %R.addr, align 8, !tbaa !7
  store [1200 x double]* %Q, [1200 x double]** %Q.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %m.addr, align 4, !tbaa !3
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
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %mul = mul nsw i32 %6, %7
  %8 = load i32, i32* %m.addr, align 4, !tbaa !3
  %rem = srem i32 %mul, %8
  %conv = sitofp i32 %rem to double
  %9 = load i32, i32* %m.addr, align 4, !tbaa !3
  %conv4 = sitofp i32 %9 to double
  %div = fdiv double %conv, %conv4
  %mul5 = fmul double %div, 1.000000e+02
  %add = fadd double %mul5, 1.000000e+01
  %10 = load [1200 x double]*, [1200 x double]** %A.addr, align 8, !tbaa !7
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %idxprom
  %12 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom6 = sext i32 %12 to i64
  %arrayidx7 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx, i64 0, i64 %idxprom6
  store double %add, double* %arrayidx7, align 8, !tbaa !9
  %13 = load [1200 x double]*, [1200 x double]** %Q.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds [1200 x double], [1200 x double]* %13, i64 %idxprom8
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom10 = sext i32 %15 to i64
  %arrayidx11 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx9, i64 0, i64 %idxprom10
  store double 0.000000e+00, double* %arrayidx11, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %16 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %inc13 = add nsw i32 %17, 1
  store i32 %inc13, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc30, %for.end14
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %19 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp16 = icmp slt i32 %18, %19
  br i1 %cmp16, label %for.body18, label %for.end32

for.body18:                                       ; preds = %for.cond15
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc27, %for.body18
  %20 = load i32, i32* %j, align 4, !tbaa !3
  %21 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp20 = icmp slt i32 %20, %21
  br i1 %cmp20, label %for.body22, label %for.end29

for.body22:                                       ; preds = %for.cond19
  %22 = load [1200 x double]*, [1200 x double]** %R.addr, align 8, !tbaa !7
  %23 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom23 = sext i32 %23 to i64
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %22, i64 %idxprom23
  %24 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom25 = sext i32 %24 to i64
  %arrayidx26 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx24, i64 0, i64 %idxprom25
  store double 0.000000e+00, double* %arrayidx26, align 8, !tbaa !9
  br label %for.inc27

for.inc27:                                        ; preds = %for.body22
  %25 = load i32, i32* %j, align 4, !tbaa !3
  %inc28 = add nsw i32 %25, 1
  store i32 %inc28, i32* %j, align 4, !tbaa !3
  br label %for.cond19

for.end29:                                        ; preds = %for.cond19
  br label %for.inc30

for.inc30:                                        ; preds = %for.end29
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %inc31 = add nsw i32 %26, 1
  store i32 %inc31, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.end32:                                        ; preds = %for.cond15
  %27 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #4
  %28 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #4
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1200 x double]*, align 8
  %R.addr = alloca [1200 x double]*, align 8
  %Q.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %nrm = alloca double, align 8
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1200 x double]* %A, [1200 x double]** %A.addr, align 8, !tbaa !7
  store [1200 x double]* %R, [1200 x double]** %R.addr, align 8, !tbaa !7
  store [1200 x double]* %Q, [1200 x double]** %Q.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #4
  %3 = bitcast double* %nrm to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #4
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc86, %entry
  %4 = load i32, i32* %k, align 4, !tbaa !3
  %5 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end88

for.body:                                         ; preds = %for.cond
  store double 0.000000e+00, double* %nrm, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %7 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %8 = load [1200 x double]*, [1200 x double]** %A.addr, align 8, !tbaa !7
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %idxprom
  %10 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom4 = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx, i64 0, i64 %idxprom4
  %11 = load double, double* %arrayidx5, align 8, !tbaa !9
  %12 = load [1200 x double]*, [1200 x double]** %A.addr, align 8, !tbaa !7
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom6 = sext i32 %13 to i64
  %arrayidx7 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %idxprom6
  %14 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx7, i64 0, i64 %idxprom8
  %15 = load double, double* %arrayidx9, align 8, !tbaa !9
  %mul = fmul double %11, %15
  %16 = load double, double* %nrm, align 8, !tbaa !9
  %add = fadd double %16, %mul
  store double %add, double* %nrm, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %18 = load double, double* %nrm, align 8, !tbaa !9
  %19 = call double @llvm.sqrt.f64(double %18)
  %20 = load [1200 x double]*, [1200 x double]** %R.addr, align 8, !tbaa !7
  %21 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom10 = sext i32 %21 to i64
  %arrayidx11 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i64 %idxprom10
  %22 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom12 = sext i32 %22 to i64
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx11, i64 0, i64 %idxprom12
  store double %19, double* %arrayidx13, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc29, %for.end
  %23 = load i32, i32* %i, align 4, !tbaa !3
  %24 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp15 = icmp slt i32 %23, %24
  br i1 %cmp15, label %for.body16, label %for.end31

for.body16:                                       ; preds = %for.cond14
  %25 = load [1200 x double]*, [1200 x double]** %A.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom17 = sext i32 %26 to i64
  %arrayidx18 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %idxprom17
  %27 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom19 = sext i32 %27 to i64
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx18, i64 0, i64 %idxprom19
  %28 = load double, double* %arrayidx20, align 8, !tbaa !9
  %29 = load [1200 x double]*, [1200 x double]** %R.addr, align 8, !tbaa !7
  %30 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom21 = sext i32 %30 to i64
  %arrayidx22 = getelementptr inbounds [1200 x double], [1200 x double]* %29, i64 %idxprom21
  %31 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom23 = sext i32 %31 to i64
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx22, i64 0, i64 %idxprom23
  %32 = load double, double* %arrayidx24, align 8, !tbaa !9
  %div = fdiv double %28, %32
  %33 = load [1200 x double]*, [1200 x double]** %Q.addr, align 8, !tbaa !7
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom25 = sext i32 %34 to i64
  %arrayidx26 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %idxprom25
  %35 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom27 = sext i32 %35 to i64
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx26, i64 0, i64 %idxprom27
  store double %div, double* %arrayidx28, align 8, !tbaa !9
  br label %for.inc29

for.inc29:                                        ; preds = %for.body16
  %36 = load i32, i32* %i, align 4, !tbaa !3
  %inc30 = add nsw i32 %36, 1
  store i32 %inc30, i32* %i, align 4, !tbaa !3
  br label %for.cond14

for.end31:                                        ; preds = %for.cond14
  %37 = load i32, i32* %k, align 4, !tbaa !3
  %add32 = add nsw i32 %37, 1
  store i32 %add32, i32* %j, align 4, !tbaa !3
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc83, %for.end31
  %38 = load i32, i32* %j, align 4, !tbaa !3
  %39 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp34 = icmp slt i32 %38, %39
  br i1 %cmp34, label %for.body35, label %for.end85

for.body35:                                       ; preds = %for.cond33
  %40 = load [1200 x double]*, [1200 x double]** %R.addr, align 8, !tbaa !7
  %41 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom36 = sext i32 %41 to i64
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %40, i64 %idxprom36
  %42 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom38 = sext i32 %42 to i64
  %arrayidx39 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx37, i64 0, i64 %idxprom38
  store double 0.000000e+00, double* %arrayidx39, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc57, %for.body35
  %43 = load i32, i32* %i, align 4, !tbaa !3
  %44 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp41 = icmp slt i32 %43, %44
  br i1 %cmp41, label %for.body42, label %for.end59

for.body42:                                       ; preds = %for.cond40
  %45 = load [1200 x double]*, [1200 x double]** %Q.addr, align 8, !tbaa !7
  %46 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom43 = sext i32 %46 to i64
  %arrayidx44 = getelementptr inbounds [1200 x double], [1200 x double]* %45, i64 %idxprom43
  %47 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom45 = sext i32 %47 to i64
  %arrayidx46 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx44, i64 0, i64 %idxprom45
  %48 = load double, double* %arrayidx46, align 8, !tbaa !9
  %49 = load [1200 x double]*, [1200 x double]** %A.addr, align 8, !tbaa !7
  %50 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom47 = sext i32 %50 to i64
  %arrayidx48 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %idxprom47
  %51 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom49 = sext i32 %51 to i64
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx48, i64 0, i64 %idxprom49
  %52 = load double, double* %arrayidx50, align 8, !tbaa !9
  %mul51 = fmul double %48, %52
  %53 = load [1200 x double]*, [1200 x double]** %R.addr, align 8, !tbaa !7
  %54 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom52 = sext i32 %54 to i64
  %arrayidx53 = getelementptr inbounds [1200 x double], [1200 x double]* %53, i64 %idxprom52
  %55 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom54 = sext i32 %55 to i64
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx53, i64 0, i64 %idxprom54
  %56 = load double, double* %arrayidx55, align 8, !tbaa !9
  %add56 = fadd double %56, %mul51
  store double %add56, double* %arrayidx55, align 8, !tbaa !9
  br label %for.inc57

for.inc57:                                        ; preds = %for.body42
  %57 = load i32, i32* %i, align 4, !tbaa !3
  %inc58 = add nsw i32 %57, 1
  store i32 %inc58, i32* %i, align 4, !tbaa !3
  br label %for.cond40

for.end59:                                        ; preds = %for.cond40
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond60

for.cond60:                                       ; preds = %for.inc80, %for.end59
  %58 = load i32, i32* %i, align 4, !tbaa !3
  %59 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp61 = icmp slt i32 %58, %59
  br i1 %cmp61, label %for.body62, label %for.end82

for.body62:                                       ; preds = %for.cond60
  %60 = load [1200 x double]*, [1200 x double]** %A.addr, align 8, !tbaa !7
  %61 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom63 = sext i32 %61 to i64
  %arrayidx64 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %idxprom63
  %62 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom65 = sext i32 %62 to i64
  %arrayidx66 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx64, i64 0, i64 %idxprom65
  %63 = load double, double* %arrayidx66, align 8, !tbaa !9
  %64 = load [1200 x double]*, [1200 x double]** %Q.addr, align 8, !tbaa !7
  %65 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom67 = sext i32 %65 to i64
  %arrayidx68 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %idxprom67
  %66 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom69 = sext i32 %66 to i64
  %arrayidx70 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx68, i64 0, i64 %idxprom69
  %67 = load double, double* %arrayidx70, align 8, !tbaa !9
  %68 = load [1200 x double]*, [1200 x double]** %R.addr, align 8, !tbaa !7
  %69 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom71 = sext i32 %69 to i64
  %arrayidx72 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %idxprom71
  %70 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom73 = sext i32 %70 to i64
  %arrayidx74 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx72, i64 0, i64 %idxprom73
  %71 = load double, double* %arrayidx74, align 8, !tbaa !9
  %mul75 = fmul double %67, %71
  %sub = fsub double %63, %mul75
  %72 = load [1200 x double]*, [1200 x double]** %A.addr, align 8, !tbaa !7
  %73 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom76 = sext i32 %73 to i64
  %arrayidx77 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %idxprom76
  %74 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom78 = sext i32 %74 to i64
  %arrayidx79 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx77, i64 0, i64 %idxprom78
  store double %sub, double* %arrayidx79, align 8, !tbaa !9
  br label %for.inc80

for.inc80:                                        ; preds = %for.body62
  %75 = load i32, i32* %i, align 4, !tbaa !3
  %inc81 = add nsw i32 %75, 1
  store i32 %inc81, i32* %i, align 4, !tbaa !3
  br label %for.cond60

for.end82:                                        ; preds = %for.cond60
  br label %for.inc83

for.inc83:                                        ; preds = %for.end82
  %76 = load i32, i32* %j, align 4, !tbaa !3
  %inc84 = add nsw i32 %76, 1
  store i32 %inc84, i32* %j, align 4, !tbaa !3
  br label %for.cond33

for.end85:                                        ; preds = %for.cond33
  br label %for.inc86

for.inc86:                                        ; preds = %for.end85
  %77 = load i32, i32* %k, align 4, !tbaa !3
  %inc87 = add nsw i32 %77, 1
  store i32 %inc87, i32* %k, align 4, !tbaa !3
  br label %for.cond

for.end88:                                        ; preds = %for.cond
  %78 = bitcast double* %nrm to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %78) #4
  %79 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %79) #4
  %80 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %80) #4
  %81 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %81) #4
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1200 x double]*, align 8
  %R.addr = alloca [1200 x double]*, align 8
  %Q.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1200 x double]* %A, [1200 x double]** %A.addr, align 8, !tbaa !7
  store [1200 x double]* %R, [1200 x double]** %R.addr, align 8, !tbaa !7
  store [1200 x double]* %Q, [1200 x double]** %Q.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
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
  %13 = load [1200 x double]*, [1200 x double]** %R.addr, align 8, !tbaa !7
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
  %call14 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc36, %for.end12
  %21 = load i32, i32* %i, align 4, !tbaa !3
  %22 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp16 = icmp slt i32 %21, %22
  br i1 %cmp16, label %for.body17, label %for.end38

for.body17:                                       ; preds = %for.cond15
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc33, %for.body17
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %24 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp19 = icmp slt i32 %23, %24
  br i1 %cmp19, label %for.body20, label %for.end35

for.body20:                                       ; preds = %for.cond18
  %25 = load i32, i32* %i, align 4, !tbaa !3
  %26 = load i32, i32* %n.addr, align 4, !tbaa !3
  %mul21 = mul nsw i32 %25, %26
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %add22 = add nsw i32 %mul21, %27
  %rem23 = srem i32 %add22, 20
  %cmp24 = icmp eq i32 %rem23, 0
  br i1 %cmp24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %for.body20
  %28 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call26 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %28, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %for.body20
  %29 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %30 = load [1200 x double]*, [1200 x double]** %Q.addr, align 8, !tbaa !7
  %31 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom28 = sext i32 %31 to i64
  %arrayidx29 = getelementptr inbounds [1200 x double], [1200 x double]* %30, i64 %idxprom28
  %32 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom30 = sext i32 %32 to i64
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx29, i64 0, i64 %idxprom30
  %33 = load double, double* %arrayidx31, align 8, !tbaa !9
  %call32 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %33)
  br label %for.inc33

for.inc33:                                        ; preds = %if.end27
  %34 = load i32, i32* %j, align 4, !tbaa !3
  %inc34 = add nsw i32 %34, 1
  store i32 %inc34, i32* %j, align 4, !tbaa !3
  br label %for.cond18

for.end35:                                        ; preds = %for.cond18
  br label %for.inc36

for.inc36:                                        ; preds = %for.end35
  %35 = load i32, i32* %i, align 4, !tbaa !3
  %inc37 = add nsw i32 %35, 1
  store i32 %inc37, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.end38:                                        ; preds = %for.cond15
  %36 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call39 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %37 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call40 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %37, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  %38 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #4
  %39 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #4
  ret void
}

declare void @free(i8*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable
declare double @llvm.sqrt.f64(double) #3

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
!10 = !{!"double", !5, i64 0}
