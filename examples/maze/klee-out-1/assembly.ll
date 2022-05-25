; ModuleID = 'maze.bc'
source_filename = "maze.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@maze = dso_local global [7 x [11 x i8]] [[11 x i8] c"+-+---+---+", [11 x i8] c"| |     |#|", [11 x i8] c"| | --+ | |", [11 x i8] c"| |   | | |", [11 x i8] c"| +-- | | |", [11 x i8] c"|     |   |", [11 x i8] c"+-----+---+"], align 16, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Maze dimensions: %dx%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Player pos: %dx%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"Iteration no. %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [67 x i8] c"Program the player moves with a sequence of 'w', 's', 'a' and 'd'\0A\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"Try to reach the price(#)!\0A\00", align 1
@.str.7 = private unnamed_addr constant [40 x i8] c"Wrong command!(only w,s,a,d accepted!)\0A\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"You loose!\0A\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"You win!\0A\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"Your solution <%42s>\0A\00", align 1
@.str.11 = private unnamed_addr constant [34 x i8] c"Iteration no. %d. Action: %c. %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [9 x i8] c"Blocked!\00", align 1
@.str.13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.14 = private unnamed_addr constant [11 x i8] c"You loose\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw() #0 !dbg !15 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %2, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %1, align 4, !dbg !23
  br label %3, !dbg !25

3:                                                ; preds = %22, %0
  %4 = load i32, i32* %1, align 4, !dbg !26
  %5 = icmp slt i32 %4, 7, !dbg !28
  br i1 %5, label %6, label %26, !dbg !29

6:                                                ; preds = %3
  store i32 0, i32* %2, align 4, !dbg !30
  br label %7, !dbg !33

7:                                                ; preds = %10, %6
  %8 = load i32, i32* %2, align 4, !dbg !34
  %9 = icmp slt i32 %8, 11, !dbg !36
  br i1 %9, label %10, label %22, !dbg !37

10:                                               ; preds = %7
  %11 = load i32, i32* %1, align 4, !dbg !38
  %12 = sext i32 %11 to i64, !dbg !39
  %13 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %12, !dbg !39
  %14 = load i32, i32* %2, align 4, !dbg !40
  %15 = sext i32 %14 to i64, !dbg !39
  %16 = getelementptr inbounds [11 x i8], [11 x i8]* %13, i64 0, i64 %15, !dbg !39
  %17 = load i8, i8* %16, align 1, !dbg !39
  %18 = sext i8 %17 to i32, !dbg !39
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %18), !dbg !41
  %20 = load i32, i32* %2, align 4, !dbg !42
  %21 = add nsw i32 %20, 1, !dbg !42
  store i32 %21, i32* %2, align 4, !dbg !42
  br label %7, !dbg !43, !llvm.loop !44

22:                                               ; preds = %7
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !46
  %24 = load i32, i32* %1, align 4, !dbg !47
  %25 = add nsw i32 %24, 1, !dbg !47
  store i32 %25, i32* %1, align 4, !dbg !47
  br label %3, !dbg !48, !llvm.loop !49

26:                                               ; preds = %3
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32, i8**) #0 !dbg !53 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [28 x i8], align 16
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %6, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %7, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %8, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %9, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %10, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 0, i32* %10, align 4, !dbg !71
  call void @llvm.dbg.declare(metadata [28 x i8]* %11, metadata !72, metadata !DIExpression()), !dbg !76
  store i32 1, i32* %6, align 4, !dbg !77
  store i32 1, i32* %7, align 4, !dbg !78
  %12 = load i32, i32* %7, align 4, !dbg !79
  %13 = sext i32 %12 to i64, !dbg !80
  %14 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %13, !dbg !80
  %15 = load i32, i32* %6, align 4, !dbg !81
  %16 = sext i32 %15 to i64, !dbg !80
  %17 = getelementptr inbounds [11 x i8], [11 x i8]* %14, i64 0, i64 %16, !dbg !80
  store i8 88, i8* %17, align 1, !dbg !82
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i32 11, i32 7), !dbg !83
  %19 = load i32, i32* %6, align 4, !dbg !84
  %20 = load i32, i32* %7, align 4, !dbg !85
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 %19, i32 %20), !dbg !86
  %22 = load i32, i32* %10, align 4, !dbg !87
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0), i32 %22), !dbg !88
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.5, i64 0, i64 0)), !dbg !89
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.6, i64 0, i64 0)), !dbg !90
  call void @draw(), !dbg !91
  %26 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 0, !dbg !92
  %27 = call i32 (i32, i8*, i32, ...) bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 0, i8* %26, i32 28), !dbg !93
  br label %28, !dbg !94

