From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:38 -0800
Subject: [PATCH 16/21] ARC: testsuite fix: sysvipc/*
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-17-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                              |  1 +
 sysdeps/unix/sysv/linux/arc/ipc_priv.h | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 sysdeps/unix/sysv/linux/arc/ipc_priv.h

diff --git a/ChangeLog b/ChangeLog
index 909b1af09a31..d3a979a9236b 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -109,6 +109,7 @@
 	* sysdeps/arc/start.S: likewise.
 	* sysdeps/arc/entry.h: Add ENTRY_POINT define check.
 	* sysdeps/arc/crti.S: add .hidden annotations.
+	* sysdeps/unix/sysv/linux/arc/ipc_priv.h: New file.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/sysdeps/unix/sysv/linux/arc/ipc_priv.h b/sysdeps/unix/sysv/linux/arc/ipc_priv.h
new file mode 100644
index 000000000000..5f6e9815d169
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ipc_priv.h
@@ -0,0 +1,21 @@
+/* Old SysV permission definition for Linux.  ARC version.
+   Copyright (C) 2016-2018 Free Software Foundation, Inc.
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
+#include <sys/ipc.h>  /* For __key_t  */
+
+#define __IPC_64	0x0
-- 
2.7.4
