; ModuleID = 'ejem2.bc'
source_filename = "ejem2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@b = common dso_local global i32* null, align 8, !dbg !0
@b2 = common dso_local global i32* null, align 8, !dbg !12
@c = common dso_local global [5 x i32] zeroinitializer, align 16, !dbg !6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !19 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = load i32*, i32** @b, align 8, !dbg !22
  store i32* %2, i32** @b2, align 8, !dbg !23
  store i32* getelementptr inbounds ([5 x i32], [5 x i32]* @c, i64 0, i64 0), i32** @b, align 8, !dbg !24
  ret i32 0, !dbg !25
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 3, type: !14, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "ejem2.c", directory: "/home/jorge/klee/examples/ejem2")
!4 = !{}
!5 = !{!0, !6, !12}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 160, elements: !10)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{!11}
!11 = !DISubrange(count: 5)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "b2", scope: !2, file: !3, line: 5, type: !14, isLocal: false, isDefinition: true)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{!"clang version 10.0.0-4ubuntu1 "}
!19 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 6, type: !20, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{!9}
!22 = !DILocation(line: 7, column: 4, scope: !19)
!23 = !DILocation(line: 7, column: 3, scope: !19)
!24 = !DILocation(line: 8, column: 2, scope: !19)
!25 = !DILocation(line: 10, column: 3, scope: !19)
