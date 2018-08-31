; ModuleID = '../linear-algebra/kernels/3mm/3mm.c'
source_filename = "../linear-algebra/kernels/3mm/3mm.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
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
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %nl = alloca i32, align 4
  %nm = alloca i32, align 4
  %E = alloca [800 x [900 x double]]*, align 8
  %A = alloca [800 x [1000 x double]]*, align 8
  %B = alloca [1000 x [900 x double]]*, align 8
  %F = alloca [900 x [1100 x double]]*, align 8
  %C = alloca [900 x [1200 x double]]*, align 8
  %D = alloca [1200 x [1100 x double]]*, align 8
  %G = alloca [800 x [1100 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %ni to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 800, i32* %ni, align 4, !tbaa !3
  %1 = bitcast i32* %nj to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 900, i32* %nj, align 4, !tbaa !3
  %2 = bitcast i32* %nk to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 1000, i32* %nk, align 4, !tbaa !3
  %3 = bitcast i32* %nl to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3
  store i32 1100, i32* %nl, align 4, !tbaa !3
  %4 = bitcast i32* %nm to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3
  store i32 1200, i32* %nm, align 4, !tbaa !3
  %5 = bitcast [800 x [900 x double]]** %E to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %call = call i8* @polybench_alloc_data(i64 720000, i32 8)
  %6 = bitcast i8* %call to [800 x [900 x double]]*
  store [800 x [900 x double]]* %6, [800 x [900 x double]]** %E, align 8, !tbaa !7
  %7 = bitcast [800 x [1000 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #3
  %call1 = call i8* @polybench_alloc_data(i64 800000, i32 8)
  %8 = bitcast i8* %call1 to [800 x [1000 x double]]*
  store [800 x [1000 x double]]* %8, [800 x [1000 x double]]** %A, align 8, !tbaa !7
  %9 = bitcast [1000 x [900 x double]]** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #3
  %call2 = call i8* @polybench_alloc_data(i64 900000, i32 8)
  %10 = bitcast i8* %call2 to [1000 x [900 x double]]*
  store [1000 x [900 x double]]* %10, [1000 x [900 x double]]** %B, align 8, !tbaa !7
  %11 = bitcast [900 x [1100 x double]]** %F to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %11) #3
  %call3 = call i8* @polybench_alloc_data(i64 990000, i32 8)
  %12 = bitcast i8* %call3 to [900 x [1100 x double]]*
  store [900 x [1100 x double]]* %12, [900 x [1100 x double]]** %F, align 8, !tbaa !7
  %13 = bitcast [900 x [1200 x double]]** %C to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %13) #3
  %call4 = call i8* @polybench_alloc_data(i64 1080000, i32 8)
  %14 = bitcast i8* %call4 to [900 x [1200 x double]]*
  store [900 x [1200 x double]]* %14, [900 x [1200 x double]]** %C, align 8, !tbaa !7
  %15 = bitcast [1200 x [1100 x double]]** %D to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %15) #3
  %call5 = call i8* @polybench_alloc_data(i64 1320000, i32 8)
  %16 = bitcast i8* %call5 to [1200 x [1100 x double]]*
  store [1200 x [1100 x double]]* %16, [1200 x [1100 x double]]** %D, align 8, !tbaa !7
  %17 = bitcast [800 x [1100 x double]]** %G to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %17) #3
  %call6 = call i8* @polybench_alloc_data(i64 880000, i32 8)
  %18 = bitcast i8* %call6 to [800 x [1100 x double]]*
  store [800 x [1100 x double]]* %18, [800 x [1100 x double]]** %G, align 8, !tbaa !7
  %19 = load i32, i32* %ni, align 4, !tbaa !3
  %20 = load i32, i32* %nj, align 4, !tbaa !3
  %21 = load i32, i32* %nk, align 4, !tbaa !3
  %22 = load i32, i32* %nl, align 4, !tbaa !3
  %23 = load i32, i32* %nm, align 4, !tbaa !3
  %24 = load [800 x [1000 x double]]*, [800 x [1000 x double]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [800 x [1000 x double]], [800 x [1000 x double]]* %24, i32 0, i32 0
  %25 = load [1000 x [900 x double]]*, [1000 x [900 x double]]** %B, align 8, !tbaa !7
  %arraydecay7 = getelementptr inbounds [1000 x [900 x double]], [1000 x [900 x double]]* %25, i32 0, i32 0
  %26 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8, !tbaa !7
  %arraydecay8 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %26, i32 0, i32 0
  %27 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %D, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %27, i32 0, i32 0
  call void @init_array(i32 %19, i32 %20, i32 %21, i32 %22, i32 %23, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  %28 = load i32, i32* %ni, align 4, !tbaa !3
  %29 = load i32, i32* %nj, align 4, !tbaa !3
  %30 = load i32, i32* %nk, align 4, !tbaa !3
  %31 = load i32, i32* %nl, align 4, !tbaa !3
  %32 = load i32, i32* %nm, align 4, !tbaa !3
  %33 = load [800 x [900 x double]]*, [800 x [900 x double]]** %E, align 8, !tbaa !7
  %arraydecay10 = getelementptr inbounds [800 x [900 x double]], [800 x [900 x double]]* %33, i32 0, i32 0
  %34 = load [800 x [1000 x double]]*, [800 x [1000 x double]]** %A, align 8, !tbaa !7
  %arraydecay11 = getelementptr inbounds [800 x [1000 x double]], [800 x [1000 x double]]* %34, i32 0, i32 0
  %35 = load [1000 x [900 x double]]*, [1000 x [900 x double]]** %B, align 8, !tbaa !7
  %arraydecay12 = getelementptr inbounds [1000 x [900 x double]], [1000 x [900 x double]]* %35, i32 0, i32 0
  %36 = load [900 x [1100 x double]]*, [900 x [1100 x double]]** %F, align 8, !tbaa !7
  %arraydecay13 = getelementptr inbounds [900 x [1100 x double]], [900 x [1100 x double]]* %36, i32 0, i32 0
  %37 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8, !tbaa !7
  %arraydecay14 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %37, i32 0, i32 0
  %38 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %D, align 8, !tbaa !7
  %arraydecay15 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %38, i32 0, i32 0
  %39 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %G, align 8, !tbaa !7
  %arraydecay16 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %39, i32 0, i32 0
  call void @kernel_3mm(i32 %28, i32 %29, i32 %30, i32 %31, i32 %32, [900 x double]* %arraydecay10, [1000 x double]* %arraydecay11, [900 x double]* %arraydecay12, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay14, [1100 x double]* %arraydecay15, [1100 x double]* %arraydecay16)
  %40 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %40, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %41 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %41, i64 0
  %42 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call17 = call i32 @strcmp(i8* %42, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call17, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %43 = load i32, i32* %ni, align 4, !tbaa !3
  %44 = load i32, i32* %nl, align 4, !tbaa !3
  %45 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %G, align 8, !tbaa !7
  %arraydecay18 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %45, i32 0, i32 0
  call void @print_array(i32 %43, i32 %44, [1100 x double]* %arraydecay18)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %46 = load [800 x [900 x double]]*, [800 x [900 x double]]** %E, align 8, !tbaa !7
  %47 = bitcast [800 x [900 x double]]* %46 to i8*
  call void @free(i8* %47)
  %48 = load [800 x [1000 x double]]*, [800 x [1000 x double]]** %A, align 8, !tbaa !7
  %49 = bitcast [800 x [1000 x double]]* %48 to i8*
  call void @free(i8* %49)
  %50 = load [1000 x [900 x double]]*, [1000 x [900 x double]]** %B, align 8, !tbaa !7
  %51 = bitcast [1000 x [900 x double]]* %50 to i8*
  call void @free(i8* %51)
  %52 = load [900 x [1100 x double]]*, [900 x [1100 x double]]** %F, align 8, !tbaa !7
  %53 = bitcast [900 x [1100 x double]]* %52 to i8*
  call void @free(i8* %53)
  %54 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8, !tbaa !7
  %55 = bitcast [900 x [1200 x double]]* %54 to i8*
  call void @free(i8* %55)
  %56 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %D, align 8, !tbaa !7
  %57 = bitcast [1200 x [1100 x double]]* %56 to i8*
  call void @free(i8* %57)
  %58 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %G, align 8, !tbaa !7
  %59 = bitcast [800 x [1100 x double]]* %58 to i8*
  call void @free(i8* %59)
  %60 = bitcast [800 x [1100 x double]]** %G to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %60) #3
  %61 = bitcast [1200 x [1100 x double]]** %D to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %61) #3
  %62 = bitcast [900 x [1200 x double]]** %C to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %62) #3
  %63 = bitcast [900 x [1100 x double]]** %F to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %63) #3
  %64 = bitcast [1000 x [900 x double]]** %B to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %64) #3
  %65 = bitcast [800 x [1000 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %65) #3
  %66 = bitcast [800 x [900 x double]]** %E to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %66) #3
  %67 = bitcast i32* %nm to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %67) #3
  %68 = bitcast i32* %nl to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %68) #3
  %69 = bitcast i32* %nk to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %69) #3
  %70 = bitcast i32* %nj to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %70) #3
  %71 = bitcast i32* %ni to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %71) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1100 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [900 x double]*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %D.addr = alloca [1100 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4, !tbaa !3
  store i32 %nj, i32* %nj.addr, align 4, !tbaa !3
  store i32 %nk, i32* %nk.addr, align 4, !tbaa !3
  store i32 %nl, i32* %nl.addr, align 4, !tbaa !3
  store i32 %nm, i32* %nm.addr, align 4, !tbaa !3
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8, !tbaa !7
  store [900 x double]* %B, [900 x double]** %B.addr, align 8, !tbaa !7
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8, !tbaa !7
  store [1100 x double]* %D, [1100 x double]** %D.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4, !tbaa !3
  %5 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %mul = mul nsw i32 %6, %7
  %add = add nsw i32 %mul, 1
  %8 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %rem = srem i32 %add, %8
  %conv = sitofp i32 %rem to double
  %9 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %mul4 = mul nsw i32 5, %9
  %conv5 = sitofp i32 %mul4 to double
  %div = fdiv double %conv, %conv5
  %10 = load [1000 x double]*, [1000 x double]** %A.addr, align 8, !tbaa !7
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %10, i64 %idxprom
  %12 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom6 = sext i32 %12 to i64
  %arrayidx7 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom6
  store double %div, double* %arrayidx7, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %inc9 = add nsw i32 %14, 1
  store i32 %inc9, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc34, %for.end10
  %15 = load i32, i32* %i, align 4, !tbaa !3
  %16 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %cmp12 = icmp slt i32 %15, %16
  br i1 %cmp12, label %for.body14, label %for.end36

for.body14:                                       ; preds = %for.cond11
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc31, %for.body14
  %17 = load i32, i32* %j, align 4, !tbaa !3
  %18 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp16 = icmp slt i32 %17, %18
  br i1 %cmp16, label %for.body18, label %for.end33

for.body18:                                       ; preds = %for.cond15
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %20 = load i32, i32* %j, align 4, !tbaa !3
  %add19 = add nsw i32 %20, 1
  %mul20 = mul nsw i32 %19, %add19
  %add21 = add nsw i32 %mul20, 2
  %21 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %rem22 = srem i32 %add21, %21
  %conv23 = sitofp i32 %rem22 to double
  %22 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %mul24 = mul nsw i32 5, %22
  %conv25 = sitofp i32 %mul24 to double
  %div26 = fdiv double %conv23, %conv25
  %23 = load [900 x double]*, [900 x double]** %B.addr, align 8, !tbaa !7
  %24 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom27 = sext i32 %24 to i64
  %arrayidx28 = getelementptr inbounds [900 x double], [900 x double]* %23, i64 %idxprom27
  %25 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom29 = sext i32 %25 to i64
  %arrayidx30 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx28, i64 0, i64 %idxprom29
  store double %div26, double* %arrayidx30, align 8, !tbaa !9
  br label %for.inc31

for.inc31:                                        ; preds = %for.body18
  %26 = load i32, i32* %j, align 4, !tbaa !3
  %inc32 = add nsw i32 %26, 1
  store i32 %inc32, i32* %j, align 4, !tbaa !3
  br label %for.cond15

for.end33:                                        ; preds = %for.cond15
  br label %for.inc34

for.inc34:                                        ; preds = %for.end33
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %inc35 = add nsw i32 %27, 1
  store i32 %inc35, i32* %i, align 4, !tbaa !3
  br label %for.cond11

for.end36:                                        ; preds = %for.cond11
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc59, %for.end36
  %28 = load i32, i32* %i, align 4, !tbaa !3
  %29 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp38 = icmp slt i32 %28, %29
  br i1 %cmp38, label %for.body40, label %for.end61

for.body40:                                       ; preds = %for.cond37
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc56, %for.body40
  %30 = load i32, i32* %j, align 4, !tbaa !3
  %31 = load i32, i32* %nm.addr, align 4, !tbaa !3
  %cmp42 = icmp slt i32 %30, %31
  br i1 %cmp42, label %for.body44, label %for.end58

for.body44:                                       ; preds = %for.cond41
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %33 = load i32, i32* %j, align 4, !tbaa !3
  %add45 = add nsw i32 %33, 3
  %mul46 = mul nsw i32 %32, %add45
  %34 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %rem47 = srem i32 %mul46, %34
  %conv48 = sitofp i32 %rem47 to double
  %35 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %mul49 = mul nsw i32 5, %35
  %conv50 = sitofp i32 %mul49 to double
  %div51 = fdiv double %conv48, %conv50
  %36 = load [1200 x double]*, [1200 x double]** %C.addr, align 8, !tbaa !7
  %37 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom52 = sext i32 %37 to i64
  %arrayidx53 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 %idxprom52
  %38 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom54 = sext i32 %38 to i64
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx53, i64 0, i64 %idxprom54
  store double %div51, double* %arrayidx55, align 8, !tbaa !9
  br label %for.inc56

for.inc56:                                        ; preds = %for.body44
  %39 = load i32, i32* %j, align 4, !tbaa !3
  %inc57 = add nsw i32 %39, 1
  store i32 %inc57, i32* %j, align 4, !tbaa !3
  br label %for.cond41

for.end58:                                        ; preds = %for.cond41
  br label %for.inc59

for.inc59:                                        ; preds = %for.end58
  %40 = load i32, i32* %i, align 4, !tbaa !3
  %inc60 = add nsw i32 %40, 1
  store i32 %inc60, i32* %i, align 4, !tbaa !3
  br label %for.cond37

for.end61:                                        ; preds = %for.cond37
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc85, %for.end61
  %41 = load i32, i32* %i, align 4, !tbaa !3
  %42 = load i32, i32* %nm.addr, align 4, !tbaa !3
  %cmp63 = icmp slt i32 %41, %42
  br i1 %cmp63, label %for.body65, label %for.end87

for.body65:                                       ; preds = %for.cond62
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc82, %for.body65
  %43 = load i32, i32* %j, align 4, !tbaa !3
  %44 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %cmp67 = icmp slt i32 %43, %44
  br i1 %cmp67, label %for.body69, label %for.end84

for.body69:                                       ; preds = %for.cond66
  %45 = load i32, i32* %i, align 4, !tbaa !3
  %46 = load i32, i32* %j, align 4, !tbaa !3
  %add70 = add nsw i32 %46, 2
  %mul71 = mul nsw i32 %45, %add70
  %add72 = add nsw i32 %mul71, 2
  %47 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %rem73 = srem i32 %add72, %47
  %conv74 = sitofp i32 %rem73 to double
  %48 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %mul75 = mul nsw i32 5, %48
  %conv76 = sitofp i32 %mul75 to double
  %div77 = fdiv double %conv74, %conv76
  %49 = load [1100 x double]*, [1100 x double]** %D.addr, align 8, !tbaa !7
  %50 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom78 = sext i32 %50 to i64
  %arrayidx79 = getelementptr inbounds [1100 x double], [1100 x double]* %49, i64 %idxprom78
  %51 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom80 = sext i32 %51 to i64
  %arrayidx81 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx79, i64 0, i64 %idxprom80
  store double %div77, double* %arrayidx81, align 8, !tbaa !9
  br label %for.inc82

for.inc82:                                        ; preds = %for.body69
  %52 = load i32, i32* %j, align 4, !tbaa !3
  %inc83 = add nsw i32 %52, 1
  store i32 %inc83, i32* %j, align 4, !tbaa !3
  br label %for.cond66

for.end84:                                        ; preds = %for.cond66
  br label %for.inc85

for.inc85:                                        ; preds = %for.end84
  %53 = load i32, i32* %i, align 4, !tbaa !3
  %inc86 = add nsw i32 %53, 1
  store i32 %inc86, i32* %i, align 4, !tbaa !3
  br label %for.cond62

for.end87:                                        ; preds = %for.cond62
  %54 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %54) #3
  %55 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %55) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* %E, [1000 x double]* %A, [900 x double]* %B, [1100 x double]* %F, [1200 x double]* %C, [1100 x double]* %D, [1100 x double]* %G) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %E.addr = alloca [900 x double]*, align 8
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [900 x double]*, align 8
  %F.addr = alloca [1100 x double]*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %D.addr = alloca [1100 x double]*, align 8
  %G.addr = alloca [1100 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4, !tbaa !3
  store i32 %nj, i32* %nj.addr, align 4, !tbaa !3
  store i32 %nk, i32* %nk.addr, align 4, !tbaa !3
  store i32 %nl, i32* %nl.addr, align 4, !tbaa !3
  store i32 %nm, i32* %nm.addr, align 4, !tbaa !3
  store [900 x double]* %E, [900 x double]** %E.addr, align 8, !tbaa !7
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8, !tbaa !7
  store [900 x double]* %B, [900 x double]** %B.addr, align 8, !tbaa !7
  store [1100 x double]* %F, [1100 x double]** %F.addr, align 8, !tbaa !7
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8, !tbaa !7
  store [1100 x double]* %D, [1100 x double]** %D.addr, align 8, !tbaa !7
  store [1100 x double]* %G, [1100 x double]** %G.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end26

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc21, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end23

for.body3:                                        ; preds = %for.cond1
  %7 = load [900 x double]*, [900 x double]** %E.addr, align 8, !tbaa !7
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %idxprom
  %9 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom4 = sext i32 %9 to i64
  %arrayidx5 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx, i64 0, i64 %idxprom4
  store double 0.000000e+00, double* %arrayidx5, align 8, !tbaa !9
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body3
  %10 = load i32, i32* %k, align 4, !tbaa !3
  %11 = load i32, i32* %nk.addr, align 4, !tbaa !3
  %cmp7 = icmp slt i32 %10, %11
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %12 = load [1000 x double]*, [1000 x double]** %A.addr, align 8, !tbaa !7
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom9 = sext i32 %13 to i64
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %12, i64 %idxprom9
  %14 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom11 = sext i32 %14 to i64
  %arrayidx12 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx10, i64 0, i64 %idxprom11
  %15 = load double, double* %arrayidx12, align 8, !tbaa !9
  %16 = load [900 x double]*, [900 x double]** %B.addr, align 8, !tbaa !7
  %17 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom13 = sext i32 %17 to i64
  %arrayidx14 = getelementptr inbounds [900 x double], [900 x double]* %16, i64 %idxprom13
  %18 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom15 = sext i32 %18 to i64
  %arrayidx16 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx14, i64 0, i64 %idxprom15
  %19 = load double, double* %arrayidx16, align 8, !tbaa !9
  %mul = fmul double %15, %19
  %20 = load [900 x double]*, [900 x double]** %E.addr, align 8, !tbaa !7
  %21 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom17 = sext i32 %21 to i64
  %arrayidx18 = getelementptr inbounds [900 x double], [900 x double]* %20, i64 %idxprom17
  %22 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom19 = sext i32 %22 to i64
  %arrayidx20 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx18, i64 0, i64 %idxprom19
  %23 = load double, double* %arrayidx20, align 8, !tbaa !9
  %add = fadd double %23, %mul
  store double %add, double* %arrayidx20, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %24 = load i32, i32* %k, align 4, !tbaa !3
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %k, align 4, !tbaa !3
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc21

for.inc21:                                        ; preds = %for.end
  %25 = load i32, i32* %j, align 4, !tbaa !3
  %inc22 = add nsw i32 %25, 1
  store i32 %inc22, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24

for.inc24:                                        ; preds = %for.end23
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %inc25 = add nsw i32 %26, 1
  store i32 %inc25, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end26:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc60, %for.end26
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %28 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp28 = icmp slt i32 %27, %28
  br i1 %cmp28, label %for.body29, label %for.end62

for.body29:                                       ; preds = %for.cond27
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc57, %for.body29
  %29 = load i32, i32* %j, align 4, !tbaa !3
  %30 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %cmp31 = icmp slt i32 %29, %30
  br i1 %cmp31, label %for.body32, label %for.end59

for.body32:                                       ; preds = %for.cond30
  %31 = load [1100 x double]*, [1100 x double]** %F.addr, align 8, !tbaa !7
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom33 = sext i32 %32 to i64
  %arrayidx34 = getelementptr inbounds [1100 x double], [1100 x double]* %31, i64 %idxprom33
  %33 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom35 = sext i32 %33 to i64
  %arrayidx36 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx34, i64 0, i64 %idxprom35
  store double 0.000000e+00, double* %arrayidx36, align 8, !tbaa !9
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc54, %for.body32
  %34 = load i32, i32* %k, align 4, !tbaa !3
  %35 = load i32, i32* %nm.addr, align 4, !tbaa !3
  %cmp38 = icmp slt i32 %34, %35
  br i1 %cmp38, label %for.body39, label %for.end56

for.body39:                                       ; preds = %for.cond37
  %36 = load [1200 x double]*, [1200 x double]** %C.addr, align 8, !tbaa !7
  %37 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom40 = sext i32 %37 to i64
  %arrayidx41 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 %idxprom40
  %38 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom42 = sext i32 %38 to i64
  %arrayidx43 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx41, i64 0, i64 %idxprom42
  %39 = load double, double* %arrayidx43, align 8, !tbaa !9
  %40 = load [1100 x double]*, [1100 x double]** %D.addr, align 8, !tbaa !7
  %41 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom44 = sext i32 %41 to i64
  %arrayidx45 = getelementptr inbounds [1100 x double], [1100 x double]* %40, i64 %idxprom44
  %42 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom46 = sext i32 %42 to i64
  %arrayidx47 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx45, i64 0, i64 %idxprom46
  %43 = load double, double* %arrayidx47, align 8, !tbaa !9
  %mul48 = fmul double %39, %43
  %44 = load [1100 x double]*, [1100 x double]** %F.addr, align 8, !tbaa !7
  %45 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom49 = sext i32 %45 to i64
  %arrayidx50 = getelementptr inbounds [1100 x double], [1100 x double]* %44, i64 %idxprom49
  %46 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom51 = sext i32 %46 to i64
  %arrayidx52 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx50, i64 0, i64 %idxprom51
  %47 = load double, double* %arrayidx52, align 8, !tbaa !9
  %add53 = fadd double %47, %mul48
  store double %add53, double* %arrayidx52, align 8, !tbaa !9
  br label %for.inc54

for.inc54:                                        ; preds = %for.body39
  %48 = load i32, i32* %k, align 4, !tbaa !3
  %inc55 = add nsw i32 %48, 1
  store i32 %inc55, i32* %k, align 4, !tbaa !3
  br label %for.cond37

for.end56:                                        ; preds = %for.cond37
  br label %for.inc57

for.inc57:                                        ; preds = %for.end56
  %49 = load i32, i32* %j, align 4, !tbaa !3
  %inc58 = add nsw i32 %49, 1
  store i32 %inc58, i32* %j, align 4, !tbaa !3
  br label %for.cond30

for.end59:                                        ; preds = %for.cond30
  br label %for.inc60

for.inc60:                                        ; preds = %for.end59
  %50 = load i32, i32* %i, align 4, !tbaa !3
  %inc61 = add nsw i32 %50, 1
  store i32 %inc61, i32* %i, align 4, !tbaa !3
  br label %for.cond27

for.end62:                                        ; preds = %for.cond27
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc96, %for.end62
  %51 = load i32, i32* %i, align 4, !tbaa !3
  %52 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp64 = icmp slt i32 %51, %52
  br i1 %cmp64, label %for.body65, label %for.end98

for.body65:                                       ; preds = %for.cond63
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc93, %for.body65
  %53 = load i32, i32* %j, align 4, !tbaa !3
  %54 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %cmp67 = icmp slt i32 %53, %54
  br i1 %cmp67, label %for.body68, label %for.end95

for.body68:                                       ; preds = %for.cond66
  %55 = load [1100 x double]*, [1100 x double]** %G.addr, align 8, !tbaa !7
  %56 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom69 = sext i32 %56 to i64
  %arrayidx70 = getelementptr inbounds [1100 x double], [1100 x double]* %55, i64 %idxprom69
  %57 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom71 = sext i32 %57 to i64
  %arrayidx72 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx70, i64 0, i64 %idxprom71
  store double 0.000000e+00, double* %arrayidx72, align 8, !tbaa !9
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc90, %for.body68
  %58 = load i32, i32* %k, align 4, !tbaa !3
  %59 = load i32, i32* %nj.addr, align 4, !tbaa !3
  %cmp74 = icmp slt i32 %58, %59
  br i1 %cmp74, label %for.body75, label %for.end92

for.body75:                                       ; preds = %for.cond73
  %60 = load [900 x double]*, [900 x double]** %E.addr, align 8, !tbaa !7
  %61 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom76 = sext i32 %61 to i64
  %arrayidx77 = getelementptr inbounds [900 x double], [900 x double]* %60, i64 %idxprom76
  %62 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom78 = sext i32 %62 to i64
  %arrayidx79 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx77, i64 0, i64 %idxprom78
  %63 = load double, double* %arrayidx79, align 8, !tbaa !9
  %64 = load [1100 x double]*, [1100 x double]** %F.addr, align 8, !tbaa !7
  %65 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom80 = sext i32 %65 to i64
  %arrayidx81 = getelementptr inbounds [1100 x double], [1100 x double]* %64, i64 %idxprom80
  %66 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom82 = sext i32 %66 to i64
  %arrayidx83 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx81, i64 0, i64 %idxprom82
  %67 = load double, double* %arrayidx83, align 8, !tbaa !9
  %mul84 = fmul double %63, %67
  %68 = load [1100 x double]*, [1100 x double]** %G.addr, align 8, !tbaa !7
  %69 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom85 = sext i32 %69 to i64
  %arrayidx86 = getelementptr inbounds [1100 x double], [1100 x double]* %68, i64 %idxprom85
  %70 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom87 = sext i32 %70 to i64
  %arrayidx88 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx86, i64 0, i64 %idxprom87
  %71 = load double, double* %arrayidx88, align 8, !tbaa !9
  %add89 = fadd double %71, %mul84
  store double %add89, double* %arrayidx88, align 8, !tbaa !9
  br label %for.inc90

for.inc90:                                        ; preds = %for.body75
  %72 = load i32, i32* %k, align 4, !tbaa !3
  %inc91 = add nsw i32 %72, 1
  store i32 %inc91, i32* %k, align 4, !tbaa !3
  br label %for.cond73

for.end92:                                        ; preds = %for.cond73
  br label %for.inc93

for.inc93:                                        ; preds = %for.end92
  %73 = load i32, i32* %j, align 4, !tbaa !3
  %inc94 = add nsw i32 %73, 1
  store i32 %inc94, i32* %j, align 4, !tbaa !3
  br label %for.cond66

for.end95:                                        ; preds = %for.cond66
  br label %for.inc96

for.inc96:                                        ; preds = %for.end95
  %74 = load i32, i32* %i, align 4, !tbaa !3
  %inc97 = add nsw i32 %74, 1
  store i32 %inc97, i32* %i, align 4, !tbaa !3
  br label %for.cond63

for.end98:                                        ; preds = %for.cond63
  %75 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %75) #3
  %76 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %76) #3
  %77 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %77) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1100 x double]* %G) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %G.addr = alloca [1100 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4, !tbaa !3
  store i32 %nl, i32* %nl.addr, align 4, !tbaa !3
  store [1100 x double]* %G, [1100 x double]** %G.addr, align 8, !tbaa !7
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
  %5 = load i32, i32* %ni.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %7 = load i32, i32* %nl.addr, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %6, %7
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %ni.addr, align 4, !tbaa !3
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
  %13 = load [1100 x double]*, [1100 x double]** %G.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds [1100 x double], [1100 x double]* %13, i64 %idxprom
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx, i64 0, i64 %idxprom7
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
