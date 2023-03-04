/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
signed int odinsigs(signed int *llvm_cbe_addr_o, signed int *llvm_cbe_req_o, signed int *llvm_cbe_ack_o, signed int *llvm_cbe_AEROUT_ADDR, signed int *llvm_cbe_AEROUT_REQ, signed int *llvm_cbe_AEROUT_ACK, signed int *llvm_cbe_writeloc, signed int *llvm_cbe_pop_n, signed int *llvm_cbe_postneuron, signed int llvm_cbe_CTRL_SCHED_POP_N, signed int llvm_cbe_CTRL_NEURMEM_ADDR, signed int llvm_cbe_NEUR_EVENT_OUT, signed int llvm_cbe_AEROUT_CTRL_BUSY);


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

signed int odinsigs(signed int *llvm_cbe_addr_o, signed int *llvm_cbe_req_o, signed int *llvm_cbe_ack_o, signed int *llvm_cbe_AEROUT_ADDR, signed int *llvm_cbe_AEROUT_REQ, signed int *llvm_cbe_AEROUT_ACK, signed int *llvm_cbe_writeloc, signed int *llvm_cbe_pop_n, signed int *llvm_cbe_postneuron, signed int llvm_cbe_CTRL_SCHED_POP_N, signed int llvm_cbe_CTRL_NEURMEM_ADDR, signed int llvm_cbe_NEUR_EVENT_OUT, signed int llvm_cbe_AEROUT_CTRL_BUSY) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  signed int llvm_cbe_tmp__1;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  signed int llvm_cbe_tmp__2;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  signed int llvm_cbe_tmp__3;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  signed int llvm_cbe_tmp__4;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  unsigned long long llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  unsigned int llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  unsigned long long llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  unsigned int llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  unsigned int llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  unsigned int llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @odinsigs\n");
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%CTRL_SCHED_POP_N, i32* %%1, align  for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_23_count);
  *((unsigned int volatile*)(&llvm_cbe_tmp__1)) = llvm_cbe_CTRL_SCHED_POP_N;
if (AESL_DEBUG_TRACE)
printf("\nCTRL_SCHED_POP_N = 0x%X\n", llvm_cbe_CTRL_SCHED_POP_N);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%CTRL_NEURMEM_ADDR, i32* %%2, align  for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_25_count);
  *((unsigned int volatile*)(&llvm_cbe_tmp__2)) = llvm_cbe_CTRL_NEURMEM_ADDR;
if (AESL_DEBUG_TRACE)
printf("\nCTRL_NEURMEM_ADDR = 0x%X\n", llvm_cbe_CTRL_NEURMEM_ADDR);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%NEUR_EVENT_OUT, i32* %%3, align  for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_27_count);
  *((unsigned int volatile*)(&llvm_cbe_tmp__3)) = llvm_cbe_NEUR_EVENT_OUT;
if (AESL_DEBUG_TRACE)
printf("\nNEUR_EVENT_OUT = 0x%X\n", llvm_cbe_NEUR_EVENT_OUT);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%AEROUT_CTRL_BUSY, i32* %%4, align  for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_29_count);
  *((unsigned int volatile*)(&llvm_cbe_tmp__4)) = llvm_cbe_AEROUT_CTRL_BUSY;
if (AESL_DEBUG_TRACE)
printf("\nAEROUT_CTRL_BUSY = 0x%X\n", llvm_cbe_AEROUT_CTRL_BUSY);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = ptrtoint i32* %%AEROUT_ADDR to i64, !dbg !2 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_30_count);
  llvm_cbe_tmp__5 = (unsigned long long )((unsigned long long )(unsigned long)llvm_cbe_AEROUT_ADDR&18446744073709551615ULL);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = trunc i64 %%5 to i32, !dbg !2 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_31_count);
  llvm_cbe_tmp__6 = (unsigned int )((unsigned int )llvm_cbe_tmp__5&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__6);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%6, i32* %%addr_o, align 4, !dbg !2 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_32_count);
  *((unsigned int volatile*)llvm_cbe_addr_o) = llvm_cbe_tmp__6;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__6);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = ptrtoint i32* %%AEROUT_REQ to i64, !dbg !2 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_33_count);
  llvm_cbe_tmp__7 = (unsigned long long )((unsigned long long )(unsigned long)llvm_cbe_AEROUT_REQ&18446744073709551615ULL);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%I64X\n", llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = trunc i64 %%7 to i32, !dbg !2 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_34_count);
  llvm_cbe_tmp__8 = (unsigned int )((unsigned int )llvm_cbe_tmp__7&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%8, i32* %%req_o, align 4, !dbg !2 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_35_count);
  *((unsigned int volatile*)llvm_cbe_req_o) = llvm_cbe_tmp__8;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load volatile i32* %%ack_o, align 4, !dbg !3 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_36_count);
  llvm_cbe_tmp__9 = (unsigned int )*((unsigned int volatile*)llvm_cbe_ack_o);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%9, i32* %%AEROUT_ACK, align 4, !dbg !3 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_37_count);
  *((unsigned int volatile*)llvm_cbe_AEROUT_ACK) = llvm_cbe_tmp__9;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load volatile i32* %%1, align 4, !dbg !4 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_39_count);
  llvm_cbe_tmp__10 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__1));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%10, i32* %%pop_n, align 4, !dbg !4 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_40_count);
  *((unsigned int volatile*)llvm_cbe_pop_n) = llvm_cbe_tmp__10;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = load volatile i32* %%2, align 4, !dbg !4 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_42_count);
  llvm_cbe_tmp__11 = (unsigned int )*((unsigned int volatile*)(&llvm_cbe_tmp__2));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__11);
if (AESL_DEBUG_TRACE)
printf("\n  store volatile i32 %%11, i32* %%postneuron, align 4, !dbg !4 for 0x%I64xth hint within @odinsigs  --> \n", ++aesl_llvm_cbe_43_count);
  *((unsigned int volatile*)llvm_cbe_postneuron) = llvm_cbe_tmp__11;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__11);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @odinsigs}\n");
  return 1u;
}

