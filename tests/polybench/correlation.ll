; ModuleID = '../datamining/correlation/correlation.c'
source_filename = "../datamining/correlation/correlation.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
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
  %float_n = alloca double, align 8
  %data = alloca [1400 x [1200 x double]]*, align 8
  %corr = alloca [1200 x [1200 x double]]*, align 8
  %mean = alloca [1200 x double]*, align 8
  %stddev = alloca [1200 x double]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  store i32 1400, i32* %n, align 4, !tbaa !3
  %1 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  store i32 1200, i32* %m, align 4, !tbaa !3
  %2 = bitcast double* %float_n to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #4
  %3 = bitcast [1400 x [1200 x double]]** %data to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #4
  %call = call i8* @polybench_alloc_data(i64 1680000, i32 8)
  %4 = bitcast i8* %call to [1400 x [1200 x double]]*
  store [1400 x [1200 x double]]* %4, [1400 x [1200 x double]]** %data, align 8, !tbaa !7
  %5 = bitcast [1200 x [1200 x double]]** %corr to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #4
  %call1 = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %6 = bitcast i8* %call1 to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %6, [1200 x [1200 x double]]** %corr, align 8, !tbaa !7
  %7 = bitcast [1200 x double]** %mean to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #4
  %call2 = call i8* @polybench_alloc_data(i64 1200, i32 8)
  %8 = bitcast i8* %call2 to [1200 x double]*
  store [1200 x double]* %8, [1200 x double]** %mean, align 8, !tbaa !7
  %9 = bitcast [1200 x double]** %stddev to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #4
  %call3 = call i8* @polybench_alloc_data(i64 1200, i32 8)
  %10 = bitcast i8* %call3 to [1200 x double]*
  store [1200 x double]* %10, [1200 x double]** %stddev, align 8, !tbaa !7
  %11 = load i32, i32* %m, align 4, !tbaa !3
  %12 = load i32, i32* %n, align 4, !tbaa !3
  %13 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %data, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %13, i32 0, i32 0
  call void @init_array(i32 %11, i32 %12, double* %float_n, [1200 x double]* %arraydecay)
  %14 = load i32, i32* %m, align 4, !tbaa !3
  %15 = load i32, i32* %n, align 4, !tbaa !3
  %16 = load double, double* %float_n, align 8, !tbaa !9
  %17 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %data, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %17, i32 0, i32 0
  %18 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %corr, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %18, i32 0, i32 0
  %19 = load [1200 x double]*, [1200 x double]** %mean, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [1200 x double], [1200 x double]* %19, i32 0, i32 0
  %20 = load [1200 x double]*, [1200 x double]** %stddev, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [1200 x double], [1200 x double]* %20, i32 0, i32 0
  call void @kernel_correlation(i32 %14, i32 %15, double %16, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6, double* %arraydecay7)
  %21 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %21, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %22 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %22, i64 0
  %23 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call8 = call i32 @strcmp(i8* %23, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %24 = load i32, i32* %m, align 4, !tbaa !3
  %25 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %corr, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %25, i32 0, i32 0
  call void @print_array(i32 %24, [1200 x double]* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %26 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %data, align 8, !tbaa !7
  %27 = bitcast [1400 x [1200 x double]]* %26 to i8*
  call void @free(i8* %27)
  %28 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %corr, align 8, !tbaa !7
  %29 = bitcast [1200 x [1200 x double]]* %28 to i8*
  call void @free(i8* %29)
  %30 = load [1200 x double]*, [1200 x double]** %mean, align 8, !tbaa !7
  %31 = bitcast [1200 x double]* %30 to i8*
  call void @free(i8* %31)
  %32 = load [1200 x double]*, [1200 x double]** %stddev, align 8, !tbaa !7
  %33 = bitcast [1200 x double]* %32 to i8*
  call void @free(i8* %33)
  %34 = bitcast [1200 x double]** %stddev to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #4
  %35 = bitcast [1200 x double]** %mean to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %35) #4
  %36 = bitcast [1200 x [1200 x double]]** %corr to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #4
  %37 = bitcast [1400 x [1200 x double]]** %data to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %37) #4
  %38 = bitcast double* %float_n to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #4
  %39 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #4
  %40 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %m, i32 %n, double* %float_n, [1200 x double]* %data) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %float_n.addr = alloca double*, align 8
  %data.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %float_n, double** %float_n.addr, align 8, !tbaa !7
  store [1200 x double]* %data, [1200 x double]** %data.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = load double*, double** %float_n.addr, align 8, !tbaa !7
  store double 1.400000e+03, double* %2, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, 1400
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %4, 1200
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %mul = mul nsw i32 %5, %6
  %conv = sitofp i32 %mul to double
  %div = fdiv double %conv, 1.200000e+03
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %conv4 = sitofp i32 %7 to double
  %add = fadd double %div, %conv4
  %8 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %idxprom
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom5 = sext i32 %10 to i64
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx, i64 0, i64 %idxprom5
  store double %add, double* %arrayidx6, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %12 = load i32, i32* %i, align 4, !tbaa !3
  %inc8 = add nsw i32 %12, 1
  store i32 %inc8, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %13 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #4
  %14 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #4
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_correlation(i32 %m, i32 %n, double %float_n, [1200 x double]* %data, [1200 x double]* %corr, double* %mean, double* %stddev) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %float_n.addr = alloca double, align 8
  %data.addr = alloca [1200 x double]*, align 8
  %corr.addr = alloca [1200 x double]*, align 8
  %mean.addr = alloca double*, align 8
  %stddev.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %eps = alloca double, align 8
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double %float_n, double* %float_n.addr, align 8, !tbaa !9
  store [1200 x double]* %data, [1200 x double]** %data.addr, align 8, !tbaa !7
  store [1200 x double]* %corr, [1200 x double]** %corr.addr, align 8, !tbaa !7
  store double* %mean, double** %mean.addr, align 8, !tbaa !7
  store double* %stddev, double** %stddev.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #4
  %3 = bitcast double* %eps to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #4
  store double 1.000000e-01, double* %eps, align 8, !tbaa !9
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %4 = load i32, i32* %j, align 4, !tbaa !3
  %5 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  %6 = load double*, double** %mean.addr, align 8, !tbaa !7
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds double, double* %6, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %8, %9
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %10 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom4 = sext i32 %11 to i64
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %idxprom4
  %12 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom6 = sext i32 %12 to i64
  %arrayidx7 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx5, i64 0, i64 %idxprom6
  %13 = load double, double* %arrayidx7, align 8, !tbaa !9
  %14 = load double*, double** %mean.addr, align 8, !tbaa !7
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom8 = sext i32 %15 to i64
  %arrayidx9 = getelementptr inbounds double, double* %14, i64 %idxprom8
  %16 = load double, double* %arrayidx9, align 8, !tbaa !9
  %add = fadd double %16, %13
  store double %add, double* %arrayidx9, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %18 = load double, double* %float_n.addr, align 8, !tbaa !9
  %19 = load double*, double** %mean.addr, align 8, !tbaa !7
  %20 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom10 = sext i32 %20 to i64
  %arrayidx11 = getelementptr inbounds double, double* %19, i64 %idxprom10
  %21 = load double, double* %arrayidx11, align 8, !tbaa !9
  %div = fdiv double %21, %18
  store double %div, double* %arrayidx11, align 8, !tbaa !9
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %22 = load i32, i32* %j, align 4, !tbaa !3
  %inc13 = add nsw i32 %22, 1
  store i32 %inc13, i32* %j, align 4, !tbaa !3
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc56, %for.end14
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %24 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp16 = icmp slt i32 %23, %24
  br i1 %cmp16, label %for.body17, label %for.end58

