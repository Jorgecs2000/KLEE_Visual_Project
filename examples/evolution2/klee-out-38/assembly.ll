; ModuleID = 'evolution2.bc'
source_filename = "evolution2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"m\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32** %2, metadata !11, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.declare(metadata i32* %3, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %4, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %5, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %6, metadata !20, metadata !DIExpression()), !dbg !21
  %7 = bitcast i32* %3 to i8*, !dbg !22
  call void @klee_make_symbolic(i8* %7, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !23
  %8 = load i32, i32* %3, align 4, !dbg !24
  %9 = icmp sgt i32 %8, 10, !dbg !26
  br i1 %9, label %10, label %11, !dbg !27

10:                                               ; preds = %0
  store i32* %4, i32** %5, align 8, !dbg !28
  br label %16, !dbg !30

11:                                               ; preds = %0
  %12 = load i32, i32* %3, align 4, !dbg !31
  %13 = icmp slt i32 %12, 5, !dbg !34
  br i1 %13, label %14, label %15, !dbg !35

14:                                               ; preds = %11
  store i32* %4, i32** %2, align 8, !dbg !36
  br label %16, !dbg !38

15:                                               ; preds = %11
  store i32* %4, i32** %6, align 8, !dbg !39
  br label %16

16:                                               ; preds = %14, %15, %10
  ret i32 0, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "evolution2.c", directory: "/home/jorge/klee/examples/evolution2")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 5, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!13 = !DILocation(line: 5, column: 8, scope: !7)
!14 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 6, type: !10)
!15 = !DILocation(line: 6, column: 7, scope: !7)
!16 = !DILocalVariable(name: "l", scope: !7, file: !1, line: 7, type: !10)
!17 = !DILocation(line: 7, column: 7, scope: !7)
!18 = !DILocalVariable(name: "p", scope: !7, file: !1, line: 8, type: !12)
!19 = !DILocation(line: 8, column: 8, scope: !7)
!20 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 9, type: !12)
!21 = !DILocation(line: 9, column: 8, scope: !7)
!22 = !DILocation(line: 10, column: 21, scope: !7)
!23 = !DILocation(line: 10, column: 2, scope: !7)
!24 = !DILocation(line: 11, column: 6, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 6)
!26 = !DILocation(line: 11, column: 7, scope: !25)
!27 = !DILocation(line: 11, column: 6, scope: !7)
!28 = !DILocation(line: 13, column: 6, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 12, column: 3)
!30 = !DILocation(line: 14, column: 3, scope: !29)
!31 = !DILocation(line: 16, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 16, column: 8)
!33 = distinct !DILexicalBlock(scope: !25, file: !1, line: 15, column: 3)
!34 = !DILocation(line: 16, column: 9, scope: !32)
!35 = !DILocation(line: 16, column: 8, scope: !33)
!36 = !DILocation(line: 18, column: 7, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 17, column: 5)
!38 = !DILocation(line: 19, column: 5, scope: !37)
!39 = !DILocation(line: 21, column: 7, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !1, line: 20, column: 5)
!41 = !DILocation(line: 26, column: 3, scope: !7)
