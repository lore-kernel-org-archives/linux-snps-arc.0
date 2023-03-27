Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92E4C76195
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NptA98pmb5J6npBhTY9ECvgfW8iPxmf0GaTwteUnGYM=; b=FjGXt14ajaS27N
	DHUpjhlglnVzmN3UQlfcNS/RYYprqO78ZPb5oNq6iEYNlaCauE9CPwZJBcYLkD04sY7iaVGzqmZ67
	92zaCM+lUo69Iw0jsHqI1m+cirxw41BmsJ/1b1y7m/z8xldosRn7iyX24VTHsD2NwbDCiFJyZnc2a
	+S18vKk6jLWagdG5ACMpJrcH1JQDxl/XsrXD1ViywwYSpByLtsaWT8ykPCI1WGQ9kNwFhaLx58Zce
	j2t160dEN3qFBb4odk+jbSDwF7EI03BZRgFi3ghjfzJOlYEUHpDaGSHz2Cktl0P+yD9qfmXc8lPHl
	kcNDFTfvb8x3VpBivJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgn2u-00B9JR-33;
	Mon, 27 Mar 2023 13:38:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgn2r-00B9IM-1J;
	Mon, 27 Mar 2023 13:37:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86F8C61290;
	Mon, 27 Mar 2023 13:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB6DC4339C;
	Mon, 27 Mar 2023 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679924276;
	bh=sKw5GnPYWTx1tEo+IYG63yzmzH5uUSkHi5W70RXeiXE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Or5bYP6asvBi3DIpTvEDxCFWIn2Cdch8Z5XdxQI6zEoEgJRZqrecdpv7paLYKT9CC
	 ykTFqWwusdSTCL1jiwj6kNclHXsXGO9Z8Pgkx7W7viSa5CpCaPtlyRvpzazCaoEuAl
	 ON63aoYpCrVIWtjBx0qMwiWtOPd+kCdAaYbmijioiOFv8Xk/z7uUP1W0Z3J67+Uczj
	 eiWgDOj8fZ+i/pe8lRkJZPQBpygL51cztm9uvH3QS8WYX5TkpZllEvJLjYFEuEB3rP
	 MooCMJzwn6fbb9SnJ9RBXy+iRWjhvjn2PfTrafIOUz6E5Yp51QeINLA4MxBUmdB567
	 RtP9F30M7zWeA==
Received: by mail-lf1-f47.google.com with SMTP id q16so11475564lfe.10;
        Mon, 27 Mar 2023 06:37:55 -0700 (PDT)
X-Gm-Message-State: AAQBX9f7UyXp5cYQuNXPWtC2ZVeNgppfw/+3p63Qj3A5cH8IRqbtpgqO
	nbBScUr3QlQjD41MDgy7BMxPswdNSPjQvMy9zsk=
X-Google-Smtp-Source: AKy350aPL1uQ3r2MblLdeWPWx+R7rA3ZaUJTGPp0hWqhXUlS0wDj97jvk8gg6F5BBuMMpzVJHH5p6CMaiE85EcR30Es=
X-Received: by 2002:a17:906:4746:b0:8ab:b606:9728 with SMTP id
 j6-20020a170906474600b008abb6069728mr5893837ejs.5.1679924253534; Mon, 27 Mar
 2023 06:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-11-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-11-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 Mar 2023 21:37:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT73KBZ01N2fr8z6=9XWFKo4D7cGKOtZLZeXN9NrscCXg@mail.gmail.com>
Message-ID: <CAJF2gTT73KBZ01N2fr8z6=9XWFKo4D7cGKOtZLZeXN9NrscCXg@mail.gmail.com>
Subject: Re: [PATCH 10/21] csky: dma-mapping: skip invalidating before DMA
 from device
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>, 
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
X-CRM114-CacheID: sfid-20230327_063757_520341_67D91784 
X-CRM114-Status: GOOD (  20.79  )
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

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgODoxNeKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4gY3NreSBpcyB0aGUgb25seSBhcmNoaXRlY3R1cmUgdGhhdCBkb2VzIGEgZnVsbCBmbHVzaCBm
b3IgdGhlCj4gZG1hX3N5bmNfKl9mb3JfZGV2aWNlKC4uLiwgRE1BX0ZST01fREVWSUNFKSBvcGVy
YXRpb24uIFRoZSByZXF1aXJlbWVudAo+IGlzIG9ubHkgbWFrZSBzdXJlIHRoZXJlIGFyZSBubyBk
aXJ0eSBjYWNoZSBsaW5lcyBmb3IgdGhlIGJ1ZmZlciwKPiB3aGljaCBjYW4gYmUgZWl0aGVyIGRv
bmUgdGhyb3VnaCBhbiBpbnZhbGlkYXRlIG9wZXJhdGlvbiAoYXMgb24gbW9zdAo+IGFyY2hpdGVj
dHVyZXMgaW5jbHVkaW5nIGFybTMyLCBtaXBzIGFuZCBhcmMpLCBvciBhIHdyaXRlYmFjayAoYXMg
b24KPiBhcm02NCBhbmQgcmlzY3YpLiBUaGUgY2FjaGUgYWxzbyBoYXMgdG8gYmUgaW52YWxpZGF0
ZWQgZXZlbnR1YWxseSBidXQKPiBjc2t5IGFscmVhZHkgZG9lcyB0aGF0IGFmdGVyIHRoZSB0cmFu
c2Zlci4KPgo+IFVzZSBhICdjbGVhbicgb3BlcmF0aW9uIGhlcmUgZm9yIGNvbnNpc3RlbmN5IHdp
dGggYXJtNjQgYW5kIHJpc2N2Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KPiAtLS0KPiAgYXJjaC9jc2t5L21tL2RtYS1tYXBwaW5nLmMgfCA0ICstLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvY3NreS9tbS9kbWEtbWFwcGluZy5jIGIvYXJjaC9jc2t5L21tL2RtYS1t
YXBwaW5nLmMKPiBpbmRleCA4MjQ0NzAyOWZlYjQuLmM5MGY5MTJlMjgyMiAxMDA2NDQKPiAtLS0g
YS9hcmNoL2Nza3kvbW0vZG1hLW1hcHBpbmcuYwo+ICsrKyBiL2FyY2gvY3NreS9tbS9kbWEtbWFw
cGluZy5jCj4gQEAgLTYwLDExICs2MCw5IEBAIHZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNl
KHBoeXNfYWRkcl90IHBhZGRyLCBzaXplX3Qgc2l6ZSwKPiAgewo+ICAgICAgICAgc3dpdGNoIChk
aXIpIHsKPiAgICAgICAgIGNhc2UgRE1BX1RPX0RFVklDRToKPiAtICAgICAgICAgICAgICAgY2Fj
aGVfb3AocGFkZHIsIHNpemUsIGRtYV93Yl9yYW5nZSk7Cj4gLSAgICAgICAgICAgICAgIGJyZWFr
Owo+ICAgICAgICAgY2FzZSBETUFfRlJPTV9ERVZJQ0U6Cj4gICAgICAgICBjYXNlIERNQV9CSURJ
UkVDVElPTkFMOgo+IC0gICAgICAgICAgICAgICBjYWNoZV9vcChwYWRkciwgc2l6ZSwgZG1hX3di
aW52X3JhbmdlKTsKPiArICAgICAgICAgICAgICAgY2FjaGVfb3AocGFkZHIsIHNpemUsIGRtYV93
Yl9yYW5nZSk7ClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCgo+ICAg
ICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAg
IEJVRygpOwo+IC0tCj4gMi4zOS4yCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFy
YyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
