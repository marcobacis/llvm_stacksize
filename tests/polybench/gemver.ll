; ModuleID = '../linear-algebra/blas/gemver/gemver.c'
source_filename = "../linear-algebra/blas/gemver/gemver.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
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
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %A = alloca [2000 x [2000 x double]]*, align 8
  %u1 = alloca [2000 x double]*, align 8
  %v1 = alloca [2000 x double]*, align 8
  %u2 = alloca [2000 x double]*, align 8
  %v2 = alloca [2000 x double]*, align 8
  %w = alloca [2000 x double]*, align 8
  %x = alloca [2000 x double]*, align 8
  %y = alloca [2000 x double]*, align 8
  %z = alloca [2000 x double]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 2000, i32* %n, align 4, !tbaa !3
  %1 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #3
  %2 = bitcast double* %beta to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %3 = bitcast [2000 x [2000 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %4 = bitcast i8* %call to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %4, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %5 = bitcast [2000 x double]** %u1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %6 = bitcast i8* %call1 to [2000 x double]*
  store [2000 x double]* %6, [2000 x double]** %u1, align 8, !tbaa !7
  %7 = bitcast [2000 x double]** %v1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #3
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %8 = bitcast i8* %call2 to [2000 x double]*
  store [2000 x double]* %8, [2000 x double]** %v1, align 8, !tbaa !7
  %9 = bitcast [2000 x double]** %u2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #3
  %call3 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %10 = bitcast i8* %call3 to [2000 x double]*
  store [2000 x double]* %10, [2000 x double]** %u2, align 8, !tbaa !7
  %11 = bitcast [2000 x double]** %v2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %11) #3
  %call4 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %12 = bitcast i8* %call4 to [2000 x double]*
  store [2000 x double]* %12, [2000 x double]** %v2, align 8, !tbaa !7
  %13 = bitcast [2000 x double]** %w to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %13) #3
  %call5 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %14 = bitcast i8* %call5 to [2000 x double]*
  store [2000 x double]* %14, [2000 x double]** %w, align 8, !tbaa !7
  %15 = bitcast [2000 x double]** %x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %15) #3
  %call6 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %16 = bitcast i8* %call6 to [2000 x double]*
  store [2000 x double]* %16, [2000 x double]** %x, align 8, !tbaa !7
  %17 = bitcast [2000 x double]** %y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %17) #3
  %call7 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %18 = bitcast i8* %call7 to [2000 x double]*
  store [2000 x double]* %18, [2000 x double]** %y, align 8, !tbaa !7
  %19 = bitcast [2000 x double]** %z to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %19) #3
  %call8 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %20 = bitcast i8* %call8 to [2000 x double]*
  store [2000 x double]* %20, [2000 x double]** %z, align 8, !tbaa !7
  %21 = load i32, i32* %n, align 4, !tbaa !3
  %22 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i32 0, i32 0
  %23 = load [2000 x double]*, [2000 x double]** %u1, align 8, !tbaa !7
  %arraydecay9 = getelementptr inbounds [2000 x double], [2000 x double]* %23, i32 0, i32 0
  %24 = load [2000 x double]*, [2000 x double]** %v1, align 8, !tbaa !7
  %arraydecay10 = getelementptr inbounds [2000 x double], [2000 x double]* %24, i32 0, i32 0
  %25 = load [2000 x double]*, [2000 x double]** %u2, align 8, !tbaa !7
  %arraydecay11 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i32 0, i32 0
  %26 = load [2000 x double]*, [2000 x double]** %v2, align 8, !tbaa !7
  %arraydecay12 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i32 0, i32 0
  %27 = load [2000 x double]*, [2000 x double]** %w, align 8, !tbaa !7
  %arraydecay13 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i32 0, i32 0
  %28 = load [2000 x double]*, [2000 x double]** %x, align 8, !tbaa !7
  %arraydecay14 = getelementptr inbounds [2000 x double], [2000 x double]* %28, i32 0, i32 0
  %29 = load [2000 x double]*, [2000 x double]** %y, align 8, !tbaa !7
  %arraydecay15 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i32 0, i32 0
  %30 = load [2000 x double]*, [2000 x double]** %z, align 8, !tbaa !7
  %arraydecay16 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i32 0, i32 0
  call void @init_array(i32 %21, double* %alpha, double* %beta, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  %31 = load i32, i32* %n, align 4, !tbaa !3
  %32 = load double, double* %alpha, align 8, !tbaa !9
  %33 = load double, double* %beta, align 8, !tbaa !9
  %34 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %arraydecay17 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i32 0, i32 0
  %35 = load [2000 x double]*, [2000 x double]** %u1, align 8, !tbaa !7
  %arraydecay18 = getelementptr inbounds [2000 x double], [2000 x double]* %35, i32 0, i32 0
  %36 = load [2000 x double]*, [2000 x double]** %v1, align 8, !tbaa !7
  %arraydecay19 = getelementptr inbounds [2000 x double], [2000 x double]* %36, i32 0, i32 0
  %37 = load [2000 x double]*, [2000 x double]** %u2, align 8, !tbaa !7
  %arraydecay20 = getelementptr inbounds [2000 x double], [2000 x double]* %37, i32 0, i32 0
  %38 = load [2000 x double]*, [2000 x double]** %v2, align 8, !tbaa !7
  %arraydecay21 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i32 0, i32 0
  %39 = load [2000 x double]*, [2000 x double]** %w, align 8, !tbaa !7
  %arraydecay22 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i32 0, i32 0
  %40 = load [2000 x double]*, [2000 x double]** %x, align 8, !tbaa !7
  %arraydecay23 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i32 0, i32 0
  %41 = load [2000 x double]*, [2000 x double]** %y, align 8, !tbaa !7
  %arraydecay24 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i32 0, i32 0
  %42 = load [2000 x double]*, [2000 x double]** %z, align 8, !tbaa !7
  %arraydecay25 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i32 0, i32 0
  call void @kernel_gemver(i32 %31, double %32, double %33, [2000 x double]* %arraydecay17, double* %arraydecay18, double* %arraydecay19, double* %arraydecay20, double* %arraydecay21, double* %arraydecay22, double* %arraydecay23, double* %arraydecay24, double* %arraydecay25)
  %43 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %43, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %44 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %44, i64 0
  %45 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call26 = call i32 @strcmp(i8* %45, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call26, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %46 = load i32, i32* %n, align 4, !tbaa !3
  %47 = load [2000 x double]*, [2000 x double]** %w, align 8, !tbaa !7
  %arraydecay27 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i32 0, i32 0
  call void @print_array(i32 %46, double* %arraydecay27)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %48 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %A, align 8, !tbaa !7
  %49 = bitcast [2000 x [2000 x double]]* %48 to i8*
  call void @free(i8* %49)
  %50 = load [2000 x double]*, [2000 x double]** %u1, align 8, !tbaa !7
  %51 = bitcast [2000 x double]* %50 to i8*
  call void @free(i8* %51)
  %52 = load [2000 x double]*, [2000 x double]** %v1, align 8, !tbaa !7
  %53 = bitcast [2000 x double]* %52 to i8*
  call void @free(i8* %53)
  %54 = load [2000 x double]*, [2000 x double]** %u2, align 8, !tbaa !7
  %55 = bitcast [2000 x double]* %54 to i8*
  call void @free(i8* %55)
  %56 = load [2000 x double]*, [2000 x double]** %v2, align 8, !tbaa !7
  %57 = bitcast [2000 x double]* %56 to i8*
  call void @free(i8* %57)
  %58 = load [2000 x double]*, [2000 x double]** %w, align 8, !tbaa !7
  %59 = bitcast [2000 x double]* %58 to i8*
  call void @free(i8* %59)
  %60 = load [2000 x double]*, [2000 x double]** %x, align 8, !tbaa !7
  %61 = bitcast [2000 x double]* %60 to i8*
  call void @free(i8* %61)
  %62 = load [2000 x double]*, [2000 x double]** %y, align 8, !tbaa !7
  %63 = bitcast [2000 x double]* %62 to i8*
  call void @free(i8* %63)
  %64 = load [2000 x double]*, [2000 x double]** %z, align 8, !tbaa !7
  %65 = bitcast [2000 x double]* %64 to i8*
  call void @free(i8* %65)
  %66 = bitcast [2000 x double]** %z to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %66) #3
  %67 = bitcast [2000 x double]** %y to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %67) #3
  %68 = bitcast [2000 x double]** %x to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %68) #3
  %69 = bitcast [2000 x double]** %w to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %69) #3
  %70 = bitcast [2000 x double]** %v2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %70) #3
  %71 = bitcast [2000 x double]** %u2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %71) #3
  %72 = bitcast [2000 x double]** %v1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %72) #3
  %73 = bitcast [2000 x double]** %u1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %73) #3
  %74 = bitcast [2000 x [2000 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %74) #3
  %75 = bitcast double* %beta to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %75) #3
  %76 = bitcast double* %alpha to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %76) #3
  %77 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %77) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %n, double* %alpha, double* %beta, [2000 x double]* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %A.addr = alloca [2000 x double]*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %fn = alloca double, align 8
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %alpha, double** %alpha.addr, align 8, !tbaa !7
  store double* %beta, double** %beta.addr, align 8, !tbaa !7
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8, !tbaa !7
  store double* %u1, double** %u1.addr, align 8, !tbaa !7
  store double* %v1, double** %v1.addr, align 8, !tbaa !7
  store double* %u2, double** %u2.addr, align 8, !tbaa !7
  store double* %v2, double** %v2.addr, align 8, !tbaa !7
  store double* %w, double** %w.addr, align 8, !tbaa !7
  store double* %x, double** %x.addr, align 8, !tbaa !7
  store double* %y, double** %y.addr, align 8, !tbaa !7
  store double* %z, double** %z.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = load double*, double** %alpha.addr, align 8, !tbaa !7
  store double 1.500000e+00, double* %2, align 8, !tbaa !9
  %3 = load double*, double** %beta.addr, align 8, !tbaa !7
  store double 1.200000e+00, double* %3, align 8, !tbaa !9
  %4 = bitcast double* %fn to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %5 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv = sitofp i32 %5 to double
  store double %conv, double* %fn, align 8, !tbaa !9
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc46, %entry
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %7 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %for.body, label %for.end48

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %conv2 = sitofp i32 %8 to double
  %9 = load double*, double** %u1.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds double, double* %9, i64 %idxprom
  store double %conv2, double* %arrayidx, align 8, !tbaa !9
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %add = add nsw i32 %11, 1
  %conv3 = sitofp i32 %add to double
  %12 = load double, double* %fn, align 8, !tbaa !9
  %div = fdiv double %conv3, %12
  %div4 = fdiv double %div, 2.000000e+00
  %13 = load double*, double** %u2.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom5 = sext i32 %14 to i64
  %arrayidx6 = getelementptr inbounds double, double* %13, i64 %idxprom5
  store double %div4, double* %arrayidx6, align 8, !tbaa !9
  %15 = load i32, i32* %i, align 4, !tbaa !3
  %add7 = add nsw i32 %15, 1
  %conv8 = sitofp i32 %add7 to double
  %16 = load double, double* %fn, align 8, !tbaa !9
  %div9 = fdiv double %conv8, %16
  %div10 = fdiv double %div9, 4.000000e+00
  %17 = load double*, double** %v1.addr, align 8, !tbaa !7
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom11 = sext i32 %18 to i64
  %arrayidx12 = getelementptr inbounds double, double* %17, i64 %idxprom11
  store double %div10, double* %arrayidx12, align 8, !tbaa !9
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %add13 = add nsw i32 %19, 1
  %conv14 = sitofp i32 %add13 to double
  %20 = load double, double* %fn, align 8, !tbaa !9
  %div15 = fdiv double %conv14, %20
  %div16 = fdiv double %div15, 6.000000e+00
  %21 = load double*, double** %v2.addr, align 8, !tbaa !7
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom17 = sext i32 %22 to i64
  %arrayidx18 = getelementptr inbounds double, double* %21, i64 %idxprom17
  store double %div16, double* %arrayidx18, align 8, !tbaa !9
  %23 = load i32, i32* %i, align 4, !tbaa !3
  %add19 = add nsw i32 %23, 1
  %conv20 = sitofp i32 %add19 to double
  %24 = load double, double* %fn, align 8, !tbaa !9
  %div21 = fdiv double %conv20, %24
  %div22 = fdiv double %div21, 8.000000e+00
  %25 = load double*, double** %y.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom23 = sext i32 %26 to i64
  %arrayidx24 = getelementptr inbounds double, double* %25, i64 %idxprom23
  store double %div22, double* %arrayidx24, align 8, !tbaa !9
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %add25 = add nsw i32 %27, 1
  %conv26 = sitofp i32 %add25 to double
  %28 = load double, double* %fn, align 8, !tbaa !9
  %div27 = fdiv double %conv26, %28
  %div28 = fdiv double %div27, 9.000000e+00
  %29 = load double*, double** %z.addr, align 8, !tbaa !7
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom29 = sext i32 %30 to i64
  %arrayidx30 = getelementptr inbounds double, double* %29, i64 %idxprom29
  store double %div28, double* %arrayidx30, align 8, !tbaa !9
  %31 = load double*, double** %x.addr, align 8, !tbaa !7
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom31 = sext i32 %32 to i64
  %arrayidx32 = getelementptr inbounds double, double* %31, i64 %idxprom31
  store double 0.000000e+00, double* %arrayidx32, align 8, !tbaa !9
  %33 = load double*, double** %w.addr, align 8, !tbaa !7
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom33 = sext i32 %34 to i64
  %arrayidx34 = getelementptr inbounds double, double* %33, i64 %idxprom33
  store double 0.000000e+00, double* %arrayidx34, align 8, !tbaa !9
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc, %for.body
  %35 = load i32, i32* %j, align 4, !tbaa !3
  %36 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp36 = icmp slt i32 %35, %36
  br i1 %cmp36, label %for.body38, label %for.end

