Return-Path: <SRS0=x1iF=2M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D2FC2D0C8
	for <linux-snps-arc@archiver.kernel.org>; Sun, 22 Dec 2019 21:42:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC7A82067C
	for <linux-snps-arc@archiver.kernel.org>; Sun, 22 Dec 2019 21:42:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I1//pfr3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC7A82067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6oIR+gTGH1/GZDCbKKsTjqLJ7mmyjwjLFtwpjUR498=; b=I1//pfr3LNMlQr
	/EFBjVJ33zHFHAskQWBQ0AL/XG30sS7C8F9h2kbo+Ztp5b/RfFajT/EtsALGkAJAExjOjxE20jZhp
	65mSpDUHcsQlntHuaMec68gJR2u+skNp5zWk/6v8Egs69dG+fuCsOthS4kg255o1Zoyhj4NP6qVQg
	jY6S1IVqV4U9sNJZ6BXQzZm1dsRj+kq4Jcb4DLQE4MXRBcb5auEp87YsHVCiSKGzJcWQiE91zcQd9
	0eG7Njrs6FWOKo6Ja5t3+WBuwECX2+m1ZugKhOHxj2jfNiPmy1/UzvCYpEY/D7za3G8vj97KpkmoZ
	Z1UC/D2Lg8Lh34TY0o9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij8zC-0007v7-Qn; Sun, 22 Dec 2019 21:42:02 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij8z8-0007uO-Tl
 for linux-snps-arc@lists.infradead.org; Sun, 22 Dec 2019 21:42:01 +0000
X-Originating-IP: 88.124.194.176
Received: from windsurf (unknown [88.124.194.176])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6209D240006;
 Sun, 22 Dec 2019 21:41:45 +0000 (UTC)
Date: Sun, 22 Dec 2019 22:41:44 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH v2] binutils/ARC: cleanup
Message-ID: <20191222224144.38603994@windsurf>
In-Reply-To: <20191217213253.12446-1-vgupta@synopsys.com>
References: <20191206221918.1c05e316@windsurf.home>
 <20191217213253.12446-1-vgupta@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4git49 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_134159_099853_4673D4DA 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: buildroot@busybox.net, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello Vineet,

On Tue, 17 Dec 2019 13:32:53 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> Remove special handling for ARC - as it is not needed for cksy etc.
> 
> A nice side benefit is that the ARC specific version now only needs to
> be specified in single place (vs 3 currently) in binutils/Config.in.host
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  package/binutils/binutils.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index a19d6940f7c1..3ae5561d67d3 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -8,14 +8,10 @@
>  # If not, we do like other packages
>  BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
>  ifeq ($(BINUTILS_VERSION),)
> -ifeq ($(BR2_arc),y)
> -BINUTILS_VERSION = arc-2019.09-rc1
> -else
>  BINUTILS_VERSION = 2.32
>  endif
> -endif # BINUTILS_VERSION
>  
> -ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
> +ifeq ($(BR2_BINUTILS_VERSION_ARC),y)
>  BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
>  BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
>  BINUTILS_FROM_GIT = y

In fact, I was wrong, this also does not work, in the following
situation:

 - You're using a pre-compiled external toolchain, so host-binutils is
   not selected/enabled, so the version selection in
   package/binutils/Config.in.host is not used, and therefore
   BR2_BINUTILS_VERSION_ARC cannot be set to 'y'.

 - You have binutils enabled for the target.

Then, with your patch, we will no longer select the ARC-specific fork
of binutils.

Basically, for the target binutils (just like for target gdb), we don't
have any version selection, so we force using one specific version
depending on the architecture.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
