Return-Path: <SRS0=UT4s=43=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736FEC10F29
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 02:32:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478B620728
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 02:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y/y9XiyN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 478B620728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEdohb8z/Ud6tfHEHRdGsxBGvR3oCCg9iYZMDokbUcg=; b=Y/y9XiyNmjyI+O
	ffNq8n29ljIOlggOm2wN49pC1zDAvBNjyvoUqLaM8+CXg6qeGsQAjT/KxKBWP/CgEbT1QXZF7Ztoy
	pLe9t6NQ+JIRNnIcyhBS9HkGl5f06UDF3lX7oaVbGhDSdrb+BL0+i14JLGVKpN3E2rV040LDxurkp
	qZ1AVaAK86G+rehnIqlqxwPMqBTcCWn1DLokcwJVdeebReOx0sjXUQ3Xkl5lCtSDQ/UcRIcqkMEcg
	wHAO52vSFR/mhcPRYM5t7hTbjuLPOpBd8NuAWsV98apbzOJTc403XNC2cTbbugotaGZmdbCo7bUos
	aTJYVFu7WcglkQDplGpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBUgt-0001hb-7w; Tue, 10 Mar 2020 02:32:19 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBUgf-0001Te-5j; Tue, 10 Mar 2020 02:32:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C538730E;
 Mon,  9 Mar 2020 19:32:02 -0700 (PDT)
Received: from [10.163.1.203] (unknown [10.163.1.203])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E46843F67D;
 Mon,  9 Mar 2020 19:31:53 -0700 (PDT)
Subject: Re: [PATCH V15] mm/debug: Add tests validating architecture page
 table helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qian Cai <cai@lca.pw>
References: <61250cdc-f80b-2e50-5168-2ec67ec6f1e6@arm.com>
 <CEEAD95E-D468-4C58-A65B-7E8AED91168A@lca.pw>
 <a45834bc-e6f2-ac21-de9e-1aff67d12797@arm.com>
 <c40d907a-b64b-ae0d-e58f-33dddf0e8edc@c-s.fr>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <2d950d8c-4b23-741e-591f-e22e857c0755@arm.com>
