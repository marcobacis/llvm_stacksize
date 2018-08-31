; ModuleID = '../linear-algebra/kernels/atax/atax.c'
source_filename = "../linear-algebra/kernels/atax/atax.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
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
  %A = alloca [1900 x [2100 x double]]*, align 8
  %x = alloca [2100 x double]*, align 8
  %y = alloca [2100 x double]*, align 8
  %tmp = alloca [1900 x double]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 1900, i32* %m, align 4, !tbaa !3
  %1 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 2100, i32* %n, align 4, !tbaa !3
  %2 = bitcast [1900 x [2100 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %call = call i8* @polybench_alloc_data(i64 3990000, i32 8)
  %3 = bitcast i8* %call to [1900 x [2100 x double]]*
  store [1900 x [2100 x double]]* %3, [1900 x [2100 x double]]** %A, align 8, !tbaa !7
  %4 = bitcast [2100 x double]** %x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %call1 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %5 = bitcast i8* %call1 to [2100 x double]*
  store [2100 x double]* %5, [2100 x double]** %x, align 8, !tbaa !7
  %6 = bitcast [2100 x double]** %y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #3
  %call2 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %7 = bitcast i8* %call2 to [2100 x double]*
  store [2100 x double]* %7, [2100 x double]** %y, align 8, !tbaa !7
  %8 = bitcast [1900 x double]** %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #3
  %call3 = call i8* @polybench_alloc_data(i64 1900, i32 8)
  %9 = bitcast i8* %call3 to [1900 x double]*
  store [1900 x double]* %9, [1900 x double]** %tmp, align 8, !tbaa !7
  %10 = load i32, i32* %m, align 4, !tbaa !3
  %11 = load i32, i32* %n, align 4, !tbaa !3
  %12 = load [1900 x [2100 x double]]*, [1900 x [2100 x double]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1900 x [2100 x double]], [1900 x [2100 x double]]* %12, i32 0, i32 0
  %13 = load [2100 x double]*, [2100 x double]** %x, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [2100 x double], [2100 x double]* %13, i32 0, i32 0
  call void @init_array(i32 %10, i32 %11, [2100 x double]* %arraydecay, double* %arraydecay4)
  %14 = load i32, i32* %m, align 4, !tbaa !3
  %15 = load i32, i32* %n, align 4, !tbaa !3
  %16 = load [1900 x [2100 x double]]*, [1900 x [2100 x double]]** %A, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [1900 x [2100 x double]], [1900 x [2100 x double]]* %16, i32 0, i32 0
  %17 = load [2100 x double]*, [2100 x double]** %x, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [2100 x double], [2100 x double]* %17, i32 0, i32 0
  %18 = load [2100 x double]*, [2100 x double]** %y, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [2100 x double], [2100 x double]* %18, i32 0, i32 0
  %19 = load [1900 x double]*, [1900 x double]** %tmp, align 8, !tbaa !7
  %arraydecay8 = getelementptr inbounds [1900 x double], [1900 x double]* %19, i32 0, i32 0
  call void @kernel_atax(i32 %14, i32 %15, [2100 x double]* %arraydecay5, double* %arraydecay6, double* %arraydecay7, double* %arraydecay8)
  %20 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %20, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %21 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %21, i64 0
  %22 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call9 = call i32 @strcmp(i8* %22, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call9, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %23 = load i32, i32* %n, align 4, !tbaa !3
  %24 = load [2100 x double]*, [2100 x double]** %y, align 8, !tbaa !7
  %arraydecay10 = getelementptr inbounds [2100 x double], [2100 x double]* %24, i32 0, i32 0
  call void @print_array(i32 %23, double* %arraydecay10)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %25 = load [1900 x [2100 x double]]*, [1900 x [2100 x double]]** %A, align 8, !tbaa !7
  %26 = bitcast [1900 x [2100 x double]]* %25 to i8*
  call void @free(i8* %26)
  %27 = load [2100 x double]*, [2100 x double]** %x, align 8, !tbaa !7
  %28 = bitcast [2100 x double]* %27 to i8*
  call void @free(i8* %28)
  %29 = load [2100 x double]*, [2100 x double]** %y, align 8, !tbaa !7
  %30 = bitcast [2100 x double]* %29 to i8*
  call void @free(i8* %30)
  %31 = load [1900 x double]*, [1900 x double]** %tmp, align 8, !tbaa !7
  %32 = bitcast [1900 x double]* %31 to i8*
  call void @free(i8* %32)
  %33 = bitcast [1900 x double]** %tmp to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %33) #3
  %34 = bitcast [2100 x double]** %y to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #3
  %35 = bitcast [2100 x double]** %x to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %35) #3
  %36 = bitcast [1900 x [2100 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #3
  %37 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #3
  %38 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %m, i32 %n, [2100 x double]* %A, double* %x) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2100 x double]*, align 8
  %x.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %fn = alloca double, align 8
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [2100 x double]* %A, [2100 x double]** %A.addr, align 8, !tbaa !7
  store double* %x, double** %x.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast double* %fn to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %3 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv = sitofp i32 %3 to double
  store double %conv, double* %fn, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %5 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %conv2 = sitofp i32 %6 to double
  %7 = load double, double* %fn, align 8, !tbaa !9
  %div = fdiv double %conv2, %7
  %add = fadd double 1.000000e+00, %div
  %8 = load double*, double** %x.addr, align 8, !tbaa !7
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds double, double* %8, i64 %idxprom
  store double %add, double* %arrayidx, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc22, %for.end
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %12 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp4 = icmp slt i32 %11, %12
  br i1 %cmp4, label %for.body6, label %for.end24

for.body6:                                        ; preds = %for.cond3
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc19, %for.body6
  %13 = load i32, i32* %j, align 4, !tbaa !3
  %14 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp8 = icmp slt i32 %13, %14
  br i1 %cmp8, label %for.body10, label %for.end21

for.body10:                                       ; preds = %for.cond7
  %15 = load i32, i32* %i, align 4, !tbaa !3
  %16 = load i32, i32* %j, align 4, !tbaa !3
  %add11 = add nsw i32 %15, %16
  %17 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem = srem i32 %add11, %17
  %conv12 = sitofp i32 %rem to double
  %18 = load i32, i32* %m.addr, align 4, !tbaa !3
  %mul = mul nsw i32 5, %18
  %conv13 = sitofp i32 %mul to double
  %div14 = fdiv double %conv12, %conv13
  %19 = load [2100 x double]*, [2100 x double]** %A.addr, align 8, !tbaa !7
  %20 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom15 = sext i32 %20 to i64
  %arrayidx16 = getelementptr inbounds [2100 x double], [2100 x double]* %19, i64 %idxprom15
  %21 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom17 = sext i32 %21 to i64
  %arrayidx18 = getelementptr inbounds [2100 x double], [2100 x double]* %arrayidx16, i64 0, i64 %idxprom17
  store double %div14, double* %arrayidx18, align 8, !tbaa !9
  br label %for.inc19

for.inc19:                                        ; preds = %for.body10
  %22 = load i32, i32* %j, align 4, !tbaa !3
  %inc20 = add nsw i32 %22, 1
  store i32 %inc20, i32* %j, align 4, !tbaa !3
  br label %for.cond7

for.end21:                                        ; preds = %for.cond7
  br label %for.inc22

for.inc22:                                        ; preds = %for.end21
  %23 = load i32, i32* %i, align 4, !tbaa !3
  %inc23 = add nsw i32 %23, 1
  store i32 %inc23, i32* %i, align 4, !tbaa !3
  br label %for.cond3

for.end24:                                        ; preds = %for.cond3
  %24 = bitcast double* %fn to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %24) #3
  %25 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #3
  %26 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %26) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_atax(i32 %m, i32 %n, [2100 x double]* %A, double* %x, double* %y, double* %tmp) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2100 x double]*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %tmp.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [2100 x double]* %A, [2100 x double]** %A.addr, align 8, !tbaa !7
  store double* %x, double** %x.addr, align 8, !tbaa !7
  store double* %y, double** %y.addr, align 8, !tbaa !7
  store double* %tmp, double** %tmp.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load double*, double** %y.addr, align 8, !tbaa !7
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