28:                                               ; preds = %129, %2
  %29 = load i32, i32* %10, align 4, !dbg !95
  %30 = icmp slt i32 %29, 28, !dbg !96
  br i1 %30, label %31, label %139, !dbg !94

31:                                               ; preds = %28
  %32 = load i32, i32* %6, align 4, !dbg !97
  store i32 %32, i32* %8, align 4, !dbg !99
  %33 = load i32, i32* %7, align 4, !dbg !100
  store i32 %33, i32* %9, align 4, !dbg !101
  %34 = load i32, i32* %10, align 4, !dbg !102
  %35 = sext i32 %34 to i64, !dbg !103
  %36 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 %35, !dbg !103
  %37 = load i8, i8* %36, align 1, !dbg !103
  %38 = sext i8 %37 to i32, !dbg !103
  switch i32 %38, label %51 [
    i32 119, label %39
    i32 115, label %42
    i32 97, label %45
    i32 100, label %48
  ], !dbg !104

39:                                               ; preds = %31
  %40 = load i32, i32* %7, align 4, !dbg !105
  %41 = add nsw i32 %40, -1, !dbg !105
  store i32 %41, i32* %7, align 4, !dbg !105
  br label %54, !dbg !107

42:                                               ; preds = %31
  %43 = load i32, i32* %7, align 4, !dbg !108
  %44 = add nsw i32 %43, 1, !dbg !108
  store i32 %44, i32* %7, align 4, !dbg !108
  br label %54, !dbg !109

45:                                               ; preds = %31
  %46 = load i32, i32* %6, align 4, !dbg !110
  %47 = add nsw i32 %46, -1, !dbg !110
  store i32 %47, i32* %6, align 4, !dbg !110
  br label %54, !dbg !111

48:                                               ; preds = %31
  %49 = load i32, i32* %6, align 4, !dbg !112
  %50 = add nsw i32 %49, 1, !dbg !112
  store i32 %50, i32* %6, align 4, !dbg !112
  br label %54, !dbg !113

51:                                               ; preds = %31
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.7, i64 0, i64 0)), !dbg !114
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i64 0, i64 0)), !dbg !115
  call void @exit(i32 -1) #4, !dbg !116
  unreachable, !dbg !116

54:                                               ; preds = %48, %45, %42, %39
  %55 = load i32, i32* %7, align 4, !dbg !117
  %56 = sext i32 %55 to i64, !dbg !119
  %57 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %56, !dbg !119
  %58 = load i32, i32* %6, align 4, !dbg !120
  %59 = sext i32 %58 to i64, !dbg !119
  %60 = getelementptr inbounds [11 x i8], [11 x i8]* %57, i64 0, i64 %59, !dbg !119
  %61 = load i8, i8* %60, align 1, !dbg !119
  %62 = sext i8 %61 to i32, !dbg !119
  %63 = icmp eq i32 %62, 35, !dbg !121
  br i1 %63, label %64, label %68, !dbg !122

64:                                               ; preds = %54
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0)), !dbg !123
  %66 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 0, !dbg !125
  %67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.10, i64 0, i64 0), i8* %66), !dbg !126
  call void @exit(i32 1) #4, !dbg !127
  unreachable, !dbg !127

68:                                               ; preds = %54
  %69 = load i32, i32* %7, align 4, !dbg !128
  %70 = sext i32 %69 to i64, !dbg !130
  %71 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %70, !dbg !130
  %72 = load i32, i32* %6, align 4, !dbg !131
  %73 = sext i32 %72 to i64, !dbg !130
  %74 = getelementptr inbounds [11 x i8], [11 x i8]* %71, i64 0, i64 %73, !dbg !130
  %75 = load i8, i8* %74, align 1, !dbg !130
  %76 = sext i8 %75 to i32, !dbg !130
  %77 = icmp ne i32 %76, 32, !dbg !132
  br i1 %77, label %78, label %98, !dbg !133

