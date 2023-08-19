Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1F2EE499C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Aug 2023 03:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Hu7uZRmU9zRbCeujpvu98myzFpvqs1J8W2AlOwSnVk=; b=ibu5giInsKy7cJ
	cZgFwU4RC91htLt40zdKPVgm8nmqNMHFWgi+PJCwrj9QvVti6LizChtLmVj/tRkXXPv/pEag2vd/a
	mqT2LYM+21yRwewvucW0yU5UWNmA04e01F2u4uaYeK9I/9zbby4rbCXdi5f24EEnQbys6lWL0zYXY
	z0FOAgYXYWII6TmLdunlVxo2NZon6SMz23q2CFmnqSzvtJ+WAvBsSJzh2tNViscq++N7ZqSS6UTk2
	yCE6obPRTYqtumxGxZCsSkgXEhz2/gn6Kyg/K/b0pJj/JTAQJ1yT/vpSOecX2Sj/kMU16lEemiSNt
	OJ2blCeNjqWxoa0XLlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXCjR-00ALyR-12;
	Sat, 19 Aug 2023 03:34:33 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXCjN-00ALxV-21;
	Sat, 19 Aug 2023 03:34:30 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-26934bc3059so1895983a91.1;
        Fri, 18 Aug 2023 20:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692416065; x=1693020865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOjVxX/Eg0iGmCqhVv5cIZBql9TtO2CXYAj6O50hbSE=;
        b=IqtJwsF0pUQX7izyHeTreyTJTJhKy5hiG0L5LG7pklRm5ruz2z314lR30cJBIft8IF
         lHOgWqUBHxsrHRZ/n+H1wKK9DAmo6l6M6vOqnptgdlcjmAJVnPdA6vRI0gXUbNjLjw2O
         HaCa2GQWI2H3P/PJF/kO6bmYeR/Nyn9f2ZprmcA/D0k+kc6aE9gt4/58CgSA7F801jjd
         XX+T7G5Lv1/7anA6wENrFajkkBfdYnNLgzsdEjOaJ3u6npvNqyydM0GqNQ4HtJ58/8Bk
         W4eV1DvzXq38mo16H9W9Oyvm8s/Iciep4KukBQTEpuiauG6fJdSHO4J2dBeLWJsNSNRu
         GvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692416065; x=1693020865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOjVxX/Eg0iGmCqhVv5cIZBql9TtO2CXYAj6O50hbSE=;
        b=V9XiimvAFDtxNNOAnf9hVhhdVkzuFJ252oLGeoItlHOmxVYy697HTLhn93H1mXbeAz
         DMiPXMbqjOFzVqjtrCBoAc0Huivw9UoLr3F+U3CCWBUSYT3RPDaRF17CabMTjPB3tBsO
         tGEW7UCcxhTImrhDcWG0TMLA0wT41BuCm9fL7innHtWMtISaL+qW3kUFpwQIe/TxGpew
         P6RI8H+a6WmITf1cM0MQl5gDhRk1ouQprKPa5IzyyKkVvkMPYnWUA2e6aChGXOF0IIIP
         051zNa32i+nClHT3rhxtbYSUH+3aUM9034eqAGa6LcKoOn+xzA7wJVgtM7rCEm0RvKso
         7NBg==
X-Gm-Message-State: AOJu0YxtNE7lxOV2xF5orly8TtId4Sd0nfU3OjNb7o0VU9Dndw19Pirn
	O/z/PmtbLgUKrgeJe+aDbZbkPugFVO7/xtZT/hk=
X-Google-Smtp-Source: AGHT+IFpp0VHvCZv9YQH2C6BH14eA1+BcCpaZ1w5QpKfP5/3cQ/4jDAUwPVhdHrKttxLAuvWHcInuMfoJccdrJLxiGs=
X-Received: by 2002:a17:90a:64ca:b0:25d:d224:9fb9 with SMTP id
 i10-20020a17090a64ca00b0025dd2249fb9mr1389535pjm.24.1692416065235; Fri, 18
 Aug 2023 20:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
 <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org> <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
