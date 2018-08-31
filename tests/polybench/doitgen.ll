; ModuleID = '../linear-algebra/kernels/doitgen/doitgen.c'
source_filename = "../linear-algebra/kernels/doitgen/doitgen.c"
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
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4, double* %sum) #0 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [140 x [160 x double]]*, align 8
  %C4.addr = alloca [160 x double]*, align 8
  %sum.addr = alloca double*, align 8
  %r = alloca i32, align 4
  %q = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4, !tbaa !3
  store i32 %nq, i32* %nq.addr, align 4, !tbaa !3
  store i32 %np, i32* %np.addr, align 4, !tbaa !3
  store [140 x [160 x double]]* %A, [140 x [160 x double]]** %A.addr, align 8, !tbaa !7
  store [160 x double]* %C4, [160 x double]** %C4.addr, align 8, !tbaa !7
  store double* %sum, double** %sum.addr, align 8, !tbaa !7
  %0 = bitcast i32* %r to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %q to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %p to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  %3 = bitcast i32* %s to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3
  store i32 0, i32* %r, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc42, %entry
  %4 = load i32, i32* %r, align 4, !tbaa !3
  %5 = load i32, i32* %nr.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end44

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %q, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc39, %for.body
  %6 = load i32, i32* %q, align 4, !tbaa !3
  %7 = load i32, i32* %nq.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %for.body3, label %for.end41

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %p, align 4, !tbaa !3
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc22, %for.body3
  %8 = load i32, i32* %p, align 4, !tbaa !3
  %9 = load i32, i32* %np.addr, align 4, !tbaa !3
  %cmp5 = icmp slt i32 %8, %9
  br i1 %cmp5, label %for.body6, label %for.end24

for.body6:                                        ; preds = %for.cond4
  %10 = load double*, double** %sum.addr, align 8, !tbaa !7
  %11 = load i32, i32* %p, align 4, !tbaa !3
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds double, double* %10, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8, !tbaa !9
  store i32 0, i32* %s, align 4, !tbaa !3
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc, %for.body6
  %12 = load i32, i32* %s, align 4, !tbaa !3
  %13 = load i32, i32* %np.addr, align 4, !tbaa !3
  %cmp8 = icmp slt i32 %12, %13
  br i1 %cmp8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond7
  %14 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8, !tbaa !7
  %15 = load i32, i32* %r, align 4, !tbaa !3
  %idxprom10 = sext i32 %15 to i64
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %14, i64 %idxprom10
  %16 = load i32, i32* %q, align 4, !tbaa !3
  %idxprom12 = sext i32 %16 to i64
  %arrayidx13 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %arrayidx11, i64 0, i64 %idxprom12
  %17 = load i32, i32* %s, align 4, !tbaa !3
  %idxprom14 = sext i32 %17 to i64
  %arrayidx15 = getelementptr inbounds [160 x double], [160 x double]* %arrayidx13, i64 0, i64 %idxprom14
  %18 = load double, double* %arrayidx15, align 8, !tbaa !9
  %19 = load [160 x double]*, [160 x double]** %C4.addr, align 8, !tbaa !7
  %20 = load i32, i32* %s, align 4, !tbaa !3
  %idxprom16 = sext i32 %20 to i64
  %arrayidx17 = getelementptr inbounds [160 x double], [160 x double]* %19, i64 %idxprom16
  %21 = load i32, i32* %p, align 4, !tbaa !3
  %idxprom18 = sext i32 %21 to i64
  %arrayidx19 = getelementptr inbounds [160 x double], [160 x double]* %arrayidx17, i64 0, i64 %idxprom18
  %22 = load double, double* %arrayidx19, align 8, !tbaa !9
  %mul = fmul double %18, %22
  %23 = load double*, double** %sum.addr, align 8, !tbaa !7
  %24 = load i32, i32* %p, align 4, !tbaa !3
  %idxprom20 = sext i32 %24 to i64
  %arrayidx21 = getelementptr inbounds double, double* %23, i64 %idxprom20
  %25 = load double, double* %arrayidx21, align 8, !tbaa !9
  %add = fadd double %25, %mul
  store double %add, double* %arrayidx21, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body9
  %26 = load i32, i32* %s, align 4, !tbaa !3
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %s, align 4, !tbaa !3
  br label %for.cond7

for.end:                                          ; preds = %for.cond7
  br label %for.inc22

for.inc22:                                        ; preds = %for.end
  %27 = load i32, i32* %p, align 4, !tbaa !3
  %inc23 = add nsw i32 %27, 1
  store i32 %inc23, i32* %p, align 4, !tbaa !3
  br label %for.cond4

