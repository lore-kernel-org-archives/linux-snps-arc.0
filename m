Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7184AFC9EC0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2026 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbtvnqR+vozPm2aRkJ8EOFxC3oAOrOfZWFK/FJr9KyI=; b=s/mBvKlqOC9glR
	yFrt3eoksJsvg3mxiCqbco7p9VTRjoN2y6bf+JzpoAORrbKVSqXfWhkv25Nd+vV/gFwgKarq8uZdg
	abAGhmuZ+H+mcB6L8ZpqwSzmnVeeB3XDNL64hB9YVK0C7J3QwbgYWP7HD/H+u+bV4tJwfeQ4xZ77j
	X8DSUUudvP4vYZP2s99UMSNsNqr8hxinmM5cGYZyXsK/rYK+ZoaKPyhK07RwSMjI9kvo9V3OFxwPq
	Rd2Yv2QL8IqLlWmddbZRVTevBUb1AEVTv8a7sKZBLwZ1KjumF1WIiYDipe26lZQDZobXfOQR4O2X1
	twGMMo9DIF92GlXhv0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyebQ-00000004e3E-3vch;
	Fri, 06 Mar 2026 23:29:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyebO-00000004e21-2mM2
	for linux-snps-arc@lists.infradead.org;
	Fri, 06 Mar 2026 23:29:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82735a41920so3743982b3a.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 06 Mar 2026 15:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772839741; x=1773444541; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmuJidMV1Wwe0qpdw07DaES1yYrCFjR7mRIMJgUWNXw=;
        b=M2FzWy0p09SavNkPi4e0vqlGtG+EXGFtAlxBEEggFreTKg2S5NFhYwtggB57tvroUv
         brRdB33OQoVx4eZgzJn4kisDQfAmqWFOtwi3Wn6BIri5LDlX9f9xRkgIYtbk4M3atHWP
         IBlBsHaWzQSBC4KNdolje7LV7jZLhCm8RSzR9Dz6+chRvEvSYUWVu3rilK8y7YxWjgCj
         wqYobeBEAa/A4PM/5zYryij+f9Tg0ojzDhHGkHaWZL4qIBTcTjcHBwJZYfW5MMS43u8K
         wK/E+xlitfFyxfi74/v0hLxhJS19W0DpR0BCbxcBnq/ERzi0WQwwEdUAzpUByJQRWKoG
         zsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839741; x=1773444541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmuJidMV1Wwe0qpdw07DaES1yYrCFjR7mRIMJgUWNXw=;
        b=daJ2f5GeglzOZaREmQdkWcABOwGSx93hJuhyfOjXV0fUOrywgR6IEehYr+UImvwoIh
         cDXkqoh8WuLgeNWp43gXtLOVih+UdmBmJ3kopdZRLat1xs7wRbWqK9p5hgK/ZB+IBYWM
         gWlh6QW9X7K4o9buTDzAO8qGrMppJSU4Qe2w5BMibUrE3ofcPPbX0cHA1CC8qs40KY7Z
         4IDMiII15dFt49cTWVt66WuR9v2z3C9kcLuGfo7ZA1wGKOnBmBsdLxSzZk4gr2Zrd7y7
         f00kA7sf+urn7tBY6iEXyRQRGWrG6MDJyUqUQpk7IJTnWaN93bRS5Gxvj6q8a0xibbh+
         HFEw==
X-Forwarded-Encrypted: i=1; AJvYcCVtckQWECs1A8pWqeAg+6qICuglB2nltHa2ehoM57WO0s9BBUDPdYXuR7PoAim7HLnl8yrRpHVRXqgycknDkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfArjRe4xcZFyIHy6EN6Nc3+nVSICqlkIFvCn7YWA5hD1euBqc
	fN59UzpTLbFBwhJ08VrN8AD2cZrOqPZCASva3fcPbpBX6sJkjWuCxN5d
X-Gm-Gg: ATEYQzw58hPepGdu33H37v52x1rxL4qEAvzw/TNTw3WnXGksSsqgNtefHS7ZvbO2Ugk
	Pribr+NqbZun21tJDxpvvk0WOdd9V7tMXbEHX9QhhiDdY5S8DyivU5sbQPd1bhW/oOKMcAZ7hHO
	g8IxtETZKNf0tl9SVDl21RcLRLOXLyJirDqgj4rKpxlupvi+oEkLoto0VkmBbhSaxGwRjdQUUY8
	rbhlqtIWVtxvz1PWABDDLUM+Ot2+9WE/UnJicJ0RpMikUzbz35ngeT0oRSs/7HlBtVS4OyNAqhv
	JHcljsgbHsvNruNgQr+6U8cAfeNpcgLy9VQpxKlBxdb/qk1SwT/QIRQpmHwDBzmRflsw7roJrq1
	cWMwqZ+VoqQj0lWcDTKGV6Vm7cPI+/0e4TUOPrlUYH0nvg0xEvD32bazJoh5ZuhFDInjma6o3Ae
	aZqGGzvM2EhWblHkxnFYQ6i/DWVMZLSTzf3YsU
X-Received: by 2002:a05:6a00:9510:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-829a2d86b43mr3749707b3a.9.1772839741072;
        Fri, 06 Mar 2026 15:29:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3621sm3213092b3a.62.2026.03.06.15.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:29:00 -0800 (PST)
Date: Fri, 6 Mar 2026 15:28:59 -0800
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
Message-ID: <2c6ad0ca-fd72-4bf5-9180-f45c20e60d37@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152902_712169_9127FC08 
X-CRM114-Status: GOOD (  20.96  )
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

AI feedback:

  Could this change inadvertently allow the driver to be selected when GPIOLIB
  is disabled?

  In drivers/gpio/Kconfig, OF_GPIO is defined inside the "if GPIOLIB" block,
  so it implicitly depends on GPIOLIB. By changing the dependency directly to
  OF, the GPIOLIB dependency is lost.

  If GPIOLIB is disabled, the driver will still compile because of the stubs
  in include/linux/gpio/consumer.h, but devm_gpiod_get() will unconditionally
  return -ENOSYS, causing the probe to fail. Since the driver's sole purpose
  is to control a watchdog via a GPIO line, should it be prevented from being
  configured without GPIOLIB by using something like:

	depends on OF && GPIOLIB

It has a point. Please update.

Thanks,
Guenter

>  	select WATCHDOG_CORE
>  	help
>  	  If you say yes here you get support for watchdog device

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