for.body38:                                       ; preds = %for.cond35
  %37 = load i32, i32* %i, align 4, !tbaa !3
  %38 = load i32, i32* %j, align 4, !tbaa !3
  %mul = mul nsw i32 %37, %38
  %39 = load i32, i32* %n.addr, align 4, !tbaa !3
  %rem = srem i32 %mul, %39
  %conv39 = sitofp i32 %rem to double
  %40 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv40 = sitofp i32 %40 to double
  %div41 = fdiv double %conv39, %conv40
  %41 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %42 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom42 = sext i32 %42 to i64
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %idxprom42
  %43 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom44 = sext i32 %43 to i64
  %arrayidx45 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx43, i64 0, i64 %idxprom44
  store double %div41, double* %arrayidx45, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body38
  %44 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %44, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond35

for.end:                                          ; preds = %for.cond35
  br label %for.inc46

for.inc46:                                        ; preds = %for.end
  %45 = load i32, i32* %i, align 4, !tbaa !3
  %inc47 = add nsw i32 %45, 1
  store i32 %inc47, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end48:                                        ; preds = %for.cond
  %46 = bitcast double* %fn to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %46) #3
  %47 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %47) #3
  %48 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %48) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_gemver(i32 %n, double %alpha, double %beta, [2000 x double]* %A, double* %u1, double* %v1, double* %u2, double* %v2, double* %w, double* %x, double* %y, double* %z) #0 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %A.addr = alloca [2000 x double]*, align 8
  %u1.addr = alloca double*, align 8
  %v1.addr = alloca double*, align 8
  %u2.addr = alloca double*, align 8
  %v2.addr = alloca double*, align 8
  %w.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double %alpha, double* %alpha.addr, align 8, !tbaa !9
  store double %beta, double* %beta.addr, align 8, !tbaa !9
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8, !tbaa !7
  store double* %u1, double** %u1.addr, align 8, !tbaa !7
  store double* %v1, double** %v1.addr, align 8, !tbaa !7
  store double* %u2, double** %u2.addr, align 8, !tbaa !7
  store double* %v2, double** %v2.addr, align 8, !tbaa !7
  store double* %w, double** %w.addr, align 8, !tbaa !7
  store double* %x, double** %x.addr, align 8, !tbaa !7
  store double* %y, double** %y.addr, align 8, !tbaa !7
  store double* %z, double** %z.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc20, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end22

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4, !tbaa !3
  %5 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %idxprom
  %8 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx, i64 0, i64 %idxprom4
  %9 = load double, double* %arrayidx5, align 8, !tbaa !9
  %10 = load double*, double** %u1.addr, align 8, !tbaa !7
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds double, double* %10, i64 %idxprom6
  %12 = load double, double* %arrayidx7, align 8, !tbaa !9
  %13 = load double*, double** %v1.addr, align 8, !tbaa !7
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds double, double* %13, i64 %idxprom8
  %15 = load double, double* %arrayidx9, align 8, !tbaa !9
  %mul = fmul double %12, %15
  %add = fadd double %9, %mul
  %16 = load double*, double** %u2.addr, align 8, !tbaa !7
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom10 = sext i32 %17 to i64
  %arrayidx11 = getelementptr inbounds double, double* %16, i64 %idxprom10
  %18 = load double, double* %arrayidx11, align 8, !tbaa !9
  %19 = load double*, double** %v2.addr, align 8, !tbaa !7
  %20 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom12 = sext i32 %20 to i64
  %arrayidx13 = getelementptr inbounds double, double* %19, i64 %idxprom12
  %21 = load double, double* %arrayidx13, align 8, !tbaa !9
  %mul14 = fmul double %18, %21
  %add15 = fadd double %add, %mul14
  %22 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %23 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom16 = sext i32 %23 to i64
  %arrayidx17 = getelementptr inbounds [2000 x double], [2000 x double]* %22, i64 %idxprom16
  %24 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom18 = sext i32 %24 to i64
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx17, i64 0, i64 %idxprom18
  store double %add15, double* %arrayidx19, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %25 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %inc21 = add nsw i32 %26, 1
  store i32 %inc21, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end22:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc45, %for.end22
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %28 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp24 = icmp slt i32 %27, %28
  br i1 %cmp24, label %for.body25, label %for.end47

