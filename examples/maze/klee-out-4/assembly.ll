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
@.str.7 = private unnamed_addr constant [8 x i8] c"program\00", align 1
@.str.8 = private unnamed_addr constant [40 x i8] c"Wrong command!(only w,s,a,d accepted!)\0A\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"You loose!\0A\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"You win!\0A\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"Your solution <%42s>\0A\00", align 1
@.str.12 = private unnamed_addr constant [34 x i8] c"Iteration no. %d. Action: %c. %s\0A\00", align 1
@.str.13 = private unnamed_addr constant [9 x i8] c"Blocked!\00", align 1
@.str.14 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.15 = private unnamed_addr constant [11 x i8] c"You loose\0A\00", align 1

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
  call void @klee_make_symbolic(i8* %26, i64 28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0)), !dbg !93
  br label %27, !dbg !94

27:                                               ; preds = %128, %2
  %28 = load i32, i32* %10, align 4, !dbg !95
  %29 = icmp slt i32 %28, 28, !dbg !96
  br i1 %29, label %30, label %138, !dbg !94

30:                                               ; preds = %27
  %31 = load i32, i32* %6, align 4, !dbg !97
  store i32 %31, i32* %8, align 4, !dbg !99
  %32 = load i32, i32* %7, align 4, !dbg !100
  store i32 %32, i32* %9, align 4, !dbg !101
  %33 = load i32, i32* %10, align 4, !dbg !102
  %34 = sext i32 %33 to i64, !dbg !103
  %35 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 %34, !dbg !103
  %36 = load i8, i8* %35, align 1, !dbg !103
  %37 = sext i8 %36 to i32, !dbg !103
  switch i32 %37, label %50 [
    i32 119, label %38
    i32 115, label %41
    i32 97, label %44
    i32 100, label %47
  ], !dbg !104

38:                                               ; preds = %30
  %39 = load i32, i32* %7, align 4, !dbg !105
  %40 = add nsw i32 %39, -1, !dbg !105
  store i32 %40, i32* %7, align 4, !dbg !105
  br label %53, !dbg !107

41:                                               ; preds = %30
  %42 = load i32, i32* %7, align 4, !dbg !108
  %43 = add nsw i32 %42, 1, !dbg !108
  store i32 %43, i32* %7, align 4, !dbg !108
  br label %53, !dbg !109

44:                                               ; preds = %30
  %45 = load i32, i32* %6, align 4, !dbg !110
  %46 = add nsw i32 %45, -1, !dbg !110
  store i32 %46, i32* %6, align 4, !dbg !110
  br label %53, !dbg !111

47:                                               ; preds = %30
  %48 = load i32, i32* %6, align 4, !dbg !112
  %49 = add nsw i32 %48, 1, !dbg !112
  store i32 %49, i32* %6, align 4, !dbg !112
  br label %53, !dbg !113

50:                                               ; preds = %30
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.8, i64 0, i64 0)), !dbg !114
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i64 0, i64 0)), !dbg !115
  call void @exit(i32 -1) #4, !dbg !116
  unreachable, !dbg !116

53:                                               ; preds = %47, %44, %41, %38
  %54 = load i32, i32* %7, align 4, !dbg !117
  %55 = sext i32 %54 to i64, !dbg !119
  %56 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %55, !dbg !119
  %57 = load i32, i32* %6, align 4, !dbg !120
  %58 = sext i32 %57 to i64, !dbg !119
  %59 = getelementptr inbounds [11 x i8], [11 x i8]* %56, i64 0, i64 %58, !dbg !119
  %60 = load i8, i8* %59, align 1, !dbg !119
  %61 = sext i8 %60 to i32, !dbg !119
  %62 = icmp eq i32 %61, 35, !dbg !121
  br i1 %62, label %63, label %67, !dbg !122

63:                                               ; preds = %53
  %64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i64 0, i64 0)), !dbg !123
  %65 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 0, !dbg !125
  %66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.11, i64 0, i64 0), i8* %65), !dbg !126
  call void @exit(i32 1) #4, !dbg !127
  unreachable, !dbg !127

