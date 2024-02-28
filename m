Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD4C47DD9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Feb 2024 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juNcm12fXPdTi+0HI5NGX0aYAZL6GZyw+jjbEvmJZSQ=; b=bTrC7su/sjFuXh
	U1tht0YOp1nlsJj2BNR2b4QEFTlEbM/b5hoyyYMzXego9hkLXZuoTzS2RiisKCD79pvza1oB7VPLG
	141oADTaS6ftWBzA6FCbuOmy/eBnH/PsCjt4MNNzejbm62RK8OxkTPsoBhQwZl1Vlj6WMbCGTmABu
	eq1quH6C1BRWm5AQYtfm0koCA9/Aa7XPtuTf1F07XwkftJ5iZnw/2PSxQmSpIm6LNiKq71Db6sroY
	B3WgEe2eCF4xL/Uc5rEUxfLegp0L9TNCqMsLWGO403OMqvYrNc23/4BuqNisFa3gG1hRMFIjr+H9u
	dnl9ugGw/ZTLA9F5Gcvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfR8I-0000000Aw6v-2dGb;
	Wed, 28 Feb 2024 21:06:30 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfR8F-0000000Aw69-1tue;
	Wed, 28 Feb 2024 21:06:28 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33d36736d4eso147793f8f.1;
        Wed, 28 Feb 2024 13:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709154383; x=1709759183; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0a8qBD6vozPIAISnQHJRWdPKOWiVN4p5/6pJZQ2dXnQ=;
        b=EWvanMDJHa0HS7JPNME10mrgzsG/X9rmZww6rERSAYc1dERGb16hODpExPjokWHfjP
         EQWaTBu5s8E9yw+F6Avgx8+T4NRNAiRpMSI8dX3ExjkoeRJkjAU7u9Z20iehuqeA537Z
         1w3SA9+10T+nfBrXeTAIeeMtfnZxKMNb3lP2B2VPoXyusD/DgbPiyopKJBP+7AcFgKXu
         hSEHAMnWeEkPI/K7VKHrzcHYg+fnV3ZM54N5FSOzIxP3801aNZ5FAA05huNta9tUEnBO
         Rokk6K5URFFguAp0xOfflcrG98AHFRs0zJ0WRMu0C6+3uzd9gnVwcYZRXzDQBos0wCo5
         +zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709154383; x=1709759183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a8qBD6vozPIAISnQHJRWdPKOWiVN4p5/6pJZQ2dXnQ=;
        b=QuJ+SPc3pE71TKMf0TMv6T0A6KFBwDKQNvV3ariOE/6IxMribosS/EO5NyyVFvuknM
         rTq1LRkBn79eoFEet8q/oxX9hL+hcVLaPl6yRDJkM+Qq9Mp1Ipl/gVClKjMU2eosGenW
         WuQkomab+x4IfVQgV/QPjqwxzPUwVCtWafceUNfAv5uNX5j8lsAq0/3kC84Dq28N+Txg
         sMMNWhzySPJfXu8dlVhLvlTmY8vFtYeQI1THuoCQi/Zp0C7DksSWRC/lXJ2rrg8LWw/N
         yBkV6iN6mVXTXQlfujfCPoPxCv09y5TZacaBWdhVj6B0ng1uAHdeTROormvFFzRYikfU
         S27w==
X-Forwarded-Encrypted: i=1; AJvYcCUxR3CpxkEYa8Br8Im7a3pm+dKOwlphrik1vzaMGL9eP/8ewkov1j1FqukT//rrxdlVsnGvTxmG4cuGBAMb2pTJj/gmsPoxu/R8S6TaNkfSYsy5C0DceY8qx63qwa6x0g4RXfyntk2dk1O5ssdAa7CHT2XgROE/VrOTZ+uXEb72snyc4AAyfEUw5b/2fv6kPQUy6IxrrgJgJ4+RSakmAWmZFApNiJknx/R6Gb2VPE9h044MTEe4cGU=
X-Gm-Message-State: AOJu0Yw8HerEaAXsZJEiTocwofhneVPwTOB2mWzUhZ6iO/HdJ0rgr8k6
	bl+6GXXcqBwtkfxsznKAgpHUWxJMAaojveA0clyyWcaenxSLZVVF
