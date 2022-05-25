; ModuleID = 'Regexp.bc'
source_filename = "Regexp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"re\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"hello\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @match(i8*, i8*) #0 !dbg !7 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !13, metadata !DIExpression()), !dbg !14
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !15, metadata !DIExpression()), !dbg !16
  %6 = load i8*, i8** %4, align 8, !dbg !17
  %7 = getelementptr inbounds i8, i8* %6, i64 0, !dbg !17
  %8 = load i8, i8* %7, align 1, !dbg !17
  %9 = sext i8 %8 to i32, !dbg !17
  %10 = icmp eq i32 %9, 94, !dbg !19
  br i1 %10, label %11, label %16, !dbg !20

11:                                               ; preds = %2
  %12 = load i8*, i8** %4, align 8, !dbg !21
  %13 = getelementptr inbounds i8, i8* %12, i64 1, !dbg !22
  %14 = load i8*, i8** %5, align 8, !dbg !23
  %15 = call i32 @matchhere(i8* %13, i8* %14), !dbg !24
  store i32 %15, i32* %3, align 4, !dbg !25
  br label %29, !dbg !25

16:                                               ; preds = %2, %22
  %17 = load i8*, i8** %4, align 8, !dbg !26
  %18 = load i8*, i8** %5, align 8, !dbg !29
  %19 = call i32 @matchhere(i8* %17, i8* %18), !dbg !30
  %20 = icmp ne i32 %19, 0, !dbg !30
  br i1 %20, label %21, label %22, !dbg !31

21:                                               ; preds = %16
  store i32 1, i32* %3, align 4, !dbg !32
  br label %29, !dbg !32

22:                                               ; preds = %16
  %23 = load i8*, i8** %5, align 8, !dbg !33
  %24 = getelementptr inbounds i8, i8* %23, i32 1, !dbg !33
  store i8* %24, i8** %5, align 8, !dbg !33
  %25 = load i8, i8* %23, align 1, !dbg !34
  %26 = sext i8 %25 to i32, !dbg !34
  %27 = icmp ne i32 %26, 0, !dbg !35
  br i1 %27, label %16, label %28, !dbg !36, !llvm.loop !37

28:                                               ; preds = %22
  store i32 0, i32* %3, align 4, !dbg !40
  br label %29, !dbg !40

29:                                               ; preds = %28, %21, %11
  %30 = load i32, i32* %3, align 4, !dbg !41
  ret i32 %30, !dbg !41
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @matchhere(i8*, i8*) #0 !dbg !42 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !43, metadata !DIExpression()), !dbg !44
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = load i8*, i8** %4, align 8, !dbg !47
  %7 = getelementptr inbounds i8, i8* %6, i64 0, !dbg !47
  %8 = load i8, i8* %7, align 1, !dbg !47
  %9 = sext i8 %8 to i32, !dbg !47
  %10 = icmp eq i32 %9, 0, !dbg !49
  br i1 %10, label %11, label %12, !dbg !50

11:                                               ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !51
  br label %68, !dbg !51

12:                                               ; preds = %2
  %13 = load i8*, i8** %4, align 8, !dbg !52
  %14 = getelementptr inbounds i8, i8* %13, i64 1, !dbg !52
  %15 = load i8, i8* %14, align 1, !dbg !52
  %16 = sext i8 %15 to i32, !dbg !52
  %17 = icmp eq i32 %16, 42, !dbg !54
  %18 = load i8*, i8** %4, align 8, !dbg !55
  %19 = getelementptr inbounds i8, i8* %18, i64 0, !dbg !55
  %20 = load i8, i8* %19, align 1, !dbg !55
  %21 = sext i8 %20 to i32, !dbg !55
  br i1 %17, label %22, label %27, !dbg !56

22:                                               ; preds = %12
  %23 = load i8*, i8** %4, align 8, !dbg !57
  %24 = getelementptr inbounds i8, i8* %23, i64 2, !dbg !58
  %25 = load i8*, i8** %5, align 8, !dbg !59
  %26 = call i32 @matchstar(i32 %21, i8* %24, i8* %25), !dbg !60
  store i32 %26, i32* %3, align 4, !dbg !61
  br label %68, !dbg !61

27:                                               ; preds = %12
  %28 = icmp eq i32 %21, 36, !dbg !62
  br i1 %28, label %29, label %41, !dbg !64

29:                                               ; preds = %27
  %30 = load i8*, i8** %4, align 8, !dbg !65
  %31 = getelementptr inbounds i8, i8* %30, i64 1, !dbg !65
  %32 = load i8, i8* %31, align 1, !dbg !65
  %33 = sext i8 %32 to i32, !dbg !65
  %34 = icmp eq i32 %33, 0, !dbg !66
  br i1 %34, label %35, label %41, !dbg !67

