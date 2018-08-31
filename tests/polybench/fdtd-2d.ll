; ModuleID = '../stencils/fdtd-2d/fdtd-2d.c'
source_filename = "../stencils/fdtd-2d/fdtd-2d.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %tmax = alloca i32, align 4
  %nx = alloca i32, align 4
  %ny = alloca i32, align 4
  %ex = alloca [1000 x [1200 x double]]*, align 8
  %ey = alloca [1000 x [1200 x double]]*, align 8
  %hz = alloca [1000 x [1200 x double]]*, align 8
  %_fict_ = alloca [500 x double]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %tmax to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 500, i32* %tmax, align 4, !tbaa !3
  %1 = bitcast i32* %nx to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 1000, i32* %nx, align 4, !tbaa !3
  %2 = bitcast i32* %ny to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 1200, i32* %ny, align 4, !tbaa !3
  %3 = bitcast [1000 x [1200 x double]]** %ex to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %call = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %4 = bitcast i8* %call to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %4, [1000 x [1200 x double]]** %ex, align 8, !tbaa !7
  %5 = bitcast [1000 x [1200 x double]]** %ey to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %call1 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %6 = bitcast i8* %call1 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %6, [1000 x [1200 x double]]** %ey, align 8, !tbaa !7
  %7 = bitcast [1000 x [1200 x double]]** %hz to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #3
  %call2 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %8 = bitcast i8* %call2 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %8, [1000 x [1200 x double]]** %hz, align 8, !tbaa !7
  %9 = bitcast [500 x double]** %_fict_ to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #3
  %call3 = call i8* @polybench_alloc_data(i64 500, i32 8)
  %10 = bitcast i8* %call3 to [500 x double]*
  store [500 x double]* %10, [500 x double]** %_fict_, align 8, !tbaa !7
  %11 = load i32, i32* %tmax, align 4, !tbaa !3
  %12 = load i32, i32* %nx, align 4, !tbaa !3
  %13 = load i32, i32* %ny, align 4, !tbaa !3
  %14 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %ex, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %14, i32 0, i32 0
  %15 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %ey, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %15, i32 0, i32 0
  %16 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %hz, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %16, i32 0, i32 0
  %17 = load [500 x double]*, [500 x double]** %_fict_, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [500 x double], [500 x double]* %17, i32 0, i32 0
  call void @init_array(i32 %11, i32 %12, i32 %13, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  %18 = load i32, i32* %tmax, align 4, !tbaa !3
  %19 = load i32, i32* %nx, align 4, !tbaa !3
  %20 = load i32, i32* %ny, align 4, !tbaa !3
  %21 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %ex, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %21, i32 0, i32 0
  %22 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %ey, align 8, !tbaa !7
  %arraydecay8 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %22, i32 0, i32 0
  %23 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %hz, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %23, i32 0, i32 0
  %24 = load [500 x double]*, [500 x double]** %_fict_, align 8, !tbaa !7
  %arraydecay10 = getelementptr inbounds [500 x double], [500 x double]* %24, i32 0, i32 0
  call void @kernel_fdtd_2d(i32 %18, i32 %19, i32 %20, [1200 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1200 x double]* %arraydecay9, double* %arraydecay10)
  %25 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %25, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %26 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %26, i64 0
  %27 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call11 = call i32 @strcmp(i8* %27, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call11, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %28 = load i32, i32* %nx, align 4, !tbaa !3
  %29 = load i32, i32* %ny, align 4, !tbaa !3
  %30 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %ex, align 8, !tbaa !7
  %arraydecay12 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %30, i32 0, i32 0
  %31 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %ey, align 8, !tbaa !7
  %arraydecay13 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %31, i32 0, i32 0
  %32 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %hz, align 8, !tbaa !7
  %arraydecay14 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %32, i32 0, i32 0
  call void @print_array(i32 %28, i32 %29, [1200 x double]* %arraydecay12, [1200 x double]* %arraydecay13, [1200 x double]* %arraydecay14)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %33 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %ex, align 8, !tbaa !7
  %34 = bitcast [1000 x [1200 x double]]* %33 to i8*
  call void @free(i8* %34)
  %35 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %ey, align 8, !tbaa !7
  %36 = bitcast [1000 x [1200 x double]]* %35 to i8*
  call void @free(i8* %36)
  %37 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %hz, align 8, !tbaa !7
  %38 = bitcast [1000 x [1200 x double]]* %37 to i8*
  call void @free(i8* %38)
  %39 = load [500 x double]*, [500 x double]** %_fict_, align 8, !tbaa !7
  %40 = bitcast [500 x double]* %39 to i8*
  call void @free(i8* %40)
  %41 = bitcast [500 x double]** %_fict_ to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #3
  %42 = bitcast [1000 x [1200 x double]]** %hz to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %42) #3
  %43 = bitcast [1000 x [1200 x double]]** %ey to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %43) #3
  %44 = bitcast [1000 x [1200 x double]]** %ex to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %44) #3
  %45 = bitcast i32* %ny to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %45) #3
  %46 = bitcast i32* %nx to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %46) #3
  %47 = bitcast i32* %tmax to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %47) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) #0 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca [1200 x double]*, align 8
  %ey.addr = alloca [1200 x double]*, align 8
  %hz.addr = alloca [1200 x double]*, align 8
  %_fict_.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4, !tbaa !3
  store i32 %nx, i32* %nx.addr, align 4, !tbaa !3
  store i32 %ny, i32* %ny.addr, align 4, !tbaa !3
  store [1200 x double]* %ex, [1200 x double]** %ex.addr, align 8, !tbaa !7
  store [1200 x double]* %ey, [1200 x double]** %ey.addr, align 8, !tbaa !7
  store [1200 x double]* %hz, [1200 x double]** %hz.addr, align 8, !tbaa !7
  store double* %_fict_, double** %_fict_.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %tmax.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %conv = sitofp i32 %4 to double
  %5 = load double*, double** %_fict_.addr, align 8, !tbaa !7
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom
  store double %conv, double* %arrayidx, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc39, %for.end
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %8, %9
  br i1 %cmp2, label %for.body4, label %for.end41

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc36, %for.body4
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %11 = load i32, i32* %ny.addr, align 4, !tbaa !3
  %cmp6 = icmp slt i32 %10, %11
  br i1 %cmp6, label %for.body8, label %for.end38

