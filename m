From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:46 -0800
Subject: [PATCH v2 06/15] ARC: math soft float support
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-7-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                                 |  5 +++
 sysdeps/arc/bits/fenv.h                   | 72 ++++++++++++++++++++++++++++++
 sysdeps/arc/nofpu/Implies                 |  1 +
 sysdeps/arc/nofpu/math-tests-exceptions.h | 27 ++++++++++++
 sysdeps/arc/nofpu/math-tests-rounding.h   | 27 ++++++++++++
 sysdeps/arc/sfp-machine.h                 | 73 +++++++++++++++++++++++++++++++
 6 files changed, 205 insertions(+)
 create mode 100644 sysdeps/arc/bits/fenv.h
 create mode 100644 sysdeps/arc/nofpu/Implies
 create mode 100644 sysdeps/arc/nofpu/math-tests-exceptions.h
 create mode 100644 sysdeps/arc/nofpu/math-tests-rounding.h
 create mode 100644 sysdeps/arc/sfp-machine.h

diff --git a/ChangeLog b/ChangeLog
index 5406e4c16fc2..1cf28bbbf96f 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -34,6 +34,11 @@
 	* sysdeps/arc/atomic-machine.h: New file.
 	* sysdeps/arc/nptl/bits/pthreadtypes-arch.h: New file.
 	* sysdeps/arc/nptl/bits/semaphore.h: New file.
+	* sysdeps/arc/bits/fenv.h: New file.
+	* sysdeps/arc/nofpu/Implies: New file.
+	* sysdeps/arc/nofpu/math-tests-exceptions.h: New file.
+	* sysdeps/arc/nofpu/math-tests-rounding.h: New file.
+	* sysdeps/arc/sfp-machine.h: New file.
 
 2019-01-25  Siddhesh Poyarekar  <siddhesh at sourceware.org>
 