for.cond1:                                        ; preds = %for.inc40, %for.end
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %8 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %7, %8
  br i1 %cmp2, label %for.body3, label %for.end42

for.body3:                                        ; preds = %for.cond1
  %9 = load double*, double** %tmp.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom4 = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds double, double* %9, i64 %idxprom4
  store double 0.000000e+00, double* %arrayidx5, align 8, !tbaa !9
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc19, %for.body3
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %12 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp7 = icmp slt i32 %11, %12
  br i1 %cmp7, label %for.body8, label %for.end21

for.body8:                                        ; preds = %for.cond6
  %13 = load double*, double** %tmp.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds double, double* %13, i64 %idxprom9
  %15 = load double, double* %arrayidx10, align 8, !tbaa !9
  %16 = load [2100 x double]*, [2100 x double]** %A.addr, align 8, !tbaa !7
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom11 = sext i32 %17 to i64
  %arrayidx12 = getelementptr inbounds [2100 x double], [2100 x double]* %16, i64 %idxprom11
  %18 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom13 = sext i32 %18 to i64
  %arrayidx14 = getelementptr inbounds [2100 x double], [2100 x double]* %arrayidx12, i64 0, i64 %idxprom13
  %19 = load double, double* %arrayidx14, align 8, !tbaa !9
  %20 = load double*, double** %x.addr, align 8, !tbaa !7
  %21 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom15 = sext i32 %21 to i64
  %arrayidx16 = getelementptr inbounds double, double* %20, i64 %idxprom15
  %22 = load double, double* %arrayidx16, align 8, !tbaa !9
  %mul = fmul double %19, %22
  %add = fadd double %15, %mul
  %23 = load double*, double** %tmp.addr, align 8, !tbaa !7
  %24 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom17 = sext i32 %24 to i64
  %arrayidx18 = getelementptr inbounds double, double* %23, i64 %idxprom17
  store double %add, double* %arrayidx18, align 8, !tbaa !9
  br label %for.inc19

