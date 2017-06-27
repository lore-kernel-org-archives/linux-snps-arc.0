From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 11:00:49 +0300
Subject: [RFC 1/6] upstream: comment update
In-Reply-To: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1498550454-3560-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 sysdeps/unix/make-syscalls.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sysdeps/unix/make-syscalls.sh b/sysdeps/unix/make-syscalls.sh
index 123553c1d900..d9e607681740 100644
--- a/sysdeps/unix/make-syscalls.sh
+++ b/sysdeps/unix/make-syscalls.sh
@@ -7,7 +7,7 @@
 #
 # This script is used to process the syscall data encoded in the various
 # syscalls.list files to produce thin assembly syscall wrappers around the
-# appropriate OS syscall. See syscall-template.s for more details on the
+# appropriate OS syscall. See syscall-template.S for more details on the
 # actual wrapper.
 #
 # Syscall Signature Prefixes:
-- 
2.7.4
