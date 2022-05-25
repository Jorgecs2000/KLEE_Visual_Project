; ModuleID = 'bin_search0.bc'
source_filename = "bin_search0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"searching for %d in:\0A[\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%d]\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"result = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"a[result] == x\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"bin_search0.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"a[i] != x\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_data(i32*, i32, i32) #0 !dbg !7 {
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  call void @llvm.dbg.declare(metadata i32** %4, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !16, metadata !DIExpression()), !dbg !17
  %8 = load i32, i32* %6, align 4, !dbg !18
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i32 %8), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %7, metadata !20, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %7, align 4, !dbg !22
  br label %10, !dbg !23

10:                                               ; preds = %16, %3
  %11 = load i32, i32* %7, align 4, !dbg !24
  %12 = load i32, i32* %5, align 4, !dbg !26
  %13 = sub nsw i32 %12, 1, !dbg !27
  %14 = icmp slt i32 %11, %13, !dbg !28
  %15 = load i32*, i32** %4, align 8, !dbg !29
  br i1 %14, label %16, label %24, !dbg !30

16:                                               ; preds = %10
  %17 = load i32, i32* %7, align 4, !dbg !31
  %18 = sext i32 %17 to i64, !dbg !33
  %19 = getelementptr inbounds i32, i32* %15, i64 %18, !dbg !33
  %20 = load i32, i32* %19, align 4, !dbg !33
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32 %20), !dbg !34
  %22 = load i32, i32* %7, align 4, !dbg !35
  %23 = add nsw i32 %22, 1, !dbg !35
  store i32 %23, i32* %7, align 4, !dbg !35
  br label %10, !dbg !36, !llvm.loop !37

24:                                               ; preds = %10
  %25 = load i32, i32* %5, align 4, !dbg !39
  %26 = sub nsw i32 %25, 1, !dbg !40
  %27 = sext i32 %26 to i64, !dbg !41
  %28 = getelementptr inbounds i32, i32* %15, i64 %27, !dbg !41
  %29 = load i32, i32* %28, align 4, !dbg !41
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %29), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @binary_search(i32*, i32, i32) #0 !dbg !44 {
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  call void @llvm.dbg.declare(metadata i32** %5, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !51, metadata !DIExpression()), !dbg !52
  %11 = load i32*, i32** %5, align 8, !dbg !53
  %12 = load i32, i32* %6, align 4, !dbg !54
  %13 = load i32, i32* %7, align 4, !dbg !55
  call void @print_data(i32* %11, i32 %12, i32 %13), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %8, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 0, i32* %8, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata i32* %9, metadata !59, metadata !DIExpression()), !dbg !60
  %14 = load i32, i32* %6, align 4, !dbg !61
  %15 = sub nsw i32 %14, 1, !dbg !62
  store i32 %15, i32* %9, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata i32* %10, metadata !63, metadata !DIExpression()), !dbg !64
  br label %16, !dbg !65

16:                                               ; preds = %56, %3
  %17 = load i32, i32* %8, align 4, !dbg !66
  %18 = load i32, i32* %9, align 4, !dbg !67
  %19 = icmp sle i32 %17, %18, !dbg !68
  br i1 %19, label %20, label %57, !dbg !65

20:                                               ; preds = %16
  %21 = load i32, i32* %8, align 4, !dbg !69
  %22 = load i32, i32* %9, align 4, !dbg !71
  %23 = add nsw i32 %21, %22, !dbg !72
  %24 = sdiv i32 %23, 2, !dbg !73
  store i32 %24, i32* %10, align 4, !dbg !74
  %25 = load i32*, i32** %5, align 8, !dbg !75
  %26 = load i32, i32* %10, align 4, !dbg !77
  %27 = sext i32 %26 to i64, !dbg !75
  %28 = getelementptr inbounds i32, i32* %25, i64 %27, !dbg !75
  %29 = load i32, i32* %28, align 4, !dbg !75
  %30 = load i32, i32* %7, align 4, !dbg !78
  %31 = icmp eq i32 %29, %30, !dbg !79
  br i1 %31, label %32, label %34, !dbg !80

32:                                               ; preds = %20
  %33 = load i32, i32* %10, align 4, !dbg !81
  store i32 %33, i32* %4, align 4, !dbg !83
  br label %58, !dbg !83

34:                                               ; preds = %20
  %35 = load i32*, i32** %5, align 8, !dbg !84
  %36 = load i32, i32* %10, align 4, !dbg !86
  %37 = sext i32 %36 to i64, !dbg !84
  %38 = getelementptr inbounds i32, i32* %35, i64 %37, !dbg !84
  %39 = load i32, i32* %38, align 4, !dbg !84
  %40 = load i32, i32* %7, align 4, !dbg !87
  %41 = icmp slt i32 %39, %40, !dbg !88
  br i1 %41, label %42, label %45, !dbg !89

