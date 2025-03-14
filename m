Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3853AC35FF1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Mar 2025 07:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tW5FKfpsL1Da48v3ZvmID88GlGH7OBSdDSLVaSXKIbY=; b=GSMPQH4uYZRA5v
	az8JRCjecujsCx4iqCrHpgBwrV6BoeJeuHFUQ9unCU37GwTAUm2+XQv8WH4UNOW3pVuLv7UZpA3VV
	BzU2BHr4HjSWODGBfxVQQ7mJ6Z3WVXqatmplxi5DCTVKX5tTOIoWSQGQjmILLGZ70vvMUoITQXhUQ
	02jmkv0wpCThFMD9F4Nfra6dsJcSpjKiSktIOmb8SjTdzx7SmqrkviEvEhGNBakeosBPsgNk45DBr
	/dPCTFMbgqm9Elnxs1p6A8cQ20JkCAcq8yrCDCoNPNt5oZrlJANVJcQMfjBEi+Fde8ASJRurMnNln
	IYAJxKPgozTdPaxa4gvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszCa-0000000DGk1-2XwX;
	Fri, 14 Mar 2025 07:11:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszCL-0000000DGgM-0vm5
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 14 Mar 2025 07:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9DH5r5nUiV9oMJ9t9HWO/gI/Ze20kxPCau4i0GakJus=; b=YOE8+/Z2p0+dAIb6uhqzKSBMV2
	Tvncm7krUZqBAvBRHeoPvUbmPfEwtvE7bzC0QGokyD3bbgG/4rb0L6DD9DNIGFCZ5oh9e5RlP8da3
	iXCPzTEnvMoUDWArgu7V6Ip98EiMte/JHNTCeXcc6Zx8KIDuR3YtwHAnIoRTJVDExYx+zdjRzdzhJ
	TygePdtfv3zdJMC7XdC7Pok+HUR5uG/0NdR6El7WqEIKSDS6T8E1tN9s3c/9zj6Qr6gD/H3AaNn0N
	vfuXGv4AC0nS38468BdcNCnUctrhIR8WakxPwUZJ86/z4grTtiOUySMeD/GLVYTJMVnfFC6J92pZs
	d/LdcYKg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszCF-00000002qsB-2QB8
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Mar 2025 07:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741936257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DH5r5nUiV9oMJ9t9HWO/gI/Ze20kxPCau4i0GakJus=;
	b=guY7TGjoGnoSwSD/E5qEbH77lLiM1G6/Cp6vvuSshkYzy9lx3vaccDL9D6vX79X9CqOv+L
	v+YzlcjIvEi4YOYlDJPlAX8kgnyOHQADm1uqc6EG+/o9SdU5NRbYDLJZ3Ud71DhHyTjpC+
	GQOnRv4HmlAlpGcibrI2uO+OAgt4EII=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741936264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DH5r5nUiV9oMJ9t9HWO/gI/Ze20kxPCau4i0GakJus=;
	b=KM8XcdP29k2EP43RfsXqNLDbq2XHv425PcRc1C+ZIDzwMxuMdPWaBgsolUoqFSWsiDadwI
	5RFm+sIfUG33xshOno5dOi6B/W+81SIFgSTK/dohFlN1blFRzjGzxZgKUWnkUJMMlXTI2l
	FaNBYe/juVVKbIcc6EFKrQrP9Av8DhY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-ih_sP1kiOGC6BEcYPTApIg-1; Fri,
 14 Mar 2025 03:10:53 -0400
X-MC-Unique: ih_sP1kiOGC6BEcYPTApIg-1
X-Mimecast-MFC-AGG-ID: ih_sP1kiOGC6BEcYPTApIg_1741936252
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87AE919560B4;
	Fri, 14 Mar 2025 07:10:52 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.82])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B783B18001D4;
	Fri, 14 Mar 2025 07:10:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 04/41] arc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Fri, 14 Mar 2025 08:09:35 +0100
Message-ID: <20250314071013.1575167-5-thuth@redhat.com>
In-Reply-To: <20250314071013.1575167-1-thuth@redhat.com>
References: <20250314071013.1575167-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_071107_986957_FEE7B8A9 
X-CRM114-Status: GOOD (  11.87  )
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

__ASSEMBLY__ is only defined by the Makefile of the kernel, so
this is not really useful for uapi headers (unless the userspace
Makefile defines it, too). Let's switch to __ASSEMBLER__ which
gets set automatically by the compiler when compiling assembly
code.

Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arc/include/uapi/asm/ptrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/uapi/asm/ptrace.h b/arch/arc/include/uapi/asm/ptrace.h
index 2a6eff57f6dd8..3ae832db278cd 100644
--- a/arch/arc/include/uapi/asm/ptrace.h
+++ b/arch/arc/include/uapi/asm/ptrace.h
@@ -14,7 +14,7 @@
 
 #define PTRACE_GET_THREAD_AREA	25
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /*
  * Userspace ABI: Register state needed by
  *  -ptrace (gdbserver)
@@ -53,6 +53,6 @@ struct user_regs_arcv2 {
 	unsigned long r30, r58, r59;
 };
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* _UAPI__ASM_ARC_PTRACE_H */
-- 
2.48.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
