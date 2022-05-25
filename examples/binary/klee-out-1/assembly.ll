; ModuleID = 'bin_search1.bc'
source_filename = "bin_search1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"searching for %d in:\0A[\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%d]\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"result = %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"a[result] == x\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"bin_search1.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"a[i] != x\00", align 1

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
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  call void @llvm.dbg.declare(metadata i32** %4, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32* %6, metadata !117, metadata !DIExpression()), !dbg !119
  store i32 0, i32* %6, align 4, !dbg !119
  br label %7, !dbg !120

7:                                                ; preds = %26, %2
  %8 = load i32, i32* %6, align 4, !dbg !121
  %9 = load i32, i32* %5, align 4, !dbg !123
  %10 = sub nsw i32 %9, 1, !dbg !124
  %11 = icmp slt i32 %8, %10, !dbg !125
  br i1 %11, label %12, label %29, !dbg !126

12:                                               ; preds = %7
  %13 = load i32*, i32** %4, align 8, !dbg !127
  %14 = load i32, i32* %6, align 4, !dbg !130
  %15 = sext i32 %14 to i64, !dbg !127
  %16 = getelementptr inbounds i32, i32* %13, i64 %15, !dbg !127
  %17 = load i32, i32* %16, align 4, !dbg !127
  %18 = load i32*, i32** %4, align 8, !dbg !131
  %19 = load i32, i32* %6, align 4, !dbg !132
  %20 = add nsw i32 %19, 1, !dbg !133
  %21 = sext i32 %20 to i64, !dbg !131
  %22 = getelementptr inbounds i32, i32* %18, i64 %21, !dbg !131
  %23 = load i32, i32* %22, align 4, !dbg !131
  %24 = icmp sgt i32 %17, %23, !dbg !134
  br i1 %24, label %25, label %26, !dbg !135

25:                                               ; preds = %12
  store i32 0, i32* %3, align 4, !dbg !136
  br label %30, !dbg !136

26:                                               ; preds = %12
  %27 = load i32, i32* %6, align 4, !dbg !138
  %28 = add nsw i32 %27, 1, !dbg !138
  store i32 %28, i32* %6, align 4, !dbg !138
  br label %7, !dbg !139, !llvm.loop !140

29:                                               ; preds = %7
  store i32 1, i32* %3, align 4, !dbg !142
  br label %30, !dbg !142

30:                                               ; preds = %29, %25
  %31 = load i32, i32* %3, align 4, !dbg !143
  ret i32 %31, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !144 {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i16* %2, metadata !147, metadata !DIExpression()), !dbg !149
  %8 = bitcast i16* %2 to i8*, !dbg !150
  call void @klee_make_symbolic(i8* %8, i64 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !151
  %9 = load i16, i16* %2, align 2, !dbg !152
  %10 = zext i16 %9 to i32, !dbg !152
  %11 = icmp sgt i32 %10, 0, !dbg !153
  %12 = zext i1 %11 to i32, !dbg !153
  %13 = sext i32 %12 to i64, !dbg !152
  call void @klee_assume(i64 %13), !dbg !154
  %14 = load i16, i16* %2, align 2, !dbg !155
  %15 = zext i16 %14 to i32, !dbg !155
  %16 = icmp slt i32 %15, 65535, !dbg !156
  %17 = zext i1 %16 to i32, !dbg !156
  %18 = sext i32 %17 to i64, !dbg !155
  call void @klee_assume(i64 %18), !dbg !157
  %19 = load i16, i16* %2, align 2, !dbg !158
  %20 = zext i16 %19 to i64, !dbg !159
  store i8* null, i8** %3, align 8, !dbg !159
  %21 = alloca i32, i64 %20, align 16, !dbg !159
  store i64 %20, i64* %4, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i64* %4, metadata !160, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i32* %21, metadata !163, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %5, metadata !168, metadata !DIExpression()), !dbg !169
  %22 = bitcast i32* %21 to i8*, !dbg !170
  %23 = mul nuw i64 4, %20, !dbg !171
  call void @klee_make_symbolic(i8* %22, i64 %23, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)), !dbg !172
  %24 = call i32 @sorted(i32* %21, i32 10), !dbg !173
  %25 = sext i32 %24 to i64, !dbg !173
  call void @klee_assume(i64 %25), !dbg !174
  %26 = bitcast i32* %5 to i8*, !dbg !175
  call void @klee_make_symbolic(i8* %26, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)), !dbg !176
  call void @llvm.dbg.declare(metadata i32* %6, metadata !177, metadata !DIExpression()), !dbg !178
  %27 = load i32, i32* %5, align 4, !dbg !179
  %28 = call i32 @binary_search(i32* %21, i32 10, i32 %27), !dbg !180
  store i32 %28, i32* %6, align 4, !dbg !178
  %29 = load i32, i32* %6, align 4, !dbg !181
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 %29), !dbg !182
  %31 = load i32, i32* %6, align 4, !dbg !183
  %32 = icmp ne i32 %31, -1, !dbg !185
  br i1 %32, label %33, label %41, !dbg !186

