Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03280C3DA4B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Jul 2024 01:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kHZ8yQkszuqzJbsUZ+OJIpb2c5lsdEbpDMemy/+4k4=; b=vk8oURJEn5irTL
	yLGbkBZ7dFozJDV12b5v4Dk7b+sHwDRXcdUHUBsn1CDqNv6l0VSRj8hFDA+HJZ/dZDe53JkJTiNha
	uyv4M4tkN3xFvgbudPHejZG+CX/ZJBMdA6pWk4JSEW4hQe7zZL3Ze2iVSoABm68w8C2G8GEBjx2Dg
	N/tGyjphvOKB85WWUXd6rpMXJETvrSeOWW11m0BjZ//MhQzggLtI1K+xVNphtC+ARqxR1TwFkcReE
	wGyRTRx6KbwCLFrV3/Hqj+gDFR19iA+xTWTmpbeTS88ZAlsZpQOtxtXnfCalRbqtiSUScC46RN7oW
	FO8v6BbRJWycwYzVgn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTWhm-00000008v1p-0TpY;
	Tue, 16 Jul 2024 01:10:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTWhQ-00000008uwR-37TY;
	Tue, 16 Jul 2024 01:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1366461309;
	Tue, 16 Jul 2024 01:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC6FC4AF19;
	Tue, 16 Jul 2024 01:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721092187;
	bh=Q0kp7iabKKyIX54Klme9KRFmTX+5d+5P/TaWauXzIwc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YDKbea2R/X8ZseMQnJYt+g//6ufnvaUN8WaJKGpZkLLr59LKaNkqqcDIAKuBa9CVn
	 9Hnt5E7vFHUK9sROLKFToAvyArGzV+2ATHvs6bSatBBECjexqNsSeEQgiWZw7bqRlH
	 Go42rFhMjQJoI98x1+cvYVuSae0aXf3k5BJB4TYaheAiKGCgrC/KYdQi/y9THthZtw
	 BE6AR7AXTuvy1d7qWsL/+vVvNpXVGvt4HbNCap35Ho4qi/pQSo09ASSaWcLlWM2O7P
	 x/GDqopQHObMCu8aLoAzYnELDw/v12v0ik916jhD2nptTrVWbe+KKn9W4RDR9EE91w
	 wgARonuZPBNIA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea79e6979so5504583e87.2;
        Mon, 15 Jul 2024 18:09:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXv/K4EO9eqZYQY1/xi0CMdxwcNY33MJoAZKJGBCfAzTeWWp7id3IsdRSTHSTz5Aa1vCC234miYXwRv0M/IQX6RFtFfVIPmbQp4xnUmDLXILbu4x2Z+ylus/ybIuZpHkb/B3s9d8K5olesA+JPswv6nt8ElsgxfQ9l4uC1jCRLH3ne5z2JFFdBr5JmS2rIcbPlO9vCmvW3ntmg=
X-Gm-Message-State: AOJu0Ywk3HQBTTRxusRyhw/mzo4sMhfhKqhA1Zf+aUevu0VIpVS9ooQw
	qwxWSCZauXMx7eecFFr9M8xcHB5S8amASpgzd0kETIUJ1A6cRAz0F5qfR5jV74AaM5TCUvRP/hU
	g1KBIGjlQulXyGzXUZqxvXqPSrz0=
X-Google-Smtp-Source: AGHT+IHWiEkBygbqwCGlDokgR7Nb1VQa68dIBoq67wVmj13obpWvn2q8U35d1Igma4IeakMMYKXavF2qtV7ei5Itrxo=
X-Received: by 2002:a05:6512:3b06:b0:52c:952a:67da with SMTP id
 2adb3069b0e04-52edf0329c1mr316791e87.55.1721092185161; Mon, 15 Jul 2024
 18:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-3-arnd@kernel.org>
 <CAK7LNATLVY1xtSMVMro-KMQVPgVHoiRKGX33ajCg8ZU0-EZS2w@mail.gmail.com>
In-Reply-To: <CAK7LNATLVY1xtSMVMro-KMQVPgVHoiRKGX33ajCg8ZU0-EZS2w@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 16 Jul 2024 09:09:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQuu3SBKR-Q7+njKqbXZsRgWHjfDBYgBGMbERpuqWKjew@mail.gmail.com>
Message-ID: <CAJF2gTQuu3SBKR-Q7+njKqbXZsRgWHjfDBYgBGMbERpuqWKjew@mail.gmail.com>
Subject: Re: [PATCH 02/17] csky: drop asm/gpio.h wrapper
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
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
X-CRM114-CacheID: sfid-20240715_180948_934873_AA96DC75 
X-CRM114-Status: GOOD (  16.19  )
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

T24gVGh1LCBKdWwgMTEsIDIwMjQgYXQgMTE6NDnigK9QTSBNYXNhaGlybyBZYW1hZGEgPG1hc2Fo
aXJveUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDQsIDIwMjQgYXQgMTE6Mzbi
gK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPgo+ID4gVGhlIGFzbS9ncGlvLmggaGVh
ZGVyIGlzIGdvbmUgbm93IHRoYXQgYWxsIGFyY2hpdGVjdHVyZXMganVzdCB1c2UKPiA+IGdwaW9s
aWIsIGFuZCBzbyB0aGUgcmVkaXJlY3QgaXMgbm8gbG9uZ2VyIHZhbGlkLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CkFja2VkLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KCj4gPiAtLS0KPgo+Cj4gUmV2aWV3ZWQtYnk6IE1hc2FoaXJv
IFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4KPgo+ID4gIGFyY2gvY3NreS9pbmNsdWRl
L2FzbS9LYnVpbGQgfCAxIC0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vS2J1aWxkIGIvYXJjaC9jc2t5
L2luY2x1ZGUvYXNtL0tidWlsZAo+ID4gaW5kZXggMTExN2MyOGNiN2U4Li4xM2ViYzVlMzQzNjAg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vS2J1aWxkCj4gPiArKysgYi9h
cmNoL2Nza3kvaW5jbHVkZS9hc20vS2J1aWxkCj4gPiBAQCAtMSw3ICsxLDYgQEAKPiA+ICAjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiAgZ2VuZXJpYy15ICs9IGFzbS1vZmZz
ZXRzLmgKPiA+ICBnZW5lcmljLXkgKz0gZXh0YWJsZS5oCj4gPiAtZ2VuZXJpYy15ICs9IGdwaW8u
aAo+ID4gIGdlbmVyaWMteSArPSBrdm1fcGFyYS5oCj4gPiAgZ2VuZXJpYy15ICs9IG1jc19zcGlu
bG9jay5oCj4gPiAgZ2VuZXJpYy15ICs9IHFyd2xvY2suaAo+ID4gLS0KPiA+IDIuMzkuMgo+ID4K
Pgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiBNYXNhaGlybyBZYW1hZGEKCgoKLS0gCkJlc3QgUmVn
YXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zbnBzLWFyYwo=
