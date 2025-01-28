Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE14C0218A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2025 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4aaOIpqJZgF+tsgieP1Z4sxwrQyoMIS8QjCarhVTL4=; b=i1llUR0ECGO5R2
	ZOmqTgTQr1k+9SuIQ1NZ8iJJecaANYE5paYiMTI8XpTlbI53enhieSuEK/41Klqs3317W12os3Gju
	Yw2fqRgmwJcVr8ZGOoxu8uVPDLZu3qOPyC6jidDU+GigxtQ517yxPLj+1uSqH/Pq7SeHf1kmm3Ymc
	SUiFGgXylScWxivOo6sUjuaUp2yu4NLiwD42y07/8GURkptr2Owix2Qm34/KYmsrWsUs6945N69X6
	Kkm2DRjapPOtkBtD/YhC755ekbVhoKu8S4hTPh+KVs40bH5fZyDlQGvPEFz2Ap7XJQ1oFu6zH+TxX
	o4AzbLTjjAXpFrxo7ACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnNt-000000057Tf-321V;
	Tue, 28 Jan 2025 15:20:13 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnNp-000000057P6-0gTz;
	Tue, 28 Jan 2025 15:20:10 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yj82F28LWz9sSm;
	Tue, 28 Jan 2025 16:13:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUAD3C0Watlr; Tue, 28 Jan 2025 16:13:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yj82D0j2Qz9sSg;
	Tue, 28 Jan 2025 16:13:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E319C8B76D;
	Tue, 28 Jan 2025 16:13:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id j0RK6FfFhNPv; Tue, 28 Jan 2025 16:13:55 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E34BB8B763;
	Tue, 28 Jan 2025 16:13:52 +0100 (CET)
Message-ID: <e76df471-1346-459a-9f24-fa053d7dcbe8@csgroup.eu>
Date: Tue, 28 Jan 2025 16:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] syscall.h: introduce syscall_set_nr()
To: "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>
Cc: Alexey Gladkov <legion@kernel.org>, Charlie Jenkins
 <charlie@rivosinc.com>, Eugene Syromyatnikov <evgsyr@gmail.com>,
 Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>,
 Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arch@vger.kernel.org
References: <20250128091636.GC8601@strace.io>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250128091636.GC8601@strace.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_072009_359574_39FAF597 
X-CRM114-Status: GOOD (  21.28  )
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

