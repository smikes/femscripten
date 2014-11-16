; ModuleID = 'hello_world.f'
target datalayout = "e-p:32:32:32-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3 LLVM: exported\22"

%struct.__st_parameter_dt = type { %struct.__st_parameter_common, i64, i64*, i64*, i8*, i8*, i32, i32, i8*, i8*, i32, i32, i8*, [192 x i8], i32*, i64, i8*, i32, i32, i8*, i8*, i32, i32, i8*, i8*, i32, i32, i8*, i8*, i32 }
%struct.__st_parameter_common = type { i32, i32, i8*, i32, i32, i8*, i32* }

@.cst = linker_private constant [14 x i8] c"hello_world.f\00", align 8
@.cst1 = linker_private constant [12 x i8] c"Hello World!", align 8
@options.1.1491 = internal constant [8 x i32] [i32 68, i32 511, i32 0, i32 0, i32 0, i32 1, i32 0, i32 1], align 32

define internal void @MAIN__() nounwind uwtable {
entry:
  %memtmp = alloca %struct.__st_parameter_dt
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %0 = getelementptr inbounds %struct.__st_parameter_dt* %memtmp, i32 0, i32 0
  %1 = getelementptr inbounds %struct.__st_parameter_common* %0, i32 0, i32 2
  store i8* getelementptr inbounds ([14 x i8]* @.cst, i32 0, i32 0), i8** %1, align 4
  %2 = getelementptr inbounds %struct.__st_parameter_dt* %memtmp, i32 0, i32 0
  %3 = getelementptr inbounds %struct.__st_parameter_common* %2, i32 0, i32 3
  store i32 1, i32* %3, align 4
  %4 = getelementptr inbounds %struct.__st_parameter_dt* %memtmp, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__st_parameter_common* %4, i32 0, i32 0
  store i32 128, i32* %5, align 4
  %6 = getelementptr inbounds %struct.__st_parameter_dt* %memtmp, i32 0, i32 0
  %7 = getelementptr inbounds %struct.__st_parameter_common* %6, i32 0, i32 1
  store i32 6, i32* %7, align 4
  call void @_gfortran_st_write(%struct.__st_parameter_dt* %memtmp) nounwind
  call void @_gfortran_transfer_character_write(%struct.__st_parameter_dt* %memtmp, i8* getelementptr inbounds ([12 x i8]* @.cst1, i32 0, i32 0), i32 12) nounwind
  call void @_gfortran_st_write_done(%struct.__st_parameter_dt* %memtmp) nounwind
  br label %return

return:                                           ; preds = %"2"
  ret void
}

declare void @_gfortran_st_write(%struct.__st_parameter_dt*)

declare void @_gfortran_transfer_character_write(%struct.__st_parameter_dt*, i8*, i32)

declare void @_gfortran_st_write_done(%struct.__st_parameter_dt*)

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 4
  %memtmp = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  %0 = load i32* %argc_addr, align 32
  %1 = load i8*** %argv_addr, align 32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  call void @_gfortran_set_args(i32 %0, i8** %1) nounwind
  call void @_gfortran_set_options(i32 8, i32* getelementptr inbounds ([8 x i32]* @options.1.1491, i32 0, i32 0)) nounwind
  call void @MAIN__() nounwind uwtable
  store i32 0, i32* %memtmp, align 1
  br label %return

return:                                           ; preds = %"2"
  %retval = load i32* %memtmp
  ret i32 %retval
}

declare void @_gfortran_set_args(i32, i8**)

declare void @_gfortran_set_options(i32, i32*)
