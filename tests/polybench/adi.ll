; ModuleID = '../stencils/adi/adi.c'
source_filename = "../stencils/adi/adi.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
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
  %tsteps = alloca i32, align 4
  %u = alloca [1000 x [1000 x double]]*, align 8
  %v = alloca [1000 x [1000 x double]]*, align 8
  %p = alloca [1000 x [1000 x double]]*, align 8
  %q = alloca [1000 x [1000 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 1000, i32* %n, align 4, !tbaa !3
  %1 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 500, i32* %tsteps, align 4, !tbaa !3
  %2 = bitcast [1000 x [1000 x double]]** %u to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %call = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %3 = bitcast i8* %call to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %3, [1000 x [1000 x double]]** %u, align 8, !tbaa !7
  %4 = bitcast [1000 x [1000 x double]]** %v to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %call1 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %5 = bitcast i8* %call1 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %5, [1000 x [1000 x double]]** %v, align 8, !tbaa !7
  %6 = bitcast [1000 x [1000 x double]]** %p to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #3
  %call2 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %7 = bitcast i8* %call2 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %7, [1000 x [1000 x double]]** %p, align 8, !tbaa !7
  %8 = bitcast [1000 x [1000 x double]]** %q to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #3
  %call3 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %9 = bitcast i8* %call3 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %9, [1000 x [1000 x double]]** %q, align 8, !tbaa !7
  %10 = load i32, i32* %n, align 4, !tbaa !3
  %11 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %u, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %11, i32 0, i32 0
  call void @init_array(i32 %10, [1000 x double]* %arraydecay)
  %12 = load i32, i32* %tsteps, align 4, !tbaa !3
  %13 = load i32, i32* %n, align 4, !tbaa !3
  %14 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %u, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %14, i32 0, i32 0
  %15 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %v, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %15, i32 0, i32 0
  %16 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %p, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %16, i32 0, i32 0
  %17 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %q, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %17, i32 0, i32 0
  call void @kernel_adi(i32 %12, i32 %13, [1000 x double]* %arraydecay4, [1000 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
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
  %21 = load i32, i32* %n, align 4, !tbaa !3
  %22 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %u, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %22, i32 0, i32 0
  call void @print_array(i32 %21, [1000 x double]* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %23 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %u, align 8, !tbaa !7
  %24 = bitcast [1000 x [1000 x double]]* %23 to i8*
  call void @free(i8* %24)
  %25 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %v, align 8, !tbaa !7
  %26 = bitcast [1000 x [1000 x double]]* %25 to i8*
  call void @free(i8* %26)
  %27 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %p, align 8, !tbaa !7
  %28 = bitcast [1000 x [1000 x double]]* %27 to i8*
  call void @free(i8* %28)
  %29 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %q, align 8, !tbaa !7
  %30 = bitcast [1000 x [1000 x double]]* %29 to i8*
  call void @free(i8* %30)
  %31 = bitcast [1000 x [1000 x double]]** %q to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %31) #3
  %32 = bitcast [1000 x [1000 x double]]** %p to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %32) #3
  %33 = bitcast [1000 x [1000 x double]]** %v to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %33) #3
  %34 = bitcast [1000 x [1000 x double]]** %u to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #3
  %35 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #3
  %36 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %36) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %n, [1000 x double]* %u) #0 {
entry:
  %n.addr = alloca i32, align 4
  %u.addr = alloca [1000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1000 x double]* %u, [1000 x double]** %u.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end9

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
  %7 = load i32, i32* %n.addr, align 4, !tbaa !3
  %add = add nsw i32 %6, %7
  %8 = load i32, i32* %j, align 4, !tbaa !3
  %sub = sub nsw i32 %add, %8
  %conv = sitofp i32 %sub to double
  %9 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv4 = sitofp i32 %9 to double
  %div = fdiv double %conv, %conv4
  %10 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %idxprom
  %12 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom5 = sext i32 %12 to i64
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom5
  store double %div, double* %arrayidx6, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %inc8 = add nsw i32 %14, 1
  store i32 %inc8, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %15 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3
  %16 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_adi(i32 %tsteps, i32 %n, [1000 x double]* %u, [1000 x double]* %v, [1000 x double]* %p, [1000 x double]* %q) #0 {
