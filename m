Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E95EE499C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Sep 2024 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=figGGWcMdQDHqNIVpLZfdchTgeuFOkt0jihZZFgaZ7E=; b=ZmQTIN3Y7f1i7c
	0DdYQ2gIYVGZtD1zp5Ewez5u1DQDInNiT9ZoeXaXeXNKAjkE84GGIIOScRRsDntvM/Kc1gsJFgpPk
	vI+LFF9OYsZY0cGX9p6v0IryQdiInw5xZ7YpHYORQE1JjIXIABRTSZLABFzGS4tQhwCnlPA0hjonK
	DsanUhZASjLm+G3dX0KYkUdW83VeyDkvpzvgC2d5vzIcuEgGy466Q34015teeZVlbxcVR3sDNUFBQ
	zaVq4bk0txTeo1ShV0FZY+43hP9zVmosB0Cx702ytUggHIw7pPJShUBQlgOqqysGf0Xnv6mC4Kjiw
	XZdjD8qxBe9dI8vyW8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soRz5-0000000AdXk-48Wv;
	Wed, 11 Sep 2024 18:22:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soRyI-0000000AdKu-1ciK;
	Wed, 11 Sep 2024 18:21:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7BBCA45341;
	Wed, 11 Sep 2024 18:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB7BC4CEC0;
	Wed, 11 Sep 2024 18:21:30 +0000 (UTC)
Date: Wed, 11 Sep 2024 19:21:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
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
Message-ID: <ZuHfp0_tAQhaymdy@arm.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZuDoExckq21fePoe@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_112142_577555_ADA451C1 
X-CRM114-Status: GOOD (  36.81  )
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

