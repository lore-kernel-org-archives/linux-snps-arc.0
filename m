From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:49 -0800
Subject: [PATCH v2 09/15] ARC: Linux Startup and Dynamic Loading
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-10-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                               |  2 +
 sysdeps/unix/sysv/linux/arc/dl-static.c | 84 +++++++++++++++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/ldsodefs.h  | 32 +++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 sysdeps/unix/sysv/linux/arc/dl-static.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/ldsodefs.h

diff --git a/ChangeLog b/ChangeLog
index e0f2c3372e31..017bced57129 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -67,6 +67,8 @@
 	* sysdeps/unix/sysv/linux/arc/sys/user.h: New file.
 	* sysdeps/unix/sysv/linux/arc/ucontext-macros.h: New file.
 	* sysdeps/unix/sysv/linux/arc/ucontext_i.sym: New file.
+	* sysdeps/unix/sysv/linux/arc/dl-static.c: New file.
+	* sysdeps/unix/sysv/linux/arc/ldsodefs.h: New file.
 
 2019-01-25  Siddhesh Poyarekar  <siddhesh at sourceware.org>
 
diff --git a/sysdeps/unix/sysv/linux/arc/dl-static.c b/sysdeps/unix/sysv/linux/arc/dl-static.c
new file mode 100644
index 000000000000..1a8757c9840d
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/dl-static.c
@@ -0,0 +1,84 @@
+/* Variable initialization.  ARC version.
+   Copyright (C) 2001-2019 Free Software Foundation, Inc.
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
+#include <ldsodefs.h>
+
+#ifdef SHARED
+
+void
+_dl_var_init (void *array[])
+{
+  /* It has to match "variables" below. */
+  enum
+    {
+      DL_PAGESIZE = 0
+    };
+
+  GLRO(dl_pagesize) = *((size_t *) array[DL_PAGESIZE]);
+}
+
+#else
+
+static void *variables[] =
+{
+  &GLRO(dl_pagesize)
+};
+
+static void
+_dl_unprotect_relro (struct link_map *l)
+{
+  ElfW(Addr) start = ((l->l_addr + l->l_relro_addr)
+		      & ~(GLRO(dl_pagesize) - 1));
+  ElfW(Addr) end = ((l->l_addr + l->l_relro_addr + l->l_relro_size)
+		    & ~(GLRO(dl_pagesize) - 1));
+
+  if (start != end)
+    __mprotect ((void *) start, end - start, PROT_READ | PROT_WRITE);
+}
+
+void
+_dl_static_init (struct link_map *l)
+{
+  struct link_map *rtld_map = l;
+  struct r_scope_elem **scope;
+  const ElfW(Sym) *ref = NULL;
+  lookup_t loadbase;
+  void (*f) (void *[]);
+  size_t i;
+
+  loadbase = _dl_lookup_symbol_x ("_dl_var_init", l, &ref, l->l_local_scope,
+				  NULL, 0, 1, NULL);
+
+  for (scope = l->l_local_scope; *scope != NULL; scope++)
+    for (i = 0; i < (*scope)->r_nlist; i++)
+      if ((*scope)->r_list[i] == loadbase)
+	{
+	  rtld_map = (*scope)->r_list[i];
+	  break;
+	}
+
+  if (ref != NULL)
+    {
+      f = (void (*) (void *[])) DL_SYMBOL_ADDRESS (loadbase, ref);
+      _dl_unprotect_relro (rtld_map);
+      f (variables);
+      _dl_protect_relro (rtld_map);
+    }
+}
+
+#endif
diff --git a/sysdeps/unix/sysv/linux/arc/ldsodefs.h b/sysdeps/unix/sysv/linux/arc/ldsodefs.h
new file mode 100644
index 000000000000..8c5c6800af13
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ldsodefs.h
@@ -0,0 +1,32 @@
+/* Run-time dynamic linker data structures for loaded ELF shared objects. ARC
+   Copyright (C) 2001-2019 Free Software Foundation, Inc.
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
+#ifndef	_LDSODEFS_H
+
+/* Get the real definitions.  */
+#include_next <ldsodefs.h>
+
+/* Now define our stuff.  */
+
+/* We need special support to initialize DSO loaded for statically linked
+   binaries.  */
+extern void _dl_static_init (struct link_map *map);
+#undef DL_STATIC_INIT
+#define DL_STATIC_INIT(map) _dl_static_init (map)
+
+#endif /* ldsodefs.h */
-- 
2.7.4