for.body17:                                       ; preds = %for.cond15
  %25 = load double*, double** %stddev.addr, align 8, !tbaa !7
  %26 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom18 = sext i32 %26 to i64
  %arrayidx19 = getelementptr inbounds double, double* %25, i64 %idxprom18
  store double 0.000000e+00, double* %arrayidx19, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc39, %for.body17
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %28 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp21 = icmp slt i32 %27, %28
  br i1 %cmp21, label %for.body22, label %for.end41

for.body22:                                       ; preds = %for.cond20
  %29 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom23 = sext i32 %30 to i64
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %29, i64 %idxprom23
  %31 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom25 = sext i32 %31 to i64
  %arrayidx26 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx24, i64 0, i64 %idxprom25
  %32 = load double, double* %arrayidx26, align 8, !tbaa !9
  %33 = load double*, double** %mean.addr, align 8, !tbaa !7
  %34 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom27 = sext i32 %34 to i64
  %arrayidx28 = getelementptr inbounds double, double* %33, i64 %idxprom27
  %35 = load double, double* %arrayidx28, align 8, !tbaa !9
  %sub = fsub double %32, %35
  %36 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %37 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom29 = sext i32 %37 to i64
  %arrayidx30 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 %idxprom29
  %38 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom31 = sext i32 %38 to i64
  %arrayidx32 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx30, i64 0, i64 %idxprom31
  %39 = load double, double* %arrayidx32, align 8, !tbaa !9
  %40 = load double*, double** %mean.addr, align 8, !tbaa !7
  %41 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom33 = sext i32 %41 to i64
  %arrayidx34 = getelementptr inbounds double, double* %40, i64 %idxprom33
  %42 = load double, double* %arrayidx34, align 8, !tbaa !9
  %sub35 = fsub double %39, %42
  %mul = fmul double %sub, %sub35
  %43 = load double*, double** %stddev.addr, align 8, !tbaa !7
  %44 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom36 = sext i32 %44 to i64
  %arrayidx37 = getelementptr inbounds double, double* %43, i64 %idxprom36
  %45 = load double, double* %arrayidx37, align 8, !tbaa !9
  %add38 = fadd double %45, %mul
  store double %add38, double* %arrayidx37, align 8, !tbaa !9
  br label %for.inc39

