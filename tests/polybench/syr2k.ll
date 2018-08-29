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

; Function Attrs: noinline nounwind optnone ssp uwtable
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
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 1200, i32* %n, align 4
  store i32 1000, i32* %m, align 4
  %call = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %0 = bitcast i8* %call to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %0, [1200 x [1200 x double]]** %C, align 8
  %call1 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %1 = bitcast i8* %call1 to [1200 x [1000 x double]]*
  store [1200 x [1000 x double]]* %1, [1200 x [1000 x double]]** %A, align 8
  %call2 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %2 = bitcast i8* %call2 to [1200 x [1000 x double]]*
  store [1200 x [1000 x double]]* %2, [1200 x [1000 x double]]** %B, align 8
  %3 = load i32, i32* %n, align 4
  %4 = load i32, i32* %m, align 4
  %5 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %C, align 8
  %arraydecay = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %5, i32 0, i32 0
  %6 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %A, align 8
  %arraydecay3 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %6, i32 0, i32 0
  %7 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %B, align 8
  %arraydecay4 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %7, i32 0, i32 0
  call void @init_array(i32 %3, i32 %4, double* %alpha, double* %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  %8 = load i32, i32* %n, align 4
  %9 = load i32, i32* %m, align 4
  %10 = load double, double* %alpha, align 8
  %11 = load double, double* %beta, align 8
  %12 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %C, align 8
  %arraydecay5 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %12, i32 0, i32 0
  %13 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %A, align 8
  %arraydecay6 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %13, i32 0, i32 0
  %14 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %B, align 8
  %arraydecay7 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %14, i32 0, i32 0
  call void @kernel_syr2k(i32 %8, i32 %9, double %10, double %11, [1200 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
  %15 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %15, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %16 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %16, i64 0
  %17 = load i8*, i8** %arrayidx, align 8
  %call8 = call i32 @strcmp(i8* %17, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %18 = load i32, i32* %n, align 4
  %19 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %C, align 8
  %arraydecay9 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %19, i32 0, i32 0
  call void @print_array(i32 %18, [1200 x double]* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %20 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %C, align 8
  %21 = bitcast [1200 x [1200 x double]]* %20 to i8*
  call void @free(i8* %21)
  %22 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %A, align 8
  %23 = bitcast [1200 x [1000 x double]]* %22 to i8*
  call void @free(i8* %23)
  %24 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %B, align 8
  %25 = bitcast [1200 x [1000 x double]]* %24 to i8*
  call void @free(i8* %25)
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
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
  store i32 %n, i32* %n.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store double* %alpha, double** %alpha.addr, align 8
  store double* %beta, double** %beta.addr, align 8
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8
  store [1000 x double]* %B, [1000 x double]** %B.addr, align 8
  %0 = load double*, double** %alpha.addr, align 8
  store double 1.500000e+00, double* %0, align 8
  %1 = load double*, double** %beta.addr, align 8
  store double 1.200000e+00, double* %1, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc17, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end19

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %m.addr, align 4
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %j, align 4
  %mul = mul nsw i32 %6, %7
  %add = add nsw i32 %mul, 1
  %8 = load i32, i32* %n.addr, align 4
  %rem = srem i32 %add, %8
  %conv = sitofp i32 %rem to double
  %9 = load i32, i32* %n.addr, align 4
  %conv4 = sitofp i32 %9 to double
  %div = fdiv double %conv, %conv4
  %10 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %idxprom
  %12 = load i32, i32* %j, align 4
  %idxprom5 = sext i32 %12 to i64
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom5
  store double %div, double* %arrayidx6, align 8
  %13 = load i32, i32* %i, align 4
  %14 = load i32, i32* %j, align 4
  %mul7 = mul nsw i32 %13, %14
  %add8 = add nsw i32 %mul7, 2
  %15 = load i32, i32* %m.addr, align 4
  %rem9 = srem i32 %add8, %15
  %conv10 = sitofp i32 %rem9 to double
  %16 = load i32, i32* %m.addr, align 4
  %conv11 = sitofp i32 %16 to double
  %div12 = fdiv double %conv10, %conv11
  %17 = load [1000 x double]*, [1000 x double]** %B.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %18 to i64
  %arrayidx14 = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 %idxprom13
  %19 = load i32, i32* %j, align 4
  %idxprom15 = sext i32 %19 to i64
  %arrayidx16 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx14, i64 0, i64 %idxprom15
  store double %div12, double* %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %20 = load i32, i32* %j, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %21 = load i32, i32* %i, align 4
  %inc18 = add nsw i32 %21, 1
  store i32 %inc18, i32* %i, align 4
  br label %for.cond

for.end19:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc41, %for.end19
  %22 = load i32, i32* %i, align 4
  %23 = load i32, i32* %n.addr, align 4
  %cmp21 = icmp slt i32 %22, %23
  br i1 %cmp21, label %for.body23, label %for.end43

for.body23:                                       ; preds = %for.cond20
  store i32 0, i32* %j, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc38, %for.body23
  %24 = load i32, i32* %j, align 4
  %25 = load i32, i32* %n.addr, align 4
  %cmp25 = icmp slt i32 %24, %25
  br i1 %cmp25, label %for.body27, label %for.end40

for.body27:                                       ; preds = %for.cond24
  %26 = load i32, i32* %i, align 4
  %27 = load i32, i32* %j, align 4
  %mul28 = mul nsw i32 %26, %27
  %add29 = add nsw i32 %mul28, 3
  %28 = load i32, i32* %n.addr, align 4
  %rem30 = srem i32 %add29, %28
  %conv31 = sitofp i32 %rem30 to double
  %29 = load i32, i32* %m.addr, align 4
  %conv32 = sitofp i32 %29 to double
  %div33 = fdiv double %conv31, %conv32
  %30 = load [1200 x double]*, [1200 x double]** %C.addr, align 8
  %31 = load i32, i32* %i, align 4
  %idxprom34 = sext i32 %31 to i64
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %30, i64 %idxprom34
  %32 = load i32, i32* %j, align 4
  %idxprom36 = sext i32 %32 to i64
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx35, i64 0, i64 %idxprom36
  store double %div33, double* %arrayidx37, align 8
  br label %for.inc38

for.inc38:                                        ; preds = %for.body27
  %33 = load i32, i32* %j, align 4
  %inc39 = add nsw i32 %33, 1
  store i32 %inc39, i32* %j, align 4
  br label %for.cond24

for.end40:                                        ; preds = %for.cond24
  br label %for.inc41

for.inc41:                                        ; preds = %for.end40
  %34 = load i32, i32* %i, align 4
  %inc42 = add nsw i32 %34, 1
  store i32 %inc42, i32* %i, align 4
  br label %for.cond20

for.end43:                                        ; preds = %for.cond20
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
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
  store i32 %n, i32* %n.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store double %alpha, double* %alpha.addr, align 8
  store double %beta, double* %beta.addr, align 8
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8
  store [1000 x double]* %B, [1000 x double]** %B.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc43, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end45

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %i, align 4
  %cmp2 = icmp sle i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load double, double* %beta.addr, align 8
  %5 = load [1200 x double]*, [1200 x double]** %C.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %idxprom
  %7 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx, i64 0, i64 %idxprom4
  %8 = load double, double* %arrayidx5, align 8
  %mul = fmul double %8, %4
  store double %mul, double* %arrayidx5, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %9 = load i32, i32* %j, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc40, %for.end
  %10 = load i32, i32* %k, align 4
  %11 = load i32, i32* %m.addr, align 4
  %cmp7 = icmp slt i32 %10, %11
  br i1 %cmp7, label %for.body8, label %for.end42

for.body8:                                        ; preds = %for.cond6
  store i32 0, i32* %j, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc37, %for.body8
  %12 = load i32, i32* %j, align 4
  %13 = load i32, i32* %i, align 4
  %cmp10 = icmp sle i32 %12, %13
  br i1 %cmp10, label %for.body11, label %for.end39

for.body11:                                       ; preds = %for.cond9
  %14 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  %15 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %15 to i64
  %arrayidx13 = getelementptr inbounds [1000 x double], [1000 x double]* %14, i64 %idxprom12
  %16 = load i32, i32* %k, align 4
  %idxprom14 = sext i32 %16 to i64
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx13, i64 0, i64 %idxprom14
  %17 = load double, double* %arrayidx15, align 8
  %18 = load double, double* %alpha.addr, align 8
  %mul16 = fmul double %17, %18
  %19 = load [1000 x double]*, [1000 x double]** %B.addr, align 8
  %20 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %20 to i64
  %arrayidx18 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %idxprom17
  %21 = load i32, i32* %k, align 4
  %idxprom19 = sext i32 %21 to i64
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx18, i64 0, i64 %idxprom19
  %22 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %22
  %23 = load [1000 x double]*, [1000 x double]** %B.addr, align 8
  %24 = load i32, i32* %j, align 4
  %idxprom22 = sext i32 %24 to i64
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %23, i64 %idxprom22
  %25 = load i32, i32* %k, align 4
  %idxprom24 = sext i32 %25 to i64
  %arrayidx25 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx23, i64 0, i64 %idxprom24
  %26 = load double, double* %arrayidx25, align 8
  %27 = load double, double* %alpha.addr, align 8
  %mul26 = fmul double %26, %27
  %28 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %29 to i64
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %28, i64 %idxprom27
  %30 = load i32, i32* %k, align 4
  %idxprom29 = sext i32 %30 to i64
  %arrayidx30 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx28, i64 0, i64 %idxprom29
  %31 = load double, double* %arrayidx30, align 8
  %mul31 = fmul double %mul26, %31
  %add = fadd double %mul21, %mul31
  %32 = load [1200 x double]*, [1200 x double]** %C.addr, align 8
  %33 = load i32, i32* %i, align 4
  %idxprom32 = sext i32 %33 to i64
  %arrayidx33 = getelementptr inbounds [1200 x double], [1200 x double]* %32, i64 %idxprom32
  %34 = load i32, i32* %j, align 4
  %idxprom34 = sext i32 %34 to i64
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx33, i64 0, i64 %idxprom34
  %35 = load double, double* %arrayidx35, align 8
  %add36 = fadd double %35, %add
  store double %add36, double* %arrayidx35, align 8
  br label %for.inc37

for.inc37:                                        ; preds = %for.body11
  %36 = load i32, i32* %j, align 4
  %inc38 = add nsw i32 %36, 1
  store i32 %inc38, i32* %j, align 4
  br label %for.cond9

for.end39:                                        ; preds = %for.cond9
  br label %for.inc40

for.inc40:                                        ; preds = %for.end39
  %37 = load i32, i32* %k, align 4
  %inc41 = add nsw i32 %37, 1
  store i32 %inc41, i32* %k, align 4
  br label %for.cond6

for.end42:                                        ; preds = %for.cond6
  br label %for.inc43

for.inc43:                                        ; preds = %for.end42
  %38 = load i32, i32* %i, align 4
  %inc44 = add nsw i32 %38, 1
  store i32 %inc44, i32* %i, align 4
  br label %for.cond

for.end45:                                        ; preds = %for.cond
  ret void
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @print_array(i32 %n, [1200 x double]* %C) #0 {
entry:
  %n.addr = alloca i32, align 4
  %C.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8
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
  %11 = load [1200 x double]*, [1200 x double]** %C.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %idxprom
  %13 = load i32, i32* %j, align 4
  %idxprom7 = sext i32 %13 to i64
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx, i64 0, i64 %idxprom7
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
