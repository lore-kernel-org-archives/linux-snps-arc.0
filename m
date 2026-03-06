Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA0FC9EC4
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2026 23:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nt3oGBtM7ABiUcKz0UpEpJjPbgiPu3TykhqY9RnuD5g=; b=Kj4ehA7IuGXYuJ
	MCrRE59qPIkPAi5DCOpDLZq+0bpWRZhWYGrUQyPm4UCrzt1gcE96U+uiCm4dOqn4tcB72I9InCu68
	CZVrjrLmmhkHo9vSDWroATO8jx4mmCn5WrepeapjUfHOHOu0NkvGiW6uC17pvD0r5hogv0YIBJiUz
	gL6oHuperlL+I1hodZIVfJPdL6Y4IJNGlIFTkLmDVjUln9YlIwtzIjFpbiCTTvrUkHd0F+kcmVLkZ
	FRmoflP8esnyotPUfCLZNoe+MxIxPjwHGUr34Fq1QUX9D8nWgPS4LlkAKbsC65m0xW6BNE0plnMYP
	ups1M44BY+qQTrYwBXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeft-00000004eK5-0hXk;
	Fri, 06 Mar 2026 23:33:41 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyefq-00000004eJ5-31HJ
	for linux-snps-arc@lists.infradead.org;
	Fri, 06 Mar 2026 23:33:39 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35980423087so3336479a91.3
        for <linux-snps-arc@lists.infradead.org>; Fri, 06 Mar 2026 15:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772840018; x=1773444818; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3n1MjNRco+xhIuiD22YqqFeZmP/U2HpmvCL9DYQOmg=;
        b=nXUq0Cfavs74wj2uvslg5l971BVwk6u/JROHsQnoAqPvT+/IlBiPxFTYaiyx0jM1Hy
         GBQR0FzdVSyUGeCw7T9PZr+cm+BJsg0SqDY2rZ70fauFemT3pnFdwn3UO78ZtA7idkVv
         FpCqr4swG4hmhEWRxQLp6j5VZroQQOzYg9Anci1FRwLaIUEkn4y/AVb0XRiIBPxKHUGh
         TBByC+cD5kgn2MiAkpxwqEDmTmcyVFz1sUsNszToKtT0pwhITP4ZVobd0MMWcXbZL40q
         kjrvakj6E8KbWTKtEGKLe+MsWs0vCW5vojJpvx1dGBvYXHSWqxkuPjAaYo+sb27Hv70t
         OPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772840018; x=1773444818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3n1MjNRco+xhIuiD22YqqFeZmP/U2HpmvCL9DYQOmg=;
        b=OdVTuh25et7iUMSL1n97AdPuliheez/+hKLbcVDM9mJCyUmRPGDAX1tyLBEpaCdYaJ
         Z8/DXaTbfdHK9DLw76OwSaHV08PtHk5Gm3QMKYX/9DrrcyfATWIfSrKFrLJgbvZm6Mzn
         rNBKQY+aojTdD/l9lYT2SO2S7f6+X8IIXOocsVZeKMgvyWbenWiD+jlvIi49GcJhAewn
         Eglr9QqflZavGv6qj6oZmeN/0cGLN2iYIHS54uCHWKwYlu3mugABiTQp5cSyM7KuLK/K
         vd4EVLkqZH3UQXySRs4ubO9dyWJngIFgkovw1bVkksX1KJCTE8MXMUI/NQUWR/tBhrJl
         gC6g==
X-Forwarded-Encrypted: i=1; AJvYcCXHe68jHCqXSjUjH0QWMgCtXGisoQLHro8ufiR5A8DH8i6OpqbUyNCCKRpqigIxQTYfdfriqYReVrV33ctgKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWgWsZFp+BxQLsMCD0+1oFZ8lw9yDpYTygFlFLPr7xNIJzhnaQ
	mpN8LE2+FyYIxFLCV+Cf9il4m1w66ElyI9qWHHXoakeyY19dB8IiKQhp
X-Gm-Gg: ATEYQzzh7s7i52hepBs6uiMqSCUVPiglL0UW9yE6QO1ywrE3Is2mKDhpH9ddKtgXmjk
	dMiaFbuxrbE/i+vbABzicWmpz4kxUxy7Exn+vZBQ9Gn/Gfl+hwETMIgKBb2x9lkrgcT3XxrxQeo
	27ZUT074v9b836udlNgPiZn4UdeaVw6SrnxkSiABgbZ6rtifHKWPE9TEgF2CDeDZlRXkdNl4CUV
	4wWLx0oqiRs4SDf2Ptjx/5uiEj6HpWaoXGDuGwpruV8mVwbQs5G+8X4Shl9OMALObp2qpx97ndy
	ww3q6OzU+yiO16ZQ0ctXQCsMD8L1E53yaS0k89mv59ABTt9QdCx3I/DA8C48izbT64b17dvoG21
	HwvLUhpZRRhzef+z9W6lQBiKnUY85hEqpQu3kOLE1LtmGxNz22s8TKJaoHYkRIyqZg+i5Rl8Bm9
	k6NYlUyvRy6yc9qWE4BrLbUeFv4nwQZinEjhEI
X-Received: by 2002:a17:90b:38c4:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-359be31746amr3476775a91.24.1772840017833;
        Fri, 06 Mar 2026 15:33:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2de79f6sm6579296a91.9.2026.03.06.15.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:33:37 -0800 (PST)
Date: Fri, 6 Mar 2026 15:33:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 10/14] watchdog: convert the Kconfig dependency on
 OF_GPIO to OF
Message-ID: <07aa5d40-96b6-41a1-b8ce-22f2c2c94aed@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_153338_769472_780E9D5E 
X-CRM114-Status: GOOD (  18.61  )
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

On Wed, Mar 04, 2026 at 10:02:31AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it

Actually, that isn't really true.

if GPIOLIB
...
config OF_GPIO
        def_bool y
        depends on OF
        depends on HAS_IOMEM

OF_GPIO also depends on GPIOLIB and HAS_IOMEM. I don't know why it needs
to depend on HAS_IOMEM, but the GPIOLIB dependency is real.

Guenter

> controls also provide stubs so there's really no reason to select it
> explicitly. We could simply remove the dependency but in order to avoid
> a new symbol popping up for everyone in make config - just convert it to
> requiring CONFIG_OF.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ef200339a22a6f9c51a46c9c0b8466add74313e2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -250,7 +250,7 @@ config DA9062_WATCHDOG
>  
>  config GPIO_WATCHDOG
>  	tristate "Watchdog device controlled through GPIO-line"
> -	depends on OF_GPIO
> +	depends on OF
>  	select WATCHDOG_CORE
>  	help
>  	  If you say yes here you get support for watchdog device

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
