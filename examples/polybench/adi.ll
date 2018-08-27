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

; Function Attrs: noinline nounwind optnone ssp uwtable
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
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 1000, i32* %n, align 4
  store i32 500, i32* %tsteps, align 4
  %call = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %0 = bitcast i8* %call to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %0, [1000 x [1000 x double]]** %u, align 8
  %call1 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %1 = bitcast i8* %call1 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %1, [1000 x [1000 x double]]** %v, align 8
  %call2 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %2 = bitcast i8* %call2 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %2, [1000 x [1000 x double]]** %p, align 8
  %call3 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %3 = bitcast i8* %call3 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %3, [1000 x [1000 x double]]** %q, align 8
  %4 = load i32, i32* %n, align 4
  %5 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %u, align 8
  %arraydecay = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %5, i32 0, i32 0
  call void @init_array(i32 %4, [1000 x double]* %arraydecay)
  %6 = load i32, i32* %tsteps, align 4
  %7 = load i32, i32* %n, align 4
  %8 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %u, align 8
  %arraydecay4 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %8, i32 0, i32 0
  %9 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %v, align 8
  %arraydecay5 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %9, i32 0, i32 0
  %10 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %p, align 8
  %arraydecay6 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %10, i32 0, i32 0
  %11 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %q, align 8
  %arraydecay7 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %11, i32 0, i32 0
  call void @kernel_adi(i32 %6, i32 %7, [1000 x double]* %arraydecay4, [1000 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
  %12 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %12, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %13 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %13, i64 0
  %14 = load i8*, i8** %arrayidx, align 8
  %call8 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %15 = load i32, i32* %n, align 4
  %16 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %u, align 8
  %arraydecay9 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %16, i32 0, i32 0
  call void @print_array(i32 %15, [1000 x double]* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %17 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %u, align 8
  %18 = bitcast [1000 x [1000 x double]]* %17 to i8*
  call void @free(i8* %18)
  %19 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %v, align 8
  %20 = bitcast [1000 x [1000 x double]]* %19 to i8*
  call void @free(i8* %20)
  %21 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %p, align 8
  %22 = bitcast [1000 x [1000 x double]]* %21 to i8*
  call void @free(i8* %22)
  %23 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %q, align 8
  %24 = bitcast [1000 x [1000 x double]]* %23 to i8*
  call void @free(i8* %24)
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @init_array(i32 %n, [1000 x double]* %u) #0 {
entry:
  %n.addr = alloca i32, align 4
  %u.addr = alloca [1000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [1000 x double]* %u, [1000 x double]** %u.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %n.addr, align 4
  %add = add nsw i32 %4, %5
  %6 = load i32, i32* %j, align 4
  %sub = sub nsw i32 %add, %6
  %conv = sitofp i32 %sub to double
  %7 = load i32, i32* %n.addr, align 4
  %conv4 = sitofp i32 %7 to double
  %div = fdiv double %conv, %conv4
  %8 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %8, i64 %idxprom
  %10 = load i32, i32* %j, align 4
  %idxprom5 = sext i32 %10 to i64
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom5
  store double %div, double* %arrayidx6, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %11 = load i32, i32* %j, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %12 = load i32, i32* %i, align 4
  %inc8 = add nsw i32 %12, 1
  store i32 %inc8, i32* %i, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
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
  store i32 %tsteps, i32* %tsteps.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store [1000 x double]* %u, [1000 x double]** %u.addr, align 8
  store [1000 x double]* %v, [1000 x double]** %v.addr, align 8
  store [1000 x double]* %p, [1000 x double]** %p.addr, align 8
  store [1000 x double]* %q, [1000 x double]** %q.addr, align 8
  %0 = load i32, i32* %n.addr, align 4
  %conv = sitofp i32 %0 to double
  %div = fdiv double 1.000000e+00, %conv
  store double %div, double* %DX, align 8
  %1 = load i32, i32* %n.addr, align 4
  %conv1 = sitofp i32 %1 to double
  %div2 = fdiv double 1.000000e+00, %conv1
  store double %div2, double* %DY, align 8
  %2 = load i32, i32* %tsteps.addr, align 4
  %conv3 = sitofp i32 %2 to double
  %div4 = fdiv double 1.000000e+00, %conv3
  store double %div4, double* %DT, align 8
  store double 2.000000e+00, double* %B1, align 8
  store double 1.000000e+00, double* %B2, align 8
  %3 = load double, double* %B1, align 8
  %4 = load double, double* %DT, align 8
  %mul = fmul double %3, %4
  %5 = load double, double* %DX, align 8
  %6 = load double, double* %DX, align 8
  %mul5 = fmul double %5, %6
  %div6 = fdiv double %mul, %mul5
  store double %div6, double* %mul1, align 8
  %7 = load double, double* %B2, align 8
  %8 = load double, double* %DT, align 8
  %mul7 = fmul double %7, %8
  %9 = load double, double* %DY, align 8
  %10 = load double, double* %DY, align 8
  %mul8 = fmul double %9, %10
  %div9 = fdiv double %mul7, %mul8
  store double %div9, double* %mul2, align 8
  %11 = load double, double* %mul1, align 8
  %sub = fsub double -0.000000e+00, %11
  %div10 = fdiv double %sub, 2.000000e+00
  store double %div10, double* %a, align 8
  %12 = load double, double* %mul1, align 8
  %add = fadd double 1.000000e+00, %12
  store double %add, double* %b, align 8
  %13 = load double, double* %a, align 8
  store double %13, double* %c, align 8
  %14 = load double, double* %mul2, align 8
  %sub11 = fsub double -0.000000e+00, %14
  %div12 = fdiv double %sub11, 2.000000e+00
  store double %div12, double* %d, align 8
  %15 = load double, double* %mul2, align 8
  %add13 = fadd double 1.000000e+00, %15
  store double %add13, double* %e, align 8
  %16 = load double, double* %d, align 8
  store double %16, double* %f, align 8
  store i32 1, i32* %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc237, %entry
  %17 = load i32, i32* %t, align 4
  %18 = load i32, i32* %tsteps.addr, align 4
  %cmp = icmp sle i32 %17, %18
  br i1 %cmp, label %for.body, label %for.end239

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc120, %for.body
  %19 = load i32, i32* %i, align 4
  %20 = load i32, i32* %n.addr, align 4
  %sub16 = sub nsw i32 %20, 1
  %cmp17 = icmp slt i32 %19, %sub16
  br i1 %cmp17, label %for.body19, label %for.end122

for.body19:                                       ; preds = %for.cond15
  %21 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %21, i64 0
  %22 = load i32, i32* %i, align 4
  %idxprom = sext i32 %22 to i64
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom
  store double 1.000000e+00, double* %arrayidx20, align 8
  %23 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom21 = sext i32 %24 to i64
  %arrayidx22 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 %idxprom21
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx22, i64 0, i64 0
  store double 0.000000e+00, double* %arrayidx23, align 8
  %25 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %arrayidx24 = getelementptr inbounds [1000 x double], [1000 x double]* %25, i64 0
  %26 = load i32, i32* %i, align 4
  %idxprom25 = sext i32 %26 to i64
  %arrayidx26 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx24, i64 0, i64 %idxprom25
  %27 = load double, double* %arrayidx26, align 8
  %28 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %29 to i64
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %28, i64 %idxprom27
  %arrayidx29 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx28, i64 0, i64 0
  store double %27, double* %arrayidx29, align 8
  store i32 1, i32* %j, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc, %for.body19
  %30 = load i32, i32* %j, align 4
  %31 = load i32, i32* %n.addr, align 4
  %sub31 = sub nsw i32 %31, 1
  %cmp32 = icmp slt i32 %30, %sub31
  br i1 %cmp32, label %for.body34, label %for.end

for.body34:                                       ; preds = %for.cond30
  %32 = load double, double* %c, align 8
  %sub35 = fsub double -0.000000e+00, %32
  %33 = load double, double* %a, align 8
  %34 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %35 = load i32, i32* %i, align 4
  %idxprom36 = sext i32 %35 to i64
  %arrayidx37 = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %idxprom36
  %36 = load i32, i32* %j, align 4
  %sub38 = sub nsw i32 %36, 1
  %idxprom39 = sext i32 %sub38 to i64
  %arrayidx40 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx37, i64 0, i64 %idxprom39
  %37 = load double, double* %arrayidx40, align 8
  %mul41 = fmul double %33, %37
  %38 = load double, double* %b, align 8
  %add42 = fadd double %mul41, %38
  %div43 = fdiv double %sub35, %add42
  %39 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %40 = load i32, i32* %i, align 4
  %idxprom44 = sext i32 %40 to i64
  %arrayidx45 = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %idxprom44
  %41 = load i32, i32* %j, align 4
  %idxprom46 = sext i32 %41 to i64
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx45, i64 0, i64 %idxprom46
  store double %div43, double* %arrayidx47, align 8
  %42 = load double, double* %d, align 8
  %sub48 = fsub double -0.000000e+00, %42
  %43 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %44 = load i32, i32* %j, align 4
  %idxprom49 = sext i32 %44 to i64
  %arrayidx50 = getelementptr inbounds [1000 x double], [1000 x double]* %43, i64 %idxprom49
  %45 = load i32, i32* %i, align 4
  %sub51 = sub nsw i32 %45, 1
  %idxprom52 = sext i32 %sub51 to i64
  %arrayidx53 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx50, i64 0, i64 %idxprom52
  %46 = load double, double* %arrayidx53, align 8
  %mul54 = fmul double %sub48, %46
  %47 = load double, double* %d, align 8
  %mul55 = fmul double 2.000000e+00, %47
  %add56 = fadd double 1.000000e+00, %mul55
  %48 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %49 = load i32, i32* %j, align 4
  %idxprom57 = sext i32 %49 to i64
  %arrayidx58 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %idxprom57
  %50 = load i32, i32* %i, align 4
  %idxprom59 = sext i32 %50 to i64
  %arrayidx60 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx58, i64 0, i64 %idxprom59
  %51 = load double, double* %arrayidx60, align 8
  %mul61 = fmul double %add56, %51
  %add62 = fadd double %mul54, %mul61
  %52 = load double, double* %f, align 8
  %53 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %54 = load i32, i32* %j, align 4
  %idxprom63 = sext i32 %54 to i64
  %arrayidx64 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %idxprom63
  %55 = load i32, i32* %i, align 4
  %add65 = add nsw i32 %55, 1
  %idxprom66 = sext i32 %add65 to i64
  %arrayidx67 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx64, i64 0, i64 %idxprom66
  %56 = load double, double* %arrayidx67, align 8
  %mul68 = fmul double %52, %56
  %sub69 = fsub double %add62, %mul68
  %57 = load double, double* %a, align 8
  %58 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %59 = load i32, i32* %i, align 4
  %idxprom70 = sext i32 %59 to i64
  %arrayidx71 = getelementptr inbounds [1000 x double], [1000 x double]* %58, i64 %idxprom70
  %60 = load i32, i32* %j, align 4
  %sub72 = sub nsw i32 %60, 1
  %idxprom73 = sext i32 %sub72 to i64
  %arrayidx74 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx71, i64 0, i64 %idxprom73
  %61 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %57, %61
  %sub76 = fsub double %sub69, %mul75
  %62 = load double, double* %a, align 8
  %63 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %64 = load i32, i32* %i, align 4
  %idxprom77 = sext i32 %64 to i64
  %arrayidx78 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %idxprom77
  %65 = load i32, i32* %j, align 4
  %sub79 = sub nsw i32 %65, 1
  %idxprom80 = sext i32 %sub79 to i64
  %arrayidx81 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx78, i64 0, i64 %idxprom80
  %66 = load double, double* %arrayidx81, align 8
  %mul82 = fmul double %62, %66
  %67 = load double, double* %b, align 8
  %add83 = fadd double %mul82, %67
  %div84 = fdiv double %sub76, %add83
  %68 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %69 = load i32, i32* %i, align 4
  %idxprom85 = sext i32 %69 to i64
  %arrayidx86 = getelementptr inbounds [1000 x double], [1000 x double]* %68, i64 %idxprom85
  %70 = load i32, i32* %j, align 4
  %idxprom87 = sext i32 %70 to i64
  %arrayidx88 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx86, i64 0, i64 %idxprom87
  store double %div84, double* %arrayidx88, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body34
  %71 = load i32, i32* %j, align 4
  %inc = add nsw i32 %71, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond30

for.end:                                          ; preds = %for.cond30
  %72 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %73 = load i32, i32* %n.addr, align 4
  %sub89 = sub nsw i32 %73, 1
  %idxprom90 = sext i32 %sub89 to i64
  %arrayidx91 = getelementptr inbounds [1000 x double], [1000 x double]* %72, i64 %idxprom90
  %74 = load i32, i32* %i, align 4
  %idxprom92 = sext i32 %74 to i64
  %arrayidx93 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx91, i64 0, i64 %idxprom92
  store double 1.000000e+00, double* %arrayidx93, align 8
  %75 = load i32, i32* %n.addr, align 4
  %sub94 = sub nsw i32 %75, 2
  store i32 %sub94, i32* %j, align 4
  br label %for.cond95

for.cond95:                                       ; preds = %for.inc118, %for.end
  %76 = load i32, i32* %j, align 4
  %cmp96 = icmp sge i32 %76, 1
  br i1 %cmp96, label %for.body98, label %for.end119

for.body98:                                       ; preds = %for.cond95
  %77 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %78 = load i32, i32* %i, align 4
  %idxprom99 = sext i32 %78 to i64
  %arrayidx100 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 %idxprom99
  %79 = load i32, i32* %j, align 4
  %idxprom101 = sext i32 %79 to i64
  %arrayidx102 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx100, i64 0, i64 %idxprom101
  %80 = load double, double* %arrayidx102, align 8
  %81 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %82 = load i32, i32* %j, align 4
  %add103 = add nsw i32 %82, 1
  %idxprom104 = sext i32 %add103 to i64
  %arrayidx105 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %idxprom104
  %83 = load i32, i32* %i, align 4
  %idxprom106 = sext i32 %83 to i64
  %arrayidx107 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx105, i64 0, i64 %idxprom106
  %84 = load double, double* %arrayidx107, align 8
  %mul108 = fmul double %80, %84
  %85 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %86 = load i32, i32* %i, align 4
  %idxprom109 = sext i32 %86 to i64
  %arrayidx110 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 %idxprom109
  %87 = load i32, i32* %j, align 4
  %idxprom111 = sext i32 %87 to i64
  %arrayidx112 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx110, i64 0, i64 %idxprom111
  %88 = load double, double* %arrayidx112, align 8
  %add113 = fadd double %mul108, %88
  %89 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %90 = load i32, i32* %j, align 4
  %idxprom114 = sext i32 %90 to i64
  %arrayidx115 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %idxprom114
  %91 = load i32, i32* %i, align 4
  %idxprom116 = sext i32 %91 to i64
  %arrayidx117 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx115, i64 0, i64 %idxprom116
  store double %add113, double* %arrayidx117, align 8
  br label %for.inc118

for.inc118:                                       ; preds = %for.body98
  %92 = load i32, i32* %j, align 4
  %dec = add nsw i32 %92, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond95

for.end119:                                       ; preds = %for.cond95
  br label %for.inc120

for.inc120:                                       ; preds = %for.end119
  %93 = load i32, i32* %i, align 4
  %inc121 = add nsw i32 %93, 1
  store i32 %inc121, i32* %i, align 4
  br label %for.cond15

for.end122:                                       ; preds = %for.cond15
  store i32 1, i32* %i, align 4
  br label %for.cond123

for.cond123:                                      ; preds = %for.inc234, %for.end122
  %94 = load i32, i32* %i, align 4
  %95 = load i32, i32* %n.addr, align 4
  %sub124 = sub nsw i32 %95, 1
  %cmp125 = icmp slt i32 %94, %sub124
  br i1 %cmp125, label %for.body127, label %for.end236

for.body127:                                      ; preds = %for.cond123
  %96 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %97 = load i32, i32* %i, align 4
  %idxprom128 = sext i32 %97 to i64
  %arrayidx129 = getelementptr inbounds [1000 x double], [1000 x double]* %96, i64 %idxprom128
  %arrayidx130 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx129, i64 0, i64 0
  store double 1.000000e+00, double* %arrayidx130, align 8
  %98 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %99 = load i32, i32* %i, align 4
  %idxprom131 = sext i32 %99 to i64
  %arrayidx132 = getelementptr inbounds [1000 x double], [1000 x double]* %98, i64 %idxprom131
  %arrayidx133 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx132, i64 0, i64 0
  store double 0.000000e+00, double* %arrayidx133, align 8
  %100 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %101 = load i32, i32* %i, align 4
  %idxprom134 = sext i32 %101 to i64
  %arrayidx135 = getelementptr inbounds [1000 x double], [1000 x double]* %100, i64 %idxprom134
  %arrayidx136 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx135, i64 0, i64 0
  %102 = load double, double* %arrayidx136, align 8
  %103 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %104 = load i32, i32* %i, align 4
  %idxprom137 = sext i32 %104 to i64
  %arrayidx138 = getelementptr inbounds [1000 x double], [1000 x double]* %103, i64 %idxprom137
  %arrayidx139 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx138, i64 0, i64 0
  store double %102, double* %arrayidx139, align 8
  store i32 1, i32* %j, align 4
  br label %for.cond140

for.cond140:                                      ; preds = %for.inc199, %for.body127
  %105 = load i32, i32* %j, align 4
  %106 = load i32, i32* %n.addr, align 4
  %sub141 = sub nsw i32 %106, 1
  %cmp142 = icmp slt i32 %105, %sub141
  br i1 %cmp142, label %for.body144, label %for.end201

for.body144:                                      ; preds = %for.cond140
  %107 = load double, double* %f, align 8
  %sub145 = fsub double -0.000000e+00, %107
  %108 = load double, double* %d, align 8
  %109 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %110 = load i32, i32* %i, align 4
  %idxprom146 = sext i32 %110 to i64
  %arrayidx147 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 %idxprom146
  %111 = load i32, i32* %j, align 4
  %sub148 = sub nsw i32 %111, 1
  %idxprom149 = sext i32 %sub148 to i64
  %arrayidx150 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx147, i64 0, i64 %idxprom149
  %112 = load double, double* %arrayidx150, align 8
  %mul151 = fmul double %108, %112
  %113 = load double, double* %e, align 8
  %add152 = fadd double %mul151, %113
  %div153 = fdiv double %sub145, %add152
  %114 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %115 = load i32, i32* %i, align 4
  %idxprom154 = sext i32 %115 to i64
  %arrayidx155 = getelementptr inbounds [1000 x double], [1000 x double]* %114, i64 %idxprom154
  %116 = load i32, i32* %j, align 4
  %idxprom156 = sext i32 %116 to i64
  %arrayidx157 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx155, i64 0, i64 %idxprom156
  store double %div153, double* %arrayidx157, align 8
  %117 = load double, double* %a, align 8
  %sub158 = fsub double -0.000000e+00, %117
  %118 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %119 = load i32, i32* %i, align 4
  %sub159 = sub nsw i32 %119, 1
  %idxprom160 = sext i32 %sub159 to i64
  %arrayidx161 = getelementptr inbounds [1000 x double], [1000 x double]* %118, i64 %idxprom160
  %120 = load i32, i32* %j, align 4
  %idxprom162 = sext i32 %120 to i64
  %arrayidx163 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx161, i64 0, i64 %idxprom162
  %121 = load double, double* %arrayidx163, align 8
  %mul164 = fmul double %sub158, %121
  %122 = load double, double* %a, align 8
  %mul165 = fmul double 2.000000e+00, %122
  %add166 = fadd double 1.000000e+00, %mul165
  %123 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %124 = load i32, i32* %i, align 4
  %idxprom167 = sext i32 %124 to i64
  %arrayidx168 = getelementptr inbounds [1000 x double], [1000 x double]* %123, i64 %idxprom167
  %125 = load i32, i32* %j, align 4
  %idxprom169 = sext i32 %125 to i64
  %arrayidx170 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx168, i64 0, i64 %idxprom169
  %126 = load double, double* %arrayidx170, align 8
  %mul171 = fmul double %add166, %126
  %add172 = fadd double %mul164, %mul171
  %127 = load double, double* %c, align 8
  %128 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %129 = load i32, i32* %i, align 4
  %add173 = add nsw i32 %129, 1
  %idxprom174 = sext i32 %add173 to i64
  %arrayidx175 = getelementptr inbounds [1000 x double], [1000 x double]* %128, i64 %idxprom174
  %130 = load i32, i32* %j, align 4
  %idxprom176 = sext i32 %130 to i64
  %arrayidx177 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx175, i64 0, i64 %idxprom176
  %131 = load double, double* %arrayidx177, align 8
  %mul178 = fmul double %127, %131
  %sub179 = fsub double %add172, %mul178
  %132 = load double, double* %d, align 8
  %133 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %134 = load i32, i32* %i, align 4
  %idxprom180 = sext i32 %134 to i64
  %arrayidx181 = getelementptr inbounds [1000 x double], [1000 x double]* %133, i64 %idxprom180
  %135 = load i32, i32* %j, align 4
  %sub182 = sub nsw i32 %135, 1
  %idxprom183 = sext i32 %sub182 to i64
  %arrayidx184 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx181, i64 0, i64 %idxprom183
  %136 = load double, double* %arrayidx184, align 8
  %mul185 = fmul double %132, %136
  %sub186 = fsub double %sub179, %mul185
  %137 = load double, double* %d, align 8
  %138 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %139 = load i32, i32* %i, align 4
  %idxprom187 = sext i32 %139 to i64
  %arrayidx188 = getelementptr inbounds [1000 x double], [1000 x double]* %138, i64 %idxprom187
  %140 = load i32, i32* %j, align 4
  %sub189 = sub nsw i32 %140, 1
  %idxprom190 = sext i32 %sub189 to i64
  %arrayidx191 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx188, i64 0, i64 %idxprom190
  %141 = load double, double* %arrayidx191, align 8
  %mul192 = fmul double %137, %141
  %142 = load double, double* %e, align 8
  %add193 = fadd double %mul192, %142
  %div194 = fdiv double %sub186, %add193
  %143 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %144 = load i32, i32* %i, align 4
  %idxprom195 = sext i32 %144 to i64
  %arrayidx196 = getelementptr inbounds [1000 x double], [1000 x double]* %143, i64 %idxprom195
  %145 = load i32, i32* %j, align 4
  %idxprom197 = sext i32 %145 to i64
  %arrayidx198 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx196, i64 0, i64 %idxprom197
  store double %div194, double* %arrayidx198, align 8
  br label %for.inc199

for.inc199:                                       ; preds = %for.body144
  %146 = load i32, i32* %j, align 4
  %inc200 = add nsw i32 %146, 1
  store i32 %inc200, i32* %j, align 4
  br label %for.cond140

for.end201:                                       ; preds = %for.cond140
  %147 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %148 = load i32, i32* %i, align 4
  %idxprom202 = sext i32 %148 to i64
  %arrayidx203 = getelementptr inbounds [1000 x double], [1000 x double]* %147, i64 %idxprom202
  %149 = load i32, i32* %n.addr, align 4
  %sub204 = sub nsw i32 %149, 1
  %idxprom205 = sext i32 %sub204 to i64
  %arrayidx206 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx203, i64 0, i64 %idxprom205
  store double 1.000000e+00, double* %arrayidx206, align 8
  %150 = load i32, i32* %n.addr, align 4
  %sub207 = sub nsw i32 %150, 2
  store i32 %sub207, i32* %j, align 4
  br label %for.cond208

for.cond208:                                      ; preds = %for.inc231, %for.end201
  %151 = load i32, i32* %j, align 4
  %cmp209 = icmp sge i32 %151, 1
  br i1 %cmp209, label %for.body211, label %for.end233

for.body211:                                      ; preds = %for.cond208
  %152 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %153 = load i32, i32* %i, align 4
  %idxprom212 = sext i32 %153 to i64
  %arrayidx213 = getelementptr inbounds [1000 x double], [1000 x double]* %152, i64 %idxprom212
  %154 = load i32, i32* %j, align 4
  %idxprom214 = sext i32 %154 to i64
  %arrayidx215 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx213, i64 0, i64 %idxprom214
  %155 = load double, double* %arrayidx215, align 8
  %156 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %157 = load i32, i32* %i, align 4
  %idxprom216 = sext i32 %157 to i64
  %arrayidx217 = getelementptr inbounds [1000 x double], [1000 x double]* %156, i64 %idxprom216
  %158 = load i32, i32* %j, align 4
  %add218 = add nsw i32 %158, 1
  %idxprom219 = sext i32 %add218 to i64
  %arrayidx220 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx217, i64 0, i64 %idxprom219
  %159 = load double, double* %arrayidx220, align 8
  %mul221 = fmul double %155, %159
  %160 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %161 = load i32, i32* %i, align 4
  %idxprom222 = sext i32 %161 to i64
  %arrayidx223 = getelementptr inbounds [1000 x double], [1000 x double]* %160, i64 %idxprom222
  %162 = load i32, i32* %j, align 4
  %idxprom224 = sext i32 %162 to i64
  %arrayidx225 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx223, i64 0, i64 %idxprom224
  %163 = load double, double* %arrayidx225, align 8
  %add226 = fadd double %mul221, %163
  %164 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %165 = load i32, i32* %i, align 4
  %idxprom227 = sext i32 %165 to i64
  %arrayidx228 = getelementptr inbounds [1000 x double], [1000 x double]* %164, i64 %idxprom227
  %166 = load i32, i32* %j, align 4
  %idxprom229 = sext i32 %166 to i64
  %arrayidx230 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx228, i64 0, i64 %idxprom229
  store double %add226, double* %arrayidx230, align 8
  br label %for.inc231

for.inc231:                                       ; preds = %for.body211
  %167 = load i32, i32* %j, align 4
  %dec232 = add nsw i32 %167, -1
  store i32 %dec232, i32* %j, align 4
  br label %for.cond208

for.end233:                                       ; preds = %for.cond208
  br label %for.inc234

for.inc234:                                       ; preds = %for.end233
  %168 = load i32, i32* %i, align 4
  %inc235 = add nsw i32 %168, 1
  store i32 %inc235, i32* %i, align 4
  br label %for.cond123

for.end236:                                       ; preds = %for.cond123
  br label %for.inc237

for.inc237:                                       ; preds = %for.end236
  %169 = load i32, i32* %t, align 4
  %inc238 = add nsw i32 %169, 1
  store i32 %inc238, i32* %t, align 4
  br label %for.cond

for.end239:                                       ; preds = %for.cond
  ret void
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @print_array(i32 %n, [1000 x double]* %u) #0 {
entry:
  %n.addr = alloca i32, align 4
  %u.addr = alloca [1000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [1000 x double]* %u, [1000 x double]** %u.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %n.addr, align 4
  %cmp3 = icmp slt i32 %4, %5
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %n.addr, align 4
  %mul = mul nsw i32 %6, %7
  %8 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %8
  %rem = srem i32 %add, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %9 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call6 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %9, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %10 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %11 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %11, i64 %idxprom
  %13 = load i32, i32* %j, align 4
  %idxprom7 = sext i32 %13 to i64
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom7
  %14 = load double, double* %arrayidx8, align 8
  %call9 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %14)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32, i32* %j, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4
  %inc11 = add nsw i32 %16, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  %17 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %18 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call14 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %18, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

declare void @free(i8*) #1

declare i32 @fprintf(%struct.__sFILE*, i8*, ...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 6.0.0 (tags/RELEASE_600/final)"}