33:                                               ; preds = %0
  %34 = load i32, i32* %6, align 4, !dbg !187
  %35 = sext i32 %34 to i64, !dbg !187
  %36 = getelementptr inbounds i32, i32* %21, i64 %35, !dbg !187
  %37 = load i32, i32* %36, align 4, !dbg !187
  %38 = load i32, i32* %5, align 4, !dbg !187
  %39 = icmp eq i32 %37, %38, !dbg !187
  br i1 %39, label %56, label %40, !dbg !191

40:                                               ; preds = %33
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 55, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #5, !dbg !187
  unreachable, !dbg !187

41:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %7, metadata !192, metadata !DIExpression()), !dbg !195
  store i32 0, i32* %7, align 4, !dbg !195
  br label %42, !dbg !196

42:                                               ; preds = %53, %41
  %43 = load i32, i32* %7, align 4, !dbg !197
  %44 = icmp slt i32 %43, 10, !dbg !199
  br i1 %44, label %45, label %56, !dbg !200

45:                                               ; preds = %42
  %46 = load i32, i32* %7, align 4, !dbg !201
  %47 = sext i32 %46 to i64, !dbg !201
  %48 = getelementptr inbounds i32, i32* %21, i64 %47, !dbg !201
  %49 = load i32, i32* %48, align 4, !dbg !201
  %50 = load i32, i32* %5, align 4, !dbg !201
  %51 = icmp ne i32 %49, %50, !dbg !201
  br i1 %51, label %53, label %52, !dbg !205

52:                                               ; preds = %45
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 59, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #5, !dbg !201
  unreachable, !dbg !201

53:                                               ; preds = %45
  %54 = load i32, i32* %7, align 4, !dbg !206
  %55 = add nsw i32 %54, 1, !dbg !206
  store i32 %55, i32* %7, align 4, !dbg !206
  br label %42, !dbg !207, !llvm.loop !208

56:                                               ; preds = %42, %33
  store i32 1, i32* %1, align 4, !dbg !210
  %57 = load i8*, i8** %3, align 8, !dbg !211
  %58 = load i32, i32* %1, align 4, !dbg !211
  ret i32 %58, !dbg !211
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

