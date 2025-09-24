Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15747CAC5A5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Sep 2025 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkU+HMa3YBRPgOghitpr9hvurpIDDx9wcuZvbB7j7lo=; b=BdJ6b3eyz1XNn6
	flYosA4Q6qlgc59dDUKmjpRohaxbqr4nItwn+Lo9YMWNr6XmXoX5Kn9ME+VAaUpbNZjCS1de4E3zP
	gj7KWLF+Yr/vpNg38/01VYjt1Em3bd0/5ep2OK8ocuje3giPltP3dpafRonjKL3Bvo3qxsK7lxQH8
	DCKsij8eFgvxKbhoPJKjvJeQ9Zm0jwKN/V0IjYTjxPF6WU5QVAMtxOca1Ou2ZQUANJD1XqOitf/gj
	BGf3hqvEJRoxrZ5GYtwiKKEEvuh1PI4PTZmtn1gLGuHDBinNtoMSB7fCj+EkitUZEiM5tHnSPYqNM
	8TrejG44cY1KTMoUCbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SC1-00000001dcX-3C7S;
	Wed, 24 Sep 2025 16:18:09 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SBz-00000001dZV-0nn1
	for linux-snps-arc@lists.infradead.org;
	Wed, 24 Sep 2025 16:18:08 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b61161dd37so57581cf.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 24 Sep 2025 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758730685; x=1759335485; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+elp/mgEwQHUPO2/veHl6cFeD7QMzkxV3mT27B/vMe0=;
        b=gakQqHPZzhqukTiSs1diXISX6JRML3Uep8JDB4dtVrMyHgJ6XQc/fAwHZ603wwMP0G
         LN0b0SMU9MvTm4gPW1OZuiQeK+OC7mC8hkOMJ57sa6I8uy1uOgJO8syErT8NliKjjisr
         jXnDTt1hH8O+wzDytxnGI7gmwu7lnOVTbUH2MolLqvzwVDDRlHm/hD6YqyyHDVMSXOin
         KEWCdc01bcqIcPAE9XbNBV7Agmzwcl9TY+W5+7EFmxsdGxO9K8KFeOLoDbvY6ml3Pz7W
         JgyPeESZBCIu4VExPHM7JCnm9wEH+AYaTUh2unL2VaygGGqpPIw53Ycad+Lt/Zi7T4HQ
         8JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758730685; x=1759335485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+elp/mgEwQHUPO2/veHl6cFeD7QMzkxV3mT27B/vMe0=;
        b=WCC0Hzr5tBoa6hWTH2r8j1qZBB17CboGgmcEYSDhS/sYu7c2cVwcWjyI6GLS7EVDFF
         PcxCXp4e69Oo783DrBPULNjd7kQd/Lvkb5TYokJFt8XsiZvilR39HJ6tXRCtWkcODFpJ
         ixKpPAZO6yKkItVgWzxuII72NbxjWPXWj86/aiOjukY+PyRjV7H2b0umJPp9AubOzODz
         jwgFkgRFfMbaQjzYkBNNl/RFL8R7nDGivQyXnNHqpJWZVTbWcaCDhodpByZXY1/MX0oM
         2k3v8fZGymhGpPhZeuOnE4NDLMI0rqxCXJbHdSIm34o29GZTpKnwdrTgVHzxOqSYBlIo
         14uw==
X-Forwarded-Encrypted: i=1; AJvYcCUOD7z0EI4QkMfE3quRFJ9wtSoLPV2ndub32a47909/LbNSc2WyY4hx56uhOjp9MbBGjQ/QUwoczkm2rc5R+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAA/1+AXoOZs8AMOL3nlhYO/Pc+URBfhxoleLfGnw81wwD5Z5N
	e5D0dVe8yAsbL6d5aaBJ7qskFa0C+pylgv/eKqRGd0hU5yUnz2bFmCc3J7n6p49pEALIgorl/kc
	KMvrZAtQh/+QUNmgSHrdL/CBU/2YyuZ8=
X-Gm-Gg: ASbGnctht7ya3tJame38PiWkqHPUaG8mMr6nCuRCQ1U8ejz0pWTTiu68+xor8PnB2S7
	LBYsFBNt9I7SGNbUumY1PlY6FKm1tWkRk25jt7m2gAR+THSyX1uelLiZ7YF5c3u5qLnO3vID24R
	plLNMfmYVk8eV0MVzpfy9DI7C4PAeg4TQJwWNl4JNZkkUY4PrRdO3iVN3NeI08+D0UXhzB2gFHB
	XAu/dvuuF2fc90IJpsROywDHoXXqyBGvZjRUlS/
X-Google-Smtp-Source: AGHT+IHrjx0XfB3NQHdqBt66Ox1dwY4oj3I0wMxztSwqqFAAkQnhEkK0QBLdnresO+RuCvDJitimjmBRn2YZHsgZxpk=
X-Received: by 2002:a05:622a:3d2:b0:4d9:ea03:74f8 with SMTP id
 d75a77b69052e-4da473535b8mr6186491cf.16.1758730685377; Wed, 24 Sep 2025
 09:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <ffbf1a04-047d-4787-ac1e-f5362e1ca600@csgroup.eu>
In-Reply-To: <ffbf1a04-047d-4787-ac1e-f5362e1ca600@csgroup.eu>
From: Alexander Patrakov <patrakov@gmail.com>
Date: Thu, 25 Sep 2025 00:17:39 +0800
X-Gm-Features: AS18NWB-xeGoRDKYPj3kUYXUnKXLhFMFvvc0QyoLpOeKcP1DsD-enKeBhlulfsI
Message-ID: <CAN_LGv3Opj9RW0atfXODy-Epn++5mt_DLEi-ewxR9Me5x46Bkg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_091807_234681_34035362 
X-CRM114-Status: GOOD (  20.76  )
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

