; ModuleID = 'times.f'
target datalayout = "e-p:32:32:32-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3 LLVM: exported\22"

define float @times_(float* %a, float* %b) nounwind uwtable {
entry:
  %a_addr = alloca float*, align 4
  %b_addr = alloca float*, align 4
  %memtmp = alloca float
  %memtmp1 = alloca float
  %"alloca point" = bitcast i32 0 to i32
  store float* %a, float** %a_addr
  store float* %b, float** %b_addr
  %0 = load float** %a_addr, align 32
  %1 = load float** %b_addr, align 32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %2 = load float* %0, align 4
  %3 = load float* %1, align 4
  %4 = fmul float %2, %3
  store float %4, float* %memtmp, align 4
  %5 = load float* %memtmp, align 4
  store float %5, float* %memtmp1, align 1
  br label %return

return:                                           ; preds = %"2"
  %retval = load float* %memtmp1
  ret float %retval
}