35:                                               ; preds = %29
  %36 = load i8*, i8** %5, align 8, !dbg !68
  %37 = load i8, i8* %36, align 1, !dbg !69
  %38 = sext i8 %37 to i32, !dbg !69
  %39 = icmp eq i32 %38, 0, !dbg !70
  %40 = zext i1 %39 to i32, !dbg !70
  store i32 %40, i32* %3, align 4, !dbg !71
  br label %68, !dbg !71

41:                                               ; preds = %29, %27
  %42 = load i8*, i8** %5, align 8, !dbg !72
  %43 = load i8, i8* %42, align 1, !dbg !74
  %44 = sext i8 %43 to i32, !dbg !74
  %45 = icmp ne i32 %44, 0, !dbg !75
  br i1 %45, label %46, label %67, !dbg !76

46:                                               ; preds = %41
  %47 = load i8*, i8** %4, align 8, !dbg !77
  %48 = getelementptr inbounds i8, i8* %47, i64 0, !dbg !77
  %49 = load i8, i8* %48, align 1, !dbg !77
  %50 = sext i8 %49 to i32, !dbg !77
  %51 = icmp eq i32 %50, 46, !dbg !78
  br i1 %51, label %61, label %52, !dbg !79

52:                                               ; preds = %46
  %53 = load i8*, i8** %4, align 8, !dbg !80
  %54 = getelementptr inbounds i8, i8* %53, i64 0, !dbg !80
  %55 = load i8, i8* %54, align 1, !dbg !80
  %56 = sext i8 %55 to i32, !dbg !80
  %57 = load i8*, i8** %5, align 8, !dbg !81
  %58 = load i8, i8* %57, align 1, !dbg !82
  %59 = sext i8 %58 to i32, !dbg !82
  %60 = icmp eq i32 %56, %59, !dbg !83
  br i1 %60, label %61, label %67, !dbg !84

61:                                               ; preds = %52, %46
  %62 = load i8*, i8** %4, align 8, !dbg !85
  %63 = getelementptr inbounds i8, i8* %62, i64 1, !dbg !86
  %64 = load i8*, i8** %5, align 8, !dbg !87
  %65 = getelementptr inbounds i8, i8* %64, i64 1, !dbg !88
  %66 = call i32 @matchhere(i8* %63, i8* %65), !dbg !89
  store i32 %66, i32* %3, align 4, !dbg !90
  br label %68, !dbg !90

67:                                               ; preds = %52, %41
  store i32 0, i32* %3, align 4, !dbg !91
  br label %68, !dbg !91

68:                                               ; preds = %67, %61, %35, %22, %11
  %69 = load i32, i32* %3, align 4, !dbg !92
  ret i32 %69, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !93 {
  %1 = alloca i32, align 4
  %2 = alloca [7 x i8], align 1
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [7 x i8]* %2, metadata !96, metadata !DIExpression()), !dbg !100
  %3 = getelementptr inbounds [7 x i8], [7 x i8]* %2, i64 0, i64 0, !dbg !101
  call void @klee_make_symbolic(i8* %3, i64 7, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !102
  %4 = getelementptr inbounds [7 x i8], [7 x i8]* %2, i64 0, i64 6, !dbg !103
  %5 = load i8, i8* %4, align 1, !dbg !103
  %6 = sext i8 %5 to i32, !dbg !103
  %7 = icmp eq i32 %6, 0, !dbg !104
  %8 = zext i1 %7 to i32, !dbg !104
  %9 = sext i32 %8 to i64, !dbg !103
  call void @klee_assume(i64 %9), !dbg !105
  %10 = getelementptr inbounds [7 x i8], [7 x i8]* %2, i64 0, i64 0, !dbg !106
  %11 = call i32 @match(i8* %10, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

declare dso_local void @klee_assume(i64) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @matchstar(i32, i8*, i8*) #0 !dbg !109 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !112, metadata !DIExpression()), !dbg !113
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !114, metadata !DIExpression()), !dbg !115
  store i8* %2, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !116, metadata !DIExpression()), !dbg !117
  br label %8, !dbg !118

8:                                                ; preds = %19, %3
  %9 = load i8*, i8** %6, align 8, !dbg !119
  %10 = load i8*, i8** %7, align 8, !dbg !122
  %11 = call i32 @matchhere(i8* %9, i8* %10), !dbg !123
  %12 = icmp ne i32 %11, 0, !dbg !123
  br i1 %12, label %13, label %14, !dbg !124

13:                                               ; preds = %8
  store i32 1, i32* %4, align 4, !dbg !125
  br label %29, !dbg !125

14:                                               ; preds = %8
  %15 = load i8*, i8** %7, align 8, !dbg !126
  %16 = load i8, i8* %15, align 1, !dbg !127
  %17 = sext i8 %16 to i32, !dbg !127
  %18 = icmp ne i32 %17, 0, !dbg !128
  br i1 %18, label %19, label %.critedge, !dbg !129

