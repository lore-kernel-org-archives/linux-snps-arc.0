Return-Path: <SRS0=SiYH=EG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BEEC388F7
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Oct 2020 15:03:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867DC206F9
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Oct 2020 15:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="robEry1k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867DC206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t59otuU732FAZUqxzQwpUDtCD+qM+TC727EzS6iDS/4=; b=robEry1k0E6zc2YqMJRnKKqnY
	1O8NY6sQB86udUFy/Ew4ZzUr3jHXeOxYMq/2AYBI4uKYY51Icx4AKul+V7AuPxnU0DXyojb5a4Oal
	O8EWG34miBXBZhd9dnKAH6jyS+qSmc4Ny3KPGXCQk1MlOKdOAZQqtwjkEDb8F2/oO4efnFxb7Oorc
	UNdDnnXdrEXSAZv47y5kPJ9H0u9x6x7tvKHj9ELEhVp8lECi7LIrB8IwKVQvYTldBPHGRI4eUVwNh
	q+J+eDm03yn0d16/wDDmEiT81MJN6e2rTCKa2p5nhfhfS8h1v46b3/pmdDDLExo7CXTHXTRi9kfVv
	8DM2wXJpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYsPY-0002zv-Ty; Sat, 31 Oct 2020 15:03:20 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYsPT-0002xc-IY; Sat, 31 Oct 2020 15:03:17 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CNj930Clbz9vCxd;
 Sat, 31 Oct 2020 16:03:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id McRUnAiLxW8A; Sat, 31 Oct 2020 16:03:02 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CNj925qDJz9vCxc;
 Sat, 31 Oct 2020 16:03:02 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 41AC91774; Sat, 31 Oct 2020 16:05:39 +0100 (CET)
Received: from 37-170-67-121.coucou-networks.fr
 (37-170-67-121.coucou-networks.fr [37.170.67.121]) by messagerie.c-s.fr
 (Horde Framework) with HTTP; Sat, 31 Oct 2020 16:05:39 +0100
Date: Sat, 31 Oct 2020 16:05:39 +0100
Message-ID: <20201031160539.Horde.n5yNbG9LoUSWqtuPQW_h3w1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic
 & friends
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
 <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
 <87sg9vl59i.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
 <CAK8P3a3FyKTHDSAPCyP8e7UA0LN3OvAatNK_vQ3tnBsdbou4sA@mail.gmail.com>
In-Reply-To: <CAK8P3a3FyKTHDSAPCyP8e7UA0LN3OvAatNK_vQ3tnBsdbou4sA@mail.gmail.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_110315_866552_E6271D6E 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Matthew Wilcox <willy@infradead.org>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@kernel.org>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>, Greentime Hu <green.hu@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


> There are also some users on 10+ year old 32-bit netbooks or
> business laptops, both x86 and Apple G4.
> The longest-lived 32-bit embedded systems with large memory
> (other than Arm) are probably NXP QorIQ P20xx/P40xx used in
> military VME bus systems, and low-end embedded systems based
> on Vortex86.
> I'm less worried about all of these because upstream kernel
> support for ppc32 and x86-32 is already bitrotting and they will
> likely get stuck on the last working kernel before the
> TI/Renesas/NXP Arm systems do.
>

Upstream kernel support for ppc32 is bitrotting, seriously ? What do  
you mean exactly ?

ppc32 is actively supported, with recent addition of support of  
hugepages, kasan, uaccess protection, VMAP stack, etc ...

Christophe



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