for.inc39:                                        ; preds = %for.body22
  %46 = load i32, i32* %i, align 4, !tbaa !3
  %inc40 = add nsw i32 %46, 1
  store i32 %inc40, i32* %i, align 4, !tbaa !3
  br label %for.cond20

for.end41:                                        ; preds = %for.cond20
  %47 = load double, double* %float_n.addr, align 8, !tbaa !9
  %48 = load double*, double** %stddev.addr, align 8, !tbaa !7
  %49 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom42 = sext i32 %49 to i64
  %arrayidx43 = getelementptr inbounds double, double* %48, i64 %idxprom42
  %50 = load double, double* %arrayidx43, align 8, !tbaa !9
  %div44 = fdiv double %50, %47
  store double %div44, double* %arrayidx43, align 8, !tbaa !9
  %51 = load double*, double** %stddev.addr, align 8, !tbaa !7
  %52 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom45 = sext i32 %52 to i64
  %arrayidx46 = getelementptr inbounds double, double* %51, i64 %idxprom45
  %53 = load double, double* %arrayidx46, align 8, !tbaa !9
  %54 = call double @llvm.sqrt.f64(double %53)
  %55 = load double*, double** %stddev.addr, align 8, !tbaa !7
  %56 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom47 = sext i32 %56 to i64
  %arrayidx48 = getelementptr inbounds double, double* %55, i64 %idxprom47
  store double %54, double* %arrayidx48, align 8, !tbaa !9
  %57 = load double*, double** %stddev.addr, align 8, !tbaa !7
  %58 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom49 = sext i32 %58 to i64
  %arrayidx50 = getelementptr inbounds double, double* %57, i64 %idxprom49
  %59 = load double, double* %arrayidx50, align 8, !tbaa !9
  %60 = load double, double* %eps, align 8, !tbaa !9
  %cmp51 = fcmp ole double %59, %60
  br i1 %cmp51, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end41
  br label %cond.end

cond.false:                                       ; preds = %for.end41
  %61 = load double*, double** %stddev.addr, align 8, !tbaa !7
  %62 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom52 = sext i32 %62 to i64
  %arrayidx53 = getelementptr inbounds double, double* %61, i64 %idxprom52
  %63 = load double, double* %arrayidx53, align 8, !tbaa !9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 1.000000e+00, %cond.true ], [ %63, %cond.false ]
  %64 = load double*, double** %stddev.addr, align 8, !tbaa !7
  %65 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom54 = sext i32 %65 to i64
  %arrayidx55 = getelementptr inbounds double, double* %64, i64 %idxprom54
  store double %cond, double* %arrayidx55, align 8, !tbaa !9
  br label %for.inc56

for.inc56:                                        ; preds = %cond.end
  %66 = load i32, i32* %j, align 4, !tbaa !3
  %inc57 = add nsw i32 %66, 1
  store i32 %inc57, i32* %j, align 4, !tbaa !3
  br label %for.cond15

for.end58:                                        ; preds = %for.cond15
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc83, %for.end58
  %67 = load i32, i32* %i, align 4, !tbaa !3
  %68 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp60 = icmp slt i32 %67, %68
  br i1 %cmp60, label %for.body61, label %for.end85

for.body61:                                       ; preds = %for.cond59
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc80, %for.body61
  %69 = load i32, i32* %j, align 4, !tbaa !3
  %70 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp63 = icmp slt i32 %69, %70
  br i1 %cmp63, label %for.body64, label %for.end82