for.body25:                                       ; preds = %for.cond23
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc42, %for.body25
  %29 = load i32, i32* %j, align 4, !tbaa !3
  %30 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp27 = icmp slt i32 %29, %30
  br i1 %cmp27, label %for.body28, label %for.end44

for.body28:                                       ; preds = %for.cond26
  %31 = load double*, double** %x.addr, align 8, !tbaa !7
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom29 = sext i32 %32 to i64
  %arrayidx30 = getelementptr inbounds double, double* %31, i64 %idxprom29
  %33 = load double, double* %arrayidx30, align 8, !tbaa !9
  %34 = load double, double* %beta.addr, align 8, !tbaa !9
  %35 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %36 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom31 = sext i32 %36 to i64
  %arrayidx32 = getelementptr inbounds [2000 x double], [2000 x double]* %35, i64 %idxprom31
  %37 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom33 = sext i32 %37 to i64
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx32, i64 0, i64 %idxprom33
  %38 = load double, double* %arrayidx34, align 8, !tbaa !9
  %mul35 = fmul double %34, %38
  %39 = load double*, double** %y.addr, align 8, !tbaa !7
  %40 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom36 = sext i32 %40 to i64
  %arrayidx37 = getelementptr inbounds double, double* %39, i64 %idxprom36
  %41 = load double, double* %arrayidx37, align 8, !tbaa !9
  %mul38 = fmul double %mul35, %41
  %add39 = fadd double %33, %mul38
  %42 = load double*, double** %x.addr, align 8, !tbaa !7
  %43 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom40 = sext i32 %43 to i64
  %arrayidx41 = getelementptr inbounds double, double* %42, i64 %idxprom40
  store double %add39, double* %arrayidx41, align 8, !tbaa !9
  br label %for.inc42

