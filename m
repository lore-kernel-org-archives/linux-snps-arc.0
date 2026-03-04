Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002EEEFCE20
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 17:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJVx+UHbGWXUWcmUxpwcsWecqNQx1s+NeGcOP+ckeFw=; b=Ul1jGSZZLwA9c8
	cRongK8V2hq/D4fKoXByVzUbFrAAhnCZgul8QuCWFbK4mttqJL3rjsb15bpi0lo8Va71QDi+tpQWO
	X47aDfdQHMlrWA4RJ5A3g6Jak0zAS5Jn/Qtuz7SKM9/km9P5nYRFxh7Z5aK0pFhbG9h1lU3zBDmxD
	fPgySF3804qBA/QebzKdKvOQwyx6Xde9bvVelbZI6KfvLvS86/s+lGOrAE6WHFL33fYek0kduf3wC
	eJa0MAsrq30pCxn17IjfEoNgqYszjB7qH+qyZpyRONVkGmy7YS8YDKd2K8PEKBVtN6wnZa1H25NBy
	f5Jf6h1LzwiqMtnKtpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxq88-00000000C8g-2Yut;
	Wed, 04 Mar 2026 17:35:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxq84-00000000C7m-3b3E;
	Wed, 04 Mar 2026 17:35:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 488884409E;
	Wed,  4 Mar 2026 17:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829B1C4CEF7;
	Wed,  4 Mar 2026 17:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772645722;
	bh=G9vyc/ilKI+19PmiBHaHsKJ89Xu7vIMfI3QiSI5VErY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p3gRyRbAmt88QYW+qJdvWj5qtD8qosiS8iWmV/39WnJFzuC4DFAe3Tyh3mY5h74qn
	 7FInoYzEWeFQ7CY8OwV54MEwdqBRVWYnNQjTVdnKRUwBSziNDWA8ecqaRvzzK/Ff90
	 NfHNcwk1I3PM4D715Ch9BaVnphe1VPolSNNw/U/tzszjymiQfwM4YNdTcdbZC7y810
	 7RYshqucnV1ca7eqd5+alsDV7oBEf6j/gB6X5uQ0hYuTexFE8Xvio9sCPsXsInNbYo
	 9ZA6X79vEceTQn8vjICVOHvGoStAFiT1AZGx6edtfTQ2DKM/24xYE+6Yy8QIDT5o5s
	 kOKClwu9c5Q9w==
Message-ID: <f00b1812-a27f-49db-9277-6697af098248@kernel.org>
Date: Wed, 4 Mar 2026 09:35:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] arc: axs10x: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>,
 Scott Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-pm@vger.kernel.org
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-2-d597916e79e7@oss.qualcomm.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20260304-gpio-of-kconfig-v1-2-d597916e79e7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_093524_945349_5B6AE838 
X-CRM114-Status: GOOD (  14.23  )
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



On 3/4/26 1:02 AM, Bartosz Golaszewski wrote:
> OF_GPIO is automatically enabled on all OF systems. There's no need to
> select it explicitly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arc/plat-axs10x/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arc/plat-axs10x/Kconfig b/arch/arc/plat-axs10x/Kconfig
> index b9652c69d1b90e506f82b3b8c5be373c51246671..40f2a74d404ad9759ab9d6764c2496159eea045a 100644
> --- a/arch/arc/plat-axs10x/Kconfig
> +++ b/arch/arc/plat-axs10x/Kconfig
> @@ -7,7 +7,6 @@ menuconfig ARC_PLAT_AXS10X
>  	bool "Synopsys ARC AXS10x Software Development Platforms"
>  	select DW_APB_ICTL
>  	select GPIO_DWAPB
> -	select OF_GPIO
>  	select HAVE_PCI
>  	select GENERIC_IRQ_CHIP
>  	select GPIOLIB

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx and apologies for the delay in getting to it.

Cheers,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
