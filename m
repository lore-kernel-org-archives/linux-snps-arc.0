Return-Path: <SRS0=uiT2=7A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEE0C433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 16:11:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 025E020674
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 16:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NYuFKCHL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GET0otAd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 025E020674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJ74ZjR97dv6qTzgEiZvRE334Tz4lVrD7E05PW8hpeI=; b=NYuFKCHLSIr1Ob
	rKCXCzUZJgvZwp9jy85FMpXnNsqyuh0C8n/RRqx4f8yfCW+NPyNQdsfk9Qi+Dd0k/pT+2u41E7yDf
	Mfh8SAxkGlQKjkgGeJXKoCRwHX6p/az+A84JPIlvaphjZrUTJtZ/Twq5IPRlTGFLi8jesVox+7peM
	IVl4CBFaBIb2ou9nH0Vff1ZS9aqaVW2qgJ8TflC35jC9lcPhUfUqLhP6eL9myWp5GnBYTASe8/T0K
	QLvlazFVZlJy4klLqO7Y9+JMEshv8JgFgpp9SjpQNP4dAOGMdJPOe61P/1oY27ibDZoxZVrgnhd4x
	NwxQbr+VzBM9MkyiPSmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaiMk-0003Qx-8u; Mon, 18 May 2020 16:11:46 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaiMY-00037w-OA; Mon, 18 May 2020 16:11:36 +0000
Received: by mail-pl1-x641.google.com with SMTP id b12so4397736plz.13;
 Mon, 18 May 2020 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PZweTdyCTeKAMxoHO6mO1oUT3tSSWyHLqvLyIKGeBVY=;
 b=GET0otAdKNcL69ksN3IiyWVrfDMA5oTmg2ORXQXg1dxMLmeJHGcqKUPueDZ892Waqk
 LiahGzxVvAOb6eviKgbVMqpqH2xTB2Jmjekr265F2YTq8WGVTbTdHDJqMl0wXrOFGznR
 /ndT2roEGwCQ/iQPRVIOevzp+C4dHL7DUiGmL/Du2l5bOwMSnizD6OXLURl/+Bmh0CrV
 cSMqAO24vnPf3FXPRoGy9nntgG7zwj7eHXcOGf/gUHHXIQkUmuqSD2TACIHoLCzpICsI
 E//FSD44Fk7xhaRAKeOGCz7JAFGzEWqiq8lgebRBy1KrqTyGOmYukDswhUiC3e2tvmjo
 Hr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PZweTdyCTeKAMxoHO6mO1oUT3tSSWyHLqvLyIKGeBVY=;
 b=Rz8CpyNAa9anY4VikrZhNWgkHYYPna8cEeVcNsl5eZVrbetz05VXnhQOZHvXu/+D32
 Inj/xqp/oi0Apacbdj9sZfq2Z1JxM3/MHNpD2rlj1abf76NoKZHdMg8DvBnode44dSPY
 JIxPXVGNIhZLyhafcUQB7HrEQUNL2BgHh3BeoBUVhBakZNwY0H8GrHAXTtwOn9K96Bo4
 bI3uKKmB5kTsS7qz8j9s/hIp16r+Q+ce8ZN7WQcWFeaC0y+89dcIYeeu+CUk/103R1qQ
 AopT0D/kdUYRETbK5+AdDk48iKqgmzT1bckCaxhoyO3aN9OURFJeXZS1qG/aeGZnpusH
 sv4g==
X-Gm-Message-State: AOAM533RV80n8cGjwjj6w+bOeXmpc0hVW3QyZHLYOqCFAwo2zP29x8C7
 UWHX7+gF8cWKuyPhY7/DCbY=
X-Google-Smtp-Source: ABdhPJyiyoD11kFujK6YPCyAvn3cJt1s0JbqDvxe/z4TQ6/BdwXltCUrMAiNJwcIIoiI8qiWwb2Mbg==
X-Received: by 2002:a17:902:228:: with SMTP id
 37mr17432610plc.105.1589818294182; 
 Mon, 18 May 2020 09:11:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k3sm13299pjc.38.2020.05.18.09.11.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 May 2020 09:11:33 -0700 (PDT)