19:                                               ; preds = %14
  %20 = load i8*, i8** %7, align 8, !dbg !130
  %21 = getelementptr inbounds i8, i8* %20, i32 1, !dbg !130
  store i8* %21, i8** %7, align 8, !dbg !130
  %22 = load i8, i8* %20, align 1, !dbg !131
  %23 = sext i8 %22 to i32, !dbg !131
  %24 = load i32, i32* %5, align 4, !dbg !132
  %25 = icmp eq i32 %23, %24, !dbg !133
  %26 = load i32, i32* %5, align 4, !dbg !134
  %27 = icmp eq i32 %26, 46, !dbg !134
  %28 = select i1 %25, i1 true, i1 %27, !dbg !134
  br i1 %28, label %8, label %.critedge, !dbg !135, !llvm.loop !136

.critedge:                                        ; preds = %14, %19
  store i32 0, i32* %4, align 4, !dbg !138
  br label %29, !dbg !138

29:                                               ; preds = %.critedge, %13
  %30 = load i32, i32* %4, align 4, !dbg !139
  ret i32 %30, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Regexp.c", directory: "/home/jorge/klee/examples/regexp")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "match", scope: !1, file: !1, line: 34, type: !8, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DILocalVariable(name: "re", arg: 1, scope: !7, file: !1, line: 34, type: !11)
