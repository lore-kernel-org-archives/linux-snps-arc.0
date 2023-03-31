Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0154C76196
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Mar 2023 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHC96HXk4WJvBOyDelXCOevS5JRsRPauyt+oxS3HqsA=; b=fTVmgYl0kuv9oy
	yf9z3KzAfD4dg9kQtkRHLOffn07rnErqagoXqy0h7eBcuLK6eBsRxEUz75hdP6ogT8elJZL8mUbTa
	AkxEZy5xB/2uuxfWa8jYA285omjJmn3MJMxMiquMjTioiZxAskugQPpH0xCL0zcTAS9PYLqiz1C6R
	ao7+KsTo7/uCq+JJoAdCrH64nZhdaq4ECbDMtL9cafOkX9CsHT0JCFtvFfxnqIJz8JiG4j+GlSvkW
	/x+eRfvYkzj5OWmm6Y3AaIYdgwMl2P4JfXctyCulgIcqgLWBiQIhVwU7zk4Y6JNQ9aMfjqWJbj5f3
	als6xWXm4lZ6b6JKo/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAea-006ZNt-1p;
	Fri, 31 Mar 2023 09:02:36 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAe6-006Yxl-0m
	for linux-snps-arc@lists.infradead.org;
	Fri, 31 Mar 2023 09:02:18 +0000
Received: by mail-yb1-xb33.google.com with SMTP id cf7so26642020ybb.5
        for <linux-snps-arc@lists.infradead.org>; Fri, 31 Mar 2023 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680253322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWm2jI2yHpPi79Yy1CI28Qxt6CEyohh41n1LA0fGLDM=;
        b=ma9CGEidowfFcQ/RWwH9jcS3JpkuGTgIsGbkrjxNbpyIzTV0VWElAtIXD1pJ7GvLWW
         o7VY5XN4Af8jnZZ9O6VFKig0/95cqzaeDCJiUPwYZQl8VR+1dmIghX/+s6g86bp9ODnN
         MAzwUVCiMu/TmuzqPKTEsI7qk7BcH62AgPt5/bQM0gksa4J2iBNXg4d+1aT8ueqsMtsu
         j/o9cEOqf4x14P3d54vkcr4sulvwLKD3DWlzGUaFgwLRmbPD3v1X3PVwEGdEFSAXSvdX
         cX0K9wRov1LZHYLnnywTrm7QrejvefZ111ofD9/89zCLVipeznKpthRrdFZIrBFoD4rz
         Cj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680253322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWm2jI2yHpPi79Yy1CI28Qxt6CEyohh41n1LA0fGLDM=;
        b=AN7+BTvKyBte0wZXHvS4tjzDB4ImhBdFp8ug9fxAQ/6P5dSCiqOnLtQ7B9nLhCfMag
         u8nkgvqW0uaWfHMbGfwykQ5lZhp60DOJUoqpq8cFp5Qj+tNUv1NwbfHj5dcTtXrJ7iZu
         0LMZNiMyitpC3oF20cKj7lxsIbGLKnccLK0AbMyatpSGKQ0tO8ie/W9i/2dzyoLSypZ/
         FLr1hYRlNsI+/ax/tp8yTfrrZnRc+sgZN6deq+yO77xWHRswVCvKCnZxXedK3MXCvkLP
         xRN5Cu/DDkVecRpm/XK88EGKwi3XiXu2wgGnImbrxiqGhjwlAqfGfNaAzWVmZRvHB21t
         xbzQ==
X-Gm-Message-State: AAQBX9f3mWlkMAYJh7yO082qgBMMzm5SvG/egClCzQABeTlIdyZtujFW
	ZTVj8PcyrKC6NUZOsR8br6OIJqYPlx4/IYbIrYdkjA==
X-Google-Smtp-Source: AKy350YI8e95DFYP40XLqEj+u/39+STuziGTnuEb3AUKVWMQr59PuRxxs6tiZPNOPKYnKLtLdYTZJpdc8TKai7hc3Ak=
X-Received: by 2002:a05:6902:1006:b0:b78:4b00:775f with SMTP id
 w6-20020a056902100600b00b784b00775fmr12714571ybt.4.1680253322494; Fri, 31 Mar
 2023 02:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-16-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-16-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 11:01:51 +0200
Message-ID: <CACRpkdbMry_UUYN1MuXTUpRXV+Tj9RSDvN-iBdvR8hDfkTaX4w@mail.gmail.com>
Subject: Re: [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches
 before DMA
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_020206_926103_0D03E0F2 
X-CRM114-Status: GOOD (  12.72  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgMjoxNuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4K
PiBNb3N0IEFSTSBDUFVzIGNhbiBoYXZlIHdyaXRlLWJhY2sgY2FjaGVzIGFuZCB0aGF0IHJlcXVp
cmUKPiBjYWNoZSBtYW5hZ2VtZW50IHRvIGJlIGRvbmUgaW4gdGhlIGRtYV9zeW5jXypfZm9yX2Rl
dmljZSgpCj4gb3BlcmF0aW9uLiBUaGlzIGlzIHR5cGljYWxseSBkb25lIGluIGJvdGggd3JpdGVi
YWNrIGFuZAo+IHdyaXRldGhyb3VnaCBtb2RlLgo+Cj4gVGhlIGNhY2hlLXY0LlMgKGFybTcyMC83
NDAvN3RkbWkvOXRkbWkpIGFuZCBjYWNoZS12NHd0LlMKPiAoYXJtOTIwdCwgYXJtOTQwdCkgaW1w
bGVtZW50YXRpb25zIGFyZSB0aGUgZXhjZXB0aW9uIGhlcmUsCj4gYW5kIG9ubHkgZG8gdGhlIGNh
Y2hlIG1hbmFnZW1lbnQgYWZ0ZXIgdGhlIERNQSBpcyBjb21wbGV0ZSwKPiBpbiB0aGUgZG1hX3N5
bmNfKl9mb3JfY3B1KCkgb3BlcmF0aW9uLgo+Cj4gQ2hhbmdlIHRoaXMgZm9yIGNvbnNpc3RlbmN5
IHdpdGggdGhlIG90aGVyIHBsYXRmb3Jtcy4gVGhpcwo+IHNob3VsZCBoYXZlIG5vIHVzZXIgdmlz
aWJsZSBlZmZlY3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgoKTG9va3MgZ29vZCB0byBtZS4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
