Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184FEC0015E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Aug 2023 20:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elF96WG3ZJL0QIaytx+BarXQDqzUjtnY67snjkTXRxU=; b=rgRa1eXb1FMh1T
	wlXe9cc5y04oD8Mz4usDzmwTK7g4FjMqIx7tAgLRUwz0y4M3CXnwHdE/3y6I/iwXAnF1vsoOz3WTX
	UE5rhw3aKC9O269u/ekdLSgyna2gVpEJEG5mbF9rhKqq/5HwlH3sZvnLFvaPu4dp8UOS1aQ7mREhI
	llFf5jtvcR5PX90NpsGTRzUB4kQ+wl3dS8g8uNOprxAu2xHeKOazbO3Wylpp8UEZXlKsOY3AlYEFr
	mkBmwIlXEKy4POud5J2AbLALnvyr1GVkbxewNhUFyHWC5XhYMWVtJC+0H9NpQhREKseZ7oDnwCQqJ
	SBWwNGbp9aFiaAQhT08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUYRc-00BX3b-11;
	Fri, 11 Aug 2023 20:09:12 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUYRa-00BX2f-0x;
	Fri, 11 Aug 2023 20:09:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3180fd48489so1814890f8f.3;
        Fri, 11 Aug 2023 13:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691784547; x=1692389347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiId7A5uZw2EU8qqzqo15ZE/APG2EJpcQ/tYWVbt9lY=;
        b=BaZ+dUQu/1Rh/HmooCs5qesrlznNZmxKQcjlG6xS3H9tMBq45bWpSP/e/I9VW7Q4Xg
         AYC3dIvP3Tshg4rhk7854uV/UhGx97vQN7Rf3ZCaEHHAoEtsxEWEmUpcEhAOLyHKUkRY
         HVVMWwEzTKjzju9rFIbSEBbfEjRns5F4jM4I+IGUunaEP+fCDTpk2oAvMHx4dL7U2RGZ
         4aZGEHqsVqDzd/Dx1nigupYSSEd6i5SYdVQlhZnYf0HmP1+JX1iQyYjTZ7iJO25zwy/W
         meLkO9bC2fWzC7AP4RiEm000UPRoQTx/kvFqN+cmSypY/c7NuSjR+Di9RfLfbQvrmzWa
         O7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691784547; x=1692389347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiId7A5uZw2EU8qqzqo15ZE/APG2EJpcQ/tYWVbt9lY=;
        b=IfoDSXZwnCBEcoFd/lBVkBHOIDmcqzUFclgmep1GRLUDlpb4HHzGyRTh3kMVh/ib5M
         zngok3oFzYG4yOxcPrlKtDNmX35eYq8W2lpKiMTUuwHO278fNW7m24GZorpgGVOxbqp8
         +RvMoA1GuwAS8+zwXS8gO/YD32tMgk5Zuu8DZIhaZVl81VCAq753ZH2ns9zu3V6LZqOf
         LEwtXQ+jxso7/l++8mP02+VYdIqQwP3xyB+U02cfljRV3WrGddI0qfKkevLntbpMsiCS
         vRtj547lWubjzdvGRZODvRQfwoyFvUkmXVtRmXuPDdGdgmtpsXYO4mVXPl+DdmXpkyXS
         Fh2w==
X-Gm-Message-State: AOJu0Yya0p79k8/7GNCwnkdbjl5sgJ0CKmDINDM0sxdj3N/FI9V/7li1
	f6EIoRE3BUo8SAKTiv++sWU=
X-Google-Smtp-Source: AGHT+IF56byQqtdspAbdfY0iQX/Evfjk3njW6HR2sh5+JW8jK3nUCCRIGElV0mnlA998CkxmLy5Zlg==
X-Received: by 2002:a5d:5309:0:b0:313:e57b:e96d with SMTP id e9-20020a5d5309000000b00313e57be96dmr2116630wrv.36.1691784547091;
        Fri, 11 Aug 2023 13:09:07 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id g11-20020adff40b000000b00317df42e91dsm6540591wro.4.2023.08.11.13.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:09:06 -0700 (PDT)