entry:
  %tsteps.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %u.addr = alloca [1000 x double]*, align 8
  %v.addr = alloca [1000 x double]*, align 8
  %p.addr = alloca [1000 x double]*, align 8
  %q.addr = alloca [1000 x double]*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %DX = alloca double, align 8
  %DY = alloca double, align 8
  %DT = alloca double, align 8
  %B1 = alloca double, align 8
  %B2 = alloca double, align 8
  %mul1 = alloca double, align 8
  %mul2 = alloca double, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %c = alloca double, align 8
  %d = alloca double, align 8
  %e = alloca double, align 8
  %f = alloca double, align 8
  store i32 %tsteps, i32* %tsteps.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1000 x double]* %u, [1000 x double]** %u.addr, align 8, !tbaa !7
  store [1000 x double]* %v, [1000 x double]** %v.addr, align 8, !tbaa !7
  store [1000 x double]* %p, [1000 x double]** %p.addr, align 8, !tbaa !7
  store [1000 x double]* %q, [1000 x double]** %q.addr, align 8, !tbaa !7
  %0 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  %3 = bitcast double* %DX to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %4 = bitcast double* %DY to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %5 = bitcast double* %DT to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %6 = bitcast double* %B1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #3
  %7 = bitcast double* %B2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #3
  %8 = bitcast double* %mul1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #3
  %9 = bitcast double* %mul2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #3
  %10 = bitcast double* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #3
  %11 = bitcast double* %b to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %11) #3
  %12 = bitcast double* %c to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #3
  %13 = bitcast double* %d to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %13) #3
  %14 = bitcast double* %e to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %14) #3
  %15 = bitcast double* %f to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %15) #3
  %16 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv = sitofp i32 %16 to double
  %div = fdiv double 1.000000e+00, %conv
  store double %div, double* %DX, align 8, !tbaa !9
  %17 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv1 = sitofp i32 %17 to double
  %div2 = fdiv double 1.000000e+00, %conv1
  store double %div2, double* %DY, align 8, !tbaa !9
  %18 = load i32, i32* %tsteps.addr, align 4, !tbaa !3
  %conv3 = sitofp i32 %18 to double
  %div4 = fdiv double 1.000000e+00, %conv3
  store double %div4, double* %DT, align 8, !tbaa !9
  store double 2.000000e+00, double* %B1, align 8, !tbaa !9
  store double 1.000000e+00, double* %B2, align 8, !tbaa !9
  %19 = load double, double* %B1, align 8, !tbaa !9
  %20 = load double, double* %DT, align 8, !tbaa !9
  %mul = fmul double %19, %20
  %21 = load double, double* %DX, align 8, !tbaa !9
  %22 = load double, double* %DX, align 8, !tbaa !9
  %mul5 = fmul double %21, %22
  %div6 = fdiv double %mul, %mul5
  store double %div6, double* %mul1, align 8, !tbaa !9
  %23 = load double, double* %B2, align 8, !tbaa !9
  %24 = load double, double* %DT, align 8, !tbaa !9
  %mul7 = fmul double %23, %24
  %25 = load double, double* %DY, align 8, !tbaa !9
  %26 = load double, double* %DY, align 8, !tbaa !9
  %mul8 = fmul double %25, %26
  %div9 = fdiv double %mul7, %mul8
  store double %div9, double* %mul2, align 8, !tbaa !9
  %27 = load double, double* %mul1, align 8, !tbaa !9
  %sub = fsub double -0.000000e+00, %27
  %div10 = fdiv double %sub, 2.000000e+00
  store double %div10, double* %a, align 8, !tbaa !9
  %28 = load double, double* %mul1, align 8, !tbaa !9
  %add = fadd double 1.000000e+00, %28
  store double %add, double* %b, align 8, !tbaa !9
  %29 = load double, double* %a, align 8, !tbaa !9
  store double %29, double* %c, align 8, !tbaa !9
  %30 = load double, double* %mul2, align 8, !tbaa !9
  %sub11 = fsub double -0.000000e+00, %30
  %div12 = fdiv double %sub11, 2.000000e+00
  store double %div12, double* %d, align 8, !tbaa !9
  %31 = load double, double* %mul2, align 8, !tbaa !9
  %add13 = fadd double 1.000000e+00, %31
  store double %add13, double* %e, align 8, !tbaa !9
  %32 = load double, double* %d, align 8, !tbaa !9
  store double %32, double* %f, align 8, !tbaa !9
  store i32 1, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc237, %entry
  %33 = load i32, i32* %t, align 4, !tbaa !3
  %34 = load i32, i32* %tsteps.addr, align 4, !tbaa !3
  %cmp = icmp sle i32 %33, %34
  br i1 %cmp, label %for.body, label %for.end239

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc120, %for.body
  %35 = load i32, i32* %i, align 4, !tbaa !3
  %36 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub16 = sub nsw i32 %36, 1
  %cmp17 = icmp slt i32 %35, %sub16
  br i1 %cmp17, label %for.body19, label %for.end122

