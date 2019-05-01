From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 May 2019 15:53:29 -0700
Subject: [PATCH] tools/bpf: fix perf build error with uClibc (seen on ARC)
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1556751209-4778-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

When build perf for ARC recently, there was a build failure due to lack
of __NR_bpf.

| Auto-detecting system features:
|
| ...                     get_cpuid: [ OFF ]
| ...                           bpf: [ on  ]
|
| #  error __NR_bpf not defined. libbpf does not support your arch.
    ^~~~~
| bpf.c: In function 'sys_bpf':
| bpf.c:66:17: error: '__NR_bpf' undeclared (first use in this function)
|  return syscall(__NR_bpf, cmd, attr, size);
|                 ^~~~~~~~
|                 sys_bpf

The fix is to define a fallbak __NR_bpf.

The obvious fix with be __arc__ specific value, but i think a better fix
is to use the asm-generic uapi value applicable to ARC as well as any new
arch (hopefully we don't add an old existing arch here). Otherwise I can
just add __arc__

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 tools/lib/bpf/bpf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
index 9cd015574e83..2c5eb7928400 100644
--- a/tools/lib/bpf/bpf.c
+++ b/tools/lib/bpf/bpf.c
@@ -47,7 +47,10 @@
 # elif defined(__s390__)
 #  define __NR_bpf 351
 # else
-#  error __NR_bpf not defined. libbpf does not support your arch.
+/*
+ * Any non listed arch (new) will have to asm-generic uapi complient
+ */
+#  define __NR_bpf 280
 # endif
 #endif
 
-- 
2.7.4
