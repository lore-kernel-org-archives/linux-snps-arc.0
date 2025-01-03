Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A16E77188
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jan 2025 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLnc8p2Dj7P0gMCFGG1+Q++M2z+0Czj4C5nTcPJWvtM=; b=B4Bz3c4wq2DlAc
	LWQ+WQcROfR9SzleCGtkcF/SHU+CrhBAh8/rcvetnhmJyEjl0pjk664kfk4Jde0S7MgVYaeyonMr3
	OO/kUWbcja1j4l+qRXqoFamgRFfAt32bb0j2bdM8dvQLB/VUS5PzoQgogbHxQSlNkvypNc4bkLhHa
	anQHpplleGQDvb1Ckgp2xdVRe9Lh/mvoCmgb7muhQWEh495IqppO9hWwoTqFmXGBX7Bq7IZNTqPbi
	+Wu08FGLIL7f0bUM67lHmsJvntKwA2IYv4pYBP/SgIASnKfjSu6FO/oWIog0ZX85rDVXSW6X+jIHo
	jkE6l4bl0ItYK38fzWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTf3b-0000000Ck1y-0hFI;
	Fri, 03 Jan 2025 10:37:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTf2M-0000000Cjvn-0ioI;
	Fri, 03 Jan 2025 10:36:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45A1D150C;
	Fri,  3 Jan 2025 02:36:41 -0800 (PST)
