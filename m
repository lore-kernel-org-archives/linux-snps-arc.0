Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C08C761AF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Mar 2023 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehHcoGOER3YLXxrX8wNScfzTeoQrTfBITN9eXh0UtpU=; b=B9jrbB6gW9tnfk
	FIH/lvwQWvmAygcBNfiR0YAMPvUWPDjyavIeJWbF26eIBL19vVDqcD10JOZYJ9Crrk05HFFHZByLL
	d8KP7UGlEf4152b7yOUyMlhkiiuUhZYNREDjSfEyosIs4t9f4kRN4Wlm0B3u/mrDYDMBI1jeolNkz
	k0ldhFEZOxn5IiksFdU+RXD/Dh3OgidkA7dY61+angQQnevyoSXMAKWwtI4S0vwPi3SdVQpIzaZkf
	A3lr/qid76Kmizhw3GI6YZ9NbJJFQVEKxc0zcjyoca19/d7la/rWVcYKwpJHyft2y8L//fyVQjqfa
	s/T5LUYWNp+8Mr5wsM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phrsO-003oWO-2w;
	Thu, 30 Mar 2023 12:59:37 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phrsM-003oVm-2G;
	Thu, 30 Mar 2023 12:59:36 +0000
Received: by mail-io1-xd2a.google.com with SMTP id m22so8235063ioy.4;
        Thu, 30 Mar 2023 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680181172; x=1682773172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db58zgLapT4+5eM+e2dEcRQMOxpl02qLJJqJynMawPw=;
        b=gvyLOSrV5NqLHUuxidIYczTpyccsUd898Kt8qAjGZCJm8EQYH5JcTmwLqg57uC0cvB
         j7U0x9dcm2RsX8dLxVGcboGq4Pdvm6cDFGIifVhW5LUG0BZhpnkLq+12fDfUITmPUgDN
         KJqbUWD1A1NNvcxlD8Va+DklQ7yRgA9v4iGNa+yDzNCF8hz/BAHOp1sivo3m/ett+i3j
         AtVwEXoZrtByosb2V89SvT6DgwFv0o1YJU+4lunFRTh6XWRbkQcRhcsLjusSr3Liunwq
         utzWcTAPvMsNoessMz8HZ9Y6dfPH5hnImowquLEBicF67L5RSN3ovwZ4QUhqVrtpFGVk
         CyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680181172; x=1682773172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db58zgLapT4+5eM+e2dEcRQMOxpl02qLJJqJynMawPw=;
        b=r+gDtNul+EZGvAkxt75eMMQmIxSYVjNlo9Cabrid0ppnPiwHnn9wIHL3IhZmhcnPDP
         xhR5N7PgJlm550elAd7xoq51DRX7b29t+uT5pukJY7dvkEt9YcfkW9eCF3Xmn7MwWuu8
         88oYuB8YHqO+J8h3NcLDSMSPvKR1Su4dtF7r0s42knGr2+RVEbRaEnoPgbywXyQ/CKX1
         cEHKI8j1sGTdmUx7ssVSlwpZ2Nw76ZFXGRCmI4SuOwrn/intgBeVXe5lYr4ReQcExvq5
         VlF0yem1n1GxJBIrh4Z5M3CBTzCO6xOYGFZQEAiLAtVPctMDLTnU58lTauZS/8kZIKPj
         oc6w==
X-Gm-Message-State: AAQBX9eeEeF8LMyAVx9ixvsQpP9vNZwAaCkvnzFVOMseq8HzcS9WqiJO
	JS9dCCSKInOWaUmA0GDDnABiBav1R5H9tLQzefs=
X-Google-Smtp-Source: AKy350Yt7w4HDnt8ZzJ1OA1g5OCPUWPp6heQMoQ57xTct+y1JPFpMNsPMtx4N97vitPklV5i5ccLJReO6yCW0ia7/Oo=
X-Received: by 2002:a02:95c3:0:b0:3eb:3166:9da4 with SMTP id
 b61-20020a0295c3000000b003eb31669da4mr2710421jai.2.1680181172425; Thu, 30 Mar
 2023 05:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-9-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Mar 2023 13:59:06 +0100
Message-ID: <CA+V-a8v--RqxFJYTZ04vVgiA69VJsFWk=r=TvRvokhpAV-famg@mail.gmail.com>
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230330_055934_756403_5DF78AB7 
X-CRM114-Status: GOOD (  18.42  )
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

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgMToxNuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4gTm8gb3RoZXIgYXJjaGl0ZWN0dXJlIGludGVudGlvbmFsbHkgd3JpdGVzIGJhY2sgZGlydHkg
Y2FjaGUgbGluZXMgaW50bwo+IGEgYnVmZmVyIHRoYXQgYSBkZXZpY2UgaGFzIGp1c3QgZmluaXNo
ZWQgd3JpdGluZyBpbnRvLiBJZiB0aGUgY2FjaGUgaXMKPiBjbGVhbiwgdGhpcyBoYXMgbm8gZWZm
ZWN0IGF0IGFsbCwgYnV0IGlmIGEgY2FjaGVsaW5lIGluIHRoZSBidWZmZXIgaGFzCj4gYWN0dWFs
bHkgYmVlbiB3cml0dGVuIGJ5IHRoZSBDUFUsICB0aGVyZSBpcyBhIGRyaXZlIGJ1ZyB0aGF0IGlz
IGxpa2VseQo+IG1hZGUgd29yc2UgYnkgb3ZlcndyaXRpbmcgdGhhdCBidWZmZXIuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L21tL2RtYS1ub25jb2hlcmVudC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgoKUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2Fy
Cgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jIGIvYXJjaC9y
aXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYwo+IGluZGV4IGQ5MTllZmFiNmViYS4uNjQwZjRjNDk2
ZDI2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiArKysg
Yi9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jCj4gQEAgLTQyLDcgKzQyLDcgQEAgdm9p
ZCBhcmNoX3N5bmNfZG1hX2Zvcl9jcHUocGh5c19hZGRyX3QgcGFkZHIsIHNpemVfdCBzaXplLAo+
ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRE1BX0ZST01fREVWSUNFOgo+
ICAgICAgICAgY2FzZSBETUFfQklESVJFQ1RJT05BTDoKPiAtICAgICAgICAgICAgICAgQUxUX0NN
T19PUChmbHVzaCwgdmFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gKyAgICAg
ICAgICAgICAgIEFMVF9DTU9fT1AoaW52YWwsIHZhZGRyLCBzaXplLCByaXNjdl9jYm9tX2Jsb2Nr
X3NpemUpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAg
ICAgICAgICAgICAgIGJyZWFrOwo+IC0tCj4gMi4zOS4yCj4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
