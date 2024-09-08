Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0A9CD4F4C
	for <linux-snps-arc@archiver.kernel.org>; Sun,  8 Sep 2024 11:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6k9HGhDwgCT92HyWMmcdNgWzLdI9zjJk1xlKNMPgnp8=; b=I7uu/m6mUwCibdoQ/tY7Qw0Imd
	a/X6Fgp1byYEEqyhLqKFxOBEAP1gEO2tUa9enLZFEZfo1Pl4PsE6cspbmldPYXjm+rpbOsk5/lMy/
	k7fHJN4FqH6G0lN23QTm73nxh57qVBxmPvX60uH3OWIUKJ/ulvzFQKNjKIMgxlLTVmzHznY63pEQ3
	Ex9JKzRe4zWBl2s8olSRkaKPE8R8QWXq+gMIp4sDiWkvE02FTSciApLJ5aMpTlNKDLESV2Wjf62Jk
	cHeYCOk/MA0bc4nliBoybSSXIZar4sx6RI5z50mSxmINKNTu9BsMzFBg7bnbup7wtOsfug9acrrvA
	ixiu0Y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snG41-0000000GfLk-0ESk;
	Sun, 08 Sep 2024 11:26:41 +0000
Received: from flow4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snG3w-0000000GfJX-3i2h;
	Sun, 08 Sep 2024 11:26:39 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id 7520620010F;
	Sun,  8 Sep 2024 07:26:33 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Sun, 08 Sep 2024 07:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725794793;
	 x=1725801993; bh=XEUlxjTawgkGJUbuV5995m7w7A2+JrHLDxzMf66rOFU=; b=
	1RqsBYWnwT4FfoKwD8HOSHteOOT9ciPyjmBQqMyvcr6+a49w9ITDGHReCqlKQ2QA
	w6LflN5n1R32xrU1xq2pIQUhw2YtNSZPREepgs7fFh/JiqskWgBI2q1oyrafoAoX
	OXv3Od7eW2mwOR/prATgt5rOF/YnKFqclBTHKg1I7fgB/KzYIhNfna0/I1Kkkkix
	Cw/j32+Ac/ao6JT1NOKot7uC14h4ncceMxC0oG8lad9utiOysG+JubQG2QCO42FN
	aaB/C7qy6BW/s3Y/XAsoNS4kMzEF8v05z3j3XR2ciLA88taJPIrCv19JmVh4IYaC
	e/1tkYDVneKs0oixOgexAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725794793; x=
	1725801993; bh=XEUlxjTawgkGJUbuV5995m7w7A2+JrHLDxzMf66rOFU=; b=C
	dsqc3O9g9+P1uvJEQHGHAFH+WsHowmjhRVy+cqRNjQG++7x02Zs6YEtS3Z8WE9Q7
	aU7Iyt8RK34PG634m7GdOLdc65TjyLlQ1FMnVcQDrKU1vzx9ZRt7CF5ubdgXZ5hD
	LICkHzbR+VU5TW8gyNRRA+8tUrQ1gyDD4AgYcSft7m1DT4wa5iXfOq6TFoHseKlc
	ZKKjp2fzBKD4C5Vg6N/L2WyPaWaSk/D/xDvTo+QbGyz1c5LwQ598Z1zUm1qYi2TI
	Yo/X4zL4wxVl7PWyB6MPPrBNBLnV9cGyPZwCbCyxnslwXC+24EdDff0OvF6bpxbo
	vqgoQPXgllSGln8FDDRng==
X-ME-Sender: <xms:5ondZv4zT1mzhUMUTQzG10IJfddGHJ0zWNQriMXqeMVE9T6_YZ50HA>
    <xme:5ondZk5zjak4Ydo9XQEC5_iAquMrOd_atPoKQ96BVfMT2YYDx9vqgHiwWixrtNewg
    G1Ny6-v0uoneFUa_bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvghnugesrghl
    phhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuh
    igrdhorhhgrdhukhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthht
    oheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtth
    hopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghl
    lhgvrhhmrghnrdhiugdrrghupdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrh
    drtghomhdprhgtphhtthhopegthhhrihhsrdhtohhrvghksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:5ondZmeEGi7Zphdy-TIo3rqIOR8NdWAWLW97nTHVkixQm2hr7zi_lg>
    <xmx:5ondZgJWFhoAhESpgoV8HqH0WSt1SGQGzDYdrSWWUBYB0eOSXRYfyg>
    <xmx:5ondZjIv5G778Hr5ut3xkDDBdWEw4LkqLddMC19cVit9ESab8p1oRA>
    <xmx:5ondZpygjZgzfq9YzCe6vFMmqD7cPQFQugI3PiJsvCSf-xhZMXrz0w>
    <xmx:6YndZpZiu9HbuzT5oVUkok3yUEmNCf2gNYQHj65nIEn4Qe-iJ9a104zM>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 900D51C20065; Sun,  8 Sep 2024 07:26:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 08 Sep 2024 12:26:09 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, "Guo Ren" <guoren@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "Xuerui Wang" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Muchun Song" <muchun.song@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Shuah Khan" <shuah@kernel.org>, "Christoph Hellwig" <hch@infradead.org>,
 "Michal Hocko" <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 "Chris Torek" <chris.torek@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Message-Id: <53384dc9-38c9-4d05-bcde-a3552fbed7ac@app.fastmail.com>
In-Reply-To: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
Subject: Re: [PATCH RFC v3 0/2] mm: Introduce ADDR_LIMIT_47BIT personality flag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_042637_168409_B20EBC70 
X-CRM114-Status: GOOD (  16.07  )
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

