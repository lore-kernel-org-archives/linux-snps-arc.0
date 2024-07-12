Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202A1C3DA4A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 Jul 2024 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ko7aUpzFRxJN1KN1QB5S8ze3oLE8S4nO45LZSfuf800=; b=Z12xBV17fb8fQ5
	wAdUzxYkqrEh7tKMVuZctWO5iHsuTn7URx/JfU6F4hAq7UduL3Vwd7UmPsCTZudeBm/rAqVBWsk2j
	69UsJ1EdME+SOQJ8lCxzh/pH3JerK8Hnkydo/CfxCGrbfUK0aHGEcvkzMG9JYuD6mA7buCUwMbUES
	m4BRKl9WBpMIyeDmrt01U08dsyiLqvZTA+T1RZ3siG/o1yrhSvaJIZMPn46TSGJ/KsuhCX4uqdnu6
	Jom0yLjglg4nXZ0pR0sxlgD+ZUUL8NOGRtbplwg5gsCzVu6bL/PkIKfwOObcAuF50f7dtnKgn2NQy
	PB6nSI0E/aYAc00xicfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBtg-0000000GxHB-2Hgv;
	Fri, 12 Jul 2024 08:44:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBtM-0000000Gx9g-12dh;
	Fri, 12 Jul 2024 08:44:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CB6261E51;
	Fri, 12 Jul 2024 08:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5461C4AF0F;
	Fri, 12 Jul 2024 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720773874;
	bh=NumRR0RCvVDFyEdBAXLJ0YgPft63M41HMl+6GgZ3D5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kKCAbIB8qN7Dc7Gm9q8yfO3U1lRXZ94A6ezIWT372rl9gqoFI09JACMLH2DJSjByr
	 HUV2898bw5wBaITtT9ogSaUdEX2Nma+/RLZeKckw50+8INV8T4yFrA7aW4ZBoT5PpC
	 0e3g/uG6O/HLrqcw3HPw4hflcmpKnV1oRJZNb3NzXqqXlCqu+D6Xb1DRmrCHgQDASV
	 jWxjpE2Nk+xWopOcWD5x1363cvhVUJQGQFcRD54Dx1lmTaKbL3nCvTbe+VVdZ75eWe
	 x6ssi/VAymgszlewlURGKK9nzR4Wc0yhkQ9pCYBurV6GSQMda0qTpW/oBqXJU5Zo7b
	 E/Pss4DkqBSQQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eea7e2b073so21466241fa.0;
        Fri, 12 Jul 2024 01:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJtni4CqiLSbkwUQJOJik2YOl28LEPqROXK3F1J9PUv/APTSNM+kJfevhQ7YsH9PkiLuUwAorJ5M3lt2tgIBjaUlSpDmxNOKMg92U2kQ5xZ5eNNSuJzszgAGfZr4v1QpgiOZyb5DMjFfa8b9W+gcW6bfBLKkTd2hyHqyImF2xyBWUTqG1tPd2JXUVsbl+MBlUrJHggwi3/PSk=
X-Gm-Message-State: AOJu0YwQguEVxsr/M0XdgudBBJsKfm5zrXFEjgQNyAmnV0sumYwwogPD
	t+beysP/XJ1OIe5wPYJiUuDCvXx+Jr0I2ry4YI1COY2AQ2gi1WTvnagfWwl/ZwEvOnUztWDleBA
	c1gxBTMv1Y49CfdeaoTSblGBSwWc=
X-Google-Smtp-Source: AGHT+IHZKCf4H2Js0tpWEkxjRgvOVSTSmHh2++u39t+AXmtYzsuw+IcCP9SIl21t50d9MSfsFywqiN6yBQKVqEDvNIk=
X-Received: by 2002:a2e:8e8c:0:b0:2ee:8698:10ed with SMTP id
 38308e7fff4ca-2eeb3190d76mr66407281fa.49.1720773873600; Fri, 12 Jul 2024
 01:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-2-arnd@kernel.org>
