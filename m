Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8104C3DA42
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Jul 2024 17:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4UL2jY4i+Ceq57XaYHrfVaImn8j77gy+nUYXkyLoVc=; b=uSgLywt9FnjbEe
	f9W/0LjUm7XaXle2upcFmxqYT8S4ANgEu6pAaP421jc0KzNW+reyYKGmtWljsRcMawhxdzjO/4uty
	P6G/HFcJreEAf2uE3cyFYxiHllTAvG0THxuH8+f0/MemKSDaBnUp41JGvoNTUzxYXCaKywgojCB3n
	x0rfDthF35qPPzhe6UQumtq0BifJFXFLpQMC1S/JSUZnmMFLvUUL6fav34CqlqoCnYqyrKEbLedy7
	ycoBtJXroak8214mp9Lb1aCfkbCV7wmKpynJES//6SnW28Eq6a0ybx1BQJPBR/LR8cehgdRCrsKC9
	zVdM7rGBzx1w/gCmFXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT2wQ-00000004qSS-0Jw5;
	Sun, 14 Jul 2024 17:23:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT2w4-00000004qNb-0UBJ;
	Sun, 14 Jul 2024 17:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24F88CE0B74;
	Sun, 14 Jul 2024 17:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA132C4AF10;
	Sun, 14 Jul 2024 17:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720977772;
	bh=7xLPqy1jM0O+0195mcRA60FHmWtnGBVHJTGgtTxpOjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DtH4jm8jrs+quSvppTGg8i23OPhIie9pp3BkeKP1cAfAQHUOPyeFT5dvX05TObv6q
	 c67WVZ5QRmQYjx+EF0f9jlm9as0JqPcbtWqdwiTMTwbrK+vHkBxOzISH7Phi0MacXN
	 7oTke2cqQsldgBLMmdqxPyv7NaAldx5nPRIgHI/uCN0hWyKHUh/377uIkVJLEqWOp8
	 SxNNiJWViyC0Hdr8oPcNpAHS5/alBFDm06u4GuOl7f9/ay1MWVcYFI3qxlSuRSH+Vx
	 UglUDJeE6T/MLuUUryK4dhklX0CHsI+ZdjHN82KVo+qr9AM6BGUrtVpfZqDZHZ8/X6
	 w+EilVM3YC3WA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso452869366b.0;
        Sun, 14 Jul 2024 10:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJDvpSnhg0AbWSrxQMPfMzRbHsKqPrbCIHDNSqiZSeCMibpHC8dtiGEYWizIaZ6ecHOHGOTsY0uUYty0VCG9L1FYMJhPvV7lSiU/iqU5JO8omyINrf9DwYgeFQQJ8DLBia/p2mU5adAWFovFw/aMF11Heu2SuzQ8yrCc9WI2tYk1EJBqfluIGwISKwZ0PCBil6ftVhi+saljI=
X-Gm-Message-State: AOJu0Yyd5rvFI1FqDxlFM42UW6XsJnLg95N/Fqu/CG0jEsns3rFttZpE
	xlf0oIkMrLWqlyNt1vm1IhRqrYi06hsAaDaVRUwnC616xMGZ7ckwpOebo8OSiF96hZinieSm+IY
	DoSGlSAUKkpmaCEXUreWCw7WVUa8=
X-Google-Smtp-Source: AGHT+IEqlf4co9CQdw2WGl/Xqoo4fkGgeyLA8K1xIwoAlG8h/Wd4OdPV3wQEkk7NltbZTH51erICKgVwW7rB3xSuihg=
X-Received: by 2002:a17:906:39d6:b0:a72:9963:eb8e with SMTP id
 a640c23a62f3a-a780b6b307emr939527966b.28.1720977771290; Sun, 14 Jul 2024
 10:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-13-arnd@kernel.org>
 <9b269c2a-c6b5-4fa0-801b-e5e1c3ccb671@app.fastmail.com>
In-Reply-To: <9b269c2a-c6b5-4fa0-801b-e5e1c3ccb671@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 15 Jul 2024 01:22:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTDT=DyPs8NWe7gxvuNa0i_X9go2dgcBMGk9eqFdSwLTQ@mail.gmail.com>
Message-ID: <CAJF2gTTDT=DyPs8NWe7gxvuNa0i_X9go2dgcBMGk9eqFdSwLTQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] csky: convert to generic syscall table
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Christian Brauner <brauner@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_102256_536280_45A0AA39 
X-CRM114-Status: GOOD (  14.91  )
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