42:                                               ; preds = %34
  %43 = load i32, i32* %10, align 4, !dbg !90
  %44 = add nsw i32 %43, 1, !dbg !92
  store i32 %44, i32* %8, align 4, !dbg !93
  br label %45, !dbg !94

45:                                               ; preds = %42, %34
  %46 = load i32*, i32** %5, align 8, !dbg !95
  %47 = load i32, i32* %10, align 4, !dbg !97
  %48 = sext i32 %47 to i64, !dbg !95
  %49 = getelementptr inbounds i32, i32* %46, i64 %48, !dbg !95
  %50 = load i32, i32* %49, align 4, !dbg !95
  %51 = load i32, i32* %7, align 4, !dbg !98
  %52 = icmp sgt i32 %50, %51, !dbg !99
  br i1 %52, label %53, label %56, !dbg !100

53:                                               ; preds = %45
  %54 = load i32, i32* %10, align 4, !dbg !101
  %55 = sub nsw i32 %54, 1, !dbg !103
  store i32 %55, i32* %9, align 4, !dbg !104
  br label %56, !dbg !105

56:                                               ; preds = %53, %45
  br label %16, !dbg !65, !llvm.loop !106

57:                                               ; preds = %16
  store i32 -1, i32* %4, align 4, !dbg !108
  br label %58, !dbg !108

58:                                               ; preds = %57, %32
  %59 = load i32, i32* %4, align 4, !dbg !109
  ret i32 %59, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !110 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %2, metadata !113, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %3, metadata !118, metadata !DIExpression()), !dbg !119
  %6 = bitcast [10 x i32]* %2 to i8*, !dbg !120
  call void @klee_make_symbolic(i8* %6, i64 40, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !121
  %7 = bitcast i32* %3 to i8*, !dbg !122
  call void @klee_make_symbolic(i8* %7, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)), !dbg !123
  call void @llvm.dbg.declare(metadata i32* %4, metadata !124, metadata !DIExpression()), !dbg !125
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0, !dbg !126
  %9 = load i32, i32* %3, align 4, !dbg !127
  %10 = call i32 @binary_search(i32* %8, i32 10, i32 %9), !dbg !128
  store i32 %10, i32* %4, align 4, !dbg !125
  %11 = load i32, i32* %4, align 4, !dbg !129
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 %11), !dbg !130
  %13 = load i32, i32* %4, align 4, !dbg !131
  %14 = icmp ne i32 %13, -1, !dbg !133
  br i1 %14, label %15, label %23, !dbg !134

15:                                               ; preds = %0
  %16 = load i32, i32* %4, align 4, !dbg !135
  %17 = sext i32 %16 to i64, !dbg !135
  %18 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %17, !dbg !135
  %19 = load i32, i32* %18, align 4, !dbg !135
  %20 = load i32, i32* %3, align 4, !dbg !135
  %21 = icmp eq i32 %19, %20, !dbg !135
  br i1 %21, label %38, label %22, !dbg !139

22:                                               ; preds = %15
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i32 42, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !135
  unreachable, !dbg !135

23:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %5, metadata !140, metadata !DIExpression()), !dbg !143
  store i32 0, i32* %5, align 4, !dbg !143
  br label %24, !dbg !144

24:                                               ; preds = %35, %23
  %25 = load i32, i32* %5, align 4, !dbg !145
  %26 = icmp slt i32 %25, 10, !dbg !147
  br i1 %26, label %27, label %38, !dbg !148

27:                                               ; preds = %24
  %28 = load i32, i32* %5, align 4, !dbg !149
  %29 = sext i32 %28 to i64, !dbg !149
  %30 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %29, !dbg !149
  %31 = load i32, i32* %30, align 4, !dbg !149
  %32 = load i32, i32* %3, align 4, !dbg !149
  %33 = icmp ne i32 %31, %32, !dbg !149
  br i1 %33, label %35, label %34, !dbg !153

34:                                               ; preds = %27
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i32 46, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !149
  unreachable, !dbg !149

35:                                               ; preds = %27
  %36 = load i32, i32* %5, align 4, !dbg !154
  %37 = add nsw i32 %36, 1, !dbg !154
  store i32 %37, i32* %5, align 4, !dbg !154
  br label %24, !dbg !155, !llvm.loop !156

