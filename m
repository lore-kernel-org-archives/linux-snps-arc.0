Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA136EFCE47
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2026 21:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5uxRrZ41y+3bazR2Gn0TGF73Cojv2Twm4NznnIU+1E=; b=X6ztIw5eMmtcjn
	uB5LIc/m0SqnWXrN/RlxJn+PeHghqxOqBOLMoQBVNcGH9r4NuOmptOm6QAKeUMX4AGTQ+0bO//ivN
	IHebgKBrnd65BlufI7O553BCMFIeD1VfP/Mv7CkASDXoNxxIywjgDpuhmwtQd1M0LxSBMV7wZiiyl
	nwdBN/IOi1s+a/t261EiHGZYpoTQrsx1lnir/1eHSR35fFyZlv3hLQ4rxdLiAx8RNAU15eRwYzaK4
	S3eUq/UEFIKPM6mK6wE5WegJlEjoKkXi8J+BsLFUDD6OlWQZqE6A+hz449ihvk5KIXysxN1D9OMNb
	M5ntXmG6grWQDc68TEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuEm-00000000YGF-1x2l;
	Wed, 04 Mar 2026 21:58:36 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuEk-00000000YFM-1oB0
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Mar 2026 21:58:35 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82985f42664so3629b3a.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2026 13:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661513; x=1773266313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=OXgPhLEV5MmqjCJLZ7s2p7wuQWn8dJqRHO9wYvWbXwlZEQnfHYs+MwGVCvuKSfo0tj
         /PVaOj7phOk7Hyaer6/2+uPYP/opqR0w0Db8Y7pOUr5ZlLWiBFHJFbIJCG2w0pvsoEps
         oPEWRb/lDISYpNUyOg12NvWvFerTYldm5paa/a69RsCs2BQgEBKbn91CiX9vCqjhW5tR
         OYxv2eMNsT2Oi1ofgn5sC8m274j7nCZb5HQFSslL7kB05NrgoODLdm4sMIijdAY0L/zd
         oy11gcq2CaCyAjB8Vj5YvXjPmkqUlyV0dpzKr+tltizQ2s2/U45Vn2YkWP7VJOOwxSOM
         58rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661513; x=1773266313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=VaQJS1S9j+vlUE9Ko8YQF3sk4eknKIegr8sAyGxtF1OOZ3XUQC4Ej3Jyo/LRBihOYa
         kY2ZoMw+uKJcxFINas5URYzBIszVf06hzzHVqe7zK1MZn6a7AkpMXTb6NSfyojF+cQpM
         7+i8D0uK2+zDEwZxDXHTaZSLrH2EewoRfGA2H4mPNYv29XCx79zo3SW0Wq+6aVzMFNxD
         MrFly6LNLOMCrOfCQYCGlkQPqZMaYEqAEK5o16wLBNTagBa9WgXRKw9j/pnMyQ5TO/Rk
         W+6NbLFTS0RYeHWSMubhRNktl3+7vBvTQBBcTPSxp5UB828hzop9kCTtLGzWPbCQBFsg
         LXNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUatnOwgGy+d32sk78gwIRQqsnSusJjS+klHmspCIw9Si8nwsNTXBfIqUo8LifAGovSe0bK/b6s9jgzLDeAew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/hiaO5k2HGMeNCWtyNCmEqR2/nmGfYxf4+rnFG7TEw7PLFs17
	qpVFP0PiB+3Gh+YTr/SuaBde5lgNkZZiDE8lPqa9IPTEKsuCJL7OsYex
X-Gm-Gg: ATEYQzz2yr0wXFPGrwMfy5GwcjHGKw7NNEL5MnavcUtiDcEQMCUw9nTKtJog/F5E6Nw
	tloffpHuzJ3jeKEogLHg3O9vUt9ZqE0SsAQCvcggdMdIysqhpPdHpXA+2rN2e3o+9KbzgBffuIq
	wSyX9IRtJjb+6bXigJl2CbAmIQXeBBYGlYDixyBhCEIpDcwNfqM4agx/jcS9orkZ9Gm0m4Jrvrw
	1NHCqCJxwUGQ+lhlWpScDrmmjNs3g7c+0xAt9o1g6a0yg06hL4SRoWrtaX6yK2oZ4kFWfv2dghS
	sF+NRhvy8IH0ezAoFLZFfZR9sZESRaxZ6mqj+7Zhsxi+X0mQpv47abQrHkQ/GyVCgyAePmCxntV
	TgN9+hKvFP4KpuPFTLW9QwEFOEbggcp8+aqDK9nXzhYwYYXXzOPEtvPq/pxkkWgqO57bTuB3baw
	VgVtlVEoLPrcA4iesNRCAwQsidQNEQK60p2Cg9
X-Received: by 2002:a05:6a00:4288:b0:827:3321:7a23 with SMTP id d2e1a72fcca58-82972b63764mr2746760b3a.24.1772661513098;
        Wed, 04 Mar 2026 13:58:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82984a01827sm110603b3a.43.2026.03.04.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:58:32 -0800 (PST)
Date: Wed, 4 Mar 2026 13:58:31 -0800
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
Subject: Re: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
Message-ID: <a1ce9ab4-49cc-46f7-8524-1cbc0e6333fa@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_135834_477263_48866B51 
X-CRM114-Status: UNSURE (   9.77  )
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

On Wed, Mar 04, 2026 at 10:02:30AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
