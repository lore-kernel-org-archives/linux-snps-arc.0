Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97953C5DF66
	for <linux-snps-arc@archiver.kernel.org>; Sun, 16 Aug 2026 19:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qK03LZMvMUR2MKvjeQOqM65M4dU3KiVdtQrBicp1MxE=; b=hdkyNc1umr6chk
	Jed217MtJDZpvF5WTb3C/a29f5HNVIDwEnZqdZW5DIyjuwep3tLXBh3X5085bqwhkN6P1jE2cFddq
	zVs+ReLVMe3YNGolNCsC3zHM4hMfXv4yIoO168qG/CWO/3J6QndVsZoPxSgVAtYL6MF2+uZz7i2Gy
	iVr+OSDE/6kLs17RFH/ze4o2vRlNDZEb6Fru01aixRT9ywkpcQD8UjxFhKFCauwFstFfTlEVm0X0/
	MjIIL5EZFuBWjw/yWCrp4o73EX1TaZND4wkcokUC4n4CM9j+oYiGvgU47L8KsKeEY/sqJF+z7Warh
	fzQV6Snlm/2+BKAkutDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgOu-000000051Gk-2o0B;
	Sun, 16 Aug 2026 19:20:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgOt-000000051GK-0RcE
	for linux-snps-arc@lists.infradead.org;
	Sun, 16 Aug 2026 19:20:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3A4043D91;
	Sun, 16 Aug 2026 19:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47251F000E9;
	Sun, 16 Aug 2026 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786908004;
	bh=ePqlfN7J/QMmtiy/pjAlZMY3V2slosZlFTfi6QegtJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WdcXRJY8PSD94VUEJ67dL/jTjV/WwprH4DLneT0NhAH+bV8QL6sJL7LMsg075Ltrb
	 G2SxXlnoHQhW057yWbGMAp2rvxbtSI8yTJLSowV3h8bKbfOL+iaMWT4YUcHZ1tKxs0
	 Ys2lA9puKa3vUYQDIpygvMp+kD691lcYudiS+W6kRRSXMv4dLjJ1LprVmlXKN6F/iL
	 +bf3OILDK75PDrhdEVb8rSGHbj83r5DlZksUW3Nfe7ANwG477Bn4ZYezf4Cv7oBSVB
	 eD9xOVjM0bAS3m6gKuSL3n8SmTnAjcr7I0ouQdEUNlmgA5wZhh1e2eQh9Uhqv/akhA
	 8vPAFEsC+nL8A==
Message-ID: <193a2ce6-4c4e-4291-a542-e112d5a87742@kernel.org>
Date: Sun, 16 Aug 2026 12:20:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: cleanup dead ARC_CANT_LLSC option in Kconfig
To: Julian Braha <julianbraha@gmail.com>, vgupta@kernel.org
Cc: joao@joaoff.com, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20260816142207.1034329-1-julianbraha@gmail.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20260816142207.1034329-1-julianbraha@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 8/16/26 07:22, Julian Braha wrote:
> Currently, the ARC_CANT_LLSC config option can never be enabled.
> It is also not referenced anywhere else. So let's remove this dead code.
>
> Note that I have only compile-tested these changes, because I do not have
> the hardware to runtime test.
>
> This dead code was found by kconfirm, a static analysis tool for Kconfig.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> ---
>   arch/arc/Kconfig | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 2ed7186c81c5..80e61175bf52 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -331,13 +331,9 @@ config ARC_FPU_SAVE_RESTORE
>   	  for floating point exceptions and rounding modes. These are
>   	  preserved across task context switch when enabled.
>   
> -config ARC_CANT_LLSC
> -	def_bool n
> -
>   config ARC_HAS_LLSC
>   	bool "Insn: LLOCK/SCOND (efficient atomic ops)"
>   	default y
> -	depends on !ARC_CANT_LLSC
>   
>   if ISA_ARCV2
>   


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
