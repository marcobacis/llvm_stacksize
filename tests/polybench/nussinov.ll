; ModuleID = '../medley/nussinov/nussinov.c'
source_filename = "../medley/nussinov/nussinov.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__stderrp = external global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"table\00", align 1
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
  %seq = alloca [2500 x i8]*, align 8
  %table = alloca [2500 x [2500 x i32]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !3
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !7
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  store i32 2500, i32* %n, align 4, !tbaa !3
  %1 = bitcast [2500 x i8]** %seq to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #3
  %call = call i8* @polybench_alloc_data(i64 2500, i32 1)
  %2 = bitcast i8* %call to [2500 x i8]*
  store [2500 x i8]* %2, [2500 x i8]** %seq, align 8, !tbaa !7
  %3 = bitcast [2500 x [2500 x i32]]** %table to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3
  %call1 = call i8* @polybench_alloc_data(i64 6250000, i32 4)
  %4 = bitcast i8* %call1 to [2500 x [2500 x i32]]*
  store [2500 x [2500 x i32]]* %4, [2500 x [2500 x i32]]** %table, align 8, !tbaa !7
  %5 = load i32, i32* %n, align 4, !tbaa !3
  %6 = load [2500 x i8]*, [2500 x i8]** %seq, align 8, !tbaa !7
  %arraydecay = getelementptr inbounds [2500 x i8], [2500 x i8]* %6, i32 0, i32 0
  %7 = load [2500 x [2500 x i32]]*, [2500 x [2500 x i32]]** %table, align 8, !tbaa !7
  %arraydecay2 = getelementptr inbounds [2500 x [2500 x i32]], [2500 x [2500 x i32]]* %7, i32 0, i32 0
  call void @init_array(i32 %5, i8* %arraydecay, [2500 x i32]* %arraydecay2)
  %8 = load i32, i32* %n, align 4, !tbaa !3
  %9 = load [2500 x i8]*, [2500 x i8]** %seq, align 8, !tbaa !7
  %arraydecay3 = getelementptr inbounds [2500 x i8], [2500 x i8]* %9, i32 0, i32 0
  %10 = load [2500 x [2500 x i32]]*, [2500 x [2500 x i32]]** %table, align 8, !tbaa !7
  %arraydecay4 = getelementptr inbounds [2500 x [2500 x i32]], [2500 x [2500 x i32]]* %10, i32 0, i32 0
  call void @kernel_nussinov(i32 %8, i8* %arraydecay3, [2500 x i32]* %arraydecay4)
  %11 = load i32, i32* %argc.addr, align 4, !tbaa !3
  %cmp = icmp sgt i32 %11, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %12 = load i8**, i8*** %argv.addr, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds i8*, i8** %12, i64 0
  %13 = load i8*, i8** %arrayidx, align 8, !tbaa !7
  %call5 = call i32 @strcmp(i8* %13, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call5, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %14 = load i32, i32* %n, align 4, !tbaa !3
  %15 = load [2500 x [2500 x i32]]*, [2500 x [2500 x i32]]** %table, align 8, !tbaa !7
  %arraydecay6 = getelementptr inbounds [2500 x [2500 x i32]], [2500 x [2500 x i32]]* %15, i32 0, i32 0
  call void @print_array(i32 %14, [2500 x i32]* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %16 = load [2500 x i8]*, [2500 x i8]** %seq, align 8, !tbaa !7
  %17 = bitcast [2500 x i8]* %16 to i8*
  call void @free(i8* %17)
  %18 = load [2500 x [2500 x i32]]*, [2500 x [2500 x i32]]** %table, align 8, !tbaa !7
  %19 = bitcast [2500 x [2500 x i32]]* %18 to i8*
  call void @free(i8* %19)
  %20 = bitcast [2500 x [2500 x i32]]** %table to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #3
  %21 = bitcast [2500 x i8]** %seq to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #3
  %22 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind ssp uwtable
define internal void @init_array(i32 %n, i8* %seq, [2500 x i32]* %table) #0 {
entry:
  %n.addr = alloca i32, align 4
  %seq.addr = alloca i8*, align 8
  %table.addr = alloca [2500 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store i8* %seq, i8** %seq.addr, align 8, !tbaa !7
  store [2500 x i32]* %table, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !3
  %3 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %add = add nsw i32 %4, 1
  %rem = srem i32 %add, 4
  %conv = trunc i32 %rem to i8
  %5 = load i8*, i8** %seq.addr, align 8, !tbaa !7
  %6 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !tbaa !3
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc16, %for.end
  %8 = load i32, i32* %i, align 4, !tbaa !3
  %9 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %8, %9
  br i1 %cmp2, label %for.body4, label %for.end18

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %j, align 4, !tbaa !3
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc13, %for.body4
  %10 = load i32, i32* %j, align 4, !tbaa !3
  %11 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp6 = icmp slt i32 %10, %11
  br i1 %cmp6, label %for.body8, label %for.end15

for.body8:                                        ; preds = %for.cond5
  %12 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %13 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom9 = sext i32 %13 to i64
  %arrayidx10 = getelementptr inbounds [2500 x i32], [2500 x i32]* %12, i64 %idxprom9
  %14 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom11 = sext i32 %14 to i64
  %arrayidx12 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx10, i64 0, i64 %idxprom11
  store i32 0, i32* %arrayidx12, align 4, !tbaa !3
  br label %for.inc13

for.inc13:                                        ; preds = %for.body8
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %inc14 = add nsw i32 %15, 1
  store i32 %inc14, i32* %j, align 4, !tbaa !3
  br label %for.cond5

for.end15:                                        ; preds = %for.cond5
  br label %for.inc16

for.inc16:                                        ; preds = %for.end15
  %16 = load i32, i32* %i, align 4, !tbaa !3
  %inc17 = add nsw i32 %16, 1
  store i32 %inc17, i32* %i, align 4, !tbaa !3
  br label %for.cond1

for.end18:                                        ; preds = %for.cond1
  %17 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #3
  %18 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal void @kernel_nussinov(i32 %n, i8* %seq, [2500 x i32]* %table) #0 {
entry:
  %n.addr = alloca i32, align 4
  %seq.addr = alloca i8*, align 8
  %table.addr = alloca [2500 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store i8* %seq, i8** %seq.addr, align 8, !tbaa !7
  store [2500 x i32]* %table, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  %3 = load i32, i32* %n.addr, align 4, !tbaa !3
  %sub = sub nsw i32 %3, 1
  store i32 %sub, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc195, %entry
  %4 = load i32, i32* %i, align 4, !tbaa !3
  %cmp = icmp sge i32 %4, 0
  br i1 %cmp, label %for.body, label %for.end196

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %add = add nsw i32 %5, 1
  store i32 %add, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc192, %for.body
  %6 = load i32, i32* %j, align 4, !tbaa !3
  %7 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %for.body3, label %for.end194

for.body3:                                        ; preds = %for.cond1
  %8 = load i32, i32* %j, align 4, !tbaa !3
  %sub4 = sub nsw i32 %8, 1
  %cmp5 = icmp sge i32 %sub4, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %9 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %10 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [2500 x i32], [2500 x i32]* %9, i64 %idxprom
  %11 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx, i64 0, i64 %idxprom6
  %12 = load i32, i32* %arrayidx7, align 4, !tbaa !3
  %13 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds [2500 x i32], [2500 x i32]* %13, i64 %idxprom8
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %sub10 = sub nsw i32 %15, 1
  %idxprom11 = sext i32 %sub10 to i64
  %arrayidx12 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx9, i64 0, i64 %idxprom11
  %16 = load i32, i32* %arrayidx12, align 4, !tbaa !3
  %cmp13 = icmp sge i32 %12, %16
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %17 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %18 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom14 = sext i32 %18 to i64
  %arrayidx15 = getelementptr inbounds [2500 x i32], [2500 x i32]* %17, i64 %idxprom14
  %19 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom16 = sext i32 %19 to i64
  %arrayidx17 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx15, i64 0, i64 %idxprom16
  %20 = load i32, i32* %arrayidx17, align 4, !tbaa !3
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %21 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %22 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom18 = sext i32 %22 to i64
  %arrayidx19 = getelementptr inbounds [2500 x i32], [2500 x i32]* %21, i64 %idxprom18
  %23 = load i32, i32* %j, align 4, !tbaa !3
  %sub20 = sub nsw i32 %23, 1
  %idxprom21 = sext i32 %sub20 to i64
  %arrayidx22 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx19, i64 0, i64 %idxprom21
  %24 = load i32, i32* %arrayidx22, align 4, !tbaa !3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %20, %cond.true ], [ %24, %cond.false ]
  %25 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %26 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom23 = sext i32 %26 to i64
  %arrayidx24 = getelementptr inbounds [2500 x i32], [2500 x i32]* %25, i64 %idxprom23
  %27 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom25 = sext i32 %27 to i64
  %arrayidx26 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx24, i64 0, i64 %idxprom25
  store i32 %cond, i32* %arrayidx26, align 4, !tbaa !3
  br label %if.end

if.end:                                           ; preds = %cond.end, %for.body3
  %28 = load i32, i32* %i, align 4, !tbaa !3
  %add27 = add nsw i32 %28, 1
  %29 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp28 = icmp slt i32 %add27, %29
  br i1 %cmp28, label %if.then29, label %if.end57

if.then29:                                        ; preds = %if.end
  %30 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %31 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom30 = sext i32 %31 to i64
  %arrayidx31 = getelementptr inbounds [2500 x i32], [2500 x i32]* %30, i64 %idxprom30
  %32 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom32 = sext i32 %32 to i64
  %arrayidx33 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx31, i64 0, i64 %idxprom32
  %33 = load i32, i32* %arrayidx33, align 4, !tbaa !3
  %34 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %35 = load i32, i32* %i, align 4, !tbaa !3
  %add34 = add nsw i32 %35, 1
  %idxprom35 = sext i32 %add34 to i64
  %arrayidx36 = getelementptr inbounds [2500 x i32], [2500 x i32]* %34, i64 %idxprom35
  %36 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom37 = sext i32 %36 to i64
  %arrayidx38 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx36, i64 0, i64 %idxprom37
  %37 = load i32, i32* %arrayidx38, align 4, !tbaa !3
  %cmp39 = icmp sge i32 %33, %37
  br i1 %cmp39, label %cond.true40, label %cond.false45

cond.true40:                                      ; preds = %if.then29
  %38 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %39 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom41 = sext i32 %39 to i64
  %arrayidx42 = getelementptr inbounds [2500 x i32], [2500 x i32]* %38, i64 %idxprom41
  %40 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom43 = sext i32 %40 to i64
  %arrayidx44 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx42, i64 0, i64 %idxprom43
  %41 = load i32, i32* %arrayidx44, align 4, !tbaa !3
  br label %cond.end51

cond.false45:                                     ; preds = %if.then29
  %42 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %43 = load i32, i32* %i, align 4, !tbaa !3
  %add46 = add nsw i32 %43, 1
  %idxprom47 = sext i32 %add46 to i64
  %arrayidx48 = getelementptr inbounds [2500 x i32], [2500 x i32]* %42, i64 %idxprom47
  %44 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom49 = sext i32 %44 to i64
  %arrayidx50 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx48, i64 0, i64 %idxprom49
  %45 = load i32, i32* %arrayidx50, align 4, !tbaa !3
  br label %cond.end51

cond.end51:                                       ; preds = %cond.false45, %cond.true40
  %cond52 = phi i32 [ %41, %cond.true40 ], [ %45, %cond.false45 ]
  %46 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %47 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom53 = sext i32 %47 to i64
  %arrayidx54 = getelementptr inbounds [2500 x i32], [2500 x i32]* %46, i64 %idxprom53
  %48 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom55 = sext i32 %48 to i64
  %arrayidx56 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx54, i64 0, i64 %idxprom55
  store i32 %cond52, i32* %arrayidx56, align 4, !tbaa !3
  br label %if.end57

if.end57:                                         ; preds = %cond.end51, %if.end
  %49 = load i32, i32* %j, align 4, !tbaa !3
  %sub58 = sub nsw i32 %49, 1
  %cmp59 = icmp sge i32 %sub58, 0
  br i1 %cmp59, label %land.lhs.true, label %if.end148

land.lhs.true:                                    ; preds = %if.end57
  %50 = load i32, i32* %i, align 4, !tbaa !3
  %add60 = add nsw i32 %50, 1
  %51 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp61 = icmp slt i32 %add60, %51
  br i1 %cmp61, label %if.then62, label %if.end148

if.then62:                                        ; preds = %land.lhs.true
  %52 = load i32, i32* %i, align 4, !tbaa !3
  %53 = load i32, i32* %j, align 4, !tbaa !3
  %sub63 = sub nsw i32 %53, 1
  %cmp64 = icmp slt i32 %52, %sub63
  br i1 %cmp64, label %if.then65, label %if.else

if.then65:                                        ; preds = %if.then62
  %54 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %55 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom66 = sext i32 %55 to i64
  %arrayidx67 = getelementptr inbounds [2500 x i32], [2500 x i32]* %54, i64 %idxprom66
  %56 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom68 = sext i32 %56 to i64
  %arrayidx69 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx67, i64 0, i64 %idxprom68
  %57 = load i32, i32* %arrayidx69, align 4, !tbaa !3
  %58 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %59 = load i32, i32* %i, align 4, !tbaa !3
  %add70 = add nsw i32 %59, 1
  %idxprom71 = sext i32 %add70 to i64
  %arrayidx72 = getelementptr inbounds [2500 x i32], [2500 x i32]* %58, i64 %idxprom71
  %60 = load i32, i32* %j, align 4, !tbaa !3
  %sub73 = sub nsw i32 %60, 1
  %idxprom74 = sext i32 %sub73 to i64
  %arrayidx75 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx72, i64 0, i64 %idxprom74
  %61 = load i32, i32* %arrayidx75, align 4, !tbaa !3
  %62 = load i8*, i8** %seq.addr, align 8, !tbaa !7
  %63 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom76 = sext i32 %63 to i64
  %arrayidx77 = getelementptr inbounds i8, i8* %62, i64 %idxprom76
  %64 = load i8, i8* %arrayidx77, align 1, !tbaa !9
  %conv = sext i8 %64 to i32
  %65 = load i8*, i8** %seq.addr, align 8, !tbaa !7
  %66 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom78 = sext i32 %66 to i64
  %arrayidx79 = getelementptr inbounds i8, i8* %65, i64 %idxprom78
  %67 = load i8, i8* %arrayidx79, align 1, !tbaa !9
  %conv80 = sext i8 %67 to i32
  %add81 = add nsw i32 %conv, %conv80
  %cmp82 = icmp eq i32 %add81, 3
  %68 = zext i1 %cmp82 to i64
  %cond84 = select i1 %cmp82, i32 1, i32 0
  %add85 = add nsw i32 %61, %cond84
  %cmp86 = icmp sge i32 %57, %add85
  br i1 %cmp86, label %cond.true88, label %cond.false93

cond.true88:                                      ; preds = %if.then65
  %69 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %70 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom89 = sext i32 %70 to i64
  %arrayidx90 = getelementptr inbounds [2500 x i32], [2500 x i32]* %69, i64 %idxprom89
  %71 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom91 = sext i32 %71 to i64
  %arrayidx92 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx90, i64 0, i64 %idxprom91
  %72 = load i32, i32* %arrayidx92, align 4, !tbaa !3
  br label %cond.end111

cond.false93:                                     ; preds = %if.then65
  %73 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %74 = load i32, i32* %i, align 4, !tbaa !3
  %add94 = add nsw i32 %74, 1
  %idxprom95 = sext i32 %add94 to i64
  %arrayidx96 = getelementptr inbounds [2500 x i32], [2500 x i32]* %73, i64 %idxprom95
  %75 = load i32, i32* %j, align 4, !tbaa !3
  %sub97 = sub nsw i32 %75, 1
  %idxprom98 = sext i32 %sub97 to i64
  %arrayidx99 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx96, i64 0, i64 %idxprom98
  %76 = load i32, i32* %arrayidx99, align 4, !tbaa !3
  %77 = load i8*, i8** %seq.addr, align 8, !tbaa !7
  %78 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom100 = sext i32 %78 to i64
  %arrayidx101 = getelementptr inbounds i8, i8* %77, i64 %idxprom100
  %79 = load i8, i8* %arrayidx101, align 1, !tbaa !9
  %conv102 = sext i8 %79 to i32
  %80 = load i8*, i8** %seq.addr, align 8, !tbaa !7
  %81 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom103 = sext i32 %81 to i64
  %arrayidx104 = getelementptr inbounds i8, i8* %80, i64 %idxprom103
  %82 = load i8, i8* %arrayidx104, align 1, !tbaa !9
  %conv105 = sext i8 %82 to i32
  %add106 = add nsw i32 %conv102, %conv105
  %cmp107 = icmp eq i32 %add106, 3
  %83 = zext i1 %cmp107 to i64
  %cond109 = select i1 %cmp107, i32 1, i32 0
  %add110 = add nsw i32 %76, %cond109
  br label %cond.end111

cond.end111:                                      ; preds = %cond.false93, %cond.true88
  %cond112 = phi i32 [ %72, %cond.true88 ], [ %add110, %cond.false93 ]
  %84 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %85 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom113 = sext i32 %85 to i64
  %arrayidx114 = getelementptr inbounds [2500 x i32], [2500 x i32]* %84, i64 %idxprom113
  %86 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom115 = sext i32 %86 to i64
  %arrayidx116 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx114, i64 0, i64 %idxprom115
  store i32 %cond112, i32* %arrayidx116, align 4, !tbaa !3
  br label %if.end147

if.else:                                          ; preds = %if.then62
  %87 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %88 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom117 = sext i32 %88 to i64
  %arrayidx118 = getelementptr inbounds [2500 x i32], [2500 x i32]* %87, i64 %idxprom117
  %89 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom119 = sext i32 %89 to i64
  %arrayidx120 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx118, i64 0, i64 %idxprom119
  %90 = load i32, i32* %arrayidx120, align 4, !tbaa !3
  %91 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %92 = load i32, i32* %i, align 4, !tbaa !3
  %add121 = add nsw i32 %92, 1
  %idxprom122 = sext i32 %add121 to i64
  %arrayidx123 = getelementptr inbounds [2500 x i32], [2500 x i32]* %91, i64 %idxprom122
  %93 = load i32, i32* %j, align 4, !tbaa !3
  %sub124 = sub nsw i32 %93, 1
  %idxprom125 = sext i32 %sub124 to i64
  %arrayidx126 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx123, i64 0, i64 %idxprom125
  %94 = load i32, i32* %arrayidx126, align 4, !tbaa !3
  %cmp127 = icmp sge i32 %90, %94
  br i1 %cmp127, label %cond.true129, label %cond.false134

cond.true129:                                     ; preds = %if.else
  %95 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %96 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom130 = sext i32 %96 to i64
  %arrayidx131 = getelementptr inbounds [2500 x i32], [2500 x i32]* %95, i64 %idxprom130
  %97 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom132 = sext i32 %97 to i64
  %arrayidx133 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx131, i64 0, i64 %idxprom132
  %98 = load i32, i32* %arrayidx133, align 4, !tbaa !3
  br label %cond.end141

cond.false134:                                    ; preds = %if.else
  %99 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %100 = load i32, i32* %i, align 4, !tbaa !3
  %add135 = add nsw i32 %100, 1
  %idxprom136 = sext i32 %add135 to i64
  %arrayidx137 = getelementptr inbounds [2500 x i32], [2500 x i32]* %99, i64 %idxprom136
  %101 = load i32, i32* %j, align 4, !tbaa !3
  %sub138 = sub nsw i32 %101, 1
  %idxprom139 = sext i32 %sub138 to i64
  %arrayidx140 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx137, i64 0, i64 %idxprom139
  %102 = load i32, i32* %arrayidx140, align 4, !tbaa !3
  br label %cond.end141

cond.end141:                                      ; preds = %cond.false134, %cond.true129
  %cond142 = phi i32 [ %98, %cond.true129 ], [ %102, %cond.false134 ]
  %103 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %104 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom143 = sext i32 %104 to i64
  %arrayidx144 = getelementptr inbounds [2500 x i32], [2500 x i32]* %103, i64 %idxprom143
  %105 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom145 = sext i32 %105 to i64
  %arrayidx146 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx144, i64 0, i64 %idxprom145
  store i32 %cond142, i32* %arrayidx146, align 4, !tbaa !3
  br label %if.end147

if.end147:                                        ; preds = %cond.end141, %cond.end111
  br label %if.end148

if.end148:                                        ; preds = %if.end147, %land.lhs.true, %if.end57
  %106 = load i32, i32* %i, align 4, !tbaa !3
  %add149 = add nsw i32 %106, 1
  store i32 %add149, i32* %k, align 4, !tbaa !3
  br label %for.cond150

for.cond150:                                      ; preds = %for.inc, %if.end148
  %107 = load i32, i32* %k, align 4, !tbaa !3
  %108 = load i32, i32* %j, align 4, !tbaa !3
  %cmp151 = icmp slt i32 %107, %108
  br i1 %cmp151, label %for.body153, label %for.end

for.body153:                                      ; preds = %for.cond150
  %109 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %110 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom154 = sext i32 %110 to i64
  %arrayidx155 = getelementptr inbounds [2500 x i32], [2500 x i32]* %109, i64 %idxprom154
  %111 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom156 = sext i32 %111 to i64
  %arrayidx157 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx155, i64 0, i64 %idxprom156
  %112 = load i32, i32* %arrayidx157, align 4, !tbaa !3
  %113 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %114 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom158 = sext i32 %114 to i64
  %arrayidx159 = getelementptr inbounds [2500 x i32], [2500 x i32]* %113, i64 %idxprom158
  %115 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom160 = sext i32 %115 to i64
  %arrayidx161 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx159, i64 0, i64 %idxprom160
  %116 = load i32, i32* %arrayidx161, align 4, !tbaa !3
  %117 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %118 = load i32, i32* %k, align 4, !tbaa !3
  %add162 = add nsw i32 %118, 1
  %idxprom163 = sext i32 %add162 to i64
  %arrayidx164 = getelementptr inbounds [2500 x i32], [2500 x i32]* %117, i64 %idxprom163
  %119 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom165 = sext i32 %119 to i64
  %arrayidx166 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx164, i64 0, i64 %idxprom165
  %120 = load i32, i32* %arrayidx166, align 4, !tbaa !3
  %add167 = add nsw i32 %116, %120
  %cmp168 = icmp sge i32 %112, %add167
  br i1 %cmp168, label %cond.true170, label %cond.false175

cond.true170:                                     ; preds = %for.body153
  %121 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %122 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom171 = sext i32 %122 to i64
  %arrayidx172 = getelementptr inbounds [2500 x i32], [2500 x i32]* %121, i64 %idxprom171
  %123 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom173 = sext i32 %123 to i64
  %arrayidx174 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx172, i64 0, i64 %idxprom173
  %124 = load i32, i32* %arrayidx174, align 4, !tbaa !3
  br label %cond.end186

cond.false175:                                    ; preds = %for.body153
  %125 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %126 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom176 = sext i32 %126 to i64
  %arrayidx177 = getelementptr inbounds [2500 x i32], [2500 x i32]* %125, i64 %idxprom176
  %127 = load i32, i32* %k, align 4, !tbaa !3
  %idxprom178 = sext i32 %127 to i64
  %arrayidx179 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx177, i64 0, i64 %idxprom178
  %128 = load i32, i32* %arrayidx179, align 4, !tbaa !3
  %129 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %130 = load i32, i32* %k, align 4, !tbaa !3
  %add180 = add nsw i32 %130, 1
  %idxprom181 = sext i32 %add180 to i64
  %arrayidx182 = getelementptr inbounds [2500 x i32], [2500 x i32]* %129, i64 %idxprom181
  %131 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom183 = sext i32 %131 to i64
  %arrayidx184 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx182, i64 0, i64 %idxprom183
  %132 = load i32, i32* %arrayidx184, align 4, !tbaa !3
  %add185 = add nsw i32 %128, %132
  br label %cond.end186

cond.end186:                                      ; preds = %cond.false175, %cond.true170
  %cond187 = phi i32 [ %124, %cond.true170 ], [ %add185, %cond.false175 ]
  %133 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %134 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom188 = sext i32 %134 to i64
  %arrayidx189 = getelementptr inbounds [2500 x i32], [2500 x i32]* %133, i64 %idxprom188
  %135 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom190 = sext i32 %135 to i64
  %arrayidx191 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx189, i64 0, i64 %idxprom190
  store i32 %cond187, i32* %arrayidx191, align 4, !tbaa !3
  br label %for.inc

for.inc:                                          ; preds = %cond.end186
  %136 = load i32, i32* %k, align 4, !tbaa !3
  %inc = add nsw i32 %136, 1
  store i32 %inc, i32* %k, align 4, !tbaa !3
  br label %for.cond150

for.end:                                          ; preds = %for.cond150
  br label %for.inc192

for.inc192:                                       ; preds = %for.end
  %137 = load i32, i32* %j, align 4, !tbaa !3
  %inc193 = add nsw i32 %137, 1
  store i32 %inc193, i32* %j, align 4, !tbaa !3
  br label %for.cond1

for.end194:                                       ; preds = %for.cond1
  br label %for.inc195

for.inc195:                                       ; preds = %for.end194
  %138 = load i32, i32* %i, align 4, !tbaa !3
  %dec = add nsw i32 %138, -1
  store i32 %dec, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end196:                                       ; preds = %for.cond
  %139 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %139) #3
  %140 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %140) #3
  %141 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %141) #3
  ret void
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define internal void @print_array(i32 %n, [2500 x i32]* %table) #0 {
entry:
  %n.addr = alloca i32, align 4
  %table.addr = alloca [2500 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !3
  store [2500 x i32]* %table, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #3
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #3
  %2 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  store i32 0, i32* %t, align 4, !tbaa !3
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %4 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.inc11, %entry
  %5 = load i32, i32* %i, align 4, !tbaa !3
  %6 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp = icmp slt i32 %5, %6
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !tbaa !3
  store i32 %7, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %j, align 4, !tbaa !3
  %9 = load i32, i32* %n.addr, align 4, !tbaa !3
  %cmp3 = icmp slt i32 %8, %9
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %10 = load i32, i32* %t, align 4, !tbaa !3
  %rem = srem i32 %10, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %11 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call6 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %12 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %13 = load [2500 x i32]*, [2500 x i32]** %table.addr, align 8, !tbaa !7
  %14 = load i32, i32* %i, align 4, !tbaa !3
  %idxprom = sext i32 %14 to i64
  %arrayidx = getelementptr inbounds [2500 x i32], [2500 x i32]* %13, i64 %idxprom
  %15 = load i32, i32* %j, align 4, !tbaa !3
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds [2500 x i32], [2500 x i32]* %arrayidx, i64 0, i64 %idxprom7
  %16 = load i32, i32* %arrayidx8, align 4, !tbaa !3
  %call9 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i32 %16)
  %17 = load i32, i32* %t, align 4, !tbaa !3
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %t, align 4, !tbaa !3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %18 = load i32, i32* %j, align 4, !tbaa !3
  %inc10 = add nsw i32 %18, 1
  store i32 %inc10, i32* %j, align 4, !tbaa !3
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc11

for.inc11:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !tbaa !3
  %inc12 = add nsw i32 %19, 1
  store i32 %inc12, i32* %i, align 4, !tbaa !3
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  %20 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call14 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  %21 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call15 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %21, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %22 = bitcast i32* %t to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3
  %23 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #3
  %24 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #3
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
!9 = !{!5, !5, i64 0}