CgpMZSAyOC8wMS8yMDI1IMOgIDEwOjE2LCBEbWl0cnkgVi4gTGV2aW4gYSDDqWNyaXTCoDoKPiBT
aW1pbGFyIHRvIHN5c2NhbGxfc2V0X2FyZ3VtZW50cygpIHRoYXQgY29tcGxlbWVudHMKPiBzeXNj
YWxsX2dldF9hcmd1bWVudHMoKSwgaW50cm9kdWNlIHN5c2NhbGxfc2V0X25yKCkKPiB0aGF0IGNv
bXBsZW1lbnRzIHN5c2NhbGxfZ2V0X25yKCkuCj4gCj4gc3lzY2FsbF9zZXRfbnIoKSBpcyBnb2lu
ZyB0byBiZSBuZWVkZWQgYWxvbmcgd2l0aAo+IHN5c2NhbGxfc2V0X2FyZ3VtZW50cygpIG9uIGFs
bCBIQVZFX0FSQ0hfVFJBQ0VIT09LCj4gYXJjaGl0ZWN0dXJlcyB0byBpbXBsZW1lbnQgUFRSQUNF
X1NFVF9TWVNDQUxMX0lORk8gQVBJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBWLiBMZXZp
biA8bGR2QHN0cmFjZS5pbz4KPiBUZXN0ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUBy
aXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZv
c2luYy5jb20+Cj4gLS0tCj4gICBhcmNoL2FyYy9pbmNsdWRlL2FzbS9zeXNjYWxsLmggICAgICAg
IHwgMTEgKysrKysrKysrKysKPiAgIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3N5c2NhbGwuaCAgICAg
ICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiAgIGFyY2gvYXJtNjQvaW5jbHVkZS9h
c20vc3lzY2FsbC5oICAgICAgfCAxNiArKysrKysrKysrKysrKysrCj4gICBhcmNoL2hleGFnb24v
aW5jbHVkZS9hc20vc3lzY2FsbC5oICAgIHwgIDcgKysrKysrKwo+ICAgYXJjaC9sb29uZ2FyY2gv
aW5jbHVkZS9hc20vc3lzY2FsbC5oICB8ICA3ICsrKysrKysKPiAgIGFyY2gvbTY4ay9pbmNsdWRl
L2FzbS9zeXNjYWxsLmggICAgICAgfCAgNyArKysrKysrCj4gICBhcmNoL21pY3JvYmxhemUvaW5j
bHVkZS9hc20vc3lzY2FsbC5oIHwgIDcgKysrKysrKwo+ICAgYXJjaC9taXBzL2luY2x1ZGUvYXNt
L3N5c2NhbGwuaCAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4gICBhcmNoL25pb3MyL2luY2x1
ZGUvYXNtL3N5c2NhbGwuaCAgICAgIHwgIDUgKysrKysKPiAgIGFyY2gvb3BlbnJpc2MvaW5jbHVk
ZS9hc20vc3lzY2FsbC5oICAgfCAgNiArKysrKysKPiAgIGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNt
L3N5c2NhbGwuaCAgICAgfCAgNyArKysrKysrCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
c3lzY2FsbC5oICAgIHwgMTAgKysrKysrKysrKwo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
eXNjYWxsLmggICAgICB8ICA3ICsrKysrKysKPiAgIGFyY2gvczM5MC9pbmNsdWRlL2FzbS9zeXNj
YWxsLmggICAgICAgfCAxMiArKysrKysrKysrKysKPiAgIGFyY2gvc2gvaW5jbHVkZS9hc20vc3lz
Y2FsbF8zMi5oICAgICAgfCAxMiArKysrKysrKysrKysKPiAgIGFyY2gvc3BhcmMvaW5jbHVkZS9h
c20vc3lzY2FsbC5oICAgICAgfCAxMiArKysrKysrKysrKysKPiAgIGFyY2gvdW0vaW5jbHVkZS9h
c20vc3lzY2FsbC1nZW5lcmljLmggfCAgNSArKysrKwo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20v
c3lzY2FsbC5oICAgICAgICB8ICA3ICsrKysrKysKPiAgIGFyY2gveHRlbnNhL2luY2x1ZGUvYXNt
L3N5c2NhbGwuaCAgICAgfCAgNyArKysrKysrCj4gICBpbmNsdWRlL2FzbS1nZW5lcmljL3N5c2Nh
bGwuaCAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPiAgIDIwIGZpbGVzIGNoYW5nZWQsIDE5
NyBpbnNlcnRpb25zKCspCj4gCgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3N5c2NhbGwuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vc3lzY2FsbC5oCj4gaW5kZXggNzYw
MjBiNjYyODZiLi43MTJkYWE5MGU2NDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS9zeXNjYWxsLmgKPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3N5c2NhbGwuaAo+
IEBAIC02MSw2ICs2MSwyMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3lzY2FsbF9zZXRfcmV0dXJu
X3ZhbHVlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKPiAgIAlyZWdzLT5yZWdzWzBdID0gdmFs
Owo+ICAgfQo+ICAgCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzeXNjYWxsX3NldF9ucihzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnRhc2ssCj4gKwkJCQkgIHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ICsJCQkJ
ICBpbnQgbnIpCj4gK3sKPiArCXJlZ3MtPnN5c2NhbGxubyA9IG5yOwo+ICsJaWYgKG5yID09IC0x
KSB7Cj4gKwkJLyoKPiArCQkgKiBXaGVuIHRoZSBzeXNjYWxsIG51bWJlciBpcyBzZXQgdG8gLTEs
IHRoZSBzeXNjYWxsIHdpbGwgYmUKPiArCQkgKiBza2lwcGVkLiAgSW4gdGhpcyBjYXNlIHRoZSBz
eXNjYWxsIHJldHVybiB2YWx1ZSBoYXMgdG8gYmUKPiArCQkgKiBzZXQgZXhwbGljaXRseSwgb3Ro
ZXJ3aXNlIHRoZSBmaXJzdCBzeXNjYWxsIGFyZ3VtZW50IGlzCj4gKwkJICogcmV0dXJuZWQgYXMg
dGhlIHN5c2NhbGwgcmV0dXJuIHZhbHVlLgo+ICsJCSAqLwo+ICsJCXN5c2NhbGxfc2V0X3JldHVy
bl92YWx1ZSh0YXNrLCByZWdzLCAtRU5PU1lTLCAwKTsKPiArCX0KPiArfQo+ICsKPiAgICNkZWZp
bmUgU1lTQ0FMTF9NQVhfQVJHUyA2Cj4gICAKPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBzeXNjYWxs
X2dldF9hcmd1bWVudHMoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAoKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3N5c2NhbGwuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9zeXNjYWxsLmgKPiBpbmRleCA1MjFmMjc5ZTZiMzMuLjc1MDVkY2ZlZDI0NyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc3lzY2FsbC5oCj4gKysrIGIvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL3N5c2NhbGwuaAo+IEBAIC0zOSw2ICszOSwxNiBAQCBzdGF0aWMg
aW5saW5lIGludCBzeXNjYWxsX2dldF9ucihzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHN0cnVj
dCBwdF9yZWdzICpyZWdzKQo+ICAgCQlyZXR1cm4gLTE7Cj4gICB9Cj4gICAKPiArc3RhdGljIGlu
bGluZSB2b2lkIHN5c2NhbGxfc2V0X25yKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0
IHB0X3JlZ3MgKnJlZ3MsIGludCBucikKPiArewo+ICsJLyoKPiArCSAqIFVubGlrZSBzeXNjYWxs
X2dldF9ucigpLCBzeXNjYWxsX3NldF9ucigpIGNhbiBiZSBjYWxsZWQgb25seSB3aGVuCj4gKwkg
KiB0aGUgdGFyZ2V0IHRhc2sgaXMgc3RvcHBlZCBmb3IgdHJhY2luZyBvbiBlbnRlcmluZyBzeXNj
YWxsLCBzbwo+ICsJICogdGhlcmUgaXMgbm8gbmVlZCB0byBoYXZlIHRoZSBzYW1lIGNoZWNrIHN5
c2NhbGxfZ2V0X25yKCkgaGFzLgo+ICsJICovCj4gKwlyZWdzLT5ncHJbMF0gPSBucjsKCkRvZXNu
J3QgdGhlIHNhbWUgYXMgZm9yIEFSTTY0IGFwcGx5IGhlcmUgYXMgd2VsbCA/Cgo+ICt9Cj4gKwo+
ICAgc3RhdGljIGlubGluZSB2b2lkIHN5c2NhbGxfcm9sbGJhY2soc3RydWN0IHRhc2tfc3RydWN0
ICp0YXNrLAo+ICAgCQkJCSAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgIHsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