for.inc42:                                        ; preds = %for.body28
  %44 = load i32, i32* %j, align 4, !tbaa !3
  %inc43 = add nsw i32 %44, 1
  store i32 %inc43, i32* %j, align 4, !tbaa !3
  br label %for.cond26

for.end44:                                        ; preds = %for.cond26
  br label %for.inc45

for.inc45:                                        ; preds = %for.end44
  %45 = load i32, i32* %i, align 4, !tbaa !3
  %inc46 = add nsw i32 %45, 1
  store i32 %inc46, i32* %i, align 4, !tbaa !3
  br label %for.cond23

for.end47:                                        ; preds = %for.cond23
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc58, %for.end47
  %46 = load i32, i32* %i, align 4, !tbaa !3
  %47 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp49 = icmp slt i32 %46, %47
  br i1 %cmp49, label %for.body50, label %for.end60

for.body50:                                       ; preds = %for.cond48
  %48 = load double*, double** %x.addr, align 8, !tbaa !7
  %49 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom51 = sext i32 %49 to i64
  %arrayidx52 = getelementptr inbounds double, double* %48, i64 %idxprom51
  %50 = load double, double* %arrayidx52, align 8, !tbaa !9
  %51 = load double*, double** %z.addr, align 8, !tbaa !7
  %52 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom53 = sext i32 %52 to i64
  %arrayidx54 = getelementptr inbounds double, double* %51, i64 %idxprom53
  %53 = load double, double* %arrayidx54, align 8, !tbaa !9
  %add55 = fadd double %50, %53
  %54 = load double*, double** %x.addr, align 8, !tbaa !7
  %55 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom56 = sext i32 %55 to i64
  %arrayidx57 = getelementptr inbounds double, double* %54, i64 %idxprom56
  store double %add55, double* %arrayidx57, align 8, !tbaa !9
  br label %for.inc58

