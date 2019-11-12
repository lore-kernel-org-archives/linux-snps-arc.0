Return-Path: <SRS0=pfY0=ZE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46140C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 15:34:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1917A21925
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 15:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZSMgmHia";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bpL/CbCl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1917A21925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Snxi0hNpH4gcewmsogKr5Rv03mBjFgztquucgbJ1u0=; b=ZSMgmHiawFwrOP
	XBKLwHlp1Li0gd43KvL+d/yA4l2Tp/avSY0o64oYM4trO5KcktHAoqZCXJs5cB+j199Z92BO4/ldL
	7yJ9DeiK+rH7vse+U1xBaWLeGG2e5dciFNVhGAlReoqzTTFGNUJHf1qBRfmyCVx4P4VOFaD+wrz2u
	YZrW6jiVkwPAKYtHTgy9OaAQ1hYicwLuZy8fqb4+n5AzTFvb046nIPgRDl/COf+EIrAPW579DekIw
	UCB9FTSy6cKMa8/Yb/k0LyWoNFPoNDqOizy30iFbaIygdZa9E9ziIHO+Cj3Vun67aJByhfMG3meRh
	d4Bwd+CqKhHDoKW/S9+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUYC0-0002vc-5j; Tue, 12 Nov 2019 15:34:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUYBx-0002qc-Fc
 for linux-snps-arc@lists.infradead.org; Tue, 12 Nov 2019 15:34:54 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A8312C08DE;
 Tue, 12 Nov 2019 15:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573572887; bh=tEpVRt3ZCcfwzbFRLrvzhIyoWE+nER6SaV8WyUX+SSc=;
 h=From:To:Cc:Subject:Date:From;
 b=bpL/CbCl5W8bF+txgz0+10xqcbAOOnGWVvaCdW8X6QjPIXxKTEWcUp5EGUp6xp9dC
 If/fC82OZLkfjhw11RolkQHJxESzr/qAk3YlDL6fwuaHKeV1X0r/Dxz//rKOSM84Nv
 CyUCEjj5G7PQZdxR9RtTKiNWOiG1XTLcbcgJ7+fy+5PVgeSRzY3kr9h88oLU0WeNwD
 DScci+JcV1w3Ja9gTBIbbIzJJyTh+HQ/HItoAcUx/ZToWNQZW4m17oWq7Mj5O/lfZk
 ouS1njPm3vFT38PYI8sAk341zBEKRLpA6SkrEws3+mfs7x/V0eDLml5Crp1N1lZo+n
 02u88CYXSNkAg==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id 061D9A0066;
 Tue, 12 Nov 2019 15:34:44 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH v2 0/1] ARC updates/fixes
Date: Tue, 12 Nov 2019 07:34:42 -0800
Message-Id: <20191112153443.15715-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_073453_559449_5F8B8FA8 
X-CRM114-Status: UNSURE (   6.94  )
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

Hi,

I have some fixes/updates from ongoing glibc work.
Please review/apply.

P.S. retaining the cover letter despite 1 patch to capture the revision
history of original multi-patch submission.

Chances since v1
 - 1/3 reworked as suggested (details in patch itself)
 - 2/3 dropped as it didn't seem to be adding too much value
 - 3/3 dropped as it is accepted upstream

Thx,
-Vineet

Vineet Gupta (1):
  arch/config.in.arc: Introduce the ARC optimized hs38 config

 arch/Config.in.arc | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
