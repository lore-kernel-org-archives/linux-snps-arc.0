Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2699AE77188
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYzPNW5vL0NHG9a0BYlZvsPmFTFr8bURyvxZnZyozos=; b=N7zaIx9NdIHgO6
	WtiV21XbHhsTBwxO8ppKFPTRMz8kuRsPcRhK9hnNtGRr7eoD7T+RXsfaPSBAcdJe+73miWFMCt+Uo
	KF6BHKU5ZIfjxoETNKGCoPXwEfF85hmvslML1uwwsnhLM9yX4syZ7WuGdvfBtYJRoeui5DV1Aa7Rc
	M+0BZRhUQ3cM+8DlXMJ0u7/iNngQkd+abvEg+Jg+zsi5l48JR26+8h+eUMYumc85i8IUP/CyORknV
	MGGujPoxAQf8hfT35EW7Oba+bA3Huo2nMxgkjtycRVD2Wnp9nNIr2+maUdmQoNZBTEqlQOA/Ku20G
	3zx8d3x7ObLgpJR6lmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe0r-000000058u4-3cM5;
	Fri, 20 Dec 2024 14:29:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdzh-000000058nO-0Rio;
	Fri, 20 Dec 2024 14:28:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59F5F1480;
	Fri, 20 Dec 2024 06:29:12 -0800 (PST)
Received: from [10.57.72.191] (unknown [10.57.72.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FAEB3F720;
	Fri, 20 Dec 2024 06:28:38 -0800 (PST)
Message-ID: <7f5e6ac7-01ef-46c8-bc85-7f8399dadb19@arm.com>
Date: Fri, 20 Dec 2024 15:28:36 +0100
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
 <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
 <33ce9b58-4787-49cd-a7f2-34272cb3ecf7@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <33ce9b58-4787-49cd-a7f2-34272cb3ecf7@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_062845_193521_4E004201 
X-CRM114-Status: GOOD (  16.76  )
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

T24gMjAvMTIvMjAyNCAxNToxNiwgUWkgWmhlbmcgd3JvdGU6Cj4+Pgo+Pj4gRGlkIEkgbWlzcyBz
b21ldGhpbmc/Cj4+Pgo+Pj4gTXkgcGF0Y2ggc2VyaWVzIGlzIG5vdCBvbmx5IGZvciBjbGVhbnVw
LCBidXQgYWxzbyBmb3IgZml4ZXMgb2YKPj4+IFVBRiBpc3N1ZSBbMV0sIHNvIGlzIGl0IHBvc3Np
YmxlIHRvIHJlYmFzZSB5b3VyIHBhdGNoIHNlcmllcyBvbnRvCj4+PiBtaW5lPyBJIGNhbiBwb3N0
IHYzIEFTQVAuCj4+Cj4+IEkgc2VlLCB5b3VycyBzaG91bGQgYmUgbWVyZ2VkIGZpcnN0IHRoZW4u
IFRoZSBpc3N1ZSBpcyB0aGF0IHlvdXJzIHdvdWxkCj4+IGRlcGVuZCBvbiBzb21lIG9mIHRoZSBw
YXRjaGVzIGluIG1pbmUsIG5vdCB0aGUgb3RoZXIgd2F5IHJvdW5kLgo+Pgo+PiBNeSBzdWdnZXN0
aW9uIHdvdWxkIHRoZW4gYmUgZm9yIHlvdSB0byB0YWtlIHBhdGNoIDUsIDYgYW5kIDcgZnJvbSBt
eQo+PiBzZXJpZXMsIGFzIHRoZXkgbWF0Y2ggQWxleGFuZGVyJ3Mgc3VnZ2VzdGlvbnMgKGFuZCBw
YXRjaCA1IGlzIEkgdGhpbmsgYQo+PiB1c2VmdWwgc2ltcGxpZmljYXRpb24pLCBhbmQgcmVwbGFj
ZSBwYXRjaCAyIGluIHlvdXIgc2VyaWVzIHdpdGggdGhvc2UuIEkKPj4gd291bGQgdGhlbiByZWJh
c2UgbXkgc2VyaWVzIG9uIHRvcCBhbmQgYWRhcHQgaXQgYWNjb3JkaW5nbHkuIERvZXMgdGhhdAo+
PiBzb3VuZCByZWFzb25hYmxlPwo+Cj4gU291bmRzIGdvb2QuIEJ1dCBtYXliZSBqdXN0IHBhdGNo
IDUgYW5kIDYuIEJlY2F1c2UgSSBhY3R1YWxseSBkaWQKPiB0aGUgd29yayBvZiB5b3VyIHBhdGNo
IDcgaW4gbXkgcGF0Y2ggMiBhbmQgNC4KClllcyB0aGF0J3MgZmFpciEgWW91J2QgaGF2ZSB0byBk
byBhZGFwdCBteSBwYXRjaCA3IHRvIG1ha2UgaXQgZml0IGluCnlvdXIgc2VyaWVzIHNvIEkgYWdy
ZWUgaXQgbWFrZXMgbW9yZSBzZW5zZSB0aGlzIHdheS4KCj4KPiBTbywgaXMgaXQgb2theSB0byBk
byBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nPwo+Cj4gMS4gSSBzZXBhcmF0ZSB0aGUgY3Rv
cigpL2R0b3IoKSBwYXJ0IGZyb20gbXkgcGF0Y2ggMiwgYW5kIHRoZW4gcmVwbGFjZQo+IMKgwqAg
dGhlIHJlc3Qgd2l0aCB5b3VyIHBhdGNoIDYuCj4gMi4gdGFrZSB5b3VyIHBhdGNoIDUgZm9ybSB5
b3VyIHNlcmllcwoKU291bmRzIGdvb2QgdG8gbWUhCgpJSVVDIERhdmUgSGFuc2VuIGdhdmUgaGlz
IEFja2VkLWJ5IGZvciB0aGUgeDg2IHBhcnQgb2YgcGF0Y2ggNiBbMV0sCndvdWxkIG1ha2Ugc2Vu
c2UgdG8gYWRkIGl0IHdoZW4geW91IHBvc3QgeW91ciB2My4KCj4KPiBJZiBpdCdzIG9rLCBJIHdp
bGwgcG9zdCB0aGUgdjMgbmV4dCBNb25kYXkuIDspCgpQZXJmZWN0LiBJJ20gZ29pbmcgb2ZmbGlu
ZSB0b25pZ2h0LCB3aGVuIEkgY29tZSBiYWNrIGluIHRoZSBuZXcgeWVhcgpJJ2xsIHJldmlldyB5
b3VyIHYzIHNlcmllcyBhbmQgcG9zdCBhIG5ldyB2ZXJzaW9uIG9mIHRoaXMgb25lLgoKQ2hlZXJz
LAotIEtldmluCgpbMV0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vYTczOTg0MjYt
NTZkMS00MGI0LWExYzktNDBhZThjOGE0YjRiQGludGVsLmNvbS8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlz
dApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