for.body19:                                       ; preds = %for.cond15
  %37 = load [1000 x double]*, [1000 x double]** %v.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %37, i64 0
  %38 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %38 to i64
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom
  store double 1.000000e+00, double* %arrayidx20, align 8, !tbaa !9
  %39 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %40 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom21 = sext i32 %40 to i64
  %arrayidx22 = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %idxprom21
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx22, i64 0, i64 0
  store double 0.000000e+00, double* %arrayidx23, align 8, !tbaa !9
  %41 = load [1000 x double]*, [1000 x double]** %v.addr, align 8, !tbaa !7
  %arrayidx24 = getelementptr inbounds [1000 x double], [1000 x double]* %41, i64 0
  %42 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom25 = sext i32 %42 to i64
  %arrayidx26 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx24, i64 0, i64 %idxprom25
  %43 = load double, double* %arrayidx26, align 8, !tbaa !9
  %44 = load [1000 x double]*, [1000 x double]** %q.addr, align 8, !tbaa !7
  %45 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom27 = sext i32 %45 to i64
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %idxprom27
  %arrayidx29 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx28, i64 0, i64 0
  store double %43, double* %arrayidx29, align 8, !tbaa !9
  store i32 1, i32* %j, align 4, !tbaa !3
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc, %for.body19
  %46 = load i32, i32* %j, align 4, !tbaa !3
  %47 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub31 = sub nsw i32 %47, 1
  %cmp32 = icmp slt i32 %46, %sub31
  br i1 %cmp32, label %for.body34, label %for.end

