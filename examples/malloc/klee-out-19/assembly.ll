; ModuleID = 'malloc.bc'
source_filename = "malloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !10 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32** %2, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %3, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32** %4, metadata !17, metadata !DIExpression()), !dbg !18
  %5 = load i32, i32* %3, align 4, !dbg !19
  %6 = sext i32 %5 to i64, !dbg !19
  %7 = mul i64 %6, 4, !dbg !20
  %8 = call noalias i8* @malloc(i64 %7) #3, !dbg !21
  %9 = bitcast i8* %8 to i32*, !dbg !22
  store i32* %9, i32** %2, align 8, !dbg !23
  %10 = load i32*, i32** %2, align 8, !dbg !24
  store i32* %10, i32** %4, align 8, !dbg !25
  ret i32 0, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "malloc.c", directory: "/home/jorge/klee/examples/malloc")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 10.0.0-4ubuntu1 "}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !11, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!5}
!13 = !DILocalVariable(name: "n", scope: !10, file: !1, line: 4, type: !4)
!14 = !DILocation(line: 4, column: 8, scope: !10)
!15 = !DILocalVariable(name: "m", scope: !10, file: !1, line: 5, type: !5)
!16 = !DILocation(line: 5, column: 7, scope: !10)
!17 = !DILocalVariable(name: "p", scope: !10, file: !1, line: 6, type: !4)
!18 = !DILocation(line: 6, column: 8, scope: !10)
!19 = !DILocation(line: 7, column: 18, scope: !10)
!20 = !DILocation(line: 7, column: 19, scope: !10)
!21 = !DILocation(line: 7, column: 11, scope: !10)
!22 = !DILocation(line: 7, column: 5, scope: !10)
!23 = !DILocation(line: 7, column: 4, scope: !10)
!24 = !DILocation(line: 8, column: 5, scope: !10)
!25 = !DILocation(line: 8, column: 4, scope: !10)
!26 = !DILocation(line: 11, column: 3, scope: !10)