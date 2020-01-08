Return-Path: <SRS0=NSlt=25=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CB8C00523
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 08:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F67C206DA
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 08:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qIqmTleJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F67C206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmNbrDybQH/TayL/gZi5OhAHVvtf4Grw8wOTKtohyN8=; b=qIqmTleJ63Odpy
	QR2CZxEHiT8IM4ctllNA4KYSSlGRqnAtPkaAClY98EasYKSw0+1O/zwXzQfk6lxZnkEgOlBuZ75qH
	13LXcqrj/Em2fkzCq6ksEXRynw9ivHK9fagwknF3Ymg4moOYlDO6/vGQcr4BIR14/0xaVHR2AAOd0
	OWEWXyL2kIwkPk0wMRjgY+5AlWrLcffACZKgI42HKJRIgfY0aw7o8NJcLKeEqSzDVYyK1tVTUH2jt
	W+DN91vNqY4oaqRe7Hfwc+VEYvD/c2mwXT+c5LMpciDYDuqCcjiMWijYCM5DtbU8VSaoiIK+zNmA+
	tORebYox7IOzPe5AqlYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip6Nt-0006TV-Fq; Wed, 08 Jan 2020 08:08:09 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip6Nr-0006SF-5S
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jan 2020 08:08:08 +0000
Received: by mail-oi1-f194.google.com with SMTP id d62so1863815oia.11
 for <linux-snps-arc@lists.infradead.org>; Wed, 08 Jan 2020 00:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X9lAK3bszh6tWp/dVwz4gJZ7NIZBKvl8mgEWhJz1N9U=;
 b=SF9DFe8xn88pRlLJ07hIzeNlv1fSY7da6jIwZQIKvGSVgKbhaZeBO//qdA0bm+j5Ks
 18B91ktpjmrNLDCQI+JibU5ADIVvazssVe1W0QCz8EPEDKT7tn5CQF1UKPuO2dKIC3jZ
 sMr+RK4ca585mH+uHIFUsyz94ZLl4AwSDSApGcNT2QMb5gVbKU7PYMrBFiNPZLZ2LXSV
 dXj6af/zsxdlfoVJsycQMEqGRFr6+7UQ8PdxrjH3/qQXfnNx7QtWZKVVGgyBbjrWtoyP
 ldCt8o33Io2CgUKfrFc7iylSu2byOBTr+C9jWZZio0sL9gv/kGkCyzl0qfb/Y6sAIhRV
 XBDw==
X-Gm-Message-State: APjAAAUeFmqCRIO5C+6obeuNZYt3OtNhhGH0F5vtN0RydgTA/nVdRv8O
 PjIdcanU7pqX2IoCCb2ochYR3/86MV11sr09yug=
X-Google-Smtp-Source: APXvYqyHxa8fgIJDObTLOZ73RoRUdvNM74muiuZsOkTaJvwYlT+0s8R5nYIen4AoxoDKsD4fs/oquvfeWacJQ1YKaqA=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1987025oia.148.1578470885935; 
 Wed, 08 Jan 2020 00:08:05 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-1-git-send-email-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:07:54 +0100
Message-ID: <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_000807_209622_FFC8CDB4 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The ioread8/16/32() and others have inconsistent interface among the
> architectures: some taking address as const, some not.
>
> It seems there is nothing really stopping all of them to take
> pointer to const.

Shouldn't all of them take const volatile __iomem pointers?
It seems the "volatile" is missing from all but the implementations in
include/asm-generic/io.h.

> Patchset was really tested on all affected architectures.
> Build testing is in progress - I hope auto-builders will point any issues.
>
>
> Todo
> ====
> Convert also string versions (ioread16_rep() etc) if this aproach looks OK.
>
>
> Merging
> =======
> The first 5 patches - iomap, alpha, sh, parisc and powerpc - should probably go
> via one tree, or even squashed into one.

Yes, they should be squashed, cfr. Arnd's comment.
I also wouldn't bother doing the updates in patches 6-10.

The rest looks good to me.
Thanks a lot!

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