for.end24:                                        ; preds = %for.cond4
  store i32 0, i32* %p, align 4, !tbaa !3
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc36, %for.end24
  %28 = load i32, i32* %p, align 4, !tbaa !3
  %29 = load i32, i32* %np.addr, align 4, !tbaa !3
  %cmp26 = icmp slt i32 %28, %29
  br i1 %cmp26, label %for.body27, label %for.end38

for.body27:                                       ; preds = %for.cond25
  %30 = load double*, double** %sum.addr, align 8, !tbaa !7
  %31 = load i32, i32* %p, align 4, !tbaa !3
  %idxprom28 = sext i32 %31 to i64
  %arrayidx29 = getelementptr inbounds double, double* %30, i64 %idxprom28
  %32 = load double, double* %arrayidx29, align 8, !tbaa !9
  %33 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8, !tbaa !7
  %34 = load i32, i32* %r, align 4, !tbaa !3
  %idxprom30 = sext i32 %34 to i64
  %arrayidx31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %33, i64 %idxprom30
  %35 = load i32, i32* %q, align 4, !tbaa !3
  %idxprom32 = sext i32 %35 to i64
  %arrayidx33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %arrayidx31, i64 0, i64 %idxprom32
  %36 = load i32, i32* %p, align 4, !tbaa !3
  %idxprom34 = sext i32 %36 to i64
  %arrayidx35 = getelementptr inbounds [160 x double], [160 x double]* %arrayidx33, i64 0, i64 %idxprom34
  store double %32, double* %arrayidx35, align 8, !tbaa !9
  br label %for.inc36

for.inc36:                                        ; preds = %for.body27
  %37 = load i32, i32* %p, align 4, !tbaa !3
  %inc37 = add nsw i32 %37, 1
  store i32 %inc37, i32* %p, align 4, !tbaa !3
  br label %for.cond25

for.end38:                                        ; preds = %for.cond25
  br label %for.inc39

for.inc39:                                        ; preds = %for.end38
  %38 = load i32, i32* %q, align 4, !tbaa !3
  %inc40 = add nsw i32 %38, 1
  store i32 %inc40, i32* %q, align 4, !tbaa !3
  br label %for.cond1

for.end41:                                        ; preds = %for.cond1
  br label %for.inc42

for.inc42:                                        ; preds = %for.end41
  %39 = load i32, i32* %r, align 4, !tbaa !3
  %inc43 = add nsw i32 %39, 1
  store i32 %inc43, i32* %r, align 4, !tbaa !3
  br label %for.cond

