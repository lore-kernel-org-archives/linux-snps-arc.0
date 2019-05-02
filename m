From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 2 May 2019 08:56:50 -0700
Subject: [PATCH v2] tools/bpf: fix perf build error with uClibc (seen on ARC)
In-Reply-To: <CAH3MdRVkUFfwKkgT-pi-RLBpcEf6n0bAwWZOu-=7+qctPTCpkw@mail.gmail.com>
References: <CAH3MdRVkUFfwKkgT-pi-RLBpcEf6n0bAwWZOu-=7+qctPTCpkw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1556812610-27957-1-git-send-email-vgupta@synopsys.com>
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

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
v1 -> v2
  - Only add syscall nr for ARC, as asm-generic won't work with arm/sh [Y Song]
---
 tools/lib/bpf/bpf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
index 9cd015574e83..d82edadf7589 100644
--- a/tools/lib/bpf/bpf.c
+++ b/tools/lib/bpf/bpf.c
@@ -46,6 +46,8 @@
 #  define __NR_bpf 349
 # elif defined(__s390__)
 #  define __NR_bpf 351
+# elif defined(__arc__)
+#  define __NR_bpf 280
 # else
 #  error __NR_bpf not defined. libbpf does not support your arch.
 # endif
-- 
2.7.4
