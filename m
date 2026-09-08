Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE90C79F82
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Sep 2026 11:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/8hjc5cqjg9E2nQ+ZrOO9IPfEyJm3l3fW9Q9aVbGCE=; b=ClSLyAqOAQu2FM
	A7x//DKx7jTQnvuROSq+ABtp5GYapn8QqiLBAmaET5GiD8ezFgs6zyLmRS8NvA+CDcyIRcg9j42T+
	nX8nuTpjl3OyE+C3P9zkEMhOT6MafcGmNnefz/eMHlOCE7V5AfRmijTvgEqor9rk0pNWzw8vruCmQ
	fi7611PjWT/KwmUHZu8gzr3lWTJqDySqaWV+4IL5YG0J+cnYxqcMEYxnu+sSOzJ/0dxRj7UWxeNLT
	NCrtrZaKhkeTwCGSblqvKxU0N/JV3olhOEMXlSUks/dYEyULt5jhQyBxbARtgVv7/kkZoBmD0XR0G
	J7kavhyY3HfHBGERpmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3u0r-00000008sxT-0491;
	Tue, 08 Sep 2026 11:29:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3u0o-00000008swy-2XDR;
	Tue, 08 Sep 2026 11:29:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DDBA41328;
	Tue,  8 Sep 2026 11:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8561F00A3A;
	Tue,  8 Sep 2026 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788866953;
	bh=wrZchMHbuIO6XXck0lzWb4MFVBIJqfPNOjZp2CkiLAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UaGEuylvnKTadsfjaS7bvwU33xN2v3VvG9wjjwlcHZzqg4jRyqMpEEdO03+MvqeIM
	 0cduj0er10VqGiGsJx7yjqifKpSllSZ3vK2y8omgzwmD0GHCZufWGZlTXVUWUiJ1V9
	 ryqufjLkVU0NIOGHntM/W5uaFdDur34HOl0mDF/iX8gW88SDJFV9ZGxssqTmrANwpQ
	 ynMdPQCgyGQbU6JnCqU5u6mlf0Svv7YVwvZzUogSUfvbxLoYO7+FDhTi6mBmpO9DWp
	 jokGL7RYOK/KgBIS1bsW+dwWJav2y/DtDFT7YQL4WN6vyefxcqOuYZ/U9v7ZU8r1QK
	 2OBX8O/r781rA==
Date: Tue, 8 Sep 2026 12:28:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>, 
	Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
	Stafford Horne <shorne@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 05/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for arc,
 microblaze, xtensa
Message-ID: <ap_xXoS5XDqJ0mgU@gremlin>
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-5-5456a81c8212@kernel.org>
 <CAJuCfpESe_BXihJh-8FhjQVKzsSpnS4zdMgg3e59byJTc8QViA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpESe_BXihJh-8FhjQVKzsSpnS4zdMgg3e59byJTc8QViA@mail.gmail.com>
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

