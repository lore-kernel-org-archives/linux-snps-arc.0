Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8688CC433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Feb 2022 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x99LRoGmXhriPFxhtWwhlFOXEUGPKMBkfgOrLEoypCs=; b=k8/4cjK4QN5j1Z
	+1m0QPBul6pbYXaj2S6QIJ6svzQymyRS5YQTpSHcFF4BVoYGYzEi00cAVXlP+T5f1N0BDvYmSTi1F
	2FulBr5N50W6x+c3YjpO3+F2Su1HAl1DUD1B9ZvdDXuAVBGCqQJZsaQ+fs8M3nYU0EMofNA1fzxtS
	Fm/5Il2VONbiqgBeHhuw4dV8HNhZIPpueBZ1dcAqkPptPZZpQwo9kiCr4nS1mZDd476vbc0dEACMs
	lrOHRt1XvlRyxc0A+yHBcynNAvGeDDeBB9ErbEy2ktFoPuvjhnXR/7YYhJCY3n4BMaxZnZpCj04R4
	CQF5iTpvk+ZJ+7QDfCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKbYZ-009Ghz-OF; Thu, 17 Feb 2022 07:50:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKbYS-009GeS-EK; Thu, 17 Feb 2022 07:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6D8A61B24;
 Thu, 17 Feb 2022 07:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1726AC34103;
 Thu, 17 Feb 2022 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645084218;
 bh=mjFs6zWH8/AqiitYOR0rg+8IkEbypYLpH0MSBavFTDs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ui56qAsGR7APjQYSLg9XL/ZIa/PPx0RKWI5LxqagrX5zcmSOSpzR0ErZ3OTPGyQFp
 6CPxOmHnujCQSNTQ0KN26MoUUc3IJLZLdwR9DndXZeJRvzn+qkmmcqY1a9Fb6ETI1n
 XvxnAKaoQoBBUUkmU/9bqU+Rd5qdvID6VlK14PqWYMDCgXy5Dx1y3bSR3hYSi9jQ9x
 MpW/x/IlyKdAd61ULRg1cVo3IkXkEg6r22+6DAqiYXuP9IXr+4NtJdvA8wJsPYy4kJ
 nsSyOeEbLkUnni9Aawmz62im5NVvv/rrnOfNp56owZbEHJwaf3RV96a5mhigBobs+/
 ZzUC4Z53uAsWQ==
Received: by mail-wm1-f43.google.com with SMTP id k41so2615800wms.0;
 Wed, 16 Feb 2022 23:50:18 -0800 (PST)
X-Gm-Message-State: AOAM530Rr/J6gLe4e5phxUwFTFrZNKCLG/AcGyceIxJBhZBZ5+poGKCv
 2H/b4axg6AAjQkACArA2jIe0K/8VwsMBHvZXEPQ=
X-Google-Smtp-Source: ABdhPJxVHiNpam6v+gNoOoH0mO2de38FsGKKulVVSeiH+uDoJW6u9JTqRXgzs52TA7IQLSGpUpbHMUpXX+Sk75rMI5w=
X-Received: by 2002:a05:600c:2108:b0:34e:870:966e with SMTP id
 u8-20020a05600c210800b0034e0870966emr4902681wml.173.1645084215917; Wed, 16
 Feb 2022 23:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <00496df2-f9f2-2547-3ca3-7989e4713d6b@csgroup.eu>
In-Reply-To: <00496df2-f9f2-2547-3ca3-7989e4713d6b@csgroup.eu>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 17 Feb 2022 08:49:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3_dPbjB23QffnYMtw+5ojfwChrVC8LLMQqNctU7Nh+mQ@mail.gmail.com>
Message-ID: <CAK8P3a3_dPbjB23QffnYMtw+5ojfwChrVC8LLMQqNctU7Nh+mQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] clean up asm/uaccess.h, kill set_fs for good
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, 
 "dalias@libc.org" <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>, 
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "guoren@kernel.org" <guoren@kernel.org>, 
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
 "bcain@codeaurora.org" <bcain@codeaurora.org>, "deller@gmx.de" <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>, 
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>, 
 "geert@linux-m68k.org" <geert@linux-m68k.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, 
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, 
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, 
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "green.hu@gmail.com" <green.hu@gmail.com>, 
 "shorne@gmail.com" <shorne@gmail.com>, "monstr@monstr.eu" <monstr@monstr.eu>, 
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, 
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
 "nickhu@andestech.com" <nickhu@andestech.com>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>, 
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "richard@nod.at" <richard@nod.at>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_235020_594516_AF096DAA 
X-CRM114-Status: GOOD (  28.37  )
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

