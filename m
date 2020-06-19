Return-Path: <SRS0=d2VE=AA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFFCC433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Jun 2020 23:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0960321527
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Jun 2020 23:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p7UDkrpE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I93NdOUW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0960321527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iJpadBoOhmNZHZLQE6GwVly3A31T9rQ/yQws//ZBhbI=; b=p7UDkrpExAEnbo
	Q+QfXQKGhKU6nxwLWLCozQ5QvqMEzA3L7zb+fzYDbiPmC+oyn/2nu9jzKDasCPe9Ck4G2S/9yUG9F
	3ZfFsAuNsOnijlofDGpz/4fNlCScatdCP0X5ol5nKGJuZsc3oAyBYFsinW3jyuahE9E7IMWFOroW8
	HBpGGHviND1R0uWn0fRKl4WqpkiYddle61+rWmUzAEZr2NxwUoiIbjZBJxKI3stZNcvfqk0hmdvTh
	IvTU2KDexpc4FKfZC3QYG9jglVvbOsCE/fonOt+zyOfAQi9JnqJ1sGZvpR8td7M8SMlPuslY2tZot
	F3YtdVfdQ1pon6hdjSWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmQho-0005Al-To; Fri, 19 Jun 2020 23:45:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmQhm-0005AD-V6
 for linux-snps-arc@lists.infradead.org; Fri, 19 Jun 2020 23:45:56 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7C68CC007F;
 Fri, 19 Jun 2020 23:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1592610353; bh=Uxm45FAsmyVxYzsmtfuyZgYSx+QsH3pcXMwKYtSZPJc=;
 h=From:To:Cc:Subject:Date:From;
 b=I93NdOUWbYLnPT1kX59c7z/dSEB/kFlnIt66x5+pKqvr55Et9KZ/bPS0yfVatqXMi
 t4lF5VGpQsPw1BPF5D3QK6Wwz5CsY42I9Wv1yqzOq0YCpxtXdYsEsiEaI8oPTHFHt1
 FRFQP1tovP0nxQzOYm5MGdG19J/dSoSC7xnA/B4Gcdt2OfCbOYM8BDg1+itDR+D/xO
 HpkzKURJpSYj4NJMZvgDOXwvGmchyzlDsujm+wF7YAgVfnSXTj2qAuzgYEc3yg0BUL
 nOOS2IoeyXomk8RtxKIlAYCD+bucrNWBrddhFWMmdwKNpq7LILcblYJwekgc3gw+1n
 kZtA4vqnEhMaQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 2903AA0246;
 Fri, 19 Jun 2020 23:45:53 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet.Gupta1@synopsys.com
To: numpy-discussion@python.org
Subject: [PATCH] Revert "FIX: no FPU exceptions bits on ARC glibc"
Date: Fri, 19 Jun 2020 16:45:51 -0700
Message-Id: <20200619234551.12620-1-vineet.gupta1@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_164555_036332_0FDC3F65 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Vineet Gupta <vgupta@synopsys.com>

ARC glibc has supported fenv.h for quite some time, for either
soft and hard so this workaround is no longer needed.

This reverts commit 1125f1ee33324bc91b4e8dd9da49163af572d04a.
---
 numpy/core/src/npymath/ieee754.c.src | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
index 3f66b24a4c84..f3f15f84152b 100644
--- a/numpy/core/src/npymath/ieee754.c.src
+++ b/numpy/core/src/npymath/ieee754.c.src
@@ -682,7 +682,7 @@ void npy_set_floatstatus_invalid(void)
 }
 
 #elif defined(_MSC_VER) || (defined(__osf__) && defined(__alpha)) || \
-      defined (__UCLIBC__) || (defined(__arc__) && defined(__GLIBC__))
+      defined (__UCLIBC__)
 
 /*
  * By using a volatile floating point value,
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