X-Google-Smtp-Source: AGHT+IHczATb7A8ZRTaH383CIQ4ejybI9MzL/yjlqycOyBbx2+IYQRI3gE2POfqlKMAC8LKmr3GeXg==
X-Received: by 2002:a5d:618d:0:b0:33d:f51f:2da5 with SMTP id j13-20020a5d618d000000b0033df51f2da5mr46406wru.7.1709154383088;
        Wed, 28 Feb 2024 13:06:23 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id m1-20020adfa3c1000000b0033d67791dc0sm15568132wrb.43.2024.02.28.13.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 13:06:21 -0800 (PST)
Date: Wed, 28 Feb 2024 21:06:21 +0000
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>, x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all
 architectures
Message-ID: <Zd-gTf6mvVdPEovO@antec>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240226161414.2316610-4-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_130627_520392_B4057AE0 
X-CRM114-Status: GOOD (  18.62  )
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

On Mon, Feb 26, 2024 at 05:14:13PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/alpha/Kconfig                 | 1 +
>  arch/alpha/include/asm/page.h      | 2 +-
>  arch/arm/Kconfig                   | 1 +
>  arch/arm/include/asm/page.h        | 2 +-
>  arch/csky/Kconfig                  | 1 +
>  arch/csky/include/asm/page.h       | 2 +-
>  arch/m68k/Kconfig                  | 3 +++
>  arch/m68k/Kconfig.cpu              | 2 ++
>  arch/m68k/include/asm/page.h       | 6 +-----
>  arch/microblaze/Kconfig            | 1 +
>  arch/microblaze/include/asm/page.h | 2 +-
>  arch/nios2/Kconfig                 | 1 +
>  arch/nios2/include/asm/page.h      | 2 +-
>  arch/openrisc/Kconfig              | 1 +
>  arch/openrisc/include/asm/page.h   | 2 +-
>  arch/riscv/Kconfig                 | 1 +
>  arch/riscv/include/asm/page.h      | 2 +-
>  arch/s390/Kconfig                  | 1 +
>  arch/s390/include/asm/page.h       | 2 +-
>  arch/sparc/Kconfig                 | 2 ++
>  arch/sparc/include/asm/page_32.h   | 2 +-
>  arch/sparc/include/asm/page_64.h   | 3 +--
>  arch/um/Kconfig                    | 1 +
>  arch/um/include/asm/page.h         | 2 +-
>  arch/x86/Kconfig                   | 1 +
>  arch/x86/include/asm/page_types.h  | 2 +-
>  arch/xtensa/Kconfig                | 1 +
>  arch/xtensa/include/asm/page.h     | 2 +-
>  28 files changed, 32 insertions(+), 19 deletions(-)
....
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index fd9bb76a610b..3586cda55bde 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -25,6 +25,7 @@ config OPENRISC
>  	select GENERIC_CPU_DEVICES
>  	select HAVE_PCI
>  	select HAVE_UID16
> +	select HAVE_PAGE_SIZE_8KB
>  	select GENERIC_ATOMIC64
>  	select GENERIC_CLOCKEVENTS_BROADCAST
>  	select GENERIC_SMP_IDLE_THREAD
> diff --git a/arch/openrisc/include/asm/page.h b/arch/openrisc/include/asm/page.h
> index 44fc1fd56717..7925ce09ab5a 100644
> --- a/arch/openrisc/include/asm/page.h
> +++ b/arch/openrisc/include/asm/page.h
> @@ -18,7 +18,7 @@
>  
>  /* PAGE_SHIFT determines the page size */
>  
> -#define PAGE_SHIFT      13
> +#define PAGE_SHIFT      CONFIG_PAGE_SHIFT
>  #ifdef __ASSEMBLY__
>  #define PAGE_SIZE       (1 << PAGE_SHIFT)
>  #else

For the openrisc bits,

Acked-by: Stafford Horne <shorne@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