for.body64:                                       ; preds = %for.cond62
  %71 = load double*, double** %mean.addr, align 8, !tbaa !7
  %72 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom65 = sext i32 %72 to i64
  %arrayidx66 = getelementptr inbounds double, double* %71, i64 %idxprom65
  %73 = load double, double* %arrayidx66, align 8, !tbaa !9
  %74 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %75 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom67 = sext i32 %75 to i64
  %arrayidx68 = getelementptr inbounds [1200 x double], [1200 x double]* %74, i64 %idxprom67
  %76 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom69 = sext i32 %76 to i64
  %arrayidx70 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx68, i64 0, i64 %idxprom69
  %77 = load double, double* %arrayidx70, align 8, !tbaa !9
  %sub71 = fsub double %77, %73
  store double %sub71, double* %arrayidx70, align 8, !tbaa !9
  %78 = load double, double* %float_n.addr, align 8, !tbaa !9
  %79 = call double @llvm.sqrt.f64(double %78)
  %80 = load double*, double** %stddev.addr, align 8, !tbaa !7
  %81 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom72 = sext i32 %81 to i64
  %arrayidx73 = getelementptr inbounds double, double* %80, i64 %idxprom72
  %82 = load double, double* %arrayidx73, align 8, !tbaa !9
  %mul74 = fmul double %79, %82
  %83 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %84 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom75 = sext i32 %84 to i64
  %arrayidx76 = getelementptr inbounds [1200 x double], [1200 x double]* %83, i64 %idxprom75
  %85 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom77 = sext i32 %85 to i64
  %arrayidx78 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx76, i64 0, i64 %idxprom77
  %86 = load double, double* %arrayidx78, align 8, !tbaa !9
  %div79 = fdiv double %86, %mul74
  store double %div79, double* %arrayidx78, align 8, !tbaa !9
  br label %for.inc80

for.inc80:                                        ; preds = %for.body64
  %87 = load i32, i32* %j, align 4, !tbaa !3
  %inc81 = add nsw i32 %87, 1
  store i32 %inc81, i32* %j, align 4, !tbaa !3
  br label %for.cond62

for.end82:                                        ; preds = %for.cond62
  br label %for.inc83

for.inc83:                                        ; preds = %for.end82
  %88 = load i32, i32* %i, align 4, !tbaa !3
  %inc84 = add nsw i32 %88, 1
  store i32 %inc84, i32* %i, align 4, !tbaa !3
  br label %for.cond59

for.end85:                                        ; preds = %for.cond59
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond86

for.cond86:                                       ; preds = %for.inc133, %for.end85
  %89 = load i32, i32* %i, align 4, !tbaa !3
  %90 = load i32, i32* %m.addr, align 4, !tbaa !3
  %sub87 = sub nsw i32 %90, 1
  %cmp88 = icmp slt i32 %89, %sub87
  br i1 %cmp88, label %for.body89, label %for.end135

for.body89:                                       ; preds = %for.cond86
  %91 = load [1200 x double]*, [1200 x double]** %corr.addr, align 8, !tbaa !7
  %92 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom90 = sext i32 %92 to i64
  %arrayidx91 = getelementptr inbounds [1200 x double], [1200 x double]* %91, i64 %idxprom90
  %93 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom92 = sext i32 %93 to i64
  %arrayidx93 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx91, i64 0, i64 %idxprom92
  store double 1.000000e+00, double* %arrayidx93, align 8, !tbaa !9
  %94 = load i32, i32* %i, align 4, !tbaa !3
  %add94 = add nsw i32 %94, 1
  store i32 %add94, i32* %j, align 4, !tbaa !3
  br label %for.cond95

for.cond95:                                       ; preds = %for.inc130, %for.body89
  %95 = load i32, i32* %j, align 4, !tbaa !3
  %96 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp96 = icmp slt i32 %95, %96
  br i1 %cmp96, label %for.body97, label %for.end132

for.body97:                                       ; preds = %for.cond95
  %97 = load [1200 x double]*, [1200 x double]** %corr.addr, align 8, !tbaa !7
  %98 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom98 = sext i32 %98 to i64
  %arrayidx99 = getelementptr inbounds [1200 x double], [1200 x double]* %97, i64 %idxprom98
  %99 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom100 = sext i32 %99 to i64
  %arrayidx101 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx99, i64 0, i64 %idxprom100
  store double 0.000000e+00, double* %arrayidx101, align 8, !tbaa !9
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond102

for.cond102:                                      ; preds = %for.inc119, %for.body97
  %100 = load i32, i32* %k, align 4, !tbaa !3
  %101 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp103 = icmp slt i32 %100, %101
  br i1 %cmp103, label %for.body104, label %for.end121

