From: noamc@ezchip.com (Noam Camus)
Date: Sun, 1 Nov 2015 20:37:37 +0000
Subject: [PATCH] arc: dts - remove default value if
 CONFIG_ARC_BUILTIN_DTB_NAME is blank
In-Reply-To: <1446333671-32095-1-git-send-email-abrodkin@synopsys.com>
References: <1446333671-32095-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB1141A1EDC8370F67B5C0A862D62D0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

> From: linux-snps-arc <linux-snps-arc-bounces at lists.infradead.org> on behalf of Alexey Brodkin <Alexey.Brodkin at synopsys.com>
> Sent: Sunday, November 1, 2015 1:21 AM
> To: linux-snps-arc at lists.infradead.org
> Cc: Vineet Gupta; Alexey Brodkin; linux-kernel at vger.kernel.org
> Subject: [PATCH] arc: dts - remove default value if CONFIG_ARC_BUILTIN_DTB_NAME is blank

> As of today default .dtb will be built (and subsequently will be built-in
> kernel binary) even if CONFIG_ARC_BUILTIN_DTB_NAME is not set.

> But it is possible we're going to use external .dtb and so we don't want to
have .dtb built-in kernel binary.

> For example that could be the case with:
> a) U-Boot which loads .dtb in DDR and passes its address to the kernel
> b) OpenWRT which embeds .dtb in existing kernel binary

> This change excludes .dtb building if CONFIG_ARC_BUILTIN_DTB_NAME is
blank.

You can add my Ack (worked on my platform)
Noam
