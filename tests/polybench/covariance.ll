; ModuleID = '../datamining/covariance/covariance.c'
source_filename = "../datamining/covariance/covariance.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
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
  %cov = alloca [1200 x [1200 x double]]*, align 8
  %mean = alloca [1200 x double]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 1400, i32* %n, align 4, !tbaa !3
  %1 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 1200, i32* %m, align 4, !tbaa !3
  %2 = bitcast double* %float_n to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %3 = bitcast [1400 x [1200 x double]]** %data to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %call = call i8* @polybench_alloc_data(i64 1680000, i32 8)
  %4 = bitcast i8* %call to [1400 x [1200 x double]]*
  store [1400 x [1200 x double]]* %4, [1400 x [1200 x double]]** %data, align 8, !tbaa !7
  %5 = bitcast [1200 x [1200 x double]]** %cov to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %call1 = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %6 = bitcast i8* %call1 to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %6, [1200 x [1200 x double]]** %cov, align 8, !tbaa !7
  %7 = bitcast [1200 x double]** %mean to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #3
  %call2 = call i8* @polybench_alloc_data(i64 1200, i32 8)
  %8 = bitcast i8* %call2 to [1200 x double]*
  store [1200 x double]* %8, [1200 x double]** %mean, align 8, !tbaa !7
  %9 = load i32, i32* %m, align 4, !tbaa !3
  %10 = load i32, i32* %n, align 4, !tbaa !3
  %11 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %data, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %11, i32 0, i32 0
  call void @init_array(i32 %9, i32 %10, double* %float_n, [1200 x double]* %arraydecay)
  %12 = load i32, i32* %m, align 4, !tbaa !3
  %13 = load i32, i32* %n, align 4, !tbaa !3
  %14 = load double, double* %float_n, align 8, !tbaa !9
  %15 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %data, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %15, i32 0, i32 0
  %16 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %cov, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %16, i32 0, i32 0
  %17 = load [1200 x double]*, [1200 x double]** %mean, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [1200 x double], [1200 x double]* %17, i32 0, i32 0
  call void @kernel_covariance(i32 %12, i32 %13, double %14, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4, double* %arraydecay5)
  %18 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %18, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %19 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %19, i64 0
  %20 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call6 = call i32 @strcmp(i8* %20, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call6, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %21 = load i32, i32* %m, align 4, !tbaa !3
  %22 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %cov, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %22, i32 0, i32 0
  call void @print_array(i32 %21, [1200 x double]* %arraydecay7)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %23 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %data, align 8, !tbaa !7
  %24 = bitcast [1400 x [1200 x double]]* %23 to i8*
  call void @free(i8* %24)
  %25 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %cov, align 8, !tbaa !7
  %26 = bitcast [1200 x [1200 x double]]* %25 to i8*
  call void @free(i8* %26)
  %27 = load [1200 x double]*, [1200 x double]** %mean, align 8, !tbaa !7
  %28 = bitcast [1200 x double]* %27 to i8*
  call void @free(i8* %28)
  %29 = bitcast [1200 x double]** %mean to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %29) #3
  %30 = bitcast [1200 x [1200 x double]]** %cov to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %30) #3
  %31 = bitcast [1400 x [1200 x double]]** %data to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %31) #3
  %32 = bitcast double* %float_n to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %32) #3
  %33 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #3
  %34 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #3
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
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv = sitofp i32 %2 to double
  %3 = load double*, double** %float_n.addr, align 8, !tbaa !7
  store double %conv, double* %3, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, 1400
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %5, 1200
  br i1 %cmp3, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond2
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %conv6 = sitofp i32 %6 to double
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %conv7 = sitofp i32 %7 to double
  %mul = fmul double %conv6, %conv7
  %div = fdiv double %mul, 1.200000e+03
  %8 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %idxprom
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom8 = sext i32 %10 to i64
  %arrayidx9 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx, i64 0, i64 %idxprom8
  store double %div, double* %arrayidx9, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %12 = load i32, i32* %i, align 4, !tbaa !3
  %inc11 = add nsw i32 %12, 1
  store i32 %inc11, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  %13 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #3
  %14 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_covariance(i32 %m, i32 %n, double %float_n, [1200 x double]* %data, [1200 x double]* %cov, double* %mean) #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %float_n.addr = alloca double, align 8
  %data.addr = alloca [1200 x double]*, align 8
  %cov.addr = alloca [1200 x double]*, align 8
  %mean.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double %float_n, double* %float_n.addr, align 8, !tbaa !9
  store [1200 x double]* %data, [1200 x double]** %data.addr, align 8, !tbaa !7
  store [1200 x double]* %cov, [1200 x double]** %cov.addr, align 8, !tbaa !7
  store double* %mean, double** %mean.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %3 = load i32, i32* %j, align 4, !tbaa !3
  %4 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  %5 = load double*, double** %mean.addr, align 8, !tbaa !7
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %7, %8
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %9 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom4 = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %idxprom4
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx5, i64 0, i64 %idxprom6
  %12 = load double, double* %arrayidx7, align 8, !tbaa !9
  %13 = load double*, double** %mean.addr, align 8, !tbaa !7
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds double, double* %13, i64 %idxprom8
  %15 = load double, double* %arrayidx9, align 8, !tbaa !9
  %add = fadd double %15, %12
  store double %add, double* %arrayidx9, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %17 = load double, double* %float_n.addr, align 8, !tbaa !9
  %18 = load double*, double** %mean.addr, align 8, !tbaa !7
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom10 = sext i32 %19 to i64
  %arrayidx11 = getelementptr inbounds double, double* %18, i64 %idxprom10
  %20 = load double, double* %arrayidx11, align 8, !tbaa !9
  %div = fdiv double %20, %17
  store double %div, double* %arrayidx11, align 8, !tbaa !9
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %21 = load i32, i32* %j, align 4, !tbaa !3
  %inc13 = add nsw i32 %21, 1
  store i32 %inc13, i32* %j, align 4, !tbaa !3
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc30, %for.end14
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %23 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp16 = icmp slt i32 %22, %23
  br i1 %cmp16, label %for.body17, label %for.end32