Date: Mon, 18 May 2020 09:11:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200518161132.GB66689@roeck-us.net>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
 <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_091134_784891_62D12A10 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, May 17, 2020 at 08:49:39PM -0700, Ira Weiny wrote:

[ ... ]

> > 
> > ---
> > # bad: [bdecf38f228bcca73b31ada98b5b7ba1215eb9c9] Add linux-next specific files for 20200515
> > # good: [2ef96a5bb12be62ef75b5828c0aab838ebb29cb8] Linux 5.7-rc5
> > git bisect start 'HEAD' 'v5.7-rc5'
> > # good: [3674d7aa7a8e61d993886c2fb7c896c5ef85e988] Merge remote-tracking branch 'crypto/master'
> > git bisect good 3674d7aa7a8e61d993886c2fb7c896c5ef85e988
> > # good: [87f6f21783522e6d62127cf33ae5e95f50874beb] Merge remote-tracking branch 'spi/for-next'
> > git bisect good 87f6f21783522e6d62127cf33ae5e95f50874beb
> > # good: [5c428e8277d5d97c85126387d4e00aa5adde4400] Merge remote-tracking branch 'staging/staging-next'
> > git bisect good 5c428e8277d5d97c85126387d4e00aa5adde4400
> > # good: [f68de67ed934e7bdef4799fd7777c86f33f14982] Merge remote-tracking branch 'hyperv/hyperv-next'
> > git bisect good f68de67ed934e7bdef4799fd7777c86f33f14982
> > # bad: [54acd2dc52b069da59639eea0d0c92726f32fb01] mm/memblock: fix a typo in comment "implict"->"implicit"
> > git bisect bad 54acd2dc52b069da59639eea0d0c92726f32fb01
> > # good: [784a17aa58a529b84f7cc50f351ed4acf3bd11f3] mm: remove the pgprot argument to __vmalloc
> > git bisect good 784a17aa58a529b84f7cc50f351ed4acf3bd11f3
> > # good: [6cd8137ff37e9a37aee2d2a8889c8beb8eab192f] khugepaged: replace the usage of system(3) in the test
> > git bisect good 6cd8137ff37e9a37aee2d2a8889c8beb8eab192f
> > # bad: [6987da379826ed01b8a1cf046b67cc8cc10117cc] sparc: remove unnecessary includes
> > git bisect bad 6987da379826ed01b8a1cf046b67cc8cc10117cc
> > # good: [bc17b545388f64c09e83e367898e28f60277c584] mm/hugetlb: define a generic fallback for is_hugepage_only_range()
> > git bisect good bc17b545388f64c09e83e367898e28f60277c584
> > # bad: [9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011] arch-kmap_atomic-consolidate-duplicate-code-checkpatch-fixes
> > git bisect bad 9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011
> > # good: [0941a38ff0790c1004270f952067a5918a4ba32d] arch/kmap: remove redundant arch specific kmaps
> > git bisect good 0941a38ff0790c1004270f952067a5918a4ba32d
> > # good: [56e635a64c2cbfa815c851af10e0f811e809977b] arch-kunmap-remove-duplicate-kunmap-implementations-fix
> > git bisect good 56e635a64c2cbfa815c851af10e0f811e809977b
> > # bad: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_atomic: consolidate duplicate code
> > git bisect bad 60f96b2233c790d4f1c49317643051f1670bcb29
> > # good: [7b3708dc3bf72a647243064fe7ddf9a76248ddfd] {x86,powerpc,microblaze}/kmap: move preempt disable
> > git bisect good 7b3708dc3bf72a647243064fe7ddf9a76248ddfd
> > # first bad commit: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_atomic: consolidate duplicate code
> 
> I'm confused by this.  This points to an earlier commit being bad?
> 

Yes, you are correct. I was looking up the wrong commit; it had a similar
subject line. Sorry for the confusion.

Guenter

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
