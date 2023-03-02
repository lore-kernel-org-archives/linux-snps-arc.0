Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACABC6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJGazEBYgRJMk7HxkMepnXtBZFreUy5YzLhLghz8ynk=; b=yAlatOKl5TxuqJ
	FhLzk082IfNH/pSiC2BtTk9Wt7KZ8UO7xLW7j5JHQXOPYpc567xkQ7FTsao5flkOyJyoxsvzrLfsd
	lBkLpEyu9Vig7Lgs3PxM5qpSQ5BwUnNs4dEf42/id2VzGEow8KRdcTdNVz3AOhzEq9pKhZoFw12iA
	/vKnY6Dl7CWzKYdg5JW7jxBMpxctCX9oo6YHl/oHMkpaQRRSmEr3oAiPyJ74FI/CiAVFD+MkSMcB5
	tR3Ha87M81qfql2MtjoKvfmWTLrmQ86yICyE8x6xK6QUmb1IPG/d/jkXFNpGnTQ0ONiFPo8+QqQof
	BWGwbXLkcevz0rxuWDxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhNv-001zGP-4i; Thu, 02 Mar 2023 11:46:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhNr-001zEa-Rg; Thu, 02 Mar 2023 11:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wVcmDYmLi7wesoCFZzZeg+XCMdi4qdsbcapM8qomw2g=; b=rS89R886NP+IzOaxgq+duUtI9X
	BP67fHZPe//Rdk07/ijogYezWefDu1lcQd5s3qOetT4uRmdryLIBAnZU/ZRbDIuVeQoqDkvdlItRp
	0JRB/WcaxbQksm/czg2EtXOepWKthEFv2f69WfVHar6zAyqMYyN2nCuvQ8ax6dEUG7Krgkpo9O0Jp
	8houb23ADvTq2ks4NGRTLsUs7ZVej7BsxhMLiIx89ChizxHW8WZTEcGuayzFlpRzI2IVWhoc4kpil
	1j15X1GqmSdQf6pCVjWiqTS9IApaD/TSNLorRBXYUYK4d0z9R5d5ylBKCB9WpSEM8cn6yvdnbGaVQ
	QBGAYlAA==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pXgRv-00FG6U-1Z;
	Thu, 02 Mar 2023 10:46:14 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 75C8960014;
	Thu,  2 Mar 2023 10:45:54 +0000 (UTC)
Message-ID: <5712b56e-e2a7-c1d2-081c-bcbecdbeffb5@ghiti.fr>
Date: Thu, 2 Mar 2023 11:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
 <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
 <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
 <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_104611_859153_1079D870 
