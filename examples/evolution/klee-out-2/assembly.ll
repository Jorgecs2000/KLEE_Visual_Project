; ModuleID = 'evolution.bc'
source_filename = "evolution.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32** %2, metadata !11, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.declare(metadata i32* %3, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32** %4, metadata !16, metadata !DIExpression()), !dbg !17
  %5 = load i32, i32* %3, align 4, !dbg !18
  %6 = icmp sgt i32 %5, 5, !dbg !20
  br i1 %6, label %7, label %8, !dbg !21

7:                                                ; preds = %0
  store i32* %3, i32** %2, align 8, !dbg !22
  br label %9, !dbg !24

8:                                                ; preds = %0
  store i32* %3, i32** %4, align 8, !dbg !25
  br label %9

9:                                                ; preds = %8, %7
  ret i32 0, !dbg !27
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "evolution.c", directory: "/home/jorge/klee/examples/evolution")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 4, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!13 = !DILocation(line: 4, column: 8, scope: !7)
!14 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocation(line: 5, column: 7, scope: !7)
!16 = !DILocalVariable(name: "p", scope: !7, file: !1, line: 6, type: !12)
!17 = !DILocation(line: 6, column: 8, scope: !7)
!18 = !DILocation(line: 7, column: 6, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 7, column: 6)
!20 = !DILocation(line: 7, column: 7, scope: !19)
!21 = !DILocation(line: 7, column: 6, scope: !7)
!22 = !DILocation(line: 9, column: 6, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !1, line: 8, column: 3)
!24 = !DILocation(line: 10, column: 3, scope: !23)
!25 = !DILocation(line: 12, column: 6, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !1, line: 11, column: 3)
!27 = !DILocation(line: 15, column: 3, scope: !7)
