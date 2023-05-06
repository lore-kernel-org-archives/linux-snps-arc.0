Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265E5C77B7F
	for <linux-snps-arc@archiver.kernel.org>; Sat,  6 May 2023 07:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TM7Hrbh8jyuaUkNpVKK3xlyrG6aKk8iCC7US/H0F9k=; b=eZxFW6R9E74RdJ
	x52hoY+q5NygRpG1F4b4j9DfVY24tOyR6DoWMwMY0rXT8/3248BGnqox3CfOjRFXYuXD5bPkCQoaD
	hAD5gyba502aO/fVxjGtxDmJDlkFGLf8OOf5V1sDD1jvQBxQTLsN7CsXVNZVZbjrWHmhr5c83D0Jn
	kC74FX/wh6d9Tu/6yWEKbqdXBscDC+sQJLQ8IbImzuWXHB/TSX+9mpbP3uGaGgE77eHwURcD6TmEN
	7p5NHovlT8bn8249q6PHILBHBNt11KkGUrWESVG7458x5gsR+9X8uSCwaBVuFfZXCyykfj3h1AKRn
	f49NtxdiNtwuBwPJ3tGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCJC-00Clo6-0W;
	Sat, 06 May 2023 07:26:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCJ7-00Clm7-0t;
	Sat, 06 May 2023 07:26:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A1F061827;
	Sat,  6 May 2023 07:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946E4C4339E;
	Sat,  6 May 2023 07:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683357975;
	bh=/pqLqv84J2jWuKl1Lk7AhETw9xQvFqEdpB7kxyH6fI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L50qYGBQb0wikvZ4zyfBeY3Y2yJtWDPhF/YUuKZarH83QVL05Ds+pCmz+Gv81Qipb
	 03t8qlSLTa/CC7r+b12FDqZM3oqUGQxsctxFCrQvRfUxbYhZNPGAhrqxn1YrxtA6Mb
	 gzqH9KcO1FPCpc12zsU2vrnpRquV2gVOvLRecR+sujT5STw0Rdj04QxO+tIdA7EkHh
	 e0QlV/QF9bTJV+0lXeuREO2rwzCWRldn/k5I3ni/WUYx3w5HCSAbr6n0pr8T87cLTR
	 hkKXPUxGsRLMgrfswKvEH26eNJOddrIX+6li+8EzQ65nmpb3oS20NE+pxwVk4pcCZF
	 +d7iGHE9K73/Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4effb818c37so3023726e87.3;
        Sat, 06 May 2023 00:26:15 -0700 (PDT)
X-Gm-Message-State: AC+VfDxyCuHShQOX39qb/2FfcxydbCyyHsPdabSpkCuIpRr6Gv0A6mk6
	qM33AT4rRBTG35V4l5QuUR1sVoOaRm08BK25AK0=
X-Google-Smtp-Source: ACHHUZ4qS4i5Im7J3Ox7v0tb1ueCK3xmeH5uM44ArLR4roviIMhnWXngkOBBuBeiDbJ5qp2UGTwR6EkhF28IpBmVniU=
X-Received: by 2002:a17:907:3d9f:b0:959:5454:1db7 with SMTP id
 he31-20020a1709073d9f00b0095954541db7mr3511012ejc.3.1683357953246; Sat, 06
 May 2023 00:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-10-arnd@kernel.org>
 <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com> <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
In-Reply-To: <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 6 May 2023 15:25:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
Message-ID: <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before
 bidirectional DMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Brian Cain <bcain@quicinc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-oxnas@groups.io" <linux-oxnas@groups.io>, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_002617_420084_4271E00B 
X-CRM114-Status: GOOD (  45.45  )
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