Date: Tue, 10 Mar 2020 08:01:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c40d907a-b64b-ae0d-e58f-33dddf0e8edc@c-s.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_193205_301046_5272BC31 
X-CRM114-Status: GOOD (  17.63  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAwMy8wNy8yMDIwIDEyOjM1IFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+
IExlIDA3LzAzLzIwMjAgw6AgMDE6NTYsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+
Cj4+Cj4+IE9uIDAzLzA3LzIwMjAgMDY6MDQgQU0sIFFpYW4gQ2FpIHdyb3RlOgo+Pj4KPj4+Cj4+
Pj4gT24gTWFyIDYsIDIwMjAsIGF0IDc6MDMgUE0sIEFuc2h1bWFuIEtoYW5kdWFsIDxBbnNodW1h
bi5LaGFuZHVhbEBhcm0uY29tPiB3cm90ZToKPj4+Pgo+Pj4+IEhtbSwgc2V0X3B0ZV9hdCgpIGZ1
bmN0aW9uIGlzIG5vdCBwcmVmZXJyZWQgaGVyZSBmb3IgdGhlc2UgdGVzdHMuIFRoZSBpZGVhCj4+
Pj4gaXMgdG8gYXZvaWQgb3IgYXRsZWFzdCBtaW5pbWl6ZSBUTEIvY2FjaGUgZmx1c2hlcyB0cmln
Z2VyZWQgZnJvbSB0aGVzZSBzb3J0Cj4+Pj4gb2YgJ3N0YXRpYycgdGVzdHMuIHNldF9wdGVfYXQo
KSBpcyBwbGF0Zm9ybSBwcm92aWRlZCBhbmQgY291bGQvbWlnaHQgdHJpZ2dlcgo+Pj4+IHRoZXNl
IGZsdXNoZXMgb3Igc29tZSBvdGhlciBwbGF0Zm9ybSBzcGVjaWZpYyBzeW5jaHJvbml6YXRpb24g
c3R1ZmYuIEp1c3QKPj4+Cj4+PiBXaHkgaXMgdGhhdCBpbXBvcnRhbnQgZm9yIHRoaXMgZGVidWdn
aW5nIG9wdGlvbj8KPj4KPj4gUHJpbWFyaWx5IHJlYXNvbiBpcyB0byBhdm9pZCBUTEIvY2FjaGUg
Zmx1c2ggaW5zdHJ1Y3Rpb25zIG9uIHRoZSBzeXN0ZW0KPj4gZHVyaW5nIHRoZXNlIHRlc3RzIHRo
YXQgb25seSBpbnZvbHZlIHRyYW5zZm9ybWluZyBkaWZmZXJlbnQgcGFnZSB0YWJsZQo+PiBsZXZl
bCBlbnRyaWVzIHRocm91Z2ggaGVscGVycy4gVW5sZXNzIHJlYWxseSBuZWNlc3NhcnksIHdoeSBz
aG91bGQgaXQKPj4gZW1pdCBhbnkgVExCL2NhY2hlIGZsdXNoIGluc3RydWN0aW9ucyA/Cj4gCj4g
V2hhdCdzIHRoZSBwcm9ibGVtIHdpdGggdGhvc2VzIGZsdXNoZXMgPwo+IAo+Pgo+Pj4KPj4+PiB3
b25kZXJpbmcgaXMgdGhlcmUgc3BlY2lmaWMgcmVhc29uIHdpdGggcmVzcGVjdCB0byB0aGUgc29m
dCBsb2NrIHVwIHByb2JsZW0KPj4+PiBtYWtpbmcgaXQgbmVjZXNzYXJ5IHRvIHVzZSBzZXRfcHRl
X2F0KCkgcmF0aGVyIHRoYW4gYSBzaW1wbGUgV1JJVEVfT05DRSgpID8KPj4+Cj4+PiBMb29rcyBh
dCB0aGUgczM5MCB2ZXJzaW9uIG9mIHNldF9wdGVfYXQoKSwgaXQgaGFzIHRoaXMgY29tbWVudCwK
Pj4+IHZtYWRkcik7Cj4+Pgo+Pj4gLyoKPj4+IMKgICogQ2VydGFpbiBhcmNoaXRlY3R1cmVzIG5l
ZWQgdG8gZG8gc3BlY2lhbCB0aGluZ3Mgd2hlbiBQVEVzCj4+PiDCoCAqIHdpdGhpbiBhIHBhZ2Ug
dGFibGUgYXJlIGRpcmVjdGx5IG1vZGlmaWVkLsKgIFRodXMsIHRoZSBmb2xsb3dpbmcKPj4+IMKg
ICogaG9vayBpcyBtYWRlIGF2YWlsYWJsZS4KPj4+IMKgICovCj4+Pgo+Pj4gSSBjYW4gb25seSBn
dWVzcyB0aGF0IHBvd2VycGPCoCBjb3VsZCBiZSB0aGUgc2FtZSBoZXJlLgo+Pgo+PiBUaGlzIGNv
bW1lbnQgaXMgcHJlc2VudCBpbiBtdWx0aXBsZSBwbGF0Zm9ybXMgd2hpbGUgZGVmaW5pbmcgc2V0
X3B0ZV9hdCgpLgo+PiBJcyBub3QgJ2JhcnJpZXIoKScgaGVyZSBhbG9uZSBnb29kIGVub3VnaCA/
IEVsc2Ugd2hhdCBleGFjdGx5IHNldF9wdGVfYXQoKQo+PiBkb2VzIGFzIGNvbXBhcmVkIHRvIFdS
SVRFX09OQ0UoKSB0aGF0IGF2b2lkcyB0aGUgc29mdCBsb2NrIHVwLCBqdXN0IHRyeWluZwo+PiB0
byB1bmRlcnN0YW5kLgo+Pgo+IAo+IAo+IEFyZ2ggISBJIGRpZG4ndCByZWFsaXNlIHRoYXQgeW91
IHdlcmUgd3JpdGluZyBkaXJlY3RseSBpbnRvIHRoZSBwYWdlIHRhYmxlcy4gV2hlbiBpdCB3b3Jr
cywgdGhhdCdzIG9ubHkgYnkgY2hhbmNlIEkgZ3Vlc3MuCj4gCj4gVG8gcHJvcGVybHkgc2V0IHRo
ZSBwYWdlIHRhYmxlIGVudHJpZXMsIHNldF9wdGVfYXQoKSBoYXMgdG8gYmUgdXNlZDoKPiAtIE9u
IHBvd2VycGMgOHh4LCB3aXRoIDE2ayBwYWdlcywgdGhlIHBhZ2UgdGFibGUgZW50cnkgbXVzdCBi
ZSBjb3BpZWQgZm91ciB0aW1lcy4gc2V0X3B0ZV9hdCgpIGRvZXMgaXQsIFdSSVRFX09OQ0UoKSBk
b2Vzbid0Lgo+IC0gT24gcG93ZXJwYyBib29rM3MvMzIgKGhhc2ggTU1VKSwgdGhlIGZsYWcgX1BB
R0VfSEFTSFBURSBtdXN0IGJlIHByZXNlcnZlZCBhbW9uZyB3cml0ZXMuIHNldF9wdGVfYXQoKSBw
cmVzZXJ2ZXMgaXQsIFdSSVRFX09OQ0UoKSBkb2Vzbid0Lgo+IAo+IHNldF9wdGVfYXQoKSBhbHNv
IGRvZXMgYSBmZXcgb3RoZXIgbWFuZGF0b3J5IHRoaW5ncywgbGlrZSBjYWxsaW5nIHB0ZV9ta3B0
ZSgpCj4gCj4gU28sIHRoZSBXUklURV9PTkNFKCkgbXVzdCBkZWZpbml0ZWx5IGJlY29tZSBhIHNl
dF9wdGVfYXQoKQoKU3VyZSwgd2lsbCBkby4gVGhlc2UgYXJlIHBhcnQgb2YgdGhlIGNsZWFyIHRl
c3RzIHRoYXQgcG9wdWxhdGVzIGEgZ2l2ZW4KZW50cnkgd2l0aCBhIG5vbiB6ZXJvIHZhbHVlIGJl
Zm9yZSBjbGVhcmluZyBhbmQgdGVzdGluZyBpdCB3aXRoIHB4eF9ub25lKCkuCkluIHRoYXQgY29u
dGV4dCwgV1JJVEVfT05DRSgpIHNlZW1lZCBzdWZmaWNpZW50LiBCdXQgcHRlX2NsZWFyKCkgbWln
aHQgYmUKY2xvc2VseSB0aWVkIHdpdGggcHJvcGVyIHBhZ2UgdGFibGUgZW50cnkgdXBkYXRlIGFu
ZCBoZW5jZSBhIHByZWNlZGluZwpzZXRfcHRlX2F0KCkgd2lsbCBiZSBiZXR0ZXIuCgpUaGVyZSBh
cmUgc3RpbGwgbW9yZSBXUklURV9PTkNFKCkgZm9yIG90aGVyIHBhZ2UgdGFibGUgbGV2ZWxzIGR1
cmluZyB0aGVzZQpjbGVhciB0ZXN0cy4gc2V0X3BtZF9hdCgpIGFuZCBzZXRfcHVkX2F0KCkgYXJl
IGRlZmluZWQgb24gcGxhdGZvcm1zIHRoYXQKc3VwcG9ydCAoYW5kIGVuYWJsZSkgVEhQIGFuZCBQ
VUQgYmFzZWQgVEhQIHJlc3BlY3RpdmVseS4gSGVuY2UgdGhleSBjb3VsZApub3QgYmUgdXNlZCBm
b3IgY2xlYXIgdGVzdHMgYXMgcmVtYWluaW5nIGhlbHBlcnMgcG1kX2NsZWFyKCksIHB1ZF9jbGVh
cigpLApwNGRfY2xlYXIoKSBhbmQgcGdkX2NsZWFyKCkgc3RpbGwgbmVlZCB0byBiZSB2YWxpZGF0
ZWQgd2l0aCBvciB3aXRob3V0ClRIUCBzdXBwb3J0IGFuZCBlbmFibGVtZW50LiBXZSBzaG91bGQg
anVzdCBsZWF2ZSBhbGwgb3RoZXIgV1JJVEVfT05DRSgpCmluc3RhbmNlcyB1bmNoYW5nZWQuIFBs
ZWFzZSBjb3JyZWN0IG1lIGlmIEkgYW0gbWlzc2luZyBzb21ldGhpbmcgaGVyZS4KCj4gCj4gQ2hy
aXN0b3BoZQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