T24gTW9uLCBTZXAgMDcsIDIwMjYgYXQgMDI6MDc6MzdQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDEsIDIwMjYgYXQgNDowNuKAr0FNIExvcmVuem8gU3Rv
YWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEVhY2ggb2YgdGhlc2Ug
YXJjaGl0ZWN0dXJlcyBkaXJlY3RseSBmcmVlIHBhZ2UgdGFibGVzIHdpdGhvdXQgcm91dGluZyB0
aGVzZQo+ID4gY2hhbmdlcyB0aHJvdWdoIHRsYl9yZW1vdmVfcHRkZXNjKCkuCj4gPgo+ID4gVGhl
IHVzZSBvZiB0bGJfcmVtb3ZlX3B0ZGVzYygpIGlzIHJlcXVpcmVkIGZvcgo+ID4gQ09ORklHX01N
VV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgdG8gY29ycmVjdGx5IGZyZWUgcGFnZSB0YWJsZXMgdW5k
ZXIgUkNVLAo+ID4gc28gc2ltcGx5IHVwZGF0ZSB0aGVzZSBhcmNoaXRlY3R1cmVzIHRvIHVzZSB0
aGVzZSBmdW5jdGlvbnMuCj4gPgo+ID4gU2luY2Ugbm9uZSBvZiB0aGUgYXJjaGl0ZWN0dXJlcyBz
aGFyZSBwYWdlIHRhYmxlcyBvciBkbyBhbnl0aGluZyB1bnVzdWFsLAo+ID4gbm90aGluZyBjb21w
bGljYXRlZCBpcyByZXF1aXJlZCBoZXJlLgo+ID4KPiA+IFRoZXJlZm9yZSB0aGlzIGlzIHNpbXBs
eSBhIG1lY2hhbmljYWwgY2hhbmdlIC0gY29udmVydCBfX3B1ZF9mcmVlX3RsYigpLAo+ID4gX19w
bWRfZnJlZV90bGIoKSBhbmQgX19wdGVfZnJlZV90bGIoKSB0byB1c2UgdGxiX3JlbW92ZV9wdGRl
c2MoKSBhcwo+ID4gcmVxdWlyZWQuCj4gPgo+ID4gQXQgdGhlIHBvaW50IHRoaXMgaXMgaW4gcGxh
Y2UsIGFsbCBtbXVfZ2F0aGVyIHBhZ2UgdGFibGUgZnJlZWluZyBpcwo+ID4gcGVyZm9ybWVkIHVu
ZGVyIFJDVSwgYW5kIHRodXMgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSBpcyBzZWxlY3RlZCBm
b3IKPiA+IGVhY2ggYXJjaGl0ZWN0dXJlLgo+ID4KPiA+IFRoaXMgZm9ybXMgcGFydCBvZiBhbiBv
dmVyYWxsIGVmZm9ydCB0byBzd2l0Y2ggZXZlcnkgYXJjaGl0ZWN0dXJlIHRvIHRoaXMKPiA+IG1v
ZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChBUk0pIDxsanNAa2Vy
bmVsLm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gvYXJjL0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgfCAxICsKPiA+ICBhcmNoL2FyYy9pbmNsdWRlL2FzbS9wZ2FsbG9jLmggICAgICAgIHwgNiAr
KystLS0KPiA+ICBhcmNoL21pY3JvYmxhemUvS2NvbmZpZyAgICAgICAgICAgICAgIHwgMSArCj4g
PiAgYXJjaC9taWNyb2JsYXplL2luY2x1ZGUvYXNtL3BnYWxsb2MuaCB8IDIgKy0KPiA+ICBhcmNo
L3h0ZW5zYS9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgMSArCj4gPiAgYXJjaC94dGVuc2Ev
aW5jbHVkZS9hc20vdGxiLmggICAgICAgICB8IDIgKy0KPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cmMvS2NvbmZpZyBiL2FyY2gvYXJjL0tjb25maWcKPiA+IGluZGV4IDJlZDcxODZjODFjNS4uN2E3
NTQyYjYxODIzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcmMvS2NvbmZpZwo+ID4gKysrIGIvYXJj
aC9hcmMvS2NvbmZpZwo+ID4gQEAgLTQ3LDYgKzQ3LDcgQEAgY29uZmlnIEFSQwo+ID4gICAgICAg
ICBzZWxlY3QgSEFWRV9TWVNDQUxMX1RSQUNFUE9JTlRTCj4gPiAgICAgICAgIHNlbGVjdCBJUlFf
RE9NQUlOCj4gPiAgICAgICAgIHNlbGVjdCBMT0NLX01NX0FORF9GSU5EX1ZNQQo+ID4gKyAgICAg
ICBzZWxlY3QgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRQo+ID4gICAgICAgICBzZWxlY3QgTU9E
VUxFU19VU0VfRUxGX1JFTEEKPiA+ICAgICAgICAgc2VsZWN0IE9GCj4gPiAgICAgICAgIHNlbGVj
dCBPRl9FQVJMWV9GTEFUVFJFRQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjL2luY2x1ZGUvYXNt
L3BnYWxsb2MuaCBiL2FyY2gvYXJjL2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+ID4gaW5kZXggZGZh
ZTA3MGZlOGQ1Li45YjZjMzdmOTJlOTcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FyYy9pbmNsdWRl
L2FzbS9wZ2FsbG9jLmgKPiA+ICsrKyBiL2FyY2gvYXJjL2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+
ID4gQEAgLTcyLDcgKzcyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHA0ZF9wb3B1bGF0ZShzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgcDRkX3QgKnA0ZHAsIHB1ZF90ICpwdWRwKQo+ID4gICAgICAgICBz
ZXRfcDRkKHA0ZHAsIF9fcDRkKCh1bnNpZ25lZCBsb25nKXB1ZHApKTsKPiA+ICB9Cj4gPgo+ID4g
LSNkZWZpbmUgX19wdWRfZnJlZV90bGIodGxiLCBwbWQsIGFkZHIpICBwdWRfZnJlZSgodGxiKS0+
bW0sIHBtZCkKPiA+ICsjZGVmaW5lIF9fcHVkX2ZyZWVfdGxiKHRsYiwgcG1kLCBhZGRyKSAgdGxi
X3JlbW92ZV9wdGRlc2MoKHRsYiksIHZpcnRfdG9fcHRkZXNjKHBtZCkpCj4gPgo+ID4gICNlbmRp
Zgo+ID4KPiA+IEBAIC04MywxMCArODMsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHB1ZF9wb3B1
bGF0ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcHVkX3QgKnB1ZHAsIHBtZF90ICpwbWRwKQo+ID4g
ICAgICAgICBzZXRfcHVkKHB1ZHAsIF9fcHVkKCh1bnNpZ25lZCBsb25nKXBtZHApKTsKPiA+ICB9
Cj4gPgo+ID4gLSNkZWZpbmUgX19wbWRfZnJlZV90bGIodGxiLCBwbWQsIGFkZHIpICBwbWRfZnJl
ZSgodGxiKS0+bW0sIHBtZCkKPiA+ICsjZGVmaW5lIF9fcG1kX2ZyZWVfdGxiKHRsYiwgcG1kLCBh
ZGRyKSAgdGxiX3JlbW92ZV9wdGRlc2MoKHRsYiksIHZpcnRfdG9fcHRkZXNjKHBtZCkpCj4gPgo+
ID4gICNlbmRpZgo+ID4KPiA+IC0jZGVmaW5lIF9fcHRlX2ZyZWVfdGxiKHRsYiwgcHRlLCBhZGRy
KSAgcHRlX2ZyZWUoKHRsYiktPm1tLCBwdGUpCj4gPiArI2RlZmluZSBfX3B0ZV9mcmVlX3RsYih0
bGIsIHB0ZSwgYWRkcikgIHRsYl9yZW1vdmVfcHRkZXNjKCh0bGIpLCBwYWdlX3B0ZGVzYyhwdGUp
KQo+ID4KPiA+ICAjZW5kaWYgLyogX0FTTV9BUkNfUEdBTExPQ19IICovCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9taWNyb2JsYXplL0tjb25maWcgYi9hcmNoL21pY3JvYmxhemUvS2NvbmZpZwo+ID4g
aW5kZXggNDg0ZWJiM2JhZWRmLi5hZjdlODIxZTk2YzEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL21p
Y3JvYmxhemUvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9taWNyb2JsYXplL0tjb25maWcKPiA+IEBA
IC00MSw2ICs0MSw3IEBAIGNvbmZpZyBNSUNST0JMQVpFCj4gPiAgICAgICAgIHNlbGVjdCBQQ0lf
U1lTQ0FMTCBpZiBQQ0kKPiA+ICAgICAgICAgc2VsZWN0IENQVV9OT19FRkZJQ0lFTlRfRkZTCj4g
PiAgICAgICAgIHNlbGVjdCBNTVVfR0FUSEVSX05PX1JBTkdFCj4gPiArICAgICAgIHNlbGVjdCBN
TVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFCj4gPiAgICAgICAgIHNlbGVjdCBTUEFSU0VfSVJRCj4g
PiAgICAgICAgIHNlbGVjdCBaT05FX0RNQQo+ID4gICAgICAgICBzZWxlY3QgVFJBQ0VfSVJRRkxB
R1NfU1VQUE9SVAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS9w
Z2FsbG9jLmggYi9hcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4gPiBpbmRl
eCAwODRhOGEwZGMyMzkuLmZmZWU2YTAwOTIxOSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvbWljcm9i
bGF6ZS9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPiA+ICsrKyBiL2FyY2gvbWljcm9ibGF6ZS9pbmNs
dWRlL2FzbS9wZ2FsbG9jLmgKPiA+IEBAIC0yNSw3ICsyNSw3IEBAIGV4dGVybiB2b2lkIF9fYmFk
X3B0ZShwbWRfdCAqcG1kKTsKPiA+Cj4gPiAgZXh0ZXJuIHB0ZV90ICpwdGVfYWxsb2Nfb25lX2tl
cm5lbChzdHJ1Y3QgbW1fc3RydWN0ICptbSk7Cj4gPgo+ID4gLSNkZWZpbmUgX19wdGVfZnJlZV90
bGIodGxiLCBwdGUsIGFkZHIpIHB0ZV9mcmVlKCh0bGIpLT5tbSwgKHB0ZSkpCj4gPiArI2RlZmlu
ZSBfX3B0ZV9mcmVlX3RsYih0bGIsIHB0ZSwgYWRkcikgdGxiX3JlbW92ZV9wdGRlc2MoKHRsYiks
IHBhZ2VfcHRkZXNjKHB0ZSkpCj4gPgo+ID4gICNkZWZpbmUgcG1kX3BvcHVsYXRlKG1tLCBwbWQs
IHB0ZSkgXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgKHBtZF92YWwoKihwbWQpKSA9ICh1
bnNpZ25lZCBsb25nKXBhZ2VfYWRkcmVzcyhwdGUpKQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gveHRl
bnNhL0tjb25maWcgYi9hcmNoL3h0ZW5zYS9LY29uZmlnCj4gPiBpbmRleCBmMmY5Y2Q5Y2RlNTAu
LjMzYzRjYWVlMzBlMiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gveHRlbnNhL0tjb25maWcKPiA+ICsr
KyBiL2FyY2gveHRlbnNhL0tjb25maWcKPiA+IEBAIC01NSw2ICs1NSw3IEBAIGNvbmZpZyBYVEVO
U0EKPiA+ICAgICAgICAgc2VsZWN0IEhBVkVfVklSVF9DUFVfQUNDT1VOVElOR19HRU4KPiA+ICAg
ICAgICAgc2VsZWN0IElSUV9ET01BSU4KPiA+ICAgICAgICAgc2VsZWN0IExPQ0tfTU1fQU5EX0ZJ
TkRfVk1BCj4gPiArICAgICAgIHNlbGVjdCBNTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFIGlmIE1N
VQo+Cj4gQW5kIE1NVSBpcyByZXF1aXJlZCBiZWNhdXNlIE5PTU1VIGRvZXMgbm90IHBlcmZvcm0g
bW11X2dhdGhlcgo+IG9wZXJhdGlvbnMsIHNhbWUgYXMgaW4gdGhlIHByZXZpb3VzIHBhdGNoPyBJ
ZiBzbywgbWF5YmUgbWFrZSBhIG5vdGUgb2YKPiBpdCBpbiB0aGUgY2hhbmdlbG9nPwoKUmlnaHQg
eXVwLiBXaWxsIHVwZGF0ZSEKCj4KPiA+ICAgICAgICAgc2VsZWN0IE1PRFVMRVNfVVNFX0VMRl9S
RUxBCj4gPiAgICAgICAgIHNlbGVjdCBQRVJGX1VTRV9WTUFMTE9DCj4gPiAgICAgICAgIHNlbGVj
dCBUUkFDRV9JUlFGTEFHU19TVVBQT1JUCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94dGVuc2EvaW5j
bHVkZS9hc20vdGxiLmggYi9hcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS90bGIuaAo+ID4gaW5kZXgg
OGMzY2ViNDI3MDE4Li42ZmI3Yjc4MTU0ZjYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3h0ZW5zYS9p
bmNsdWRlL2FzbS90bGIuaAo+ID4gKysrIGIvYXJjaC94dGVuc2EvaW5jbHVkZS9hc20vdGxiLmgK
PiA+IEBAIC0xNiw3ICsxNiw3IEBACj4gPgo+ID4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy90bGIu
aD4KPiA+Cj4gPiAtI2RlZmluZSBfX3B0ZV9mcmVlX3RsYih0bGIsIHB0ZSwgYWRkcmVzcykgICAg
ICBwdGVfZnJlZSgodGxiKS0+bW0sIHB0ZSkKPiA+ICsjZGVmaW5lIF9fcHRlX2ZyZWVfdGxiKHRs
YiwgcHRlLCBhZGRyZXNzKSAgICAgIHRsYl9yZW1vdmVfcHRkZXNjKCh0bGIpLCBwYWdlX3B0ZGVz
YyhwdGUpKQo+ID4KPiA+ICB2b2lkIGNoZWNrX3RsYl9zYW5pdHkodm9pZCk7Cj4gPgo+ID4KPiA+
IC0tCj4gPiAyLjU1LjAKPiA+CgotLQpDaGVlcnMsIExvcmVuem8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlz
dApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