for.body34:                                       ; preds = %for.cond30
  %48 = load double, double* %c, align 8, !tbaa !9
  %sub35 = fsub double -0.000000e+00, %48
  %49 = load double, double* %a, align 8, !tbaa !9
  %50 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %51 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom36 = sext i32 %51 to i64
  %arrayidx37 = getelementptr inbounds [1000 x double], [1000 x double]* %50, i64 %idxprom36
  %52 = load i32, i32* %j, align 4, !tbaa !3
  %sub38 = sub nsw i32 %52, 1
  %idxprom39 = sext i32 %sub38 to i64
  %arrayidx40 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx37, i64 0, i64 %idxprom39
  %53 = load double, double* %arrayidx40, align 8, !tbaa !9
  %mul41 = fmul double %49, %53
  %54 = load double, double* %b, align 8, !tbaa !9
  %add42 = fadd double %mul41, %54
  %div43 = fdiv double %sub35, %add42
  %55 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %56 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom44 = sext i32 %56 to i64
  %arrayidx45 = getelementptr inbounds [1000 x double], [1000 x double]* %55, i64 %idxprom44
  %57 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom46 = sext i32 %57 to i64
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx45, i64 0, i64 %idxprom46
  store double %div43, double* %arrayidx47, align 8, !tbaa !9
  %58 = load double, double* %d, align 8, !tbaa !9
  %sub48 = fsub double -0.000000e+00, %58
  %59 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %60 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom49 = sext i32 %60 to i64
  %arrayidx50 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 %idxprom49
  %61 = load i32, i32* %i, align 4, !tbaa !3
  %sub51 = sub nsw i32 %61, 1
  %idxprom52 = sext i32 %sub51 to i64
  %arrayidx53 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx50, i64 0, i64 %idxprom52
  %62 = load double, double* %arrayidx53, align 8, !tbaa !9
  %mul54 = fmul double %sub48, %62
  %63 = load double, double* %d, align 8, !tbaa !9
  %mul55 = fmul double 2.000000e+00, %63
  %add56 = fadd double 1.000000e+00, %mul55
  %64 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %65 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom57 = sext i32 %65 to i64
  %arrayidx58 = getelementptr inbounds [1000 x double], [1000 x double]* %64, i64 %idxprom57
  %66 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom59 = sext i32 %66 to i64
  %arrayidx60 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx58, i64 0, i64 %idxprom59
  %67 = load double, double* %arrayidx60, align 8, !tbaa !9
  %mul61 = fmul double %add56, %67
  %add62 = fadd double %mul54, %mul61
  %68 = load double, double* %f, align 8, !tbaa !9
  %69 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %70 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom63 = sext i32 %70 to i64
  %arrayidx64 = getelementptr inbounds [1000 x double], [1000 x double]* %69, i64 %idxprom63
  %71 = load i32, i32* %i, align 4, !tbaa !3
  %add65 = add nsw i32 %71, 1
  %idxprom66 = sext i32 %add65 to i64
  %arrayidx67 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx64, i64 0, i64 %idxprom66
  %72 = load double, double* %arrayidx67, align 8, !tbaa !9
  %mul68 = fmul double %68, %72
  %sub69 = fsub double %add62, %mul68
  %73 = load double, double* %a, align 8, !tbaa !9
  %74 = load [1000 x double]*, [1000 x double]** %q.addr, align 8, !tbaa !7
  %75 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom70 = sext i32 %75 to i64
  %arrayidx71 = getelementptr inbounds [1000 x double], [1000 x double]* %74, i64 %idxprom70
  %76 = load i32, i32* %j, align 4, !tbaa !3
  %sub72 = sub nsw i32 %76, 1
  %idxprom73 = sext i32 %sub72 to i64
  %arrayidx74 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx71, i64 0, i64 %idxprom73
  %77 = load double, double* %arrayidx74, align 8, !tbaa !9
  %mul75 = fmul double %73, %77
  %sub76 = fsub double %sub69, %mul75
  %78 = load double, double* %a, align 8, !tbaa !9
  %79 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %80 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom77 = sext i32 %80 to i64
  %arrayidx78 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %idxprom77
  %81 = load i32, i32* %j, align 4, !tbaa !3
  %sub79 = sub nsw i32 %81, 1
  %idxprom80 = sext i32 %sub79 to i64
  %arrayidx81 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx78, i64 0, i64 %idxprom80
  %82 = load double, double* %arrayidx81, align 8, !tbaa !9
  %mul82 = fmul double %78, %82
  %83 = load double, double* %b, align 8, !tbaa !9
  %add83 = fadd double %mul82, %83
  %div84 = fdiv double %sub76, %add83
  %84 = load [1000 x double]*, [1000 x double]** %q.addr, align 8, !tbaa !7
  %85 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom85 = sext i32 %85 to i64
  %arrayidx86 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %idxprom85
  %86 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom87 = sext i32 %86 to i64
  %arrayidx88 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx86, i64 0, i64 %idxprom87
  store double %div84, double* %arrayidx88, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body34
  %87 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %87, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond30

for.end:                                          ; preds = %for.cond30
  %88 = load [1000 x double]*, [1000 x double]** %v.addr, align 8, !tbaa !7
  %89 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub89 = sub nsw i32 %89, 1
  %idxprom90 = sext i32 %sub89 to i64
  %arrayidx91 = getelementptr inbounds [1000 x double], [1000 x double]* %88, i64 %idxprom90
  %90 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom92 = sext i32 %90 to i64
  %arrayidx93 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx91, i64 0, i64 %idxprom92
  store double 1.000000e+00, double* %arrayidx93, align 8, !tbaa !9
  %91 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub94 = sub nsw i32 %91, 2
  store i32 %sub94, i32* %j, align 4, !tbaa !3
  br label %for.cond95

