From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 25 May 2016 17:13:31 +0530
Subject: ARC stable backport request
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57458FE3.1070205@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

Can we please backport a6416f57ce57fb390b "ARC: use ASL assembler mnemonic".
Newer binutils don't like ASL instruction and fail to build kernels prior to v4.4
which added this fix.

Thx,
-Vineet
