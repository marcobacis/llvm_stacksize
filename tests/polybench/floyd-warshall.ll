; ModuleID = '../medley/floyd-warshall/floyd-warshall.c'
source_filename = "../medley/floyd-warshall/floyd-warshall.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"path\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %path = alloca [2800 x [2800 x i32]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 2800, i32* %n, align 4, !tbaa !3
  %1 = bitcast [2800 x [2800 x i32]]** %path to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #3
  %call = call i8* @polybench_alloc_data(i64 7840000, i32 4)
  %2 = bitcast i8* %call to [2800 x [2800 x i32]]*
  store [2800 x [2800 x i32]]* %2, [2800 x [2800 x i32]]** %path, align 8, !tbaa !7
  %3 = load i32, i32* %n, align 4, !tbaa !3
  %4 = load [2800 x [2800 x i32]]*, [2800 x [2800 x i32]]** %path, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [2800 x [2800 x i32]], [2800 x [2800 x i32]]* %4, i32 0, i32 0
  call void @init_array(i32 %3, [2800 x i32]* %arraydecay)
  %5 = load i32, i32* %n, align 4, !tbaa !3
  %6 = load [2800 x [2800 x i32]]*, [2800 x [2800 x i32]]** %path, align 8, !tbaa !7
  %arraydecay1 = getelementptr inbounds [2800 x [2800 x i32]], [2800 x [2800 x i32]]* %6, i32 0, i32 0
  call void @kernel_floyd_warshall(i32 %5, [2800 x i32]* %arraydecay1)
  %7 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %7, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %8 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %8, i64 0
  %9 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call2 = call i32 @strcmp(i8* %9, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %n, align 4, !tbaa !3
  %11 = load [2800 x [2800 x i32]]*, [2800 x [2800 x i32]]** %path, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [2800 x [2800 x i32]], [2800 x [2800 x i32]]* %11, i32 0, i32 0
  call void @print_array(i32 %10, [2800 x i32]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %12 = load [2800 x [2800 x i32]]*, [2800 x [2800 x i32]]** %path, align 8, !tbaa !7
  %13 = bitcast [2800 x [2800 x i32]]* %12 to i8*
  call void @free(i8* %13)
  %14 = bitcast [2800 x [2800 x i32]]** %path to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #3
  %15 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %n, [2800 x i32]* %path) #0 {
entry:
  %n.addr = alloca i32, align 4
  %path.addr = alloca [2800 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [2800 x i32]* %path, [2800 x i32]** %path.addr, align 8, !tbaa !7
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
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %mul = mul nsw i32 %6, %7
  %rem = srem i32 %mul, 7
  %add = add nsw i32 %rem, 1
  %8 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %9 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [2800 x i32], [2800 x i32]* %8, i64 %idxprom
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom4 = sext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx, i64 0, i64 %idxprom4
  store i32 %add, i32* %arrayidx5, align 4, !tbaa !3
  %11 = load i32, i32* %i, align 4, !tbaa !3
  %12 = load i32, i32* %j, align 4, !tbaa !3
  %add6 = add nsw i32 %11, %12
  %rem7 = srem i32 %add6, 13
  %cmp8 = icmp eq i32 %rem7, 0
  br i1 %cmp8, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body3
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %add9 = add nsw i32 %13, %14
  %rem10 = srem i32 %add9, 7
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false
  %15 = load i32, i32* %i, align 4, !tbaa !3
  %16 = load i32, i32* %j, align 4, !tbaa !3
  %add13 = add nsw i32 %15, %16
  %rem14 = srem i32 %add13, 11
  %cmp15 = icmp eq i32 %rem14, 0
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false12, %lor.lhs.false, %for.body3
  %17 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom16 = sext i32 %18 to i64
  %arrayidx17 = getelementptr inbounds [2800 x i32], [2800 x i32]* %17, i64 %idxprom16
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom18 = sext i32 %19 to i64
  %arrayidx19 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx17, i64 0, i64 %idxprom18
  store i32 999, i32* %arrayidx19, align 4, !tbaa !3
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false12
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %20 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %21 = load i32, i32* %i, align 4, !tbaa !3
  %inc21 = add nsw i32 %21, 1
  store i32 %inc21, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end22:                                        ; preds = %for.cond
  %22 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3
  %23 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_floyd_warshall(i32 %n, [2800 x i32]* %path) #0 {
entry:
  %n.addr = alloca i32, align 4
  %path.addr = alloca [2800 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [2800 x i32]* %path, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %k, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc38, %entry
  %3 = load i32, i32* %k, align 4, !tbaa !3
  %4 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end40

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc35, %for.body
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %6 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end37

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %7 = load i32, i32* %j, align 4, !tbaa !3
  %8 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp5 = icmp slt i32 %7, %8
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %9 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [2800 x i32], [2800 x i32]* %9, i64 %idxprom
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx, i64 0, i64 %idxprom7
  %12 = load i32, i32* %arrayidx8, align 4, !tbaa !3
  %13 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds [2800 x i32], [2800 x i32]* %13, i64 %idxprom9
  %15 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom11 = sext i32 %15 to i64
  %arrayidx12 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx10, i64 0, i64 %idxprom11
  %16 = load i32, i32* %arrayidx12, align 4, !tbaa !3
  %17 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %18 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom13 = sext i32 %18 to i64
  %arrayidx14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %17, i64 %idxprom13
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom15 = sext i32 %19 to i64
  %arrayidx16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx14, i64 0, i64 %idxprom15
  %20 = load i32, i32* %arrayidx16, align 4, !tbaa !3
  %add = add nsw i32 %16, %20
  %cmp17 = icmp slt i32 %12, %add
  br i1 %cmp17, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body6
  %21 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom18 = sext i32 %22 to i64
  %arrayidx19 = getelementptr inbounds [2800 x i32], [2800 x i32]* %21, i64 %idxprom18
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom20 = sext i32 %23 to i64
  %arrayidx21 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx19, i64 0, i64 %idxprom20
  %24 = load i32, i32* %arrayidx21, align 4, !tbaa !3
  br label %cond.end

cond.false:                                       ; preds = %for.body6
  %25 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom22 = sext i32 %26 to i64
  %arrayidx23 = getelementptr inbounds [2800 x i32], [2800 x i32]* %25, i64 %idxprom22
  %27 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom24 = sext i32 %27 to i64
  %arrayidx25 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx23, i64 0, i64 %idxprom24
  %28 = load i32, i32* %arrayidx25, align 4, !tbaa !3
  %29 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %30 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom26 = sext i32 %30 to i64
  %arrayidx27 = getelementptr inbounds [2800 x i32], [2800 x i32]* %29, i64 %idxprom26
  %31 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom28 = sext i32 %31 to i64
  %arrayidx29 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx27, i64 0, i64 %idxprom28
  %32 = load i32, i32* %arrayidx29, align 4, !tbaa !3
  %add30 = add nsw i32 %28, %32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %24, %cond.true ], [ %add30, %cond.false ]
  %33 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %34 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom31 = sext i32 %34 to i64
  %arrayidx32 = getelementptr inbounds [2800 x i32], [2800 x i32]* %33, i64 %idxprom31
  %35 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom33 = sext i32 %35 to i64
  %arrayidx34 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx32, i64 0, i64 %idxprom33
  store i32 %cond, i32* %arrayidx34, align 4, !tbaa !3
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %36 = load i32, i32* %j, align 4, !tbaa !3
  %inc = add nsw i32 %36, 1
  store i32 %inc, i32* %j, align 4, !tbaa !3
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc35

for.inc35:                                        ; preds = %for.end
  %37 = load i32, i32* %i, align 4, !tbaa !3
  %inc36 = add nsw i32 %37, 1
  store i32 %inc36, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end37:                                        ; preds = %for.cond1
  br label %for.inc38

for.inc38:                                        ; preds = %for.end37
  %38 = load i32, i32* %k, align 4, !tbaa !3
  %inc39 = add nsw i32 %38, 1
  store i32 %inc39, i32* %k, align 4, !tbaa !3
  br label %for.cond

for.end40:                                        ; preds = %for.cond
  %39 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #3
  %40 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #3
  %41 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, [2800 x i32]* %path) #0 {
entry:
  %n.addr = alloca i32, align 4
  %path.addr = alloca [2800 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [2800 x i32]* %path, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %2, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
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
  %13 = load [2800 x i32]*, [2800 x i32]** %path.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds [2800 x i32], [2800 x i32]* %13, i64 %idxprom
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %arrayidx, i64 0, i64 %idxprom7
  %16 = load i32, i32* %arrayidx8, align 4, !tbaa !3
  %call9 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i32 %16)
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
  %call13 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
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
