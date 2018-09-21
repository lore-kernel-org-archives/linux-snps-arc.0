From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 21 Sep 2018 17:26:01 +0300
Subject: [PATCH v3 2/9] kernel-arch.bbclass: Add ARC to kernel arch map
In-Reply-To: <20180921142608.36203-1-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180921142608.36203-3-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---

No changes in v3.

No changes in v2.

 meta/classes/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 09793fc9c2..2b52a63c64 100644
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
2.16.2
