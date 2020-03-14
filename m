Return-Path: <SRS0=0pgM=47=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFA6C1975A
	for <linux-snps-arc@archiver.kernel.org>; Sat, 14 Mar 2020 11:03:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2775D2076D
	for <linux-snps-arc@archiver.kernel.org>; Sat, 14 Mar 2020 11:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h2dmZgzI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2775D2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwourEPRF+Vf3H92FUhtnKX9zr9/QOxm6yOJ8J0xBgw=; b=h2dmZgzIpaWmuK
	7hf8VZZog8gWwYylkd90cl8Az3BbqWKWTjiNiYi7mQmf6bqGhHaEEXqO0eEJ3zTfFTY3cLzgYQCAn
	DSoPzGab01gpkeAoKxN9PZYzZ3NEibYI8c34Zsg6xtejG2Pt7vO7k12YnLxI6gYTd14/ThNTjaICm
	jTchbfAvwSZpaemZvsPeS/qUw6QaIsK5I3wWewYT9T8iwchUkEFqpVdsBufZhdZxNdOYOJoxpqZ9y
	4nh694KmW2iJGO2Kg13u+Hyj72tOY5OQ9CdIfbuVAcsWFKlCObQknNV57TpOT6VwRcQ7bqlJlRgBV
	kgpRuF6DljSccUQ5WHOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jD4ZO-0001vD-TZ; Sat, 14 Mar 2020 11:03:06 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jD4ZM-0001ul-UC
 for linux-snps-arc@lists.infradead.org; Sat, 14 Mar 2020 11:03:06 +0000
Received: by mail-ed1-f67.google.com with SMTP id ca19so15259891edb.13
 for <linux-snps-arc@lists.infradead.org>; Sat, 14 Mar 2020 04:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HXvNDpxcelYwn8PoDas8bnx/K7bC0ycG2928PB68YGs=;
 b=qUkWjTG0ZjcTRK6UIg7+zNEsU3X+w69p0vm3JGueLWhq5bREtsOZPRKKFCAwki53i0
 Lslu22u7J3+Q7q8DXbI1ywC44rFKpbrkC5zztlq0Km9W2+QZwpBGmXLXpy8Fg9CFeyb1
 +HPSIXqNUjs2k9vvVJHfbn4w8I3nm4YHoRk+L+z8UMBcf1yeKRukkxE441gBYGcye7Cc
 Vw/AkQDW4vVSnXgftHZOGQobFOTgUXXT3aJ+VXD7cHSG3HZsBWnJRUEB5NT/Bdl1J2Ew
 89zvr3wwgJCPpRbXroR9cocdBgOANvdG7oY7viObEV9R8ik1eupNNR7cpqoZLyCFUDnb
 bm4Q==
X-Gm-Message-State: ANhLgQ1pg17vcn0j07cwnMbvCmzIDQK2EqOHBtkF740hqGAPl0Wu19wY
 T0HLa71TlUoU1mH6C075YUY=
X-Google-Smtp-Source: ADFU+vv8nT7z/vEu1bvfu6+AMeellIORI/K4LaHKfZcEsgQyhBKLzYnFTNlP0g88C9JmPdb6eGvarg==
X-Received: by 2002:a17:907:429c:: with SMTP id
 ny20mr14725961ejb.278.1584183783358; 
 Sat, 14 Mar 2020 04:03:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id 94sm2657013eda.7.2020.03.14.04.03.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Mar 2020 04:03:02 -0700 (PDT)
Date: Sat, 14 Mar 2020 12:02:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RESEND PATCH v2 1/9] iomap: Constify ioreadX() iomem argument
 (as in generic implementation)
Message-ID: <20200314110258.GA16135@kozik-lap>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219175007.13627-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200314_040304_975250_7DF65B3F 
X-CRM114-Status: GOOD (  14.11  )
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, linux-alpha@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Feb 19, 2020 at 06:49:59PM +0100, Krzysztof Kozlowski wrote:
> The ioreadX() and ioreadX_rep() helpers have inconsistent interface.  On
> some architectures void *__iomem address argument is a pointer to const,
> on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

This patch touches multipel file systems so no one is brave enough to
pick it up. However you are mentioned as maintainer of generic asm
headers so maybe you could apply it to arm-soc?

Best regards,
Krzysztof


> 
> ---
> 
> Changes since v1:
> 1. Constify also ioreadX_rep() and mmio_insX(),
> 2. Squash lib+alpha+powerpc+parisc+sh into one patch for bisectability,
> 3. Add Geert's review.
> 4. Add Arnd's review.
> ---
>  arch/alpha/include/asm/core_apecs.h   |  6 +--
>  arch/alpha/include/asm/core_cia.h     |  6 +--
>  arch/alpha/include/asm/core_lca.h     |  6 +--
>  arch/alpha/include/asm/core_marvel.h  |  4 +-
>  arch/alpha/include/asm/core_mcpcia.h  |  6 +--
>  arch/alpha/include/asm/core_t2.h      |  2 +-
>  arch/alpha/include/asm/io.h           | 12 ++---
>  arch/alpha/include/asm/io_trivial.h   | 16 +++---
>  arch/alpha/include/asm/jensen.h       |  2 +-
>  arch/alpha/include/asm/machvec.h      |  6 +--
>  arch/alpha/kernel/core_marvel.c       |  2 +-
>  arch/alpha/kernel/io.c                | 12 ++---
>  arch/parisc/include/asm/io.h          |  4 +-
>  arch/parisc/lib/iomap.c               | 72 +++++++++++++--------------
>  arch/powerpc/kernel/iomap.c           | 28 +++++------
>  arch/sh/kernel/iomap.c                | 22 ++++----
>  include/asm-generic/iomap.h           | 28 +++++------
>  include/linux/io-64-nonatomic-hi-lo.h |  4 +-
>  include/linux/io-64-nonatomic-lo-hi.h |  4 +-
>  lib/iomap.c                           | 30 +++++------
>  20 files changed, 136 insertions(+), 136 deletions(-)
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
