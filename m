Return-Path: <SRS0=7pOa=ZA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42D7C5DF60
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 17:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AADB0214DA
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 17:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeIe6kln";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OhWo2iJ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AADB0214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3cOktt4Lo7Vl/IYRO1N5969kUWhFDJ/geqSBy/tsZYc=; b=oeIe6klnd3FicZ
	vh4MIScFtkVb8BvkVgev5vKieVlDpIU3DT1dyx2X8zKLDMQDjHz+cj/tsHscRPT0RQXnWXcMnemPL
	mAF6eqWuNE5HQOXnkOC0GzWcl4q2XuId0gHSful6JXoH11htB3O0cmqh2+Q1qlcNdyDk54+pEZU2S
	YIZWqdEw3Xad/awKiVKidjenAPw4UWF7vkATkfleMqj2VsKzcMJIdvbQiRX7yqydFwLAZk805P5nZ
	kBOZshQhxLilVK1BFI3u//Z7kdOUIVVEYItT/no2S/N+PbdoTZGHsP9IXcWoVvUGNxm4VLzdlT24s
	6W6VSp5OBVATYozFhd9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iT8GD-0007iu-3R; Fri, 08 Nov 2019 17:41:25 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT8G7-0007gv-Mc
 for linux-snps-arc@lists.infradead.org; Fri, 08 Nov 2019 17:41:20 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F38C1C0DF0;
 Fri,  8 Nov 2019 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573234879; bh=yLK8WaynPROhSs20srK4rPc7obw1cezPw8aCJac1bkM=;
 h=From:To:Cc:Subject:Date:From;
 b=OhWo2iJ2+1eDyB6LmhYPcM4svt8Yk3suRHsMR+SAjj3TbQ4Js8qDPD6F8Mkh+yQle
 zRGCNuoWzFcbMvL69DATtKxnZT76SUbfjRozmy1O0PIewPva1WHSZ2I2QSe0T0g0nz
 aOhALuDhAFM2UH7QcAzlJe2Id23rvKdv51R1/o74SjuxdiVx07UYwg+hsmV4IljXCZ
 8cucGuc7MOrugWA6xKipM1M/CT1++z7XnvkssaC1E+76k9YUkOQyeMPGwICFaI9S4A
 f6q4/S6r07ukhihApAokyRFa8nx1LScc2PHSMVY1pL3ui5qARmkklg24wmCxgsC/Po
 lF4OOwpSQeV5Q==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.28])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9939EA0098;
 Fri,  8 Nov 2019 17:41:13 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH 0/3] ARC buildroot fixes/updates
Date: Fri,  8 Nov 2019 09:41:09 -0800
Message-Id: <20191108174112.28183-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_094119_754606_0C7074C1 
X-CRM114-Status: UNSURE (   5.97  )
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
Cc: Evgeniy.Didin@synopsys.com, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

I have some fixes/updates from ongoing glibc work.
Please review/apply.

Thx,
-Vineet

Vineet Gupta (3):
  arch/config.in.arc: Introduce the ARC optimized hs38 config
  arch/config.in.arc: Introduce ARC ISA toggle to ease downstream
    toggles
  package/ffmpeg: Enable ARC glibc builds

 arch/Config.in.arc       | 44 ++++++++++++++++++++++++++++++++--------
 package/ffmpeg/Config.in |  2 --
 2 files changed, 36 insertions(+), 10 deletions(-)

-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