for.cond95:                                       ; preds = %for.inc118, %for.end
  %92 = load i32, i32* %j, align 4, !tbaa !3
  %cmp96 = icmp sge i32 %92, 1
  br i1 %cmp96, label %for.body98, label %for.end119

for.body98:                                       ; preds = %for.cond95
  %93 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %94 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom99 = sext i32 %94 to i64
  %arrayidx100 = getelementptr inbounds [1000 x double], [1000 x double]* %93, i64 %idxprom99
  %95 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom101 = sext i32 %95 to i64
  %arrayidx102 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx100, i64 0, i64 %idxprom101
  %96 = load double, double* %arrayidx102, align 8, !tbaa !9
  %97 = load [1000 x double]*, [1000 x double]** %v.addr, align 8, !tbaa !7
  %98 = load i32, i32* %j, align 4, !tbaa !3
  %add103 = add nsw i32 %98, 1
  %idxprom104 = sext i32 %add103 to i64
  %arrayidx105 = getelementptr inbounds [1000 x double], [1000 x double]* %97, i64 %idxprom104
  %99 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom106 = sext i32 %99 to i64
  %arrayidx107 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx105, i64 0, i64 %idxprom106
  %100 = load double, double* %arrayidx107, align 8, !tbaa !9
  %mul108 = fmul double %96, %100
  %101 = load [1000 x double]*, [1000 x double]** %q.addr, align 8, !tbaa !7
  %102 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom109 = sext i32 %102 to i64
  %arrayidx110 = getelementptr inbounds [1000 x double], [1000 x double]* %101, i64 %idxprom109
  %103 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom111 = sext i32 %103 to i64
  %arrayidx112 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx110, i64 0, i64 %idxprom111
  %104 = load double, double* %arrayidx112, align 8, !tbaa !9
  %add113 = fadd double %mul108, %104
  %105 = load [1000 x double]*, [1000 x double]** %v.addr, align 8, !tbaa !7
  %106 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom114 = sext i32 %106 to i64
  %arrayidx115 = getelementptr inbounds [1000 x double], [1000 x double]* %105, i64 %idxprom114
  %107 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom116 = sext i32 %107 to i64
  %arrayidx117 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx115, i64 0, i64 %idxprom116
  store double %add113, double* %arrayidx117, align 8, !tbaa !9
  br label %for.inc118

for.inc118:                                       ; preds = %for.body98
  %108 = load i32, i32* %j, align 4, !tbaa !3
  %dec = add nsw i32 %108, -1
  store i32 %dec, i32* %j, align 4, !tbaa !3
  br label %for.cond95

for.end119:                                       ; preds = %for.cond95
  br label %for.inc120

for.inc120:                                       ; preds = %for.end119
  %109 = load i32, i32* %i, align 4, !tbaa !3
  %inc121 = add nsw i32 %109, 1
  store i32 %inc121, i32* %i, align 4, !tbaa !3
  br label %for.cond15

for.end122:                                       ; preds = %for.cond15
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond123

for.cond123:                                      ; preds = %for.inc234, %for.end122
  %110 = load i32, i32* %i, align 4, !tbaa !3
  %111 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub124 = sub nsw i32 %111, 1
  %cmp125 = icmp slt i32 %110, %sub124
  br i1 %cmp125, label %for.body127, label %for.end236