67:                                               ; preds = %53
  %68 = load i32, i32* %7, align 4, !dbg !128
  %69 = sext i32 %68 to i64, !dbg !130
  %70 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %69, !dbg !130
  %71 = load i32, i32* %6, align 4, !dbg !131
  %72 = sext i32 %71 to i64, !dbg !130
  %73 = getelementptr inbounds [11 x i8], [11 x i8]* %70, i64 0, i64 %72, !dbg !130
  %74 = load i8, i8* %73, align 1, !dbg !130
  %75 = sext i8 %74 to i32, !dbg !130
  %76 = icmp ne i32 %75, 32, !dbg !132
  br i1 %76, label %77, label %97, !dbg !133

77:                                               ; preds = %67
  %78 = load i32, i32* %7, align 4, !dbg !134
  %79 = icmp eq i32 %78, 2, !dbg !135
  br i1 %79, label %80, label %94, !dbg !136

80:                                               ; preds = %77
  %81 = load i32, i32* %7, align 4, !dbg !137
  %82 = sext i32 %81 to i64, !dbg !138
  %83 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %82, !dbg !138
  %84 = load i32, i32* %6, align 4, !dbg !139
  %85 = sext i32 %84 to i64, !dbg !138
  %86 = getelementptr inbounds [11 x i8], [11 x i8]* %83, i64 0, i64 %85, !dbg !138
  %87 = load i8, i8* %86, align 1, !dbg !138
  %88 = sext i8 %87 to i32, !dbg !138
  %89 = icmp eq i32 %88, 124, !dbg !140
  %90 = load i32, i32* %6, align 4, !dbg !141
  %91 = icmp sgt i32 %90, 0, !dbg !142
  %or.cond = and i1 %89, %91, !dbg !143
  %92 = load i32, i32* %6, align 4, !dbg !144
  %93 = icmp slt i32 %92, 11, !dbg !145
  %or.cond3 = and i1 %or.cond, %93, !dbg !143
  br i1 %or.cond3, label %97, label %94, !dbg !143

94:                                               ; preds = %80, %77
  %95 = load i32, i32* %8, align 4, !dbg !146
  store i32 %95, i32* %6, align 4, !dbg !148
  %96 = load i32, i32* %9, align 4, !dbg !149
  store i32 %96, i32* %7, align 4, !dbg !150
  br label %97, !dbg !151

97:                                               ; preds = %80, %94, %67
  %98 = load i32, i32* %6, align 4, !dbg !152
  %99 = load i32, i32* %7, align 4, !dbg !153
  %100 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 %98, i32 %99), !dbg !154
  %101 = load i32, i32* %10, align 4, !dbg !155
  %102 = load i32, i32* %10, align 4, !dbg !156
  %103 = sext i32 %102 to i64, !dbg !157
  %104 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 %103, !dbg !157
  %105 = load i8, i8* %104, align 1, !dbg !157
  %106 = sext i8 %105 to i32, !dbg !157
  %107 = load i32, i32* %8, align 4, !dbg !158
  %108 = load i32, i32* %6, align 4, !dbg !159
  %109 = icmp eq i32 %107, %108, !dbg !160
  br i1 %109, label %110, label %114, !dbg !161

110:                                              ; preds = %97
  %111 = load i32, i32* %9, align 4, !dbg !162
  %112 = load i32, i32* %7, align 4, !dbg !163
  %113 = icmp eq i32 %111, %112, !dbg !164
  br label %114

114:                                              ; preds = %110, %97
  %115 = phi i1 [ false, %97 ], [ %113, %110 ], !dbg !165
  %116 = zext i1 %115 to i64, !dbg !166
  %117 = select i1 %115, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i64 0, i64 0), !dbg !166
  %118 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.12, i64 0, i64 0), i32 %101, i32 %106, i8* %117), !dbg !167
  %119 = load i32, i32* %8, align 4, !dbg !168
  %120 = load i32, i32* %6, align 4, !dbg !170
  %121 = icmp eq i32 %119, %120, !dbg !171
  br i1 %121, label %122, label %128, !dbg !172

122:                                              ; preds = %114
  %123 = load i32, i32* %9, align 4, !dbg !173
  %124 = load i32, i32* %7, align 4, !dbg !174
  %125 = icmp eq i32 %123, %124, !dbg !175
  br i1 %125, label %126, label %128, !dbg !176