for.body8:                                        ; preds = %for.cond5
  %12 = load i32, i32* %i, align 4, !tbaa !3
  %conv9 = sitofp i32 %12 to double
  %13 = load i32, i32* %j, align 4, !tbaa !3
  %add = add nsw i32 %13, 1
  %conv10 = sitofp i32 %add to double
  %mul = fmul double %conv9, %conv10
  %14 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %conv11 = sitofp i32 %14 to double
  %div = fdiv double %mul, %conv11
  %15 = load [1200 x double]*, [1200 x double]** %ex.addr, align 8, !tbaa !7
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom12 = sext i32 %16 to i64
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %15, i64 %idxprom12
  %17 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom14 = sext i32 %17 to i64
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx13, i64 0, i64 %idxprom14
  store double %div, double* %arrayidx15, align 8, !tbaa !9
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %conv16 = sitofp i32 %18 to double
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %add17 = add nsw i32 %19, 2
  %conv18 = sitofp i32 %add17 to double
  %mul19 = fmul double %conv16, %conv18
  %20 = load i32, i32* %ny.addr, align 4, !tbaa !3
  %conv20 = sitofp i32 %20 to double
  %div21 = fdiv double %mul19, %conv20
  %21 = load [1200 x double]*, [1200 x double]** %ey.addr, align 8, !tbaa !7
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom22 = sext i32 %22 to i64
  %arrayidx23 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %idxprom22
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom24 = sext i32 %23 to i64
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx23, i64 0, i64 %idxprom24
  store double %div21, double* %arrayidx25, align 8, !tbaa !9
  %24 = load i32, i32* %i, align 4, !tbaa !3
  %conv26 = sitofp i32 %24 to double
  %25 = load i32, i32* %j, align 4, !tbaa !3
  %add27 = add nsw i32 %25, 3
  %conv28 = sitofp i32 %add27 to double
  %mul29 = fmul double %conv26, %conv28
  %26 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %conv30 = sitofp i32 %26 to double
  %div31 = fdiv double %mul29, %conv30
  %27 = load [1200 x double]*, [1200 x double]** %hz.addr, align 8, !tbaa !7
  %28 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom32 = sext i32 %28 to i64
  %arrayidx33 = getelementptr inbounds [1200 x double], [1200 x double]* %27, i64 %idxprom32
  %29 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom34 = sext i32 %29 to i64
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx33, i64 0, i64 %idxprom34
  store double %div31, double* %arrayidx35, align 8, !tbaa !9
  br label %for.inc36

