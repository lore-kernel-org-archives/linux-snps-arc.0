Return-Path: <SRS0=s6v2=24=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF620C33C8C
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 16:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B55E92073D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 16:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dfd2Ec3p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyjPtgAp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B55E92073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=svX8sQ10m+tDVFbvmIdkLlcHbsQwyopGS9a+bDlWtnQ=; b=Dfd2Ec3p+oP7760BuVKNKQhtVP
	3Zpt4Pwnxrls2wTguEzdFAP9mcCWHxFXiCKhE44nPNVVvjQpbzXxFsrel1GfzU68vy8hyTMgeqwbb
	b4hllK+YhERJvSsz6qzW1aDH4bYSKk1Q+9d7OVqRvCoMvKgK4bqgakZG4Z/cGB2U6M9a7ab4BXT2b
	T02x+lstCowIJ1tjK0l4/nWah0irg7HzIVD0xaue+HZv034cH//C1wLr3N9uewGroQXOvfOeSbprW
	2jNFiCL5JRtdhBrMfUByKOCAuS/8VBHiyOth5TYFaQMoWuNiLrijtjyuKJXa/YZV7iOAsB6ycY/q8
	tZvmDbgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ios7v-0002Oo-Sf; Tue, 07 Jan 2020 16:54:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ios7t-0002O9-GX
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jan 2020 16:54:42 +0000
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E4BC24676;
 Tue,  7 Jan 2020 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578416081;
 bh=pyS3wZ02TYoQQFrhCaT28XntjPpq/hHYDQKnecGVi1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MyjPtgApzAeWBBxzp9EQBWQXZ+iwA999spRine79c7OM4lsnSPBUGIGrBr9MZxl+K
 qVZbWWFCLhelBQoFuIPPOarD6WgO7KDyfRquNgQ3rTLR4Z1FvS7QTS1zTSCX5JmiYr
 znxaQdgOb6csvJ/r8Qjz1jvr9IFWhhb4LsApylCQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, virtualization@lists.linux-foundation.org,
 linux-arch@vger.kernel.org
Subject: [RFT 06/13] arc: Constify ioreadX() iomem argument (as in generic
 implementation)
Date: Tue,  7 Jan 2020 17:53:05 +0100
Message-Id: <1578415992-24054-9-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578415992-24054-1-git-send-email-krzk@kernel.org>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_085441_584139_A7605394 
X-CRM114-Status: GOOD (  12.56  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The ioreadX() helpers have inconsistent interface.  On some architectures
void *__iomem address argument is a pointer to const, on some not.

Implementations of ioreadX() do not modify the memory under the
address so they can be converted to a "const" version for const-safety
and consistency among architectures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arc/plat-axs10x/axs10x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index 63ea5a606ecd..180c260a8221 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -84,7 +84,7 @@ static void __init axs10x_print_board_ver(unsigned int creg, const char *str)
 		unsigned int val;
 	} board;
 
-	board.val = ioread32((void __iomem *)creg);
+	board.val = ioread32((const void __iomem *)creg);
 	pr_info("AXS: %s FPGA Date: %u-%u-%u\n", str, board.d, board.m,
 		board.y);
 }
@@ -95,7 +95,7 @@ static void __init axs10x_early_init(void)
 	char mb[32];
 
 	/* Determine motherboard version */
-	if (ioread32((void __iomem *) CREG_MB_CONFIG) & (1 << 28))
+	if (ioread32((const void __iomem *) CREG_MB_CONFIG) & (1 << 28))
 		mb_rev = 3;	/* HT-3 (rev3.0) */
 	else
 		mb_rev = 2;	/* HT-2 (rev2.0) */
-- 
2.7.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
