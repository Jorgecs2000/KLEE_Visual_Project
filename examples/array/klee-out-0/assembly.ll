; ModuleID = 'ejem.bc'
source_filename = "ejem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 16
  %3 = alloca [5 x i32], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %2, metadata !11, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata [5 x i32]* %3, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %4, metadata !18, metadata !DIExpression()), !dbg !19
  %7 = load i32, i32* %4, align 4, !dbg !20
  %8 = icmp eq i32 %7, 1, !dbg !22
  br i1 %8, label %9, label %11, !dbg !23

9:                                                ; preds = %0
  call void @llvm.dbg.declare(metadata i32** %5, metadata !24, metadata !DIExpression()), !dbg !27
  %10 = getelementptr inbounds [5 x i32], [5 x i32]* %2, i64 0, i64 0, !dbg !28
  store i32* %10, i32** %5, align 8, !dbg !27
  br label %13, !dbg !29

11:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i32** %6, metadata !30, metadata !DIExpression()), !dbg !32
  %12 = getelementptr inbounds [5 x i32], [5 x i32]* %3, i64 0, i64 0, !dbg !33
  store i32* %12, i32** %6, align 8, !dbg !32
  br label %13

13:                                               ; preds = %11, %9
  ret i32 0, !dbg !34
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "ejem.c", directory: "/home/jorge/klee/examples/array")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 4, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 160, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 5)
!15 = !DILocation(line: 4, column: 7, scope: !7)
!16 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 5, type: !12)
!17 = !DILocation(line: 5, column: 7, scope: !7)
!18 = !DILocalVariable(name: "t", scope: !7, file: !1, line: 6, type: !10)
!19 = !DILocation(line: 6, column: 7, scope: !7)
!20 = !DILocation(line: 7, column: 6, scope: !21)
!21 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 6)
!22 = !DILocation(line: 7, column: 7, scope: !21)
!23 = !DILocation(line: 7, column: 6, scope: !7)
!24 = !DILocalVariable(name: "p", scope: !25, file: !1, line: 9, type: !26)
!25 = distinct !DILexicalBlock(scope: !21, file: !1, line: 8, column: 3)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!27 = !DILocation(line: 9, column: 9, scope: !25)
!28 = !DILocation(line: 9, column: 11, scope: !25)
!29 = !DILocation(line: 10, column: 3, scope: !25)
!30 = !DILocalVariable(name: "o", scope: !31, file: !1, line: 13, type: !26)
!31 = distinct !DILexicalBlock(scope: !21, file: !1, line: 12, column: 3)
!32 = !DILocation(line: 13, column: 9, scope: !31)
!33 = !DILocation(line: 13, column: 11, scope: !31)
!34 = !DILocation(line: 20, column: 3, scope: !7)