38:                                               ; preds = %24, %15
  ret i32 1, !dbg !158
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "bin_search0.c", directory: "/home/jorge/klee/examples/binary")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "print_data", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !11, !11}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "arr", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!13 = !DILocation(line: 5, column: 21, scope: !7)
!14 = !DILocalVariable(name: "size", arg: 2, scope: !7, file: !1, line: 5, type: !11)
!15 = !DILocation(line: 5, column: 32, scope: !7)
!16 = !DILocalVariable(name: "target", arg: 3, scope: !7, file: !1, line: 5, type: !11)
!17 = !DILocation(line: 5, column: 42, scope: !7)
!18 = !DILocation(line: 6, column: 39, scope: !7)
!19 = !DILocation(line: 6, column: 5, scope: !7)
!20 = !DILocalVariable(name: "i", scope: !21, file: !1, line: 7, type: !11)
!21 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 5)
!22 = !DILocation(line: 7, column: 14, scope: !21)
!23 = !DILocation(line: 7, column: 10, scope: !21)
!24 = !DILocation(line: 7, column: 19, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !1, line: 7, column: 5)
!26 = !DILocation(line: 7, column: 23, scope: !25)
!27 = !DILocation(line: 7, column: 27, scope: !25)
!28 = !DILocation(line: 7, column: 21, scope: !25)
!29 = !DILocation(line: 0, scope: !7)
!30 = !DILocation(line: 7, column: 5, scope: !21)
!31 = !DILocation(line: 8, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !1, line: 7, column: 36)
!33 = !DILocation(line: 8, column: 24, scope: !32)
!34 = !DILocation(line: 8, column: 9, scope: !32)
!35 = !DILocation(line: 7, column: 32, scope: !25)
!36 = !DILocation(line: 7, column: 5, scope: !25)
!37 = distinct !{!37, !30, !38}
!38 = !DILocation(line: 9, column: 5, scope: !21)
!39 = !DILocation(line: 10, column: 25, scope: !7)
!40 = !DILocation(line: 10, column: 29, scope: !7)
!41 = !DILocation(line: 10, column: 21, scope: !7)
!42 = !DILocation(line: 10, column: 5, scope: !7)
!43 = !DILocation(line: 11, column: 1, scope: !7)
!44 = distinct !DISubprogram(name: "binary_search", scope: !1, file: !1, line: 13, type: !45, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!11, !10, !11, !11}
!47 = !DILocalVariable(name: "arr", arg: 1, scope: !44, file: !1, line: 13, type: !10)
!48 = !DILocation(line: 13, column: 23, scope: !44)
!49 = !DILocalVariable(name: "size", arg: 2, scope: !44, file: !1, line: 13, type: !11)
!50 = !DILocation(line: 13, column: 34, scope: !44)
!51 = !DILocalVariable(name: "target", arg: 3, scope: !44, file: !1, line: 13, type: !11)
!52 = !DILocation(line: 13, column: 44, scope: !44)
!53 = !DILocation(line: 14, column: 16, scope: !44)
!54 = !DILocation(line: 14, column: 21, scope: !44)
!55 = !DILocation(line: 14, column: 27, scope: !44)
!56 = !DILocation(line: 14, column: 5, scope: !44)
!57 = !DILocalVariable(name: "low", scope: !44, file: !1, line: 15, type: !11)
!58 = !DILocation(line: 15, column: 9, scope: !44)
!59 = !DILocalVariable(name: "high", scope: !44, file: !1, line: 16, type: !11)
!60 = !DILocation(line: 16, column: 9, scope: !44)
!61 = !DILocation(line: 16, column: 16, scope: !44)
!62 = !DILocation(line: 16, column: 21, scope: !44)
!63 = !DILocalVariable(name: "mid", scope: !44, file: !1, line: 17, type: !11)
!64 = !DILocation(line: 17, column: 9, scope: !44)
!65 = !DILocation(line: 18, column: 5, scope: !44)
!66 = !DILocation(line: 18, column: 12, scope: !44)
!67 = !DILocation(line: 18, column: 19, scope: !44)
!68 = !DILocation(line: 18, column: 16, scope: !44)
!69 = !DILocation(line: 19, column: 16, scope: !70)
!70 = distinct !DILexicalBlock(scope: !44, file: !1, line: 18, column: 25)
!71 = !DILocation(line: 19, column: 22, scope: !70)
!72 = !DILocation(line: 19, column: 20, scope: !70)
!73 = !DILocation(line: 19, column: 27, scope: !70)
!74 = !DILocation(line: 19, column: 13, scope: !70)
!75 = !DILocation(line: 20, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !70, file: !1, line: 20, column: 13)
!77 = !DILocation(line: 20, column: 17, scope: !76)
!78 = !DILocation(line: 20, column: 25, scope: !76)
!79 = !DILocation(line: 20, column: 22, scope: !76)
!80 = !DILocation(line: 20, column: 13, scope: !70)
!81 = !DILocation(line: 21, column: 20, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !1, line: 20, column: 33)
!83 = !DILocation(line: 21, column: 13, scope: !82)
!84 = !DILocation(line: 23, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !70, file: !1, line: 23, column: 13)
!86 = !DILocation(line: 23, column: 17, scope: !85)
!87 = !DILocation(line: 23, column: 24, scope: !85)
!88 = !DILocation(line: 23, column: 22, scope: !85)
!89 = !DILocation(line: 23, column: 13, scope: !70)
!90 = !DILocation(line: 24, column: 19, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !1, line: 23, column: 32)
!92 = !DILocation(line: 24, column: 23, scope: !91)
!93 = !DILocation(line: 24, column: 17, scope: !91)
!94 = !DILocation(line: 25, column: 9, scope: !91)
!95 = !DILocation(line: 26, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !70, file: !1, line: 26, column: 13)
!97 = !DILocation(line: 26, column: 17, scope: !96)
!98 = !DILocation(line: 26, column: 24, scope: !96)
!99 = !DILocation(line: 26, column: 22, scope: !96)
!100 = !DILocation(line: 26, column: 13, scope: !70)
!101 = !DILocation(line: 27, column: 20, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !1, line: 26, column: 32)
!103 = !DILocation(line: 27, column: 24, scope: !102)
!104 = !DILocation(line: 27, column: 18, scope: !102)
!105 = !DILocation(line: 28, column: 9, scope: !102)
!106 = distinct !{!106, !65, !107}
!107 = !DILocation(line: 29, column: 5, scope: !44)
!108 = !DILocation(line: 30, column: 5, scope: !44)
!109 = !DILocation(line: 31, column: 1, scope: !44)
!110 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 33, type: !111, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DISubroutineType(types: !112)
!112 = !{!11}
!113 = !DILocalVariable(name: "a", scope: !110, file: !1, line: 34, type: !114)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 10)
!117 = !DILocation(line: 34, column: 7, scope: !110)
!118 = !DILocalVariable(name: "x", scope: !110, file: !1, line: 35, type: !11)
!119 = !DILocation(line: 35, column: 7, scope: !110)
!120 = !DILocation(line: 36, column: 22, scope: !110)
!121 = !DILocation(line: 36, column: 3, scope: !110)
!122 = !DILocation(line: 37, column: 22, scope: !110)
!123 = !DILocation(line: 37, column: 3, scope: !110)
!124 = !DILocalVariable(name: "result", scope: !110, file: !1, line: 38, type: !11)
!125 = !DILocation(line: 38, column: 7, scope: !110)
!126 = !DILocation(line: 38, column: 30, scope: !110)
!127 = !DILocation(line: 38, column: 37, scope: !110)
!128 = !DILocation(line: 38, column: 16, scope: !110)
!129 = !DILocation(line: 39, column: 27, scope: !110)
!130 = !DILocation(line: 39, column: 3, scope: !110)
!131 = !DILocation(line: 41, column: 7, scope: !132)
!132 = distinct !DILexicalBlock(scope: !110, file: !1, line: 41, column: 7)
!133 = !DILocation(line: 41, column: 14, scope: !132)
!134 = !DILocation(line: 41, column: 7, scope: !110)
!135 = !DILocation(line: 42, column: 5, scope: !136)
!136 = distinct !DILexicalBlock(scope: !137, file: !1, line: 42, column: 5)
!137 = distinct !DILexicalBlock(scope: !138, file: !1, line: 42, column: 5)
!138 = distinct !DILexicalBlock(scope: !132, file: !1, line: 41, column: 21)
!139 = !DILocation(line: 42, column: 5, scope: !137)
!140 = !DILocalVariable(name: "i", scope: !141, file: !1, line: 45, type: !11)
!141 = distinct !DILexicalBlock(scope: !142, file: !1, line: 45, column: 5)
!142 = distinct !DILexicalBlock(scope: !132, file: !1, line: 43, column: 10)
!143 = !DILocation(line: 45, column: 14, scope: !141)
!144 = !DILocation(line: 45, column: 10, scope: !141)
!145 = !DILocation(line: 45, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !1, line: 45, column: 5)
!147 = !DILocation(line: 45, column: 23, scope: !146)
!148 = !DILocation(line: 45, column: 5, scope: !141)
!149 = !DILocation(line: 46, column: 7, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !1, line: 46, column: 7)
!151 = distinct !DILexicalBlock(scope: !152, file: !1, line: 46, column: 7)
!152 = distinct !DILexicalBlock(scope: !146, file: !1, line: 45, column: 34)
!153 = !DILocation(line: 46, column: 7, scope: !151)
!154 = !DILocation(line: 45, column: 30, scope: !146)
!155 = !DILocation(line: 45, column: 5, scope: !146)
!156 = distinct !{!156, !148, !157}
!157 = !DILocation(line: 47, column: 5, scope: !141)
!158 = !DILocation(line: 49, column: 3, scope: !110)