X-CRM114-Status: GOOD (  18.36  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Ck9uIDMvMi8yMyAxMTo0NCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEFsZXgsCj4K
PiBPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDExOjA54oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4
QGdoaXRpLmZyPiB3cm90ZToKPj4gT24gMy8yLzIzIDEwOjQ3LCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6Cj4+PiBPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDEwOjM14oCvQU0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPj4+PiBUaGlzIGFsbCBjYW1lIHVw
IGluIHRoZSBjb250ZXh0IG9mIGluY3JlYXNpbmcgQ09NTUFORF9MSU5FX1NJWkUgaW4gdGhlCj4+
Pj4gUklTQy1WIHBvcnQuICBJbiB0aGVvcnkgdGhhdCdzIGEgVUFCSSBicmVhaywgYXMgQ09NTUFO
RF9MSU5FX1NJWkUgaXMgdGhlCj4+Pj4gbWF4aW11bSBsZW5ndGggb2YgL3Byb2MvY21kbGluZSBh
bmQgdXNlcnNwYWNlIGNvdWxkIHN0YXRpY2x5IHJlbHkgb24KPj4+PiB0aGF0IHRvIGJlIGNvcnJl
Y3QuCj4+Pj4KPj4+PiBVc3VhbGx5IEkgd291bGRuJ3QgbWVzcyBhcm91bmQgd2l0aCBjaGFuZ2lu
ZyB0aGlzIHNvcnQgb2YgdGhpbmcsIGJ1dAo+Pj4+IFBvd2VyUEMgaW5jcmVhc2VkIGl0IHdpdGgg
YTU5ODBkMDY0ZmUyICgicG93ZXJwYzogQnVtcCBDT01NQU5EX0xJTkVfU0laRQo+Pj4+IHRvIDIw
NDgiKS4gIFRoZXJlIGFyZSBhbHNvIGEgaGFuZGZ1bCBvZiBleGFtcGxlcyBvZiBDT01NQU5EX0xJ
TkVfU0laRQo+Pj4+IGluY3JlYXNpbmcsIGJ1dCB0aGV5J3JlIGZyb20gYmVmb3JlIHRoZSBVQVBJ
IHNwbGl0IHNvIEknbSBub3QgcXVpdGUgc3VyZQo+Pj4+IHdoYXQgdGhhdCBtZWFuczogZTVhNmEx
YzkwOTQ4ICgicG93ZXJwYzogZGVyaXZlIENPTU1BTkRfTElORV9TSVpFIGZyb20KPj4+PiBhc20t
Z2VuZXJpYyIpLCA2ODRkMmZkNDhlNzEgKCJbUzM5MF0ga2VybmVsOiBBcHBlbmQgc2NwZGF0YSB0
byBrZXJuZWwKPj4+PiBib290IGNvbW1hbmQgbGluZSIpLCAyMjI0MjY4MWNmZjUgKCJNSVBTOiBF
eHRlbmQgQ09NTUFORF9MSU5FX1NJWkUiKSwKPj4+PiBhbmQgMmI3NGI4NTY5M2M3ICgic2g6IERl
cml2ZSBDT01NQU5EX0xJTkVfU0laRSBmcm9tCj4+Pj4gYXNtLWdlbmVyaWMvc2V0dXAuaC4iKS4K
Pj4+Pgo+Pj4+IEl0IHNlZW1zIHRvIG1lIGxpa2UgQ09NTUFORF9MSU5FX1NJWkUgcmVhbGx5IGp1
c3Qgc2hvdWxkbid0IGhhdmUgYmVlbgo+Pj4+IHBhcnQgb2YgdGhlIHVhcGkgdG8gYmVnaW4gd2l0
aCwgYW5kIHVzZXJzcGFjZSBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUKPj4+PiAvcHJvYy9jbWRs
aW5lIG9mIHdoYXRldmVyIGxlbmd0aCBpdCB0dXJucyBvdXQgdG8gYmUuICBJIGRvbid0IHNlZSBh
bnkKPj4+PiByZWZlcmVuY2VzIHRvIENPTU1BTkRfTElORV9TSVpFIGFueXdoZXJlIGJ1dCBMaW51
eCB2aWEgYSBxdWljayBHb29nbGUKPj4+PiBzZWFyY2gsIGJ1dCB0aGF0J3Mgbm90IHJlYWxseSBl
bm91Z2ggdG8gY29uc2lkZXIgaXQgdW51c2VkIG9uIG15IGVuZC4KPj4+Pgo+Pj4+IFRoaXMgaXNz
dWUgd2FzIGFscmVhZHkgY29uc2lkZXJlZCBpbiBzMzkwIGFuZCB0aGV5IHJlYWNoZWQgdGhlIHNh
bWUKPj4+PiBjb25jbHVzaW9uIGluIGNvbW1pdCA2MjIwMjFjZDZjNTYgKCJzMzkwOiBtYWtlIGNv
bW1hbmQgbGluZQo+Pj4+IGNvbmZpZ3VyYWJsZSIpLgo+Pj4+Cj4+Pj4gVGhlIGZlZWRiYWNrIG9u
IHRoZSB2MSBzZWVtZWQgdG8gaW5kaWNhdGUgdGhhdCBDT01NQU5EX0xJTkVfU0laRSByZWFsbHkK
Pj4+PiBzaG91bGRuJ3QgYmUgcGFydCBvZiB1YXBpLCBzbyB0aGlzIG5vdyB0b3VjaGVzIGFsbCB0
aGUgcG9ydHMuICBJJ3ZlCj4+Pj4gdHJpZWQgdG8gc3BsaXQgdGhpcyBhbGwgb3V0IGFuZCBsZWF2
ZSBpdCBiaXNlY3RhYmxlLCBidXQgSSBoYXZlbid0Cj4+Pj4gdGVzdGVkIGl0IGFsbCB0aGF0IGFn
Z3Jlc3NpdmVseS4KPj4+Pgo+Pj4+IENoYW5nZXMgc2luY2UgdjMgPGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIzMDIxNDA3NDkyNS4yMjgxMDYtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29t
Lz46Cj4+Pj4gKiBBZGRlZCBSQi9BQgo+Pj4+ICogQWRkZWQgYSBtZW50aW9uIHRvIGNvbW1pdCA2
MjIwMjFjZDZjNTYgKCJzMzkwOiBtYWtlIGNvbW1hbmQgbGluZQo+Pj4+ICAgICBjb25maWd1cmFi
bGUiKSBpbiB0aGUgY292ZXIgbGV0dGVyCj4+PiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhCj4+Pgo+
Pj4gICAgQXBwYXJlbnRseSB5b3UgZm9yZ290IHRvIGFkZCB5b3VyIG93biBTb0I/Cj4+IEkgZG8g
bm90IGtub3csIHNob3VsZCBJPyBQYWxtZXIgZGlkIGFsbCB0aGUgd29yaywgSSBvbmx5IGZpeGVk
IDMgbWlub3IKPj4gdGhpbmdzCj4gSWYgeW91IGFyZSBwaWNraW5nIHVwIHBhdGNoZXMsIGFuZCBz
dWJtaXR0aW5nIHRoZW0gdG8gc29tZW9uZSBlbHNlCj4gZm9yIHVwc3RyZWFtIGluY2x1c2lvbiwg
eW91IHNob3VsZCBhZGQgeW91ciBvd24gU29CLgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0
Y2hlcy5yc3QjTDQxOQoKCkdyZWF0LCB0aGFua3MgZm9yIHRoZSBwb2ludGVyLCBJJ2xsIGRvIHRo
YXQgdGhlbiEKCgpUaGFua3MgYWdhaW4sCgoKQWxleAoKCj4gR3J7b2V0amUsZWV0aW5nfXMsCj4K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