for.body127:                                      ; preds = %for.cond123
  %112 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %113 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom128 = sext i32 %113 to i64
  %arrayidx129 = getelementptr inbounds [1000 x double], [1000 x double]* %112, i64 %idxprom128
  %arrayidx130 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx129, i64 0, i64 0
  store double 1.000000e+00, double* %arrayidx130, align 8, !tbaa !9
  %114 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %115 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom131 = sext i32 %115 to i64
  %arrayidx132 = getelementptr inbounds [1000 x double], [1000 x double]* %114, i64 %idxprom131
  %arrayidx133 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx132, i64 0, i64 0
  store double 0.000000e+00, double* %arrayidx133, align 8, !tbaa !9
  %116 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %117 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom134 = sext i32 %117 to i64
  %arrayidx135 = getelementptr inbounds [1000 x double], [1000 x double]* %116, i64 %idxprom134
  %arrayidx136 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx135, i64 0, i64 0
  %118 = load double, double* %arrayidx136, align 8, !tbaa !9
  %119 = load [1000 x double]*, [1000 x double]** %q.addr, align 8, !tbaa !7
  %120 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom137 = sext i32 %120 to i64
  %arrayidx138 = getelementptr inbounds [1000 x double], [1000 x double]* %119, i64 %idxprom137
  %arrayidx139 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx138, i64 0, i64 0
  store double %118, double* %arrayidx139, align 8, !tbaa !9
  store i32 1, i32* %j, align 4, !tbaa !3
  br label %for.cond140

for.cond140:                                      ; preds = %for.inc199, %for.body127
  %121 = load i32, i32* %j, align 4, !tbaa !3
  %122 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub141 = sub nsw i32 %122, 1
  %cmp142 = icmp slt i32 %121, %sub141
  br i1 %cmp142, label %for.body144, label %for.end201

