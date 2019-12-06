Return-Path: <SRS0=Lght=Z4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13008C43603
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Dec 2019 21:19:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C6C24677
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Dec 2019 21:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZbV7+PKS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C6C24677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ad2n70guBe0Vycxj4C7/REna/GmyQcYfifhk5oBAjW8=; b=ZbV7+PKS3cTz8x
	zXuWGIPpRQ7jTIBKij4zHh+reNgE6Ji0IFEaKX20Y/Q4OT5GWXYEXoJZu+RaMr6gL+Q1OHJmwvKnT
	mgK7s+uUQZhqrK8jnbFR9NZFhY6WFgspNJLM10evR9mD0rzqvjdMAxGTE8STudXgmhagH5GGWP3e5
	ALi7x7yC4pti3X4J69mJuMA0LjK4CPyi7BpeW59tLTsg5vdt9Mqv+1S/ZHqOvuV4w1lHRHhNhWoXJ
	jMtuYypyMO+33JNMS91hzBk4/LZcCk0Sc9GwSGvQaa/hCpQ2ZcJPAEwju0KCaUbWbIKxzpzd7Z7CF
	y1aCtrQanh/jL6WLFGZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idL0b-0005lb-Gx; Fri, 06 Dec 2019 21:19:29 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idL0Y-0005kx-Fj
 for linux-snps-arc@lists.infradead.org; Fri, 06 Dec 2019 21:19:28 +0000
X-Originating-IP: 86.210.146.109
Received: from windsurf.home (amarseille-658-1-11-109.w86-210.abo.wanadoo.fr
 [86.210.146.109])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E8C6320002;
 Fri,  6 Dec 2019 21:19:18 +0000 (UTC)
Date: Fri, 6 Dec 2019 22:19:18 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH 2/3] binutils/ARC: move ARC specific code
 together
Message-ID: <20191206221918.1c05e316@windsurf.home>
In-Reply-To: <20191206193924.18777-3-vgupta@synopsys.com>
References: <20191206193924.18777-1-vgupta@synopsys.com>
 <20191206193924.18777-3-vgupta@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4git49 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_131926_659427_E3EA6733 
X-CRM114-Status: GOOD (  10.79  )
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

On Fri,  6 Dec 2019 11:39:23 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> That way ARC specific version update needs to be done in 1 place only
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  package/binutils/binutils.mk | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index a19d6940f7c1..ecc78b81e59f 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -8,14 +8,11 @@
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
> +ifeq ($(BR2_arc),y)

This is not going to work well with your PATCH 3/3 (on which I have
comments). Indeed, BR2_arc=y does not necessarily imply that we want to
use the ARC-specific binutils version.

You can however use ifeq ($(BR2_BINUTILS_VERSION_ARC),y) instead.

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