for.inc36:                                        ; preds = %for.body8
  %30 = load i32, i32* %j, align 4, !tbaa !3
  %inc37 = add nsw i32 %30, 1
  store i32 %inc37, i32* %j, align 4, !tbaa !3
  br label %for.cond5

for.end38:                                        ; preds = %for.cond5
  br label %for.inc39

for.inc39:                                        ; preds = %for.end38
  %31 = load i32, i32* %i, align 4, !tbaa !3
  %inc40 = add nsw i32 %31, 1
  store i32 %inc40, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end41:                                        ; preds = %for.cond1
  %32 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3
  %33 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_fdtd_2d(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) #0 {
entry:
  %tmax.addr = alloca i32, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca [1200 x double]*, align 8
  %ey.addr = alloca [1200 x double]*, align 8
  %hz.addr = alloca [1200 x double]*, align 8
  %_fict_.addr = alloca double*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tmax, i32* %tmax.addr, align 4, !tbaa !3
  store i32 %nx, i32* %nx.addr, align 4, !tbaa !3
  store i32 %ny, i32* %ny.addr, align 4, !tbaa !3
  store [1200 x double]* %ex, [1200 x double]** %ex.addr, align 8, !tbaa !7
  store [1200 x double]* %ey, [1200 x double]** %ey.addr, align 8, !tbaa !7
  store [1200 x double]* %hz, [1200 x double]** %hz.addr, align 8, !tbaa !7
  store double* %_fict_, double** %_fict_.addr, align 8, !tbaa !7
  %0 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc113, %entry
  %3 = load i32, i32* %t, align 4, !tbaa !3
  %4 = load i32, i32* %tmax.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end115

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %ny.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %7 = load double*, double** %_fict_.addr, align 8, !tbaa !7
  %8 = load i32, i32* %t, align 4, !tbaa !3
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom
  %9 = load double, double* %arrayidx, align 8, !tbaa !9
  %10 = load [1200 x double]*, [1200 x double]** %ey.addr, align 8, !tbaa !7
  %arrayidx4 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom5 = sext i32 %11 to i64
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx4, i64 0, i64 %idxprom5
  store double %9, double* %arrayidx6, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc34, %for.end
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %14 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %cmp8 = icmp slt i32 %13, %14
  br i1 %cmp8, label %for.body9, label %for.end36

for.body9:                                        ; preds = %for.cond7
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc31, %for.body9
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %16 = load i32, i32* %ny.addr, align 4, !tbaa !3
  %cmp11 = icmp slt i32 %15, %16
  br i1 %cmp11, label %for.body12, label %for.end33