CgrlnKgyMDI05bm0OeaciDXml6XkuZ3mnIgg5LiL5Y2IMTA6MTXvvIxDaGFybGllIEplbmtpbnPl
hpnpgZPvvJoKPiBTb21lIGFwcGxpY2F0aW9ucyByZWx5IG9uIHBsYWNpbmcgZGF0YSBpbiBmcmVl
IGJpdHMgYWRkcmVzc2VzIGFsbG9jYXRlZAo+IGJ5IG1tYXAuIFZhcmlvdXMgYXJjaGl0ZWN0dXJl
cyAoZWcuIHg4NiwgYXJtNjQsIHBvd2VycGMpIHJlc3RyaWN0IHRoZQo+IGFkZHJlc3MgcmV0dXJu
ZWQgYnkgbW1hcCB0byBiZSBsZXNzIHRoYW4gdGhlIDQ4LWJpdCBhZGRyZXNzIHNwYWNlLAo+IHVu
bGVzcyB0aGUgaGludCBhZGRyZXNzIHVzZXMgbW9yZSB0aGFuIDQ3IGJpdHMgKHRoZSA0OHRoIGJp
dCBpcyByZXNlcnZlZAo+IGZvciB0aGUga2VybmVsIGFkZHJlc3Mgc3BhY2UpLgo+Cj4gVGhlIHJp
c2N2IGFyY2hpdGVjdHVyZSBuZWVkcyBhIHdheSB0byBzaW1pbGFybHkgcmVzdHJpY3QgdGhlIHZp
cnR1YWwKPiBhZGRyZXNzIHNwYWNlLiBPbiB0aGUgcmlzY3YgcG9ydCBvZiBPcGVuSkRLIGFuIGVy
cm9yIGlzIHRocm93biBpZgo+IGF0dGVtcHRlZCB0byBydW4gb24gdGhlIDU3LWJpdCBhZGRyZXNz
IHNwYWNlLCBjYWxsZWQgc3Y1NyBbMV0uICBnb2xhbmcKPiBoYXMgYSBjb21tZW50IHRoYXQgc3Y1
NyBzdXBwb3J0IGlzIG5vdCBjb21wbGV0ZSwgYnV0IHRoZXJlIGFyZSBzb21lCj4gd29ya2Fyb3Vu
ZHMgdG8gZ2V0IGl0IHRvIG1vc3RseSB3b3JrIFsyXS4KPgo+IFRoZXNlIGFwcGxpY2F0aW9ucyB3
b3JrIG9uIHg4NiBiZWNhdXNlIHg4NiBkb2VzIGFuIGltcGxpY2l0IDQ3LWJpdAo+IHJlc3RyaWN0
aW9uIG9mIG1tYXAoKSBhZGRyZXNzIHRoYXQgY29udGFpbiBhIGhpbnQgYWRkcmVzcyB0aGF0IGlz
IGxlc3MKPiB0aGFuIDQ4IGJpdHMuCj4KPiBJbnN0ZWFkIG9mIGltcGxpY2l0bHkgcmVzdHJpY3Rp
bmcgdGhlIGFkZHJlc3Mgc3BhY2Ugb24gcmlzY3YgKG9yIGFueQo+IGN1cnJlbnQvZnV0dXJlIGFy
Y2hpdGVjdHVyZSksIHByb3ZpZGUgYSBmbGFnIHRvIHRoZSBwZXJzb25hbGl0eSBzeXNjYWxsCj4g
dGhhdCBjYW4gYmUgdXNlZCB0byBlbnN1cmUgYW4gYXBwbGljYXRpb24gd29ya3MgaW4gYW55IGFy
Yml0cmFyeSBWQQo+IHNwYWNlLiBBIHNpbWlsYXIgZmVhdHVyZSBoYXMgYWxyZWFkeSBiZWVuIGlt
cGxlbWVudGVkIGJ5IHRoZSBwZXJzb25hbGl0eQo+IHN5c2NhbGwgaW4gQUREUl9MSU1JVF8zMkJJ
VC4KPgo+IFRoaXMgZmxhZyB3aWxsIGFsc28gYWxsb3cgc2VlbWxlc3MgY29tcGF0aWJpbGl0eSBi
ZXR3ZWVuIGFsbAo+IGFyY2hpdGVjdHVyZXMsIHNvIGFwcGxpY2F0aW9ucyBsaWtlIEdvIGFuZCBP
cGVuSkRLIHRoYXQgdXNlIGJpdHMgaW4gYQo+IHZpcnR1YWwgYWRkcmVzcyBjYW4gcmVxdWVzdCB0
aGUgZXhhY3QgbnVtYmVyIG9mIGJpdHMgdGhleSBuZWVkIGluIGEKPiBnZW5lcmljIHdheS4gVGhl
IGZsYWcgY2FuIGJlIGNoZWNrZWQgaW5zaWRlIG9mIHZtX3VubWFwcGVkX2FyZWEoKSBzbwo+IHRo
YXQgdGhpcyBmbGFnIGRvZXMgbm90IGhhdmUgdG8gYmUgaGFuZGxlZCBpbmRpdmlkdWFsbHkgYnkg
ZWFjaAo+IGFyY2hpdGVjdHVyZS4gCgpUZXN0ZWQtYnk6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFu
Z0BmbHlnb2F0LmNvbT4KClRlc3RlZCBvbiBNSVBTIFZBIDQ4IHN5c3RlbSwgZml4ZWQgcG9pbnRl
ciB0YWdnaW5nIG9uIG1vempzIQoKVGhhbmtzIQoKWy4uLl0KLS0gCi0gSmlheHVuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
