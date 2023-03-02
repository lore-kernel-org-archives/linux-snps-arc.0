Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB20C6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrqq1YYHqpMc0HGMkk1nngPrSh8y9XutQoKZvFuUSKw=; b=nd6JXeg0LtGrio
	HngWpV0cgEGP9cebVVh7ghMpVfUaBxR8H6DcR425oQu2gl6NNmgF3OBZvCTbVeuXfyOqasvGHaK9D
	9VJt5PIhRxkPaVdHouKo1UrBWN3+sFqSk0kufUatjMBiQhNYp8hk+CWHzFOzHbseXFqr8cm7rqLds
	vEMGG5+K4V1bw+hGg78Wb/8kKU2zpFNNx2Vq08d8qR3eI4b4WW9BHk0ZYTYQoVOOlDU0h6mS5LMac
	VMzGXSWKESs9EfnUjKuU/0YaKv3VF60MWSiD82YCV/25sZIAwjT99S8fHvefaEWMOrGF6qeXwqee4
	EwdEz0c65J9+8gxt8b8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhNj-001zAy-NP; Thu, 02 Mar 2023 11:45:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhNi-001z9u-4h; Thu, 02 Mar 2023 11:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PHoXp6+7/Ivp8TZOu6tqpc5Wq/dN7ibmjBTE7vH9gt0=; b=mTkDgvVrGVR7BTuZzl61IrWEbw
	BvDoR3949Q/TPhfthSIvZ2nP4gtGQGfs1H6OwP0FbNk1/yNwLHkRX0JbQRqEs0a6Nek+R/Z2Yt8Cc
	cWEXrD1r7/a47Ap55NlK7nWWVoMeinxggknHF8YArt4o4m15WpqQ4GE4w7WZwxfONw/tR4BcIra7u
	KQv1IiTn837b7spo4s+D71isgsUGfR0qqtfM5nM55wFTRl11Gugi2wC38OHwuYipe14DUx5NjQf2d
	XvQ272BzWxtto0l50DA/t2UrXUMmLoKCNHnp91DepjRFcWISL/LG5FQMFfek78oV60q1ZUxsgjIk9
	5V5RdBWA==;
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pXgQP-00FFw5-2z;
	Thu, 02 Mar 2023 10:44:40 +0000
Received: by mail-qt1-f179.google.com with SMTP id r5so17493291qtp.4;
        Thu, 02 Mar 2023 02:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHoXp6+7/Ivp8TZOu6tqpc5Wq/dN7ibmjBTE7vH9gt0=;
        b=jjSKEXGE1R5kGyP80xW68Lu+1Lx/NApBqSrfHy+v9ZMLR2/o5O88PHHlkKlbjhK6Sg
         d0Tkxx5lgQ5rb6WxReKRtNWr1/pIc6gW4MnMDXtgrn/TQQ4Z5WszzK450iDo73hO38ZJ
         WqMqZ9BpDda9eDpkAuVvra7DrSn9gVi3F8fekZ94PMwqHJnQRi49y4x+rJA9Cyabr2HF
         vuhRt/3p9y5wiWuJ5a38P7roVftqriaDMyVY9gmfWliGwy51nPqYXOrgQwxsZMY2MPyG
         aoUzxjiEV0AJJqkpA6OUG5AuvV+gh2m6+3hiTjGWYXRqKAFCw30ovFOqL9Nqg4ygMKMs
         HO/A==
X-Gm-Message-State: AO0yUKXNeCxfkTaMcUgdIcY+j9CuDZUrbExuAR2DUFqDpGU1vPQwXULX
	4U0d9vT5TQjGBHHM6kdlQyJx7bJN50kJXg==
X-Google-Smtp-Source: AK7set8aj/19hbM54IRonOLyQAzq2qSAlWFJ5avF7/GhP3oX+76rad9hl4OXoG3yvbbArqMKE5eK5A==
X-Received: by 2002:a05:622a:cf:b0:3bf:be7d:b3e5 with SMTP id p15-20020a05622a00cf00b003bfbe7db3e5mr16851453qtw.41.1677753874966;
        Thu, 02 Mar 2023 02:44:34 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id x2-20020ac84a02000000b003b9a426d626sm9899150qtq.22.2023.03.02.02.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 02:44:34 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-536bbef1c5eso419116947b3.9;
        Thu, 02 Mar 2023 02:44:34 -0800 (PST)