for.body12:                                       ; preds = %for.cond10
  %17 = load [1200 x double]*, [1200 x double]** %ey.addr, align 8, !tbaa !7
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom13 = sext i32 %18 to i64
  %arrayidx14 = getelementptr inbounds [1200 x double], [1200 x double]* %17, i64 %idxprom13
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom15 = sext i32 %19 to i64
  %arrayidx16 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx14, i64 0, i64 %idxprom15
  %20 = load double, double* %arrayidx16, align 8, !tbaa !9
  %21 = load [1200 x double]*, [1200 x double]** %hz.addr, align 8, !tbaa !7
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom17 = sext i32 %22 to i64
  %arrayidx18 = getelementptr inbounds [1200 x double], [1200 x double]* %21, i64 %idxprom17
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom19 = sext i32 %23 to i64
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx18, i64 0, i64 %idxprom19
  %24 = load double, double* %arrayidx20, align 8, !tbaa !9
  %25 = load [1200 x double]*, [1200 x double]** %hz.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %sub = sub nsw i32 %26, 1
  %idxprom21 = sext i32 %sub to i64
  %arrayidx22 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %idxprom21
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom23 = sext i32 %27 to i64
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx22, i64 0, i64 %idxprom23
  %28 = load double, double* %arrayidx24, align 8, !tbaa !9
  %sub25 = fsub double %24, %28
  %mul = fmul double 5.000000e-01, %sub25
  %sub26 = fsub double %20, %mul
  %29 = load [1200 x double]*, [1200 x double]** %ey.addr, align 8, !tbaa !7
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom27 = sext i32 %30 to i64
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %29, i64 %idxprom27
  %31 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom29 = sext i32 %31 to i64
  %arrayidx30 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx28, i64 0, i64 %idxprom29
  store double %sub26, double* %arrayidx30, align 8, !tbaa !9
  br label %for.inc31

for.inc31:                                        ; preds = %for.body12
  %32 = load i32, i32* %j, align 4, !tbaa !3
  %inc32 = add nsw i32 %32, 1
  store i32 %inc32, i32* %j, align 4, !tbaa !3
  br label %for.cond10

for.end33:                                        ; preds = %for.cond10
  br label %for.inc34

for.inc34:                                        ; preds = %for.end33
  %33 = load i32, i32* %i, align 4, !tbaa !3
  %inc35 = add nsw i32 %33, 1
  store i32 %inc35, i32* %i, align 4, !tbaa !3
  br label %for.cond7

for.end36:                                        ; preds = %for.cond7
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc66, %for.end36
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %35 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %cmp38 = icmp slt i32 %34, %35
  br i1 %cmp38, label %for.body39, label %for.end68

for.body39:                                       ; preds = %for.cond37
  store i32 1, i32* %j, align 4, !tbaa !3
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc63, %for.body39
  %36 = load i32, i32* %j, align 4, !tbaa !3
  %37 = load i32, i32* %ny.addr, align 4, !tbaa !3
  %cmp41 = icmp slt i32 %36, %37
  br i1 %cmp41, label %for.body42, label %for.end65

for.body42:                                       ; preds = %for.cond40
  %38 = load [1200 x double]*, [1200 x double]** %ex.addr, align 8, !tbaa !7
  %39 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom43 = sext i32 %39 to i64
  %arrayidx44 = getelementptr inbounds [1200 x double], [1200 x double]* %38, i64 %idxprom43
  %40 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom45 = sext i32 %40 to i64
  %arrayidx46 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx44, i64 0, i64 %idxprom45
  %41 = load double, double* %arrayidx46, align 8, !tbaa !9
  %42 = load [1200 x double]*, [1200 x double]** %hz.addr, align 8, !tbaa !7
  %43 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom47 = sext i32 %43 to i64
  %arrayidx48 = getelementptr inbounds [1200 x double], [1200 x double]* %42, i64 %idxprom47
  %44 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom49 = sext i32 %44 to i64
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx48, i64 0, i64 %idxprom49
  %45 = load double, double* %arrayidx50, align 8, !tbaa !9
  %46 = load [1200 x double]*, [1200 x double]** %hz.addr, align 8, !tbaa !7
  %47 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom51 = sext i32 %47 to i64
  %arrayidx52 = getelementptr inbounds [1200 x double], [1200 x double]* %46, i64 %idxprom51
  %48 = load i32, i32* %j, align 4, !tbaa !3
  %sub53 = sub nsw i32 %48, 1
  %idxprom54 = sext i32 %sub53 to i64
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx52, i64 0, i64 %idxprom54
  %49 = load double, double* %arrayidx55, align 8, !tbaa !9
  %sub56 = fsub double %45, %49
  %mul57 = fmul double 5.000000e-01, %sub56
  %sub58 = fsub double %41, %mul57
  %50 = load [1200 x double]*, [1200 x double]** %ex.addr, align 8, !tbaa !7
  %51 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom59 = sext i32 %51 to i64
  %arrayidx60 = getelementptr inbounds [1200 x double], [1200 x double]* %50, i64 %idxprom59
  %52 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom61 = sext i32 %52 to i64
  %arrayidx62 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx60, i64 0, i64 %idxprom61
  store double %sub58, double* %arrayidx62, align 8, !tbaa !9
  br label %for.inc63