declare dso_local void @klee_assume(i64) #2

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "bin_search1.c", directory: "/home/jorge/klee/examples/binary")
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
!117 = !DILocalVariable(name: "i", scope: !118, file: !1, line: 34, type: !11)
!118 = distinct !DILexicalBlock(scope: !110, file: !1, line: 34, column: 5)
!119 = !DILocation(line: 34, column: 14, scope: !118)
!120 = !DILocation(line: 34, column: 10, scope: !118)
!121 = !DILocation(line: 34, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !1, line: 34, column: 5)
!123 = !DILocation(line: 34, column: 25, scope: !122)
!124 = !DILocation(line: 34, column: 29, scope: !122)
!125 = !DILocation(line: 34, column: 23, scope: !122)
!126 = !DILocation(line: 34, column: 5, scope: !118)
!127 = !DILocation(line: 35, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !129, file: !1, line: 35, column: 13)
!129 = distinct !DILexicalBlock(scope: !122, file: !1, line: 34, column: 38)
!130 = !DILocation(line: 35, column: 17, scope: !128)
!131 = !DILocation(line: 35, column: 22, scope: !128)
!132 = !DILocation(line: 35, column: 26, scope: !128)
!133 = !DILocation(line: 35, column: 27, scope: !128)
!134 = !DILocation(line: 35, column: 20, scope: !128)
!135 = !DILocation(line: 35, column: 13, scope: !129)
!136 = !DILocation(line: 36, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !128, file: !1, line: 35, column: 32)
!138 = !DILocation(line: 34, column: 34, scope: !122)
!139 = !DILocation(line: 34, column: 5, scope: !122)
!140 = distinct !{!140, !126, !141}
!141 = !DILocation(line: 38, column: 5, scope: !118)
!142 = !DILocation(line: 39, column: 5, scope: !110)
!143 = !DILocation(line: 40, column: 1, scope: !110)
!144 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !145, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!145 = !DISubroutineType(types: !146)
!146 = !{!11}
!147 = !DILocalVariable(name: "n", scope: !144, file: !1, line: 43, type: !148)
!148 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!149 = !DILocation(line: 43, column: 18, scope: !144)
!150 = !DILocation(line: 44, column: 22, scope: !144)
!151 = !DILocation(line: 44, column: 3, scope: !144)
!152 = !DILocation(line: 45, column: 15, scope: !144)
!153 = !DILocation(line: 45, column: 17, scope: !144)
!154 = !DILocation(line: 45, column: 3, scope: !144)
!155 = !DILocation(line: 46, column: 15, scope: !144)
!156 = !DILocation(line: 46, column: 17, scope: !144)
!157 = !DILocation(line: 46, column: 3, scope: !144)
!158 = !DILocation(line: 47, column: 9, scope: !144)
!159 = !DILocation(line: 47, column: 3, scope: !144)
!160 = !DILocalVariable(name: "__vla_expr0", scope: !144, type: !161, flags: DIFlagArtificial)
!161 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!162 = !DILocation(line: 0, scope: !144)
!163 = !DILocalVariable(name: "a", scope: !144, file: !1, line: 47, type: !164)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, elements: !165)
!165 = !{!166}
!166 = !DISubrange(count: !160)
!167 = !DILocation(line: 47, column: 7, scope: !144)
!168 = !DILocalVariable(name: "x", scope: !144, file: !1, line: 48, type: !11)
!169 = !DILocation(line: 48, column: 7, scope: !144)
!170 = !DILocation(line: 49, column: 22, scope: !144)
!171 = !DILocation(line: 49, column: 26, scope: !144)
!172 = !DILocation(line: 49, column: 3, scope: !144)
!173 = !DILocation(line: 50, column: 15, scope: !144)
!174 = !DILocation(line: 50, column: 3, scope: !144)
!175 = !DILocation(line: 51, column: 22, scope: !144)
!176 = !DILocation(line: 51, column: 3, scope: !144)
!177 = !DILocalVariable(name: "result", scope: !144, file: !1, line: 52, type: !11)
!178 = !DILocation(line: 52, column: 7, scope: !144)
!179 = !DILocation(line: 52, column: 37, scope: !144)
!180 = !DILocation(line: 52, column: 16, scope: !144)
!181 = !DILocation(line: 53, column: 27, scope: !144)
!182 = !DILocation(line: 53, column: 3, scope: !144)
!183 = !DILocation(line: 54, column: 7, scope: !184)
!184 = distinct !DILexicalBlock(scope: !144, file: !1, line: 54, column: 7)
!185 = !DILocation(line: 54, column: 14, scope: !184)
!186 = !DILocation(line: 54, column: 7, scope: !144)
!187 = !DILocation(line: 55, column: 5, scope: !188)
!188 = distinct !DILexicalBlock(scope: !189, file: !1, line: 55, column: 5)
!189 = distinct !DILexicalBlock(scope: !190, file: !1, line: 55, column: 5)
!190 = distinct !DILexicalBlock(scope: !184, file: !1, line: 54, column: 21)
!191 = !DILocation(line: 55, column: 5, scope: !189)
!192 = !DILocalVariable(name: "i", scope: !193, file: !1, line: 58, type: !11)
!193 = distinct !DILexicalBlock(scope: !194, file: !1, line: 58, column: 5)
!194 = distinct !DILexicalBlock(scope: !184, file: !1, line: 56, column: 10)
!195 = !DILocation(line: 58, column: 14, scope: !193)
!196 = !DILocation(line: 58, column: 10, scope: !193)
!197 = !DILocation(line: 58, column: 21, scope: !198)
!198 = distinct !DILexicalBlock(scope: !193, file: !1, line: 58, column: 5)
!199 = !DILocation(line: 58, column: 23, scope: !198)
!200 = !DILocation(line: 58, column: 5, scope: !193)
!201 = !DILocation(line: 59, column: 7, scope: !202)
!202 = distinct !DILexicalBlock(scope: !203, file: !1, line: 59, column: 7)
!203 = distinct !DILexicalBlock(scope: !204, file: !1, line: 59, column: 7)
!204 = distinct !DILexicalBlock(scope: !198, file: !1, line: 58, column: 34)
!205 = !DILocation(line: 59, column: 7, scope: !203)
!206 = !DILocation(line: 58, column: 30, scope: !198)
!207 = !DILocation(line: 58, column: 5, scope: !198)
!208 = distinct !{!208, !200, !209}
!209 = !DILocation(line: 60, column: 5, scope: !193)
!210 = !DILocation(line: 62, column: 3, scope: !144)
!211 = !DILocation(line: 63, column: 1, scope: !144)
