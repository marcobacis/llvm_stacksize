; ModuleID = '../stencils/jacobi-2d/jacobi-2d.c'
source_filename = "../stencils/jacobi-2d/jacobi-2d.c"
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
  %A = alloca [1300 x [1300 x double]]*, align 8
  %B = alloca [1300 x [1300 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 1300, i32* %n, align 4, !tbaa !3
  %1 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 500, i32* %tsteps, align 4, !tbaa !3
  %2 = bitcast [1300 x [1300 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #3
  %call = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %3 = bitcast i8* %call to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %3, [1300 x [1300 x double]]** %A, align 8, !tbaa !7
  %4 = bitcast [1300 x [1300 x double]]** %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3
  %call1 = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %5 = bitcast i8* %call1 to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %5, [1300 x [1300 x double]]** %B, align 8, !tbaa !7
  %6 = load i32, i32* %n, align 4, !tbaa !3
  %7 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %A, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %7, i32 0, i32 0
  %8 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %B, align 8, !tbaa !7
  %arraydecay2 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %8, i32 0, i32 0
  call void @init_array(i32 %6, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  %9 = load i32, i32* %tsteps, align 4, !tbaa !3
  %10 = load i32, i32* %n, align 4, !tbaa !3
  %11 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %A, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %11, i32 0, i32 0
  %12 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %B, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %12, i32 0, i32 0
  call void @kernel_jacobi_2d(i32 %9, i32 %10, [1300 x double]* %arraydecay3, [1300 x double]* %arraydecay4)
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
  %17 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %A, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %17, i32 0, i32 0
  call void @print_array(i32 %16, [1300 x double]* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %18 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %A, align 8, !tbaa !7
  %19 = bitcast [1300 x [1300 x double]]* %18 to i8*
  call void @free(i8* %19)
  %20 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %B, align 8, !tbaa !7
  %21 = bitcast [1300 x [1300 x double]]* %20 to i8*
  call void @free(i8* %21)
  %22 = bitcast [1300 x [1300 x double]]** %B to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %22) #3
  %23 = bitcast [1300 x [1300 x double]]** %A to i8*
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
define internal void @init_array(i32 %n, [1300 x double]* %A, [1300 x double]* %B) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1300 x double]*, align 8
  %B.addr = alloca [1300 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1300 x double]* %A, [1300 x double]** %A.addr, align 8, !tbaa !7
  store [1300 x double]* %B, [1300 x double]** %B.addr, align 8, !tbaa !7
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
  %9 = load [1300 x double]*, [1300 x double]** %A.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [1300 x double], [1300 x double]* %9, i64 %idxprom
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx, i64 0, i64 %idxprom7
  store double %div, double* %arrayidx8, align 8, !tbaa !9
  %12 = load i32, i32* %i, align 4, !tbaa !3
  %conv9 = sitofp i32 %12 to double
  %13 = load i32, i32* %j, align 4, !tbaa !3
  %add10 = add nsw i32 %13, 3
  %conv11 = sitofp i32 %add10 to double
  %mul12 = fmul double %conv9, %conv11
  %add13 = fadd double %mul12, 3.000000e+00
  %14 = load i32, i32* %n.addr, align 4, !tbaa !3
  %conv14 = sitofp i32 %14 to double
  %div15 = fdiv double %add13, %conv14
  %15 = load [1300 x double]*, [1300 x double]** %B.addr, align 8, !tbaa !7
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom16 = sext i32 %16 to i64
  %arrayidx17 = getelementptr inbounds [1300 x double], [1300 x double]* %15, i64 %idxprom16
  %17 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom18 = sext i32 %17 to i64
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx17, i64 0, i64 %idxprom18
  store double %div15, double* %arrayidx19, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %18 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %inc21 = add nsw i32 %19, 1
  store i32 %inc21, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end22:                                        ; preds = %for.cond
  %20 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #3
  %21 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* %A, [1300 x double]* %B) #0 {
entry:
  %tsteps.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1300 x double]*, align 8
  %B.addr = alloca [1300 x double]*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tsteps, i32* %tsteps.addr, align 4, !tbaa !3
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1300 x double]* %A, [1300 x double]** %A.addr, align 8, !tbaa !7
  store [1300 x double]* %B, [1300 x double]** %B.addr, align 8, !tbaa !7
  %0 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc87, %entry
  %3 = load i32, i32* %t, align 4, !tbaa !3
  %4 = load i32, i32* %tsteps.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end89

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc37, %for.body
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %6 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub = sub nsw i32 %6, 1
  %cmp2 = icmp slt i32 %5, %sub
  br i1 %cmp2, label %for.body3, label %for.end39

for.body3:                                        ; preds = %for.cond1
  store i32 1, i32* %j, align 4, !tbaa !3
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub5 = sub nsw i32 %8, 1
  %cmp6 = icmp slt i32 %7, %sub5
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond4
  %9 = load [1300 x double]*, [1300 x double]** %A.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [1300 x double], [1300 x double]* %9, i64 %idxprom
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom8 = sext i32 %11 to i64
  %arrayidx9 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx, i64 0, i64 %idxprom8
  %12 = load double, double* %arrayidx9, align 8, !tbaa !9
  %13 = load [1300 x double]*, [1300 x double]** %A.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom10 = sext i32 %14 to i64
  %arrayidx11 = getelementptr inbounds [1300 x double], [1300 x double]* %13, i64 %idxprom10
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %sub12 = sub nsw i32 %15, 1
  %idxprom13 = sext i32 %sub12 to i64
  %arrayidx14 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx11, i64 0, i64 %idxprom13
  %16 = load double, double* %arrayidx14, align 8, !tbaa !9
  %add = fadd double %12, %16
  %17 = load [1300 x double]*, [1300 x double]** %A.addr, align 8, !tbaa !7
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom15 = sext i32 %18 to i64
  %arrayidx16 = getelementptr inbounds [1300 x double], [1300 x double]* %17, i64 %idxprom15
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %add17 = add nsw i32 1, %19
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx16, i64 0, i64 %idxprom18
  %20 = load double, double* %arrayidx19, align 8, !tbaa !9
  %add20 = fadd double %add, %20
  %21 = load [1300 x double]*, [1300 x double]** %A.addr, align 8, !tbaa !7
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %add21 = add nsw i32 1, %22
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [1300 x double], [1300 x double]* %21, i64 %idxprom22
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom24 = sext i32 %23 to i64
  %arrayidx25 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx23, i64 0, i64 %idxprom24
  %24 = load double, double* %arrayidx25, align 8, !tbaa !9
  %add26 = fadd double %add20, %24
  %25 = load [1300 x double]*, [1300 x double]** %A.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %sub27 = sub nsw i32 %26, 1
  %idxprom28 = sext i32 %sub27 to i64
  %arrayidx29 = getelementptr inbounds [1300 x double], [1300 x double]* %25, i64 %idxprom28
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom30 = sext i32 %27 to i64
  %arrayidx31 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx29, i64 0, i64 %idxprom30
  %28 = load double, double* %arrayidx31, align 8, !tbaa !9
  %add32 = fadd double %add26, %28
  %mul = fmul double 2.000000e-01, %add32
  %29 = load [1300 x double]*, [1300 x double]** %B.addr, align 8, !tbaa !7
  %30 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom33 = sext i32 %30 to i64
  %arrayidx34 = getelementptr inbounds [1300 x double], [1300 x double]* %29, i64 %idxprom33
  %31 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom35 = sext i32 %31 to i64
  %arrayidx36 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx34, i64 0, i64 %idxprom35
  store double %mul, double* %arrayidx36, align 8, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %32 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc37

for.inc37:                                        ; preds = %for.end
  %33 = load i32, i32* %i, align 4, !tbaa !3
  %inc38 = add nsw i32 %33, 1
  store i32 %inc38, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end39:                                        ; preds = %for.cond1
  store i32 1, i32* %i, align 4, !tbaa !3
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc84, %for.end39
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %35 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub41 = sub nsw i32 %35, 1
  %cmp42 = icmp slt i32 %34, %sub41
  br i1 %cmp42, label %for.body43, label %for.end86

for.body43:                                       ; preds = %for.cond40
  store i32 1, i32* %j, align 4, !tbaa !3
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc81, %for.body43
  %36 = load i32, i32* %j, align 4, !tbaa !3
  %37 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub45 = sub nsw i32 %37, 1
  %cmp46 = icmp slt i32 %36, %sub45
  br i1 %cmp46, label %for.body47, label %for.end83

for.body47:                                       ; preds = %for.cond44
  %38 = load [1300 x double]*, [1300 x double]** %B.addr, align 8, !tbaa !7
  %39 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom48 = sext i32 %39 to i64
  %arrayidx49 = getelementptr inbounds [1300 x double], [1300 x double]* %38, i64 %idxprom48
  %40 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom50 = sext i32 %40 to i64
  %arrayidx51 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx49, i64 0, i64 %idxprom50
  %41 = load double, double* %arrayidx51, align 8, !tbaa !9
  %42 = load [1300 x double]*, [1300 x double]** %B.addr, align 8, !tbaa !7
  %43 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom52 = sext i32 %43 to i64
  %arrayidx53 = getelementptr inbounds [1300 x double], [1300 x double]* %42, i64 %idxprom52
  %44 = load i32, i32* %j, align 4, !tbaa !3
  %sub54 = sub nsw i32 %44, 1
  %idxprom55 = sext i32 %sub54 to i64
  %arrayidx56 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx53, i64 0, i64 %idxprom55
  %45 = load double, double* %arrayidx56, align 8, !tbaa !9
  %add57 = fadd double %41, %45
  %46 = load [1300 x double]*, [1300 x double]** %B.addr, align 8, !tbaa !7
  %47 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom58 = sext i32 %47 to i64
  %arrayidx59 = getelementptr inbounds [1300 x double], [1300 x double]* %46, i64 %idxprom58
  %48 = load i32, i32* %j, align 4, !tbaa !3
  %add60 = add nsw i32 1, %48
  %idxprom61 = sext i32 %add60 to i64
  %arrayidx62 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx59, i64 0, i64 %idxprom61
  %49 = load double, double* %arrayidx62, align 8, !tbaa !9
  %add63 = fadd double %add57, %49
  %50 = load [1300 x double]*, [1300 x double]** %B.addr, align 8, !tbaa !7
  %51 = load i32, i32* %i, align 4, !tbaa !3
  %add64 = add nsw i32 1, %51
  %idxprom65 = sext i32 %add64 to i64
  %arrayidx66 = getelementptr inbounds [1300 x double], [1300 x double]* %50, i64 %idxprom65
  %52 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom67 = sext i32 %52 to i64
  %arrayidx68 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx66, i64 0, i64 %idxprom67
  %53 = load double, double* %arrayidx68, align 8, !tbaa !9
  %add69 = fadd double %add63, %53
  %54 = load [1300 x double]*, [1300 x double]** %B.addr, align 8, !tbaa !7
  %55 = load i32, i32* %i, align 4, !tbaa !3
  %sub70 = sub nsw i32 %55, 1
  %idxprom71 = sext i32 %sub70 to i64
  %arrayidx72 = getelementptr inbounds [1300 x double], [1300 x double]* %54, i64 %idxprom71
  %56 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom73 = sext i32 %56 to i64
  %arrayidx74 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx72, i64 0, i64 %idxprom73
  %57 = load double, double* %arrayidx74, align 8, !tbaa !9
  %add75 = fadd double %add69, %57
  %mul76 = fmul double 2.000000e-01, %add75
  %58 = load [1300 x double]*, [1300 x double]** %A.addr, align 8, !tbaa !7
  %59 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom77 = sext i32 %59 to i64
  %arrayidx78 = getelementptr inbounds [1300 x double], [1300 x double]* %58, i64 %idxprom77
  %60 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom79 = sext i32 %60 to i64
  %arrayidx80 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx78, i64 0, i64 %idxprom79
  store double %mul76, double* %arrayidx80, align 8, !tbaa !9
  br label %for.inc81

for.inc81:                                        ; preds = %for.body47
  %61 = load i32, i32* %j, align 4, !tbaa !3
  %inc82 = add nsw i32 %61, 1
  store i32 %inc82, i32* %j, align 4, !tbaa !3
  br label %for.cond44

for.end83:                                        ; preds = %for.cond44
  br label %for.inc84

for.inc84:                                        ; preds = %for.end83
  %62 = load i32, i32* %i, align 4, !tbaa !3
  %inc85 = add nsw i32 %62, 1
  store i32 %inc85, i32* %i, align 4, !tbaa !3
  br label %for.cond40

for.end86:                                        ; preds = %for.cond40
  br label %for.inc87

for.inc87:                                        ; preds = %for.end86
  %63 = load i32, i32* %t, align 4, !tbaa !3
  %inc88 = add nsw i32 %63, 1
  store i32 %inc88, i32* %t, align 4, !tbaa !3
  br label %for.cond

for.end89:                                        ; preds = %for.cond
  %64 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %64) #3
  %65 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %65) #3
  %66 = bitcast i32* %t to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %66) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, [1300 x double]* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1300 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [1300 x double]* %A, [1300 x double]** %A.addr, align 8, !tbaa !7
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
  %13 = load [1300 x double]*, [1300 x double]** %A.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds [1300 x double], [1300 x double]* %13, i64 %idxprom
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %arrayidx, i64 0, i64 %idxprom7
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
