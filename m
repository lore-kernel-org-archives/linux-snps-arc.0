Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33A7CE7AFB
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Sep 2024 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U/Hl9P1wQVJq6lFIUiUIX3Zxq5Os+6Q6V+P5cdXsRgg=; b=wBE40vmI2gBWAhYK5jkxoGB8rH
	TUNsgy0XJGHNcWBjPCz3ESYyu0sdizLrAD8dMVu3gyjuC6NY1ZqlsTrjCrqhLbgcuPUinmWomYT5L
	VQDfBMz5FhYs46ETeUqYTsA4RMe9L4bK+K2IN9ifMlmqaoDkD7kkxztM0hUW6Xx6s98ZO4gry48u4
	T8Kk9MRQunimzLV/2P7UmHihtykxvC5aVN7CtPB0qqjeUGxo04hdQYKGRKIXYZAm14lTito0Lazpe
	R9Fl/NJsl8EiVT+ODv5823o2bvOt46CPzRpkv6Gck10r667bGVUkWZHuBRs0rWCz7orgQli6ZL7pN
	l/stWd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smVxy-0000000BhiB-1LQl;
	Fri, 06 Sep 2024 10:13:22 +0000
Received: from flow5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smVhH-0000000BdY7-1VaE;
	Fri, 06 Sep 2024 09:56:09 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id AFD7B2002D6;
	Fri,  6 Sep 2024 05:56:04 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Sep 2024 05:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725616564;
	 x=1725623764; bh=spCdL3tE0yzwRJuzWoP/dh86M1NxHAaaOfguj/M3bzI=; b=
	Cma88D0g5A7fxF7e1V4mXGBjVHxirMssk0FBQK4EMQSGfMiy8f3dyAvI7/6AtwOO
	YlgJllHqtEY1khbMWztrp3oPt40NDjJ8BMGNKtqqEmVfPaujpnhFPkvWqUGQxl8c
	/2sMwk3DR8zPvU9L0cKnOiIRhobWNxb5t+HGLJOcjG6ojTfQDNGhu4fMhtzaZwos
	lK7fymt7/XY27ZqAK5m0zM5JPmNyD3nJQ8bbZ1bW9N9ZRZEgxtjz/o2OgNxr97Ia
	6yUnUFzOGylWbu7MeihxJR00a9yL82ng7KCYeQqYZpFaxBOAyZRb2gGcDEIXBt4N
	hs6L15qVpt/x6SHz2lvwNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725616564; x=
	1725623764; bh=spCdL3tE0yzwRJuzWoP/dh86M1NxHAaaOfguj/M3bzI=; b=Y
	gAPQauNE6VOg0WAPifu+oG5IiSAqrQA5hlf1szYIEejmGSMwas1zqtJyqaWuxUY8
	XUp4Iiff3woDjsCEpNo3Ovp6hVjfrJ4m+MxaKp85JPmZ5EAnaQ7sogz83cnKRbMB
	N6po9qOAKMy7yGwr4bCcQUQeA/0hS+vAYY7QMtgxtDXzq6W05ci3KwMv0b3oj1p7
	GZND9HyrwkPrRnb5yHeWBVKaJNL16/BdsXZnW1hUslxJtBm+yqi8NagtKQlkmvaF
	d5r/bn0SPtFIA139lN5cnU+I+OsmGV6ZdcI6K7xxx04PkF05+5daJhgLUNJyNSQD
	G5CFmU3NT6E2KPibGRmvA==
X-ME-Sender: <xms:s9HaZuN9kBIvipXumlTwAFLBqNZJH9lokz7mY4AGXhiNxhJc1pyyRA>
    <xme:s9HaZs-n2edA_zXthff5qvkMtWo_mAmI3y3aVpEklcrOLVxJRlkOoRpEhu8zxhVq5
    tWur9jkODPTcBqYmXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegthh
    hrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepuggr
    vhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmphgvsegvlhhlvghrmh
    grnhdrihgurdgruhdprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
    pdhrtghpthhtoheptghhrhhishdrthhorhgvkhesghhmrghilhdrtghomhdprhgtphhtth
    hopehmrghtthhsthekkeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:s9HaZlTFpHCabvrGwtGCuyj8UCP3chGy3ayy2lxa5II3HhJaGRzw4Q>
    <xmx:s9HaZuvoxAX-XNASrusd6JvdGpJcjnSu1u07F5gCi618fvKzOPKAuw>
    <xmx:s9HaZmcSAh24Cvm_B1doI2_Ar_s4Fg-8jkXrHW0LP8bvpbGktGy4TQ>
    <xmx:s9HaZi38RADCOkowGXyKAVN9AXuBWzLGcs6MGv1Hls0IxolFh4L6bg>
    <xmx:tNHaZttVEn21oLIo14eu01ANQj91lVyu4acUXhdplHJ6yJ6FwzJEMTmZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E5FF5222006F; Fri,  6 Sep 2024 05:56:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 06 Sep 2024 09:55:42 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>
Cc: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, shuah <shuah@kernel.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Michal Hocko" <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 "Chris Torek" <chris.torek@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Message-Id: <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
In-Reply-To: <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47 bits
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_025607_570593_3806C741 
X-CRM114-Status: GOOD (  12.42  )
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