T24gVHVlLCBTZXAgMjMsIDIwMjUgYXQgODoyMuKAr1BNIENocmlzdG9waGUgTGVyb3kKPGNocmlz
dG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4KPgo+Cj4gTGUgMTMvMDkvMjAyNSDDoCAw
MjozNywgQXNrYXIgU2FmaW4gYSDDqWNyaXQgOgo+ID4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291
dmVudCBkZSBjb3VycmllcnMgZGUgc2FmaW5hc2thckBnbWFpbC5jb20uIETDqWNvdXZyZXogcG91
cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOgIGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5k
ZXJJZGVudGlmaWNhdGlvbiBdCj4gPgo+ID4gSW50cm8KPiA+ID09PT0KPiA+IFRoaXMgcGF0Y2hz
ZXQgcmVtb3ZlcyBjbGFzc2ljIGluaXRyZCAoaW5pdGlhbCBSQU0gZGlzaykgc3VwcG9ydCwKPiA+
IHdoaWNoIHdhcyBkZXByZWNhdGVkIGluIDIwMjAuCj4gPiBJbml0cmFtZnMgc3RpbGwgc3RheXMs
IGFuZCBSQU0gZGlzayBpdHNlbGYgKGJyZCkgc3RpbGwgc3RheXMsIHRvby4KPiA+IGluaXQvZG9f
bW91bnRzKiBhbmQgaW5pdC8qaW5pdHJhbWZzKiBhcmUgbGlzdGVkIGluIFZGUyBlbnRyeSBpbgo+
ID4gTUFJTlRBSU5FUlMsIHNvIEkgdGhpbmsgdGhpcyBwYXRjaHNldCBzaG91bGQgZ28gdGhyb3Vn
aCBWRlMgdHJlZS4KPiA+IFRoaXMgcGF0Y2hzZXQgdG91Y2hzIGV2ZXJ5IHN1YmRpcmVjdG9yeSBp
biBhcmNoLywgc28gSSB0ZXN0ZWQgaXQKPiA+IG9uIDggKCEhISkgYXJjaHMgaW4gUWVtdSAoc2Vl
IGRldGFpbHMgYmVsb3cpLgo+ID4gV2FybmluZzogdGhpcyBwYXRjaHNldCByZW5hbWVzIENPTkZJ
R19CTEtfREVWX0lOSVRSRCAoISEhKSB0byBDT05GSUdfSU5JVFJBTUZTCj4gPiBhbmQgQ09ORklH
X1JEXyogdG8gQ09ORklHX0lOSVRSQU1GU19ERUNPTVBSRVNTXyogKGZvciBleGFtcGxlLAo+ID4g
Q09ORklHX1JEX0daSVAgdG8gQ09ORklHX0lOSVRSQU1GU19ERUNPTVBSRVNTX0daSVApLgo+ID4g
SWYgeW91IHN0aWxsIHVzZSBpbml0cmQsIHNlZSBiZWxvdyBmb3Igd29ya2Fyb3VuZC4KPgo+IEFw
b2xvZ2lzZSBpZiBteSBxdWVzdGlvbiBsb29rcyBzdHVwaWQsIGJ1dCBJJ20gdXNpbmcgUUVNVSBm
b3IgdmFyaW91cwo+IHRlc3RzLCBhbmQgdGhlIHdheSBRRU1VIGlzIHN0YXJ0ZWQgaXMgc29tZXRo
aW5nIGxpa2U6Cj4KPiBxZW11LXN5c3RlbS1wcGMgLWtlcm5lbCAuL3ZtbGludXggLWNwdSBnNCAt
TSBtYWM5OSAtaW5pdHJkCj4gLi9xZW11L3Jvb3Rmcy5jcGlvLmd6Cj4KPiBJIHdhcyB0aGVyZWZv
cmUgZXhwZWN0aW5nIChhbmQgZmVhcmluZykgaXQgdG8gZmFpbCB3aXRoIHlvdXIgc2VyaWVzCj4g
YXBwbGllZCwgYnV0IHN1cnByaXNpbmdseSBpdCBzdGlsbCB3b3Jrcy4KPgo+IFRoZXJlZm9yZSBp
cyBpdCByZWFsbHkgaW5pdHJkIHlvdSBhcmUgcmVtb3Zpbmcgb3IganVzdCBzb21lIGNvcm5lciBj
YXNlCj4gPyBJZiBpdCBpcyByZWFsbHkgaW5pdHJkLCB0aGVuIGhvdyBkb2VzIFFFTVUgc3RpbGwg
d29yayB3aXRoIHRoYXQKPiAtaW5pdHJkIHBhcmFtZXRlciA/CgpUaGUgUUVNVSAtaW5pdHJkIHBh
cmFtZXRlciBpcyBhIG1pc25vbWVyLiBJdCBjYW4gYmUgdXNlZCB0byBwYXNzIGFuCmluaXRyZCBv
ciBhbiBpbml0cmFtZnMsIGFuZCB0aGUga2VybmVsIGF1dG9tYXRpY2FsbHkgZmlndXJlcyBvdXQg
d2hhdAppdCBpcy4gV2hhdCB5b3UgYXJlIHBhc3NpbmcgaXMgYW4gaW5pdHJhbWZzIChhIGd6aXBw
ZWQgY3BpbyBhcmNoaXZlCndpdGggYWxsIHRoZSBmaWxlcyksIHdoaWNoIGlzIGEgbW9kZXJuIGFu
ZCBzdXBwb3J0ZWQgdXNlIGNhc2UuCgotLSAKQWxleGFuZGVyIFBhdHJha292CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