for.body104:                                      ; preds = %for.cond102
  %102 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %103 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom105 = sext i32 %103 to i64
  %arrayidx106 = getelementptr inbounds [1200 x double], [1200 x double]* %102, i64 %idxprom105
  %104 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom107 = sext i32 %104 to i64
  %arrayidx108 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx106, i64 0, i64 %idxprom107
  %105 = load double, double* %arrayidx108, align 8, !tbaa !9
  %106 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %107 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom109 = sext i32 %107 to i64
  %arrayidx110 = getelementptr inbounds [1200 x double], [1200 x double]* %106, i64 %idxprom109
  %108 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom111 = sext i32 %108 to i64
  %arrayidx112 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx110, i64 0, i64 %idxprom111
  %109 = load double, double* %arrayidx112, align 8, !tbaa !9
  %mul113 = fmul double %105, %109
  %110 = load [1200 x double]*, [1200 x double]** %corr.addr, align 8, !tbaa !7
  %111 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom114 = sext i32 %111 to i64
  %arrayidx115 = getelementptr inbounds [1200 x double], [1200 x double]* %110, i64 %idxprom114
  %112 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom116 = sext i32 %112 to i64
  %arrayidx117 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx115, i64 0, i64 %idxprom116
  %113 = load double, double* %arrayidx117, align 8, !tbaa !9
  %add118 = fadd double %113, %mul113
  store double %add118, double* %arrayidx117, align 8, !tbaa !9
  br label %for.inc119

for.inc119:                                       ; preds = %for.body104
  %114 = load i32, i32* %k, align 4, !tbaa !3
  %inc120 = add nsw i32 %114, 1
  store i32 %inc120, i32* %k, align 4, !tbaa !3
  br label %for.cond102

for.end121:                                       ; preds = %for.cond102
  %115 = load [1200 x double]*, [1200 x double]** %corr.addr, align 8, !tbaa !7
  %116 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom122 = sext i32 %116 to i64
  %arrayidx123 = getelementptr inbounds [1200 x double], [1200 x double]* %115, i64 %idxprom122
  %117 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom124 = sext i32 %117 to i64
  %arrayidx125 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx123, i64 0, i64 %idxprom124
  %118 = load double, double* %arrayidx125, align 8, !tbaa !9
  %119 = load [1200 x double]*, [1200 x double]** %corr.addr, align 8, !tbaa !7
  %120 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom126 = sext i32 %120 to i64
  %arrayidx127 = getelementptr inbounds [1200 x double], [1200 x double]* %119, i64 %idxprom126
  %121 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom128 = sext i32 %121 to i64
  %arrayidx129 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx127, i64 0, i64 %idxprom128
  store double %118, double* %arrayidx129, align 8, !tbaa !9
  br label %for.inc130

for.inc130:                                       ; preds = %for.end121
  %122 = load i32, i32* %j, align 4, !tbaa !3
  %inc131 = add nsw i32 %122, 1
  store i32 %inc131, i32* %j, align 4, !tbaa !3
  br label %for.cond95

for.end132:                                       ; preds = %for.cond95
  br label %for.inc133

for.inc133:                                       ; preds = %for.end132
  %123 = load i32, i32* %i, align 4, !tbaa !3
  %inc134 = add nsw i32 %123, 1
  store i32 %inc134, i32* %i, align 4, !tbaa !3
  br label %for.cond86

for.end135:                                       ; preds = %for.cond86
  %124 = load [1200 x double]*, [1200 x double]** %corr.addr, align 8, !tbaa !7
  %125 = load i32, i32* %m.addr, align 4, !tbaa !3
  %sub136 = sub nsw i32 %125, 1
  %idxprom137 = sext i32 %sub136 to i64
  %arrayidx138 = getelementptr inbounds [1200 x double], [1200 x double]* %124, i64 %idxprom137
  %126 = load i32, i32* %m.addr, align 4, !tbaa !3
  %sub139 = sub nsw i32 %126, 1
  %idxprom140 = sext i32 %sub139 to i64
  %arrayidx141 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx138, i64 0, i64 %idxprom140
  store double 1.000000e+00, double* %arrayidx141, align 8, !tbaa !9
  %127 = bitcast double* %eps to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %127) #4
  %128 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %128) #4
  %129 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %129) #4
  %130 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %130) #4
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %m, [1200 x double]* %corr) #0 {
entry:
  %m.addr = alloca i32, align 4
  %corr.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store [1200 x double]* %corr, [1200 x double]** %corr.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
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
  %7 = load i32, i32* %m.addr, align 4, !tbaa !3
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
  %13 = load [1200 x double]*, [1200 x double]** %corr.addr, align 8, !tbaa !7
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
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
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
