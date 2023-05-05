Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE01C77B7D
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 May 2023 05:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4aAjlS9wtHknjlaySm5VQbJeqIh6X2Ktu+0+dmBd6Y=; b=RvdlHpy5r3aiPk
	JRrpLhWIf3vgBK+0UXx/5EWTJVz+QO+zOJSY9GQZOQ1ebu+O5QUgaPSL6PB4G7ueJOH2zfrzItwEs
	ARXgml1DEIrMKNvzyO+ceAeFtGxahZfOmZipGiMVfKTpXB1DWJ4+4q/VPTQRvQtGcseKi2dQXB3IA
	42hMDi9cgGfHgUiw422JxM3nlV4JxCFUvHHl3gZ7xb6BLQ21Pkzo9KgLh94aYA9iiGp6udi4SRmII
	uSUYujAg/pvtrAJPF8IcwAYGGXLegjMVMl+Orh3fskhJGx0dKtbYguGubW6d7XTAWXWehJ+DT5J0k
	7K5f03KpQ4GZLPJLBDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puoIF-009kyF-13;
	Fri, 05 May 2023 05:47:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puoIA-009kxX-14;
	Fri, 05 May 2023 05:47:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0389F63B2E;
	Fri,  5 May 2023 05:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C046C433A0;
	Fri,  5 May 2023 05:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683265657;
	bh=TmEJ43a9wRyU79Q4Z9WHv4VZR6aLeCdSzDRMZZtHgkE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z26bR3GD7NZekm8D2fY3Likq3Z+WzMYLxGNnfeJCb+QwNkNe2TrCsNu2VFfZjShat
	 waIgr8ZT+ardQLvN1NlwZYzH5cZxJYxowJsqGOWno8Rl9LGCyRjXrN4kUrT0wSjKA3
	 va31vYv4BfxRUWA0U1ACB0SZxiczkJ6ChjLmeQmgK6um5tf4OdsSdlBmir+dXjr7Ib
	 eodQwnLUWN7khfewboLikhJjzXtjqnFi+oOdZSrfft8Feutqpt4nrnNIFe7eshzIjL
	 2R7E0+HCH9g3/5K1V+VPwNnTCBGdmrwdimg1OJKzf3tZSMKqnn1Z4uKwCieN6lGWZq
	 wQHAZd8sjvaLg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ac7707e34fso15704351fa.1;
        Thu, 04 May 2023 22:47:37 -0700 (PDT)
X-Gm-Message-State: AC+VfDyEW3AO+trWBOm8pcnKV4I5fAw5vDskGXot9mpFezVQPM7cOJTw
	cnMgQ0NgrN3FSOBamLpbA0na2hXkyE5jFa8Juhc=
X-Google-Smtp-Source: ACHHUZ7vjZvoO17O2+xGcjw8YRQwo0MSgi9BtdhaWD+v+3nmuTyY0RrEyW2wbSK+lqJd6C9lcTXOXjjLYHG3jJse7RE=
X-Received: by 2002:a17:907:1c07:b0:960:ddba:e5c7 with SMTP id
 nc7-20020a1709071c0700b00960ddbae5c7mr139047ejc.40.1683265634680; Thu, 04 May
 2023 22:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-10-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-10-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 5 May 2023 13:47:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
Message-ID: <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before
 bidirectional DMA