T24gRnJpLCBNYXkgNSwgMjAyMyBhdCA5OjE54oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSA1LCAyMDIzLCBhdCAwNzo0NywgR3VvIFJlbiB3
cm90ZToKPiA+IE9uIE1vbiwgTWFyIDI3LCAyMDIzIGF0IDg6MTXigK9QTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gPj4KPiA+PiByaXNjdiBhbHNvIGludmFsaWRh
dGVzIHRoZSBjYWNoZXMgYmVmb3JlIHRoZSB0cmFuc2Zlciwgd2hpY2ggZG9lcwo+ID4+IG5vdCBh
cHBlYXIgdG8gc2VydmUgYW55IHB1cnBvc2UuCj4gPiBZZXMsIHdlIGNhbid0IGd1YXJhbnRlZSB0
aGUgQ1BVIHByZS1sb2FkIGNhY2hlIGxpbmVzIHJhbmRvbWx5IGR1cmluZwo+ID4gZG1hIHdvcmtp
bmcuCj4gPgo+ID4gQnV0IEkndmUgdHdvIHB1cnBvc2VzIHRvIGtlZXAgaW52YWxpZGF0ZXMgYmVm
b3JlIGRtYSB0cmFuc2ZlcjoKPiA+ICAtIFdlIGNsZWFybHkgdGVsbCB0aGUgQ1BVIHRoZXNlIGNh
Y2hlIGxpbmVzIGFyZSBpbnZhbGlkLiBUaGUgY2FjaGluZwo+ID4gYWxnb3JpdGhtIHdvdWxkIHVz
ZSB0aGVzZSBpbnZhbGlkIHNsb3RzIGZpcnN0IGluc3RlYWQgb2YgcmVwbGFjaW5nCj4gPiB2YWxp
ZCBvbmVzLgo+ID4gIC0gSW52YWxpZGF0aW5nIGlzIHZlcnkgY2hlYXAuIEFjdHVhbGx5LCBmbHVz
aCBhbmQgY2xlYW4gaGF2ZSB0aGUgc2FtZQo+ID4gcGVyZm9ybWFuY2UgaW4gb3VyIG1hY2hpbmUu
Cj4KPiBUaGUgbWFpbiBwdXJwb3NlIG9mIHRoZSBzZXJpZXMgd2FzIHRvIGdldCBjb25zaXN0ZW50
IGJlaGF2aW9yIG9uCj4gYWxsIG1hY2hpbmVzLCBzbyBJIHJlYWxseSBkb24ndCB3YW50IGEgY3Vz
dG9tIG9wdGltaXphdGlvbiBvbgo+IG9uZSBhcmNoaXRlY3R1cmUuIFlvdSBtYWtlIGEgZ29vZCBw
b2ludCBhYm91dCBjYWNoZWxpbmUgcmV1c2UKPiBhZnRlciBpbnZhbGlkYXRpb24sIGJ1dCBpZiB3
ZSBkbyB0aGF0LCBJJ2Qgc3VnZ2VzdCBkb2luZyB0aGlzCj4gYWNyb3NzIGFsbCBhcmNoaXRlY3R1
cmVzLgpZZXMsIGludmFsaWRhdGlvbiBvZiBETUFfRlJPTV9ERVZJQ0UtZm9yX2RldmljZSBpcyBh
IHByb3Bvc2FsIGZvciBhbGwKYXJjaGl0ZWN0dXJlcy4KCj4KPiA+IFNvLCBob3cgYWJvdXQ6Cj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMgYi9hcmNo
L3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jCj4gPiBpbmRleCBkOTE5ZWZhYjZlYmEuLjJjNTJm
YmMxNTA2NCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiA+IEBAIC0yMiw4ICsy
Miw2IEBAIHZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKHBoeXNfYWRkcl90IHBhZGRyLCBz
aXplX3Qgc2l6ZSwKPiA+ICAgICAgICAgICAgICAgICBBTFRfQ01PX09QKGNsZWFuLCB2YWRkciwg
c2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPiA+ICAgICAgICAgICAgICAgICBicmVhazsK
PiA+ICAgICAgICAgY2FzZSBETUFfRlJPTV9ERVZJQ0U6Cj4gPiAtICAgICAgICAgICAgICAgQUxU
X0NNT19PUChjbGVhbiwgdmFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiAt
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAgIGNhc2UgRE1BX0JJRElSRUNUSU9OQUw6
Cj4gPiAgICAgICAgICAgICAgICAgQUxUX0NNT19PUChmbHVzaCwgdmFkZHIsIHNpemUsIHJpc2N2
X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiBUaGlzIGlz
IHNvbWV0aGluZyB3ZSBjYW4gY29uc2lkZXIuIFVuZm9ydHVuYXRlbHksIHRoaXMgaXMgc29tZXRo
aW5nCj4gdGhhdCBubyBhcmNoaXRlY3R1cmUgKGV4Y2VwdCBwYS1yaXNjLCB3aGljaCBoYXMgb3Ro
ZXIgcHJvYmxlbXMpCj4gZG9lcyBhdCB0aGUgbW9tZW50LCBzbyB3ZSdkIHByb2JhYmx5IG5lZWQg
dG8gaGF2ZSBhIHByb3BlciBkZWJhdGUKPiBhYm91dCB0aGlzLgo+Cj4gV2UgYWxyZWFkeSBoYXZl
IHR3byBjb25mbGljdGluZyB3YXlzIHRvIGhhbmRsZSBETUFfRlJPTV9ERVZJQ0UsCj4gZWl0aGVy
IGludmFsaWRhdGUvaW52YWxpZGF0ZSwgb3IgY2xlYW4vaW52YWxpZGF0ZS4gSSBjYW4gc2VlCkkg
dm90ZSB0byBpbnZhbGlkYXRlL2ludmFsaWRhdGUuCgpNeSBrZXkgcG9pbnQgaXMgdG8gbGV0IERN
QV9GUk9NX0RFVklDRS1mb3JfZGV2aWNlIGludmFsaWRhdGUsIGFuZApETUFfQklESVJFQ1RJT05B
TCBjb250YWlucyBETUFfRlJPTV9ERVZJQ0UuClNvIEkgYWxzbyBhZ3JlZToKQEAgLTIyLDggKzIy
LDYgQEAgdm9pZCBhcmNoX3N5bmNfZG1hX2Zvcl9kZXZpY2UocGh5c19hZGRyX3QgcGFkZHIsIHNp
emVfdCBzaXplLAogICAgICAgICAgICAgICAgIEFMVF9DTU9fT1AoY2xlYW4sIHZhZGRyLCBzaXpl
LCByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwogICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAg
ICBjYXNlIERNQV9GUk9NX0RFVklDRToKIC0gICAgICAgICAgICAgICBBTFRfQ01PX09QKGNsZWFu
LCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKICsgICAgICAgICAgICAgIEFM
VF9DTU9fT1AoaW52YWxpZGF0ZSwgdmFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7
CiAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIGNhc2UgRE1BX0JJRElSRUNUSU9OQUw6
CiAgICAgICAgICAgICAgICAgQUxUX0NNT19PUChmbHVzaCwgdmFkZHIsIHNpemUsIHJpc2N2X2Ni
b21fYmxvY2tfc2l6ZSk7CiAgICAgICAgICAgICAgICAgYnJlYWs7Cgo+IHRoYXQgZmx1c2gvaW52
YWxpZGF0ZSBtYXkgYmUgYSBzZW5zaWJsZSBvcHRpb24gYXMgd2VsbCwgYnV0IEknZAo+IHdhbnQg
dG8gaGF2ZSB0aGF0IGRpc2N1c3Npb24gYWZ0ZXIgdGhlIHNlcmllcyBpcyBjb21wbGV0ZSwgc28K
PiB3ZSBjYW4gY29tZSB0byBhIGdlbmVyaWMgc29sdXRpb24gdGhhdCBoYXMgdGhlIHNhbWUgZG9j
dW1lbnRlZAo+IGJlaGF2aW9yIGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcy4KWWVzLCBJIGFncmVl
IHRvIHVuaWZ5IHRoZW0gaW50byBhIGdlbmVyaWMgc29sdXRpb24gZmlyc3QuIE15IHByb3Bvc2Fs
CmNvdWxkIGJlIGFub3RoZXIgdG9waWMgaW4gdGhlIGZ1dHVyZS4KRm9yIHRoYXQgcHVycG9zZSwg
SSBnaXZlCkFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCj4KPiBJbiBwYXJ0
aWN1bGFyLCBpZiB3ZSBlbmQgdXAgbW92aW5nIGFybTY0IGFuZCByaXNjdiBiYWNrIHRvIHRoZQo+
IHRyYWRpdGlvbmFsIGludmFsaWRhdGUvaW52YWxpZGF0ZSBmb3IgRE1BX0ZST01fREVWSUNFIGFu
ZAo+IGRvY3VtZW50IHRoYXQgZHJpdmVyIG11c3Qgbm90IHJlbHkgb24gYnVmZmVycyBnZXR0aW5n
IGNsZWFuZWQKQWZ0ZXIgaW52YWxpZGF0aW9uLCB0aGUgY2FjaGUgbGluZXMgYXJlIGFsc28gY2xl
YW5lZCwgcmlnaHQ/IFNvIHdoeSBkbwp3ZSBuZWVkIHRvIGRvY3VtZW50IGl0IGFkZGl0aW9uYWxs
eT8KCj4gYmVmb3JlIGEgcGFydGlhbCBETUFfRlJPTV9ERVZJQ0UsIHRoZSBxdWVzdGlvbiBiZXR3
ZWVuIGNsZWFuCj4gb3IgZmx1c2ggYmVjb21lcyBtb290IGFzIHdlbGwuCj4KPiA+IEBAIC00Miw3
ICs0MCw3IEBAIHZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfY3B1KHBoeXNfYWRkcl90IHBhZGRyLCBz
aXplX3Qgc2l6ZSwKPiA+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgY2FzZSBE
TUFfRlJPTV9ERVZJQ0U6Cj4gPiAgICAgICAgIGNhc2UgRE1BX0JJRElSRUNUSU9OQUw6Cj4gPiAg
ICAgICAgICAgICAgICAgLyogSSdtIG5vdCBzdXJlIGFsbCBkcml2ZXJzIGhhdmUgZ3VhcmFudGVl
ZCBjYWNoZWxpbmUKPiA+IGFsaWdubWVudC4gSWYgbm90LCB0aGlzIGludmFsIHdvdWxkIGNhdXNl
IHByb2JsZW1zICovCj4gPiAtICAgICAgICAgICAgICAgQUxUX0NNT19PUChmbHVzaCwgdmFkZHIs
IHNpemUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiArICAgICAgICAgICAgICAgQUxUX0NN
T19PUChpbnZhbCwgdmFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4KPiBUaGlzIGlzIG15IG9yaWdpbmFsIHBhdGNoLCBhbmQgSSB3
b3VsZCBub3QgbWl4IGl0IHdpdGggdGhlIG90aGVyCj4gY2hhbmdlLiBUaGUgcHJvYmxlbSB3aXRo
IG5vbi1hbGlnbmVkIERNQV9CSURJUkVDVElPTkFMIGJ1ZmZlcnMgaW4KPiBpcyB0aGF0IGJvdGgg
Zmx1c2ggYW5kIGludmFsIHdvdWxkIGJlIHdyb25nIGlmIHlvdSBnZXQgc2ltdWx0YW5lb3VzCj4g
d3JpdGVzIGZyb20gZGV2aWNlIGFuZCBjcHUgdG8gdGhlIHNhbWUgY2FjaGUgbGluZSwgc28gdGhl
cmUgaXMKPiBubyB3YXkgdG8gd2luIHRoaXMuIFVzaW5nIGludmFsIGluc3RlYWQgb2YgZmx1c2gg
d291bGQgYXQgbGVhc3QKPiB3b3JrIGlmIHRoZSBDUFUgZGF0YSBpbiB0aGUgY2FjaGVsaW5lIGlz
IHJlYWQtb25seSBmcm9tIHRoZSBDUFUsCj4gc28gdGhhdCBzZWVtcyBiZXR0ZXIgdGhhbiBzb21l
dGhpbmcgdGhhdCBpcyBhbHdheXMgd3JvbmcuCklmIENQVSBkYXRhIGluIHRoZSBjYWNoZWxpbmUg
aXMgcmVhZC1vbmx5LCB0aGUgY2FjaGVsaW5lIHdvdWxkIG5ldmVyCmJlIGRpcnR5LiBZZXMsIEl0
J3MgYWx3YXlzIHNhZmUuCk9rYXksIEkgYWdyZWUgd2UgbXVzdCBrZWVwIGNhY2hlLWxpbmUtYWxp
Z25lZC4gSSBjb21tZW50IGl0IGhlcmUsIGp1c3QKd29ycnkgc29tZSBkaXJ0eSBkcml2ZXJzIGNv
dWxkbid0IHdvcmsgd2l0aCB0aGUgImludmFsaWQgbWVjaGFuaXNtIgpiZWNhdXNlIG9mIHRoZSBD
UFUgZGF0YSBjb3JydXB0aW9uLCBhbmQgZGV2aWNlIGRhdGEgaW4gdGhlIGNhY2hlbGluZQppcyB1
c2VsZXNzLgoKPgo+IFRoZSBkb2N1bWVudGVkIEFQSSBpcyB0aGF0IHNoYXJpbmcgdGhlIGNhY2hl
IGxpbmUgaXMgbm90IGFsbG93ZWQKPiBhdCBhbGwsIHNvIGFueXRoaW5nIHRoYXQgd291bGQgb2Jz
ZXJ2ZSBhIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUKPiB0d28gaXMgYWxzbyBhIGJ1Zy4gT25lIGlk
ZWEgdGhhdCB3ZSBoYXZlIGNvbnNpZGVyZWQgYWxyZWFkeSBpcwo+IHRoYXQgd2UgY291bGQgb3Zl
cndyaXRlIHRoZSB1bnVzZWQgYml0cyBvZiB0aGUgY2FjaGVsaW5lIHdpdGgKPiBwb2lzb24gdmFs
dWVzIGFuZC9vciBtYXJrIHRoZW0gYXMgaW52YWxpZCB1c2luZyBLQVNBTiBmb3IgZGVidWdnaW5n
Cj4gcHVycG9zZXMsIHRvIGZpbmQgZHJpdmVycyB0aGF0IGFscmVhZHkgdmlvbGF0ZSB0aGlzLgo+
Cj4gICAgICAgQXJuZAoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
