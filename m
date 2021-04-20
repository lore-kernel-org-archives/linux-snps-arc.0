Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A82C433ED
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 07:08:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2ED61220
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 07:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C2ED61220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FmSBvLRu4TC0dYIB38vG5U4cxN0ditrwIpf7pksgjsY=; b=lXsUHtHd0TALZzmUw4MNfI0vx
	YS3nRpd+EjCMFLIuPTN0vjY0nF3ob1ziHQeKYlUt1WuWJecuW9K/N3wZZlwESZePJzX9JFcVLVh0i
	+L+XvX92V6FoQ0FJ2uynr7yyUu3FjyraJFFotDzIzlRWyugSMPkws+c7fR7aMA0y4sirBqtaL3qpU
	khQI/tiIwyMTlaDYUvk4iPaVefr+sq5nEUWkkG7W2OKiqytOX9GNg6BlNo9W7xCA7mO/oFkT+bX1A
	HNGnA1T1pTTQDZ+/nM3AXZiMPF1lLJrSMU9gmQkijkxF1bN4aqoLLHS0PAlSkwbs1DxFROgFJl+zv
	fnJjqasjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYkUm-00BPkw-Q2; Tue, 20 Apr 2021 07:08:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkUb-00BPkQ-KC; Tue, 20 Apr 2021 07:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kVGr8CsF1My79J8xpinlB3/ZQ4Uh3svFm0eR6xjmhD4=; b=dYI/cmxqNdizPb/W5J0qm3x8G0
 1vLcVpHjtznv/nT07gOUFRXpwqqlO//t+BOpZlYGBWeLIhatwCUqY7lTkD0xod5X5VTc1+08Qay3r
 ohVWJ0hzyJo1eEhZ5SNqUmFNW9ao3LxT8jBvUPJtrjfme/Pn00JSIEw5O5hymwXXw6R99Y+xt23Ga
 5n9hs9VcVGJtm9qUubms6uMWgJv+8Oa9cQhFcfnPuCaLsc1FvftIMKepUlUkX9n7bjZ3r6Si5lMlu
 ZS3z6g6nb1Nzw80RQl6bAt9XsauzakL/X6rZZJiYfxqaRcf59CsgMiw9dIIlSj7dfg2/yJNbvUFj3
 CiCvfFAQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkUY-00Brof-4y; Tue, 20 Apr 2021 07:08:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27EFA6135F;
 Tue, 20 Apr 2021 07:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618902493;
 bh=DOW/KsRt5H6t1Pgz46XK8iIY+rilYGODWaTzp+KKVBg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bGeMIcK4oyaw9PKWK4LZfywrca9QFox2DwtXtJf3Rpcw/1K0zEYwkxTvdm9Wy2p/k
 6FGb/yaJGmnEbuwRVwyZQkwjZldF6m9tFCT+KATXFY8IrIR886CLL8liQSNzWyh2yw
 iJSJjHp3Z+yxDM9fPgaOfcQdSbHoO+TCqiHV+U8+DlXk0kyo+sveadEsfFEWKESyT3
 JVcLzmur1EbwKBuEBrxveDtDEWusqRL4P/EY4pV14VHKqTqzeLRn2qWiYT9IAC9QW1
 bErddbD2N2wX+mbwamKuFEVf0NAPJ+BT3maEQ6dNvAXY5/xnZvWRUHB1OYwLit78CN
 d989R9HQVE2fA==
Received: by mail-wm1-f47.google.com with SMTP id n127so7704479wmb.5;
 Tue, 20 Apr 2021 00:08:13 -0700 (PDT)
X-Gm-Message-State: AOAM530mfANQYO/1T9w53ElrJcE1wWS39d2qD5mn0yoosI2DDAkRlPXR
 REeZwiBVls+arCR9l7X/XU0CEF6FWFwnqd6MK9I=
X-Google-Smtp-Source: ABdhPJzw8YTyu5KshxUEZlu3irZnfAegvQ8VILMGpH1RGSIFiQhsKgjG1gjcqz1I3fFsHj1Q1aLjZg7NWbZtj6Nq3DE=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr2758133wmi.75.1618902491684; 
 Tue, 20 Apr 2021 00:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
 <20210420031029.GI2531743@casper.infradead.org>
In-Reply-To: <20210420031029.GI2531743@casper.infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 20 Apr 2021 09:07:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
Message-ID: <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
To: Matthew Wilcox <willy@infradead.org>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, 
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>, 
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "mgorman@suse.de" <mgorman@suse.de>,
 "brouer@redhat.com" <brouer@redhat.com>, 
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_000814_274373_13C8021A 
X-CRM114-Status: GOOD (  12.47  )
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

On Tue, Apr 20, 2021 at 5:10 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Apr 20, 2021 at 02:48:17AM +0000, Vineet Gupta wrote:
> > > 32-bit architectures which expect 8-byte alignment for 8-byte integers
> > > and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
> > > page inadvertently expanded in 2019.
> >
> > FWIW, ARC doesn't require 8 byte alignment for 8 byte integers. This is
> > only needed for 8-byte atomics due to the requirements of LLOCKD/SCOND
> > instructions.
>
> Ah, like x86?  OK, great, I'll drop your arch from the list of
> affected.  Thanks!

I mistakenly assumed that i386 and m68k were the only supported
architectures with 32-bit alignment on u64. I checked it now and found

$ for i in /home/arnd/cross/x86_64/gcc-10.1.0-nolibc/*/bin/*-gcc ; do
echo `echo 'int a = __alignof__(long long);' | $i -xc - -Wall -S -o- |
grep -A1 a: | tail -n 1 | cut -f 3 -d\   `
${i#/home/arnd/cross/x86_64/gcc-10.1.0-nolibc/*/bin/} ; done
8 aarch64-linux-gcc
8 alpha-linux-gcc
4 arc-linux-gcc
8 arm-linux-gnueabi-gcc
8 c6x-elf-gcc
4 csky-linux-gcc
4 h8300-linux-gcc
8 hppa-linux-gcc
8 hppa64-linux-gcc
8 i386-linux-gcc
8 ia64-linux-gcc
2 m68k-linux-gcc
4 microblaze-linux-gcc
8 mips-linux-gcc
8 mips64-linux-gcc
8 nds32le-linux-gcc
4 nios2-linux-gcc
4 or1k-linux-gcc
8 powerpc-linux-gcc
8 powerpc64-linux-gcc
8 riscv32-linux-gcc
8 riscv64-linux-gcc
8 s390-linux-gcc
4 sh2-linux-gcc
4 sh4-linux-gcc
8 sparc-linux-gcc
8 sparc64-linux-gcc
8 x86_64-linux-gcc
8 xtensa-linux-gcc

which means that half the 32-bit architectures do this. This may
cause more problems when arc and/or microblaze want to support
64-bit kernels and compat mode in the future on their latest hardware,
as that means duplicating the x86 specific hacks we have for compat.

What is alignof(u64) on 64-bit arc?

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