for.inc58:                                        ; preds = %for.body50
  %56 = load i32, i32* %i, align 4, !tbaa !3
  %inc59 = add nsw i32 %56, 1
  store i32 %inc59, i32* %i, align 4, !tbaa !3
  br label %for.cond48

for.end60:                                        ; preds = %for.cond48
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond61

for.cond61:                                       ; preds = %for.inc83, %for.end60
  %57 = load i32, i32* %i, align 4, !tbaa !3
  %58 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp62 = icmp slt i32 %57, %58
  br i1 %cmp62, label %for.body63, label %for.end85

for.body63:                                       ; preds = %for.cond61
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond64

for.cond64:                                       ; preds = %for.inc80, %for.body63
  %59 = load i32, i32* %j, align 4, !tbaa !3
  %60 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp65 = icmp slt i32 %59, %60
  br i1 %cmp65, label %for.body66, label %for.end82

for.body66:                                       ; preds = %for.cond64
  %61 = load double*, double** %w.addr, align 8, !tbaa !7
  %62 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom67 = sext i32 %62 to i64
  %arrayidx68 = getelementptr inbounds double, double* %61, i64 %idxprom67
  %63 = load double, double* %arrayidx68, align 8, !tbaa !9
  %64 = load double, double* %alpha.addr, align 8, !tbaa !9
  %65 = load [2000 x double]*, [2000 x double]** %A.addr, align 8, !tbaa !7
  %66 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom69 = sext i32 %66 to i64
  %arrayidx70 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %idxprom69
  %67 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom71 = sext i32 %67 to i64
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %arrayidx70, i64 0, i64 %idxprom71
  %68 = load double, double* %arrayidx72, align 8, !tbaa !9
  %mul73 = fmul double %64, %68
  %69 = load double*, double** %x.addr, align 8, !tbaa !7
  %70 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom74 = sext i32 %70 to i64
  %arrayidx75 = getelementptr inbounds double, double* %69, i64 %idxprom74
  %71 = load double, double* %arrayidx75, align 8, !tbaa !9
  %mul76 = fmul double %mul73, %71
  %add77 = fadd double %63, %mul76
  %72 = load double*, double** %w.addr, align 8, !tbaa !7
  %73 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom78 = sext i32 %73 to i64
  %arrayidx79 = getelementptr inbounds double, double* %72, i64 %idxprom78
  store double %add77, double* %arrayidx79, align 8, !tbaa !9
  br label %for.inc80

for.inc80:                                        ; preds = %for.body66
  %74 = load i32, i32* %j, align 4, !tbaa !3
  %inc81 = add nsw i32 %74, 1
  store i32 %inc81, i32* %j, align 4, !tbaa !3
  br label %for.cond64

for.end82:                                        ; preds = %for.cond64
  br label %for.inc83

for.inc83:                                        ; preds = %for.end82
  %75 = load i32, i32* %i, align 4, !tbaa !3
  %inc84 = add nsw i32 %75, 1
  store i32 %inc84, i32* %i, align 4, !tbaa !3
  br label %for.cond61

for.end85:                                        ; preds = %for.cond61
  %76 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %76) #3
  %77 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %77) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, double* %w) #0 {
entry:
  %n.addr = alloca i32, align 4
  %w.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store double* %w, double** %w.addr, align 8, !tbaa !7
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
  %8 = load double*, double** %w.addr, align 8, !tbaa !7
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