In-Reply-To: <20240704143611.2979589-2-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 12 Jul 2024 17:43:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARpWB6Pqa80KDmpdJ_Rf5FZc71_bX9eSy3fFVCAyg8CAg@mail.gmail.com>
Message-ID: <CAK7LNARpWB6Pqa80KDmpdJ_Rf5FZc71_bX9eSy3fFVCAyg8CAg@mail.gmail.com>
Subject: Re: [PATCH 01/17] syscalls: add generic scripts/syscall.tbl
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Christian Brauner <brauner@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_014436_390855_2E45FDD1 
X-CRM114-Status: GOOD (  15.44  )
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

T24gVGh1LCBKdWwgNCwgMjAyNCBhdCAxMTozNuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4gVGhlIGFzbS1nZW5lcmljL3VuaXN0ZC5oIGhlYWRlciBzdGlsbCBmb2xsb3dzIHRoZSBvbGQg
c3R5bGUgb2YgZGVmaW5pbmcKPiBzeXN0ZW0gY2FsbCBudW1iZXJzIGFuZCB0aGUgdGFibGUuIE1v
c3QgYXJjaGl0ZWN0dXJlcyBnb3QgdGhlIG5ldwo+IHN5c2NhbGwudGJsIGZvcm1hdCBhcyBwYXJ0
IG9mIHRoZSB5MjAzOCBjb252ZXJzaW9uIGJhY2sgaW4gMjAxOCwgYnV0Cj4gdGhlIG5ld2VyIGFy
Y2hpdGVjdHVyZXMgdGhhdCBzaGFyZSBhIHNpbmdsZSB0YWJsZSBuZXZlciBkaWQuCj4KPiBJIGRp
ZCBhIHNlbWktYXV0b21hdGVkIGNvbnZlcnNpb24gb2YgdGhlIGFzbS1nZW5lcmljL3VuaXN0ZC5o
IGNvbnRlbnRzCj4gaW50byBhIHN5c2NhbGwudGJsIGZvcm1hdCwgdXNpbmcgdGhlIEFCSSBmaWVs
ZCB0byB0YWtlIGNhcmUgb2YgYWxsCj4gdGhlIHJlbGV2YW50IGRpZmZlcmVuY2VzIHRoYXQgYXJl
IGVuY29kZWQgdXNpbmcgI2lmZGVmIGNoZWNrcyBpbiB0aGUKPiBleGlzdGluZyBoZWFkZXIuCj4K
PiBDb252ZXJzaW9uIG9mIHRoZSBhcmNoaXRlY3R1cmVzIGlzIGRvbmUgb25lIGF0IGEgdGltZSBp
biBvcmRlciB0bwo+IGJlIGFibGUgdG8gcmV2aWV3IG9yIHJldmVydCB0aGVtIGFzIG5lZWRlZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCgoK
Cj4gKzY1ICAgICBjb21tb24gIHJlYWR2ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3lzX3Jl
YWR2ICAgICAgICAgICAgICAgICAgICAgICBzeXNfcmVhZHYKPiArNjYgICAgIGNvbW1vbiAgd3Jp
dGV2ICAgICAgICAgICAgICAgICAgICAgICAgICBzeXNfd3JpdGV2ICAgICAgICAgICAgICAgICAg
ICAgIHN5c193cml0ZXYKCgpOaXQuCgoKSSBrbm93IHRoaXMgaXMgYWxyZWFkeSB3cml0dGVuIGlu
IHRoaXMgd2F5CmluIGluY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy91bmlzdGQuaCwgYnV0CnRoZSBu
YXRpdmUgYW5kIGNvbXBhdCBoYXZlIHRoZSBzYW1lIGZ1bmN0aW9uIG5hbWUuCgoKQ2FuIHdlIHNp
bXBsaWZ5IGl0IGxpa2UgdGhpcz8KCjY1ICAgICBjb21tb24gIHJlYWR2ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3lzX3JlYWR2CjY2ICAgICBjb21tb24gIHdyaXRldiAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3lzX3dyaXRldgoKCgoKCgotLQpCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFt
YWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
