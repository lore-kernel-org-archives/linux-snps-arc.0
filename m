Return-Path: <SRS0=zy2i=M4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5409DC4338F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 18:41:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB4A60230
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 18:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AB4A60230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOnEeVKAcmmv2oXmNXDJkqGfv/y5rVmUZAVCSi4afJY=; b=YzYrKyWAA+BtLy
	NyvNMF86QATqMk09MTwN8/eRcz0WZpngwz3tJfavz8ZRiwnchOIjkJFHynhAuvAJSnIasYoKH2qXy
	OSZxy/BJRuNIoew06BYouuvax/UFnZXSEkeLg0VW9zt78kJkpRdx9bUhAAW1fiZGDFh1wLnIOfvX4
	G8ylZqnGHExRe94m6P4myqBSNLkEI9e2foZLivmUD52428hiOxC++5QpDv2C2AtaFWvNubXHHkLGN
	WAGZSD55lJGePEsYLmbsOGlG58Jp0N3cemEjZxTLUQ9mgG0eAhEpEPrSCHAkISWzsvCWsP4tgtM+g
	he3nQQruxSjUZVqGEbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBiJA-00AXqe-Kz; Thu, 05 Aug 2021 18:41:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBiJ6-00AXpP-4e; Thu, 05 Aug 2021 18:41:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0F0C60F01;
 Thu,  5 Aug 2021 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628188887;
 bh=DJstyoIneDhJWe2M45tnolj4HGCE0gCrRv38Ul0FPvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yLSS87676hn106VIngpXBP/rOEU9YnrWCbO+LvhheiKjxKARCwKmpPaCV3EXfwCgP
 eswsJEhyB34IGotQMI4++5xN+H6/H2Zsa8YN4zRquACi04W3hFcBWcF1DF3HWEIxIo
 hfvqM78wNk4u3fnnSgFl6tYnBJF7uBTAQJcXiptc=
Date: Thu, 5 Aug 2021 20:41:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 John Crispin <john@phrozen.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Sebastian Reichel <sre@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 1/3] arch: Export machine_restart() instances so they can
 be called from modules
Message-ID: <YQww08x2whx/LIIT@kroah.com>
References: <20210805075032.723037-1-lee.jones@linaro.org>
 <20210805075032.723037-2-lee.jones@linaro.org>
 <20210805173625.GH6719@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805173625.GH6719@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_114128_243547_1BA1520D 
X-CRM114-Status: GOOD (  12.74  )
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

On Thu, Aug 05, 2021 at 06:36:25PM +0100, Catalin Marinas wrote:
> On Thu, Aug 05, 2021 at 08:50:30AM +0100, Lee Jones wrote:
> > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > index b4bb67f17a2ca..cf89ce91d7145 100644
> > --- a/arch/arm64/kernel/process.c
> > +++ b/arch/arm64/kernel/process.c
> > @@ -212,6 +212,7 @@ void machine_restart(char *cmd)
> >  	printk("Reboot failed -- System halted\n");
> >  	while (1);
> >  }
> > +EXPORT_SYMBOL(machine_restart);
> 
> Should we make this EXPORT_SYMBOL_GPL? I suppose it's not for general
> use by out of tree drivers and it matches the other pm_power_off symbol
> we export in this file.

Yes please.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