T24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgODoyMCBBTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+IExlIDE2LzAyLzIwMjIgw6AgMTQ6MTMsIEFy
bmQgQmVyZ21hbm4gYSDDqWNyaXQgOgo+ID4KPiA+IENocmlzdG9waCBIZWxsd2lnIGFuZCBhIGZl
dyBvdGhlcnMgc3BlbnQgYSBodWdlIGVmZm9ydCBvbiByZW1vdmluZwo+ID4gc2V0X2ZzKCkgZnJv
bSBtb3N0IG9mIHRoZSBpbXBvcnRhbnQgYXJjaGl0ZWN0dXJlcywgYnV0IGFib3V0IGhhbGYgdGhl
Cj4gPiBvdGhlciBhcmNoaXRlY3R1cmVzIHdlcmUgbmV2ZXIgY29tcGxldGVkIGV2ZW4gdGhvdWdo
IG1vc3Qgb2YgdGhlbSBkb24ndAo+ID4gYWN0dWFsbHkgdXNlIHNldF9mcygpIGF0IGFsbC4KPiA+
Cj4gPiBJIGRpZCBhIHBhdGNoIGZvciBtaWNyb2JsYXplIGF0IHNvbWUgcG9pbnQsIHdoaWNoIHR1
cm5lZCBvdXQgdG8gYmUgZmFpcmx5Cj4gPiBnZW5lcmljLCBhbmQgbm93IHBvcnRlZCBpdCB0byBt
b3N0IG90aGVyIGFyY2hpdGVjdHVyZXMsIHVzaW5nIG5ldyBnZW5lcmljCj4gPiBpbXBsZW1lbnRh
dGlvbnMgb2YgYWNjZXNzX29rKCkgYW5kIF9fe2dldCxwdXR9X2tlcm5lbF9ub2NoZWNrKCkuCj4g
Pgo+ID4gVGhyZWUgYXJjaGl0ZWN0dXJlcyAoc3BhcmM2NCwgaWE2NCwgYW5kIHNoKSBuZWVkZWQg
c29tZSBleHRyYSB3b3JrLAo+ID4gd2hpY2ggSSBhbHNvIGNvbXBsZXRlZC4KPiA+Cj4gPiBUaGUg
ZmluYWwgc2VyaWVzIGNvbnRhaW5zIGV4dHJhIGNsZWFudXAgY2hhbmdlcyB0aGF0IHRvdWNoIGFs
bAo+ID4gYXJjaGl0ZWN0dXJlcy4gUGxlYXNlIHJldmlldyBhbmQgdGVzdCB0aGVzZSwgc28gd2Ug
Y2FuIG1lcmdlIHRoZW0KPiA+IGZvciB2NS4xOC4KPgo+IEFzIGEgZnVydGhlciBjbGVhbnVwLCBo
YXZlIHlvdSB0aG91Z2h0IGFib3V0IG1ha2luZyBhIGdlbmVyaWMgdmVyc2lvbiBvZgo+IGNsZWFy
X3VzZXIoKSA/IE9uIGFsbW9zdCBhbGwgYXJjaGl0ZWN0dXJlcywgY2xlYXJfdXNlcigpIGRvZXMg
YW4KPiBhY2Nlc3Nfb2soKSB0aGVuIGNhbGxzIF9fY2xlYXJfdXNlcigpIG9yIHNpbWlsYXIuCgpU
aGlzIGFscmVhZHkgZXhpc3RzIGluIGluY2x1ZGUvYXNtLWdlbmVyaWMvdWFjY2Vzcy5oLCBidXQg
dGhhdCBmaWxlIGlzCmN1cnJlbnRseSBub3QgYXMgZWFzeSB0byB1c2UgYXMgaXQgc2hvdWxkIGJl
LiBJJ3ZlIHByZXZpb3VzbHkgbG9va2VkIGludG8Kd2hhdCBpdCB3b3VsZCB0YWtlIHRvIGdldCBt
b3JlIGFyY2hpdGVjdHVyZXMgdG8gdXNlIGNvbW1vbiBjb2RlCmluIHRoYXQgZmlsZSwgYnV0IEkg
Y3VycmVudGx5IGhhdmUgbm8gcGxhbnMgdG8gd29yayBvbiB0aGF0LgoKPiBNYXliZSBhbHNvIHRo
ZSBzYW1lIHdpdGggcHV0X3VzZXIoKSBhbmQgZ2V0X3VzZXIoKSA/IEFmdGVyIGFsbCBpdCBpcwo+
IGp1c3QgYWNjZXNzX29rKCkgZm9sbG93ZWQgYnkgX19wdXRfdXNlcigpIG9yIF9fZ2V0X3VzZXIo
KSA/IEl0IHNlZW1zCj4gbW9yZSB0cmlja3kgdGhvdWdoLCBhcyBzb21lIGFyY2hpdGVjdHVyZXMg
c2VlbXMgdG8gaGF2ZSBsZXNzIHRyaXZpYWwKPiBzdHVmZiB0aGVyZS4KClNhbWUgaGVyZTogYXJj
aGl0ZWN0dXJlcyBjYW4gYWxyZWFkeSBwcm92aWRlIGEgX19wdXRfdXNlcl9mbigpCmFuZCBfX2dl
dF91c2VyX2ZuKCksIHRvIGdldCB0aGUgZ2VuZXJpYyB2ZXJzaW9ucyBvZiB0aGUgaW50ZXJmYWNl
LApidXQgZmV3IGFyY2hpdGVjdHVyZXMgdXNlIHRoYXQuIFlvdSBjYW4gYWN0dWFsbHkgZ2V0IGFs
bCB0aGUgaW50ZXJmYWNlcwpieSBqdXN0IHByb3ZpZGluZyByYXdfY29weV9mcm9tX3VzZXIoKSBh
bmQgcmF3X2NvcHlfdG9fdXNlcigpLApidXQgdGhlIGdldF91c2VyL3B1dF91c2VyIHZlcnNpb25z
IHlvdSBnZXQgZnJvbSB0aGF0IGFyZSBmYWlybHkKaW5lZmZpY2llbnQuCgo+IEkgYWxzbyBzZWUg
YWxsIGFyY2hpdGVjdHVyZXMgaGF2ZSBhIHByb3RvdHlwZSBmb3Igc3RybmNweV9mcm9tX3VzZXIo
KQo+IGFuZCBzdHJubGVuX3VzZXIoKS4gQ291bGQgYmUgYSBjb21tb24gcHJvdG90eXBlIGluc3Rl
YWQgd2hlbiB3ZSBoYXZlCj4gR0VORVJJQ19TVFJOQ1BZX0ZST01fVVNFUiAvIEdFTkVSSUNfU1RS
TkxFTl9VU0VSCj4KPiBBbmQgd2UgaGF2ZSBhbHNvCj4gdXNlcl9hY2Nlc3NfYmVnaW4oKS91c2Vy
X3JlYWRfYWNjZXNzX2JlZ2luKCkvdXNlcl93cml0ZV9hY2Nlc3NfYmVnaW4oKQo+IHdoaWNoIGNh
bGwgYWNjZXNzX29rKCkgdGhlbiBkbyB0aGUgcmVhbCB3b3JrLiBDb3VsZCBiZSBtYWRlIGdlbmVy
aWMgd2l0aAo+IGNhbGwgdG8gc29tZSBhcmNoIHNwZWNpZmljIF9fdXNlcl9hY2Nlc3NfYmVnaW4o
KSBhbmQgZnJpZW5kcyBhZnRlciB0aGUKPiBhY2Nlc3Nfb2soKSBhbmQgZXZlbnR1YWxseSB0aGUg
bWlnaHRfZmF1bHQoKS4KCkluIG15IG9waW5pb24sIHRoZSBiaWdnZXN0IHdpbiB3b3VsZCBiZSB0
byBtb3ZlIHRoZSB0eXBlLWFnbm9zdGljIHBhcnQgb2YKZ2V0X3VzZXIvcHV0X3VzZXIgaW50byBj
b21wbGV0ZWx5IGdlbmVyaWMgY29kZSwgdGhpcyBpcyB3aGF0IGFyY2hpdGVjdHVyZXMKZ2V0IHdy
b25nIHRoZSBtb3N0LCBzZWUgcGF0Y2ggMDIvMTggaW4gdGhpcyBzZXJpZXMgZm9yIGluc3RhbmNl
LgoKV2hhdCBJJ2QgbGlrZSB0byBzZWUgaXMgdGhhdCBhcmNoaXRlY3R1cmVzIG9ubHkgcHJvdmlk
ZSBmaXhlZC1sZW5ndGgKdmVyc2lvbnMgb2YgdW5zYWZlX2dldF91c2VyKCkvdW5zYWZlX3B1dF91
c2VyKCksIHdpdGggdGhlIHR5cGUtYWdub3N0aWMKdmVyc2lvbnMgKGdldF91c2VyKCksIF9fZ2V0
X3VzZXIoKSwgdW5zYWZlX2dldF91c2VyKCkgYW5kIHRoZWlyIHB1dAp2ZXJzaW9ucykgYWxsIGRl
ZmluZWQgb25jZSBpbiBpbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaCBiYXNlZCBvbiB0aG9zZS4KCkkg
dHJpZWQgaW1wbGVtZW50aW5nIHRoaXMgaW4gdGhlIHBhc3QsIGJ1dCB1bmZvcnR1bmF0ZWx5IHRo
ZSByZXN1bHRpbmcKb2JqZWN0IGNvZGUgZnJvbSBteSBnZW5lcmFsaXplZCBpbXBsZW1lbnRhdGlv
biB3YXMgd29yc2UgdGhhbgp3aGF0IHdlIGhhdmUgdG9kYXksIHNvIEkgZGlkIG5vdCBjb250aW51
ZSB0aGF0IHdvcmsuCgogICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