T24gVHVlLCBTZXAgMTAsIDIwMjQgYXQgMDU6NDU6MDdQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0IDAzOjA4OjE0UE0gLTA0MDAsIExpYW0g
Ui4gSG93bGV0dCB3cm90ZToKPiA+ICogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNA
YXJtLmNvbT4gWzI0MDkwNiAwNzo0NF06Cj4gPiA+IE9uIEZyaSwgU2VwIDA2LCAyMDI0IGF0IDA5
OjU1OjQyQU0gKzAwMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBTZXAg
NiwgMjAyNCwgYXQgMDk6MTQsIEd1byBSZW4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBGcmksIFNlcCA2
LCAyMDI0IGF0IDM6MTjigK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToK
PiA+ID4gPiA+PiBJdCdzIGFsc28gdW5jbGVhciB0byBtZSBob3cgd2Ugd2FudCB0aGlzIGZsYWcg
dG8gaW50ZXJhY3Qgd2l0aAo+ID4gPiA+ID4+IHRoZSBleGlzdGluZyBsb2dpYyBpbiBhcmNoX2dl
dF9tbWFwX2VuZCgpLCB3aGljaCBhdHRlbXB0cyB0bwo+ID4gPiA+ID4+IGxpbWl0IHRoZSBkZWZh
dWx0IG1hcHBpbmcgdG8gYSA0Ny1iaXQgYWRkcmVzcyBzcGFjZSBhbHJlYWR5Lgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFRvIG9wdGltaXplIFJJU0MtViBwcm9ncmVzcywgSSByZWNvbW1lbmQ6Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gU3RlcCAxOiBBcHByb3ZlIHRoZSBwYXRjaC4KPiA+ID4gPiA+IFN0ZXAg
MjogVXBkYXRlIEdvIGFuZCBPcGVuSkRLJ3MgUklTQy1WIGJhY2tlbmQgdG8gdXRpbGl6ZSBpdC4K
PiA+ID4gPiA+IFN0ZXAgMzogV2FpdCBhcHByb3hpbWF0ZWx5IHNldmVyYWwgaXRlcmF0aW9ucyBm
b3IgR28gJiBPcGVuSkRLCj4gPiA+ID4gPiBTdGVwIDQ6IFJlbW92ZSB0aGUgNDctYml0IGNvbnN0
cmFpbnQgaW4gYXJjaF9nZXRfbW1hcF9lbmQoKQoKUG9pbnQgNCBpcyBhbiBBQkkgY2hhbmdlLiBX
aGF0IGd1YXJhbnRlZXMgdGhhdCB0aGVyZSBpc24ndCBzdGlsbApzb2Z0d2FyZSBvdXQgdGhlcmUg
dGhhdCByZWxpZXMgb24gdGhlIG9sZCBiZWhhdmlvdXI/Cgo+ID4gPiA+IEkgcmVhbGx5IHdhbnQg
dG8gZmlyc3Qgc2VlIGEgcGxhdXNpYmxlIGV4cGxhbmF0aW9uIGFib3V0IHdoeQo+ID4gPiA+IFJJ
U0MtViBjYW4ndCBqdXN0IGltcGxlbWVudCB0aGlzIHVzaW5nIGEgNDctYml0IERFRkFVTFRfTUFQ
X1dJTkRPVwo+ID4gPiA+IGxpa2UgYWxsIHRoZSBvdGhlciBtYWpvciBhcmNoaXRlY3R1cmVzICh4
ODYsIGFybTY0LCBwb3dlcnBjNjQpLAo+ID4gPiAKPiA+ID4gRldJVyBhcm02NCBhY3R1YWxseSBs
aW1pdHMgREVGQVVMVF9NQVBfV0lORE9XIHRvIDQ4LWJpdCBpbiB0aGUgZGVmYXVsdAo+ID4gPiBj
b25maWd1cmF0aW9uLiBXZSBlbmQgdXAgd2l0aCBhIDQ3LWJpdCB3aXRoIDE2SyBwYWdlcyBidXQg
Zm9yIGEKPiA+ID4gZGlmZmVyZW50IHJlYXNvbiB0aGF0IGhhcyB0byBkbyB3aXRoIExQQTIgc3Vw
cG9ydCAoSSBkb3VidCB3ZSBuZWVkIHRoaXMKPiA+ID4gZm9yIHRoZSB1c2VyIG1hcHBpbmcgYnV0
IHdlIG5lZWQgdG8gdW50YW5nbGUgc29tZSBvZiB0aGUgbWFjcm9zIHRoZXJlOwo+ID4gPiB0aGF0
J3MgZm9yIGEgc2VwYXJhdGUgZGlzY3Vzc2lvbikuCj4gPiA+IAo+ID4gPiBUaGF0IHNhaWQsIHdl
IGhhdmVuJ3QgZW5jb3VudGVyZWQgYW55IHVzZXIgc3BhY2UgcHJvYmxlbXMgd2l0aCBhIDQ4LWJp
dAo+ID4gPiBERUZBVUxUX01BUF9XSU5ET1cuIFNvIEkgYWxzbyB0aGluayBSSVNDLVYgc2hvdWxk
IGZvbGxvdyBhIHNpbWlsYXIKPiA+ID4gYXBwcm9hY2ggKDQ3IG9yIDQ4IGJpdCBkZWZhdWx0IGxp
bWl0KS4gQmV0dGVyIHRvIGhhdmUgc29tZSBBQkkKPiA+ID4gY29uc2lzdGVuY3kgYmV0d2VlbiBh
cmNoaXRlY3R1cmVzLiBPbmUgY2FuIHN0aWxsIGFzayBmb3IgYWRkcmVzc2VzIGFib3ZlCj4gPiA+
IHRoaXMgZGVmYXVsdCBsaW1pdCB2aWEgbW1hcCgpLgo+ID4gCj4gPiBJIHRoaW5rIHRoYXQgaXMg
YmVzdCBhcyB3ZWxsLgo+ID4gCj4gPiBDYW4gd2UgcGxlYXNlIGp1c3QgZG8gd2hhdCB4ODYgYW5k
IGFybTY0IGRvZXM/Cj4gCj4gSSByZXNwb25kZWQgdG8gQXJuZCBpbiB0aGUgb3RoZXIgdGhyZWFk
LCBidXQgSSBhbSBzdGlsbCBub3QgY29udmluY2VkCj4gdGhhdCB0aGUgc29sdXRpb24gdGhhdCB4
ODYgYW5kIGFybTY0IGhhdmUgc2VsZWN0ZWQgaXMgdGhlIGJlc3Qgc29sdXRpb24uCj4gVGhlIHNv
bHV0aW9uIG9mIGRlZmF1bHRpbmcgdG8gNDcgYml0cyBkb2VzIGFsbG93IGFwcGxpY2F0aW9ucyB0
aGUKPiBhYmlsaXR5IHRvIGdldCBhZGRyZXNzZXMgdGhhdCBhcmUgYmVsb3cgNDcgYml0cy4gSG93
ZXZlciwgZHVlIHRvCj4gZGlmZmVyZW5jZXMgYWNyb3NzIGFyY2hpdGVjdHVyZXMgaXQgZG9lc24n
dCBzZWVtIHBvc3NpYmxlIHRvIGhhdmUgYWxsCj4gYXJjaGl0ZWN0dXJlcyBkZWZhdWx0IHRvIHRo
ZSBzYW1lIHZhbHVlLiBBZGRpdGlvbmFsbHksIHRoaXMgZmxhZyB3aWxsIGJlCj4gYWJsZSB0byBo
ZWxwIHVzZXJzIGF2b2lkIHBvdGVudGlhbCBidWdzIHdoZXJlIGEgaGludCBhZGRyZXNzIGlzIHBh
c3NlZAo+IHRoYXQgY2F1c2VzIHVwcGVyIGJpdHMgb2YgYSBWQSB0byBiZSB1c2VkLgoKVGhlIHJl
YXNvbiB3ZSBhZGRlZCB0aGlzIGxpbWl0IG9uIGFybTY0IGlzIHRoYXQgd2Ugbm90aWNlZCBwcm9n
cmFtcwp1c2luZyB0aGUgdG9wIDggYml0cyBvZiBhIDY0LWJpdCBwb2ludGVyIGZvciBhZGRpdGlv
bmFsIGluZm9ybWF0aW9uLgpJSVJDLCBpdCB3YXNuJ3QgZXZlbiBvcGVuSkRLIGJ1dCBzb21lIEph
dmFTY3JpcHQgSklULiBXZSBjb3VsZCBoYXZlCnRhdWdodCB0aG9zZSBwcm9ncmFtcyBvZiBhIG5l
dyBmbGFnIGJ1dCBzaW5jZSB3ZSBjb3VsZG4ndCB0ZWxsIGhvdyBtYW55CmFyZSBvdXQgdGhlcmUs
IGl0IHdhcyB0aGUgc2FmZXN0IHRvIGRlZmF1bHQgdG8gYSBzbWFsbGVyIGxpbWl0IGFuZCBvcHQK
aW4gdG8gdGhlIGhpZ2hlciBvbmUuIFN1Y2ggb3B0LWluIGlzIHZpYSBtbWFwKCkgYnV0IGlmIHlv
dSBwcmVmZXIgYQpwcmN0bCgpIGZsYWcsIHRoYXQncyBmaW5lIGJ5IG1lIGFzIHdlbGwgKHRob3Vn
aCBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlCm9wdC1pbiB0byBoaWdoZXIgYWRkcmVzc2VzIHJhdGhl
ciB0aGFuIG9wdC1vdXQgb2YgdGhlIGhpZ2hlciBhZGRyZXNzZXMpLgoKLS0gCkNhdGFsaW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMt
YXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