for.body17:                                       ; preds = %for.cond15
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc27, %for.body17
  %24 = load i32, i32* %j, align 4, !tbaa !3
  %25 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp19 = icmp slt i32 %24, %25
  br i1 %cmp19, label %for.body20, label %for.end29

for.body20:                                       ; preds = %for.cond18
  %26 = load double*, double** %mean.addr, align 8, !tbaa !7
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom21 = sext i32 %27 to i64
  %arrayidx22 = getelementptr inbounds double, double* %26, i64 %idxprom21
  %28 = load double, double* %arrayidx22, align 8, !tbaa !9
  %29 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom23 = sext i32 %30 to i64
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %29, i64 %idxprom23
  %31 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom25 = sext i32 %31 to i64
  %arrayidx26 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx24, i64 0, i64 %idxprom25
  %32 = load double, double* %arrayidx26, align 8, !tbaa !9
  %sub = fsub double %32, %28
  store double %sub, double* %arrayidx26, align 8, !tbaa !9
  br label %for.inc27

for.inc27:                                        ; preds = %for.body20
  %33 = load i32, i32* %j, align 4, !tbaa !3
  %inc28 = add nsw i32 %33, 1
  store i32 %inc28, i32* %j, align 4, !tbaa !3
  br label %for.cond18

for.end29:                                        ; preds = %for.cond18
  br label %for.inc30

for.inc30:                                        ; preds = %for.end29
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %inc31 = add nsw i32 %34, 1
  store i32 %inc31, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.end32:                                        ; preds = %for.cond15
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc79, %for.end32
  %35 = load i32, i32* %i, align 4, !tbaa !3
  %36 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp34 = icmp slt i32 %35, %36
  br i1 %cmp34, label %for.body35, label %for.end81

for.body35:                                       ; preds = %for.cond33
  %37 = load i32, i32* %i, align 4, !tbaa !3
  store i32 %37, i32* %j, align 4, !tbaa !3
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc76, %for.body35
  %38 = load i32, i32* %j, align 4, !tbaa !3
  %39 = load i32, i32* %m.addr, align 4, !tbaa !3
  %cmp37 = icmp slt i32 %38, %39
  br i1 %cmp37, label %for.body38, label %for.end78

for.body38:                                       ; preds = %for.cond36
  %40 = load [1200 x double]*, [1200 x double]** %cov.addr, align 8, !tbaa !7
  %41 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom39 = sext i32 %41 to i64
  %arrayidx40 = getelementptr inbounds [1200 x double], [1200 x double]* %40, i64 %idxprom39
  %42 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom41 = sext i32 %42 to i64
  %arrayidx42 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx40, i64 0, i64 %idxprom41
  store double 0.000000e+00, double* %arrayidx42, align 8, !tbaa !9
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc59, %for.body38
  %43 = load i32, i32* %k, align 4, !tbaa !3
  %44 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp44 = icmp slt i32 %43, %44
  br i1 %cmp44, label %for.body45, label %for.end61