!14 = !DILocation(line: 34, column: 17, scope: !7)
!15 = !DILocalVariable(name: "text", arg: 2, scope: !7, file: !1, line: 34, type: !11)
!16 = !DILocation(line: 34, column: 27, scope: !7)
!17 = !DILocation(line: 35, column: 7, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 35, column: 7)
!19 = !DILocation(line: 35, column: 13, scope: !18)
!20 = !DILocation(line: 35, column: 7, scope: !7)
!21 = !DILocation(line: 36, column: 22, scope: !18)
!22 = !DILocation(line: 36, column: 24, scope: !18)
!23 = !DILocation(line: 36, column: 28, scope: !18)
!24 = !DILocation(line: 36, column: 12, scope: !18)
!25 = !DILocation(line: 36, column: 5, scope: !18)
!26 = !DILocation(line: 38, column: 19, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 38, column: 9)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 37, column: 6)
!29 = !DILocation(line: 38, column: 23, scope: !27)
!30 = !DILocation(line: 38, column: 9, scope: !27)
!31 = !DILocation(line: 38, column: 9, scope: !28)
!32 = !DILocation(line: 39, column: 7, scope: !27)
!33 = !DILocation(line: 40, column: 17, scope: !7)
!34 = !DILocation(line: 40, column: 12, scope: !7)
!35 = !DILocation(line: 40, column: 20, scope: !7)
!36 = !DILocation(line: 40, column: 3, scope: !28)
!37 = distinct !{!37, !38, !39}
!38 = !DILocation(line: 37, column: 3, scope: !7)
!39 = !DILocation(line: 40, column: 27, scope: !7)
!40 = !DILocation(line: 41, column: 3, scope: !7)
!41 = !DILocation(line: 42, column: 1, scope: !7)
!42 = distinct !DISubprogram(name: "matchhere", scope: !1, file: !1, line: 22, type: !8, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "re", arg: 1, scope: !42, file: !1, line: 22, type: !11)
!44 = !DILocation(line: 22, column: 28, scope: !42)
!45 = !DILocalVariable(name: "text", arg: 2, scope: !42, file: !1, line: 22, type: !11)
!46 = !DILocation(line: 22, column: 38, scope: !42)
!47 = !DILocation(line: 23, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 23, column: 7)
!49 = !DILocation(line: 23, column: 13, scope: !48)
!50 = !DILocation(line: 23, column: 7, scope: !42)
!51 = !DILocation(line: 24, column: 6, scope: !48)
!52 = !DILocation(line: 25, column: 7, scope: !53)
!53 = distinct !DILexicalBlock(scope: !42, file: !1, line: 25, column: 7)
!54 = !DILocation(line: 25, column: 13, scope: !53)
!55 = !DILocation(line: 0, scope: !42)
!56 = !DILocation(line: 25, column: 7, scope: !42)
!57 = !DILocation(line: 26, column: 29, scope: !53)
!58 = !DILocation(line: 26, column: 31, scope: !53)
!59 = !DILocation(line: 26, column: 35, scope: !53)
!60 = !DILocation(line: 26, column: 12, scope: !53)
!61 = !DILocation(line: 26, column: 5, scope: !53)
!62 = !DILocation(line: 27, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !42, file: !1, line: 27, column: 7)
!64 = !DILocation(line: 27, column: 20, scope: !63)
!65 = !DILocation(line: 27, column: 23, scope: !63)
!66 = !DILocation(line: 27, column: 28, scope: !63)
!67 = !DILocation(line: 27, column: 7, scope: !42)
!68 = !DILocation(line: 28, column: 13, scope: !63)
!69 = !DILocation(line: 28, column: 12, scope: !63)
!70 = !DILocation(line: 28, column: 18, scope: !63)
!71 = !DILocation(line: 28, column: 5, scope: !63)
!72 = !DILocation(line: 29, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !42, file: !1, line: 29, column: 7)
!74 = !DILocation(line: 29, column: 7, scope: !73)
!75 = !DILocation(line: 29, column: 12, scope: !73)
!76 = !DILocation(line: 29, column: 19, scope: !73)
!77 = !DILocation(line: 29, column: 23, scope: !73)
!78 = !DILocation(line: 29, column: 28, scope: !73)
!79 = !DILocation(line: 29, column: 34, scope: !73)
!80 = !DILocation(line: 29, column: 37, scope: !73)
!81 = !DILocation(line: 29, column: 45, scope: !73)
!82 = !DILocation(line: 29, column: 44, scope: !73)
!83 = !DILocation(line: 29, column: 42, scope: !73)
!84 = !DILocation(line: 29, column: 7, scope: !42)
!85 = !DILocation(line: 30, column: 22, scope: !73)
!86 = !DILocation(line: 30, column: 24, scope: !73)
!87 = !DILocation(line: 30, column: 28, scope: !73)
!88 = !DILocation(line: 30, column: 32, scope: !73)
!89 = !DILocation(line: 30, column: 12, scope: !73)
!90 = !DILocation(line: 30, column: 5, scope: !73)
!91 = !DILocation(line: 31, column: 3, scope: !42)
!92 = !DILocation(line: 32, column: 1, scope: !42)
!93 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 51, type: !94, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!10}
!96 = !DILocalVariable(name: "re", scope: !93, file: !1, line: 53, type: !97)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 56, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 7)
!100 = !DILocation(line: 53, column: 8, scope: !93)
!101 = !DILocation(line: 56, column: 22, scope: !93)
!102 = !DILocation(line: 56, column: 3, scope: !93)
!103 = !DILocation(line: 57, column: 15, scope: !93)
!104 = !DILocation(line: 57, column: 28, scope: !93)
!105 = !DILocation(line: 57, column: 3, scope: !93)
!106 = !DILocation(line: 60, column: 9, scope: !93)
!107 = !DILocation(line: 60, column: 3, scope: !93)
!108 = !DILocation(line: 62, column: 3, scope: !93)
!109 = distinct !DISubprogram(name: "matchstar", scope: !1, file: !1, line: 14, type: !110, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!10, !10, !11, !11}
!112 = !DILocalVariable(name: "c", arg: 1, scope: !109, file: !1, line: 14, type: !10)
!113 = !DILocation(line: 14, column: 26, scope: !109)
!114 = !DILocalVariable(name: "re", arg: 2, scope: !109, file: !1, line: 14, type: !11)
!115 = !DILocation(line: 14, column: 35, scope: !109)
!116 = !DILocalVariable(name: "text", arg: 3, scope: !109, file: !1, line: 14, type: !11)
!117 = !DILocation(line: 14, column: 45, scope: !109)
!118 = !DILocation(line: 15, column: 3, scope: !109)
!119 = !DILocation(line: 16, column: 19, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !1, line: 16, column: 9)
!121 = distinct !DILexicalBlock(scope: !109, file: !1, line: 15, column: 6)
!122 = !DILocation(line: 16, column: 23, scope: !120)
!123 = !DILocation(line: 16, column: 9, scope: !120)
!124 = !DILocation(line: 16, column: 9, scope: !121)
!125 = !DILocation(line: 17, column: 7, scope: !120)
!126 = !DILocation(line: 18, column: 13, scope: !109)
!127 = !DILocation(line: 18, column: 12, scope: !109)
!128 = !DILocation(line: 18, column: 18, scope: !109)
!129 = !DILocation(line: 18, column: 26, scope: !109)
!130 = !DILocation(line: 18, column: 35, scope: !109)
!131 = !DILocation(line: 18, column: 30, scope: !109)
!132 = !DILocation(line: 18, column: 41, scope: !109)
!133 = !DILocation(line: 18, column: 38, scope: !109)
!134 = !DILocation(line: 18, column: 43, scope: !109)
!135 = !DILocation(line: 18, column: 3, scope: !121)
!136 = distinct !{!136, !118, !137}
!137 = !DILocation(line: 18, column: 54, scope: !109)
!138 = !DILocation(line: 19, column: 3, scope: !109)
!139 = !DILocation(line: 20, column: 1, scope: !109)