diff --git a/sysdeps/arc/bits/fenv.h b/sysdeps/arc/bits/fenv.h
new file mode 100644
index 000000000000..58388fb43a35
--- /dev/null
+++ b/sysdeps/arc/bits/fenv.h
@@ -0,0 +1,72 @@
+/* Copyright (C) 2012-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#ifndef _FENV_H
+# error "Never use <bits/fenv.h> directly; include <fenv.h> instead."
+#endif
+
+enum
+  {
+    FE_INVALID   =
+# define FE_INVALID	(0x01)
+      FE_INVALID,
+    FE_DIVBYZERO =
+# define FE_DIVBYZERO	(0x02)
+      FE_DIVBYZERO,
+    FE_OVERFLOW  =
+# define FE_OVERFLOW	(0x04)
+      FE_OVERFLOW,
+    FE_UNDERFLOW =
+# define FE_UNDERFLOW	(0x08)
+      FE_UNDERFLOW,
+    FE_INEXACT   =
+# define FE_INEXACT	(0x10)
+      FE_INEXACT
+  };
+
+# define FE_ALL_EXCEPT \
+	(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW | FE_INEXACT)
+
+enum
+  {
+    FE_TOWARDZERO =
+# define FE_TOWARDZERO	(0x0)
+      FE_TOWARDZERO,
+    FE_TONEAREST  =
+# define FE_TONEAREST	(0x1)
+      FE_TONEAREST,
+    FE_UPWARD     =
+# define FE_UPWARD	(0x2)
+      FE_UPWARD,
+    FE_DOWNWARD   =
+# define FE_DOWNWARD	(0x3)
+      FE_DOWNWARD
+  };
+
+typedef unsigned int fexcept_t;
+typedef unsigned int fenv_t;
+
+/* If the default argument is used we use this value.  */
+#define FE_DFL_ENV	((const fenv_t *) -1)
+
+#if __GLIBC_USE (IEC_60559_BFP_EXT)
+/* Type representing floating-point control modes.  */
+typedef unsigned int femode_t;
+
+/* Default floating-point control modes.  */
+# define FE_DFL_MODE	((const femode_t *) -1L)
+#endif
diff --git a/sysdeps/arc/nofpu/Implies b/sysdeps/arc/nofpu/Implies
new file mode 100644
index 000000000000..abcbadb25f22
--- /dev/null
+++ b/sysdeps/arc/nofpu/Implies
@@ -0,0 +1 @@
+ieee754/soft-fp
diff --git a/sysdeps/arc/nofpu/math-tests-exceptions.h b/sysdeps/arc/nofpu/math-tests-exceptions.h
new file mode 100644
index 000000000000..f5c0b73589ed
--- /dev/null
+++ b/sysdeps/arc/nofpu/math-tests-exceptions.h
@@ -0,0 +1,27 @@
+/* Configuration for math tests. exceptions support ARC version.
+   Copyright (C) 2017-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#ifndef ARC_NOFPU_MATH_TESTS_EXCEPTIONS_H
+#define ARC_NOFPU_MATH_TESTS_EXCEPTIONS_H 1
+
+/* Soft-float doesnot support exceptions.  */
+#define EXCEPTION_TESTS_float		0
+#define EXCEPTION_TESTS_double		0
+#define EXCEPTION_TESTS_long_double	0
+
+#endif
diff --git a/sysdeps/arc/nofpu/math-tests-rounding.h b/sysdeps/arc/nofpu/math-tests-rounding.h
new file mode 100644
index 000000000000..e8f76338b1e5
--- /dev/null
+++ b/sysdeps/arc/nofpu/math-tests-rounding.h
@@ -0,0 +1,27 @@
+/* Configuration for math tests: rounding mode support.  ARC version.
+   Copyright (C) 2017-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */
+
+#ifndef ARC_NOFPU_MATH_TESTS_ROUNDING_H
+#define ARC_NOFPU_MATH_TESTS_ROUNDING_H 1
+
+/* Soft-float only supports to-nearest rounding mode.  */
+#define ROUNDING_TESTS_float(MODE)		((MODE) == FE_TONEAREST)
+#define ROUNDING_TESTS_double(MODE)		((MODE) == FE_TONEAREST)
+#define ROUNDING_TESTS_long_double(MODE)	((MODE) == FE_TONEAREST)
+
+#endif
diff --git a/sysdeps/arc/sfp-machine.h b/sysdeps/arc/sfp-machine.h
new file mode 100644
index 000000000000..5ceaf56a9884
--- /dev/null
+++ b/sysdeps/arc/sfp-machine.h
@@ -0,0 +1,73 @@
+/* Machine-dependent software floating-point definitions.  ARC version.
+   Copyright (C) 2004-2019 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+   Contributed by Richard Henderson (rth at cygnus.com),
+		  Jakub Jelinek (jj at ultra.linux.cz) and
+		  David S. Miller (davem at redhat.com).
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <http://www.gnu.org/licenses/>.  */
+
+
+#define _FP_W_TYPE_SIZE		32
+#define _FP_W_TYPE		unsigned long
+#define _FP_WS_TYPE		signed long
+#define _FP_I_TYPE		long
+
+#define _FP_MUL_MEAT_S(R,X,Y)				\
+  _FP_MUL_MEAT_1_wide(_FP_WFRACBITS_S,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_D(R,X,Y)				\
+  _FP_MUL_MEAT_2_wide(_FP_WFRACBITS_D,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_Q(R,X,Y)				\
+  _FP_MUL_MEAT_4_wide(_FP_WFRACBITS_Q,R,X,Y,umul_ppmm)
+
+#define _FP_MUL_MEAT_DW_S(R,X,Y)				\
+  _FP_MUL_MEAT_DW_1_wide(_FP_WFRACBITS_S,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_DW_D(R,X,Y)				\
+  _FP_MUL_MEAT_DW_2_wide(_FP_WFRACBITS_D,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_DW_Q(R,X,Y)				\
+  _FP_MUL_MEAT_DW_4_wide(_FP_WFRACBITS_Q,R,X,Y,umul_ppmm)
+
+#define _FP_DIV_MEAT_S(R,X,Y)	_FP_DIV_MEAT_1_loop(S,R,X,Y)
+#define _FP_DIV_MEAT_D(R,X,Y)	_FP_DIV_MEAT_2_udiv(D,R,X,Y)
+#define _FP_DIV_MEAT_Q(R,X,Y)	_FP_DIV_MEAT_4_udiv(Q,R,X,Y)
+
+#define _FP_NANFRAC_S		((_FP_QNANBIT_S << 1) - 1)
+#define _FP_NANFRAC_D		((_FP_QNANBIT_D << 1) - 1), -1
+#define _FP_NANFRAC_Q		((_FP_QNANBIT_Q << 1) - 1), -1, -1, -1
+#define _FP_NANSIGN_S		0
+#define _FP_NANSIGN_D		0
+#define _FP_NANSIGN_Q		0
+
+#define _FP_KEEPNANFRACP 1
+#define _FP_QNANNEGATEDP 0
+
+/* This is arbitrarily taken from the PowerPC version.  */
+#define _FP_CHOOSENAN(fs, wc, R, X, Y, OP)			\
+  do {								\
+    if ((_FP_FRAC_HIGH_RAW_##fs(X) & _FP_QNANBIT_##fs)		\
+	&& !(_FP_FRAC_HIGH_RAW_##fs(Y) & _FP_QNANBIT_##fs))	\
+      {								\
+	R##_s = Y##_s;						\
+	_FP_FRAC_COPY_##wc(R,Y);				\
+      }								\
+    else							\
+      {								\
+	R##_s = X##_s;						\
+	_FP_FRAC_COPY_##wc(R,X);				\
+      }								\
+    R##_c = FP_CLS_NAN;						\
+  } while (0)
+
+#define _FP_TININESS_AFTER_ROUNDING 0
-- 
2.7.4