T24gRnJpLCBTZXAgNiwgMjAyNCwgYXQgMDk6MTQsIEd1byBSZW4gd3JvdGU6Cj4gT24gRnJpLCBT
ZXAgNiwgMjAyNCBhdCAzOjE44oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3Jv
dGU6Cj4+Cj4+IEl0J3MgYWxzbyB1bmNsZWFyIHRvIG1lIGhvdyB3ZSB3YW50IHRoaXMgZmxhZyB0
byBpbnRlcmFjdCB3aXRoCj4+IHRoZSBleGlzdGluZyBsb2dpYyBpbiBhcmNoX2dldF9tbWFwX2Vu
ZCgpLCB3aGljaCBhdHRlbXB0cyB0bwo+PiBsaW1pdCB0aGUgZGVmYXVsdCBtYXBwaW5nIHRvIGEg
NDctYml0IGFkZHJlc3Mgc3BhY2UgYWxyZWFkeS4KPgo+IFRvIG9wdGltaXplIFJJU0MtViBwcm9n
cmVzcywgSSByZWNvbW1lbmQ6Cj4KPiBTdGVwIDE6IEFwcHJvdmUgdGhlIHBhdGNoLgo+IFN0ZXAg
MjogVXBkYXRlIEdvIGFuZCBPcGVuSkRLJ3MgUklTQy1WIGJhY2tlbmQgdG8gdXRpbGl6ZSBpdC4K
PiBTdGVwIDM6IFdhaXQgYXBwcm94aW1hdGVseSBzZXZlcmFsIGl0ZXJhdGlvbnMgZm9yIEdvICYg
T3BlbkpESwo+IFN0ZXAgNDogUmVtb3ZlIHRoZSA0Ny1iaXQgY29uc3RyYWludCBpbiBhcmNoX2dl
dF9tbWFwX2VuZCgpCgpJIHJlYWxseSB3YW50IHRvIGZpcnN0IHNlZSBhIHBsYXVzaWJsZSBleHBs
YW5hdGlvbiBhYm91dCB3aHkKUklTQy1WIGNhbid0IGp1c3QgaW1wbGVtZW50IHRoaXMgdXNpbmcg
YSA0Ny1iaXQgREVGQVVMVF9NQVBfV0lORE9XCmxpa2UgYWxsIHRoZSBvdGhlciBtYWpvciBhcmNo
aXRlY3R1cmVzICh4ODYsIGFybTY0LCBwb3dlcnBjNjQpLAplLmcuIHNvbWV0aGluZyBsaWtlIHRo
ZSBwYXRjaCBiZWxvdyAodW50ZXN0ZWQsIHByb2JhYmx5IHNsaWdodGx5Cndyb25nIGJ1dCBzaG93
IGlsbHVzdHJhdGUgbXkgcG9pbnQpLgoKICAgICBBcm5kCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmgKaW5kZXggODcwMmI4NzIxYTI3Li5kZTk4NjNiZTFlZmQgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaApAQCAtMjAsMTcgKzIwLDggQEAKICAqIG1tYXBfZW5kIDwgYWRkciwgYmVp
bmcgbW1hcF9lbmQgdGhlIHRvcCBvZiB0aGF0IGFkZHJlc3Mgc3BhY2UuCiAgKiBTZWUgRG9jdW1l
bnRhdGlvbi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QgZm9yIG1vcmUgZGV0YWlscy4KICAqLwot
I2RlZmluZSBhcmNoX2dldF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKQkJCVwKLSh7CQkJCQkJ
CQlcCi0JdW5zaWduZWQgbG9uZyBtbWFwX2VuZDsJCQkJCVwKLQl0eXBlb2YoYWRkcikgX2FkZHIg
PSAoYWRkcik7CQkJCVwKLQlpZiAoKF9hZGRyKSA9PSAwIHx8IGlzX2NvbXBhdF90YXNrKCkgfHwJ
CQlcCi0JICAgICgoX2FkZHIgKyBsZW4pID4gQklUKFZBX0JJVFMgLSAxKSkpCQkJXAotCQltbWFw
X2VuZCA9IFNUQUNLX1RPUF9NQVg7CQkJXAotCWVsc2UJCQkJCQkJXAotCQltbWFwX2VuZCA9IChf
YWRkciArIGxlbik7CQkJXAotCW1tYXBfZW5kOwkJCQkJCVwKLX0pCisjZGVmaW5lIGFyY2hfZ2V0
X21tYXBfZW5kKGFkZHIsIGxlbiwgZmxhZ3MpIFwKKwkJKCgoYWRkcikgPiBERUZBVUxUX01BUF9X
SU5ET1cpID8gVEFTS19TSVpFIDogREVGQVVMVF9NQVBfV0lORE9XKQogCiAjZGVmaW5lIGFyY2hf
Z2V0X21tYXBfYmFzZShhZGRyLCBiYXNlKQkJCQlcCiAoewkJCQkJCQkJXApAQCAtNDcsNyArMzgs
NyBAQAogfSkKIAogI2lmZGVmIENPTkZJR182NEJJVAotI2RlZmluZSBERUZBVUxUX01BUF9XSU5E
T1cgICAgIChVTCgxKSA8PCAoTU1BUF9WQV9CSVRTIC0gMSkpCisjZGVmaW5lIERFRkFVTFRfTUFQ
X1dJTkRPVyAgICAgKGlzX2NvbXBhdF90YXNrKCkgPyAoVUwoMSkgPDwgKE1NQVBfVkFfQklUUyAt
IDEpKSA6IFRBU0tfU0laRV8zMikKICNkZWZpbmUgU1RBQ0tfVE9QX01BWCAgICAgICAgICBUQVNL
X1NJWkVfNjQKICNlbHNlCiAjZGVmaW5lIERFRkFVTFRfTUFQX1dJTkRPVyAgICAgVEFTS19TSVpF
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1z
bnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj
Cg==
