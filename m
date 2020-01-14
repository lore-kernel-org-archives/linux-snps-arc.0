Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAD3C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:42:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCC424656
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ql13MkvG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCC424656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+b6oAFxZ3NiH7ccJocAvVpn7DrX/sMDhTE4uvBrAcM=; b=ql13MkvGTGH6nW
	LO2l1FzbrhK24kr1mWknhRM9VlpolleCLF09MqkMleowpJOo6Keztej0tA7GzTgwleaCWANJiIiRe
	m6SCA8UW57gAZZNXfUFyuOzjiS7jPf2JaMRan/nUNEfkL8MT1iCB13kNUose2jqXrfMKjSPv32rNE
	AoSyPhS/gOkTS/vbBfsWF3qcXaTJiFLpmD+1wFuJgCt3lsab7zsSNWOGOzytJ2dx+Jivsce12QT4K
	RBEf3zUmH3x+jrwhxaWZKcSSMW3jh4cgbCVNfP6moLTzrrRvvWUMDdKeurI7Vck/1V3rDjB4TWRu8
	ewbS5oilMATuAFL5LFPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irT1O-0006az-BH; Tue, 14 Jan 2020 20:42:42 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irT1L-0006Zs-S4
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 20:42:41 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mofst-1jTGb50WoT-00p6zd for <linux-snps-arc@lists.infradead.org>; Tue, 14
 Jan 2020 21:42:34 +0100
Received: by mail-qt1-f177.google.com with SMTP id 5so13758990qtz.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2020 12:42:32 -0800 (PST)
X-Gm-Message-State: APjAAAVdxYIMNmWCB+pOxHiKA3dinqVTZJTGt6A8alsmjL8O10nsS496
 3Ue8Cki/AHIFePtdM6Q2dYW2yRvlUNAVWaQ4mUM=
X-Google-Smtp-Source: APXvYqzxLn1Nj4qYcObdVSAkUm2fmRRi+xa7YXncyT2LEy7rE/VbjtJMaqfRb4R8TsrdH0c4vNhly9VoEeEnfkmz8pY=
X-Received: by 2002:ac8:768d:: with SMTP id g13mr422257qtr.7.1579034551663;
 Tue, 14 Jan 2020 12:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-5-vgupta@synopsys.com>
In-Reply-To: <20200114200846.29434-5-vgupta@synopsys.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Jan 2020 21:42:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2GUqmcA_q33=20OrK1+cU4f3mCrgci_bO3ho4B5PRODg@mail.gmail.com>
Message-ID: <CAK8P3a2GUqmcA_q33=20OrK1+cU4f3mCrgci_bO3ho4B5PRODg@mail.gmail.com>
Subject: Re: [RFC 4/4] ARC: uaccess: use optimized generic
 __strnlen_user/__strncpy_from_user
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-Provags-ID: V03:K1:OibryTzcinFmhcUGqEYZbs8B7APCcmhgZUruQVM23uvyL0hjqQz
 cQHnmHgZV2E3OTIeYX9KtAhjfu9pB5z7q2NK/VJPn7QSmXfQhHsXVu7e0quAiW0ficME7lP
 l1Hqvg+jpgZti8GqGjhlVdYAs568LI1wFB0gf0sK9VNx4wyRgFv6mERAdnyZK+ncR18LxF/
 o/KFwNTtsvuQXwM/YCCqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HGlQ3R7RPIM=:jRuJi9XSQD6ocpAF13hoIu
 UUpMisNS92kRbVmJmXUMHFUBfdjx07pkR60NGNHKbEioLQ9yTZbW8LgIu6R7Xsp5FS5HGGPw/
 W4WlMja1mrQXeMuRCpFir57ZYGLAB7pmoM+EOiBDxUSnjmR8Q7dQokN1ggK42SxWEZWanht3m
 CZzI4q1Y/6Tea8O7KSPKTDwRNZpH9HkaDOtT1CTcIu3DNOS0pwF2ifPxoX5PFiLjBn/FnmIM+
 AOcVKftYjx4CIlyzfMLAHQBsKmZ8WV4WRQpMm1H0Zm+rFA10VoPOvHuZiQ1bFNd6NCPnHXTSx
 jEeL8NIuCJNSUabWl79IuvhY5J8smQp4AuMH55u9XYpqBB3oRZidftrg1rDKY7u4xArMtf+2S
 XrZxkqbJDoHoykLzk3jCMvQjjtV1LKHaASU8mmsTCUlTrZobcP8UxWuek5oxJlz5w7kjjQcRS
 jqWlZ23cd7eSCUTP/aiQJTOA++uxtd2OuZgCNlPLt/vFvdoJzOUkwhhU5tlJXIRSCZsksSgWz
 4dwHn5sJUdVHQS2lfZgzGMp9TVPj8ZxzDRWNyAMuwg6MdFGqKR1Jt5bUzhFFBGlt+vtmXx+0J
 /IZzXSFIg57+rgZ7uLNitmWh3EvCHu0V4azfy2LRs8CnbrhHevaO6+i/oqtpRU21teVs/FcUC
 AHKOOryAmwz0aR56sowcY40U2G9i9Ig465yiyPndWrKv5m7MYUxVwgXqInI889bMn4BljLT2n
 BaK7+frO24tYGtsdVGEahsyfTxdMUsnOtfiGhUG2uqJrm3HGseoMWlyxFRmETsSEgu0SBVST4
 qnOIjBMMHMnkEiaknvDnk1nVlrvSXB2ULFvEMM+c9X/pLex81oFFUOJ48uVeT2BQcYTfoxWCX
 Nz3ISkSYggNG3Y1eKNuw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_124240_204945_A27D02D9 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrey Konovalov <andreyknvl@google.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Ingo Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 9:08 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> diff --git a/arch/arc/include/asm/word-at-a-time.h b/arch/arc/include/asm/word-at-a-time.h
> new file mode 100644
> index 000000000000..00e92be70987
> --- /dev/null
> +++ b/arch/arc/include/asm/word-at-a-time.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020 Synopsys Inc.
> + */
> +#ifndef __ASM_ARC_WORD_AT_A_TIME_H
> +#define __ASM_ARC_WORD_AT_A_TIME_H
> +
> +#ifdef __LITTLE_ENDIAN__
> +
> +#include <linux/kernel.h>
> +
> +struct word_at_a_time {
> +       const unsigned long one_bits, high_bits;
> +};

What's wrong with the generic version on little-endian? Any
chance you can find a way to make it work as well for you as
this copy?

> +static inline unsigned long find_zero(unsigned long mask)
> +{
> +#ifdef CONFIG_64BIT
> +       return fls64(mask) >> 3;
> +#else
> +       return fls(mask) >> 3;
> +#endif

The CONFIG_64BIT check not be needed, unless you are adding
support for 64-bit ARC really soon.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