for.body144:                                      ; preds = %for.cond140
  %123 = load double, double* %f, align 8, !tbaa !9
  %sub145 = fsub double -0.000000e+00, %123
  %124 = load double, double* %d, align 8, !tbaa !9
  %125 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %126 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom146 = sext i32 %126 to i64
  %arrayidx147 = getelementptr inbounds [1000 x double], [1000 x double]* %125, i64 %idxprom146
  %127 = load i32, i32* %j, align 4, !tbaa !3
  %sub148 = sub nsw i32 %127, 1
  %idxprom149 = sext i32 %sub148 to i64
  %arrayidx150 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx147, i64 0, i64 %idxprom149
  %128 = load double, double* %arrayidx150, align 8, !tbaa !9
  %mul151 = fmul double %124, %128
  %129 = load double, double* %e, align 8, !tbaa !9
  %add152 = fadd double %mul151, %129
  %div153 = fdiv double %sub145, %add152
  %130 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %131 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom154 = sext i32 %131 to i64
  %arrayidx155 = getelementptr inbounds [1000 x double], [1000 x double]* %130, i64 %idxprom154
  %132 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom156 = sext i32 %132 to i64
  %arrayidx157 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx155, i64 0, i64 %idxprom156
  store double %div153, double* %arrayidx157, align 8, !tbaa !9
  %133 = load double, double* %a, align 8, !tbaa !9
  %sub158 = fsub double -0.000000e+00, %133
  %134 = load [1000 x double]*, [1000 x double]** %v.addr, align 8, !tbaa !7
  %135 = load i32, i32* %i, align 4, !tbaa !3
  %sub159 = sub nsw i32 %135, 1
  %idxprom160 = sext i32 %sub159 to i64
  %arrayidx161 = getelementptr inbounds [1000 x double], [1000 x double]* %134, i64 %idxprom160
  %136 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom162 = sext i32 %136 to i64
  %arrayidx163 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx161, i64 0, i64 %idxprom162
  %137 = load double, double* %arrayidx163, align 8, !tbaa !9
  %mul164 = fmul double %sub158, %137
  %138 = load double, double* %a, align 8, !tbaa !9
  %mul165 = fmul double 2.000000e+00, %138
  %add166 = fadd double 1.000000e+00, %mul165
  %139 = load [1000 x double]*, [1000 x double]** %v.addr, align 8, !tbaa !7
  %140 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom167 = sext i32 %140 to i64
  %arrayidx168 = getelementptr inbounds [1000 x double], [1000 x double]* %139, i64 %idxprom167
  %141 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom169 = sext i32 %141 to i64
  %arrayidx170 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx168, i64 0, i64 %idxprom169
  %142 = load double, double* %arrayidx170, align 8, !tbaa !9
  %mul171 = fmul double %add166, %142
  %add172 = fadd double %mul164, %mul171
  %143 = load double, double* %c, align 8, !tbaa !9
  %144 = load [1000 x double]*, [1000 x double]** %v.addr, align 8, !tbaa !7
  %145 = load i32, i32* %i, align 4, !tbaa !3
  %add173 = add nsw i32 %145, 1
  %idxprom174 = sext i32 %add173 to i64
  %arrayidx175 = getelementptr inbounds [1000 x double], [1000 x double]* %144, i64 %idxprom174
  %146 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom176 = sext i32 %146 to i64
  %arrayidx177 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx175, i64 0, i64 %idxprom176
  %147 = load double, double* %arrayidx177, align 8, !tbaa !9
  %mul178 = fmul double %143, %147
  %sub179 = fsub double %add172, %mul178
  %148 = load double, double* %d, align 8, !tbaa !9
  %149 = load [1000 x double]*, [1000 x double]** %q.addr, align 8, !tbaa !7
  %150 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom180 = sext i32 %150 to i64
  %arrayidx181 = getelementptr inbounds [1000 x double], [1000 x double]* %149, i64 %idxprom180
  %151 = load i32, i32* %j, align 4, !tbaa !3
  %sub182 = sub nsw i32 %151, 1
  %idxprom183 = sext i32 %sub182 to i64
  %arrayidx184 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx181, i64 0, i64 %idxprom183
  %152 = load double, double* %arrayidx184, align 8, !tbaa !9
  %mul185 = fmul double %148, %152
  %sub186 = fsub double %sub179, %mul185
  %153 = load double, double* %d, align 8, !tbaa !9
  %154 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %155 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom187 = sext i32 %155 to i64
  %arrayidx188 = getelementptr inbounds [1000 x double], [1000 x double]* %154, i64 %idxprom187
  %156 = load i32, i32* %j, align 4, !tbaa !3
  %sub189 = sub nsw i32 %156, 1
  %idxprom190 = sext i32 %sub189 to i64
  %arrayidx191 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx188, i64 0, i64 %idxprom190
  %157 = load double, double* %arrayidx191, align 8, !tbaa !9
  %mul192 = fmul double %153, %157
  %158 = load double, double* %e, align 8, !tbaa !9
  %add193 = fadd double %mul192, %158
  %div194 = fdiv double %sub186, %add193
  %159 = load [1000 x double]*, [1000 x double]** %q.addr, align 8, !tbaa !7
  %160 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom195 = sext i32 %160 to i64
  %arrayidx196 = getelementptr inbounds [1000 x double], [1000 x double]* %159, i64 %idxprom195
  %161 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom197 = sext i32 %161 to i64
  %arrayidx198 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx196, i64 0, i64 %idxprom197
  store double %div194, double* %arrayidx198, align 8, !tbaa !9
  br label %for.inc199

for.inc199:                                       ; preds = %for.body144
  %162 = load i32, i32* %j, align 4, !tbaa !3
  %inc200 = add nsw i32 %162, 1
  store i32 %inc200, i32* %j, align 4, !tbaa !3
  br label %for.cond140

for.end201:                                       ; preds = %for.cond140
  %163 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %164 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom202 = sext i32 %164 to i64
  %arrayidx203 = getelementptr inbounds [1000 x double], [1000 x double]* %163, i64 %idxprom202
  %165 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub204 = sub nsw i32 %165, 1
  %idxprom205 = sext i32 %sub204 to i64
  %arrayidx206 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx203, i64 0, i64 %idxprom205
  store double 1.000000e+00, double* %arrayidx206, align 8, !tbaa !9
  %166 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub207 = sub nsw i32 %166, 2
  store i32 %sub207, i32* %j, align 4, !tbaa !3
  br label %for.cond208

for.cond208:                                      ; preds = %for.inc231, %for.end201
  %167 = load i32, i32* %j, align 4, !tbaa !3
  %cmp209 = icmp sge i32 %167, 1
  br i1 %cmp209, label %for.body211, label %for.end233

