From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 18 Sep 2018 00:29:34 +0300
Subject: [PATCH 01/10] siteinfo: Define data for ARC
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180917212943.27237-2-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/classes/siteinfo.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 86bb853b..dccf122 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -20,6 +20,8 @@ def siteinfo_data(d):
         "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
         "aarch64": "endian-little bit-64 arm-common arm-64",
         "aarch64_be": "endian-big bit-64 arm-common arm-64",
+        "arc": "endian-little bit-32 arc-common",
+        "arceb": "endian-big bit-32 arc-common",
         "arm": "endian-little bit-32 arm-common arm-32",
         "armeb": "endian-big bit-32 arm-common arm-32",
         "avr32": "endian-big bit-32 avr32-common",
-- 
1.8.3.1
