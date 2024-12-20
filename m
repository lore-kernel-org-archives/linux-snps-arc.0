Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A4EE77188
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAd7gN6d413h2cZwyvBf51+hfchNGOzWQkDtVKK/bEg=; b=nzTY2cJezrlRSk
	pwVxmdqPYrEBhtN7+zRT9Axtyrxq7J8E1iqZc/4L2/WxzqWsZ+bpgxtkpevXw/C0PE+9EWz793gIq
	HuK6A3GHpoPhl3ZRbXPkoC9vVeLo77qPptEEfj5bAp7rCmfHnf8EC2PoLBwjvK099LMkmFrYzd6GM
	mp14C86uLrKjVlO4olJCJ/hh5PfD9/kcplxsQECrF9cv6RykBMXdgl/3eF8B0CbRMx++sWP00TVCb
	b15cFOqgpGieSv5lFqRNoODalxdM2Cq37v5rOEyWI5AWVsXnO3yASvoYOBaXRqcVOFE2Z4s52H51o
	0V7NK2bHchb48WZEBkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdgO-0000000569R-0g5g;
	Fri, 20 Dec 2024 14:08:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdOc-000000053BE-3lFF;
	Fri, 20 Dec 2024 13:50:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E7851480;
	Fri, 20 Dec 2024 05:50:53 -0800 (PST)
