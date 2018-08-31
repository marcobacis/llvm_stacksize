; ModuleID = '../stencils/seidel-2d/seidel-2d.c'
source_filename = "../stencils/seidel-2d/seidel-2d.c"
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
  %A = alloca [2000 x [2000 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 2000, i32* %n, align 4, !tbaa !3
  %1 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 500, i32* %tsteps, align 4, !tbaa !3
  %2 = bitcast [2000 x [2000 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %3 = bitcast i8* %call to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %3, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %4 = load i32, i32* %n, align 4, !tbaa !3
  %5 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %5, i32 0, i32 0
  call void @init_array(i32 %4, [2000 x double]* %arraydecay)
  %6 = load i32, i32* %tsteps, align 4, !tbaa !3
  %7 = load i32, i32* %n, align 4, !tbaa !3
  %8 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %arraydecay1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i32 0, i32 0
  call void @kernel_seidel_2d(i32 %6, i32 %7, [2000 x double]* %arraydecay1)
  %9 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %9, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %10 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %10, i64 0
  %11 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call2 = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %12 = load i32, i32* %n, align 4, !tbaa !3
  %13 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i32 0, i32 0
  call void @print_array(i32 %12, [2000 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %14 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %15 = bitcast [2000 x [2000 x double]]* %14 to i8*
  call void @free(i8* %15)
  %16 = bitcast [2000 x [2000 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #3
  %17 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #3
  %18 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end11

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
  %conv = sitofp i32 %6 to double
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %add = add nsw i32 %7, 2
  %conv4 = sitofp i32 %add to double
  %mul = fmul double %conv, %conv4
  %add5 = fadd double %mul, 2.000000e+00
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv6 = sitofp i32 %8 to double
  %div = fdiv double %add5, %conv6
  %9 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %idxprom
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx, i64 0, i64 %idxprom7
  store double %div, double* %arrayidx8, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %inc10 = add nsw i32 %13, 1
  store i32 %inc10, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end11:                                        ; preds = %for.cond
  %14 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #3
  %15 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_seidel_2d(i32 %tsteps, i32 %n, [2000 x double]* %A) #0 {
entry:
  %tsteps.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tsteps, i32* %tsteps.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8, !tbaa !7
  %0 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc69, %entry
  %3 = load i32, i32* %t, align 4, !tbaa !3
  %4 = load i32, i32* %tsteps.addr, align 4, !tbaa !3
  %sub = sub nsw i32 %4, 1
  %cmp = icmp sle i32 %3, %sub
  br i1 %cmp, label %for.body, label %for.end71

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc66, %for.body
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %6 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub2 = sub nsw i32 %6, 2
  %cmp3 = icmp sle i32 %5, %sub2
  br i1 %cmp3, label %for.body4, label %for.end68

for.body4:                                        ; preds = %for.cond1
  store i32 1, i32* %j, align 4, !tbaa !3
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub6 = sub nsw i32 %8, 2
  %cmp7 = icmp sle i32 %7, %sub6
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %9 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %sub9 = sub nsw i32 %10, 1
  %idxprom = sext i32 %sub9 to i64
  %arrayidx = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %idxprom
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %sub10 = sub nsw i32 %11, 1
  %idxprom11 = sext i32 %sub10 to i64
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx, i64 0, i64 %idxprom11
  %12 = load double, double* %arrayidx12, align 8, !tbaa !9
  %13 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %sub13 = sub nsw i32 %14, 1
  %idxprom14 = sext i32 %sub13 to i64
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %idxprom14
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom16 = sext i32 %15 to i64
  %arrayidx17 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx15, i64 0, i64 %idxprom16
  %16 = load double, double* %arrayidx17, align 8, !tbaa !9
  %add = fadd double %12, %16
  %17 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %sub18 = sub nsw i32 %18, 1
  %idxprom19 = sext i32 %sub18 to i64
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %idxprom19
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %add21 = add nsw i32 %19, 1
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx20, i64 0, i64 %idxprom22
  %20 = load double, double* %arrayidx23, align 8, !tbaa !9
  %add24 = fadd double %add, %20
  %21 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom25 = sext i32 %22 to i64
  %arrayidx26 = getelementptr inbounds [2000 x double], [2000 x double]* %21, i64 %idxprom25
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %sub27 = sub nsw i32 %23, 1
  %idxprom28 = sext i32 %sub27 to i64
  %arrayidx29 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx26, i64 0, i64 %idxprom28
  %24 = load double, double* %arrayidx29, align 8, !tbaa !9
  %add30 = fadd double %add24, %24
  %25 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom31 = sext i32 %26 to i64
  %arrayidx32 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i64 %idxprom31
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom33 = sext i32 %27 to i64
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx32, i64 0, i64 %idxprom33
  %28 = load double, double* %arrayidx34, align 8, !tbaa !9
  %add35 = fadd double %add30, %28
  %29 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom36 = sext i32 %30 to i64
  %arrayidx37 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i64 %idxprom36
  %31 = load i32, i32* %j, align 4, !tbaa !3
  %add38 = add nsw i32 %31, 1
  %idxprom39 = sext i32 %add38 to i64
  %arrayidx40 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx37, i64 0, i64 %idxprom39
  %32 = load double, double* %arrayidx40, align 8, !tbaa !9
  %add41 = fadd double %add35, %32
  %33 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %add42 = add nsw i32 %34, 1
  %idxprom43 = sext i32 %add42 to i64
  %arrayidx44 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 %idxprom43
  %35 = load i32, i32* %j, align 4, !tbaa !3
  %sub45 = sub nsw i32 %35, 1
  %idxprom46 = sext i32 %sub45 to i64
  %arrayidx47 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx44, i64 0, i64 %idxprom46
  %36 = load double, double* %arrayidx47, align 8, !tbaa !9
  %add48 = fadd double %add41, %36
  %37 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %38 = load i32, i32* %i, align 4, !tbaa !3
  %add49 = add nsw i32 %38, 1
  %idxprom50 = sext i32 %add49 to i64
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %37, i64 %idxprom50
  %39 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom52 = sext i32 %39 to i64
  %arrayidx53 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx51, i64 0, i64 %idxprom52
  %40 = load double, double* %arrayidx53, align 8, !tbaa !9
  %add54 = fadd double %add48, %40
  %41 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %42 = load i32, i32* %i, align 4, !tbaa !3
  %add55 = add nsw i32 %42, 1
  %idxprom56 = sext i32 %add55 to i64
  %arrayidx57 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %idxprom56
  %43 = load i32, i32* %j, align 4, !tbaa !3
  %add58 = add nsw i32 %43, 1
  %idxprom59 = sext i32 %add58 to i64
  %arrayidx60 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx57, i64 0, i64 %idxprom59
  %44 = load double, double* %arrayidx60, align 8, !tbaa !9
  %add61 = fadd double %add54, %44
  %div = fdiv double %add61, 9.000000e+00
  %45 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %46 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom62 = sext i32 %46 to i64
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %45, i64 %idxprom62
  %47 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom64 = sext i32 %47 to i64
  %arrayidx65 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx63, i64 0, i64 %idxprom64
  store double %div, double* %arrayidx65, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %48 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %48, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc66

for.inc66:                                        ; preds = %for.end
  %49 = load i32, i32* %i, align 4, !tbaa !3
  %inc67 = add nsw i32 %49, 1
  store i32 %inc67, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end68:                                        ; preds = %for.cond1
  br label %for.inc69

for.inc69:                                        ; preds = %for.end68
  %50 = load i32, i32* %t, align 4, !tbaa !3
  %inc70 = add nsw i32 %50, 1
  store i32 %inc70, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.end71:                                        ; preds = %for.cond
  %51 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %51) #3
  %52 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %52) #3
  %53 = bitcast i32* %t to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %53) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8, !tbaa !7
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
  %13 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %idxprom
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx, i64 0, i64 %idxprom7
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