78:                                               ; preds = %68
  %79 = load i32, i32* %7, align 4, !dbg !134
  %80 = icmp eq i32 %79, 2, !dbg !135
  br i1 %80, label %81, label %95, !dbg !136

81:                                               ; preds = %78
  %82 = load i32, i32* %7, align 4, !dbg !137
  %83 = sext i32 %82 to i64, !dbg !138
  %84 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %83, !dbg !138
  %85 = load i32, i32* %6, align 4, !dbg !139
  %86 = sext i32 %85 to i64, !dbg !138
  %87 = getelementptr inbounds [11 x i8], [11 x i8]* %84, i64 0, i64 %86, !dbg !138
  %88 = load i8, i8* %87, align 1, !dbg !138
  %89 = sext i8 %88 to i32, !dbg !138
  %90 = icmp eq i32 %89, 124, !dbg !140
  %91 = load i32, i32* %6, align 4, !dbg !141
  %92 = icmp sgt i32 %91, 0, !dbg !142
  %or.cond = and i1 %90, %92, !dbg !143
  %93 = load i32, i32* %6, align 4, !dbg !144
  %94 = icmp slt i32 %93, 11, !dbg !145
  %or.cond3 = and i1 %or.cond, %94, !dbg !143
  br i1 %or.cond3, label %98, label %95, !dbg !143

95:                                               ; preds = %81, %78
  %96 = load i32, i32* %8, align 4, !dbg !146
  store i32 %96, i32* %6, align 4, !dbg !148
  %97 = load i32, i32* %9, align 4, !dbg !149
  store i32 %97, i32* %7, align 4, !dbg !150
  br label %98, !dbg !151

98:                                               ; preds = %81, %95, %68
  %99 = load i32, i32* %6, align 4, !dbg !152
  %100 = load i32, i32* %7, align 4, !dbg !153
  %101 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 %99, i32 %100), !dbg !154
  %102 = load i32, i32* %10, align 4, !dbg !155
  %103 = load i32, i32* %10, align 4, !dbg !156
  %104 = sext i32 %103 to i64, !dbg !157
  %105 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 %104, !dbg !157
  %106 = load i8, i8* %105, align 1, !dbg !157
  %107 = sext i8 %106 to i32, !dbg !157
  %108 = load i32, i32* %8, align 4, !dbg !158
  %109 = load i32, i32* %6, align 4, !dbg !159
  %110 = icmp eq i32 %108, %109, !dbg !160
  br i1 %110, label %111, label %115, !dbg !161

111:                                              ; preds = %98
  %112 = load i32, i32* %9, align 4, !dbg !162
  %113 = load i32, i32* %7, align 4, !dbg !163
  %114 = icmp eq i32 %112, %113, !dbg !164
  br label %115

115:                                              ; preds = %111, %98
  %116 = phi i1 [ false, %98 ], [ %114, %111 ], !dbg !165
  %117 = zext i1 %116 to i64, !dbg !166
  %118 = select i1 %116, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i64 0, i64 0), !dbg !166
  %119 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.11, i64 0, i64 0), i32 %102, i32 %107, i8* %118), !dbg !167
  %120 = load i32, i32* %8, align 4, !dbg !168
  %121 = load i32, i32* %6, align 4, !dbg !170
  %122 = icmp eq i32 %120, %121, !dbg !171
  br i1 %122, label %123, label %129, !dbg !172

123:                                              ; preds = %115
  %124 = load i32, i32* %9, align 4, !dbg !173
  %125 = load i32, i32* %7, align 4, !dbg !174
  %126 = icmp eq i32 %124, %125, !dbg !175
  br i1 %126, label %127, label %129, !dbg !176

127:                                              ; preds = %123
  %128 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.14, i64 0, i64 0)), !dbg !177
  call void @exit(i32 -2) #4, !dbg !179
  unreachable, !dbg !179

