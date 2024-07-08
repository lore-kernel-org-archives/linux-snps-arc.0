Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7DAC3DA42
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Jul 2024 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foEntaDe9AuK8mLeT5MHVri4/HfAQbXxOOjG2206acU=; b=z6XtodxoXw5Os3
	1D0RAYove/z5WiGeDqMSChNtCdg0mmhM8BkiJ6GGKljWKyjCrIlvhInYVMi3kiBZ7kf1DmBonNeih
	OBlVtipsXYrMcQ1caGP/QFqGthUW0SkQ7sagzitiHxR6eH6S4oYfVpmEUGzp7LgqMXXIe82YrWQAW
	eJy82GqHiFhPvjoZVhia6mNh7RyTJcG2yj5hBTctz9W5R6eTPVCuDf1tr0Jus9pUB73vwkqDhBu7p
	gPZYVstMgA+F2ZpVb2IG27UZzAiw3tiaR7/djyEUiYk/g6xkBAxVl3lwIFc7tcp7WqU9dPllZ98Np
	/1SEnSXAlZmxqruoTbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkVL-00000003FKL-04Qj;
	Mon, 08 Jul 2024 09:17:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkV3-00000003FDf-3ssz;
	Mon, 08 Jul 2024 09:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A665160B59;
	Mon,  8 Jul 2024 09:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D66C4AF0A;
	Mon,  8 Jul 2024 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720430252;
	bh=fRzukiwiGXpfJgT9MIn/+BOBLSM4o3zDVVIuAEKJfMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SfncwpyqaAUcxk4HGvdMNaOlFxT3eL7rjEhJDUvNG62fa9KaXZR/Oz+v8yMCn3ta+
	 /tccNzu3bQ8q8BfZ5+buUyzDUGywn+y/MY4doi6tGvKR8YdH0AkUVy7qj/f3dh1U8t
	 3DmwyBV90mFNFHNrVkwT08fRI5lZYSocV/GxUbec27l1frJyIPaJ5MEo2xcS5A41wo
	 OQcUVsetb6J2S4ud3iH8oqwrz1HWlD9qkxxYl7ODAK2zWmLEWuWboI9Eg77g85aBm0
	 feGo25bpoB3Q4dHOJ/iwYN0eRuz5gReTmHsiTE3NUWs38X5woOobCbYbObh8AQ4sCW
	 h2dVIyDDpLCwg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab8cso5373481a12.0;
        Mon, 08 Jul 2024 02:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUPQfJk6iyQCAJLn1VXB8hYRof0pmwuCWthqS1Z+yUXJHu0EP0ifCEXUXNWXATgLvZ3EhH3wN20QT1PC/BdvndrgpNpxhfTvVgvybI3buyAgon7mrALuDeTiEhypMPyP2zIKzNjE6+5OpP7ZzFa5sO76pWdMzGSpymBg9XgeJo2JFQmnKJ7Zc2hO9eJnaaJ8e8bL8YrZ990mE=
X-Gm-Message-State: AOJu0YyNy/nQR//Va8Ri0sEgtiDVDnK5Jaj6qr1wV4mQH0B6y3vyolZt
	dohrODXjtwHz6bB1n661H2gTW73jlEYRf9g4r54VlILR1Wukn86AhwGySmiQl5T60/eNoT1Hk77
	SpTFLbGwVwGCthuCsFkMNgyUr7xw=
X-Google-Smtp-Source: AGHT+IEItbzjZ1A8AjoY2UEBrBnwgSWQEm3t7mr2+tl/5g9pMSmICjy6tz2b5gKMEgXcn3oWVBAMV2zDOPQcnE6qDs4=
X-Received: by 2002:a05:6402:50c7:b0:57c:47c3:dc62 with SMTP id
 4fb4d7f45d1cf-58e590724ecmr7993184a12.5.1720430250552; Mon, 08 Jul 2024
 02:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-3-arnd@kernel.org>
In-Reply-To: <20240704143611.2979589-3-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 Jul 2024 17:17:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ4oDh2yEFpTBRpXauVa1zZAZBMsVvwbx3OUZnKaCLH0w@mail.gmail.com>
Message-ID: <CAJF2gTQ4oDh2yEFpTBRpXauVa1zZAZBMsVvwbx3OUZnKaCLH0w@mail.gmail.com>
Subject: Re: [PATCH 02/17] csky: drop asm/gpio.h wrapper
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240708_021734_083717_FD461A46 
X-CRM114-Status: GOOD (  14.97  )
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

T24gVGh1LCBKdWwgNCwgMjAyNCBhdCAxMDozNuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4gVGhlIGFzbS9ncGlvLmggaGVhZGVyIGlzIGdvbmUgbm93IHRoYXQgYWxsIGFyY2hpdGVjdHVy
ZXMganVzdCB1c2UKPiBncGlvbGliLCBhbmQgc28gdGhlIHJlZGlyZWN0IGlzIG5vIGxvbmdlciB2
YWxpZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4g
LS0tCj4gIGFyY2gvY3NreS9pbmNsdWRlL2FzbS9LYnVpbGQgfCAxIC0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20v
S2J1aWxkIGIvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL0tidWlsZAo+IGluZGV4IDExMTdjMjhjYjdl
OC4uMTNlYmM1ZTM0MzYwIDEwMDY0NAo+IC0tLSBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9LYnVp
bGQKPiArKysgYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vS2J1aWxkCj4gQEAgLTEsNyArMSw2IEBA
Cj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAgZ2VuZXJpYy15ICs9IGFz
bS1vZmZzZXRzLmgKPiAgZ2VuZXJpYy15ICs9IGV4dGFibGUuaAo+IC1nZW5lcmljLXkgKz0gZ3Bp
by5oCj4gIGdlbmVyaWMteSArPSBrdm1fcGFyYS5oCj4gIGdlbmVyaWMteSArPSBtY3Nfc3Bpbmxv
Y2suaAo+ICBnZW5lcmljLXkgKz0gcXJ3bG9jay5oCj4gLS0KPiAyLjM5LjIKPgpMR1RNIQpBY2tl
ZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
