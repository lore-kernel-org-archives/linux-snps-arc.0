Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82DBEB64DC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Jun 2023 16:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXtaziYuiOxXUUvNvptzJuL6EUQetpnormrPeLSKFO0=; b=Xn8hzrWJP5B2uB
	mrSiUqVeW6DUA1fb08jWvdGfb497o4uRN08CG6+VP4EzKDpV8W7yu4KINdglbV7/mKSZQ8JFDvnVH
	4/JlCKNAWeMoPb7hxb5FWwYxY4wT9G8T63Z4J8//BPkx+aJpNE/Rhp3th89RZ5TpalbjM0EneKcpr
	Sq3wdbpUauDmGqTs1GyHA9iT3kWAl7I62sPagETXMAd/cO1kMz46g+obTdqMo4lrklFsIRUYu1ErE
	fNN4KrKy9lj4mv4h/jx4Tm+TdhiuCSi+Q4QK9sVUE+dIF/vHrIe3E5/r2Vh1FYcog9z95lr319WX5
	UJYEt6vOvNprwwdRGBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEBw6-00Dg7f-1d;
	Tue, 27 Jun 2023 16:53:02 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEBw3-00Dg73-32;
	Tue, 27 Jun 2023 16:53:01 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4717089ae5bso1592309e0c.0;
        Tue, 27 Jun 2023 09:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687884775; x=1690476775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lIZI96K9vdLoSwUwpQZZH+ZWrx3VsFWqYpi3+69yqU=;
        b=ZJypwzD1AdQoC+BsnfDnNKeCHZ/sIS+ZOLZqHxHbc/B/O4yGVciTVy+9QVfYpN3qed
         hhOWvDiCgiO3ESB8XXBYUQJ6GX31P8/FqrGpJ78J81tmpHjPVmZN0SW9toAUVePaV1k/
         dgG6gLx4uLqCXExkPv1Z1C7mhMetRhfNq37EbkdjfILi86dXixfO3y2/Wa2dL6M+I2LJ
         D7tjtoglZTEIYxHH0gFGhqNI82Si5pcNVRk4anveoste7I3Bt6HahSTdEitnQeBxCcW3
         /7phrdrL318w4JNcwlRkQsQEGF6BfI5U5WH4aPdMgeGP3OEoAcILWnvDeR5caiHG10i6
         d0SQ==
X-Gm-Message-State: AC+VfDwZOQSaFNoORDM5EEh5a4qaLpWtif/ZbzHq8wPSymBFVX9IIzJL
	LM0wsZ+xyPWjIlJaP8TysCKFZYwnX5B6hpzL
X-Google-Smtp-Source: ACHHUZ5qq7hS6fF9tNerQ0gTA83aymo5+pC74bxH/ZaLhTivIhvlbRPxWaNDT5JYY7A+xFkIw+ArcQ==
X-Received: by 2002:a1f:cc06:0:b0:471:cea:3d62 with SMTP id c6-20020a1fcc06000000b004710cea3d62mr13144980vkg.2.1687884774710;
        Tue, 27 Jun 2023 09:52:54 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id m84-20020a1f2657000000b004757fa0c3adsm1634539vkm.35.2023.06.27.09.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 09:52:54 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-440b66adc81so1533668137.1;
        Tue, 27 Jun 2023 09:52:54 -0700 (PDT)
X-Received: by 2002:a05:6358:f55:b0:132:d3b1:c34a with SMTP id
 c21-20020a0563580f5500b00132d3b1c34amr12105551rwj.7.1687884753801; Tue, 27
 Jun 2023 09:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-22-arnd@kernel.org>
 <OS0PR01MB5922EDAFCD6DA0313DB99C5E86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <66899d69-1339-4a61-8612-6f8e452b0b26@app.fastmail.com>
In-Reply-To: <66899d69-1339-4a61-8612-6f8e452b0b26@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jun 2023 18:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5gT1GDLODsUe0XibPRsRHazF4K-UhxTOQCjtC9Ba4mQ@mail.gmail.com>
Message-ID: <CAMuHMdV5gT1GDLODsUe0XibPRsRHazF4K-UhxTOQCjtC9Ba4mQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] dma-mapping: replace custom code with generic implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Arnd Bergmann <arnd@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, guoren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, 
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-oxnas@groups.io" <linux-oxnas@groups.io>, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
	"linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, 
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, 
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, 
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
	"linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_095259_997299_34830E37 
X-CRM114-Status: GOOD (  21.37  )
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

