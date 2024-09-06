Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC199CE7B06
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Sep 2024 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVoxD/NfUgeDRvneD+d8lQg0tOTISqAJrLq4iMWXWuM=; b=zMFL4zwu/HF5wC
	j3gYfKqyCqURsbu4HXn8N4g1IP+oAbheWUDCosQDeU4pT2jnBu1C2eQoHsZeJPvMNmawH5v0xXjx5
	ED/bu85XzyuXnDex6XH6jX2Shc9/EYaNoCiPe2HfACaUoXggr2HL4c7JfwDyAOepT/blCFmFQb4bG
	JKWMp/1FfWR8Jel7+cd96cJpcko0BEntL4+81jbVQnNAzqlYrpPpgH0SNYINKKsbrwrH5TAvaUHVs
	8O0nlDVSu5VZ7HGZUPcOzlSbSgUWW38ScR24Zb86ifg2Rr3i9OgaRh7UZDJt/mDAi7OVDUsgT5poI
	C9J/lI/y8riZXv5UI55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYLy-0000000CD0u-1Xol;
	Fri, 06 Sep 2024 12:46:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smXNj-0000000C1ss-3C5b;
	Fri, 06 Sep 2024 11:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jlW+lt5ymLFjFq1OwMUOAB40jG76BrJeobGs1x3SCuw=; b=AWhNDYZVdH83SSr0ImYdJivLMt
	zzaA25Y8qVzyg70Bx1xCARKRkmgemyXs+EYp7+/0DQtnbek26CwKxuL3lsBfPmqJqdVsX70qdTvzw
	8sqvusT4hbg/5myBi9kzVMWhKt3NHTiv8EqKbfJamzbahea1OOOnSmuj8Mw7DZEoxqF5vnUSwnl+q
	y83DDhb5ruAoE0FK2bDED6idOYW54pzZBdWgwXbBDEuR63aoaxwB9zxNBQea0+KJJXCKEAgaQFATc
	rrmozDej0gDQnwplHS7ULU+UbWN1n84vKlT7KFhzCzWSTylRk9Lfn2unSyljKU++RilYt7sxnZiVV
	KrsNZ7/A==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1smXNg-00000000eiD-1LMn;
	Fri, 06 Sep 2024 11:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40C6FA44F2B;
	Fri,  6 Sep 2024 11:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE75C4CEC4;
	Fri,  6 Sep 2024 11:43:46 +0000 (UTC)
Date: Fri, 6 Sep 2024 12:43:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: guoren <guoren@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <Ztrq8PBLJ3QuFJz7@arm.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_124400_837591_63C726D1 
X-CRM114-Status: GOOD (  17.37  )
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

T24gRnJpLCBTZXAgMDYsIDIwMjQgYXQgMDk6NTU6NDJBTSArMDAwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBGcmksIFNlcCA2LCAyMDI0LCBhdCAwOToxNCwgR3VvIFJlbiB3cm90ZToKPiA+
IE9uIEZyaSwgU2VwIDYsIDIwMjQgYXQgMzoxOOKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+ID4+IEl0J3MgYWxzbyB1bmNsZWFyIHRvIG1lIGhvdyB3ZSB3YW50IHRo
aXMgZmxhZyB0byBpbnRlcmFjdCB3aXRoCj4gPj4gdGhlIGV4aXN0aW5nIGxvZ2ljIGluIGFyY2hf
Z2V0X21tYXBfZW5kKCksIHdoaWNoIGF0dGVtcHRzIHRvCj4gPj4gbGltaXQgdGhlIGRlZmF1bHQg
bWFwcGluZyB0byBhIDQ3LWJpdCBhZGRyZXNzIHNwYWNlIGFscmVhZHkuCj4gPgo+ID4gVG8gb3B0
aW1pemUgUklTQy1WIHByb2dyZXNzLCBJIHJlY29tbWVuZDoKPiA+Cj4gPiBTdGVwIDE6IEFwcHJv
dmUgdGhlIHBhdGNoLgo+ID4gU3RlcCAyOiBVcGRhdGUgR28gYW5kIE9wZW5KREsncyBSSVNDLVYg
YmFja2VuZCB0byB1dGlsaXplIGl0Lgo+ID4gU3RlcCAzOiBXYWl0IGFwcHJveGltYXRlbHkgc2V2
ZXJhbCBpdGVyYXRpb25zIGZvciBHbyAmIE9wZW5KREsKPiA+IFN0ZXAgNDogUmVtb3ZlIHRoZSA0
Ny1iaXQgY29uc3RyYWludCBpbiBhcmNoX2dldF9tbWFwX2VuZCgpCj4gCj4gSSByZWFsbHkgd2Fu
dCB0byBmaXJzdCBzZWUgYSBwbGF1c2libGUgZXhwbGFuYXRpb24gYWJvdXQgd2h5Cj4gUklTQy1W
IGNhbid0IGp1c3QgaW1wbGVtZW50IHRoaXMgdXNpbmcgYSA0Ny1iaXQgREVGQVVMVF9NQVBfV0lO
RE9XCj4gbGlrZSBhbGwgdGhlIG90aGVyIG1ham9yIGFyY2hpdGVjdHVyZXMgKHg4NiwgYXJtNjQs
IHBvd2VycGM2NCksCgpGV0lXIGFybTY0IGFjdHVhbGx5IGxpbWl0cyBERUZBVUxUX01BUF9XSU5E
T1cgdG8gNDgtYml0IGluIHRoZSBkZWZhdWx0CmNvbmZpZ3VyYXRpb24uIFdlIGVuZCB1cCB3aXRo
IGEgNDctYml0IHdpdGggMTZLIHBhZ2VzIGJ1dCBmb3IgYQpkaWZmZXJlbnQgcmVhc29uIHRoYXQg
aGFzIHRvIGRvIHdpdGggTFBBMiBzdXBwb3J0IChJIGRvdWJ0IHdlIG5lZWQgdGhpcwpmb3IgdGhl
IHVzZXIgbWFwcGluZyBidXQgd2UgbmVlZCB0byB1bnRhbmdsZSBzb21lIG9mIHRoZSBtYWNyb3Mg
dGhlcmU7CnRoYXQncyBmb3IgYSBzZXBhcmF0ZSBkaXNjdXNzaW9uKS4KClRoYXQgc2FpZCwgd2Ug
aGF2ZW4ndCBlbmNvdW50ZXJlZCBhbnkgdXNlciBzcGFjZSBwcm9ibGVtcyB3aXRoIGEgNDgtYml0
CkRFRkFVTFRfTUFQX1dJTkRPVy4gU28gSSBhbHNvIHRoaW5rIFJJU0MtViBzaG91bGQgZm9sbG93
IGEgc2ltaWxhcgphcHByb2FjaCAoNDcgb3IgNDggYml0IGRlZmF1bHQgbGltaXQpLiBCZXR0ZXIg
dG8gaGF2ZSBzb21lIEFCSQpjb25zaXN0ZW5jeSBiZXR3ZWVuIGFyY2hpdGVjdHVyZXMuIE9uZSBj
YW4gc3RpbGwgYXNrIGZvciBhZGRyZXNzZXMgYWJvdmUKdGhpcyBkZWZhdWx0IGxpbWl0IHZpYSBt
bWFwKCkuCgotLSAKQ2F0YWxpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1zbnBzLWFyYwo=
