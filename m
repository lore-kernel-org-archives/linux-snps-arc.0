Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFFCC2BA1A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Jun 2024 22:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1MrSb907ZcZTpXmMKLw/iXFLc+8vJ0x9OnoU9TLQiw=; b=RE8ZeQD7BzuTbe
	TOthQm5yre+2IcYB4ghXi7NDjtODc15dOq6HOHlSitOjsdGdZ/n+WhbhQIcgIkdVNsodfuoH29UgG
	EOIHkAd6ekRqQhk/U2xrV1ojx8CLzqGzuHV9HykjIaCG8iN40KkSs2KKIZ22ExP54D6lhkK9xeeVP
	9ZEq9B5INQtANBbBLyav1LZO/EtwCPwaVtN8Ohq2bZiUgSCZuJlzbPhibDc3YbtEdRGyR44v4L6mJ
	Jqx8hjAibOSR4Tht9rtFXH8+dngXh/CBGK+HqnMuXhOlPoA7buRcafoDyYQAt8lXVJDR3y2c4mrqJ
	jw8s8+66ou0LiIgStnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJKnL-0000000Cn6a-40Vv;
	Mon, 17 Jun 2024 22:25:48 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJKnI-0000000Cn5n-3VAV
	for linux-snps-arc@lists.infradead.org;
	Mon, 17 Jun 2024 22:25:46 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1A0E945E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1718663144; bh=H82+wvXyhvj6l/rMq/9uITecpN/HRsCtmlqDYD/RkDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Atr3qmMYRHb+QpgUszAGnDQmtuQfOk2aVs73ObNKfYnMssTZxr54mPlw+0tKt6dRT
	 U4XPSi1J1XrLo89V1uP6utLmZMrf+HBvGjM8r6o6B1P71LBBJCjJHQPG0M5q8VzV9u
	 c+IqNFkqp7VPJf/MeQN0X5K1pIu8rwcTGplqMXb+qDGqDz8+7+cGYNPhRZo0FhfN/8
	 uhooskGYeN5fAhHIScvhM05COOK7muz7EUIOx1GQHQPjA7tZ5EwjPhDXJrkjxvV4R6
	 zFJZQBJH4kxL4xVvhQnKM2yIXfe0urZ4bZY00Z06HG+Un/sK0cY6KRcOavylnuELOZ
	 BsEf5YiW0ScDA==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1A0E945E2A;
	Mon, 17 Jun 2024 22:25:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thomas Huth <thuth@redhat.com>, linux-doc@vger.kernel.org, Vineet Gupta
 <vgupta@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH] Documentation: Remove unused "nps_mtm_hs_ctr" from
 kernel-parameters.txt
In-Reply-To: <20240614190804.602970-1-thuth@redhat.com>
References: <20240614190804.602970-1-thuth@redhat.com>
Date: Mon, 17 Jun 2024 16:25:43 -0600
Message-ID: <87le33gqag.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_152544_937169_36EA72CB 
X-CRM114-Status: GOOD (  11.36  )
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

Thomas Huth <thuth@redhat.com> writes:

> The "nps_mtm_hs_ctr" parameter has been removed in commit dd7c7ab01a04
> ("ARC: [plat-eznps]: Drop support for EZChip NPS platform"). Remove it
> from the documentation now, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index dd8436c98735..f58001338860 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4143,15 +4143,6 @@
>  			parameter, xsave area per process might occupy more
>  			memory on xsaves enabled systems.
>  
> -	nps_mtm_hs_ctr=	[KNL,ARC]
> -			This parameter sets the maximum duration, in
> -			cycles, each HW thread of the CTOP can run
> -			without interruptions, before HW switches it.
> -			The actual maximum duration is 16 times this
> -			parameter's value.
> -			Format: integer between 1 and 255
> -			Default: 255
> -
>  	nptcg=		[IA-64] Override max number of concurrent global TLB

Applied, thanks.

jon

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
