Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4115DC369A1
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Apr 2025 06:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNJ+Rx2hXdg+oqmkZttunpqd31vUst26dnoGUm5nRAE=; b=tW3qq6c8xkAMd0
	2cBh0dqj/SUC1azVRL0aXlNt4T2GETJ+k/59zRt/ZHFE069DCsKaFZwsdJoLiB5vR2phMYzCjqXS7
	4NLk7JSCUxKnPoslrbAebLX6xzENuu+inOw95YceQPIOw/fmk3m41nqgyf8Oc03UguQrvft7uc6rk
	Y14OI9azaq0NYqo11eICcudOCsNw9NO9V9+X3ZBY8H2BWuWT/8sQrvBUGQ+LMJPIdJWB7K1DwtWde
	fEksyfTUujgJXGDOIw+1RsDIciFJOiAN91H8a7uz+UefcCqlFOg+ByckoOYqmYcQuB9sE0Lx8eq/j
	77ap8nqTCZrfq0gpeT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22KA-00000002tRM-44xb;
	Tue, 08 Apr 2025 06:20:42 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22K7-00000002tQO-08rH;
	Tue, 08 Apr 2025 06:20:40 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZWw9P60QFz9vkm;
	Tue,  8 Apr 2025 07:48:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42ojJD_HJEii; Tue,  8 Apr 2025 07:48:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZWw9N2JlBz9vkp;
	Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 369B28B76C;
	Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aUNb9W1lbxmx; Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DC9078B767;
	Tue,  8 Apr 2025 07:48:21 +0200 (CEST)
Message-ID: <ff31c2ff-55be-452e-b94a-6a84c4583258@csgroup.eu>
Date: Tue, 8 Apr 2025 07:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] arch, mm: set max_mapnr when allocating memory
 map for FLATMEM
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-10-rppt@kernel.org>
 <4b9627f2-65ff-4baf-931f-4e23b5732e6b@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <4b9627f2-65ff-4baf-931f-4e23b5732e6b@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_232039_225630_C33F7E58 
X-CRM114-Status: GOOD (  12.72  )
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

SGkgTWlrZSwKCkxlIDE0LzAzLzIwMjUgw6AgMTA6MjUsIENocmlzdG9waGUgTGVyb3kgYSDDqWNy
aXTCoDoKPiAKPiAKPiBMZSAxMy8wMy8yMDI1IMOgIDE0OjQ5LCBNaWtlIFJhcG9wb3J0IGEgw6lj
cml0wqA6Cj4+IEZyb206ICJNaWtlIFJhcG9wb3J0IChNaWNyb3NvZnQpIiA8cnBwdEBrZXJuZWwu
b3JnPgo+Pgo+PiBtYXhfbWFwbnIgaXMgZXNzZW50aWFsbHkgdGhlIHNpemUgb2YgdGhlIG1lbW9y
eSBtYXAgZm9yIHN5c3RlbXMgdGhhdCB1c2UKPj4gRkxBVE1FTS4gVGhlcmUgaXMgbm8gcmVhc29u
IHRvIGNhbGN1bGF0ZSBpdCBpbiBlYWNoIGFuZCBldmVyeSAKPj4gYXJjaGl0ZWN0dXJlCj4+IHdo
ZW4gaXQncyBhbnl3YXkgY2FsY3VsYXRlZCBpbiBhbGxvY19ub2RlX21lbV9tYXAoKS4KPj4KPj4g
RHJvcCBzZXR0aW5nIG9mIG1heF9tYXBuciBmcm9tIGFyY2hpdGVjdHVyZSBjb2RlIGFuZCBzZXQg
aXQgb25jZSBpbgo+PiBhbGxvY19ub2RlX21lbV9tYXAoKS4KPiAKPiBBcyBmYXIgYXMgSSBjYW4g
c2VlIGFsbG9jX25vZGVfbWVtX21hcCgpIGlzIGNhbGxlZCBxdWl0ZSBsYXRlLgo+IAo+IEkgZmVh
ciB0aGF0IGl0IHdpbGwgcmVncmVzcyBjb21taXQgZGFhOWFkYTIwOTNlICgicG93ZXJwYy9tbTog
Rml4IGJvb3QgCj4gY3Jhc2ggd2l0aCBGTEFUTUVNIikKPiAKPiBDYW4geW91IGNoZWNrID8KCkkg
c2VlIHRoaXMgcGF0Y2ggaXMgbm93IG1lcmdlZCBpbnRvIG1haW5saW5lICh2Ni4xNS1yYzEpLiBI
YXZlIHlvdSBiZWVuIAphYmxlIHRvIGNoZWNrIGFuZC9vciBhbmFseXNlIHdoZXRoZXIgaXQgZG9l
c24ndCByZWdyZXNzIHRoZSBmaXggaW4gCmNvbW1pdCBkYWE5YWRhMjA5M2UgKCJwb3dlcnBjL21t
OiBGaXggYm9vdCBjcmFzaCB3aXRoIEZMQVRNRU0iKSA/CgpUaGFua3MKQ2hyaXN0b3BoZQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMt
YXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
