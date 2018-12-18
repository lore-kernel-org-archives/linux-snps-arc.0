From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:26 -0800
Subject: [PATCH 04/21] ARC: startup and dynamic linking code
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-5-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Code for C runtime startup and dynamic loading including PLT layout.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                 |   6 +
 sysdeps/arc/bits/link.h   |  52 ++++++++
 sysdeps/arc/dl-machine.h  | 333 ++++++++++++++++++++++++++++++++++++++++++++++
 sysdeps/arc/ldsodefs.h    |  43 ++++++
 sysdeps/arc/sotruss-lib.c |  51 +++++++
 sysdeps/arc/start.S       |  81 +++++++++++
 sysdeps/arc/tst-audit.h   |  23 ++++
 7 files changed, 589 insertions(+)
 create mode 100644 sysdeps/arc/bits/link.h
 create mode 100644 sysdeps/arc/dl-machine.h
 create mode 100644 sysdeps/arc/ldsodefs.h
 create mode 100644 sysdeps/arc/sotruss-lib.c
 create mode 100644 sysdeps/arc/start.S
 create mode 100644 sysdeps/arc/tst-audit.h

diff --git a/ChangeLog b/ChangeLog
index c2efdafa9861..fd5602bde1a7 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -24,6 +24,12 @@
 	* sysdeps/arc/setjmp.S: New file.
 	* sysdeps/arc/sysdep.h: New file.
 	* sysdeps/arc/tls-macros.h: New file.
