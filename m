Return-Path: <SRS0=Frhj=K4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC89C4708F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 14:03:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A6D613BA
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 14:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A6D613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5SebQQr3Nw4/Q6u20cq5bB7lxOrKmfrS8lrfrjImYM=; b=qQ0jrLWfDYI8vG
	vHsSXx0lecDRpj8d5zzIS2oESu3xOfZoZmW7yDZoOePeoNlMad+YtUP9Z8/QOTAszOvTKRbpcJ0Fy
	ldupz+3KT3unfQxvwQ90cN3wzj+ZotzcF6LFVgwxttXHAbuJcNeZbX6si3WiQK/J4tbWR66CnOj3K
	KYJXjTOmcBl/IPqoI6sq8Zv9nbVA+9dMNDAMUUn5QKIb0h7ULIYVDQyVgox7mcqYhPI+5Nk0k1V1x
	JyfWX1pf54OTK3UYRYt62G0upvBJhenYgVS22vCkuJ1GyDGBqDC7yeXDCgDaluTX+DPG/rWlLAiX2
	WbHNaoABbV1y7CpdDl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loRT1-004RLB-3s; Wed, 02 Jun 2021 14:03:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loRSl-004RIb-Ff; Wed, 02 Jun 2021 14:03:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CE12613B8;
 Wed,  2 Jun 2021 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622642595;
 bh=rVTIekozkKZiHFO8KV73KQ3u8bmmogfis0wnY/V9zMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j8vmJNJ02mTS2qujW9AuK34CyGewsKEQa3NJI4x54mI/kZ6TFkXgNShYSldLi9wwR
 iVZIZpo10XmlpdD1gKCLSxI2hAconHrCrMCgpriX/VTH8VoFXTo8owedKrPE/jIZ0c
 D0z4cOoqJMINruzqON7gaCTnozO9ZlPYtavKjKyFVVT2dZ+EtfNVi3gYHbuLNepcSX
 +gq/yzfSnUELMMLNTwhQ6DbA0qs/Rfv2LkuAbudO4aFFo53imu8k7hO2V3DMiMK48/
 BPzuDC2hRRaPw3diNLbn7YRlcBUV1pB+YMb1s77Dpt31JAkWDkRc6hv1mITOzdI2oz
 pUQhhp2WADSpA==
Date: Wed, 2 Jun 2021 17:03:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 alpha <linux-alpha@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 sparclinux <sparclinux@vger.kernel.org>
Subject: Re: [PATCH 4/9] m68k: remove support for DISCONTIGMEM
Message-ID: <YLePlSaXR0XvtZki@kernel.org>
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-5-rppt@kernel.org>
 <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_070315_576596_9B221AC1 
X-CRM114-Status: GOOD (  26.48  )
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

On Wed, Jun 02, 2021 at 01:25:24PM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Wed, Jun 2, 2021 at 12:54 PM Mike Rapoport <rppt@kernel.org> wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> > in v5.11.
> >
> > Remove the support for DISCONTIGMEM entirely.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> > --- a/arch/m68k/include/asm/page_mm.h
> > +++ b/arch/m68k/include/asm/page_mm.h
> > @@ -126,25 +126,7 @@ static inline void *__va(unsigned long x)
> >
> >  extern int m68k_virt_to_node_shift;
> >
> > -#ifndef CONFIG_DISCONTIGMEM
> >  #define __virt_to_node(addr)   (&pg_data_map[0])
> 
> With pg_data_map[] removed, this definition can go as well.
> Seems to be a leftover from 1008a11590b966b4 ("m68k: switch to MEMBLOCK
>  + NO_BOOTMEM")
> 
> There are a few more:
> arch/m68k/include/asm/mmzone.h:extern pg_data_t pg_data_map[];
> arch/m68k/include/asm/mmzone.h:#define NODE_DATA(nid)
> (&pg_data_map[nid])

It seems that arch/m68k/include/asm/mmzone.h can be simply removed.
 
> > -#else
> > -extern struct pglist_data *pg_data_table[];
> > -
> > -static inline __attribute_const__ int __virt_to_node_shift(void)
> > -{
> > -       int shift;
> > -
> > -       asm (
> > -               "1:     moveq   #0,%0\n"
> > -               m68k_fixup(%c1, 1b)
> > -               : "=d" (shift)
> > -               : "i" (m68k_fixup_vnode_shift));
> > -       return shift;
> > -}
> > -
> > -#define __virt_to_node(addr)   (pg_data_table[(unsigned long)(addr) >> __virt_to_node_shift()])
> > -#endif
> 
> > --- a/arch/m68k/mm/init.c
> > +++ b/arch/m68k/mm/init.c
> > @@ -44,28 +44,8 @@ EXPORT_SYMBOL(empty_zero_page);
> >
> >  int m68k_virt_to_node_shift;
> >
> > -#ifdef CONFIG_DISCONTIGMEM
> > -pg_data_t pg_data_map[MAX_NUMNODES];
> > -EXPORT_SYMBOL(pg_data_map);
> > -
> > -pg_data_t *pg_data_table[65];
> > -EXPORT_SYMBOL(pg_data_table);
> > -#endif
> > -
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
