; ModuleID = 'ejem1.bc'
source_filename = "ejem1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@p = common dso_local global i32* null, align 8, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ejem1(i32) #0 !dbg !12 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !15, metadata !DIExpression()), !dbg !16
  %4 = load i32, i32* %3, align 4, !dbg !17
  %5 = icmp sgt i32 %4, 0, !dbg !19
  br i1 %5, label %6, label %7, !dbg !20

6:                                                ; preds = %1
  store i32 -1, i32* %2, align 4, !dbg !21
  br label %8, !dbg !21

7:                                                ; preds = %1
  store i32 1, i32* %2, align 4, !dbg !23
  br label %8, !dbg !23

8:                                                ; preds = %7, %6
  %9 = load i32, i32* %2, align 4, !dbg !25
  ret i32 %9, !dbg !25
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !26 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !29, metadata !DIExpression()), !dbg !30
  %3 = bitcast i32* %2 to i8*, !dbg !31
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !32
  %4 = load i32, i32* %2, align 4, !dbg !33
  %5 = call i32 @ejem1(i32 %4), !dbg !34
  ret i32 %5, !dbg !35
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "p", scope: !2, file: !3, line: 4, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "ejem1.c", directory: "/home/jorge/klee/examples/ejemplo1")
!4 = !{}
!5 = !{!0}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{!"clang version 10.0.0-4ubuntu1 "}
!12 = distinct !DISubprogram(name: "ejem1", scope: !3, file: !3, line: 5, type: !13, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{!7, !7}
!15 = !DILocalVariable(name: "x", arg: 1, scope: !12, file: !3, line: 5, type: !7)
!16 = !DILocation(line: 5, column: 15, scope: !12)
!17 = !DILocation(line: 7, column: 7, scope: !18)
!18 = distinct !DILexicalBlock(scope: !12, file: !3, line: 7, column: 7)
!19 = !DILocation(line: 7, column: 9, scope: !18)
!20 = !DILocation(line: 7, column: 7, scope: !12)
!21 = !DILocation(line: 10, column: 6, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !3, line: 8, column: 3)
!23 = !DILocation(line: 14, column: 6, scope: !24)
!24 = distinct !DILexicalBlock(scope: !18, file: !3, line: 12, column: 7)
!25 = !DILocation(line: 16, column: 1, scope: !12)
!26 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 18, type: !27, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{!7}
!29 = !DILocalVariable(name: "a", scope: !26, file: !3, line: 19, type: !7)
!30 = !DILocation(line: 19, column: 7, scope: !26)
!31 = !DILocation(line: 21, column: 22, scope: !26)
!32 = !DILocation(line: 21, column: 3, scope: !26)
!33 = !DILocation(line: 23, column: 16, scope: !26)
!34 = !DILocation(line: 23, column: 10, scope: !26)
!35 = !DILocation(line: 23, column: 3, scope: !26)
