From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 28 Apr 2017 11:57:36 -0700
Subject: 4.2+ stable inclusion request: ARCv2: save r30 on kernel entry as gcc
 uses it for code-gen
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <bd36bc24-831f-a5ea-2b24-f4984a9b91cf@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

Can we please backport upstream ecd43afdbe72017aefe48080631eb625e177ef4d ("ARCv2:
save r30 on kernel entry as gcc uses it for code-gen") to 4.2 to 4.9 kernels.

While the issue cites gcc, it is general deficiency of kernel as userspace
programs can modify r30 register in hand/inline assembly and those will not be
preserved without this change.

Thx,
-Vineet
