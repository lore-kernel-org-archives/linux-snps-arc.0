Return-Path: <SRS0=Kc19=5Z=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA3DC2BB85
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D8D20757
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZIWsyV+0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MGUjuwuH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54D8D20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43mW2paKCewFTLM5NhUGGblAWOHvyCp6jYmm6QvLL5g=; b=ZIWsyV+0GjDPjC
	pcjzRapVyl2EONLEaX4UNGYn7ltno5nmDiD+KFJAXfp51togXQtbhdocwQMCiPbj60xVpRKdG+K3v
	BDm2zctnHKfea6l9zB7l6RW80uDS7f2X3wAMvoZeT2bCAU2aiLbJ/cIfRpwaZWMjSudcMAgpgeN92
	y0qzm+ILrbO8r2LovTaJvCK0YfkLNrnmBVrPUZ4NXsSjSv8ptXaWzUNGoqEHyvAeRA8fsfsWp0cbA
	GcCNkdoC47MAm5odYls5f8vtDiy/2QUS8ZYPU15XMcmQSCrwikpu9OTEBFuGpO0Ug/VRHPDi2Pwk/
	TvNu5TgqcNn0SMxmUSXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMNMw-0005cq-Dl; Thu, 09 Apr 2020 02:56:42 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMNMp-0005Yb-Nq
 for linux-snps-arc@lists.infradead.org; Thu, 09 Apr 2020 02:56:40 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 99750406C6;
 Thu,  9 Apr 2020 02:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586400995; bh=FpzH26+XHhQ4MnRVPEvTRe9J5/GD/h8nVipsmT0AXRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MGUjuwuHTEf2Lnh0nm4CBXFuvJ847MQ0Vy+5oRVZaYqmZjtM+8MSd/Q3Zsi93vbYh
 XtqkY4O0SDCyi1wwgkwb61gV/yVLM0J7OSZghgdHj8d9P5tYrG61+jpIdkcr5c9wj4
 KISqbwuzrDnPY/FC7i/XrN76XT+hidNiIxASn6sgJw4uvJ2K8pH+cNDp92RCuF21Cg
 8u8LQH0eiFMnJfIjI1DYNr8cxUV8aKuv6xg7MCOcFSoc+beHmTqjyTKfqKlQ32wD76
 zRMrq4jgRcs9ON+kw9yJFSGc8X0TZVw1ojJmje2nhdEA/+tqxURIWSc6pubRNEtrCd
 sN+1SYYJbx8wg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 620FEA00C5;
 Thu,  9 Apr 2020 02:56:35 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v5 11/14] ARC: Update syscall-names.list for ARC specific
 syscalls
Date: Wed,  8 Apr 2020 19:56:12 -0700
Message-Id: <20200409025615.27003-12-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409025615.27003-1-vgupta@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_195635_772856_8DCA431F 
X-CRM114-Status: UNSURE (   7.44  )
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/unix/sysv/linux/syscall-names.list | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sysdeps/unix/sysv/linux/syscall-names.list b/sysdeps/unix/sysv/linux/syscall-names.list
index 3d89814003a2..758b50164103 100644
--- a/sysdeps/unix/sysv/linux/syscall-names.list
+++ b/sysdeps/unix/sysv/linux/syscall-names.list
@@ -41,6 +41,9 @@ adjtimex
 afs_syscall
 alarm
 alloc_hugepages
+arc_gettls
+arc_settls
+arc_usr_cmpxchg
 arch_prctl
 arm_fadvise64_64
 arm_sync_file_range
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
