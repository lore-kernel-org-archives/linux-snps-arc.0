Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11FDC433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 07:42:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23940611C2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 07:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23940611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2tsZhnluvIUls3/lEf/8TyVpHWU25f6JSaWNo42Tg2A=; b=pxjlWtdRw+cGnY7KwsmqXgglu
	XOcSocPz3jqGTr9giHDDEw/rf6y9XVtc/mQwDCSnVDG7z2bWtZCJDF5xpR6xsKZBv3ADjDywKxH4x
	rp94mn1+kjDFi0LD1EmM813i4Pmnbt60rT6Pqmc4IZbnpQ3FEwdUuJnJJMTbLVax77HAwpLJlV7gs
	XOoChn3GIWtolpwRqCsNdKIFt1Xpl9P14Px4ZFWjt9tVnpKnxmxC995JLfuW0h/X3uDeuq2wcEKa+
	AsTek6zlVAPyYGW9wuOit4fHzsTl51IWCVlCwFk3xorqccF/KTe/rzJRmYdT3gBxmaH1Y2H0ROgLW
	IrEPxZXrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liXtg-00E4fi-CA; Mon, 17 May 2021 07:42:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXtK-00E4aa-0u; Mon, 17 May 2021 07:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UQCnCHnuTGOUv4Xn5a0Aiay+N+Nu4F56YkpDcV2EHAE=; b=EJGq1YKT1ryvHlRuG56kFiEBgh
 poJb/r1aLXYw5/ah32bsmhlt8igwEji55yqeKXv3+7q+mPYCG3O1rnE2+en5Mqeu9HixVPdhfjqsK
 Kt3S8CzKfG7JZlOg1d2asaRHh29X28vghmowR/ZcIXC1qeiAF3cSuTBV7lDpfK7tcxYBStAWOwNpH
 CW57zC4LRKWF728+HK052+FAi/BKxa5WGV4R7MVx4YUWs0nKpXsG80StpWF3Y7nfKLvG2i8pIioEz
 O7nYEVjQKXVSlkpfIuhwzqnRL/NBesb2mxezU9IqppS6BcXKixZN6Z0JVsOXa5uUTHbcpET3pEdMn
 sSD1nUQw==;
Received: from mail-vs1-f54.google.com ([209.85.217.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXtH-00DYPP-Fp; Mon, 17 May 2021 07:42:16 +0000
Received: by mail-vs1-f54.google.com with SMTP id t6so2621004vsp.13;
 Mon, 17 May 2021 00:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UQCnCHnuTGOUv4Xn5a0Aiay+N+Nu4F56YkpDcV2EHAE=;
 b=pvVz7Kv2HnPgVUcj5R+XBcd26Mvb3GPj7H9Pb9+vEwjFvUZQkapbGxz+z73x0Z+MHw
 sHQwChT25aldOZ8K6oo92PiE0EOVbzjUWSRBbJzTIMLo6YmsGR6ChzI9u3k8epyK7PA6
 M2CK7iAOD6jVpjUc4umpBPchd+S3KK8+Y8rBcJqLmhWFy56F4NCddFNkLwvNv96AepAG
 5NnIK7Eu1a596MzOVabQny+av18biFXN21dPWQGbQF8euOmcoad2uuz+zIwnOQaV45y+
 vR/JiUlAOEHZGNmwN2/zGgcO53TMOfd6kVHTn/R4xXeftMuQRxU5JK1NzbZmA+BFl/WH
 b5uQ==
X-Gm-Message-State: AOAM530iy8RbVrvet4U9UW4rW6xSEssNtlNb6uLVpojEr418JDys7Vur
 dReCO5aHIUOWznfq9ZH266fbavvUur5p3A6KCuc=
X-Google-Smtp-Source: ABdhPJw1uawrtdGC5r811ckzuqrHCuKa2aLYEPaEyXVqSRjYUArXfwswdvyXpadVLtTHBByRvBxAhX2BvK3dzp74coo=
X-Received: by 2002:a67:f84f:: with SMTP id b15mr9140633vsp.40.1621237334116; 
 Mon, 17 May 2021 00:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210514220942.879805-1-arnd@kernel.org>
 <20210514220942.879805-2-arnd@kernel.org>
In-Reply-To: <20210514220942.879805-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 May 2021 09:42:02 +0200
Message-ID: <CAMuHMdXr6gxbJu+otHV=PhoXvM7aoshs_A-SVpTmYw1iDdiqsg@mail.gmail.com>
Subject: Re: [PATCH 1/5] asm-generic/uaccess.h: remove
 __strncpy_from_user/__strnlen_user
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Vineet Gupta <vgupta@synopsys.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Brian Cain <bcain@codeaurora.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Sid Manning <sidneym@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_004215_545105_761F9C16 
X-CRM114-Status: GOOD (  23.64  )
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

On Sat, May 15, 2021 at 12:10 AM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This is a preparation for changing over architectures to the
> generic implementation one at a time. As there are no callers
> of either __strncpy_from_user() or __strnlen_user(), fold these
> into the strncpy_from_user() strnlen_user() functions to make

... and ...

> each implementation independent of the others.
>
> Many of these implementations have known bugs, but the intention
> here is to not change behavior at all and stay compatible with
> those bugs for the moment.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

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