for.body211:                                      ; preds = %for.cond208
  %168 = load [1000 x double]*, [1000 x double]** %p.addr, align 8, !tbaa !7
  %169 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom212 = sext i32 %169 to i64
  %arrayidx213 = getelementptr inbounds [1000 x double], [1000 x double]* %168, i64 %idxprom212
  %170 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom214 = sext i32 %170 to i64
  %arrayidx215 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx213, i64 0, i64 %idxprom214
  %171 = load double, double* %arrayidx215, align 8, !tbaa !9
  %172 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %173 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom216 = sext i32 %173 to i64
  %arrayidx217 = getelementptr inbounds [1000 x double], [1000 x double]* %172, i64 %idxprom216
  %174 = load i32, i32* %j, align 4, !tbaa !3
  %add218 = add nsw i32 %174, 1
  %idxprom219 = sext i32 %add218 to i64
  %arrayidx220 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx217, i64 0, i64 %idxprom219
  %175 = load double, double* %arrayidx220, align 8, !tbaa !9
  %mul221 = fmul double %171, %175
  %176 = load [1000 x double]*, [1000 x double]** %q.addr, align 8, !tbaa !7
  %177 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom222 = sext i32 %177 to i64
  %arrayidx223 = getelementptr inbounds [1000 x double], [1000 x double]* %176, i64 %idxprom222
  %178 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom224 = sext i32 %178 to i64
  %arrayidx225 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx223, i64 0, i64 %idxprom224
  %179 = load double, double* %arrayidx225, align 8, !tbaa !9
  %add226 = fadd double %mul221, %179
  %180 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %181 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom227 = sext i32 %181 to i64
  %arrayidx228 = getelementptr inbounds [1000 x double], [1000 x double]* %180, i64 %idxprom227
  %182 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom229 = sext i32 %182 to i64
  %arrayidx230 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx228, i64 0, i64 %idxprom229
  store double %add226, double* %arrayidx230, align 8, !tbaa !9
  br label %for.inc231

for.inc231:                                       ; preds = %for.body211
  %183 = load i32, i32* %j, align 4, !tbaa !3
  %dec232 = add nsw i32 %183, -1
  store i32 %dec232, i32* %j, align 4, !tbaa !3
  br label %for.cond208

for.end233:                                       ; preds = %for.cond208
  br label %for.inc234

for.inc234:                                       ; preds = %for.end233
  %184 = load i32, i32* %i, align 4, !tbaa !3
  %inc235 = add nsw i32 %184, 1
  store i32 %inc235, i32* %i, align 4, !tbaa !3
  br label %for.cond123

for.end236:                                       ; preds = %for.cond123
  br label %for.inc237

for.inc237:                                       ; preds = %for.end236
  %185 = load i32, i32* %t, align 4, !tbaa !3
  %inc238 = add nsw i32 %185, 1
  store i32 %inc238, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.end239:                                       ; preds = %for.cond
  %186 = bitcast double* %f to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %186) #3
  %187 = bitcast double* %e to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %187) #3
  %188 = bitcast double* %d to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %188) #3
  %189 = bitcast double* %c to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %189) #3
  %190 = bitcast double* %b to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %190) #3
  %191 = bitcast double* %a to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %191) #3
  %192 = bitcast double* %mul2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %192) #3
  %193 = bitcast double* %mul1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %193) #3
  %194 = bitcast double* %B2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %194) #3
  %195 = bitcast double* %B1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %195) #3
  %196 = bitcast double* %DT to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %196) #3
  %197 = bitcast double* %DY to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %197) #3
  %198 = bitcast double* %DX to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %198) #3
  %199 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %199) #3
  %200 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %200) #3
  %201 = bitcast i32* %t to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %201) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, [1000 x double]* %u) #0 {
entry:
  %n.addr = alloca i32, align 4
  %u.addr = alloca [1000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1000 x double]* %u, [1000 x double]** %u.addr, align 8, !tbaa !7
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
  %13 = load [1000 x double]*, [1000 x double]** %u.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %13, i64 %idxprom
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom7
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
