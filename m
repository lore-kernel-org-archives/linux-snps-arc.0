Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED02C7EE22
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 May 2023 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZXk2ozSbJHiVnP+9zN1Qtk1hHIg0C6bqe4ISVP2Gwo=; b=yUZG8ela6IXgtu
	Ld2O4QGMNmsvuEnvRv2annc4zfTPUuL1X7Za5/b/Ys6f2v06681wMmvtMcNF3njNzyJf+FF6TUFiN
	WM2XFhVczlNeZZ6DLCFgFxX1jvGKBlsT0MXnvf3jBolhLlgbGKFUJJcshfef5UWzrIin/d3yG/ooH
	oCNQQDuHLDEUISczJjity0KSKTe54XryqVcoeoDHCZJFqF3d6hSL/oz9QOJP4Iwf5yz8W1PS8gpcW
	wFKJEydhQD7Q8leW6+PYpLp/IKGM5BUkihZt/ueqJlSDdDdZJRXE3d07KJ+ea2bOOoH739OAQjgbG
	MQYwHsrJs2tjUdrpJ1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvLO-00AyKD-09;
	Fri, 05 May 2023 13:19:30 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvLI-00AyJ0-2i;
	Fri, 05 May 2023 13:19:26 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1A10F5802A0;
	Fri,  5 May 2023 09:19:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 05 May 2023 09:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683292759; x=1683299959; bh=MFewdMftG+wRD887OcQ41hQs0awPz56T0ru
	yGnj8ABI=; b=T7QiYreOPC+QycowzVZsUb+Flt5SaOjHFxAhKjqZsP+nsbKyqVd
	vQ8eowoEYwNI/GU+ISyjC+jWPEKamuy6X2bmGmXoFQmBFMRt3DPTZF7imVRis0gr
	S0EkyyDbQvtLD7pfZ4AsHyrYk42NDSyf8/wa7V9JGjoeIM+dclks9qkVsfuCYS36
	2bnobzF6Lg7r4sP9JfGrvCZy6bK7TL5qDUup6dDDozkhtlDKoL2JENn8cqmA5ZJ5
	wLu4/Si0kCVvWmQxVaYqYa+bPXXPogECh5ZRpy0s2bQVgjpqCgavDgb5K4Sf79fl
	Z2ACYtb7nNPJlBQY7RKS+i0yrfAvSYbn6sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683292759; x=1683299959; bh=MFewdMftG+wRD887OcQ41hQs0awPz56T0ru
	yGnj8ABI=; b=FVvu2kHfPB+goofUSO7GBQXw9iAuEK1luvy6mN9DIT3CnY67Gls
	0KZVLaa6ELu1958ejxqPitibsxtjnQdtVNl7Z4DIo/7t6vSCqKnMSbKFtiZxUfg8
	SuTynEk2oMcUtF9nJJbJg0GYURVCU7bPEPfG8kEUYCku0K859h+BHBVlobnzbNVb
	9jCOuQHGR9JdwHKNFMPcOBCnbMbqE970CGlmaHJPbDGFzyO5if6gbd+OUkaHxy+L
	frNzAleO1fKFLe9X7xNq2nNbq2hrGATg6TTB1yBWoA0Wjb4XH3SHavwUomASSa1B
	aF2LKjYsYglP/xYL6ASj4zNf9qShE/HNiUg==
X-ME-Sender: <xms:UwJVZOh9cnZIXMM77LhNvXoz2YNii-arffCBI32Pq_fv4QfUTdVISg>
    <xme:UwJVZPAntNX3cn4OGLtqo2LRLlqkpl7Dvxks5UPOgyYyhnzhUynPY4VJ3y3azSULF
    _Z-HMCpBmE7SFSlVlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:UwJVZGH5NsIuOroPMeDuiba-Tn1p718Jzhmp9sTCmS-1lOWUaiFtVQ>
    <xmx:UwJVZHTAxF0WKn8MsTwRzrxqsy1jTv31MgcN7ZNnDyiETst0t2wtOQ>
    <xmx:UwJVZLzt4fDtGxTef6RbmcqquDaW2xXV0M3lt4aM-O0fppZufkssOQ>
    <xmx:VwJVZHhc7KCJPgnStXUQtZd0bp63LSI-wEqxVbh0vya0G4fcoSCVFw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 110CDB60089; Fri,  5 May 2023 09:19:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