for.end44:                                        ; preds = %for.cond
  %40 = bitcast i32* %s to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #3
  %41 = bitcast i32* %p to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #3
  %42 = bitcast i32* %q to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #3
  %43 = bitcast i32* %r to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %nr = alloca i32, align 4
  %nq = alloca i32, align 4
  %np = alloca i32, align 4
  %A = alloca [150 x [140 x [160 x double]]]*, align 8
  %sum = alloca [160 x double]*, align 8
  %C4 = alloca [160 x [160 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %nr to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 150, i32* %nr, align 4, !tbaa !3
  %1 = bitcast i32* %nq to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 140, i32* %nq, align 4, !tbaa !3
  %2 = bitcast i32* %np to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 160, i32* %np, align 4, !tbaa !3
  %3 = bitcast [150 x [140 x [160 x double]]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %call = call i8* @polybench_alloc_data(i64 3360000, i32 8)
  %4 = bitcast i8* %call to [150 x [140 x [160 x double]]]*
  store [150 x [140 x [160 x double]]]* %4, [150 x [140 x [160 x double]]]** %A, align 8, !tbaa !7
  %5 = bitcast [160 x double]** %sum to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #3
  %call1 = call i8* @polybench_alloc_data(i64 160, i32 8)
  %6 = bitcast i8* %call1 to [160 x double]*
  store [160 x double]* %6, [160 x double]** %sum, align 8, !tbaa !7
  %7 = bitcast [160 x [160 x double]]** %C4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #3
  %call2 = call i8* @polybench_alloc_data(i64 25600, i32 8)
  %8 = bitcast i8* %call2 to [160 x [160 x double]]*
  store [160 x [160 x double]]* %8, [160 x [160 x double]]** %C4, align 8, !tbaa !7
  %9 = load i32, i32* %nr, align 4, !tbaa !3
  %10 = load i32, i32* %nq, align 4, !tbaa !3
  %11 = load i32, i32* %np, align 4, !tbaa !3
  %12 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [150 x [140 x [160 x double]]], [150 x [140 x [160 x double]]]* %12, i32 0, i32 0
  %13 = load [160 x [160 x double]]*, [160 x [160 x double]]** %C4, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [160 x [160 x double]], [160 x [160 x double]]* %13, i32 0, i32 0
  call void @init_array(i32 %9, i32 %10, i32 %11, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  %14 = load i32, i32* %nr, align 4, !tbaa !3
  %15 = load i32, i32* %nq, align 4, !tbaa !3
  %16 = load i32, i32* %np, align 4, !tbaa !3
  %17 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %A, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [150 x [140 x [160 x double]]], [150 x [140 x [160 x double]]]* %17, i32 0, i32 0
  %18 = load [160 x [160 x double]]*, [160 x [160 x double]]** %C4, align 8, !tbaa !7
  %arraydecay5 = getelementptr inbounds [160 x [160 x double]], [160 x [160 x double]]* %18, i32 0, i32 0
  %19 = load [160 x double]*, [160 x double]** %sum, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [160 x double], [160 x double]* %19, i32 0, i32 0
  call void @kernel_doitgen(i32 %14, i32 %15, i32 %16, [140 x [160 x double]]* %arraydecay4, [160 x double]* %arraydecay5, double* %arraydecay6)
  %20 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %20, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %21 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %21, i64 0
  %22 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call7 = call i32 @strcmp(i8* %22, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call7, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %23 = load i32, i32* %nr, align 4, !tbaa !3
  %24 = load i32, i32* %nq, align 4, !tbaa !3
  %25 = load i32, i32* %np, align 4, !tbaa !3
  %26 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %A, align 8, !tbaa !7
  %arraydecay8 = getelementptr inbounds [150 x [140 x [160 x double]]], [150 x [140 x [160 x double]]]* %26, i32 0, i32 0
  call void @print_array(i32 %23, i32 %24, i32 %25, [140 x [160 x double]]* %arraydecay8)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %27 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %A, align 8, !tbaa !7
  %28 = bitcast [150 x [140 x [160 x double]]]* %27 to i8*
  call void @free(i8* %28)
  %29 = load [160 x double]*, [160 x double]** %sum, align 8, !tbaa !7
  %30 = bitcast [160 x double]* %29 to i8*
  call void @free(i8* %30)
  %31 = load [160 x [160 x double]]*, [160 x [160 x double]]** %C4, align 8, !tbaa !7
  %32 = bitcast [160 x [160 x double]]* %31 to i8*
  call void @free(i8* %32)
  %33 = bitcast [160 x [160 x double]]** %C4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %33) #3
  %34 = bitcast [160 x double]** %sum to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %34) #3
  %35 = bitcast [150 x [140 x [160 x double]]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %35) #3
  %36 = bitcast i32* %np to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %36) #3
  %37 = bitcast i32* %nq to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #3
  %38 = bitcast i32* %nr to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4) #0 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [140 x [160 x double]]*, align 8
  %C4.addr = alloca [160 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4, !tbaa !3
  store i32 %nq, i32* %nq.addr, align 4, !tbaa !3
  store i32 %np, i32* %np.addr, align 4, !tbaa !3
  store [140 x [160 x double]]* %A, [140 x [160 x double]]** %A.addr, align 8, !tbaa !7
  store [160 x double]* %C4, [160 x double]** %C4.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %nr.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc12, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %nq.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end14

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %7 = load i32, i32* %k, align 4, !tbaa !3
  %8 = load i32, i32* %np.addr, align 4, !tbaa !3
  %cmp5 = icmp slt i32 %7, %8
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %mul = mul nsw i32 %9, %10
  %11 = load i32, i32* %k, align 4, !tbaa !3
  %add = add nsw i32 %mul, %11
  %12 = load i32, i32* %np.addr, align 4, !tbaa !3
  %rem = srem i32 %add, %12
  %conv = sitofp i32 %rem to double
  %13 = load i32, i32* %np.addr, align 4, !tbaa !3
  %conv7 = sitofp i32 %13 to double
  %div = fdiv double %conv, %conv7
  %14 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8, !tbaa !7
  %15 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %15 to i64
  %arrayidx = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %14, i64 %idxprom
  %16 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom8 = sext i32 %16 to i64
  %arrayidx9 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %arrayidx, i64 0, i64 %idxprom8
  %17 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom10 = sext i32 %17 to i64
  %arrayidx11 = getelementptr inbounds [160 x double], [160 x double]* %arrayidx9, i64 0, i64 %idxprom10
  store double %div, double* %arrayidx11, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %18 = load i32, i32* %k, align 4, !tbaa !3
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %k, align 4, !tbaa !3
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %inc13 = add nsw i32 %19, 1
  store i32 %inc13, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end14:                                        ; preds = %for.cond1
  br label %for.inc15

for.inc15:                                        ; preds = %for.end14
  %20 = load i32, i32* %i, align 4, !tbaa !3
  %inc16 = add nsw i32 %20, 1
  store i32 %inc16, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc38, %for.end17
  %21 = load i32, i32* %i, align 4, !tbaa !3
  %22 = load i32, i32* %np.addr, align 4, !tbaa !3
  %cmp19 = icmp slt i32 %21, %22
  br i1 %cmp19, label %for.body21, label %for.end40

for.body21:                                       ; preds = %for.cond18
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc35, %for.body21
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %24 = load i32, i32* %np.addr, align 4, !tbaa !3
  %cmp23 = icmp slt i32 %23, %24
  br i1 %cmp23, label %for.body25, label %for.end37

for.body25:                                       ; preds = %for.cond22
  %25 = load i32, i32* %i, align 4, !tbaa !3
  %26 = load i32, i32* %j, align 4, !tbaa !3
  %mul26 = mul nsw i32 %25, %26
  %27 = load i32, i32* %np.addr, align 4, !tbaa !3
  %rem27 = srem i32 %mul26, %27
  %conv28 = sitofp i32 %rem27 to double
  %28 = load i32, i32* %np.addr, align 4, !tbaa !3
  %conv29 = sitofp i32 %28 to double
  %div30 = fdiv double %conv28, %conv29
  %29 = load [160 x double]*, [160 x double]** %C4.addr, align 8, !tbaa !7
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom31 = sext i32 %30 to i64
  %arrayidx32 = getelementptr inbounds [160 x double], [160 x double]* %29, i64 %idxprom31
  %31 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom33 = sext i32 %31 to i64
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %arrayidx32, i64 0, i64 %idxprom33
  store double %div30, double* %arrayidx34, align 8, !tbaa !9
  br label %for.inc35

for.inc35:                                        ; preds = %for.body25
  %32 = load i32, i32* %j, align 4, !tbaa !3
  %inc36 = add nsw i32 %32, 1
  store i32 %inc36, i32* %j, align 4, !tbaa !3
  br label %for.cond22

for.end37:                                        ; preds = %for.cond22
  br label %for.inc38

for.inc38:                                        ; preds = %for.end37
  %33 = load i32, i32* %i, align 4, !tbaa !3
  %inc39 = add nsw i32 %33, 1
  store i32 %inc39, i32* %i, align 4, !tbaa !3
  br label %for.cond18

for.end40:                                        ; preds = %for.cond18
  %34 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #3
  %35 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #3
  %36 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %36) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A) #0 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [140 x [160 x double]]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4, !tbaa !3
  store i32 %nq, i32* %nq.addr, align 4, !tbaa !3
  store i32 %np, i32* %np.addr, align 4, !tbaa !3
  store [140 x [160 x double]]* %A, [140 x [160 x double]]** %A.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %4 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %6 = load i32, i32* %nr.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %5, %6
  br i1 %cmp, label %for.body, label %for.end23

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc18, %for.body
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %8 = load i32, i32* %nq.addr, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %7, %8
  br i1 %cmp3, label %for.body4, label %for.end20

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %9 = load i32, i32* %k, align 4, !tbaa !3
  %10 = load i32, i32* %np.addr, align 4, !tbaa !3
  %cmp6 = icmp slt i32 %9, %10
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %12 = load i32, i32* %nq.addr, align 4, !tbaa !3
  %mul = mul nsw i32 %11, %12
  %13 = load i32, i32* %np.addr, align 4, !tbaa !3
  %mul8 = mul nsw i32 %mul, %13
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %15 = load i32, i32* %np.addr, align 4, !tbaa !3
  %mul9 = mul nsw i32 %14, %15
  %add = add nsw i32 %mul8, %mul9
  %16 = load i32, i32* %k, align 4, !tbaa !3
  %add10 = add nsw i32 %add, %16
  %rem = srem i32 %add10, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %17 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call12 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %18 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %19 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8, !tbaa !7
  %20 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %20 to i64
  %arrayidx = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %19, i64 %idxprom
  %21 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom13 = sext i32 %21 to i64
  %arrayidx14 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %arrayidx, i64 0, i64 %idxprom13
  %22 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom15 = sext i32 %22 to i64
  %arrayidx16 = getelementptr inbounds [160 x double], [160 x double]* %arrayidx14, i64 0, i64 %idxprom15
  %23 = load double, double* %arrayidx16, align 8, !tbaa !9
  %call17 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %23)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %24 = load i32, i32* %k, align 4, !tbaa !3
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %k, align 4, !tbaa !3
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc18

for.inc18:                                        ; preds = %for.end
  %25 = load i32, i32* %j, align 4, !tbaa !3
  %inc19 = add nsw i32 %25, 1
  store i32 %inc19, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.end20:                                        ; preds = %for.cond2
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %inc22 = add nsw i32 %26, 1
  store i32 %inc22, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end23:                                        ; preds = %for.cond
  %27 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call24 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %28 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call25 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %28, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %29 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3
  %30 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #3
  %31 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #3
  ret void
}

declare void @free(i8*) #2

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
