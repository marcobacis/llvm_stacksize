; ModuleID = '../stencils/heat-3d/heat-3d.c'
source_filename = "../stencils/heat-3d/heat-3d.c"
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
  %A = alloca [120 x [120 x [120 x double]]]*, align 8
  %B = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 120, i32* %n, align 4, !tbaa !3
  %1 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 500, i32* %tsteps, align 4, !tbaa !3
  %2 = bitcast [120 x [120 x [120 x double]]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %call = call i8* @polybench_alloc_data(i64 1728000, i32 8)
  %3 = bitcast i8* %call to [120 x [120 x [120 x double]]]*
  store [120 x [120 x [120 x double]]]* %3, [120 x [120 x [120 x double]]]** %A, align 8, !tbaa !7
  %4 = bitcast [120 x [120 x [120 x double]]]** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %call1 = call i8* @polybench_alloc_data(i64 1728000, i32 8)
  %5 = bitcast i8* %call1 to [120 x [120 x [120 x double]]]*
  store [120 x [120 x [120 x double]]]* %5, [120 x [120 x [120 x double]]]** %B, align 8, !tbaa !7
  %6 = load i32, i32* %n, align 4, !tbaa !3
  %7 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %7, i32 0, i32 0
  %8 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %B, align 8, !tbaa !7
  %arraydecay2 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %8, i32 0, i32 0
  call void @init_array(i32 %6, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  %9 = load i32, i32* %tsteps, align 4, !tbaa !3
  %10 = load i32, i32* %n, align 4, !tbaa !3
  %11 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %A, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %11, i32 0, i32 0
  %12 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %B, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %12, i32 0, i32 0
  call void @kernel_heat_3d(i32 %9, i32 %10, [120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
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
  %17 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %A, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %17, i32 0, i32 0
  call void @print_array(i32 %16, [120 x [120 x double]]* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %18 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %A, align 8, !tbaa !7
  %19 = bitcast [120 x [120 x [120 x double]]]* %18 to i8*
  call void @free(i8* %19)
  %20 = bitcast [120 x [120 x [120 x double]]]** %B to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #3
  %21 = bitcast [120 x [120 x [120 x double]]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #3
  %22 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3
  %23 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [120 x [120 x double]]*, align 8
  %B.addr = alloca [120 x [120 x double]]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [120 x [120 x double]]* %A, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  store [120 x [120 x double]]* %B, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc22, %entry
  %3 = load i32, i32* %i, align 4, !tbaa !3
  %4 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc19, %for.body
  %5 = load i32, i32* %j, align 4, !tbaa !3
  %6 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end21

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %7 = load i32, i32* %k, align 4, !tbaa !3
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp5 = icmp slt i32 %7, %8
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %add = add nsw i32 %9, %10
  %11 = load i32, i32* %n.addr, align 4, !tbaa !3
  %12 = load i32, i32* %k, align 4, !tbaa !3
  %sub = sub nsw i32 %11, %12
  %add7 = add nsw i32 %add, %sub
  %conv = sitofp i32 %add7 to double
  %mul = fmul double %conv, 1.000000e+01
  %13 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv8 = sitofp i32 %13 to double
  %div = fdiv double %mul, %conv8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %15 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %15 to i64
  %arrayidx = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %idxprom
  %16 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom9 = sext i32 %16 to i64
  %arrayidx10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx, i64 0, i64 %idxprom9
  %17 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom11 = sext i32 %17 to i64
  %arrayidx12 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx10, i64 0, i64 %idxprom11
  store double %div, double* %arrayidx12, align 8, !tbaa !9
  %18 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom13 = sext i32 %19 to i64
  %arrayidx14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %idxprom13
  %20 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom15 = sext i32 %20 to i64
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx14, i64 0, i64 %idxprom15
  %21 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom17 = sext i32 %21 to i64
  %arrayidx18 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx16, i64 0, i64 %idxprom17
  store double %div, double* %arrayidx18, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %22 = load i32, i32* %k, align 4, !tbaa !3
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %k, align 4, !tbaa !3
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %inc20 = add nsw i32 %23, 1
  store i32 %inc20, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end21:                                        ; preds = %for.cond1
  br label %for.inc22

for.inc22:                                        ; preds = %for.end21
  %24 = load i32, i32* %i, align 4, !tbaa !3
  %inc23 = add nsw i32 %24, 1
  store i32 %inc23, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  %25 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #3
  %26 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %26) #3
  %27 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) #0 {
entry:
  %tsteps.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [120 x [120 x double]]*, align 8
  %B.addr = alloca [120 x [120 x double]]*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %tsteps, i32* %tsteps.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [120 x [120 x double]]* %A, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  store [120 x [120 x double]]* %B, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %0 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  %3 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3
  store i32 1, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc209, %entry
  %4 = load i32, i32* %t, align 4, !tbaa !3
  %cmp = icmp sle i32 %4, 500
  br i1 %cmp, label %for.body, label %for.end211

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc98, %for.body
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %6 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub = sub nsw i32 %6, 1
  %cmp2 = icmp slt i32 %5, %sub
  br i1 %cmp2, label %for.body3, label %for.end100

for.body3:                                        ; preds = %for.cond1
  store i32 1, i32* %j, align 4, !tbaa !3
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc95, %for.body3
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub5 = sub nsw i32 %8, 1
  %cmp6 = icmp slt i32 %7, %sub5
  br i1 %cmp6, label %for.body7, label %for.end97

for.body7:                                        ; preds = %for.cond4
  store i32 1, i32* %k, align 4, !tbaa !3
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %for.body7
  %9 = load i32, i32* %k, align 4, !tbaa !3
  %10 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub9 = sub nsw i32 %10, 1
  %cmp10 = icmp slt i32 %9, %sub9
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond8
  %11 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %12 = load i32, i32* %i, align 4, !tbaa !3
  %add = add nsw i32 %12, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %11, i64 %idxprom
  %13 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom12 = sext i32 %13 to i64
  %arrayidx13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx, i64 0, i64 %idxprom12
  %14 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom14 = sext i32 %14 to i64
  %arrayidx15 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx13, i64 0, i64 %idxprom14
  %15 = load double, double* %arrayidx15, align 8, !tbaa !9
  %16 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %17 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom16 = sext i32 %17 to i64
  %arrayidx17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %16, i64 %idxprom16
  %18 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom18 = sext i32 %18 to i64
  %arrayidx19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx17, i64 0, i64 %idxprom18
  %19 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom20 = sext i32 %19 to i64
  %arrayidx21 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx19, i64 0, i64 %idxprom20
  %20 = load double, double* %arrayidx21, align 8, !tbaa !9
  %mul = fmul double 2.000000e+00, %20
  %sub22 = fsub double %15, %mul
  %21 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %sub23 = sub nsw i32 %22, 1
  %idxprom24 = sext i32 %sub23 to i64
  %arrayidx25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %21, i64 %idxprom24
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom26 = sext i32 %23 to i64
  %arrayidx27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx25, i64 0, i64 %idxprom26
  %24 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom28 = sext i32 %24 to i64
  %arrayidx29 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx27, i64 0, i64 %idxprom28
  %25 = load double, double* %arrayidx29, align 8, !tbaa !9
  %add30 = fadd double %sub22, %25
  %mul31 = fmul double 1.250000e-01, %add30
  %26 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %27 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom32 = sext i32 %27 to i64
  %arrayidx33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %26, i64 %idxprom32
  %28 = load i32, i32* %j, align 4, !tbaa !3
  %add34 = add nsw i32 %28, 1
  %idxprom35 = sext i32 %add34 to i64
  %arrayidx36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx33, i64 0, i64 %idxprom35
  %29 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom37 = sext i32 %29 to i64
  %arrayidx38 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx36, i64 0, i64 %idxprom37
  %30 = load double, double* %arrayidx38, align 8, !tbaa !9
  %31 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %32 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom39 = sext i32 %32 to i64
  %arrayidx40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %31, i64 %idxprom39
  %33 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom41 = sext i32 %33 to i64
  %arrayidx42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx40, i64 0, i64 %idxprom41
  %34 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom43 = sext i32 %34 to i64
  %arrayidx44 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx42, i64 0, i64 %idxprom43
  %35 = load double, double* %arrayidx44, align 8, !tbaa !9
  %mul45 = fmul double 2.000000e+00, %35
  %sub46 = fsub double %30, %mul45
  %36 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %37 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom47 = sext i32 %37 to i64
  %arrayidx48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %36, i64 %idxprom47
  %38 = load i32, i32* %j, align 4, !tbaa !3
  %sub49 = sub nsw i32 %38, 1
  %idxprom50 = sext i32 %sub49 to i64
  %arrayidx51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx48, i64 0, i64 %idxprom50
  %39 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom52 = sext i32 %39 to i64
  %arrayidx53 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx51, i64 0, i64 %idxprom52
  %40 = load double, double* %arrayidx53, align 8, !tbaa !9
  %add54 = fadd double %sub46, %40
  %mul55 = fmul double 1.250000e-01, %add54
  %add56 = fadd double %mul31, %mul55
  %41 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %42 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom57 = sext i32 %42 to i64
  %arrayidx58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %41, i64 %idxprom57
  %43 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom59 = sext i32 %43 to i64
  %arrayidx60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx58, i64 0, i64 %idxprom59
  %44 = load i32, i32* %k, align 4, !tbaa !3
  %add61 = add nsw i32 %44, 1
  %idxprom62 = sext i32 %add61 to i64
  %arrayidx63 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx60, i64 0, i64 %idxprom62
  %45 = load double, double* %arrayidx63, align 8, !tbaa !9
  %46 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %47 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom64 = sext i32 %47 to i64
  %arrayidx65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %46, i64 %idxprom64
  %48 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom66 = sext i32 %48 to i64
  %arrayidx67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx65, i64 0, i64 %idxprom66
  %49 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom68 = sext i32 %49 to i64
  %arrayidx69 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx67, i64 0, i64 %idxprom68
  %50 = load double, double* %arrayidx69, align 8, !tbaa !9
  %mul70 = fmul double 2.000000e+00, %50
  %sub71 = fsub double %45, %mul70
  %51 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %52 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom72 = sext i32 %52 to i64
  %arrayidx73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %51, i64 %idxprom72
  %53 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom74 = sext i32 %53 to i64
  %arrayidx75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx73, i64 0, i64 %idxprom74
  %54 = load i32, i32* %k, align 4, !tbaa !3
  %sub76 = sub nsw i32 %54, 1
  %idxprom77 = sext i32 %sub76 to i64
  %arrayidx78 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx75, i64 0, i64 %idxprom77
  %55 = load double, double* %arrayidx78, align 8, !tbaa !9
  %add79 = fadd double %sub71, %55
  %mul80 = fmul double 1.250000e-01, %add79
  %add81 = fadd double %add56, %mul80
  %56 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %57 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom82 = sext i32 %57 to i64
  %arrayidx83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %56, i64 %idxprom82
  %58 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom84 = sext i32 %58 to i64
  %arrayidx85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx83, i64 0, i64 %idxprom84
  %59 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom86 = sext i32 %59 to i64
  %arrayidx87 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx85, i64 0, i64 %idxprom86
  %60 = load double, double* %arrayidx87, align 8, !tbaa !9
  %add88 = fadd double %add81, %60
  %61 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %62 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom89 = sext i32 %62 to i64
  %arrayidx90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %61, i64 %idxprom89
  %63 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom91 = sext i32 %63 to i64
  %arrayidx92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx90, i64 0, i64 %idxprom91
  %64 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom93 = sext i32 %64 to i64
  %arrayidx94 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx92, i64 0, i64 %idxprom93
  store double %add88, double* %arrayidx94, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body11
  %65 = load i32, i32* %k, align 4, !tbaa !3
  %inc = add nsw i32 %65, 1
  store i32 %inc, i32* %k, align 4, !tbaa !3
  br label %for.cond8

for.end:                                          ; preds = %for.cond8
  br label %for.inc95

for.inc95:                                        ; preds = %for.end
  %66 = load i32, i32* %j, align 4, !tbaa !3
  %inc96 = add nsw i32 %66, 1
  store i32 %inc96, i32* %j, align 4, !tbaa !3
  br label %for.cond4

for.end97:                                        ; preds = %for.cond4
  br label %for.inc98

for.inc98:                                        ; preds = %for.end97
  %67 = load i32, i32* %i, align 4, !tbaa !3
  %inc99 = add nsw i32 %67, 1
  store i32 %inc99, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end100:                                       ; preds = %for.cond1
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond101

for.cond101:                                      ; preds = %for.inc206, %for.end100
  %68 = load i32, i32* %i, align 4, !tbaa !3
  %69 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub102 = sub nsw i32 %69, 1
  %cmp103 = icmp slt i32 %68, %sub102
  br i1 %cmp103, label %for.body104, label %for.end208

for.body104:                                      ; preds = %for.cond101
  store i32 1, i32* %j, align 4, !tbaa !3
  br label %for.cond105

for.cond105:                                      ; preds = %for.inc203, %for.body104
  %70 = load i32, i32* %j, align 4, !tbaa !3
  %71 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub106 = sub nsw i32 %71, 1
  %cmp107 = icmp slt i32 %70, %sub106
  br i1 %cmp107, label %for.body108, label %for.end205

for.body108:                                      ; preds = %for.cond105
  store i32 1, i32* %k, align 4, !tbaa !3
  br label %for.cond109

for.cond109:                                      ; preds = %for.inc200, %for.body108
  %72 = load i32, i32* %k, align 4, !tbaa !3
  %73 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub110 = sub nsw i32 %73, 1
  %cmp111 = icmp slt i32 %72, %sub110
  br i1 %cmp111, label %for.body112, label %for.end202

for.body112:                                      ; preds = %for.cond109
  %74 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %75 = load i32, i32* %i, align 4, !tbaa !3
  %add113 = add nsw i32 %75, 1
  %idxprom114 = sext i32 %add113 to i64
  %arrayidx115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %74, i64 %idxprom114
  %76 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom116 = sext i32 %76 to i64
  %arrayidx117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx115, i64 0, i64 %idxprom116
  %77 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom118 = sext i32 %77 to i64
  %arrayidx119 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx117, i64 0, i64 %idxprom118
  %78 = load double, double* %arrayidx119, align 8, !tbaa !9
  %79 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %80 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom120 = sext i32 %80 to i64
  %arrayidx121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %79, i64 %idxprom120
  %81 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom122 = sext i32 %81 to i64
  %arrayidx123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx121, i64 0, i64 %idxprom122
  %82 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom124 = sext i32 %82 to i64
  %arrayidx125 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx123, i64 0, i64 %idxprom124
  %83 = load double, double* %arrayidx125, align 8, !tbaa !9
  %mul126 = fmul double 2.000000e+00, %83
  %sub127 = fsub double %78, %mul126
  %84 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %85 = load i32, i32* %i, align 4, !tbaa !3
  %sub128 = sub nsw i32 %85, 1
  %idxprom129 = sext i32 %sub128 to i64
  %arrayidx130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %84, i64 %idxprom129
  %86 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom131 = sext i32 %86 to i64
  %arrayidx132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx130, i64 0, i64 %idxprom131
  %87 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom133 = sext i32 %87 to i64
  %arrayidx134 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx132, i64 0, i64 %idxprom133
  %88 = load double, double* %arrayidx134, align 8, !tbaa !9
  %add135 = fadd double %sub127, %88
  %mul136 = fmul double 1.250000e-01, %add135
  %89 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %90 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom137 = sext i32 %90 to i64
  %arrayidx138 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %89, i64 %idxprom137
  %91 = load i32, i32* %j, align 4, !tbaa !3
  %add139 = add nsw i32 %91, 1
  %idxprom140 = sext i32 %add139 to i64
  %arrayidx141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx138, i64 0, i64 %idxprom140
  %92 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom142 = sext i32 %92 to i64
  %arrayidx143 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx141, i64 0, i64 %idxprom142
  %93 = load double, double* %arrayidx143, align 8, !tbaa !9
  %94 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %95 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom144 = sext i32 %95 to i64
  %arrayidx145 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %94, i64 %idxprom144
  %96 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom146 = sext i32 %96 to i64
  %arrayidx147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx145, i64 0, i64 %idxprom146
  %97 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom148 = sext i32 %97 to i64
  %arrayidx149 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx147, i64 0, i64 %idxprom148
  %98 = load double, double* %arrayidx149, align 8, !tbaa !9
  %mul150 = fmul double 2.000000e+00, %98
  %sub151 = fsub double %93, %mul150
  %99 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %100 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom152 = sext i32 %100 to i64
  %arrayidx153 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %99, i64 %idxprom152
  %101 = load i32, i32* %j, align 4, !tbaa !3
  %sub154 = sub nsw i32 %101, 1
  %idxprom155 = sext i32 %sub154 to i64
  %arrayidx156 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx153, i64 0, i64 %idxprom155
  %102 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom157 = sext i32 %102 to i64
  %arrayidx158 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx156, i64 0, i64 %idxprom157
  %103 = load double, double* %arrayidx158, align 8, !tbaa !9
  %add159 = fadd double %sub151, %103
  %mul160 = fmul double 1.250000e-01, %add159
  %add161 = fadd double %mul136, %mul160
  %104 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %105 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom162 = sext i32 %105 to i64
  %arrayidx163 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %104, i64 %idxprom162
  %106 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom164 = sext i32 %106 to i64
  %arrayidx165 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx163, i64 0, i64 %idxprom164
  %107 = load i32, i32* %k, align 4, !tbaa !3
  %add166 = add nsw i32 %107, 1
  %idxprom167 = sext i32 %add166 to i64
  %arrayidx168 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx165, i64 0, i64 %idxprom167
  %108 = load double, double* %arrayidx168, align 8, !tbaa !9
  %109 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %110 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom169 = sext i32 %110 to i64
  %arrayidx170 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %109, i64 %idxprom169
  %111 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom171 = sext i32 %111 to i64
  %arrayidx172 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx170, i64 0, i64 %idxprom171
  %112 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom173 = sext i32 %112 to i64
  %arrayidx174 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx172, i64 0, i64 %idxprom173
  %113 = load double, double* %arrayidx174, align 8, !tbaa !9
  %mul175 = fmul double 2.000000e+00, %113
  %sub176 = fsub double %108, %mul175
  %114 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %115 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom177 = sext i32 %115 to i64
  %arrayidx178 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %114, i64 %idxprom177
  %116 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom179 = sext i32 %116 to i64
  %arrayidx180 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx178, i64 0, i64 %idxprom179
  %117 = load i32, i32* %k, align 4, !tbaa !3
  %sub181 = sub nsw i32 %117, 1
  %idxprom182 = sext i32 %sub181 to i64
  %arrayidx183 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx180, i64 0, i64 %idxprom182
  %118 = load double, double* %arrayidx183, align 8, !tbaa !9
  %add184 = fadd double %sub176, %118
  %mul185 = fmul double 1.250000e-01, %add184
  %add186 = fadd double %add161, %mul185
  %119 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8, !tbaa !7
  %120 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom187 = sext i32 %120 to i64
  %arrayidx188 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %119, i64 %idxprom187
  %121 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom189 = sext i32 %121 to i64
  %arrayidx190 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx188, i64 0, i64 %idxprom189
  %122 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom191 = sext i32 %122 to i64
  %arrayidx192 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx190, i64 0, i64 %idxprom191
  %123 = load double, double* %arrayidx192, align 8, !tbaa !9
  %add193 = fadd double %add186, %123
  %124 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %125 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom194 = sext i32 %125 to i64
  %arrayidx195 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %124, i64 %idxprom194
  %126 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom196 = sext i32 %126 to i64
  %arrayidx197 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx195, i64 0, i64 %idxprom196
  %127 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom198 = sext i32 %127 to i64
  %arrayidx199 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx197, i64 0, i64 %idxprom198
  store double %add193, double* %arrayidx199, align 8, !tbaa !9
  br label %for.inc200

for.inc200:                                       ; preds = %for.body112
  %128 = load i32, i32* %k, align 4, !tbaa !3
  %inc201 = add nsw i32 %128, 1
  store i32 %inc201, i32* %k, align 4, !tbaa !3
  br label %for.cond109

for.end202:                                       ; preds = %for.cond109
  br label %for.inc203

for.inc203:                                       ; preds = %for.end202
  %129 = load i32, i32* %j, align 4, !tbaa !3
  %inc204 = add nsw i32 %129, 1
  store i32 %inc204, i32* %j, align 4, !tbaa !3
  br label %for.cond105

for.end205:                                       ; preds = %for.cond105
  br label %for.inc206

for.inc206:                                       ; preds = %for.end205
  %130 = load i32, i32* %i, align 4, !tbaa !3
  %inc207 = add nsw i32 %130, 1
  store i32 %inc207, i32* %i, align 4, !tbaa !3
  br label %for.cond101

for.end208:                                       ; preds = %for.cond101
  br label %for.inc209

for.inc209:                                       ; preds = %for.end208
  %131 = load i32, i32* %t, align 4, !tbaa !3
  %inc210 = add nsw i32 %131, 1
  store i32 %inc210, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.end211:                                       ; preds = %for.cond
  %132 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %132) #3
  %133 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %133) #3
  %134 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %134) #3
  %135 = bitcast i32* %t to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %135) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, [120 x [120 x double]]* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [120 x [120 x double]]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [120 x [120 x double]]* %A, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
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
  %6 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %5, %6
  br i1 %cmp, label %for.body, label %for.end23

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc18, %for.body
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %7, %8
  br i1 %cmp3, label %for.body4, label %for.end20

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %9 = load i32, i32* %k, align 4, !tbaa !3
  %10 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp6 = icmp slt i32 %9, %10
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %12 = load i32, i32* %n.addr, align 4, !tbaa !3
  %mul = mul nsw i32 %11, %12
  %13 = load i32, i32* %n.addr, align 4, !tbaa !3
  %mul8 = mul nsw i32 %mul, %13
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %15 = load i32, i32* %n.addr, align 4, !tbaa !3
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
  %19 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8, !tbaa !7
  %20 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %20 to i64
  %arrayidx = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %idxprom
  %21 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom13 = sext i32 %21 to i64
  %arrayidx14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %arrayidx, i64 0, i64 %idxprom13
  %22 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom15 = sext i32 %22 to i64
  %arrayidx16 = getelementptr inbounds [120 x double], [120 x double]* %arrayidx14, i64 0, i64 %idxprom15
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
