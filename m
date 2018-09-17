From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 18 Sep 2018 00:29:36 +0300
Subject: [PATCH 03/10] kernel-arch.bbclass: Add ARC to kernel arch map
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180917212943.27237-4-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/classes/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 09793fc..2b52a63 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -22,6 +22,7 @@ def map_kernel_arch(a, d):
     valid_archs = d.getVar('valid_archs').split()
 
     if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
+    elif re.match('arceb$', a):                 return 'arc'
     elif re.match('armeb$', a):                 return 'arm'
     elif re.match('aarch64$', a):               return 'arm64'
     elif re.match('aarch64_be$', a):            return 'arm64'
-- 
1.8.3.1
