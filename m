Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07899C3DA45
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 Jul 2024 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQbzdMP6AFN1oShf1Ry4kwSgKD27iBwF0jfxST6tTf4=; b=ysHLQOUqxptFwo
	e+XBiN7NMAS32cJ8j3L80l34z6RCmeeSdR3WH9rvQERHROXlDoyPPoKGRoz9JGtOkdBZikTYFCgAY
	0B35+boSpDY4N+Gbh7ka+HvGFTkY5ZMhOLCjCe0vyX6+f/vyohDOZRIkJPT7r8ezfFReWUmy1pQY0
	/dR7CTmkpqikzZ3AapUxLKveHb/Z9sNXIj2laPwLHkQjMJvAgUc5P0XKh2+1ua3uzOn2R9bX/2wtM
	T6MvsAkOS/yVsVnqDZLOgIk2eIMuYeQTogYlWwS0lXh4PJdjC85XNLyxasMVsCIhoM4Tq8QLM5zZs
	gOoWM9RD2VO/g5rjoJwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRw32-0000000EYgt-30ra;
	Thu, 11 Jul 2024 15:49:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRw2j-0000000EYZE-1TRI;
	Thu, 11 Jul 2024 15:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D9CE61D65;
	Thu, 11 Jul 2024 15:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C08C4AF4D;
	Thu, 11 Jul 2024 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720712949;
	bh=ZuSNhp04Wh6EW5lLCQ+g2TTMsPvkJdMs1uzOY5TVPg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iEfV6QDWwbMnp9Ta0Jer7ufy7zKuRm0UWvkJW72QY10t6ps7bgp01pqrrI/nPJYK4
	 aMRh9ZF/IE1zLE2CWaaFQqoH87euXHgcVDUCI8FRHQLRzl0Hn5cM5pGTcdcuB1ubWY
	 7C0umyGH23O1dml7/cbWgv+m1S0Z5bC39W80eVrXz6QNggeVgiL7GVN5GGQXoSyNXO
	 x9/a5jfhts/AMfl6Y1Ah/Pvl+GppiyWxzLsd7vdSq8U1uD/hk7ObzadMOrVkHQ6wWX
	 mp+jdOGkXJyV7+IWDlVnAzxY48Ah5kvgicHHgUyI46+s+fRE2+Q7aNoVeQ82HxcNNS
	 L2NSAQhoN06lw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so11605381fa.3;
        Thu, 11 Jul 2024 08:49:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKsjFRRvzDX7gYsO6+6zq9pIL+ikqF/An9/0fC+xJNh8Rm4CUbxfxlBmLVVkGepIKMXBvW4jkUNiFhn71oe4f6U2ikQzFxbgRQWRj4xCTFXTKs1CgvHQfRW0UGp6Xgvu2piFQDaSvpBGB0XdfrGbceyUJRxlvIJI5ACxNRAg1hHkLdu4cgF9Q/9pn+Z/HQHvskk9QWx9Zfa7c=
X-Gm-Message-State: AOJu0YzgdcIx0zR3FkdUhxOz89BBNLZqgyV2yS/u6RYVl68/9xHh9WXT
	IrxNTgiOasXasAsTV1Lvmbg4pzuIpbI6r5JX75/XhE3OWt8sR07tXZ6zFmHy9s1RVp5Abmgn/ho
	G6pTNjIPBYWwET++0i/46U0itnTk=
X-Google-Smtp-Source: AGHT+IF7NQdXn1ehcZ9BG8DZDkjb0sOdI+MsrOYGuBrT+fO/aduK2xqVz6OBibzkuFUSmSL45H3g6KQ3ZY2sharGRnY=
X-Received: by 2002:a2e:8ed3:0:b0:2ee:4d37:91df with SMTP id
 38308e7fff4ca-2eeb30fef50mr68275581fa.27.1720712947779; Thu, 11 Jul 2024
 08:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-3-arnd@kernel.org>
In-Reply-To: <20240704143611.2979589-3-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 12 Jul 2024 00:48:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATLVY1xtSMVMro-KMQVPgVHoiRKGX33ajCg8ZU0-EZS2w@mail.gmail.com>
Message-ID: <CAK7LNATLVY1xtSMVMro-KMQVPgVHoiRKGX33ajCg8ZU0-EZS2w@mail.gmail.com>
Subject: Re: [PATCH 02/17] csky: drop asm/gpio.h wrapper
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
X-CRM114-CacheID: sfid-20240711_084913_540604_9E44E17D 
X-CRM114-Status: GOOD (  14.60  )
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
Cj4gVGhlIGFzbS9ncGlvLmggaGVhZGVyIGlzIGdvbmUgbm93IHRoYXQgYWxsIGFyY2hpdGVjdHVy
ZXMganVzdCB1c2UKPiBncGlvbGliLCBhbmQgc28gdGhlIHJlZGlyZWN0IGlzIG5vIGxvbmdlciB2
YWxpZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4g
LS0tCgoKUmV2aWV3ZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+
CgoKPiAgYXJjaC9jc2t5L2luY2x1ZGUvYXNtL0tidWlsZCB8IDEgLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9L
YnVpbGQgYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vS2J1aWxkCj4gaW5kZXggMTExN2MyOGNiN2U4
Li4xM2ViYzVlMzQzNjAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL0tidWls
ZAo+ICsrKyBiL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9LYnVpbGQKPiBAQCAtMSw3ICsxLDYgQEAK
PiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICBnZW5lcmljLXkgKz0gYXNt
LW9mZnNldHMuaAo+ICBnZW5lcmljLXkgKz0gZXh0YWJsZS5oCj4gLWdlbmVyaWMteSArPSBncGlv
LmgKPiAgZ2VuZXJpYy15ICs9IGt2bV9wYXJhLmgKPiAgZ2VuZXJpYy15ICs9IG1jc19zcGlubG9j
ay5oCj4gIGdlbmVyaWMteSArPSBxcndsb2NrLmgKPiAtLQo+IDIuMzkuMgo+CgoKLS0gCkJlc3Qg
UmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