T24gV2VkLCBKdWwgMTAsIDIwMjQgYXQgNjoyN+KAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgNCwgMjAyNCwgYXQgMTY6MzYsIEFybmQgQmVy
Z21hbm4gd3JvdGU6Cj4gPiAtCj4gPiAtI2RlZmluZSBfX05SX3NldF90aHJlYWRfYXJlYSAoX19O
Ul9hcmNoX3NwZWNpZmljX3N5c2NhbGwgKyAwKQo+ID4gLV9fU1lTQ0FMTChfX05SX3NldF90aHJl
YWRfYXJlYSwgc3lzX3NldF90aHJlYWRfYXJlYSkKPiA+IC0jZGVmaW5lIF9fTlJfY2FjaGVmbHVz
aCAgICAgICAgICAgICAgKF9fTlJfYXJjaF9zcGVjaWZpY19zeXNjYWxsICsgMSkKPiA+IC1fX1NZ
U0NBTEwoX19OUl9jYWNoZWZsdXNoLCBzeXNfY2FjaGVmbHVzaCkKPiA+ICsjaW5jbHVkZSA8YXNt
L3VuaXN0ZF8zMi5oPgo+ID4gKyNkZWZpbmUgX19OUl9zeW5jX2ZpbGVfcmFuZ2UyIF9fTlJfc3lu
Y19maWxlX3JhbmdlCj4KPiBBIHNtYWxsIHVwZGF0ZTogSSBoYXZlIGZvbGRlZCB0aGlzIGZpeHVw
IGludG8gdGhpcyBwYXRjaAo+IGFuZCB0aGUgaGV4YWdvbiBvbmUsIHRvIGVuc3VyZSB3ZSBkb24n
dCBkZWZpbmUgYm90aAo+IF9fTlJfc3luY19maWxlX3JhbmdlMiBhbmQgX19OUl9zeW5jX2ZpbGVf
cmFuZ2UuIEkgYWxyZWFkeQo+IGhhdmUgcGF0Y2hlcyB0byBjbGVhbiB0aGlzIHVwIGZ1cnRoZXIg
dG8gYXZvaWQgYm90aCB0aGUKPiAjdW5kZWYgYW5kICNkZWZpbmUsIGJ1dCB0aGF0IGlzIHBhcnQg
b2YgYSBsYXJnZXIgcmV3b3JrCj4gdGhhdCBpcyBub3QgcmVhZHkgYmVmb3JlIHRoZSBtZXJnZSB3
aW5kb3cuCj4KPiAgICAgIEFybmQKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS91
YXBpL2FzbS91bmlzdGQuaCBiL2FyY2gvY3NreS9pbmNsdWRlL3VhcGkvYXNtL3VuaXN0ZC5oCj4g
aW5kZXggNzk0YWRiYzA0ZTQ4Li40NDg4MjE3OWE2ZTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9jc2t5
L2luY2x1ZGUvdWFwaS9hc20vdW5pc3RkLmgKPiArKysgYi9hcmNoL2Nza3kvaW5jbHVkZS91YXBp
L2FzbS91bmlzdGQuaAo+IEBAIC0xLDQgKzEsNiBAQAo+ICAvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLwo+Cj4gICNpbmNsdWRlIDxh
c20vdW5pc3RkXzMyLmg+Cj4gLSNkZWZpbmUgX19OUl9zeW5jX2ZpbGVfcmFuZ2UyIF9fTlJfc3lu
Y19maWxlX3JhbmdlCj4gKwo+ICsjZGVmaW5lIF9fTlJfc3luY19maWxlX3JhbmdlMiA4NAo+ICsj
dW5kZWYgX19OUl9zeW5jX2ZpbGVfcmFuZ2UKRm9yIGNza3kgcGFydDoKCkFja2VkLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvaGV4YWdvbi9pbmNs
dWRlL3VhcGkvYXNtL3VuaXN0ZC5oIGIvYXJjaC9oZXhhZ29uL2luY2x1ZGUvdWFwaS9hc20vdW5p
c3RkLmgKPiBpbmRleCA2ZjY3MDM0N2RkNjEuLmEzYjBjYWMyNTU4MCAxMDA2NDQKPiAtLS0gYS9h
cmNoL2hleGFnb24vaW5jbHVkZS91YXBpL2FzbS91bmlzdGQuaAo+ICsrKyBiL2FyY2gvaGV4YWdv
bi9pbmNsdWRlL3VhcGkvYXNtL3VuaXN0ZC5oCj4gQEAgLTI5LDQgKzI5LDUgQEAKPgo+ICAjaW5j
bHVkZSA8YXNtL3VuaXN0ZF8zMi5oPgo+Cj4gLSNkZWZpbmUgX19OUl9zeW5jX2ZpbGVfcmFuZ2Uy
IF9fTlJfc3luY19maWxlX3JhbmdlCj4gKyNkZWZpbmUgX19OUl9zeW5jX2ZpbGVfcmFuZ2UyIDg0
Cj4gKyN1bmRlZiBfX05SX3N5bmNfZmlsZV9yYW5nZQoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
