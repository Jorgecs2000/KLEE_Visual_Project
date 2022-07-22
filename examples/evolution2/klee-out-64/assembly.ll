; ModuleID = 'evolution2.bc'
source_filename = "evolution2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"m\00", align 1
@p = common dso_local global i32* null, align 8, !dbg !0
@y = common dso_local global i32* null, align 8, !dbg !10
@n = common dso_local global i32* null, align 8, !dbg !6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !16 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %3, metadata !21, metadata !DIExpression()), !dbg !22
  %4 = bitcast i32* %2 to i8*, !dbg !23
  call void @klee_make_symbolic(i8* %4, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !24
  %5 = load i32, i32* %2, align 4, !dbg !25
  %6 = icmp sgt i32 %5, 10, !dbg !27
  br i1 %6, label %7, label %9, !dbg !28

7:                                                ; preds = %0
  store i32* %3, i32** @p, align 8, !dbg !29
  %8 = load i32*, i32** @p, align 8, !dbg !31
  store i32* %8, i32** @y, align 8, !dbg !32
  br label %15, !dbg !33

9:                                                ; preds = %0
  %10 = load i32, i32* %2, align 4, !dbg !34
  %11 = icmp slt i32 %10, 5, !dbg !37
  br i1 %11, label %12, label %13, !dbg !38

12:                                               ; preds = %9
  store i32* %3, i32** @n, align 8, !dbg !39
  br label %15, !dbg !41

13:                                               ; preds = %9
  store i32* %3, i32** @y, align 8, !dbg !42
  %14 = load i32*, i32** @y, align 8, !dbg !44
  store i32* %14, i32** @n, align 8, !dbg !45
  br label %15

15:                                               ; preds = %12, %13, %7
  ret i32 0, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "p", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "evolution2.c", directory: "/home/jorge/klee/examples/evolution2")
!4 = !{}
!5 = !{!6, !0, !10}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "n", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "y", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 10.0.0-4ubuntu1 "}
!16 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 7, type: !17, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{!9}
!19 = !DILocalVariable(name: "m", scope: !16, file: !3, line: 8, type: !9)
!20 = !DILocation(line: 8, column: 7, scope: !16)
!21 = !DILocalVariable(name: "l", scope: !16, file: !3, line: 9, type: !9)
!22 = !DILocation(line: 9, column: 7, scope: !16)
!23 = !DILocation(line: 10, column: 21, scope: !16)
!24 = !DILocation(line: 10, column: 2, scope: !16)
!25 = !DILocation(line: 11, column: 6, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !3, line: 11, column: 6)
!27 = !DILocation(line: 11, column: 7, scope: !26)
!28 = !DILocation(line: 11, column: 6, scope: !16)
!29 = !DILocation(line: 13, column: 6, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !3, line: 12, column: 3)
!31 = !DILocation(line: 14, column: 7, scope: !30)
!32 = !DILocation(line: 14, column: 6, scope: !30)
!33 = !DILocation(line: 15, column: 3, scope: !30)
!34 = !DILocation(line: 17, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 17, column: 8)
!36 = distinct !DILexicalBlock(scope: !26, file: !3, line: 16, column: 3)
!37 = !DILocation(line: 17, column: 9, scope: !35)
!38 = !DILocation(line: 17, column: 8, scope: !36)
!39 = !DILocation(line: 19, column: 7, scope: !40)
!40 = distinct !DILexicalBlock(scope: !35, file: !3, line: 18, column: 5)
!41 = !DILocation(line: 20, column: 5, scope: !40)
!42 = !DILocation(line: 22, column: 7, scope: !43)
!43 = distinct !DILexicalBlock(scope: !35, file: !3, line: 21, column: 5)
!44 = !DILocation(line: 23, column: 8, scope: !43)
!45 = !DILocation(line: 23, column: 7, scope: !43)
!46 = !DILocation(line: 27, column: 3, scope: !16)
