Return-Path: <SRS0=Ca3q=KC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA447C43460
	for <linux-snps-arc@archiver.kernel.org>; Fri,  7 May 2021 00:44:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38271613B5
	for <linux-snps-arc@archiver.kernel.org>; Fri,  7 May 2021 00:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38271613B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jjOSUZ9pPFXYrqsXYQCvvsT20XfhRetiBsp4crU1sog=; b=UetU8FWSvVqvIDzKfy9HGkootW
	KdGVPShmQA/CDFuwCFk5olB9eSbCxBkzuNsAHAD729JVpObMBJ+E7CZ5446mipYsWwJfwXj7/Gm72
	YQQRgIPTjScA6PIYNpSUQylj0PKHNb8Cr8Pc2SFMLh1YMuJgYssmO26aYneibR3+zO35cMs1FCk5i
	gaRsql9q2tCe4IZEqaaKhO7YiaskOxIzbes+hXMnr+YDpmKJAGkvUyA33b2yr5nrAfLGJmQjstU7S
	uxPcIvK5R4TKFA1CIMVMYiyusSWtzz4XKHBkhr1JOm0ZgZfhBIZe2Ks2aCxbzZWTy6GZh2WP1be1I
	QQYpsZzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leob1-005gA7-Ts; Fri, 07 May 2021 00:43:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leoaz-005g9i-W0
 for linux-snps-arc@desiato.infradead.org; Fri, 07 May 2021 00:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=wgRXEhQYTd5t09eUcNrVgacQ6mZWTnmCtCJO1Zm2exk=; b=cf5RUVbyuc1shAYeXlLTu3q763
 mkQnjbgmuPCt8cz+17CMDyNa3mxnvutmL9yZWx2KUHg4Zd/xF+iB9xVFX38PFbSiD2PLpkF6/cVSa
 UMr/6QikBf99zhye5Dl1pB+BE9yD/zItOaairfyj08tHqOdBZgcAf0m9tMHHB/HVR6Y3LYcbgEVau
 1ZMPYbCIyvyCoOaEMb0xzMw7MGiiw9b3Nvpk0wNsshvtMTwDyXcMbJeMo5eN1zxqZAmhOQbJS4dJX
 bcoRB4Jj+Sc7a2JmnC1ZAnjGRnhSI7u6iC2/TI6LEZo2YRq4RZq8BokFdB8DGq5uKAspu/rA6zylC
 5qt1FZ8w==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leoaw-006Tn7-Ei
 for linux-snps-arc@lists.infradead.org; Fri, 07 May 2021 00:43:56 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CFA90C0441;
 Fri,  7 May 2021 00:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620348229; bh=7pTHY4kgGH1wOiKmWRuZVy3UYBNtKpdeuCfIAgGUG2U=;
 h=From:To:Cc:Subject:Date:From;
 b=fqrdxhuYNhrVSmDjdC2+zZ30eVLkEU8+BKNT+LdbSNTc0JVORJzsE+l+URnygFNl/
 VsWveTFcFp86rH3Eag024kYutTLjcXF2VMdbU51JVJmDWKZ8WFtNm+6n3g4DJ2jv+M
 KTFEq0vKTKT/V626sh0nTG1f3FNx6IYAxCABV1HqoYuCslgD/5mFPqf8/iV3ss2G+G
 igw1i1sP/5Ppvx9vCnFBHobwkDRkhWQ2h69I8DZZMIdsfsykVj5FNd2CRCCSxKbSRP
 KyQLUtTQ6eQqlWI0kDLzmE8wB7hXhuUNMrB4oTlEeAJWbrEZhoxfY5Lq+0LKmYPAE2
 T+fQSBQ1Ii0xg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 0B52DA0064;
 Fri,  7 May 2021 00:43:45 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2 0/3] Buildroot updates for ARC, LMBench
Date: Thu,  6 May 2021 17:43:41 -0700
Message-Id: <20210507004344.3166099-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_174354_539683_F5BDFD7E 
X-CRM114-Status: UNSURE (   7.02  )
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

Hi,

Please apply the assorted fixes.

patch 3/3 had a snafu with scripts/os update.

Thx,
-Vineet

Vineet Gupta (3):
  ARC: config: explicit'ify -mcpu for cpu selection
  lmbench: increase memsize delay for slow FPGAs
  lmbench: emulate --prefix to avoid scattering binaries all over

 arch/Config.in.arc                            |  8 +++---
 ...c-to-prevent-memsize-from-timingout-.patch | 28 +++++++++++++++++++
 package/lmbench/lmbench.mk                    |  9 +++++-
 3 files changed, 40 insertions(+), 5 deletions(-)
 create mode 100644 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