+	* sysdeps/arc/bits/link.h: New file.
+	* sysdeps/arc/dl-machine.h: New file.
+	* sysdeps/arc/ldsodefs.h: New file.
+	* sysdeps/arc/sotruss-lib.c: New file.
+	* sysdeps/arc/start.S: New file.
+	* sysdeps/arc/tst-audit.h: New file.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/sysdeps/arc/bits/link.h b/sysdeps/arc/bits/link.h
new file mode 100644
index 000000000000..1f4da2d9941c
--- /dev/null
+++ b/sysdeps/arc/bits/link.h
@@ -0,0 +1,52 @@
+/* Machine-specific declarations for dynamic linker interface, ARC version.
+   Copyright (C) 2009-2018 Free Software Foundation, Inc.
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
+#ifndef	_LINK_H
+# error "Never include <bits/link.h> directly; use <link.h> instead."
+#endif
+
+/* Registers for entry into PLT on ARC.  */
+typedef struct La_arc_regs
+{
+  uint32_t lr_reg[8]; /* r0 through r7 (upto 8 args) */
+} La_arc_regs;
+
+/* Return values for calls from PLT on ARC.  */
+typedef struct La_arc_retval
+{
+  /* For ARCv2, a 64-bit integer return value can use 2 regs */
+  uint32_t lrv_reg[2];
+} La_arc_retval;
+
+__BEGIN_DECLS
+
+extern Elf32_Addr la_arc_gnu_pltenter (Elf32_Sym *__sym, unsigned int __ndx,
+					 uintptr_t *__refcook,
+					 uintptr_t *__defcook,
+					 La_arc_regs *__regs,
+					 unsigned int *__flags,
+					 const char *__symname,
+					 long int *__framesizep);
+extern unsigned int la_arc_gnu_pltexit (Elf32_Sym *__sym, unsigned int __ndx,
+					  uintptr_t *__refcook,
+					  uintptr_t *__defcook,
+					  const La_arc_regs *__inregs,
+					  La_arc_retval *__outregs,
+					  const char *symname);
+
+__END_DECLS
diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
new file mode 100644
index 000000000000..da1aef79152d
--- /dev/null
+++ b/sysdeps/arc/dl-machine.h
@@ -0,0 +1,333 @@
+/* Machine-dependent ELF dynamic relocation inline functions.  ARC version.
+   Copyright (C) 1995-2018 Free Software Foundation, Inc.
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
+#ifndef dl_machine_h
+#define dl_machine_h
+
+#define ELF_MACHINE_NAME "arc"
+
+#include <string.h>
+#include <link.h>
+#include <dl-tls.h>
+
+/*
+ * Dynamic Linking ABI for ARCv2 ISA
+ *
+ *                      PLT
+ *        --------------------------------	<---- DT_PLTGOT
+ *        |  ld r11, [pcl, off-to-GOT[1] |  0
+ *        |                              |  4
+ * plt0   |  ld r10, [pcl, off-to-GOT[2] |  8
+ *        |                              | 12
+ *        |  j [r10]                     | 16
+ *        --------------------------------
+ *        |    Base address of GOT       | 20
+ *        --------------------------------
+ *        |  ld r12, [pcl, off-to-GOT[3] | 24
+ * plt1   |                              |
+ *        |  j.d    [r12]                | 32
+ *        |  mov    r12, pcl             | 36
+ *        --------------------------------
+ *        |                              | 40
+ *        ~                              ~
+ *        ~                              ~
+ *        |                              |
+ *        --------------------------------
+ *
+ *             .got
+ *        --------------
+ *        |    [0]     |
+ *        |    ...     |  Runtime address for data symbols
+ *        |    [n]     |
+ *        --------------
+ *
+ * 	     .got.plt
+ *        --------------
+ *        |    [0]     |  Build address of .dynamic
+ *        --------------
+ *        |    [1]     |  Module info - setup by ld.so
+ *        --------------
+ *        |    [2]     |  resolver entry point
+ *        --------------
+ *        |    [3]     |
+ *        |    ...     |  Runtime address for function symbols
+ *        |    [f]     |
+ *        --------------
+ *
+ * For ARCompact, the PLT is 12 bytes due to short instructions
+ *
+ *        --------------------------------
+ *        |  ld r12, [pcl, off-to-GOT[3] | 24   (12 bytes each)
+ * plt1   |                              |
+ *        |  j_s.d  [r12]                | 32
+ *        |  mov_s  r12, pcl             | 34
+ *        --------------------------------
+ *        |                              | 36
+ *
+ */
+
+/* Return nonzero iff ELF header is compatible with the running host.  */
+static inline int
+elf_machine_matches_host (const Elf32_Ehdr *ehdr)
+{
+  return (ehdr->e_machine == EM_ARCV2  /* ARC HS */
+	  || ehdr->e_machine == EM_ARC_COMPACT); /* ARC 700 */
+}
+
+/*
+ * Get build time address of .dynamic as setup in GOT[0]
+ * This is called very early in _dl_start() so it has not been relocated to
+ * runtime value
+ */
+static inline Elf32_Addr
+elf_machine_dynamic (void)
+{
+  extern const Elf32_Addr _GLOBAL_OFFSET_TABLE_[] attribute_hidden;
+  return _GLOBAL_OFFSET_TABLE_[0];
+}
+
+
+/* Return the run-time load address of the shared object.  */
+static inline Elf32_Addr
+elf_machine_load_address (void)
+{
+  Elf32_Addr build_addr, run_addr;
+
+  /* For build address, below generates
+   * ld  r0, [pcl, _GLOBAL_OFFSET_TABLE_ at pcl]
+   */
+  build_addr = elf_machine_dynamic();
+  __asm__ ("add %0, pcl, _DYNAMIC at pcl	\n" : "=r" (run_addr));
+
+  return run_addr - build_addr;
+}
+
+/* Set up the loaded object described by L so its unrelocated PLT
+   entries will jump to the on-demand fixup code in dl-runtime.c.  */
+
+static inline int __attribute__ ((always_inline))
+elf_machine_runtime_setup (struct link_map *l, int lazy, int profile)
+{
+  extern void _dl_runtime_resolve (Elf32_Word);
+
+  if (l->l_info[DT_JMPREL] && lazy)
+    {
+      /* On ARC DT_PLTGOT point to .plt whose 5th word (after the PLT header)
+       * contains the address of .got */
+      Elf32_Addr *plt_base = (Elf32_Addr *) D_PTR (l, l_info[DT_PLTGOT]);
+      Elf32_Addr *got = (Elf32_Addr *) (plt_base[5] + l->l_addr);
+
+      got[1] = (Elf32_Addr) l;	/* Identify this shared object.  */
+
+      /* This function will get called to fix up the GOT entry indicated by
+	 the offset on the stack, and then jump to the resolved address.  */
+      got[2] = (Elf32_Addr) &_dl_runtime_resolve;
+    }
+
+  return lazy;
+}
+
+/* What this code does:
+    -ldso starts execution here when kernel returns from execve()
+    -calls into generic ldso entry point _dl_start( )
+    -optionally adjusts argc for executable if exec passed as cmd
+    -calls into app main with address of finaliser */
+
+#define RTLD_START asm ("\
+.text								\n\
+.globl _start							\n\
+.type _start, @function						\n\
+_start:								\n\
+	; (1). bootstrap ld.so					\n\
+	bl.d    _dl_start                                       \n\
+	mov_s   r0, sp          ; pass ptr to aux vector tbl    \n\
+	mov r13, r0		; safekeep app elf entry point	\n\
+								\n\
+	; (2). If ldso ran with executable as arg		\n\
+	;      skip the extra args calc by dl_start()		\n\
+	ld_s    r1, [sp]       ; orig argc			\n\
+	ld      r12, [pcl, _dl_skip_args at pcl]                   \n\
+	breq	r12, 0, 1f					\n\
+								\n\
+	add2    sp, sp, r12    ; discard argv entries from stack\n\
+	sub_s   r1, r1, r12    ; adjusted argc, on stack        \n\
+	st_s    r1, [sp]                                        \n\
+	add	r2, sp, 4					\n\
+	ld	r3, [pcl, _dl_argv at gotpc]    ; ST doesn't support this addressing mode	\n\
+	st	r2, [r3]					\n\
+1:								\n\
+	; (3). call preinit stuff				\n\
+	ld	r0, [pcl, _rtld_local at pcl]			\n\
+	add	r2, sp, 4	; argv				\n\
+	add2	r3, r2, r1					\n\
+	add	r3, r3, 4	; env				\n\
+	bl	_dl_init at plt					\n\
+								\n\
+	; (4) call app elf entry point				\n\
+	add     r0, pcl, _dl_fini at pcl				\n\
+	j	[r13]						\n\
+								\n\
+	.size  _start,.-_start                                  \n\
+	.previous                                               \n\
+");
+
+/* ELF_RTYPE_CLASS_PLT iff TYPE describes relocation of a PLT entry, so
+   PLT entries should not be allowed to define the value.
+   ELF_RTYPE_CLASS_NOCOPY iff TYPE should not be allowed to resolve to one
+   of the main executable's symbols, as for a COPY reloc.  */
+#define elf_machine_type_class(type)				\
+  ((((type) == R_ARC_JUMP_SLOT					\
+     || (type) == R_ARC_TLS_DTPMOD				\
+     || (type) == R_ARC_TLS_DTPOFF				\
+     || (type) == R_ARC_TLS_TPOFF) * ELF_RTYPE_CLASS_PLT)	\
+   | (((type) == R_ARC_COPY) * ELF_RTYPE_CLASS_COPY))
+
+/* A reloc type used for ld.so cmdline arg lookups to reject PLT entries.  */
+#define ELF_MACHINE_JMP_SLOT  R_ARC_JUMP_SLOT
+
+/* ARC uses Elf32_Rela relocations.  */
+#define ELF_MACHINE_NO_REL 1
+#define ELF_MACHINE_NO_RELA 0
+
+/* Fixup a PLT entry to bounce directly to the function at VALUE.  */
+
+static inline Elf32_Addr
+elf_machine_fixup_plt (struct link_map *map, lookup_t t,
+		       const ElfW(Sym) *refsym, const ElfW(Sym) *sym,
+		       const Elf32_Rela *reloc,
+		       Elf32_Addr *reloc_addr, Elf32_Addr value)
+{
+  return *reloc_addr = value;
+}
+
+/* Return the final value of a plt relocation.  */
+static inline Elf32_Addr
+elf_machine_plt_value (struct link_map *map, const Elf32_Rela *reloc,
+                       Elf32_Addr value)
+{
+  return value;
+}
+
+/* Names of the architecture-specific auditing callback functions.  */
+#define ARCH_LA_PLTENTER arc_gnu_pltenter
+#define ARCH_LA_PLTEXIT arc_gnu_pltexit
+
+#endif /* dl_machine_h */
+
+#ifdef RESOLVE_MAP
+
+auto inline void __attribute__ ((always_inline))
+elf_machine_rela (struct link_map *map, const ElfW(Rela) *reloc,
+                  const ElfW(Sym) *sym, const struct r_found_version *version,
+                  void *const reloc_addr_arg, int skip_ifunc)
+{
+  Elf32_Addr *const reloc_addr = reloc_addr_arg;
+  const unsigned int r_type = ELF32_R_TYPE (reloc->r_info);
+
+  if (__glibc_unlikely (r_type == R_ARC_RELATIVE))
+    *reloc_addr += map->l_addr;
+  else if (__glibc_unlikely (r_type == R_ARC_NONE))
+    return;
+  else
+    {
+      const Elf32_Sym *const refsym = sym;
+      struct link_map *sym_map = RESOLVE_MAP (&sym, version, r_type);
+      Elf32_Addr value = SYMBOL_ADDRESS (sym_map, sym, true);
+
+      switch (r_type)
+	{
+        case R_ARC_COPY:
+          if (sym == NULL)
+            /* This can happen in trace mode if an object could not be
+               found.  */
+            break;
+          if (sym->st_size > refsym->st_size
+              || (sym->st_size < refsym->st_size && GLRO(dl_verbose)))
+            {
+              const char *strtab;
+
+              strtab = (const void *) D_PTR (map, l_info[DT_STRTAB]);
+              _dl_error_printf ("\
+%s: Symbol `%s' has different size in shared object, consider re-linking\n",
+				rtld_progname ?: "<program name unknown>",
+				strtab + refsym->st_name);
+            }
+          memcpy (reloc_addr_arg, (void *) value,
+                  MIN (sym->st_size, refsym->st_size));
+          break;
+	case R_ARC_GLOB_DAT:
+	case R_ARC_JUMP_SLOT:
+            *reloc_addr = value;
+          break;
+        case R_ARC_TLS_DTPMOD:
+          /* Get the information from the link map returned by the
+             resolv function.  */
+          if (sym_map != NULL)
+            *reloc_addr = sym_map->l_tls_modid;
+          break;
+
+        case R_ARC_TLS_DTPOFF:
+          if (sym != NULL)
+            {
+              *reloc_addr = sym->st_value;
+            }
+          break;
+
+        case R_ARC_TLS_TPOFF:
+          if (sym != NULL)
+            {
+              CHECK_STATIC_TLS (map, sym_map);
+              *reloc_addr = sym_map->l_tls_offset + sym->st_value + reloc->r_addend;
+            }
+          break;
+        case R_ARC_32:
+          *reloc_addr += value + reloc->r_addend;
+          break;
+
+        case R_ARC_PC32:
+          *reloc_addr += value + reloc->r_addend - (unsigned long) reloc_addr;
+          break;
+
+	default:
+          _dl_reloc_bad_type (map, r_type, 0);
+          break;
+	}
+    }
+}
+
+auto inline void __attribute__((always_inline))
+elf_machine_rela_relative (ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
+			   void *const reloc_addr_arg)
+{
+  Elf32_Addr *const reloc_addr = reloc_addr_arg;
+  *reloc_addr += l_addr; // + reloc->r_addend;
+}
+
+auto inline void __attribute__((always_inline))
+elf_machine_lazy_rel (struct link_map *map,
+		      ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
+		      int skip_ifunc)
+{
+  Elf32_Addr *const reloc_addr = (void *) (l_addr + reloc->r_offset);
+  if (ELF32_R_TYPE (reloc->r_info) == R_ARC_JUMP_SLOT)
+    *reloc_addr += l_addr;
+  else
+    _dl_reloc_bad_type (map, ELF32_R_TYPE (reloc->r_info), 1);
+}
+
+#endif /* RESOLVE_MAP */
diff --git a/sysdeps/arc/ldsodefs.h b/sysdeps/arc/ldsodefs.h
new file mode 100644
index 000000000000..3fafc683da2e
--- /dev/null
+++ b/sysdeps/arc/ldsodefs.h
@@ -0,0 +1,43 @@
+/* Run-time dynamic linker data structures for loaded ELF shared objects.
+   Copyright (C) 2000-2018 Free Software Foundation, Inc.
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
+#ifndef _ARC_LDSODEFS_H
+#define _ARC_LDSODEFS_H 1
+
+#include <elf.h>
+
+struct La_arc_regs;
+struct La_arc_retval;
+
+#define ARCH_PLTENTER_MEMBERS						\
+    ElfW(Addr) (*arc_gnu_pltenter) (ElfW(Sym) *, unsigned int,	\
+				      uintptr_t *, uintptr_t *,		\
+				      const struct La_arc_regs *,	\
+				      unsigned int *, const char *,	\
+				      long int *);
+
+#define ARCH_PLTEXIT_MEMBERS						\
+    unsigned int (*arc_gnu_pltexit) (ElfW(Sym) *, unsigned int,	\
+				       uintptr_t *, uintptr_t *,	\
+				       const struct La_arc_regs *,	\
+				       struct La_arc_retval *,	\
+				       const char *);
+
+#include_next <ldsodefs.h>
+
+#endif
diff --git a/sysdeps/arc/sotruss-lib.c b/sysdeps/arc/sotruss-lib.c
new file mode 100644
index 000000000000..fc6a009e913a
--- /dev/null
+++ b/sysdeps/arc/sotruss-lib.c
@@ -0,0 +1,51 @@
+/* Override generic sotruss-lib.c to define actual functions for ARC.
+   Copyright (C) 2017-2018 Free Software Foundation, Inc.
+
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
+#define HAVE_ARCH_PLTENTER
+#define HAVE_ARCH_PLTEXIT
+
+#include <elf/sotruss-lib.c>
+
+ElfW(Addr)
+la_arc_gnu_pltenter (ElfW(Sym) *sym __attribute__ ((unused)),
+		       unsigned int ndx __attribute__ ((unused)),
+		       uintptr_t *refcook, uintptr_t *defcook,
+		       La_arc_regs *regs, unsigned int *flags,
+		       const char *symname, long int *framesizep)
+{
+  print_enter (refcook, defcook, symname,
+	       regs->lr_reg[0], regs->lr_reg[1], regs->lr_reg[2],
+	       *flags);
+
+  /* No need to copy anything, we will not need the parameters in any case.  */
+  *framesizep = 0;
+
+  return sym->st_value;
+}
+
+unsigned int
+la_arc_gnu_pltexit (ElfW(Sym) *sym, unsigned int ndx, uintptr_t *refcook,
+		      uintptr_t *defcook,
+		      const struct La_arc_regs *inregs,
+		      struct La_arc_retval *outregs, const char *symname)
+{
+  print_exit (refcook, defcook, symname, outregs->lrv_reg[0]);
+
+  return 0;
+}
diff --git a/sysdeps/arc/start.S b/sysdeps/arc/start.S
new file mode 100644
index 000000000000..119d596db07f
--- /dev/null
+++ b/sysdeps/arc/start.S
@@ -0,0 +1,81 @@
+/* Startup code for ARC
+   Copyright (C) 1995-2018 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   In addition to the permissions in the GNU Lesser General Public
+   License, the Free Software Foundation gives you unlimited
+   permission to link the compiled version of this file with other
+   programs, and to distribute those programs without any restriction
+   coming from the use of this file. (The GNU Lesser General Public
+   License restrictions do apply in other respects; for example, they
+   cover modification of the file, and distribution when not linked
+   into another program.)
+
+   Note that people who make modified versions of this file are not
+   obligated to grant this special exception for their modified
+   versions; it is their choice whether to do so. The GNU Lesser
+   General Public License gives permission to release a modified
+   version without this exception; this exception also makes it
+   possible to release a modified version which carries forward this
+   exception.
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
+/* When we enter this piece of code, the program stack looks like this:
+        argc            argument counter (integer)
+        argv[0]         program name (pointer)
+        argv[1...N]     program args (pointers)
+        argv[argc-1]    end of args (integer)
+	NULL
+        env[0...N]      environment variables (pointers)
+        NULL
+*/
+	.text
+	.align 4
+	.global _start
+	.type _start, at function
+_start:
+	mov	fp, 0
+	ld_s	r1, [sp]	; argc
+
+	mov_s	r5, r0		; rltd_fini
+	add_s	r2, sp, 4	; argv
+	and	sp, sp, -8
+	mov	r6, sp
+
+#ifdef SHARED
+	ld	r0, [pcl, @main at gotpc]
+	ld	r3, [pcl, @__libc_csu_init at gotpc]
+	ld	r4, [pcl, @__libc_csu_fini at gotpc]
+	bl	__libc_start_main at plt
+#else
+	mov_s	r0, main
+	mov_s	r3, __libc_csu_init
+	mov	r4, __libc_csu_fini
+	bl	__libc_start_main
+#endif
+	/* __libc_start_main (main, argc, argv, init, fini, rtld_fini, stack_end) */
+
+	/* Should never get here....  */
+	flag    1
+
+/* Define a symbol for the first piece of initialized data.  */
+	.data
+	.globl __data_start
+__data_start:
+	.long 0
+	.weak data_start
+	data_start = __data_start
diff --git a/sysdeps/arc/tst-audit.h b/sysdeps/arc/tst-audit.h
new file mode 100644
index 000000000000..8ae3734cd50c
--- /dev/null
+++ b/sysdeps/arc/tst-audit.h
@@ -0,0 +1,23 @@
+/* Definitions for testing PLT entry/exit auditing.  ARC version.
+   Copyright (C) 2009-2018 Free Software Foundation, Inc.
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
+#define pltenter la_arc_gnu_pltenter
+#define pltexit la_arc_gnu_pltexit
+#define La_regs La_arc_regs
+#define La_retval La_arc_retval
+#define int_retval lrv_reg[0]
-- 
2.7.4
