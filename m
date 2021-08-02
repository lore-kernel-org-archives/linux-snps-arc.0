Return-Path: <SRS0=mt4L=MZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2C1C4338F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Aug 2021 18:04:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 473E860F51
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Aug 2021 18:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 473E860F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmu5TTiONibOIRfibDUMbH+9L6fjt/D9gnMAH6jF+9Q=; b=IQ0kt9Nb+8aH9a
	0javl1+F8Ie+CZ533SXwwr2HSSCZAD6qY6pXfL743r+apCWajBnxUB55/kQwQbYqEef3WIXZu6eB6
	YzawWs5FvzGK6qYScze4kdai953EVy/IFpdLSZm8ZBUxd02BDYVio6s/z0xUTOTlHVzMbJintRxGb
	8FNtI1NKWvaq1qwv9kMMq7il1ZJ4DoNFyT1fzl84hH0n30oYkctJaz3YWymbQhNsfkcI+lRtgYoO7
	60rV4/F9Jn4qt7HRBSyHxCIy3FnC2HvMEPG1RQpPu1rLCBWBzXx2iRS3r9xFSDhDyh+KzlXQI7BGU
	E/OUgYf5ThQZli5n1z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAcIS-00HQUB-Qv; Mon, 02 Aug 2021 18:04:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAcIP-00HQSP-26; Mon, 02 Aug 2021 18:04:14 +0000
Received: by mail-ej1-x62a.google.com with SMTP id h9so16790350ejs.4;
 Mon, 02 Aug 2021 11:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KpOmQ9FDFdEDp1DRxCOS4/jNxSUC+b7VQifrd/M4FUE=;
 b=bllfssUh1l3Cfof1I9S9zG5MovjfwF9CypWcpRvDmWpOEx759rPpO8GjtwWqnstMf2
 1QwJGh+kGvZKoMFQKf6FhnPOMkpo3JEJzP0z2jokepgekez40su6FDqDQO76azQW4aaY
 ndpMqrh8QhqQUbO9PB7UVTzGgkGjnuiB8BDrnOUlo6IfpOOOD5wRbVnNH3nzFEb8Jlvv
 f2sHv6d82OwwrINjEhGy7L8YhBy8Uq7x29x9aN5cqnZAFpZ+YseiNvbNJLRthMaSdJt+
 GNYBQGlDLHbH2bDQodG8T6OzjQiYO36wOgJ2MGUlCkSsxnL4jcZpqW+jXXGFabstpv3T
 roTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KpOmQ9FDFdEDp1DRxCOS4/jNxSUC+b7VQifrd/M4FUE=;
 b=VCTUzIPkvVaCm1wO1FUh3G8HPh77HJy9Z23vumdf7uVm2v4ODmqIDUoMxpsyvUqjK8
 xH7ZA/phGr37bVZQTuydKOtwgYfMQmJc4yGIkiLLRF3UK4yInlJ5mQjYvC/slV9Y5zEM
 k+YFmtzuQaRDZz3Q+65WSIQz+uzvLW50cJd10e2jRr0/S7/S5glD83FH22ZTf1hQrk+i
 rcnfTIvJ3VWRKRXo7O0alf4NkSzki/0Od2j0SFJzZ1V9P7du/0nmTOaA0WCEEr3DrAe9
 iHUej4pDxROi72ezm5oOv2lG/2eS5q1LS9ETNzosm+D05QbwdTo8wXCzznjjEADkiZmm
 JRQQ==
X-Gm-Message-State: AOAM532Ql2EnE+T6FluQZUrZStkdOmvuWS3KVNhOpw8M6PjVrXZ+aSx5
 qDMqyAkyrhrPrcWsWecWJ0kUHrufPrQU9pGrhHU=
X-Google-Smtp-Source: ABdhPJx4CTYoE1N/7r5r3Yv59NCnUgpiXyVEWPBrQR2H8OPpQmdyOckhCi7flWDeCgEu3pc8T6+GCYt+gQKqcxApyio=
X-Received: by 2002:a17:906:34da:: with SMTP id
 h26mr16470323ejb.376.1627927449046; 
 Mon, 02 Aug 2021 11:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 2 Aug 2021 11:03:57 -0700
Message-ID: <CAMo8BfLDjw71xiCDo8uk4pQFuOzqAoak0k3R4YJDnRsA2hoCtw@mail.gmail.com>
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Ley Foon Tan <ley.foon.tan@intel.com>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, linux-mips@vger.kernel.org,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Nick Hu <nickhu@andestech.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Mike Rapoport <rppt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 linux-riscv@lists.infradead.org, YiFei Zhu <yifeifz2@illinois.edu>, 
 Greentime Hu <green.hu@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michal Simek <monstr@monstr.eu>, 
 Helge Deller <deller@gmx.de>, "open list:SUPERH" <linux-sh@vger.kernel.org>, 
 Vineet Gupta <vgupta@synopsys.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Guo Ren <guoren@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Rich Felker <dalias@libc.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-um@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Brian Cain <bcain@codeaurora.org>, linux-csky@vger.kernel.org, 
 Stafford Horne <shorne@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, Chris Zankel <chris@zankel.net>, 
 Vasily Gorbik <gor@linux.ibm.com>, linux-snps-arc@lists.infradead.org, 
 Jonas Bonn <jonas@southpole.se>, 
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Colin Ian King <colin.king@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, 
 LKML <linux-kernel@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, 
 Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_110413_147449_98D242D6 
X-CRM114-Status: GOOD (  12.18  )
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

On Fri, Jul 30, 2021 at 10:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  arch/xtensa/Kconfig           | 4 +---

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
-- 
Thanks.
-- Max

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
