; ModuleID = 'bin_search.bc'
source_filename = "bin_search.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"searching for %d in:\0A[\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%d]\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"result = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"a[result] == x\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"bin_search.c\00", align 1
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
define dso_local i32 @sorted(i32*, i32) #0 !dbg !110 {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  call void @llvm.dbg.declare(metadata i32** %3, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %5, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 0, i32* %5, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata i32* %6, metadata !119, metadata !DIExpression()), !dbg !121
  store i32 0, i32* %6, align 4, !dbg !121
  br label %7, !dbg !122

7:                                                ; preds = %13, %2
  %8 = load i32, i32* %6, align 4, !dbg !123
  %9 = load i32, i32* %4, align 4, !dbg !125
  %10 = sub nsw i32 %9, 1, !dbg !126
  %11 = icmp slt i32 %8, %10, !dbg !127
  %12 = load i32, i32* %5, align 4, !dbg !128
  br i1 %11, label %13, label %30, !dbg !129

13:                                               ; preds = %7
  %14 = load i32*, i32** %3, align 8, !dbg !130
  %15 = load i32, i32* %6, align 4, !dbg !132
  %16 = sext i32 %15 to i64, !dbg !130
  %17 = getelementptr inbounds i32, i32* %14, i64 %16, !dbg !130
  %18 = load i32, i32* %17, align 4, !dbg !130
  %19 = load i32*, i32** %3, align 8, !dbg !133
  %20 = load i32, i32* %6, align 4, !dbg !134
  %21 = add nsw i32 %20, 1, !dbg !135
  %22 = sext i32 %21 to i64, !dbg !133
  %23 = getelementptr inbounds i32, i32* %19, i64 %22, !dbg !133
  %24 = load i32, i32* %23, align 4, !dbg !133
  %25 = icmp sgt i32 %18, %24, !dbg !136
  %26 = zext i1 %25 to i32, !dbg !136
  %27 = or i32 %12, %26, !dbg !137
  store i32 %27, i32* %5, align 4, !dbg !138
  %28 = load i32, i32* %6, align 4, !dbg !139
  %29 = add nsw i32 %28, 1, !dbg !139
  store i32 %29, i32* %6, align 4, !dbg !139
  br label %7, !dbg !140, !llvm.loop !141

30:                                               ; preds = %7
  %31 = icmp ne i32 %12, 0, !dbg !143
  %32 = xor i1 %31, true, !dbg !143
  %33 = zext i1 %32 to i32, !dbg !143
  ret i32 %33, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !145 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %2, metadata !148, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i32* %3, metadata !153, metadata !DIExpression()), !dbg !154
  %6 = bitcast [10 x i32]* %2 to i8*, !dbg !155
  call void @klee_make_symbolic(i8* %6, i64 40, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !156
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0, !dbg !157
  %8 = call i32 @sorted(i32* %7, i32 10), !dbg !158
  %9 = sext i32 %8 to i64, !dbg !158
  call void @klee_assume(i64 %9), !dbg !159
  %10 = bitcast i32* %3 to i8*, !dbg !160
  call void @klee_make_symbolic(i8* %10, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)), !dbg !161
  call void @llvm.dbg.declare(metadata i32* %4, metadata !162, metadata !DIExpression()), !dbg !163
  %11 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0, !dbg !164
  %12 = load i32, i32* %3, align 4, !dbg !165
  %13 = call i32 @binary_search(i32* %11, i32 10, i32 %12), !dbg !166
  store i32 %13, i32* %4, align 4, !dbg !163
  %14 = load i32, i32* %4, align 4, !dbg !167
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i32 %14), !dbg !168
  %16 = load i32, i32* %4, align 4, !dbg !169
  %17 = icmp ne i32 %16, -1, !dbg !171
  br i1 %17, label %18, label %26, !dbg !172

