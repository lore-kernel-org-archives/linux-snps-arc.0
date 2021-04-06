Return-Path: <SRS0=Qs2K=JD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D29DC433ED
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Apr 2021 22:04:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A343861396
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Apr 2021 22:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A343861396
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eEa1Xqfxf3x9L3EPHhenyhYhK+CukSsa8rjOE5zsA1w=; b=NSGOHSFeCfm2YN3J34IwXuKrx9
	wjV6fMpHcc+/iRV0d478LWgGkhN5+GXlgTG8xIazKH/R8cCnnem+mE6pg1U7Gkw9p09tbxsRPLrnG
	/VPadaRWGdln+Cko+42tb/qEroKB4d9gXW66eA5LWU28qvuIMrZbcGF3s5uaem+p4BOjWNhxiQ4iM
	BOyYwlbgJ1FAtKK5rVXe1yvO7y4qOIX3ttqiri2xmY2Y8qXff58AtkdDFTRburDE7mWOUyNUl9LsA
	i48IyH2qcVBUaDBBnL6bZtQSbI6LKp5HQJGW/falQGznQrR6TNq0rWrfoANM26rWTjDv/zOVAWV0s
	Q/g8WnBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTtoJ-003Vm6-R8; Tue, 06 Apr 2021 22:04:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTtoC-003VlO-Gx
 for linux-snps-arc@lists.infradead.org; Tue, 06 Apr 2021 22:04:30 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 98B2C40150;
 Tue,  6 Apr 2021 22:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1617746660; bh=wWycp0sKaMaZAS0Yuar91rfZs/4YV5Xcf9s1dhf4Zws=;
 h=From:To:Cc:Subject:Date:From;
 b=kaWMqbjDBNaoukdyJ83HhW2ljqBNo2xLPxnoRodi4BP186pZp87CN/HIQngmQr37r
 Fe2816A20mlr2ipRuHxP80hGg1Etm7p0VfgaObLReP1l0WbxVsdoJ/ok6Fr5O/rvqg
 aOUCUMr3X/V6Zs7p6a9l2Q5ZjfzdOR+Yc0Ygti0muAGRme11E+gQt4I/vk5gEMu18t
 mHfhh7DIf/lR4ftKHbxfvw1vd7WBFMfML5+TlOCneIt42EW+MHovabF8jY387kHqHr
 x0Nt14WfxN1aixrGrhPDg4oUMBC6/3QhaBf8tlb5Wc/oumIegdbwus3eIhS6s5aOOE
 6/8RMK2tlXLfg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 73C64A0096;
 Tue,  6 Apr 2021 22:04:16 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: guile-devel@gnu.org
Cc: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH] add support for ARC architecture
Date: Tue,  6 Apr 2021 15:04:14 -0700
Message-Id: <20210406220414.2400239-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_230428_938849_F2EDDDA2 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 module/system/base/target.scm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/module/system/base/target.scm b/module/system/base/target.scm
index 2088cd86697a..8bdcd66039e4 100644
--- a/module/system/base/target.scm
+++ b/module/system/base/target.scm
@@ -77,7 +77,7 @@
       (cond ((string-match "^i[0-9]86$" cpu)
              (endianness little))
             ((member cpu '("x86_64" "ia64"
-                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "nios2" "sh3" "sh4" "alpha"))
+                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "nios2" "sh3" "sh4" "alpha" "arc"))
              (endianness little))
             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
                            "mips" "mips64" "m68k" "s390x"))
@@ -118,7 +118,7 @@
 
           ((string-match "64$" cpu) 8)
           ((string-match "64_?[lbe][lbe]$" cpu) 8)
-          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4")) 4)
+          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4" "arc")) 4)
           ((member cpu '("s390x" "alpha")) 8)
           ((string-match "^arm.*" cpu) 4)
           (else (error "unknown CPU word size" cpu)))))
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
