; ModuleID = '../stencils/jacobi-1d/jacobi-1d.c'
source_filename = "../stencils/jacobi-1d/jacobi-1d.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
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
  %A = alloca [2000 x double]*, align 8
  %B = alloca [2000 x double]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2000, i32* %n, align 4
  store i32 500, i32* %tsteps, align 4
  %call = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %0 = bitcast i8* %call to [2000 x double]*
  store [2000 x double]* %0, [2000 x double]** %A, align 8
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %1 = bitcast i8* %call1 to [2000 x double]*
  store [2000 x double]* %1, [2000 x double]** %B, align 8
  %2 = load i32, i32* %n, align 4
  %3 = load [2000 x double]*, [2000 x double]** %A, align 8
  %arraydecay = getelementptr inbounds [2000 x double], [2000 x double]* %3, i32 0, i32 0
  %4 = load [2000 x double]*, [2000 x double]** %B, align 8
  %arraydecay2 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i32 0, i32 0
  call void @init_array(i32 %2, double* %arraydecay, double* %arraydecay2)
  %5 = load i32, i32* %tsteps, align 4
  %6 = load i32, i32* %n, align 4
  %7 = load [2000 x double]*, [2000 x double]** %A, align 8
  %arraydecay3 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i32 0, i32 0
  %8 = load [2000 x double]*, [2000 x double]** %B, align 8
  %arraydecay4 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i32 0, i32 0
  call void @kernel_jacobi_1d(i32 %5, i32 %6, double* %arraydecay3, double* %arraydecay4)
  %9 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %9, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %10 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %10, i64 0
  %11 = load i8*, i8** %arrayidx, align 8
  %call5 = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call5, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %12 = load i32, i32* %n, align 4
  %13 = load [2000 x double]*, [2000 x double]** %A, align 8
  %arraydecay6 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i32 0, i32 0
  call void @print_array(i32 %12, double* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %14 = load [2000 x double]*, [2000 x double]** %A, align 8
  %15 = bitcast [2000 x double]* %14 to i8*
  call void @free(i8* %15)
  %16 = load [2000 x double]*, [2000 x double]** %B, align 8
  %17 = bitcast [2000 x double]* %16 to i8*
  call void @free(i8* %17)
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @init_array(i32 %n, double* %A, double* %B) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %A, double** %A.addr, align 8
  store double* %B, double** %B.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %conv = sitofp i32 %2 to double
  %add = fadd double %conv, 2.000000e+00
  %3 = load i32, i32* %n.addr, align 4
  %conv1 = sitofp i32 %3 to double
  %div = fdiv double %add, %conv1
  %4 = load double*, double** %A.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom
  store double %div, double* %arrayidx, align 8
  %6 = load i32, i32* %i, align 4
  %conv2 = sitofp i32 %6 to double
  %add3 = fadd double %conv2, 3.000000e+00
  %7 = load i32, i32* %n.addr, align 4
  %conv4 = sitofp i32 %7 to double
  %div5 = fdiv double %add3, %conv4
  %8 = load double*, double** %B.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds double, double* %8, i64 %idxprom6
  store double %div5, double* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) #0 {
entry:
  %tsteps.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %tsteps, i32* %tsteps.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %A, double** %A.addr, align 8
  store double* %B, double** %B.addr, align 8
  store i32 0, i32* %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc33, %entry
  %0 = load i32, i32* %t, align 4
  %1 = load i32, i32* %tsteps.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end35

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 %3, 1
  %cmp2 = icmp slt i32 %2, %sub
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load double*, double** %A.addr, align 8
  %5 = load i32, i32* %i, align 4
  %sub4 = sub nsw i32 %5, 1
  %idxprom = sext i32 %sub4 to i64
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom
  %6 = load double, double* %arrayidx, align 8
  %7 = load double*, double** %A.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %8 to i64
  %arrayidx6 = getelementptr inbounds double, double* %7, i64 %idxprom5
  %9 = load double, double* %arrayidx6, align 8
  %add = fadd double %6, %9
  %10 = load double*, double** %A.addr, align 8
  %11 = load i32, i32* %i, align 4
  %add7 = add nsw i32 %11, 1
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds double, double* %10, i64 %idxprom8
  %12 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %12
  %mul = fmul double 3.333300e-01, %add10
  %13 = load double*, double** %B.addr, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %14 to i64
  %arrayidx12 = getelementptr inbounds double, double* %13, i64 %idxprom11
  store double %mul, double* %arrayidx12, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  store i32 1, i32* %i, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc30, %for.end
  %16 = load i32, i32* %i, align 4
  %17 = load i32, i32* %n.addr, align 4
  %sub14 = sub nsw i32 %17, 1
  %cmp15 = icmp slt i32 %16, %sub14
  br i1 %cmp15, label %for.body16, label %for.end32

for.body16:                                       ; preds = %for.cond13
  %18 = load double*, double** %B.addr, align 8
  %19 = load i32, i32* %i, align 4
  %sub17 = sub nsw i32 %19, 1
  %idxprom18 = sext i32 %sub17 to i64
  %arrayidx19 = getelementptr inbounds double, double* %18, i64 %idxprom18
  %20 = load double, double* %arrayidx19, align 8
  %21 = load double*, double** %B.addr, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom20 = sext i32 %22 to i64
  %arrayidx21 = getelementptr inbounds double, double* %21, i64 %idxprom20
  %23 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %20, %23
  %24 = load double*, double** %B.addr, align 8
  %25 = load i32, i32* %i, align 4
  %add23 = add nsw i32 %25, 1
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds double, double* %24, i64 %idxprom24
  %26 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %26
  %mul27 = fmul double 3.333300e-01, %add26
  %27 = load double*, double** %A.addr, align 8
  %28 = load i32, i32* %i, align 4
  %idxprom28 = sext i32 %28 to i64
  %arrayidx29 = getelementptr inbounds double, double* %27, i64 %idxprom28
  store double %mul27, double* %arrayidx29, align 8
  br label %for.inc30

for.inc30:                                        ; preds = %for.body16
  %29 = load i32, i32* %i, align 4
  %inc31 = add nsw i32 %29, 1
  store i32 %inc31, i32* %i, align 4
  br label %for.cond13

for.end32:                                        ; preds = %for.cond13
  br label %for.inc33

for.inc33:                                        ; preds = %for.end32
  %30 = load i32, i32* %t, align 4
  %inc34 = add nsw i32 %30, 1
  store i32 %inc34, i32* %t, align 4
  br label %for.cond

for.end35:                                        ; preds = %for.cond
  ret void
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @print_array(i32 %n, double* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %A, double** %A.addr, align 8
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call3 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %6 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %7 = load double*, double** %A.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom
  %9 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %9)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call5 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %12 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %call6 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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
