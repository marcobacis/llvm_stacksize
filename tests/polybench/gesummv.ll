; ModuleID = '../linear-algebra/blas/gesummv/gesummv.c'
source_filename = "../linear-algebra/blas/gesummv/gesummv.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stderrp = external local_unnamed_addr global %struct.__sFILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %call3 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %call4 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay5 = bitcast i8* %call1 to [1300 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc24.i, %entry
  %indvars.iv6.i = phi i64 [ 0, %entry ], [ %indvars.iv.next7.i, %for.inc24.i ]
  %0 = trunc i64 %indvars.iv6.i to i32
  %conv.i = sitofp i32 %0 to double
  %div.i = fdiv double %conv.i, 1.300000e+03
  %arrayidx.i = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv6.i
  store double %div.i, double* %arrayidx.i, align 8, !tbaa !3
  br label %for.body5.i

for.body5.i:                                      ; preds = %for.body5.i, %for.body.i
  %indvars.iv.i = phi i64 [ 0, %for.body.i ], [ %indvars.iv.next.i, %for.body5.i ]
  %1 = mul nuw nsw i64 %indvars.iv.i, %indvars.iv6.i
  %2 = trunc i64 %1 to i32
  %3 = add i32 %2, 1
  %rem6.i = urem i32 %3, 1300
  %conv7.i = sitofp i32 %rem6.i to double
  %div9.i = fdiv double %conv7.i, 1.300000e+03
  %arrayidx13.i = getelementptr inbounds [1300 x double], [1300 x double]* %arraydecay, i64 %indvars.iv6.i, i64 %indvars.iv.i
  store double %div9.i, double* %arrayidx13.i, align 8, !tbaa !3
  %4 = add i32 %2, 2
  %rem16.i = urem i32 %4, 1300
  %conv17.i = sitofp i32 %rem16.i to double
  %div19.i = fdiv double %conv17.i, 1.300000e+03
  %arrayidx23.i = getelementptr inbounds [1300 x double], [1300 x double]* %arraydecay5, i64 %indvars.iv6.i, i64 %indvars.iv.i
  store double %div19.i, double* %arrayidx23.i, align 8, !tbaa !3
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1300
  br i1 %exitcond.i, label %for.inc24.i, label %for.body5.i

for.inc24.i:                                      ; preds = %for.body5.i
  %indvars.iv.next7.i = add nuw nsw i64 %indvars.iv6.i, 1
  %exitcond8.i = icmp eq i64 %indvars.iv.next7.i, 1300
  br i1 %exitcond8.i, label %init_array.exit, label %for.body.i

init_array.exit:                                  ; preds = %for.inc24.i
  %arraydecay9 = bitcast i8* %call2 to double*
  %arraydecay11 = bitcast i8* %call4 to double*
  br label %for.body.i37

for.body.i37:                                     ; preds = %for.end.i, %init_array.exit
  %indvars.iv3.i = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next4.i, %for.end.i ]
  %arrayidx.i36 = getelementptr inbounds double, double* %arraydecay9, i64 %indvars.iv3.i
  store double 0.000000e+00, double* %arrayidx.i36, align 8, !tbaa !3
  %arrayidx2.i = getelementptr inbounds double, double* %arraydecay11, i64 %indvars.iv3.i
  store double 0.000000e+00, double* %arrayidx2.i, align 8, !tbaa !3
  br label %for.body5.i41

for.body5.i41:                                    ; preds = %for.body5.i41, %for.body.i37
  %indvars.iv.i38 = phi i64 [ 0, %for.body.i37 ], [ %indvars.iv.next.i39, %for.body5.i41 ]
  %arrayidx9.i = getelementptr inbounds [1300 x double], [1300 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %indvars.iv.i38
  %5 = load double, double* %arrayidx9.i, align 8, !tbaa !3
  %arrayidx11.i = getelementptr inbounds double, double* %arraydecay6, i64 %indvars.iv.i38
  %6 = load double, double* %arrayidx11.i, align 8, !tbaa !3
  %mul.i = fmul double %5, %6
  %7 = load double, double* %arrayidx.i36, align 8, !tbaa !3
  %add.i = fadd double %mul.i, %7
  store double %add.i, double* %arrayidx.i36, align 8, !tbaa !3
  %arrayidx19.i = getelementptr inbounds [1300 x double], [1300 x double]* %arraydecay5, i64 %indvars.iv3.i, i64 %indvars.iv.i38
  %8 = load double, double* %arrayidx19.i, align 8, !tbaa !3
  %9 = load double, double* %arrayidx11.i, align 8, !tbaa !3
  %mul22.i = fmul double %8, %9
  %10 = load double, double* %arrayidx2.i, align 8, !tbaa !3
  %add25.i = fadd double %mul22.i, %10
  store double %add25.i, double* %arrayidx2.i, align 8, !tbaa !3
  %indvars.iv.next.i39 = add nuw nsw i64 %indvars.iv.i38, 1
  %exitcond.i40 = icmp eq i64 %indvars.iv.next.i39, 1300
  br i1 %exitcond.i40, label %for.end.i, label %for.body5.i41

for.end.i:                                        ; preds = %for.body5.i41
  %11 = load double, double* %arrayidx.i36, align 8, !tbaa !3
  %mul30.i = fmul double %11, 1.500000e+00
  %mul33.i = fmul double %add25.i, 1.200000e+00
  %add34.i = fadd double %mul33.i, %mul30.i
  store double %add34.i, double* %arrayidx2.i, align 8, !tbaa !3
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1300
  br i1 %exitcond5.i, label %kernel_gesummv.exit, label %for.body.i37

kernel_gesummv.exit:                              ; preds = %for.end.i
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %kernel_gesummv.exit
  %12 = load i8*, i8** %argv, align 8, !tbaa !7
  %strcmpload = load i8, i8* %12, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %13 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct.__sFILE* %13) #3
  %15 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call1.i = tail call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %15, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #3
  br label %for.body.i32

for.body.i32:                                     ; preds = %if.end.i, %if.then
  %indvars.iv.i31 = phi i64 [ 0, %if.then ], [ %indvars.iv.next.i34, %if.end.i ]
  %16 = trunc i64 %indvars.iv.i31 to i32
  %rem.i = urem i32 %16, 20
  %cmp2.i = icmp eq i32 %rem.i, 0
  br i1 %cmp2.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %for.body.i32
  %17 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %fputc.i = tail call i32 @fputc(i32 10, %struct.__sFILE* %17) #3
  br label %if.end.i

if.end.i:                                         ; preds = %if.then.i, %for.body.i32
  %18 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %arrayidx.i33 = getelementptr inbounds double, double* %arraydecay11, i64 %indvars.iv.i31
  %19 = load double, double* %arrayidx.i33, align 8, !tbaa !3
  %call4.i = tail call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #3
  %indvars.iv.next.i34 = add nuw nsw i64 %indvars.iv.i31, 1
  %exitcond.i35 = icmp eq i64 %indvars.iv.next.i34, 1300
  br i1 %exitcond.i35, label %print_array.exit, label %for.body.i32

print_array.exit:                                 ; preds = %if.end.i
  %20 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %call5.i = tail call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #3
  %21 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8, !tbaa !7
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct.__sFILE* %21) #3
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %print_array.exit, %kernel_gesummv.exit
  tail call void @free(i8* %call)
  tail call void @free(i8* %call1)
  tail call void @free(i8* %call2)
  tail call void @free(i8* %call3)
  tail call void @free(i8* nonnull %call4)
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct.__sFILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct.__sFILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct.__sFILE* nocapture) local_unnamed_addr #3

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 6.0.0 (tags/RELEASE_600/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