18:                                               ; preds = %0
  %19 = load i32, i32* %4, align 4, !dbg !173
  %20 = sext i32 %19 to i64, !dbg !173
  %21 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %20, !dbg !173
  %22 = load i32, i32* %21, align 4, !dbg !173
  %23 = load i32, i32* %3, align 4, !dbg !173
  %24 = icmp eq i32 %22, %23, !dbg !173
  br i1 %24, label %41, label %25, !dbg !177

25:                                               ; preds = %18
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i64 0, i64 0), i32 50, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !173
  unreachable, !dbg !173

26:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %5, metadata !178, metadata !DIExpression()), !dbg !181
  store i32 0, i32* %5, align 4, !dbg !181
  br label %27, !dbg !182

27:                                               ; preds = %38, %26
  %28 = load i32, i32* %5, align 4, !dbg !183
  %29 = icmp slt i32 %28, 10, !dbg !185
  br i1 %29, label %30, label %41, !dbg !186

30:                                               ; preds = %27
  %31 = load i32, i32* %5, align 4, !dbg !187
  %32 = sext i32 %31 to i64, !dbg !187
  %33 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %32, !dbg !187
  %34 = load i32, i32* %33, align 4, !dbg !187
  %35 = load i32, i32* %3, align 4, !dbg !187
  %36 = icmp ne i32 %34, %35, !dbg !187
  br i1 %36, label %38, label %37, !dbg !191

37:                                               ; preds = %30
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i64 0, i64 0), i32 54, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #4, !dbg !187
  unreachable, !dbg !187

38:                                               ; preds = %30
  %39 = load i32, i32* %5, align 4, !dbg !192
  %40 = add nsw i32 %39, 1, !dbg !192
  store i32 %40, i32* %5, align 4, !dbg !192
  br label %27, !dbg !193, !llvm.loop !194

41:                                               ; preds = %27, %18
  ret i32 1, !dbg !196
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