In-Reply-To: <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
From: Jesse T <mr.bossman075@gmail.com>
Date: Fri, 18 Aug 2023 23:33:49 -0400
Message-ID: <CAJFTR8T-Fdu_aKapP+Lb6pLYo_ykXwXw6rFZNGR5=WKU1QwUPQ@mail.gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com, linux-arch@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org, 
	Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	linux-openrisc@vger.kernel.org, linux-mips@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org, 
	Max Filippov <jcmvbkbc@gmail.com>, Josh Triplett <josh@joshtriplett.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_203429_665214_EF7FB80F 
X-CRM114-Status: GOOD (  28.66  )
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

T24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgNzo0NOKAr1BNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IEhpIEplc3NlLAo+Cj4gSSByZXBsaWVkIHRvIHlvdXIg
Y29tbWVudCBhIGZldyBkYXlzIGFnbywgYnV0IGZvciBzb21lIHJlYXNvbgo+IHlvdXIgZW1haWwg
dG8gbWUgY29udGFpbnM6Cj4gUmVwbHktVG86IDIwMjMwODE2MDU1MDEwLjMxNTM0LTEtcmR1bmxh
cEBpbmZyYWRlYWQub3JnCj4gc28gaXQgd2Fzbid0IHNlbnQgZGlyZWN0bHkgdG8geW91LgoKU29y
cnkgYWJvdXQgdGhhdCBJIG1lc3NlZCB1cCB0aGUgZW1haWwgaGVhZGVycy4uLgo+Cj4gTXkgZm9y
bWVyIHJlcGx5IGlzIGJlbG93Lgo+Cj4gT24gOC8xNi8yMyAyMDoxNSwgUmFuZHkgRHVubGFwIHdy
b3RlOgo+ID4gSGkgSmVzc2UsCj4gPgo+ID4gT24gOC8xNi8yMyAxNTo0NSwgSmVzc2UgVGF1YmUg
d3JvdGU6Cj4gPj4gSGksIFJhbmR5Cj4gPj4KPiA+Pj4gZGlmZiAtLSBhL2luaXQvS2NvbmZpZyBi
L2luaXQvS2NvbmZpZwo+ID4+PiAtLS0gYS9pbml0L0tjb25maWcKPiA+Pj4gKysrIGIvaW5pdC9L
Y29uZmlnCj4gPj4+IEBAIC0xNzkwLDE0ICsxNzkwLDYgQEAgY29uZmlnIERFQlVHX1JTRVEKPiA+
Pj4KPiA+Pj4gICAgICAgICBJZiB1bnN1cmUsIHNheSBOLgo+ID4+Pgo+ID4+PiAtY29uZmlnIEVN
QkVEREVECj4gPj4+IC0gICAgYm9vbCAiRW1iZWRkZWQgc3lzdGVtIgo+ID4+PiAtICAgIHNlbGVj
dCBFWFBFUlQKPiA+Pj4gLSAgICBoZWxwCj4gPj4+IC0gICAgICBUaGlzIG9wdGlvbiBzaG91bGQg
YmUgZW5hYmxlZCBpZiBjb21waWxpbmcgdGhlIGtlcm5lbCBmb3IKPiA+Pj4gLSAgICAgIGFuIGVt
YmVkZGVkIHN5c3RlbSBzbyBjZXJ0YWluIGV4cGVydCBvcHRpb25zIGFyZSBhdmFpbGFibGUKPiA+
Pj4gLSAgICAgIGZvciBjb25maWd1cmF0aW9uLgo+ID4+Cj4gPj4gV291bGRuJ3QgcmVtb3Zpbmcg
dGhpcyBicmVhayBtYW55IG91dCBvZiB0cmVlIGNvbmZpZ3M/Cj4gPgo+ID4gSSdtIG5vdCBmYW1p
bGlhciB3aXRoIG91dC1vZi10cmVlIGNvbmZpZ3MuCj4gPiBEbyB5b3UgaGF2ZSBzb21lIGV4YW1w
bGVzIG9mIHNvbWUgdGhhdCB1c2UgQ09ORklHX0VNQkVEREVEPwo+ID4gKG5vdCBkaXN0cm9zKQoK
QnVpbGRyb290IGhhcyBhIGZldy4KSXQgd29uJ3QgaW1tZWRpYXRlbHkgYnJlYWsgQnVpbGRyb290
IGFuZCBZb2N0byBhcyB0aGV5IGhhdmUgYSBzZXQgdmVyc2lvbiwKYnV0IGl0IGNvdWxkIGJlIGNv
bmZ1c2luZyBmb3IgYW55b25lIHVwZGF0aW5nIHRoZSBrZXJuZWwuCgo+ID4KPiA+PiBTaG91bGQg
dGhlcmUgYmUgYSB3YXJuaW5nIGhlcmUgdG8gdXBkYXRlIGNoYW5nZSBpdCBpbnN0ZWFkIG9mIHJl
bW92YWw/Cj4gPgo+ID4ga2NvbmZpZyBkb2Vzbid0IGhhdmUgYSB3YXJuaW5nIG1lY2hhbmlzbSBB
RkFJSy4KPiA+IERvIHlvdSBoYXZlIGFuIGlkZWEgb2YgaG93IHRoaXMgd291bGQgd29yaz8KCk5v
LCB1bmZvcnR1bmF0ZWx5LiBBcyB5b3Ugc2FpZCB3aXRob3V0IGEgd2FybmluZyBpdCB3b3VsZCBi
ZSBvdmVybG9va2VkIHNvCmEgY2hhbmdlIHdvdWxkIG5vdCBiZSBuZWNlc3NhcnkuCgpBIHBvc3Np
YmxlIHNvbHV0aW9uIGlzIHRvIGNoZWNrIGluIGEgaGVhZGVyIGZpbGUgd2l0aDoKCiNpZmRlZiBD
T05GSUdfRU1CRURERUQKI3dhcm5pbmcgIkNPTkZJR19FTUJFRERFRCBoYXMgY2hhbmdlZCB0byBD
T05GSUdfRVhQRVJUIgojZW5kaWYKCkRvZXMgYW55b25lIGVsc2UgaGF2ZSBhbiBvcGluaW9uIG9u
IHRoaXM/ClNpbmNlIGtjb25maWcgZG9lc24ndCBoYXZlIGEgd2FybmluZyBtZWNoYW5pc20gdGhl
IHBhdGNoIHNlZW1zIGZpbmUgYXMgaXMuCgpUaGFua3MsCkplc3NlIFRhdWJlCj4gPgo+ID4gV2Ug
Y291bGQgbWFrZSBhIHNtYWxsZXIgY2hhbmdlIHRvIGluaXQvS2NvbmZpZywgbGlrZSBzbzoKPiA+
Cj4gPiAgY29uZmlnIEVNQkVEREVECj4gPiAtICAgICBib29sICJFbWJlZGRlZCBzeXN0ZW0iCj4g
PiArICAgICBib29sICJFbWJlZGRlZCBzeXN0ZW0gKERFUFJFQ0FURUQpIgo+ID4gICAgICAgc2Vs
ZWN0IEVYUEVSVAo+ID4gICAgICAgaGVscAo+ID4gLSAgICAgICBUaGlzIG9wdGlvbiBzaG91bGQg
YmUgZW5hYmxlZCBpZiBjb21waWxpbmcgdGhlIGtlcm5lbCBmb3IKPiA+IC0gICAgICAgYW4gZW1i
ZWRkZWQgc3lzdGVtIHNvIGNlcnRhaW4gZXhwZXJ0IG9wdGlvbnMgYXJlIGF2YWlsYWJsZQo+ID4g
LSAgICAgICBmb3IgY29uZmlndXJhdGlvbi4KPiA+ICsgICAgICAgVGhpcyBvcHRpb24gaXMgYmVp
bmcgcmVtb3ZlZCBhZnRlciBMaW51eCA2LjYuCj4gPiArICAgICAgIFVzZSBFWFBFUlQgaW5zdGVh
ZCBvZiBFTUJFRERFRC4KPiA+Cj4gPiBidXQgdGhlcmUgaXMgbm8gd2F5IHRvIHByb2R1Y2UgYSB3
YXJuaW5nIG1lc3NhZ2UuIEkuZS4sIGV2ZW4gd2l0aCB0aGlzCj4gPiBjaGFuZ2UsIHRoZSBtZXNz
YWdlIHdpbGwgcHJvYmFibHkgYmUgb3Zlcmxvb2tlZC4KPiA+Cj4gPiAtLS0KPiA+IH5SYW5keQo+
Cj4gLS0KPiB+UmFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
