Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07D4CD379F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Sep 2024 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KjSf8sxj/ZES7CUJ/m9tkfJCuAKbyRE3r09GFVzx1E=; b=iD8Mk4HIcZdUSk
	+eruBdDSe1CPjGMVoAKxUiqq/8/Ayd7VJgoaC/8fFS1t+MvY3OwSXOOI6ynKGuHI9VlhMEL7HSZlE
	arlcEZAc5e3KdRFblppIYmfKz/zwv6RSGmlYJV6P9fZa2QnVTZBMwiELZUs3LMR28TTLXep2iLIH5
	JTQJ6RrxUJrdrbAD9+qFGqBeK8CVP/nGgmbBS7nuzh9iWIoFIpT0VJRnXCxp4JXhGC3/lamnpzebg
	UHB6xAZdH1uhJAt+LhfzOvLv+xr2Ndru2S0oeFD8kckGUbR3bX1TfPzYwffY2XQnC34Fy+DFgTTC/
	Wi6Cw9DXotJuQBYdxpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slXB0-00000001H56-0nDj;
	Tue, 03 Sep 2024 17:18:46 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slXAt-00000001H0r-0xlV;
	Tue, 03 Sep 2024 17:18:41 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wyslp6shpz9sSC;
	Tue,  3 Sep 2024 19:18:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEi4N-oS1BVW; Tue,  3 Sep 2024 19:18:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wysln4fbCz9sSH;
	Tue,  3 Sep 2024 19:18:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E91E8B779;
	Tue,  3 Sep 2024 19:18:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id pxEcRzUEidZI; Tue,  3 Sep 2024 19:18:29 +0200 (CEST)
Received: from [192.168.234.228] (unknown [192.168.234.228])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CEB98B774;
	Tue,  3 Sep 2024 19:18:27 +0200 (CEST)
Message-ID: <6b07c48d-656f-4e42-bfa7-0ecead72a7b8@csgroup.eu>
Date: Tue, 3 Sep 2024 19:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/4] mm: Add hint and mmap_flags to struct
 vm_unmapped_area_info
To: Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <20240829-patches-below_hint_mmap-v2-2-638a28d9eae0@rivosinc.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240829-patches-below_hint_mmap-v2-2-638a28d9eae0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_101839_443902_678FA864 
X-CRM114-Status: GOOD (  20.07  )
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