declare dso_local void @klee_assume(i64) #2

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
!1 = !DIFile(filename: "bin_search.c", directory: "/home/jorge/klee/examples/binary")
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
!110 = distinct !DISubprogram(name: "sorted", scope: !1, file: !1, line: 33, type: !111, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DISubroutineType(types: !112)
!112 = !{!11, !10, !11}
!113 = !DILocalVariable(name: "arr", arg: 1, scope: !110, file: !1, line: 33, type: !10)
!114 = !DILocation(line: 33, column: 16, scope: !110)
!115 = !DILocalVariable(name: "size", arg: 2, scope: !110, file: !1, line: 33, type: !11)
!116 = !DILocation(line: 33, column: 27, scope: !110)
!117 = !DILocalVariable(name: "found_error", scope: !110, file: !1, line: 34, type: !11)
!118 = !DILocation(line: 34, column: 9, scope: !110)
!119 = !DILocalVariable(name: "i", scope: !120, file: !1, line: 35, type: !11)
!120 = distinct !DILexicalBlock(scope: !110, file: !1, line: 35, column: 5)
!121 = !DILocation(line: 35, column: 14, scope: !120)
!122 = !DILocation(line: 35, column: 10, scope: !120)
!123 = !DILocation(line: 35, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !1, line: 35, column: 5)
!125 = !DILocation(line: 35, column: 25, scope: !124)
!126 = !DILocation(line: 35, column: 29, scope: !124)
!127 = !DILocation(line: 35, column: 23, scope: !124)
!128 = !DILocation(line: 0, scope: !110)
!129 = !DILocation(line: 35, column: 5, scope: !120)
!130 = !DILocation(line: 36, column: 38, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !1, line: 35, column: 38)
!132 = !DILocation(line: 36, column: 42, scope: !131)
!133 = !DILocation(line: 36, column: 47, scope: !131)
!134 = !DILocation(line: 36, column: 51, scope: !131)
!135 = !DILocation(line: 36, column: 52, scope: !131)
!136 = !DILocation(line: 36, column: 45, scope: !131)
!137 = !DILocation(line: 36, column: 35, scope: !131)
!138 = !DILocation(line: 36, column: 21, scope: !131)
!139 = !DILocation(line: 35, column: 34, scope: !124)
!140 = !DILocation(line: 35, column: 5, scope: !124)
!141 = distinct !{!141, !129, !142}
!142 = !DILocation(line: 37, column: 5, scope: !120)
!143 = !DILocation(line: 38, column: 12, scope: !110)
!144 = !DILocation(line: 38, column: 5, scope: !110)
!145 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 41, type: !146, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DISubroutineType(types: !147)
!147 = !{!11}
!148 = !DILocalVariable(name: "a", scope: !145, file: !1, line: 42, type: !149)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !150)
!150 = !{!151}
!151 = !DISubrange(count: 10)
!152 = !DILocation(line: 42, column: 7, scope: !145)
!153 = !DILocalVariable(name: "x", scope: !145, file: !1, line: 43, type: !11)
!154 = !DILocation(line: 43, column: 7, scope: !145)
!155 = !DILocation(line: 44, column: 22, scope: !145)
!156 = !DILocation(line: 44, column: 3, scope: !145)
!157 = !DILocation(line: 45, column: 22, scope: !145)
!158 = !DILocation(line: 45, column: 15, scope: !145)
!159 = !DILocation(line: 45, column: 3, scope: !145)
!160 = !DILocation(line: 46, column: 22, scope: !145)
!161 = !DILocation(line: 46, column: 3, scope: !145)
!162 = !DILocalVariable(name: "result", scope: !145, file: !1, line: 47, type: !11)
!163 = !DILocation(line: 47, column: 7, scope: !145)
!164 = !DILocation(line: 47, column: 30, scope: !145)
!165 = !DILocation(line: 47, column: 37, scope: !145)
!166 = !DILocation(line: 47, column: 16, scope: !145)
!167 = !DILocation(line: 48, column: 27, scope: !145)
!168 = !DILocation(line: 48, column: 3, scope: !145)
!169 = !DILocation(line: 49, column: 7, scope: !170)
!170 = distinct !DILexicalBlock(scope: !145, file: !1, line: 49, column: 7)
!171 = !DILocation(line: 49, column: 14, scope: !170)
!172 = !DILocation(line: 49, column: 7, scope: !145)
!173 = !DILocation(line: 50, column: 5, scope: !174)
!174 = distinct !DILexicalBlock(scope: !175, file: !1, line: 50, column: 5)
!175 = distinct !DILexicalBlock(scope: !176, file: !1, line: 50, column: 5)
!176 = distinct !DILexicalBlock(scope: !170, file: !1, line: 49, column: 21)
!177 = !DILocation(line: 50, column: 5, scope: !175)
!178 = !DILocalVariable(name: "i", scope: !179, file: !1, line: 53, type: !11)
!179 = distinct !DILexicalBlock(scope: !180, file: !1, line: 53, column: 5)
!180 = distinct !DILexicalBlock(scope: !170, file: !1, line: 51, column: 10)
!181 = !DILocation(line: 53, column: 14, scope: !179)
!182 = !DILocation(line: 53, column: 10, scope: !179)
!183 = !DILocation(line: 53, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !179, file: !1, line: 53, column: 5)
!185 = !DILocation(line: 53, column: 23, scope: !184)
!186 = !DILocation(line: 53, column: 5, scope: !179)
!187 = !DILocation(line: 54, column: 7, scope: !188)
!188 = distinct !DILexicalBlock(scope: !189, file: !1, line: 54, column: 7)
!189 = distinct !DILexicalBlock(scope: !190, file: !1, line: 54, column: 7)
!190 = distinct !DILexicalBlock(scope: !184, file: !1, line: 53, column: 34)
!191 = !DILocation(line: 54, column: 7, scope: !189)
!192 = !DILocation(line: 53, column: 30, scope: !184)
!193 = !DILocation(line: 53, column: 5, scope: !184)
!194 = distinct !{!194, !186, !195}
!195 = !DILocation(line: 55, column: 5, scope: !179)
!196 = !DILocation(line: 56, column: 6, scope: !145)