for.inc63:                                        ; preds = %for.body42
  %53 = load i32, i32* %j, align 4, !tbaa !3
  %inc64 = add nsw i32 %53, 1
  store i32 %inc64, i32* %j, align 4, !tbaa !3
  br label %for.cond40

for.end65:                                        ; preds = %for.cond40
  br label %for.inc66

for.inc66:                                        ; preds = %for.end65
  %54 = load i32, i32* %i, align 4, !tbaa !3
  %inc67 = add nsw i32 %54, 1
  store i32 %inc67, i32* %i, align 4, !tbaa !3
  br label %for.cond37

for.end68:                                        ; preds = %for.cond37
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond69

for.cond69:                                       ; preds = %for.inc110, %for.end68
  %55 = load i32, i32* %i, align 4, !tbaa !3
  %56 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %sub70 = sub nsw i32 %56, 1
  %cmp71 = icmp slt i32 %55, %sub70
  br i1 %cmp71, label %for.body72, label %for.end112

for.body72:                                       ; preds = %for.cond69
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc107, %for.body72
  %57 = load i32, i32* %j, align 4, !tbaa !3
  %58 = load i32, i32* %ny.addr, align 4, !tbaa !3
  %sub74 = sub nsw i32 %58, 1
  %cmp75 = icmp slt i32 %57, %sub74
  br i1 %cmp75, label %for.body76, label %for.end109

for.body76:                                       ; preds = %for.cond73
  %59 = load [1200 x double]*, [1200 x double]** %hz.addr, align 8, !tbaa !7
  %60 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom77 = sext i32 %60 to i64
  %arrayidx78 = getelementptr inbounds [1200 x double], [1200 x double]* %59, i64 %idxprom77
  %61 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom79 = sext i32 %61 to i64
  %arrayidx80 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx78, i64 0, i64 %idxprom79
  %62 = load double, double* %arrayidx80, align 8, !tbaa !9
  %63 = load [1200 x double]*, [1200 x double]** %ex.addr, align 8, !tbaa !7
  %64 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom81 = sext i32 %64 to i64
  %arrayidx82 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %idxprom81
  %65 = load i32, i32* %j, align 4, !tbaa !3
  %add = add nsw i32 %65, 1
  %idxprom83 = sext i32 %add to i64
  %arrayidx84 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx82, i64 0, i64 %idxprom83
  %66 = load double, double* %arrayidx84, align 8, !tbaa !9
  %67 = load [1200 x double]*, [1200 x double]** %ex.addr, align 8, !tbaa !7
  %68 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom85 = sext i32 %68 to i64
  %arrayidx86 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %idxprom85
  %69 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom87 = sext i32 %69 to i64
  %arrayidx88 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx86, i64 0, i64 %idxprom87
  %70 = load double, double* %arrayidx88, align 8, !tbaa !9
  %sub89 = fsub double %66, %70
  %71 = load [1200 x double]*, [1200 x double]** %ey.addr, align 8, !tbaa !7
  %72 = load i32, i32* %i, align 4, !tbaa !3
  %add90 = add nsw i32 %72, 1
  %idxprom91 = sext i32 %add90 to i64
  %arrayidx92 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %idxprom91
  %73 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom93 = sext i32 %73 to i64
  %arrayidx94 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx92, i64 0, i64 %idxprom93
  %74 = load double, double* %arrayidx94, align 8, !tbaa !9
  %add95 = fadd double %sub89, %74
  %75 = load [1200 x double]*, [1200 x double]** %ey.addr, align 8, !tbaa !7
  %76 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom96 = sext i32 %76 to i64
  %arrayidx97 = getelementptr inbounds [1200 x double], [1200 x double]* %75, i64 %idxprom96
  %77 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom98 = sext i32 %77 to i64
  %arrayidx99 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx97, i64 0, i64 %idxprom98
  %78 = load double, double* %arrayidx99, align 8, !tbaa !9
  %sub100 = fsub double %add95, %78
  %mul101 = fmul double 0x3FE6666666666666, %sub100
  %sub102 = fsub double %62, %mul101
  %79 = load [1200 x double]*, [1200 x double]** %hz.addr, align 8, !tbaa !7
  %80 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom103 = sext i32 %80 to i64
  %arrayidx104 = getelementptr inbounds [1200 x double], [1200 x double]* %79, i64 %idxprom103
  %81 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom105 = sext i32 %81 to i64
  %arrayidx106 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx104, i64 0, i64 %idxprom105
  store double %sub102, double* %arrayidx106, align 8, !tbaa !9
  br label %for.inc107