T24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgMjo1MuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+IE9uIFRodSwgQXByIDEzLCAyMDIzLCBhdCAxNDoxMywgQmlqdSBEYXMg
d3JvdGU6Cj4gPiBGWUksIHRoaXMgcGF0Y2ggYnJlYWtzIG9uIFJaL0cyTCBTTUFSQyBFVksgYm9h
cmQgYW5kIEFybmQgd2lsbCBzZW5kIFYyCj4gPiBmb3IgZml4aW5nIHRoaXMgaXNzdWUuCj4gPgo+
ID4gWzEwOjUzXSA8YmlqdT4gWyAgICAzLjM4NDQwOF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwg
cGFnaW5nIHJlcXVlc3QgYXQKPiA+IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDRhZmIwMDgwCj4K
PiBSaWdodCwgc29ycnkgYWJvdXQgdGhpcywgSSBhY2NpZGVudGFsbHkgcmVtb3ZlZCB0aGUgJ3Bo
eXNfdG9fdmlydCgpJwo+IGNvbnZlcnNpb24gb24gYXJtNjQuCgpNZWgsIEkgbWlzc2VkIHRoYXQs
IHNvIEkgZW5kZWQgdXAgYmlzZWN0aW5nIHRoaXMgc2FtZSBmYWlsdXJlLi4uCgpUaGlzIHBhdGNo
IGlzIG5vdyBjb21taXQgODAxZjE4ODNjNGJiNzBjYyAoImRtYS1tYXBwaW5nOiByZXBsYWNlCmN1
c3RvbSBjb2RlIHdpdGggZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiIpIGluIGVzbWlsL2poNzEwMC1k
bWFwb29sLAphbmQgYnJva2UgYm9vdGluZyBvbiBSLUNhciBHZW4zLgoKVGhlIGZvbGxvd2luZyBn
bWFpbC13aGl0ZXNwYWNlLWRhbWFnZWQgcGF0Y2ggZml4ZXMgdGhhdDoKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMgYi9hcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMK
aW5kZXggOTdiN2NlYTVlYjIzYWVkZC4uNzdlMGI2OGI0M2U1ODQ5YSAxMDA2NDQKLS0tIGEvYXJj
aC9hcm02NC9tbS9kbWEtbWFwcGluZy5jCisrKyBiL2FyY2gvYXJtNjQvbW0vZG1hLW1hcHBpbmcu
YwpAQCAtMTUsMTcgKzE1LDIzIEBACgogc3RhdGljIGlubGluZSB2b2lkIGFyY2hfZG1hX2NhY2hl
X3diYWNrKHBoeXNfYWRkcl90IHBhZGRyLCBzaXplX3Qgc2l6ZSkKIHsKLSAgICAgICBkY2FjaGVf
Y2xlYW5fcG9jKHBhZGRyLCBwYWRkciArIHNpemUpOworICAgICAgIHVuc2lnbmVkIGxvbmcgc3Rh
cnQgPSAodW5zaWduZWQgbG9uZylwaHlzX3RvX3ZpcnQocGFkZHIpOworCisgICAgICAgZGNhY2hl
X2NsZWFuX3BvYyhzdGFydCwgc3RhcnQgKyBzaXplKTsKIH0KCiBzdGF0aWMgaW5saW5lIHZvaWQg
YXJjaF9kbWFfY2FjaGVfaW52KHBoeXNfYWRkcl90IHBhZGRyLCBzaXplX3Qgc2l6ZSkKIHsKLSAg
ICAgICBkY2FjaGVfaW52YWxfcG9jKHBhZGRyLCBwYWRkciArIHNpemUpOworICAgICAgIHVuc2ln
bmVkIGxvbmcgc3RhcnQgPSAodW5zaWduZWQgbG9uZylwaHlzX3RvX3ZpcnQocGFkZHIpOworCisg
ICAgICAgZGNhY2hlX2ludmFsX3BvYyhzdGFydCwgc3RhcnQgKyBzaXplKTsKIH0KCiBzdGF0aWMg
aW5saW5lIHZvaWQgYXJjaF9kbWFfY2FjaGVfd2JhY2tfaW52KHBoeXNfYWRkcl90IHBhZGRyLCBz
aXplX3Qgc2l6ZSkKIHsKLSAgICAgICBkY2FjaGVfY2xlYW5faW52YWxfcG9jKHBhZGRyLCBwYWRk
ciArIHNpemUpOworICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQgPSAodW5zaWduZWQgbG9uZylw
aHlzX3RvX3ZpcnQocGFkZHIpOworCisgICAgICAgZGNhY2hlX2NsZWFuX2ludmFsX3BvYyhzdGFy
dCwgc3RhcnQgKyBzaXplKTsKIH0KCiBzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF9zeW5jX2RtYV9j
bGVhbl9iZWZvcmVfZnJvbWRldmljZSh2b2lkKQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