129:                                              ; preds = %123, %115
  %130 = load i32, i32* %7, align 4, !dbg !180
  %131 = sext i32 %130 to i64, !dbg !181
  %132 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %131, !dbg !181
  %133 = load i32, i32* %6, align 4, !dbg !182
  %134 = sext i32 %133 to i64, !dbg !181
  %135 = getelementptr inbounds [11 x i8], [11 x i8]* %132, i64 0, i64 %134, !dbg !181
  store i8 88, i8* %135, align 1, !dbg !183
  call void @draw(), !dbg !184
  %136 = load i32, i32* %10, align 4, !dbg !185
  %137 = add nsw i32 %136, 1, !dbg !185
  store i32 %137, i32* %10, align 4, !dbg !185
  %138 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !186
  br label %28, !dbg !94, !llvm.loop !187

139:                                              ; preds = %28
  %140 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.14, i64 0, i64 0)), !dbg !189
  %141 = load i32, i32* %3, align 4, !dbg !190
  ret i32 %141, !dbg !190
}

declare dso_local i32 @read(...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @sleep(...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "maze", scope: !2, file: !3, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "maze.c", directory: "/home/jorge/klee/examples/maze")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 616, elements: !8)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !10}
!9 = !DISubrange(count: 7)
!10 = !DISubrange(count: 11)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{!"clang version 10.0.0-4ubuntu1 "}
!15 = distinct !DISubprogram(name: "draw", scope: !3, file: !3, line: 32, type: !16, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !15, file: !3, line: 34, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 34, column: 6, scope: !15)
!21 = !DILocalVariable(name: "j", scope: !15, file: !3, line: 34, type: !19)
!22 = !DILocation(line: 34, column: 9, scope: !15)
!23 = !DILocation(line: 35, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !15, file: !3, line: 35, column: 2)
!25 = !DILocation(line: 35, column: 7, scope: !24)
!26 = !DILocation(line: 35, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !3, line: 35, column: 2)
!28 = !DILocation(line: 35, column: 16, scope: !27)
!29 = !DILocation(line: 35, column: 2, scope: !24)
!30 = !DILocation(line: 37, column: 12, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 37, column: 5)
!32 = distinct !DILexicalBlock(scope: !27, file: !3, line: 36, column: 4)
!33 = !DILocation(line: 37, column: 10, scope: !31)
!34 = !DILocation(line: 37, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !3, line: 37, column: 5)
!36 = !DILocation(line: 37, column: 19, scope: !35)
!37 = !DILocation(line: 37, column: 5, scope: !31)
!38 = !DILocation(line: 38, column: 26, scope: !35)
!39 = !DILocation(line: 38, column: 21, scope: !35)
!40 = !DILocation(line: 38, column: 29, scope: !35)
!41 = !DILocation(line: 38, column: 7, scope: !35)
!42 = !DILocation(line: 37, column: 25, scope: !35)
!43 = !DILocation(line: 37, column: 5, scope: !35)
!44 = distinct !{!44, !37, !45}
!45 = !DILocation(line: 38, column: 31, scope: !31)
!46 = !DILocation(line: 39, column: 5, scope: !32)
!47 = !DILocation(line: 35, column: 22, scope: !27)
!48 = !DILocation(line: 35, column: 2, scope: !27)
!49 = distinct !{!49, !29, !50}
!50 = !DILocation(line: 40, column: 4, scope: !24)
!51 = !DILocation(line: 41, column: 2, scope: !15)
!52 = !DILocation(line: 42, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 49, type: !54, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!19, !19, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !3, line: 49, type: !19)
!59 = !DILocation(line: 49, column: 11, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !3, line: 49, type: !56)
!61 = !DILocation(line: 49, column: 23, scope: !53)
!62 = !DILocalVariable(name: "x", scope: !53, file: !3, line: 51, type: !19)
!63 = !DILocation(line: 51, column: 6, scope: !53)
!64 = !DILocalVariable(name: "y", scope: !53, file: !3, line: 51, type: !19)
!65 = !DILocation(line: 51, column: 9, scope: !53)
!66 = !DILocalVariable(name: "ox", scope: !53, file: !3, line: 52, type: !19)
!67 = !DILocation(line: 52, column: 6, scope: !53)
!68 = !DILocalVariable(name: "oy", scope: !53, file: !3, line: 52, type: !19)
!69 = !DILocation(line: 52, column: 10, scope: !53)
!70 = !DILocalVariable(name: "i", scope: !53, file: !3, line: 53, type: !19)
!71 = !DILocation(line: 53, column: 6, scope: !53)
!72 = !DILocalVariable(name: "program", scope: !53, file: !3, line: 55, type: !73)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 224, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 28)
!76 = !DILocation(line: 55, column: 10, scope: !53)
!77 = !DILocation(line: 58, column: 4, scope: !53)
!78 = !DILocation(line: 59, column: 4, scope: !53)
!79 = !DILocation(line: 60, column: 10, scope: !53)
!80 = !DILocation(line: 60, column: 5, scope: !53)
!81 = !DILocation(line: 60, column: 13, scope: !53)
!82 = !DILocation(line: 60, column: 15, scope: !53)
!83 = !DILocation(line: 63, column: 5, scope: !53)
!84 = !DILocation(line: 64, column: 36, scope: !53)
!85 = !DILocation(line: 64, column: 39, scope: !53)
!86 = !DILocation(line: 64, column: 5, scope: !53)
!87 = !DILocation(line: 65, column: 34, scope: !53)
!88 = !DILocation(line: 65, column: 5, scope: !53)
!89 = !DILocation(line: 66, column: 5, scope: !53)
!90 = !DILocation(line: 67, column: 5, scope: !53)
!91 = !DILocation(line: 70, column: 5, scope: !53)
!92 = !DILocation(line: 72, column: 12, scope: !53)
!93 = !DILocation(line: 72, column: 5, scope: !53)
!94 = !DILocation(line: 75, column: 2, scope: !53)
!95 = !DILocation(line: 75, column: 8, scope: !53)
!96 = !DILocation(line: 75, column: 10, scope: !53)
!97 = !DILocation(line: 78, column: 10, scope: !98)
!98 = distinct !DILexicalBlock(scope: !53, file: !3, line: 76, column: 4)
!99 = !DILocation(line: 78, column: 8, scope: !98)
!100 = !DILocation(line: 79, column: 10, scope: !98)
!101 = !DILocation(line: 79, column: 8, scope: !98)
!102 = !DILocation(line: 81, column: 21, scope: !98)
!103 = !DILocation(line: 81, column: 13, scope: !98)
!104 = !DILocation(line: 81, column: 5, scope: !98)
!105 = !DILocation(line: 84, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !3, line: 82, column: 7)
!107 = !DILocation(line: 85, column: 8, scope: !106)
!108 = !DILocation(line: 87, column: 9, scope: !106)
!109 = !DILocation(line: 88, column: 8, scope: !106)
!110 = !DILocation(line: 90, column: 9, scope: !106)
!111 = !DILocation(line: 91, column: 8, scope: !106)
!112 = !DILocation(line: 93, column: 9, scope: !106)
!113 = !DILocation(line: 94, column: 8, scope: !106)
!114 = !DILocation(line: 96, column: 11, scope: !106)
!115 = !DILocation(line: 97, column: 11, scope: !106)
!116 = !DILocation(line: 98, column: 11, scope: !106)
!117 = !DILocation(line: 102, column: 14, scope: !118)
!118 = distinct !DILexicalBlock(scope: !98, file: !3, line: 102, column: 9)
!119 = !DILocation(line: 102, column: 9, scope: !118)
!120 = !DILocation(line: 102, column: 17, scope: !118)
!121 = !DILocation(line: 102, column: 20, scope: !118)
!122 = !DILocation(line: 102, column: 9, scope: !98)
!123 = !DILocation(line: 104, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !3, line: 103, column: 7)
!125 = !DILocation(line: 105, column: 41, scope: !124)
!126 = !DILocation(line: 105, column: 8, scope: !124)
!127 = !DILocation(line: 106, column: 8, scope: !124)
!128 = !DILocation(line: 109, column: 14, scope: !129)
!129 = distinct !DILexicalBlock(scope: !98, file: !3, line: 109, column: 9)
!130 = !DILocation(line: 109, column: 9, scope: !129)
!131 = !DILocation(line: 109, column: 17, scope: !129)
!132 = !DILocation(line: 109, column: 20, scope: !129)
!133 = !DILocation(line: 110, column: 9, scope: !129)
!134 = !DILocation(line: 111, column: 12, scope: !129)
!135 = !DILocation(line: 111, column: 14, scope: !129)
!136 = !DILocation(line: 111, column: 19, scope: !129)
!137 = !DILocation(line: 111, column: 27, scope: !129)
!138 = !DILocation(line: 111, column: 22, scope: !129)
!139 = !DILocation(line: 111, column: 30, scope: !129)
!140 = !DILocation(line: 111, column: 33, scope: !129)
!141 = !DILocation(line: 111, column: 43, scope: !129)
!142 = !DILocation(line: 111, column: 45, scope: !129)
!143 = !DILocation(line: 111, column: 40, scope: !129)
!144 = !DILocation(line: 111, column: 52, scope: !129)
!145 = !DILocation(line: 111, column: 54, scope: !129)
!146 = !DILocation(line: 113, column: 12, scope: !147)
!147 = distinct !DILexicalBlock(scope: !129, file: !3, line: 112, column: 7)
!148 = !DILocation(line: 113, column: 10, scope: !147)
!149 = !DILocation(line: 114, column: 12, scope: !147)
!150 = !DILocation(line: 114, column: 10, scope: !147)
!151 = !DILocation(line: 115, column: 7, scope: !147)
!152 = !DILocation(line: 118, column: 42, scope: !98)
!153 = !DILocation(line: 118, column: 45, scope: !98)
!154 = !DILocation(line: 118, column: 11, scope: !98)
!155 = !DILocation(line: 119, column: 56, scope: !98)
!156 = !DILocation(line: 119, column: 66, scope: !98)
!157 = !DILocation(line: 119, column: 58, scope: !98)
!158 = !DILocation(line: 119, column: 72, scope: !98)
!159 = !DILocation(line: 119, column: 76, scope: !98)
!160 = !DILocation(line: 119, column: 74, scope: !98)
!161 = !DILocation(line: 119, column: 78, scope: !98)
!162 = !DILocation(line: 119, column: 81, scope: !98)
!163 = !DILocation(line: 119, column: 85, scope: !98)
!164 = !DILocation(line: 119, column: 83, scope: !98)
!165 = !DILocation(line: 0, scope: !98)
!166 = !DILocation(line: 119, column: 71, scope: !98)
!167 = !DILocation(line: 119, column: 11, scope: !98)
!168 = !DILocation(line: 122, column: 15, scope: !169)
!169 = distinct !DILexicalBlock(scope: !98, file: !3, line: 122, column: 15)
!170 = !DILocation(line: 122, column: 19, scope: !169)
!171 = !DILocation(line: 122, column: 17, scope: !169)
!172 = !DILocation(line: 122, column: 21, scope: !169)
!173 = !DILocation(line: 122, column: 24, scope: !169)
!174 = !DILocation(line: 122, column: 28, scope: !169)
!175 = !DILocation(line: 122, column: 26, scope: !169)
!176 = !DILocation(line: 122, column: 15, scope: !98)
!177 = !DILocation(line: 123, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !3, line: 122, column: 30)
!179 = !DILocation(line: 124, column: 17, scope: !178)
!180 = !DILocation(line: 127, column: 16, scope: !98)
!181 = !DILocation(line: 127, column: 11, scope: !98)
!182 = !DILocation(line: 127, column: 19, scope: !98)
!183 = !DILocation(line: 127, column: 21, scope: !98)
!184 = !DILocation(line: 129, column: 5, scope: !98)
!185 = !DILocation(line: 131, column: 6, scope: !98)
!186 = !DILocation(line: 133, column: 5, scope: !98)
!187 = distinct !{!187, !94, !188}
!188 = !DILocation(line: 134, column: 4, scope: !53)
!189 = !DILocation(line: 136, column: 1, scope: !53)
!190 = !DILocation(line: 137, column: 1, scope: !53)