SGkgQ2hhcmxpZSwKCkxlIDI5LzA4LzIwMjQgw6AgMDk6MTUsIENoYXJsaWUgSmVua2lucyBhIMOp
Y3JpdMKgOgo+IFRoZSBoaW50IGFkZHJlc3MgYW5kIG1tYXBfZmxhZ3MgYXJlIG5lY2Vzc2FyeSB0
byBkZXRlcm1pbmUgaWYKPiBNQVBfQkVMT1dfSElOVCByZXF1aXJlbWVudHMgYXJlIHNhdGlzZmll
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMu
Y29tPgo+IC0tLQo+ICAgYXJjaC9hbHBoYS9rZXJuZWwvb3NmX3N5cy5jICAgICAgfCAyICsrCj4g
ICBhcmNoL2FyYy9tbS9tbWFwLmMgICAgICAgICAgICAgICB8IDMgKysrCj4gICBhcmNoL2FybS9t
bS9tbWFwLmMgICAgICAgICAgICAgICB8IDcgKysrKysrKwo+ICAgYXJjaC9jc2t5L2FiaXYxL21t
YXAuYyAgICAgICAgICAgfCAzICsrKwo+ICAgYXJjaC9sb29uZ2FyY2gvbW0vbW1hcC5jICAgICAg
ICAgfCAzICsrKwo+ICAgYXJjaC9taXBzL21tL21tYXAuYyAgICAgICAgICAgICAgfCAzICsrKwo+
ICAgYXJjaC9wYXJpc2Mva2VybmVsL3N5c19wYXJpc2MuYyAgfCAzICsrKwo+ICAgYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L3NsaWNlLmMgfCA3ICsrKysrKysKPiAgIGFyY2gvczM5MC9tbS9odWdl
dGxicGFnZS5jICAgICAgIHwgNCArKysrCj4gICBhcmNoL3MzOTAvbW0vbW1hcC5jICAgICAgICAg
ICAgICB8IDYgKysrKysrCj4gICBhcmNoL3NoL21tL21tYXAuYyAgICAgICAgICAgICAgICB8IDYg
KysrKysrCj4gICBhcmNoL3NwYXJjL2tlcm5lbC9zeXNfc3BhcmNfMzIuYyB8IDMgKysrCj4gICBh
cmNoL3NwYXJjL2tlcm5lbC9zeXNfc3BhcmNfNjQuYyB8IDYgKysrKysrCj4gICBhcmNoL3NwYXJj
L21tL2h1Z2V0bGJwYWdlLmMgICAgICB8IDQgKysrKwo+ICAgYXJjaC94ODYva2VybmVsL3N5c194
ODZfNjQuYyAgICAgfCA2ICsrKysrKwo+ICAgYXJjaC94ODYvbW0vaHVnZXRsYnBhZ2UuYyAgICAg
ICAgfCA0ICsrKysKPiAgIGZzL2h1Z2V0bGJmcy9pbm9kZS5jICAgICAgICAgICAgIHwgNCArKysr
Cj4gICBpbmNsdWRlL2xpbnV4L21tLmggICAgICAgICAgICAgICB8IDIgKysKPiAgIG1tL21tYXAu
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgNiArKysrKysKPiAgIDE5IGZpbGVzIGNoYW5nZWQs
IDgyIGluc2VydGlvbnMoKykKPiAKCj4gICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21t
L2Jvb2szczY0L3NsaWNlLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc2xpY2UuYwo+IGlu
ZGV4IGVmM2NlMzdmMWJiMy4uZjBlMjU1MGFmNmQwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9tbS9ib29rM3M2NC9zbGljZS5jCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3Ns
aWNlLmMKPiBAQCAtMjg2LDYgKzI4NiwxMCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBzbGljZV9m
aW5kX2FyZWFfYm90dG9tdXAoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gICAJCS5sZW5ndGggPSBs
ZW4sCj4gICAJCS5hbGlnbl9tYXNrID0gUEFHRV9NQVNLICYgKCgxdWwgPDwgcHNoaWZ0KSAtIDEp
LAo+ICAgCX07Cj4gKwo+ICsJaW5mby5oaW50ID0gYWRkcjsKPiArCWluZm8ubW1hcF9mbGFncyA9
IGZsYWdzOwo+ICsKPiAgIAkvKgo+ICAgCSAqIENoZWNrIHRpbGwgdGhlIGFsbG93IG1heCB2YWx1
ZSBmb3IgdGhpcyBtbWFwIHJlcXVlc3QKPiAgIAkgKi8KPiBAQCAtMzMxLDYgKzMzNSw5IEBAIHN0
YXRpYyB1bnNpZ25lZCBsb25nIHNsaWNlX2ZpbmRfYXJlYV90b3Bkb3duKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLAo+ICAgCX07Cj4gICAJdW5zaWduZWQgbG9uZyBtaW5fYWRkciA9IG1heChQQUdFX1NJ
WkUsIG1tYXBfbWluX2FkZHIpOwo+ICAgCj4gKwlpbmZvLmhpbnQgPSBhZGRyOwo+ICsJaW5mby5t
bWFwX2ZsYWdzID0gZmxhZ3M7Cj4gKwo+ICAgCS8qCj4gICAJICogSWYgd2UgYXJlIHRyeWluZyB0
byBhbGxvY2F0ZSBhYm92ZSBERUZBVUxUX01BUF9XSU5ET1cKPiAgIAkgKiBBZGQgdGhlIGRpZmZl
cmVudCB0byB0aGUgbW1hcF9iYXNlLgoKcHBjNjRfZGVmY29uZmlnOgoKICAgQ0MgICAgICBhcmNo
L3Bvd2VycGMvbW0vYm9vazNzNjQvc2xpY2UubwphcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc2xp
Y2UuYzogSW4gZnVuY3Rpb24gJ3NsaWNlX2ZpbmRfYXJlYV9ib3R0b211cCc6CmFyY2gvcG93ZXJw
Yy9tbS9ib29rM3M2NC9zbGljZS5jOjI5MToyNzogZXJyb3I6ICdmbGFncycgdW5kZWNsYXJlZCAK
KGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogICAyOTEgfCAgICAgICAgIGluZm8ubW1hcF9m
bGFncyA9IGZsYWdzOwogICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+CmFy
Y2gvcG93ZXJwYy9tbS9ib29rM3M2NC9zbGljZS5jOjI5MToyNzogbm90ZTogZWFjaCB1bmRlY2xh
cmVkIAppZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBp
dCBhcHBlYXJzIGluCmFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9zbGljZS5jOiBJbiBmdW5jdGlv
biAnc2xpY2VfZmluZF9hcmVhX3RvcGRvd24nOgphcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc2xp
Y2UuYzozMzk6Mjc6IGVycm9yOiAnZmxhZ3MnIHVuZGVjbGFyZWQgCihmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKICAgMzM5IHwgICAgICAgICBpbmZvLm1tYXBfZmxhZ3MgPSBmbGFnczsKICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fgptYWtlWzVdOiAqKiogW3Njcmlw
dHMvTWFrZWZpbGUuYnVpbGQ6MjQ0OiAKYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3NsaWNlLm9d
IEVycm9yIDEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