Received: from [10.57.72.191] (unknown [10.57.72.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2793F720;
	Fri, 20 Dec 2024 05:50:19 -0800 (PST)
Message-ID: <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
Date: Fri, 20 Dec 2024 14:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
 <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055027_022512_22F03776 
X-CRM114-Status: GOOD (  16.88  )
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

T24gMjAvMTIvMjAyNCAxMjo0NiwgUWkgWmhlbmcgd3JvdGU6Cj4gSGkgS2V2aW4sCj4KPiBPbiAy
MDI0LzEyLzIwIDE4OjQ5LCBLZXZpbiBCcm9kc2t5IHdyb3RlOgo+PiBbLi4uXQo+Pgo+PiBRaSwg
c2hhbGwgd2UgY29sbGFib3JhdGUgdG8gbWFrZSBvdXIgc2VyaWVzIGNvbXBsZW1lbnRhcnk/IEkg
YmVsaWV2ZSBteQo+PiBzZXJpZXMgY292ZXJzIHBhdGNoIDIgYW5kIDQgb2YgeW91ciBzZXJpZXMs
IGJ1dCBpdCBnb2VzIGZ1cnRoZXIgYnkKPj4gY292ZXJpbmcgYWxsIGxldmVscyBhbmQgYWxsIGFy
Y2hpdGVjdHVyZXMsIGFuZCBwYXRjaGVzIGludHJvZHVjaW5nCj4+IGN0b3IvZHRvciBhcmUgYWxy
ZWFkeSBzcGxpdCBhcyBBbGV4YW5kZXIgc3VnZ2VzdGVkIG9uIHlvdXIgc2VyaWVzLiBTbyBteQo+
PiBzdWdnZXN0aW9uIHdvdWxkIGJlOgo+Pgo+PiAqIFJlbW92ZSBwYXRjaCAxIGluIG15IHNlcmll
cyAtIEknZCBqdXN0IGludHJvZHVjZQo+PiBwYWdldGFibGVfe3A0ZCxwZ2R9X1tjZF10b3Igd2l0
aCB0aGUgc2FtZSBpbXBsZW1lbnRhdGlvbiBhcwo+PiBwYWdldGFibGVfcHVkX1tjZF10b3IuCj4+
ICogUmVtb3ZlIHBhdGNoIDIgYW5kIDQgZnJvbSB5b3VyIHNlcmllcyBhbmQgcmViYXNlIGl0IG9u
IG1pbmUuCj4KPiBJIHF1aWNrbHkgd2VudCB0aHJvdWdoIHlvdXIgcGF0Y2ggc2VyaWVzLiBJdCBs
b29rcyBsaWtlIG15IHBhdGNoIDIgYW5kCj4geW91ciBwYXRjaCA2IGFyZSBkdXBsaWNhdGVkLCBz
byB5b3Ugd2FudCBtZSB0byByZW1vdmUgbXkgcGF0Y2ggMi4KPgo+IEJ1dCBJIHRoaW5rIHlvdSBt
YXkgbm90IGJlIGFibGUgdG8gc2ltcGxlIGxldCBhcm02NCwgcmlzY3YgYW5kIHg4NiB0bwo+IHVz
ZSBnZW5lcmljIHA0ZF97YWxsb2Nfb25lLGZyZWV9KCkuIEJlY2F1c2UgZXZlbiBpZgo+IENPTkZJ
R19QR1RBQkxFX0xFVkVMUyA+IDQsIHRoZSBwZ3RhYmxlX2w1X2VuYWJsZWQoKSBtYXkgbm90IGJl
IHRydWUuCj4KPiBGb3IgZXhhbXBsZSwgaW4gYXJtNjQ6Cj4KPiAjaWYgQ09ORklHX1BHVEFCTEVf
TEVWRUxTID4gNAo+Cj4gc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHBndGFibGVfbDVfZW5h
YmxlZCh2b2lkKQo+IHsKPiDCoMKgwqDCoGlmICghYWx0ZXJuYXRpdmVfaGFzX2NhcF9saWtlbHko
QVJNNjRfQUxXQVlTX0JPT1QpKQo+IMKgwqDCoMKgwqDCoMKgIHJldHVybiB2YWJpdHNfYWN0dWFs
ID09IFZBX0JJVFM7Cj4gwqDCoMKgwqByZXR1cm4gYWx0ZXJuYXRpdmVfaGFzX2NhcF91bmxpa2Vs
eShBUk02NF9IQVNfVkE1Mik7Cj4gfQoKQ29ycmVjdC4gVGhhdCdzIHdoeSB0aGUgaW1wbGVtZW50
YXRpb24gb2YgcDRkX2ZyZWUoKSBJIGludHJvZHVjZSBpbgpwYXRjaCA2IGNoZWNrcyBtbV9wNGRf
Zm9sZGVkKCksIHdoaWNoIGlzIGltcGxlbWVudGVkIGFzCiFwZ3RhYmxlX2w1X2VuYWJsZWQoKSBv
biB0aG9zZSBhcmNoaXRlY3R1cmVzIChzZWUgbGFzdCBwYXJhZ3JhcGggaW4KY29tbWl0IG1lc3Nh
Z2UpLiBJbiBmYWN0IGl0IHR1cm5zIG91dCBBbGV4YW5kZXIgc3VnZ2VzdGVkIGV4YWN0bHkgdGhp
cwphcHByb2FjaCBbMl0uCgo+Cj4gRGlkIEkgbWlzcyBzb21ldGhpbmc/Cj4KPiBNeSBwYXRjaCBz
ZXJpZXMgaXMgbm90IG9ubHkgZm9yIGNsZWFudXAsIGJ1dCBhbHNvIGZvciBmaXhlcyBvZgo+IFVB
RiBpc3N1ZSBbMV0sIHNvIGlzIGl0IHBvc3NpYmxlIHRvIHJlYmFzZSB5b3VyIHBhdGNoIHNlcmll
cyBvbnRvCj4gbWluZT8gSSBjYW4gcG9zdCB2MyBBU0FQLgoKSSBzZWUsIHlvdXJzIHNob3VsZCBi
ZSBtZXJnZWQgZmlyc3QgdGhlbi4gVGhlIGlzc3VlIGlzIHRoYXQgeW91cnMgd291bGQKZGVwZW5k
IG9uIHNvbWUgb2YgdGhlIHBhdGNoZXMgaW4gbWluZSwgbm90IHRoZSBvdGhlciB3YXkgcm91bmQu
CgpNeSBzdWdnZXN0aW9uIHdvdWxkIHRoZW4gYmUgZm9yIHlvdSB0byB0YWtlIHBhdGNoIDUsIDYg
YW5kIDcgZnJvbSBteQpzZXJpZXMsIGFzIHRoZXkgbWF0Y2ggQWxleGFuZGVyJ3Mgc3VnZ2VzdGlv
bnMgKGFuZCBwYXRjaCA1IGlzIEkgdGhpbmsgYQp1c2VmdWwgc2ltcGxpZmljYXRpb24pLCBhbmQg
cmVwbGFjZSBwYXRjaCAyIGluIHlvdXIgc2VyaWVzIHdpdGggdGhvc2UuIEkKd291bGQgdGhlbiBy
ZWJhc2UgbXkgc2VyaWVzIG9uIHRvcCBhbmQgYWRhcHQgaXQgYWNjb3JkaW5nbHkuIERvZXMgdGhh
dApzb3VuZCByZWFzb25hYmxlPwoKLSBLZXZpbgoKWzJdCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC9aMlJLcGR2N3BMMzRNSUV0QHR1eG1ha2VyLmJvZWJsaW5nZW4uZGUuaWJtLmNvbS8KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBz
LWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