for.inc107:                                       ; preds = %for.body76
  %82 = load i32, i32* %j, align 4, !tbaa !3
  %inc108 = add nsw i32 %82, 1
  store i32 %inc108, i32* %j, align 4, !tbaa !3
  br label %for.cond73

for.end109:                                       ; preds = %for.cond73
  br label %for.inc110

for.inc110:                                       ; preds = %for.end109
  %83 = load i32, i32* %i, align 4, !tbaa !3
  %inc111 = add nsw i32 %83, 1
  store i32 %inc111, i32* %i, align 4, !tbaa !3
  br label %for.cond69

for.end112:                                       ; preds = %for.cond69
  br label %for.inc113

for.inc113:                                       ; preds = %for.end112
  %84 = load i32, i32* %t, align 4, !tbaa !3
  %inc114 = add nsw i32 %84, 1
  store i32 %inc114, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.end115:                                       ; preds = %for.cond
  %85 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %85) #3
  %86 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %86) #3
  %87 = bitcast i32* %t to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %87) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %nx, i32 %ny, [1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz) #0 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca [1200 x double]*, align 8
  %ey.addr = alloca [1200 x double]*, align 8
  %hz.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %nx, i32* %nx.addr, align 4, !tbaa !3
  store i32 %ny, i32* %ny.addr, align 4, !tbaa !3
  store [1200 x double]* %ex, [1200 x double]** %ex.addr, align 8, !tbaa !7
  store [1200 x double]* %ey, [1200 x double]** %ey.addr, align 8, !tbaa !7
  store [1200 x double]* %hz, [1200 x double]** %hz.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %5 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %7 = load i32, i32* %ny.addr, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %6, %7
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %nx.addr, align 4, !tbaa !3
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
  %13 = load [1200 x double]*, [1200 x double]** %ex.addr, align 8, !tbaa !7
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
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  %20 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call14 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %21 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call15 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc37, %for.end12
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %23 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %cmp17 = icmp slt i32 %22, %23
  br i1 %cmp17, label %for.body18, label %for.end39

for.body18:                                       ; preds = %for.cond16
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc34, %for.body18
  %24 = load i32, i32* %j, align 4, !tbaa !3
  %25 = load i32, i32* %ny.addr, align 4, !tbaa !3
  %cmp20 = icmp slt i32 %24, %25
  br i1 %cmp20, label %for.body21, label %for.end36