In-Reply-To:  <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-10-arnd@kernel.org>
 <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
Date: Fri, 05 May 2023 15:18:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>
Cc: linux-kernel@vger.kernel.org, "Vineet Gupta" <vgupta@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Brian Cain" <bcain@quicinc.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>,
 "Robin Murphy" <robin.murphy@arm.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional
 DMA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_061925_248271_BA805314 
X-CRM114-Status: GOOD (  27.33  )
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

T24gRnJpLCBNYXkgNSwgMjAyMywgYXQgMDc6NDcsIEd1byBSZW4gd3JvdGU6Cj4gT24gTW9uLCBN
YXIgMjcsIDIwMjMgYXQgODoxNeKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4g
d3JvdGU6Cgo+Pgo+PiByaXNjdiBhbHNvIGludmFsaWRhdGVzIHRoZSBjYWNoZXMgYmVmb3JlIHRo
ZSB0cmFuc2Zlciwgd2hpY2ggZG9lcwo+PiBub3QgYXBwZWFyIHRvIHNlcnZlIGFueSBwdXJwb3Nl
Lgo+IFllcywgd2UgY2FuJ3QgZ3VhcmFudGVlIHRoZSBDUFUgcHJlLWxvYWQgY2FjaGUgbGluZXMg
cmFuZG9tbHkgZHVyaW5nCj4gZG1hIHdvcmtpbmcuCj4KPiBCdXQgSSd2ZSB0d28gcHVycG9zZXMg
dG8ga2VlcCBpbnZhbGlkYXRlcyBiZWZvcmUgZG1hIHRyYW5zZmVyOgo+ICAtIFdlIGNsZWFybHkg
dGVsbCB0aGUgQ1BVIHRoZXNlIGNhY2hlIGxpbmVzIGFyZSBpbnZhbGlkLiBUaGUgY2FjaGluZwo+
IGFsZ29yaXRobSB3b3VsZCB1c2UgdGhlc2UgaW52YWxpZCBzbG90cyBmaXJzdCBpbnN0ZWFkIG9m
IHJlcGxhY2luZwo+IHZhbGlkIG9uZXMuCj4gIC0gSW52YWxpZGF0aW5nIGlzIHZlcnkgY2hlYXAu
IEFjdHVhbGx5LCBmbHVzaCBhbmQgY2xlYW4gaGF2ZSB0aGUgc2FtZQo+IHBlcmZvcm1hbmNlIGlu
IG91ciBtYWNoaW5lLgoKVGhlIG1haW4gcHVycG9zZSBvZiB0aGUgc2VyaWVzIHdhcyB0byBnZXQg
Y29uc2lzdGVudCBiZWhhdmlvciBvbgphbGwgbWFjaGluZXMsIHNvIEkgcmVhbGx5IGRvbid0IHdh
bnQgYSBjdXN0b20gb3B0aW1pemF0aW9uIG9uCm9uZSBhcmNoaXRlY3R1cmUuIFlvdSBtYWtlIGEg
Z29vZCBwb2ludCBhYm91dCBjYWNoZWxpbmUgcmV1c2UKYWZ0ZXIgaW52YWxpZGF0aW9uLCBidXQg
aWYgd2UgZG8gdGhhdCwgSSdkIHN1Z2dlc3QgZG9pbmcgdGhpcwphY3Jvc3MgYWxsIGFyY2hpdGVj
dHVyZXMuCgo+IFNvLCBob3cgYWJvdXQ6Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9k
bWEtbm9uY29oZXJlbnQuYyBiL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiBpbmRl
eCBkOTE5ZWZhYjZlYmEuLjJjNTJmYmMxNTA2NCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21t
L2RtYS1ub25jb2hlcmVudC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQu
Ywo+IEBAIC0yMiw4ICsyMiw2IEBAIHZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKHBoeXNf
YWRkcl90IHBhZGRyLCBzaXplX3Qgc2l6ZSwKPiAgICAgICAgICAgICAgICAgQUxUX0NNT19PUChj
bGVhbiwgdmFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBETUFfRlJPTV9ERVZJQ0U6Cj4gLSAgICAgICAgICAg
ICAgIEFMVF9DTU9fT1AoY2xlYW4sIHZhZGRyLCBzaXplLCByaXNjdl9jYm9tX2Jsb2NrX3NpemUp
Owo+IC0gICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRE1BX0JJRElSRUNUSU9O
QUw6Cj4gICAgICAgICAgICAgICAgIEFMVF9DTU9fT1AoZmx1c2gsIHZhZGRyLCBzaXplLCByaXNj
dl9jYm9tX2Jsb2NrX3NpemUpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKClRoaXMgaXMgc29t
ZXRoaW5nIHdlIGNhbiBjb25zaWRlci4gVW5mb3J0dW5hdGVseSwgdGhpcyBpcyBzb21ldGhpbmcK
dGhhdCBubyBhcmNoaXRlY3R1cmUgKGV4Y2VwdCBwYS1yaXNjLCB3aGljaCBoYXMgb3RoZXIgcHJv
YmxlbXMpCmRvZXMgYXQgdGhlIG1vbWVudCwgc28gd2UnZCBwcm9iYWJseSBuZWVkIHRvIGhhdmUg
YSBwcm9wZXIgZGViYXRlCmFib3V0IHRoaXMuCgpXZSBhbHJlYWR5IGhhdmUgdHdvIGNvbmZsaWN0
aW5nIHdheXMgdG8gaGFuZGxlIERNQV9GUk9NX0RFVklDRSwKZWl0aGVyIGludmFsaWRhdGUvaW52
YWxpZGF0ZSwgb3IgY2xlYW4vaW52YWxpZGF0ZS4gSSBjYW4gc2VlCnRoYXQgZmx1c2gvaW52YWxp
ZGF0ZSBtYXkgYmUgYSBzZW5zaWJsZSBvcHRpb24gYXMgd2VsbCwgYnV0IEknZAp3YW50IHRvIGhh
dmUgdGhhdCBkaXNjdXNzaW9uIGFmdGVyIHRoZSBzZXJpZXMgaXMgY29tcGxldGUsIHNvCndlIGNh
biBjb21lIHRvIGEgZ2VuZXJpYyBzb2x1dGlvbiB0aGF0IGhhcyB0aGUgc2FtZSBkb2N1bWVudGVk
CmJlaGF2aW9yIGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcy4KCkluIHBhcnRpY3VsYXIsIGlmIHdl
IGVuZCB1cCBtb3ZpbmcgYXJtNjQgYW5kIHJpc2N2IGJhY2sgdG8gdGhlCnRyYWRpdGlvbmFsIGlu
dmFsaWRhdGUvaW52YWxpZGF0ZSBmb3IgRE1BX0ZST01fREVWSUNFIGFuZApkb2N1bWVudCB0aGF0
IGRyaXZlciBtdXN0IG5vdCByZWx5IG9uIGJ1ZmZlcnMgZ2V0dGluZyBjbGVhbmVkCmJlZm9yZSBh
IHBhcnRpYWwgRE1BX0ZST01fREVWSUNFLCB0aGUgcXVlc3Rpb24gYmV0d2VlbiBjbGVhbgpvciBm
bHVzaCBiZWNvbWVzIG1vb3QgYXMgd2VsbC4KCj4gQEAgLTQyLDcgKzQwLDcgQEAgdm9pZCBhcmNo
X3N5bmNfZG1hX2Zvcl9jcHUocGh5c19hZGRyX3QgcGFkZHIsIHNpemVfdCBzaXplLAo+ICAgICAg
ICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRE1BX0ZST01fREVWSUNFOgo+ICAgICAg
ICAgY2FzZSBETUFfQklESVJFQ1RJT05BTDoKPiAgICAgICAgICAgICAgICAgLyogSSdtIG5vdCBz
dXJlIGFsbCBkcml2ZXJzIGhhdmUgZ3VhcmFudGVlZCBjYWNoZWxpbmUKPiBhbGlnbm1lbnQuIElm
IG5vdCwgdGhpcyBpbnZhbCB3b3VsZCBjYXVzZSBwcm9ibGVtcyAqLwo+IC0gICAgICAgICAgICAg
ICBBTFRfQ01PX09QKGZsdXNoLCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsK
PiArICAgICAgICAgICAgICAgQUxUX0NNT19PUChpbnZhbCwgdmFkZHIsIHNpemUsIHJpc2N2X2Ni
b21fYmxvY2tfc2l6ZSk7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwoKVGhpcyBpcyBteSBvcmln
aW5hbCBwYXRjaCwgYW5kIEkgd291bGQgbm90IG1peCBpdCB3aXRoIHRoZSBvdGhlcgpjaGFuZ2Uu
IFRoZSBwcm9ibGVtIHdpdGggbm9uLWFsaWduZWQgRE1BX0JJRElSRUNUSU9OQUwgYnVmZmVycyBp
bgppcyB0aGF0IGJvdGggZmx1c2ggYW5kIGludmFsIHdvdWxkIGJlIHdyb25nIGlmIHlvdSBnZXQg
c2ltdWx0YW5lb3VzCndyaXRlcyBmcm9tIGRldmljZSBhbmQgY3B1IHRvIHRoZSBzYW1lIGNhY2hl
IGxpbmUsIHNvIHRoZXJlIGlzCm5vIHdheSB0byB3aW4gdGhpcy4gVXNpbmcgaW52YWwgaW5zdGVh
ZCBvZiBmbHVzaCB3b3VsZCBhdCBsZWFzdAp3b3JrIGlmIHRoZSBDUFUgZGF0YSBpbiB0aGUgY2Fj
aGVsaW5lIGlzIHJlYWQtb25seSBmcm9tIHRoZSBDUFUsCnNvIHRoYXQgc2VlbXMgYmV0dGVyIHRo
YW4gc29tZXRoaW5nIHRoYXQgaXMgYWx3YXlzIHdyb25nLgoKVGhlIGRvY3VtZW50ZWQgQVBJIGlz
IHRoYXQgc2hhcmluZyB0aGUgY2FjaGUgbGluZSBpcyBub3QgYWxsb3dlZAphdCBhbGwsIHNvIGFu
eXRoaW5nIHRoYXQgd291bGQgb2JzZXJ2ZSBhIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUKdHdvIGlz
IGFsc28gYSBidWcuIE9uZSBpZGVhIHRoYXQgd2UgaGF2ZSBjb25zaWRlcmVkIGFscmVhZHkgaXMK
dGhhdCB3ZSBjb3VsZCBvdmVyd3JpdGUgdGhlIHVudXNlZCBiaXRzIG9mIHRoZSBjYWNoZWxpbmUg
d2l0aApwb2lzb24gdmFsdWVzIGFuZC9vciBtYXJrIHRoZW0gYXMgaW52YWxpZCB1c2luZyBLQVNB
TiBmb3IgZGVidWdnaW5nCnB1cnBvc2VzLCB0byBmaW5kIGRyaXZlcnMgdGhhdCBhbHJlYWR5IHZp
b2xhdGUgdGhpcy4KCiAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