for.body45:                                       ; preds = %for.cond43
  %45 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %46 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom46 = sext i32 %46 to i64
  %arrayidx47 = getelementptr inbounds [1200 x double], [1200 x double]* %45, i64 %idxprom46
  %47 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom48 = sext i32 %47 to i64
  %arrayidx49 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx47, i64 0, i64 %idxprom48
  %48 = load double, double* %arrayidx49, align 8, !tbaa !9
  %49 = load [1200 x double]*, [1200 x double]** %data.addr, align 8, !tbaa !7
  %50 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom50 = sext i32 %50 to i64
  %arrayidx51 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %idxprom50
  %51 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom52 = sext i32 %51 to i64
  %arrayidx53 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx51, i64 0, i64 %idxprom52
  %52 = load double, double* %arrayidx53, align 8, !tbaa !9
  %mul = fmul double %48, %52
  %53 = load [1200 x double]*, [1200 x double]** %cov.addr, align 8, !tbaa !7
  %54 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom54 = sext i32 %54 to i64
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %53, i64 %idxprom54
  %55 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom56 = sext i32 %55 to i64
  %arrayidx57 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx55, i64 0, i64 %idxprom56
  %56 = load double, double* %arrayidx57, align 8, !tbaa !9
  %add58 = fadd double %56, %mul
  store double %add58, double* %arrayidx57, align 8, !tbaa !9
  br label %for.inc59

for.inc59:                                        ; preds = %for.body45
  %57 = load i32, i32* %k, align 4, !tbaa !3
  %inc60 = add nsw i32 %57, 1
  store i32 %inc60, i32* %k, align 4, !tbaa !3
  br label %for.cond43

for.end61:                                        ; preds = %for.cond43
  %58 = load double, double* %float_n.addr, align 8, !tbaa !9
  %sub62 = fsub double %58, 1.000000e+00
  %59 = load [1200 x double]*, [1200 x double]** %cov.addr, align 8, !tbaa !7
  %60 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom63 = sext i32 %60 to i64
  %arrayidx64 = getelementptr inbounds [1200 x double], [1200 x double]* %59, i64 %idxprom63
  %61 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom65 = sext i32 %61 to i64
  %arrayidx66 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx64, i64 0, i64 %idxprom65
  %62 = load double, double* %arrayidx66, align 8, !tbaa !9
  %div67 = fdiv double %62, %sub62
  store double %div67, double* %arrayidx66, align 8, !tbaa !9
  %63 = load [1200 x double]*, [1200 x double]** %cov.addr, align 8, !tbaa !7
  %64 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom68 = sext i32 %64 to i64
  %arrayidx69 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %idxprom68
  %65 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom70 = sext i32 %65 to i64
  %arrayidx71 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx69, i64 0, i64 %idxprom70
  %66 = load double, double* %arrayidx71, align 8, !tbaa !9
  %67 = load [1200 x double]*, [1200 x double]** %cov.addr, align 8, !tbaa !7
  %68 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom72 = sext i32 %68 to i64
  %arrayidx73 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %idxprom72
  %69 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom74 = sext i32 %69 to i64
  %arrayidx75 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx73, i64 0, i64 %idxprom74
  store double %66, double* %arrayidx75, align 8, !tbaa !9
  br label %for.inc76

for.inc76:                                        ; preds = %for.end61
  %70 = load i32, i32* %j, align 4, !tbaa !3
  %inc77 = add nsw i32 %70, 1
  store i32 %inc77, i32* %j, align 4, !tbaa !3
  br label %for.cond36

for.end78:                                        ; preds = %for.cond36
  br label %for.inc79

for.inc79:                                        ; preds = %for.end78
  %71 = load i32, i32* %i, align 4, !tbaa !3
  %inc80 = add nsw i32 %71, 1
  store i32 %inc80, i32* %i, align 4, !tbaa !3
  br label %for.cond33

for.end81:                                        ; preds = %for.cond33
  %72 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %72) #3
  %73 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %73) #3
  %74 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %74) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %m, [1200 x double]* %cov) #0 {
entry:
  %m.addr = alloca i32, align 4
  %cov.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4, !tbaa !3
  store [1200 x double]* %cov, [1200 x double]** %cov.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0))
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
  %13 = load [1200 x double]*, [1200 x double]** %cov.addr, align 8, !tbaa !7
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
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0))
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