for.body21:                                       ; preds = %for.cond19
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %27 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %mul22 = mul nsw i32 %26, %27
  %28 = load i32, i32* %j, align 4, !tbaa !3
  %add23 = add nsw i32 %mul22, %28
  %rem24 = srem i32 %add23, 20
  %cmp25 = icmp eq i32 %rem24, 0
  br i1 %cmp25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %for.body21
  %29 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call27 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %29, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %for.body21
  %30 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %31 = load [1200 x double]*, [1200 x double]** %ey.addr, align 8, !tbaa !7
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom29 = sext i32 %32 to i64
  %arrayidx30 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 %idxprom29
  %33 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom31 = sext i32 %33 to i64
  %arrayidx32 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx30, i64 0, i64 %idxprom31
  %34 = load double, double* %arrayidx32, align 8, !tbaa !9
  %call33 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %34)
  br label %for.inc34

for.inc34:                                        ; preds = %if.end28
  %35 = load i32, i32* %j, align 4, !tbaa !3
  %inc35 = add nsw i32 %35, 1
  store i32 %inc35, i32* %j, align 4, !tbaa !3
  br label %for.cond19

for.end36:                                        ; preds = %for.cond19
  br label %for.inc37

for.inc37:                                        ; preds = %for.end36
  %36 = load i32, i32* %i, align 4, !tbaa !3
  %inc38 = add nsw i32 %36, 1
  store i32 %inc38, i32* %i, align 4, !tbaa !3
  br label %for.cond16

for.end39:                                        ; preds = %for.cond16
  %37 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call40 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  %38 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call41 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %38, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc63, %for.end39
  %39 = load i32, i32* %i, align 4, !tbaa !3
  %40 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %cmp43 = icmp slt i32 %39, %40
  br i1 %cmp43, label %for.body44, label %for.end65

for.body44:                                       ; preds = %for.cond42
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond45

for.cond45:                                       ; preds = %for.inc60, %for.body44
  %41 = load i32, i32* %j, align 4, !tbaa !3
  %42 = load i32, i32* %ny.addr, align 4, !tbaa !3
  %cmp46 = icmp slt i32 %41, %42
  br i1 %cmp46, label %for.body47, label %for.end62

for.body47:                                       ; preds = %for.cond45
  %43 = load i32, i32* %i, align 4, !tbaa !3
  %44 = load i32, i32* %nx.addr, align 4, !tbaa !3
  %mul48 = mul nsw i32 %43, %44
  %45 = load i32, i32* %j, align 4, !tbaa !3
  %add49 = add nsw i32 %mul48, %45
  %rem50 = srem i32 %add49, 20
  %cmp51 = icmp eq i32 %rem50, 0
  br i1 %cmp51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %for.body47
  %46 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call53 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end54

if.end54:                                         ; preds = %if.then52, %for.body47
  %47 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %48 = load [1200 x double]*, [1200 x double]** %hz.addr, align 8, !tbaa !7
  %49 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom55 = sext i32 %49 to i64
  %arrayidx56 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 %idxprom55
  %50 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom57 = sext i32 %50 to i64
  %arrayidx58 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx56, i64 0, i64 %idxprom57
  %51 = load double, double* %arrayidx58, align 8, !tbaa !9
  %call59 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %47, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %51)
  br label %for.inc60

for.inc60:                                        ; preds = %if.end54
  %52 = load i32, i32* %j, align 4, !tbaa !3
  %inc61 = add nsw i32 %52, 1
  store i32 %inc61, i32* %j, align 4, !tbaa !3
  br label %for.cond45

for.end62:                                        ; preds = %for.cond45
  br label %for.inc63

for.inc63:                                        ; preds = %for.end62
  %53 = load i32, i32* %i, align 4, !tbaa !3
  %inc64 = add nsw i32 %53, 1
  store i32 %inc64, i32* %i, align 4, !tbaa !3
  br label %for.cond42

for.end65:                                        ; preds = %for.cond42
  %54 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call66 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %54, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0))
  %55 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %55) #3
  %56 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %56) #3
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
