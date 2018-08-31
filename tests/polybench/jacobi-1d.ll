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

; Function Attrs: nounwind ssp uwtable
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
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 2000, i32* %n, align 4, !tbaa !3
  %1 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 500, i32* %tsteps, align 4, !tbaa !3
  %2 = bitcast [2000 x double]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %call = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %3 = bitcast i8* %call to [2000 x double]*
  store [2000 x double]* %3, [2000 x double]** %A, align 8, !tbaa !7
  %4 = bitcast [2000 x double]** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %5 = bitcast i8* %call1 to [2000 x double]*
  store [2000 x double]* %5, [2000 x double]** %B, align 8, !tbaa !7
  %6 = load i32, i32* %n, align 4, !tbaa !3
  %7 = load [2000 x double]*, [2000 x double]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [2000 x double], [2000 x double]* %7, i32 0, i32 0
  %8 = load [2000 x double]*, [2000 x double]** %B, align 8, !tbaa !7
  %arraydecay2 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i32 0, i32 0
  call void @init_array(i32 %6, double* %arraydecay, double* %arraydecay2)
  %9 = load i32, i32* %tsteps, align 4, !tbaa !3
  %10 = load i32, i32* %n, align 4, !tbaa !3
  %11 = load [2000 x double]*, [2000 x double]** %A, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i32 0, i32 0
  %12 = load [2000 x double]*, [2000 x double]** %B, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i32 0, i32 0
  call void @kernel_jacobi_1d(i32 %9, i32 %10, double* %arraydecay3, double* %arraydecay4)
  %13 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %13, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %14 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %14, i64 0
  %15 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call5 = call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call5, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %16 = load i32, i32* %n, align 4, !tbaa !3
  %17 = load [2000 x double]*, [2000 x double]** %A, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i32 0, i32 0
  call void @print_array(i32 %16, double* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %18 = load [2000 x double]*, [2000 x double]** %A, align 8, !tbaa !7
  %19 = bitcast [2000 x double]* %18 to i8*
  call void @free(i8* %19)
  %20 = load [2000 x double]*, [2000 x double]** %B, align 8, !tbaa !7
  %21 = bitcast [2000 x double]* %20 to i8*
  call void @free(i8* %21)
  %22 = bitcast [2000 x double]** %B to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %22) #3
  %23 = bitcast [2000 x double]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %23) #3
  %24 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #3
  %25 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %n, double* %A, double* %B) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %A, double** %A.addr, align 8, !tbaa !7
  store double* %B, double** %B.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !tbaa !3
  %2 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %conv = sitofp i32 %3 to double
  %add = fadd double %conv, 2.000000e+00
  %4 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv1 = sitofp i32 %4 to double
  %div = fdiv double %add, %conv1
  %5 = load double*, double** %A.addr, align 8, !tbaa !7
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds double, double* %5, i64 %idxprom
  store double %div, double* %arrayidx, align 8, !tbaa !9
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %conv2 = sitofp i32 %7 to double
  %add3 = fadd double %conv2, 3.000000e+00
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv4 = sitofp i32 %8 to double
  %div5 = fdiv double %add3, %conv4
  %9 = load double*, double** %B.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom6 = sext i32 %10 to i64
  %arrayidx7 = getelementptr inbounds double, double* %9, i64 %idxprom6
  store double %div5, double* %arrayidx7, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) #0 {
entry:
  %tsteps.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %B.addr = alloca double*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %tsteps, i32* %tsteps.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %A, double** %A.addr, align 8, !tbaa !7
  store double* %B, double** %B.addr, align 8, !tbaa !7
  %0 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc33, %entry
  %2 = load i32, i32* %t, align 4, !tbaa !3
  %3 = load i32, i32* %tsteps.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end35

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %5 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub = sub nsw i32 %5, 1
  %cmp2 = icmp slt i32 %4, %sub
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load double*, double** %A.addr, align 8, !tbaa !7
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %sub4 = sub nsw i32 %7, 1
  %idxprom = sext i32 %sub4 to i64
  %arrayidx = getelementptr inbounds double, double* %6, i64 %idxprom
  %8 = load double, double* %arrayidx, align 8, !tbaa !9
  %9 = load double*, double** %A.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom5 = sext i32 %10 to i64
  %arrayidx6 = getelementptr inbounds double, double* %9, i64 %idxprom5
  %11 = load double, double* %arrayidx6, align 8, !tbaa !9
  %add = fadd double %8, %11
  %12 = load double*, double** %A.addr, align 8, !tbaa !7
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %add7 = add nsw i32 %13, 1
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds double, double* %12, i64 %idxprom8
  %14 = load double, double* %arrayidx9, align 8, !tbaa !9
  %add10 = fadd double %add, %14
  %mul = fmul double 3.333300e-01, %add10
  %15 = load double*, double** %B.addr, align 8, !tbaa !7
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom11 = sext i32 %16 to i64
  %arrayidx12 = getelementptr inbounds double, double* %15, i64 %idxprom11
  store double %mul, double* %arrayidx12, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc30, %for.end
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %19 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub14 = sub nsw i32 %19, 1
  %cmp15 = icmp slt i32 %18, %sub14
  br i1 %cmp15, label %for.body16, label %for.end32

for.body16:                                       ; preds = %for.cond13
  %20 = load double*, double** %B.addr, align 8, !tbaa !7
  %21 = load i32, i32* %i, align 4, !tbaa !3
  %sub17 = sub nsw i32 %21, 1
  %idxprom18 = sext i32 %sub17 to i64
  %arrayidx19 = getelementptr inbounds double, double* %20, i64 %idxprom18
  %22 = load double, double* %arrayidx19, align 8, !tbaa !9
  %23 = load double*, double** %B.addr, align 8, !tbaa !7
  %24 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom20 = sext i32 %24 to i64
  %arrayidx21 = getelementptr inbounds double, double* %23, i64 %idxprom20
  %25 = load double, double* %arrayidx21, align 8, !tbaa !9
  %add22 = fadd double %22, %25
  %26 = load double*, double** %B.addr, align 8, !tbaa !7
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %add23 = add nsw i32 %27, 1
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds double, double* %26, i64 %idxprom24
  %28 = load double, double* %arrayidx25, align 8, !tbaa !9
  %add26 = fadd double %add22, %28
  %mul27 = fmul double 3.333300e-01, %add26
  %29 = load double*, double** %A.addr, align 8, !tbaa !7
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom28 = sext i32 %30 to i64
  %arrayidx29 = getelementptr inbounds double, double* %29, i64 %idxprom28
  store double %mul27, double* %arrayidx29, align 8, !tbaa !9
  br label %for.inc30

for.inc30:                                        ; preds = %for.body16
  %31 = load i32, i32* %i, align 4, !tbaa !3
  %inc31 = add nsw i32 %31, 1
  store i32 %inc31, i32* %i, align 4, !tbaa !3
  br label %for.cond13

for.end32:                                        ; preds = %for.cond13
  br label %for.inc33

for.inc33:                                        ; preds = %for.end32
  %32 = load i32, i32* %t, align 4, !tbaa !3
  %inc34 = add nsw i32 %32, 1
  store i32 %inc34, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.end35:                                        ; preds = %for.cond
  %33 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #3
  %34 = bitcast i32* %t to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, double* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %A, double** %A.addr, align 8, !tbaa !7
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
  %8 = load double*, double** %A.addr, align 8, !tbaa !7
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
