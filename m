Return-Path: <SRS0=T7L2=F2=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AA4C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Dec 2020 18:55:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BF022AAE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Dec 2020 18:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40BF022AAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iZ/IcckMGxOSog6WJ0bNiqgf+GnJeSYN2ThT913/CpE=; b=DApl7F4cV96rlpn0x9Ex5N1Y2
	A77AW1s34h+EnKMFh8zPm5pHciQcooFlU4FuMb9Fdq5qSJQVRzwXqGP0FIxDLRhZAmy26V1K+Efwq
	KCPwT0Vk4kz0hHFePEup3ilOPlcUv0DLvFEs3HSYFy2zZmhFFKbUzVK/wZTS0ylr7XrmiyxxPPiKK
	kE2Y/KGcd2hLumTQjzWYK6SlQvIh0g9SofPkOZwZGZ0C1Mon8lqjU0fMA2EdpbwK05Y9UISmRBiPh
	w64DJngnbRcLrXNo7QQ7M77SbELMzLkA/rLRDxgLKDBhJes11EgMvH5W+mHxqDZMME0Dk2ohZgJNb
	J38af3xGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krmoI-0005wa-Lh; Tue, 22 Dec 2020 18:55:02 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krmoG-0005vg-04; Tue, 22 Dec 2020 18:55:01 +0000
Received: by mail-oi1-f179.google.com with SMTP id q205so15722083oig.13;
 Tue, 22 Dec 2020 10:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=la43jOzGT8cpDZH0lHbZ8yczIDIlNNAQ1oOndJF72r4=;
 b=P/uwsq0gzkARCK7oWqMILvXu+IdqUhSeyaUJ/VcW+ijFZc7eODLc/chfTdXEBdt4Pe
 paZzhHxQiufXLtVMeYnmX2A4rAgo9s4yc7awZ/AxqlBFIfZr0YOEsMiwiYviPRDkmEL1
 9ZbcpK6xD04FNtas7WLQB3YrNQ4DEGYU6Yfk0nRmgI3vYmslNE4wN19R/jvduGT+nMo9
 iu/qUtwSIQiF7xkbZ54WNGa7Dxo4bE1Xn8Nk8tELqVRPU/bCGBwxlAqma+DVD3HHfvYh
 Mvh1qjdmC5H4Ko+0QVqgAeAxxMN1/7l+MxCTpKBOVyvjgYRvuGrisS1VyvndetVXp5Wu
 rDXw==
X-Gm-Message-State: AOAM530ij2ANiaEe97yiMgtxSixWmRO93T6Qq0PTbyHo6iU2CoAP677r
 90/Rvx9agWtHsAw+H3yjF0pAZnDgbkorj+YkoKs=
X-Google-Smtp-Source: ABdhPJy5EVY7T6HE7RxxJ9AoKr5usE9gCbUG5HZ1gWiHgPXdK9RZjFwARYSd7qSwoUdfSw0ANGyqV1mRCh80XLruDv8=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr14009921oia.54.1608663299046; 
 Tue, 22 Dec 2020 10:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20201222184510.19415-1-info@metux.net>
In-Reply-To: <20201222184510.19415-1-info@metux.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Dec 2020 19:54:48 +0100
Message-ID: <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
Subject: Re: [PATCH] arch: consolidate pm_power_off callback
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_135500_062234_17039CF9 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Christian Brauner <christian@brauner.io>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Enrico,

On Tue, Dec 22, 2020 at 7:46 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
> Move the pm_power_off callback into one global place and also add an
> function for conditionally calling it (when not NULL), in order to remove
> code duplication in all individual archs.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Thanks for your patch!

> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -43,12 +43,6 @@
>  #include "proto.h"
>  #include "pci_impl.h"
>
> -/*
> - * Power off function, if any
> - */
> -void (*pm_power_off)(void) = machine_power_off;

Assignments like these are lost in the conversion.

> -EXPORT_SYMBOL(pm_power_off);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