Received: from [10.44.160.93] (e126510-lin.lund.arm.com [10.44.160.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8736A3F6A8;
	Fri,  3 Jan 2025 02:36:06 -0800 (PST)
Message-ID: <39925677-4619-411d-b0b1-40f9db09374f@arm.com>
Date: Fri, 3 Jan 2025 11:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] riscv: mm: Skip pgtable level check in
 {pud,p4d}_alloc_one
To: Alexandre Ghiti <alex@ghiti.fr>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-6-kevin.brodsky@arm.com>
 <2aed338a-97a4-40e3-8a95-99458756ca28@ghiti.fr>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <2aed338a-97a4-40e3-8a95-99458756ca28@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_023614_303221_0C0F016B 
X-CRM114-Status: GOOD (  13.85  )
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

K1FpCgpPbiAwMy8wMS8yMDI1IDExOjMxLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gSGkgS2V2
aW4sCj4KPiBPbiAxOS8xMi8yMDI0IDE3OjQ0LCBLZXZpbiBCcm9kc2t5IHdyb3RlOgo+PiB7cG1k
LHB1ZCxwNGR9X2FsbG9jX29uZSgpIGlzIG5ldmVyIGNhbGxlZCBpZiB0aGUgY29ycmVzcG9uZGlu
ZyBwYWdlCj4+IHRhYmxlIGxldmVsIGlzIGZvbGRlZCwgYXMge3BtZCxwdWQscDRkfV9hbGxvYygp
IGFscmVhZHkgZG9lcyB0aGUKPj4gcmVxdWlyZWQgY2hlY2suIFdlIGNhbiB0aGVyZWZvcmUgcmVt
b3ZlIHRoZSBydW50aW1lIHBhZ2UgdGFibGUgbGV2ZWwKPj4gY2hlY2tzIGluIHtwdWQscDRkfV9h
bGxvY19vbmUuIFRoZSBQVUQgaGVscGVyIGJlY29tZXMgZXF1aXZhbGVudCB0bwo+PiB0aGUgZ2Vu
ZXJpYyB2ZXJzaW9uLCBzbyB3ZSByZW1vdmUgaXQgYWx0b2dldGhlci4KPj4KPj4gVGhpcyBpcyBj
b25zaXN0ZW50IHdpdGggdGhlIHdheSBhcm02NCBhbmQgeDg2IGhhbmRsZSB0aGlzIHNpdHVhdGlv
bgo+PiAocnVudGltZSBjaGVjayBpbiBwNGRfZnJlZSgpIG9ubHkpLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBLZXZpbiBCcm9kc2t5IDxrZXZpbi5icm9kc2t5QGFybS5jb20+Cj4+IC0tLQo+PiDCoCBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BnYWxsb2MuaCB8IDIyICsrKystLS0tLS0tLS0tLS0tLS0t
LS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+PiBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+IGluZGV4IGY1MjI2NDMwNGY3Ny4u
OGFkMGJiZTgzOGEyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BnYWxs
b2MuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+PiBAQCAtMTIs
NyArMTIsNiBAQAo+PiDCoCAjaW5jbHVkZSA8YXNtL3RsYi5oPgo+PiDCoCDCoCAjaWZkZWYgQ09O
RklHX01NVQo+PiAtI2RlZmluZSBfX0hBVkVfQVJDSF9QVURfQUxMT0NfT05FCj4+IMKgICNkZWZp
bmUgX19IQVZFX0FSQ0hfUFVEX0ZSRUUKPj4gwqAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BnYWxs
b2MuaD4KPj4gwqAgQEAgLTg4LDE1ICs4Nyw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwZ2RfcG9w
dWxhdGVfc2FmZShzdHJ1Y3QKPj4gbW1fc3RydWN0ICptbSwgcGdkX3QgKnBnZCwKPj4gwqDCoMKg
wqDCoCB9Cj4+IMKgIH0KPj4gwqAgLSNkZWZpbmUgcHVkX2FsbG9jX29uZSBwdWRfYWxsb2Nfb25l
Cj4+IC1zdGF0aWMgaW5saW5lIHB1ZF90ICpwdWRfYWxsb2Nfb25lKHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tLCB1bnNpZ25lZAo+PiBsb25nIGFkZHIpCj4+IC17Cj4+IC3CoMKgwqAgaWYgKHBndGFibGVf
bDRfZW5hYmxlZCkKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBfX3B1ZF9hbGxvY19vbmUobW0s
IGFkZHIpOwo+PiAtCj4+IC3CoMKgwqAgcmV0dXJuIE5VTEw7Cj4+IC19Cj4+IC0KPj4gwqAgI2Rl
ZmluZSBwdWRfZnJlZSBwdWRfZnJlZQo+PiDCoCBzdGF0aWMgaW5saW5lIHZvaWQgcHVkX2ZyZWUo
c3RydWN0IG1tX3N0cnVjdCAqbW0sIHB1ZF90ICpwdWQpCj4+IMKgIHsKPj4gQEAgLTExOCwxNSAr
MTA4LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3B1ZF9mcmVlX3RsYihzdHJ1Y3QKPj4gbW11
X2dhdGhlciAqdGxiLCBwdWRfdCAqcHVkLAo+PiDCoCAjZGVmaW5lIHA0ZF9hbGxvY19vbmUgcDRk
X2FsbG9jX29uZQo+PiDCoCBzdGF0aWMgaW5saW5lIHA0ZF90ICpwNGRfYWxsb2Nfb25lKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZAo+PiBsb25nIGFkZHIpCj4+IMKgIHsKPj4gLcKgwqDC
oCBpZiAocGd0YWJsZV9sNV9lbmFibGVkKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBnZnBfdCBnZnAg
PSBHRlBfUEdUQUJMRV9VU0VSOwo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAobW0gPT0gJmlu
aXRfbW0pCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdmcCA9IEdGUF9QR1RBQkxFX0tFUk5F
TDsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAocDRkX3QgKilnZXRfemVyb2VkX3BhZ2UoZ2Zw
KTsKPj4gLcKgwqDCoCB9Cj4+ICvCoMKgwqAgZ2ZwX3QgZ2ZwID0gR0ZQX1BHVEFCTEVfVVNFUjsK
Pj4gwqAgLcKgwqDCoCByZXR1cm4gTlVMTDsKPj4gK8KgwqDCoCBpZiAobW0gPT0gJmluaXRfbW0p
Cj4+ICvCoMKgwqDCoMKgwqDCoCBnZnAgPSBHRlBfUEdUQUJMRV9LRVJORUw7Cj4+ICvCoMKgwqAg
cmV0dXJuIChwNGRfdCAqKWdldF96ZXJvZWRfcGFnZShnZnApOwo+PiDCoCB9Cj4+IMKgIMKgIHN0
YXRpYyBpbmxpbmUgdm9pZCBfX3A0ZF9mcmVlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwNGRfdCAq
cDRkKQo+Cj4KPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3ISBKdXN0IEZZSSB0aGlzIHBhdGNoIGlzIG5v
dyBwYXJ0IG9mIFFpJ3Mgc2VyaWVzClsxXSwgSSB3aWxsIGRyb3AgaXQgd2hlbiBwb3N0aW5nIHRo
ZSBuZXh0IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMuCgotIEtldmluCgpbMV0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtbW0vODRkZGY4NTc1MDhiOThhMTk1YTc5MGJjNmZmNmFiODg0OWI0
NDYzMy4xNzM1NTQ5MTAzLmdpdC56aGVuZ3FpLmFyY2hAYnl0ZWRhbmNlLmNvbS8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