Date: Fri, 11 Aug 2023 21:09:06 +0100
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	x86@kernel.org, Borislav Petkov <bp@alien8.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S. Miller" <davem@davemloft.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Youling Tang <tangyouling@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Zhen Lei <thunder.leizhen@huawei.com>, Xin Li <xin3.li@intel.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marc =?iso-8859-1?Q?Aur=E8le?= La France <tsi@tuyoix.net>,
	Johannes Weiner <hannes@cmpxchg.org>, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 16/17] [RFC] arch: turn -Wmissing-prototypes off
 conditionally
Message-ID: <ZNaVYh2qi0VQQKWf@antec>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-17-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810141947.1236730-17-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_130910_334731_FAE6C01D 
X-CRM114-Status: GOOD (  20.69  )
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

On Thu, Aug 10, 2023 at 04:19:34PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
,,, 
> ---
> Below is the full list of warnings I see in defconfig builds for reference, these
> do not need to be part of the changelog.
...
> arch/openrisc/kernel/process.c:100:6: error: no previous prototype for 'arch_cpu_idle' [-Werror=missing-prototypes]
> arch/openrisc/kernel/process.c:240:21: error: no previous prototype for '__switch_to' [-Werror=missing-prototypes]
> arch/openrisc/kernel/ptrace.c:191:17: error: no previous prototype for 'do_syscall_trace_enter' [-Werror=missing-prototypes]
> arch/openrisc/kernel/ptrace.c:210:17: error: no previous prototype for 'do_syscall_trace_leave' [-Werror=missing-prototypes]
> arch/openrisc/kernel/signal.c:227:5: error: no previous prototype for 'do_signal' [-Werror=missing-prototypes]
> arch/openrisc/kernel/signal.c:293:1: error: no previous prototype for 'do_work_pending' [-Werror=missing-prototypes]
> arch/openrisc/kernel/signal.c:68:17: error: no previous prototype for '_sys_rt_sigreturn' [-Werror=missing-prototypes]
> arch/openrisc/kernel/time.c:111:25: error: no previous prototype for 'timer_interrupt' [-Werror=missing-prototypes]
> arch/openrisc/kernel/traps.c:146:6: error: no previous prototype for 'nommu_dump_state' [-Werror=missing-prototypes]
> arch/openrisc/kernel/traps.c:221:17: error: no previous prototype for 'die' [-Werror=missing-prototypes]
> arch/openrisc/kernel/traps.c:239:17: error: no previous prototype for 'unhandled_exception' [-Werror=missing-prototypes]
> arch/openrisc/kernel/traps.c:246:17: error: no previous prototype for 'do_fpe_trap' [-Werror=missing-prototypes]
> arch/openrisc/kernel/traps.c:268:17: error: no previous prototype for 'do_trap' [-Werror=missing-prototypes]
> arch/openrisc/kernel/traps.c:273:17: error: no previous prototype for 'do_unaligned_access' [-Werror=missing-prototypes]
> arch/openrisc/kernel/traps.c:286:17: error: no previous prototype for 'do_bus_fault' [-Werror=missing-prototypes]
> arch/openrisc/kernel/traps.c:462:17: error: no previous prototype for 'do_illegal_instruction' [-Werror=missing-prototypes]
> arch/openrisc/kernel/traps.c:67:6: error: no previous prototype for 'show_registers' [-Werror=missing-prototypes]
> arch/openrisc/mm/fault.c:44:17: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]
> arch/openrisc/mm/tlb.c:188:13: error: no previous prototype for 'tlb_init' [-Werror=missing-prototypes]

I'll try to get these fixed for 6.6.  I was looking at them recently but did not
actually make any changes and just put on my TODO.  Your series moves it up in
priority and it should be easy to get the fixes out.

...

> diff --git a/init/Kconfig b/init/Kconfig
> index 639e8a3363c30..80cd67c0d7fa4 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -170,6 +170,16 @@ config WERROR
>  
>  	  If in doubt, say Y.
>  
> +config WNO_MISSING_PROTOTYPES
> +	bool "Hide -Wmissing-prototype warnings in arch code"
> +	default WERROR || !COMPILE_TEST
> +	help
> +	  Some architectures have not yet eliminated all warnings for
> +	  missing prototypes in their core code and will produce a lot
> +	  of output for these. Ideally these should all be addresszed

addressed

> +	  by individual bugfix patches, but in the meantime saying 'y'
> +	  will skip that output.
> +
>  config UAPI_HEADER_TEST
>  	bool "Compile test UAPI headers"
>  	depends on HEADERS_INSTALL && CC_CAN_LINK

-Stafford

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