for.inc19:                                        ; preds = %for.body8
  %25 = load i32, i32* %j, align 4, !tbaa !3
  %inc20 = add nsw i32 %25, 1
  store i32 %inc20, i32* %j, align 4, !tbaa !3
  br label %for.cond6

for.end21:                                        ; preds = %for.cond6
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc37, %for.end21
  %26 = load i32, i32* %j, align 4, !tbaa !3
  %27 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp23 = icmp slt i32 %26, %27
  br i1 %cmp23, label %for.body24, label %for.end39

for.body24:                                       ; preds = %for.cond22
  %28 = load double*, double** %y.addr, align 8, !tbaa !7
  %29 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom25 = sext i32 %29 to i64
  %arrayidx26 = getelementptr inbounds double, double* %28, i64 %idxprom25
  %30 = load double, double* %arrayidx26, align 8, !tbaa !9
  %31 = load [2100 x double]*, [2100 x double]** %A.addr, align 8, !tbaa !7
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom27 = sext i32 %32 to i64
  %arrayidx28 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %idxprom27
  %33 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom29 = sext i32 %33 to i64
  %arrayidx30 = getelementptr inbounds [2100 x double], [2100 x double]* %arrayidx28, i64 0, i64 %idxprom29
  %34 = load double, double* %arrayidx30, align 8, !tbaa !9
  %35 = load double*, double** %tmp.addr, align 8, !tbaa !7
  %36 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom31 = sext i32 %36 to i64
  %arrayidx32 = getelementptr inbounds double, double* %35, i64 %idxprom31
  %37 = load double, double* %arrayidx32, align 8, !tbaa !9
  %mul33 = fmul double %34, %37
  %add34 = fadd double %30, %mul33
  %38 = load double*, double** %y.addr, align 8, !tbaa !7
  %39 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom35 = sext i32 %39 to i64
  %arrayidx36 = getelementptr inbounds double, double* %38, i64 %idxprom35
  store double %add34, double* %arrayidx36, align 8, !tbaa !9
  br label %for.inc37

for.inc37:                                        ; preds = %for.body24
  %40 = load i32, i32* %j, align 4, !tbaa !3
  %inc38 = add nsw i32 %40, 1
  store i32 %inc38, i32* %j, align 4, !tbaa !3
  br label %for.cond22

for.end39:                                        ; preds = %for.cond22
  br label %for.inc40

for.inc40:                                        ; preds = %for.end39
  %41 = load i32, i32* %i, align 4, !tbaa !3
  %inc41 = add nsw i32 %41, 1
  store i32 %inc41, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end42:                                        ; preds = %for.cond1
  %42 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #3
  %43 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, double* %y) #0 {
entry:
  %n.addr = alloca i32, align 4
  %y.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %y, double** %y.addr, align 8, !tbaa !7
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
  %8 = load double*, double** %y.addr, align 8, !tbaa !7
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
  %call6 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %13, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %14 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #3
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