To: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Brian Cain <bcain@quicinc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
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
X-CRM114-CacheID: sfid-20230504_224742_477266_A4BFA581 
X-CRM114-Status: GOOD (  23.45  )
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
Cj4gRm9yIGEgRE1BX0JJRElSRUNUSU9OQUwgdHJhbnNmZXIsIHRoZSBjYWNoZXMgaGF2ZSB0byBi
ZSBjbGVhbmVkCj4gZmlyc3QgdG8gbGV0IHRoZSBkZXZpY2Ugc2VlIGRhdGEgd3JpdHRlbiBieSB0
aGUgQ1BVLCBhbmQgaW52YWxpZGF0ZWQKPiBhZnRlciB0aGUgdHJhbnNmZXIgdG8gbGV0IHRoZSBD
UFUgc2VlIGRhdGEgd3JpdHRlbiBieSB0aGUgZGV2aWNlLgo+Cj4gcmlzY3YgYWxzbyBpbnZhbGlk
YXRlcyB0aGUgY2FjaGVzIGJlZm9yZSB0aGUgdHJhbnNmZXIsIHdoaWNoIGRvZXMKPiBub3QgYXBw
ZWFyIHRvIHNlcnZlIGFueSBwdXJwb3NlLgpZZXMsIHdlIGNhbid0IGd1YXJhbnRlZSB0aGUgQ1BV
IHByZS1sb2FkIGNhY2hlIGxpbmVzIHJhbmRvbWx5IGR1cmluZwpkbWEgd29ya2luZy4KCkJ1dCBJ
J3ZlIHR3byBwdXJwb3NlcyB0byBrZWVwIGludmFsaWRhdGVzIGJlZm9yZSBkbWEgdHJhbnNmZXI6
CiAtIFdlIGNsZWFybHkgdGVsbCB0aGUgQ1BVIHRoZXNlIGNhY2hlIGxpbmVzIGFyZSBpbnZhbGlk
LiBUaGUgY2FjaGluZwphbGdvcml0aG0gd291bGQgdXNlIHRoZXNlIGludmFsaWQgc2xvdHMgZmly
c3QgaW5zdGVhZCBvZiByZXBsYWNpbmcKdmFsaWQgb25lcy4KIC0gSW52YWxpZGF0aW5nIGlzIHZl
cnkgY2hlYXAuIEFjdHVhbGx5LCBmbHVzaCBhbmQgY2xlYW4gaGF2ZSB0aGUgc2FtZQpwZXJmb3Jt
YW5jZSBpbiBvdXIgbWFjaGluZS4KClNvLCBob3cgYWJvdXQ6CgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYyBiL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50
LmMKaW5kZXggZDkxOWVmYWI2ZWJhLi4yYzUyZmJjMTUwNjQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKKysrIGIvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJl
bnQuYwpAQCAtMjIsOCArMjIsNiBAQCB2b2lkIGFyY2hfc3luY19kbWFfZm9yX2RldmljZShwaHlz
X2FkZHJfdCBwYWRkciwgc2l6ZV90IHNpemUsCiAgICAgICAgICAgICAgICBBTFRfQ01PX09QKGNs
ZWFuLCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKICAgICAgICAgICAgICAg
IGJyZWFrOwogICAgICAgIGNhc2UgRE1BX0ZST01fREVWSUNFOgotICAgICAgICAgICAgICAgQUxU
X0NNT19PUChjbGVhbiwgdmFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Ci0gICAg
ICAgICAgICAgICBicmVhazsKICAgICAgICBjYXNlIERNQV9CSURJUkVDVElPTkFMOgogICAgICAg
ICAgICAgICAgQUxUX0NNT19PUChmbHVzaCwgdmFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tf
c2l6ZSk7CiAgICAgICAgICAgICAgICBicmVhazsKQEAgLTQyLDcgKzQwLDcgQEAgdm9pZCBhcmNo
X3N5bmNfZG1hX2Zvcl9jcHUocGh5c19hZGRyX3QgcGFkZHIsIHNpemVfdCBzaXplLAogICAgICAg
ICAgICAgICAgYnJlYWs7CiAgICAgICAgY2FzZSBETUFfRlJPTV9ERVZJQ0U6CiAgICAgICAgY2Fz
ZSBETUFfQklESVJFQ1RJT05BTDoKICAgICAgICAgICAgICAgIC8qIEknbSBub3Qgc3VyZSBhbGwg
ZHJpdmVycyBoYXZlIGd1YXJhbnRlZWQgY2FjaGVsaW5lCmFsaWdubWVudC4gSWYgbm90LCB0aGlz
IGludmFsIHdvdWxkIGNhdXNlIHByb2JsZW1zICovCi0gICAgICAgICAgICAgICBBTFRfQ01PX09Q
KGZsdXNoLCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKKyAgICAgICAgICAg
ICAgIEFMVF9DTU9fT1AoaW52YWwsIHZhZGRyLCBzaXplLCByaXNjdl9jYm9tX2Jsb2NrX3NpemUp
OwogICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgZGVmYXVsdDoKICAgICAgICAgICAgICAg
IGJyZWFrOwoKPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMgYi9hcmNoL3Jpc2N2L21tL2RtYS1ub25j
b2hlcmVudC5jCj4gaW5kZXggNjQwZjRjNDk2ZDI2Li42OWM4MGIyMTU1YTEgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0v
ZG1hLW5vbmNvaGVyZW50LmMKPiBAQCAtMjUsNyArMjUsNyBAQCB2b2lkIGFyY2hfc3luY19kbWFf
Zm9yX2RldmljZShwaHlzX2FkZHJfdCBwYWRkciwgc2l6ZV90IHNpemUsCj4gICAgICAgICAgICAg
ICAgIEFMVF9DTU9fT1AoY2xlYW4sIHZhZGRyLCBzaXplLCByaXNjdl9jYm9tX2Jsb2NrX3NpemUp
Owo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRE1BX0JJRElSRUNUSU9O
QUw6Cj4gLSAgICAgICAgICAgICAgIEFMVF9DTU9fT1AoZmx1c2gsIHZhZGRyLCBzaXplLCByaXNj
dl9jYm9tX2Jsb2NrX3NpemUpOwo+ICsgICAgICAgICAgICAgICBBTFRfQ01PX09QKGNsZWFuLCB2
YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPiAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAtLQo+IDIu
MzkuMgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
