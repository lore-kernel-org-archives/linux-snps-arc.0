Return-Path: <SRS0=RmAe=IU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6FDC433C1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 12:33:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C15619A9
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 12:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C15619A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6V+aSpwy0g8J6Be+eezCEfdD4/5NS9SlA8J/bPkUCJg=; b=DuNNM2WxJBXBt+
	yLXzF0MAWY2aCU7Hsa8ftJo9SaIAHyLG5mXcwBJgpawvbu8Mikr6Hl8XT673J2S8S+0jj1RjzfER6
	Vh6zms1kcT+bqa6ddPpsCZIFGZJ2uDnZJF5/qfPanap40Fqa9yZHgnL3AOiNaji+NLaqnfMZOdzWF
	7dCpEFfnNxASGfThxZ/TBypzygDndKRYMF6RGrcaadUYnaQKAJqG67r/ID/Tmop9cMU++KDYrUHfI
	JkHiCWIIIB3uH2HUdrUBZTs0QWfH2QAlFe/fop40voO/wzbSVqUfQ89IzEupSEL4YKjuJNEzRGuu5
	5S0erVqyDWV5y5z2OaXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOJkT-00BauK-MG; Mon, 22 Mar 2021 12:33:34 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOJkA-00BaqE-Oa
 for linux-snps-arc@lists.infradead.org; Mon, 22 Mar 2021 12:33:18 +0000
Received: by mail-qt1-x82b.google.com with SMTP id f12so12123851qtq.4
 for <linux-snps-arc@lists.infradead.org>; Mon, 22 Mar 2021 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tylfcxECJZP31c4RSnnvxS0KkHn7aB+u1Ic56YVdIuo=;
 b=rH9qUsPgW6cE3AOHHep9mv5GCwPYVoda2tozm1XFrhrmw8tvYjI5WvGlSjkED5GALR
 KNR6X1S9Z3SzMvwkC7MCqS9z4tLuaeua3JkZvwxMnswcagOalHaQWPxOzpsNGJaSg4y3
 2g9bmy9loh2dBx1l8p+Pc+e51vlk1QNTbmOkZdToXRAdX75Nmt7LXm4DQ80PEZIjVV/D
 SpABqqGCcrJ0PulXZ6CPQesOMeboU/vRRzvY1K8BsatgG3p/ir5bOk6lA8DUbMa7oXia
 fVMNcG8NBMolhiOu1vQMNgMbEDG5kj4dafMwK5yeFObepbinzDVO5cvVdw41LMpwTkgY
 DuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tylfcxECJZP31c4RSnnvxS0KkHn7aB+u1Ic56YVdIuo=;
 b=Ndy+EKA6lbI22sG4hL27PvPjSF9iNRIr7PkYOmccEpd39dMFHhzDAe5iCls6jS3QCL
 Wvdn2DjxHs06+rgPD2I4uVQquPtYQNJm/QXCYalmkipNAMAORNTeyYipnNYmbIjrRhRT
 sdbZpHq+Mmb7pn/hu4of9OV7oZQq7lxnqLoAjs4tDVLjkXxEaTfV2zg++DYW8blVm3a3
 JnMUfXm8KrtpYqA+lEN0Kh0Fu7ANK8qSvqUTGIha7ImQdT7I8fCqE4JBso8oE59XB+tr
 cvTdkdZbuu+k2vCV7YEukSCb13n2fM4EIdre1g7Q+hORukb+eYl0pTxErSe6SIlGt5X2
 OWLQ==
X-Gm-Message-State: AOAM531uHdd9fE0PqmZzwHBHfj0JpiU+9k6kD3B8itJmX00HgABeZo+U
 9KrFpFqjJsuyVLCpnMtbK3w=
X-Google-Smtp-Source: ABdhPJzOSAYoV4CVQmg0IM11726ZDkB3l1jN4DwIE5aV4BhdqCXHohaHnKRDTfOcwqYiTzEIJvu65A==
X-Received: by 2002:ac8:7089:: with SMTP id y9mr9246287qto.264.1616416391503; 
 Mon, 22 Mar 2021 05:33:11 -0700 (PDT)
Received: from localhost.localdomain ([143.244.44.200])
 by smtp.gmail.com with ESMTPSA id l8sm8755852qtr.19.2021.03.22.05.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:33:11 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: vgupta@synopsys.com, rdunlap@infradead.org, unixbhaskar@gmail.com,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arc: include/asm: Couple of spelling fixes
Date: Mon, 22 Mar 2021 18:02:59 +0530
Message-Id: <20210322123259.2894194-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_123316_073088_2FA42E05 
X-CRM114-Status: GOOD (  12.49  )
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


s/interrpted/interrupted/
s/defintion/definition/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/arc/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 9b87e162e539..dfeffa25499b 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -116,7 +116,7 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
  *
  * Technically the lock is also needed for UP (boils down to irq save/restore)
  * but we can cheat a bit since cmpxchg() atomic_ops_lock() would cause irqs to
- * be disabled thus can't possibly be interrpted/preempted/clobbered by xchg()
+ * be disabled thus can't possibly be interrupted/preempted/clobbered by xchg()
  * Other way around, xchg is one instruction anyways, so can't be interrupted
  * as such
  */
@@ -143,7 +143,7 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
 /*
  * "atomic" variant of xchg()
  * REQ: It needs to follow the same serialization rules as other atomic_xxx()
- * Since xchg() doesn't always do that, it would seem that following defintion
+ * Since xchg() doesn't always do that, it would seem that following definition
  * is incorrect. But here's the rationale:
  *   SMP : Even xchg() takes the atomic_ops_lock, so OK.
  *   LLSC: atomic_ops_lock are not relevant at all (even if SMP, since LLSC
--
2.31.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
