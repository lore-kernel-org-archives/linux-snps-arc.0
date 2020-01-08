Return-Path: <SRS0=NSlt=25=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0BFC282DD
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 21:00:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF832206DA
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 21:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZZxeW1kC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF832206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KlN1qFEZ2pl+xORtbIjQ2A1elmiES+trDx0wWvagrc=; b=ZZxeW1kCCyo40m
	K1bHU54QAotqh9Lw8gYQsdTUGgLXsuJRgZnvn7tENj9ZVO8Dwb04F9m6Y9RFuzW+f59gXCkByvV/y
	g2NrA+Mn21kBWd1qkk5sjeJo9mIuCsAbJeMc+ZgsXvaHiXUTWEFOxGE7BwqMyiuCYSWSlUMlpMkaP
	eRPNbpJsN5C2t8UkNn6aJjAw6X+tSx8rEjumCzXLNMg3idvr9NaRRHv9Hc7iGPb5hvqVgqIcJjNEs
	axuxQo8o0uVKaE6WuYBWiceLOF9Uo3RaMhic5m6S7CoUtIGH6gDg46NgoaIKvu3Mky3UtAdkkP1po
	uIxVoVQp40Bqdl9GeYvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipIRe-00069z-Vy; Wed, 08 Jan 2020 21:00:51 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipILI-0006fY-KJ
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jan 2020 20:54:20 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MRnXY-1jHJqJ0Eby-00THdV for <linux-snps-arc@lists.infradead.org>; Wed, 08
 Jan 2020 21:54:13 +0100
Received: by mail-vs1-f42.google.com with SMTP id x123so2804995vsc.2
 for <linux-snps-arc@lists.infradead.org>; Wed, 08 Jan 2020 12:54:12 -0800 (PST)
X-Gm-Message-State: APjAAAWYy8w96ccRveKgevTN+Xztqqbz6qWfhqe+PqaDBTw6u8Ie+Gvt
 zJWwLssCQ+Wc56nxVGXjJ6BNWXpTbM85qkyJe8A=
X-Google-Smtp-Source: APXvYqyt7qWPMbb6m9h/4PQhRs0y159Kx6Uivm6Z+B5Q5nxhhZUKK+jBierZEh41gZgxiLkvgkWmKuzOcUQAJHTJ9Lg=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr5946876qvg.197.1578516850954; 
 Wed, 08 Jan 2020 12:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20200108200528.4614-1-krzk@kernel.org>
 <20200108200528.4614-2-krzk@kernel.org>
In-Reply-To: <20200108200528.4614-2-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 21:53:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] iomap: Constify ioreadX() iomem argument (as in
 generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:nOxgr7BAPXfsMS/UQK0TWZmOa5ysPo8nMXtyKT2F2A6cixS+w93
 tizY4r97w1Rj+oxhR3Y8v4OCXnEXl2+SEwBydvQaAz5GWKCPbx+o0m7iKcQTKjlD9xhaaKV
 G8rR3lXOweS1fOScO9DcO30S0luvp2U+j9HLNJWK/GC9j4ovN+puO+S6cb/wGfjt1DJIxXE
 bF0uQqW9vSvGrNSQnES0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MHzhm3qNAas=:ezVd/k1h8D73IfDmXg2RcU
 w0sx3UcIYzXYOsiSs5l3qYYxbMfr2Fc3bFRf5CCVlylPfJXm3iBy9QiPUvMyGHCNh4AItMDqf
 FPaNPwUtLkajGt0D7u5qZ0aLp02p+jS4xObneg/X6N8RnBTdETaCENfTpwOwEokFNuKTXFywC
 N9uXAPJqi9/ZcNkTsS9f1AJcNcg3UOS0Ms7Gynd97Z8e7+W0QI516/xcitJ9N5fHU7+y5JgWP
 A2bIyYOwZLd9RkKZy/ADQqM9VfeEycg8xBmDULtnuVQSwBpRgtinRmoH4QCYfx+iq3TFw+I2X
 vrYZoRnh9LgD+b1ATxBgIYYhKmADNIQRSVg9c7S9+WQazdFqqj8TByHE0mHY28UT2ge3yh5FQ
 4LoNFsCdCKSI0QILOVit5IVvLbCAZ3WntUWOcmC5vu0VnHAzGoThdJDXuAFMe/eq7BjSgvsMx
 Mev1cqj79x0m+G4vSin/LCCSnVM3BtAXq/JPDfE3xSfn6kvfB0D031Fn0e32/3KXn2nE5xQEu
 auoLaham8mqzqNIVBSSDlvIJ7CcUzMWsBY4CD6RFnQhMeQcrDPa8RLY4Uj8bg0xiqG1iGhcDI
 T/u3D14i2xe7TLYpCPYfJw9Ugk1Fok4j4XibraMjCirmk+k6ERq3GftEbxJp4TRNJMToP51mZ
 0EfMuyGLX9L53WbcAl35nUYr8QsfvI1vZppYB0MFidICEO4v1ZhqWe0LYI2VLY8ZVleEUT6+e
 3KYsLKQ8LPiqYrwoiKWZKjXQvOXAJGv/fVr0llbYkSSeg97M2q0W+yEAa1ojOy0oUQ4HAcXNy
 yFH5wpLT1OrCoqDBFcueJQYZrrLf/DhtFTedV+H8KtBfvBs7TH9NCFjXbWjWBzNijnrtsN0bO
 siB/4wUf3eCkA7KnaIpQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125417_011510_36F93C3E 
X-CRM114-Status: GOOD (  12.22  )
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
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jan 8, 2020 at 9:05 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
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

Thanks for getting this done!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> Changes since v1:
> 1. Constify also ioreadX_rep() and mmio_insX(),
> 2. Squash lib+alpha+powerpc+parisc+sh into one patch for bisectability,

The alpha and parisc versions should be independent, I was thinking
you leave them as separate patches, but this work for me too.

I have no real opinion on the other 8 patches, I would have left
them out completely, but they don't hurt either.

         Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
