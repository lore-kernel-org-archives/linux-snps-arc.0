Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6EDC6FD18
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Mar 2023 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7TGKyFH9+FNdkWTlm22fJR1zWWF0Tu8yOqaPDQRs2k=; b=griiq2CvrJjtf5
	OrDGAddZxz83etU6mYuWuZhD0UMKyAKSS+ukU75V3hEm6g0zpx7ooJMxp5A69SqGP6VuxNaVezkJd
	b+NpexAaDFMLcFXp27PLcLa/icMUwQFs61XEc51RNvxY/vb82n079sQDgMc9kake1RhwMO/ArLkGk
	Stqy5aKX3ApL7i91cFZjDSolmdXDabBho4iFgvRijDZgGF+bTn2BFz+BAntS2Q+jx6lsNANKNhBCs
	1+V1WF0gERdi4Dmfd5YKvBjwyrvuoTccwU4TApB53r1a5RX2jY1aO66Dm5afLBwZmetyAIpZwahYq
	61dZV2fAsffkqnAVn50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAmn-006cIC-15;
	Fri, 31 Mar 2023 09:11:05 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAmi-006cFH-35
	for linux-snps-arc@lists.infradead.org;
	Fri, 31 Mar 2023 09:11:03 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-544f7c176easo403563267b3.9
        for <linux-snps-arc@lists.infradead.org>; Fri, 31 Mar 2023 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680253857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5CSdrZ6l2xgXTKH1xLlq+jBgcd46ofV0BIoXJ6/6jM=;
        b=yNTwpqcBqTe7p7kdqk4ozYJpop7pQP3FHNCgI+kAAyVvDESChw6s3rsNqhE2Ku+IBw
         zyHTqvcSaoTOvNEYheaYl5cGuY9TzMKe3tj59/rSPpx2xH5od2jt2Z1ho/yvuTKZ8YyQ
         AlhIW53cqdWMlToLJLiUqGEiV6E5HffyJLoSC0XJo9GHtuAIs7Zw8acuTSzbk/SWwKtp
         ZOkggBBmQW8aWkeyloApilNcrQqBiiUYduOjJaNR0YF+9KvmSZZ1peFgOQMWzUK3lxyT
         h4vs+0lgeuM0FzggBzIA4KHzPqOm2Q8V7QicVtbUfS2UcAMcX6CzbsXAQHu6N/nQHEym
         WouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680253857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5CSdrZ6l2xgXTKH1xLlq+jBgcd46ofV0BIoXJ6/6jM=;
        b=TaUwbWddcNV/Xw8Miub0mvOjTYIp2+/n3fc0MYwk5+64+/iELYu6m5BCy5fmTGiXpO
         sAo2wHv4eiSr1CIw7LE1VmNNEAxDFH/qiTKulhaSndtYnTmUZ0DMEO+SP7zfAqwRNTV2
         u3odg7HX6q88CILuIDg2n8fTBUcBUNDNQAz02OXyKKq+LepeXJxRXBV67O1qw7+Ef3G4
         shiysxV9vFZJeR8quUihkOJG3yHdQ7wpV3nS34qAYk6v5r+1WRFDvuARu2mSQjv2/J40
         UiLSECV6DPAHpkPNBM9z5xL2BzJCbdxhJqw/Q+W2wj1PbHQeteqKA/QYAXu+3ko6/Jb9
         hrvA==
X-Gm-Message-State: AAQBX9dRe3x6EV67X2h7BZVPfYjjyPdnCstoCq/mlrH7PNYAStYW4oKC
	4nMXZZTBeE9Wt+86BnQJ1LyG5tXrj4UT5oKGGQdEJg==
X-Google-Smtp-Source: AKy350bTzBXM6ycL3U98ZDogsouHVf6LJB3iu5qAKOjHJ8TlZEoTyW1DjaakW8G4QqD9ZcHPHI8e6e7vqfXcHXD2Pfk=
X-Received: by 2002:a81:b388:0:b0:545:8202:bbcf with SMTP id
 r130-20020a81b388000000b005458202bbcfmr12463339ywh.9.1680253856716; Fri, 31
 Mar 2023 02:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-18-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-18-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 11:10:44 +0200
Message-ID: <CACRpkdZdnTX4-jnnXZveXxwOg76yH4Zyoa-ZSGeC7KzOnn+6Lg@mail.gmail.com>
Subject: Re: [PATCH 17/21] ARM: dma-mapping: use arch_sync_dma_for_{device,cpu}()
 internally
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
X-CRM114-CacheID: sfid-20230331_021101_017191_8180E32F 
X-CRM114-Status: GOOD (  14.16  )
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
PiBUaGUgYXJtIHNwZWNpZmljIGlvbW11IGNvZGUgaW4gZG1hLW1hcHBpbmcuYyB1c2VzIHRoZSBw
YWdlK29mZnNldCBiYXNlZAo+IF9fZG1hX3BhZ2VfY3B1X3RvX2RldigpL19fZG1hX3BhZ2VfZGV2
X3RvX2NwdSgpIGhlbHBlcnMgaW4gcGxhY2Ugb2YgdGhlCj4gcGh5c19hZGRyX3QgYmFzZWQgYXJj
aF9zeW5jX2RtYV9mb3JfZGV2aWNlKCkvYXJjaF9zeW5jX2RtYV9mb3JfY3B1KCkKPiB3cmFwcGVy
cyBhcm91bmQgdGhlLgoKQnJva2VuIHNlbnRlbmNlPwoKPiBJbiBvcmRlciB0byBiZSBhYmxlIHRv
IG1vdmUgdGhlIGxhdHRlciBwYXJ0IHNldCBvZiBmdW5jdGlvbnMgaW50bwo+IGNvbW1vbiBjb2Rl
LCBjaGFuZ2UgdGhlIGlvbW11IGltcGxlbWVudGF0aW9uIHRvIHVzZSB0aGVtIGRpcmVjdGx5Cj4g
YW5kIHJlbW92ZSB0aGUgaW50ZXJuYWwgb25lcyBhcyBhIHNlcGFyYXRlIGludGVyZmFjZS4KPgo+
IEFzIHBhZ2Urb2Zmc2V0IGFuZCBwaHlzX2FkZHJlc3MgYXJlIGVxdWl2YWxlbnQsIGJ1dCBhcmUg
dXNlZCBpbgo+IGRpZmZlcmVudCBwYXJ0cyBvZiB0aGUgY29kZSBoZXJlLCB0aGlzIGFsbG93cyBy
ZW1vdmluZyBzb21lIG9mCj4gdGhlIGNvbnZlcnNpb24gYnV0IGFkZHMgdGhlbSBlbHNld2hlcmUu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKTG9va3Mg
Z29vZCB0byBtZSwgdG9vayBtZSBzb21lIHRpbWUgdG8gdmVyaWZ5IGFuZCB1bmRlcnN0YW5kCnRo
ZSBvcGVuLWNvZGVkIHZlcnNpb24gb2YgUEZOX1VQKCkgYW5kIHRoaXMgcmVmYWN0b3JpbmcgYWxv
bmUKbWFrZXMgdGhlIHBhdGNoIGhpZ2hseSB2YWx1YWJsZS4KUmV2aWV3ZWQtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBz
LWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
