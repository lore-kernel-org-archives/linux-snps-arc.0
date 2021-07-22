Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9FBC63793
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 14:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D486128A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 14:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D486128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erNBfezAysVKl4Oy9tAuPTlZud5vpbZOc0qhhnbJBQ4=; b=PIvx4FglH8ibRX
	6Z+6Qe8wZx+AYuhpkvyU4lh5SXBcVb8/tMaiGzXLW1v+ARGTrit0k136eliCSddWWH2wdZGULyEUs
	8ZYWwqTIw4uLMFlmr8A5PPF2fI+d6MRLqpo/Id266Vm8sJ3IBGJy9VJntTGqTSaQYHeknbPxxeanO
	wt6g82PLFxNha8xAbEOksg6RKYZeSsjYCsGK5ciTIVqoRX0Uu3jaEHkKVBzhu1uHtCQPqhdS6BRvf
	47edB0QRgQDZrS+xAPvK1vrehOeq7ceaPooG5QHVRuYvsWpEtdQG2aEOWnFTc1Mts7fDE6UmEsjkI
	qjZs4R87lpkjjpf0Vz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ZHA-001pHl-0N; Thu, 22 Jul 2021 14:02:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ZH7-001pGq-Bd; Thu, 22 Jul 2021 14:02:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1386F6128C;
 Thu, 22 Jul 2021 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626962529;
 bh=RmFOlaV6cy8f6I9NP3ukwHIYeNH7OwEP2FaF3KMVtFM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ocXxA9Cd4jeclazdYZK/4QTa3g0pnRBJQliGL0HRiZcNkbVvLERCLbltdl3rE9kRq
 vPERENbXqHlZQIY3oAlzVO+diiIJJW19qXlBxtg3392hMudGeh3XX1NgXr/cxhGRUx
 DFt+O2hoLIOV9UxjZ7bdZ2wWDZPoAq3FCJSGgtCjHXXvJafnv5BcsEU0+guhwnHA4T
 Wi1bRtHHROOpGT+0S6jMdtSnHgDleqcGRND+vY3ZY3dqmxiHjLxalJ6Gv5o8YOq6bd
 JUkUZDldT1MSCfPFUDS20TUERsbY1uNMXHbxg3OfiFCZX1nNvPAUqSRzza8I/dmrxV
 3W7h7pVwlVphw==
Received: by mail-lf1-f52.google.com with SMTP id a12so8680664lfb.7;
 Thu, 22 Jul 2021 07:02:08 -0700 (PDT)
X-Gm-Message-State: AOAM532zU6bvB9n73DUlFZ+WjMITU1Gc+3pHQjrrYhKKO07ghZRhWZmq
 U5RcEKvqugGbcnnQwESA4oqUErhhEcqlWZ7iC8M=
X-Google-Smtp-Source: ABdhPJwKEmOULt07FXrSo8OqydMhW6AyGqw3Y4ZL7MXTHJEhxOwFXM5UwB4aLTKy+iIlhqkT2HtTedqadCpqLwCc8hw=
X-Received: by 2002:a5d:438c:: with SMTP id i12mr49853wrq.99.1626962516717;
 Thu, 22 Jul 2021 07:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124814.778059-1-arnd@kernel.org>
 <20210722124814.778059-10-arnd@kernel.org>
 <29adc1c164805e355b37d1d4668ebda9fb7fa872.camel@sipsolutions.net>
In-Reply-To: <29adc1c164805e355b37d1d4668ebda9fb7fa872.camel@sipsolutions.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 22 Jul 2021 16:01:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0xZAHknG8_kc62aaKrKdzD-QwQYHT61_wTbFDYADu-zw@mail.gmail.com>
Message-ID: <CAK8P3a0xZAHknG8_kc62aaKrKdzD-QwQYHT61_wTbFDYADu-zw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] asm-generic: reverse GENERIC_{STRNCPY_FROM,
 STRNLEN}_USER symbols
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Brian Cain <bcain@codeaurora.org>, 
 Chris Zankel <chris@zankel.net>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, 
 Helge Deller <deller@gmx.de>, Jeff Dike <jdike@addtoit.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>, 
 Michal Simek <monstr@monstr.eu>, Richard Weinberger <richard@nod.at>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, 
 Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-s390 <linux-s390@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_070209_461390_1452C609 
X-CRM114-Status: GOOD (  16.37  )
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

On Thu, Jul 22, 2021 at 3:57 PM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> >
> > The remaining architectures at the moment are: ia64, mips, parisc,
> > s390, um and xtensa. We should probably convert these as well, but
>
> I'm not sure it makes sense to convert um, the implementation uses
> strncpy(), and that should use the libc implementation, which is tuned
> for the actual hardware that the binary is running on, so performance
> wise that might be better.
>
> OTOH, maybe this is all in the noise given the huge syscall overhead in
> um, so maybe unifying it would make more sense.

Right, makes sense. I suppose if we end up converting mips and s390,
we should just do arch/um and the others as well for consistency, even
if that adds some overhead.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