X-Received: by 2002:a5b:1cf:0:b0:a43:52fe:c36f with SMTP id
 f15-20020a5b01cf000000b00a4352fec36fmr4318975ybp.7.1677753853997; Thu, 02 Mar
 2023 02:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
 <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com> <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
In-Reply-To: <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Mar 2023 11:44:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
Message-ID: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_104438_043197_0D2B4C23 
X-CRM114-Status: GOOD (  33.36  )
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

SGkgQWxleCwKCk9uIFRodSwgTWFyIDIsIDIwMjMgYXQgMTE6MDnigK9BTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+IE9uIDMvMi8yMyAxMDo0NywgR2VlcnQgVXl0dGVy
aG9ldmVuIHdyb3RlOgo+ID4gT24gVGh1LCBNYXIgMiwgMjAyMyBhdCAxMDozNeKAr0FNIEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPj4gVGhpcyBhbGwg
Y2FtZSB1cCBpbiB0aGUgY29udGV4dCBvZiBpbmNyZWFzaW5nIENPTU1BTkRfTElORV9TSVpFIGlu
IHRoZQo+ID4+IFJJU0MtViBwb3J0LiAgSW4gdGhlb3J5IHRoYXQncyBhIFVBQkkgYnJlYWssIGFz
IENPTU1BTkRfTElORV9TSVpFIGlzIHRoZQo+ID4+IG1heGltdW0gbGVuZ3RoIG9mIC9wcm9jL2Nt
ZGxpbmUgYW5kIHVzZXJzcGFjZSBjb3VsZCBzdGF0aWNseSByZWx5IG9uCj4gPj4gdGhhdCB0byBi
ZSBjb3JyZWN0Lgo+ID4+Cj4gPj4gVXN1YWxseSBJIHdvdWxkbid0IG1lc3MgYXJvdW5kIHdpdGgg
Y2hhbmdpbmcgdGhpcyBzb3J0IG9mIHRoaW5nLCBidXQKPiA+PiBQb3dlclBDIGluY3JlYXNlZCBp
dCB3aXRoIGE1OTgwZDA2NGZlMiAoInBvd2VycGM6IEJ1bXAgQ09NTUFORF9MSU5FX1NJWkUKPiA+
PiB0byAyMDQ4IikuICBUaGVyZSBhcmUgYWxzbyBhIGhhbmRmdWwgb2YgZXhhbXBsZXMgb2YgQ09N
TUFORF9MSU5FX1NJWkUKPiA+PiBpbmNyZWFzaW5nLCBidXQgdGhleSdyZSBmcm9tIGJlZm9yZSB0
aGUgVUFQSSBzcGxpdCBzbyBJJ20gbm90IHF1aXRlIHN1cmUKPiA+PiB3aGF0IHRoYXQgbWVhbnM6
IGU1YTZhMWM5MDk0OCAoInBvd2VycGM6IGRlcml2ZSBDT01NQU5EX0xJTkVfU0laRSBmcm9tCj4g
Pj4gYXNtLWdlbmVyaWMiKSwgNjg0ZDJmZDQ4ZTcxICgiW1MzOTBdIGtlcm5lbDogQXBwZW5kIHNj
cGRhdGEgdG8ga2VybmVsCj4gPj4gYm9vdCBjb21tYW5kIGxpbmUiKSwgMjIyNDI2ODFjZmY1ICgi
TUlQUzogRXh0ZW5kIENPTU1BTkRfTElORV9TSVpFIiksCj4gPj4gYW5kIDJiNzRiODU2OTNjNyAo
InNoOiBEZXJpdmUgQ09NTUFORF9MSU5FX1NJWkUgZnJvbQo+ID4+IGFzbS1nZW5lcmljL3NldHVw
LmguIikuCj4gPj4KPiA+PiBJdCBzZWVtcyB0byBtZSBsaWtlIENPTU1BTkRfTElORV9TSVpFIHJl
YWxseSBqdXN0IHNob3VsZG4ndCBoYXZlIGJlZW4KPiA+PiBwYXJ0IG9mIHRoZSB1YXBpIHRvIGJl
Z2luIHdpdGgsIGFuZCB1c2Vyc3BhY2Ugc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlCj4gPj4gL3By
b2MvY21kbGluZSBvZiB3aGF0ZXZlciBsZW5ndGggaXQgdHVybnMgb3V0IHRvIGJlLiAgSSBkb24n
dCBzZWUgYW55Cj4gPj4gcmVmZXJlbmNlcyB0byBDT01NQU5EX0xJTkVfU0laRSBhbnl3aGVyZSBi
dXQgTGludXggdmlhIGEgcXVpY2sgR29vZ2xlCj4gPj4gc2VhcmNoLCBidXQgdGhhdCdzIG5vdCBy
ZWFsbHkgZW5vdWdoIHRvIGNvbnNpZGVyIGl0IHVudXNlZCBvbiBteSBlbmQuCj4gPj4KPiA+PiBU
aGlzIGlzc3VlIHdhcyBhbHJlYWR5IGNvbnNpZGVyZWQgaW4gczM5MCBhbmQgdGhleSByZWFjaGVk
IHRoZSBzYW1lCj4gPj4gY29uY2x1c2lvbiBpbiBjb21taXQgNjIyMDIxY2Q2YzU2ICgiczM5MDog
bWFrZSBjb21tYW5kIGxpbmUKPiA+PiBjb25maWd1cmFibGUiKS4KPiA+Pgo+ID4+IFRoZSBmZWVk
YmFjayBvbiB0aGUgdjEgc2VlbWVkIHRvIGluZGljYXRlIHRoYXQgQ09NTUFORF9MSU5FX1NJWkUg
cmVhbGx5Cj4gPj4gc2hvdWxkbid0IGJlIHBhcnQgb2YgdWFwaSwgc28gdGhpcyBub3cgdG91Y2hl
cyBhbGwgdGhlIHBvcnRzLiAgSSd2ZQo+ID4+IHRyaWVkIHRvIHNwbGl0IHRoaXMgYWxsIG91dCBh
bmQgbGVhdmUgaXQgYmlzZWN0YWJsZSwgYnV0IEkgaGF2ZW4ndAo+ID4+IHRlc3RlZCBpdCBhbGwg
dGhhdCBhZ2dyZXNzaXZlbHkuCj4gPj4KPiA+PiBDaGFuZ2VzIHNpbmNlIHYzIDxodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMzAyMTQwNzQ5MjUuMjI4MTA2LTEtYWxleGdoaXRpQHJpdm9z
aW5jLmNvbS8+Ogo+ID4+ICogQWRkZWQgUkIvQUIKPiA+PiAqIEFkZGVkIGEgbWVudGlvbiB0byBj
b21taXQgNjIyMDIxY2Q2YzU2ICgiczM5MDogbWFrZSBjb21tYW5kIGxpbmUKPiA+PiAgICBjb25m
aWd1cmFibGUiKSBpbiB0aGUgY292ZXIgbGV0dGVyCj4gPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUh
Cj4gPgo+ID4gICBBcHBhcmVudGx5IHlvdSBmb3Jnb3QgdG8gYWRkIHlvdXIgb3duIFNvQj8KPgo+
IEkgZG8gbm90IGtub3csIHNob3VsZCBJPyBQYWxtZXIgZGlkIGFsbCB0aGUgd29yaywgSSBvbmx5
IGZpeGVkIDMgbWlub3IKPiB0aGluZ3MKCklmIHlvdSBhcmUgcGlja2luZyB1cCBwYXRjaGVzLCBh
bmQgc3VibWl0dGluZyB0aGVtIHRvIHNvbWVvbmUgZWxzZQpmb3IgdXBzdHJlYW0gaW5jbHVzaW9u
LCB5b3Ugc2hvdWxkIGFkZCB5b3VyIG93biBTb0IuCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0
Y2hlcy5yc3QjTDQxOQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