126:                                              ; preds = %122
  %127 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.15, i64 0, i64 0)), !dbg !177
  call void @exit(i32 -2) #4, !dbg !179
  unreachable, !dbg !179

128:                                              ; preds = %122, %114
  %129 = load i32, i32* %7, align 4, !dbg !180
  %130 = sext i32 %129 to i64, !dbg !181
  %131 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %130, !dbg !181
  %132 = load i32, i32* %6, align 4, !dbg !182
  %133 = sext i32 %132 to i64, !dbg !181
  %134 = getelementptr inbounds [11 x i8], [11 x i8]* %131, i64 0, i64 %133, !dbg !181
  store i8 88, i8* %134, align 1, !dbg !183
  call void @draw(), !dbg !184
  %135 = load i32, i32* %10, align 4, !dbg !185
  %136 = add nsw i32 %135, 1, !dbg !185
  store i32 %136, i32* %10, align 4, !dbg !185
  %137 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !186
  br label %27, !dbg !94, !llvm.loop !187

138:                                              ; preds = %27
  %139 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.15, i64 0, i64 0)), !dbg !189
  %140 = load i32, i32* %3, align 4, !dbg !190
  ret i32 %140, !dbg !190
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

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
!1 = distinct !DIGlobalVariable(name: "maze", scope: !2, file: !3, line: 22, type: !6, isLocal: false, isDefinition: true)
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
!15 = distinct !DISubprogram(name: "draw", scope: !3, file: !3, line: 33, type: !16, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !15, file: !3, line: 35, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 35, column: 6, scope: !15)
!21 = !DILocalVariable(name: "j", scope: !15, file: !3, line: 35, type: !19)
!22 = !DILocation(line: 35, column: 9, scope: !15)
!23 = !DILocation(line: 36, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !15, file: !3, line: 36, column: 2)
!25 = !DILocation(line: 36, column: 7, scope: !24)
!26 = !DILocation(line: 36, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !3, line: 36, column: 2)
!28 = !DILocation(line: 36, column: 16, scope: !27)
!29 = !DILocation(line: 36, column: 2, scope: !24)
!30 = !DILocation(line: 38, column: 12, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 38, column: 5)
!32 = distinct !DILexicalBlock(scope: !27, file: !3, line: 37, column: 4)
!33 = !DILocation(line: 38, column: 10, scope: !31)
!34 = !DILocation(line: 38, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !3, line: 38, column: 5)
!36 = !DILocation(line: 38, column: 19, scope: !35)
!37 = !DILocation(line: 38, column: 5, scope: !31)
!38 = !DILocation(line: 39, column: 26, scope: !35)
!39 = !DILocation(line: 39, column: 21, scope: !35)
!40 = !DILocation(line: 39, column: 29, scope: !35)
!41 = !DILocation(line: 39, column: 7, scope: !35)
!42 = !DILocation(line: 38, column: 25, scope: !35)
!43 = !DILocation(line: 38, column: 5, scope: !35)
!44 = distinct !{!44, !37, !45}
!45 = !DILocation(line: 39, column: 31, scope: !31)
!46 = !DILocation(line: 40, column: 5, scope: !32)
!47 = !DILocation(line: 36, column: 22, scope: !27)
!48 = !DILocation(line: 36, column: 2, scope: !27)
!49 = distinct !{!49, !29, !50}
!50 = !DILocation(line: 41, column: 4, scope: !24)
!51 = !DILocation(line: 42, column: 2, scope: !15)
!52 = !DILocation(line: 43, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 50, type: !54, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!19, !19, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !3, line: 50, type: !19)
!59 = !DILocation(line: 50, column: 11, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !3, line: 50, type: !56)
!61 = !DILocation(line: 50, column: 23, scope: !53)
!62 = !DILocalVariable(name: "x", scope: !53, file: !3, line: 52, type: !19)
!63 = !DILocation(line: 52, column: 6, scope: !53)
!64 = !DILocalVariable(name: "y", scope: !53, file: !3, line: 52, type: !19)
!65 = !DILocation(line: 52, column: 9, scope: !53)
!66 = !DILocalVariable(name: "ox", scope: !53, file: !3, line: 53, type: !19)
!67 = !DILocation(line: 53, column: 6, scope: !53)
!68 = !DILocalVariable(name: "oy", scope: !53, file: !3, line: 53, type: !19)
!69 = !DILocation(line: 53, column: 10, scope: !53)
!70 = !DILocalVariable(name: "i", scope: !53, file: !3, line: 54, type: !19)
!71 = !DILocation(line: 54, column: 6, scope: !53)
!72 = !DILocalVariable(name: "program", scope: !53, file: !3, line: 56, type: !73)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 224, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 28)
!76 = !DILocation(line: 56, column: 10, scope: !53)
!77 = !DILocation(line: 59, column: 4, scope: !53)
!78 = !DILocation(line: 60, column: 4, scope: !53)
!79 = !DILocation(line: 61, column: 10, scope: !53)
!80 = !DILocation(line: 61, column: 5, scope: !53)
!81 = !DILocation(line: 61, column: 13, scope: !53)
!82 = !DILocation(line: 61, column: 15, scope: !53)
!83 = !DILocation(line: 64, column: 5, scope: !53)
!84 = !DILocation(line: 65, column: 36, scope: !53)
!85 = !DILocation(line: 65, column: 39, scope: !53)
!86 = !DILocation(line: 65, column: 5, scope: !53)
!87 = !DILocation(line: 66, column: 34, scope: !53)
!88 = !DILocation(line: 66, column: 5, scope: !53)
!89 = !DILocation(line: 67, column: 5, scope: !53)
!90 = !DILocation(line: 68, column: 5, scope: !53)
!91 = !DILocation(line: 71, column: 5, scope: !53)
!92 = !DILocation(line: 74, column: 24, scope: !53)
!93 = !DILocation(line: 74, column: 5, scope: !53)
!94 = !DILocation(line: 76, column: 2, scope: !53)
!95 = !DILocation(line: 76, column: 8, scope: !53)
!96 = !DILocation(line: 76, column: 10, scope: !53)
!97 = !DILocation(line: 79, column: 10, scope: !98)
!98 = distinct !DILexicalBlock(scope: !53, file: !3, line: 77, column: 4)
!99 = !DILocation(line: 79, column: 8, scope: !98)
!100 = !DILocation(line: 80, column: 10, scope: !98)
!101 = !DILocation(line: 80, column: 8, scope: !98)
!102 = !DILocation(line: 82, column: 21, scope: !98)
!103 = !DILocation(line: 82, column: 13, scope: !98)
!104 = !DILocation(line: 82, column: 5, scope: !98)
!105 = !DILocation(line: 85, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !3, line: 83, column: 7)
!107 = !DILocation(line: 86, column: 8, scope: !106)
!108 = !DILocation(line: 88, column: 9, scope: !106)
!109 = !DILocation(line: 89, column: 8, scope: !106)
!110 = !DILocation(line: 91, column: 9, scope: !106)
!111 = !DILocation(line: 92, column: 8, scope: !106)
!112 = !DILocation(line: 94, column: 9, scope: !106)
!113 = !DILocation(line: 95, column: 8, scope: !106)
!114 = !DILocation(line: 97, column: 11, scope: !106)
!115 = !DILocation(line: 98, column: 11, scope: !106)
!116 = !DILocation(line: 99, column: 11, scope: !106)
!117 = !DILocation(line: 103, column: 14, scope: !118)
!118 = distinct !DILexicalBlock(scope: !98, file: !3, line: 103, column: 9)
!119 = !DILocation(line: 103, column: 9, scope: !118)
!120 = !DILocation(line: 103, column: 17, scope: !118)
!121 = !DILocation(line: 103, column: 20, scope: !118)
!122 = !DILocation(line: 103, column: 9, scope: !98)
!123 = !DILocation(line: 105, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !3, line: 104, column: 7)
!125 = !DILocation(line: 106, column: 41, scope: !124)
!126 = !DILocation(line: 106, column: 8, scope: !124)
!127 = !DILocation(line: 107, column: 8, scope: !124)
!128 = !DILocation(line: 110, column: 14, scope: !129)
!129 = distinct !DILexicalBlock(scope: !98, file: !3, line: 110, column: 9)
!130 = !DILocation(line: 110, column: 9, scope: !129)
!131 = !DILocation(line: 110, column: 17, scope: !129)
!132 = !DILocation(line: 110, column: 20, scope: !129)
!133 = !DILocation(line: 111, column: 9, scope: !129)
!134 = !DILocation(line: 112, column: 12, scope: !129)
!135 = !DILocation(line: 112, column: 14, scope: !129)
!136 = !DILocation(line: 112, column: 19, scope: !129)
!137 = !DILocation(line: 112, column: 27, scope: !129)
!138 = !DILocation(line: 112, column: 22, scope: !129)
!139 = !DILocation(line: 112, column: 30, scope: !129)
!140 = !DILocation(line: 112, column: 33, scope: !129)
!141 = !DILocation(line: 112, column: 43, scope: !129)
!142 = !DILocation(line: 112, column: 45, scope: !129)
!143 = !DILocation(line: 112, column: 40, scope: !129)
!144 = !DILocation(line: 112, column: 52, scope: !129)
!145 = !DILocation(line: 112, column: 54, scope: !129)
!146 = !DILocation(line: 114, column: 12, scope: !147)
!147 = distinct !DILexicalBlock(scope: !129, file: !3, line: 113, column: 7)
!148 = !DILocation(line: 114, column: 10, scope: !147)
!149 = !DILocation(line: 115, column: 12, scope: !147)
!150 = !DILocation(line: 115, column: 10, scope: !147)
!151 = !DILocation(line: 116, column: 7, scope: !147)
!152 = !DILocation(line: 119, column: 42, scope: !98)
!153 = !DILocation(line: 119, column: 45, scope: !98)
!154 = !DILocation(line: 119, column: 11, scope: !98)
!155 = !DILocation(line: 120, column: 56, scope: !98)
!156 = !DILocation(line: 120, column: 66, scope: !98)
!157 = !DILocation(line: 120, column: 58, scope: !98)
!158 = !DILocation(line: 120, column: 72, scope: !98)
!159 = !DILocation(line: 120, column: 76, scope: !98)
!160 = !DILocation(line: 120, column: 74, scope: !98)
!161 = !DILocation(line: 120, column: 78, scope: !98)
!162 = !DILocation(line: 120, column: 81, scope: !98)
!163 = !DILocation(line: 120, column: 85, scope: !98)
!164 = !DILocation(line: 120, column: 83, scope: !98)
!165 = !DILocation(line: 0, scope: !98)
!166 = !DILocation(line: 120, column: 71, scope: !98)
!167 = !DILocation(line: 120, column: 11, scope: !98)
!168 = !DILocation(line: 123, column: 15, scope: !169)
!169 = distinct !DILexicalBlock(scope: !98, file: !3, line: 123, column: 15)
!170 = !DILocation(line: 123, column: 19, scope: !169)
!171 = !DILocation(line: 123, column: 17, scope: !169)
!172 = !DILocation(line: 123, column: 21, scope: !169)
!173 = !DILocation(line: 123, column: 24, scope: !169)
!174 = !DILocation(line: 123, column: 28, scope: !169)
!175 = !DILocation(line: 123, column: 26, scope: !169)
!176 = !DILocation(line: 123, column: 15, scope: !98)
!177 = !DILocation(line: 124, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !3, line: 123, column: 30)
!179 = !DILocation(line: 125, column: 17, scope: !178)
!180 = !DILocation(line: 128, column: 16, scope: !98)
!181 = !DILocation(line: 128, column: 11, scope: !98)
!182 = !DILocation(line: 128, column: 19, scope: !98)
!183 = !DILocation(line: 128, column: 21, scope: !98)
!184 = !DILocation(line: 130, column: 5, scope: !98)
!185 = !DILocation(line: 132, column: 6, scope: !98)
!186 = !DILocation(line: 134, column: 5, scope: !98)
!187 = distinct !{!187, !94, !188}
!188 = !DILocation(line: 135, column: 4, scope: !53)
!189 = !DILocation(line: 137, column: 1, scope: !53)
!190 = !DILocation(line: 138, column: 1, scope: !53)
