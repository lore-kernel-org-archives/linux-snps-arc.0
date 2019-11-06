Return-Path: <SRS0=N0Bh=Y6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539DCC5DF60
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 03:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBFB421D7F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 03:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ao6sY3zA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBFB421D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sO9mZNgO4zx6TlsUMqy4yOznckgXDPg34j2FnLbW1No=; b=ao6sY3zAAfaiwr
	ea8OgZHVeyIIlUyxQpegOyf8o1p7+0gwSVb+WwRyDRwBZuT1cNhfyBiajgZckU5WolNISa6Uq0gWZ
	kQKkTA7PkptXI74dAUdiRiPktres/IUN8Cdgh1mn4InRvpHeNzuQDJp60cB+qNokvBAEdBMoPOKsO
	XSCvUKAlcV1hD8vCcg2+JGjqP5ypcOHzBfQrg5lAeUTafJdIuYCEnX32kSuJohhWbgtG1FDjRaNaY
	BaXCl+DQKt5zE8VXGlBSsPaI9QppXRXIeDdBMGSTx8lnkphpD1pOiSX7BvSx1ZLjM64+csNQK8uv0
	JjYdv+8t5F/LQ59ecJuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSBc1-0008Se-UH; Wed, 06 Nov 2019 03:04:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSBbt-0008M8-M7; Wed, 06 Nov 2019 03:03:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1394D30E;
 Tue,  5 Nov 2019 19:03:44 -0800 (PST)
Received: from [192.168.225.149] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAE593F719;
 Tue,  5 Nov 2019 19:03:20 -0800 (PST)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <e0aa8d49-5511-15e4-f413-62c99eea4fab@arm.com>
 <e0dc3636-8c6e-0177-9a7f-fefd28c74f27@synopsys.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <dc2746c9-bde4-ac00-88d1-2bd1cea1f105@arm.com>
Date: Wed, 6 Nov 2019 08:33:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e0dc3636-8c6e-0177-9a7f-fefd28c74f27@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_190353_812584_67B03D32 
X-CRM114-Status: GOOD (  25.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, James Hogan <jhogan@kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>,
 "x86@kernel.org" <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8wNi8yMDE5IDA0OjAwIEFNLCBWaW5lZXQgR3VwdGEgd3JvdGU6Cj4gSGkgQW5zaHVt
YW4sCgpIZWxsbyBWaW5lZXQsCgo+IAo+IE9uIDExLzQvMTkgNDowMCBQTSwgQW5zaHVtYW4gS2hh
bmR1YWwgd3JvdGU6Cj4+IE9uIDEwLzI4LzIwMTkgMTA6NTkgQU0sIEFuc2h1bWFuIEtoYW5kdWFs
IHdyb3RlOgo+Pj4gVGhpcyBhZGRzIHRlc3RzIHdoaWNoIHdpbGwgdmFsaWRhdGUgYXJjaGl0ZWN0
dXJlIHBhZ2UgdGFibGUgaGVscGVycyBhbmQKPj4+IG90aGVyIGFjY2Vzc29ycyBpbiB0aGVpciBj
b21wbGlhbmNlIHdpdGggZXhwZWN0ZWQgZ2VuZXJpYyBNTSBzZW1hbnRpY3MuCj4+PiBUaGlzIHdp
bGwgaGVscCB2YXJpb3VzIGFyY2hpdGVjdHVyZXMgaW4gdmFsaWRhdGluZyBjaGFuZ2VzIHRvIGV4
aXN0aW5nCj4+PiBwYWdlIHRhYmxlIGhlbHBlcnMgb3IgYWRkaXRpb24gb2YgbmV3IG9uZXMuCj4+
Pgo+Pj4gVGhpcyB0ZXN0IGNvdmVycyBiYXNpYyBwYWdlIHRhYmxlIGVudHJ5IHRyYW5zZm9ybWF0
aW9ucyBpbmNsdWRpbmcgYnV0IG5vdAo+Pj4gbGltaXRlZCB0byBvbGQsIHlvdW5nLCBkaXJ0eSwg
Y2xlYW4sIHdyaXRlLCB3cml0ZSBwcm90ZWN0IGV0YyBhdCB2YXJpb3VzCj4+PiBsZXZlbCBhbG9u
ZyB3aXRoIHBvcHVsYXRpbmcgaW50ZXJtZWRpYXRlIGVudHJpZXMgd2l0aCBuZXh0IHBhZ2UgdGFi
bGUgcGFnZQo+Pj4gYW5kIHZhbGlkYXRpbmcgdGhlbS4KPj4+Cj4+PiBUZXN0IHBhZ2UgdGFibGUg
cGFnZXMgYXJlIGFsbG9jYXRlZCBmcm9tIHN5c3RlbSBtZW1vcnkgd2l0aCByZXF1aXJlZCBzaXpl
Cj4+PiBhbmQgYWxpZ25tZW50cy4gVGhlIG1hcHBlZCBwZm5zIGF0IHBhZ2UgdGFibGUgbGV2ZWxz
IGFyZSBkZXJpdmVkIGZyb20gYQo+Pj4gcmVhbCBwZm4gcmVwcmVzZW50aW5nIGEgdmFsaWQga2Vy
bmVsIHRleHQgc3ltYm9sLiBUaGlzIHRlc3QgZ2V0cyBjYWxsZWQKPj4+IHJpZ2h0IGFmdGVyIHBh
Z2VfYWxsb2NfaW5pdF9sYXRlKCkuCj4+Pgo+Pj4gVGhpcyBnZXRzIGJ1aWxkIGFuZCBydW4gd2hl
biBDT05GSUdfREVCVUdfVk1fUEdUQUJMRSBpcyBzZWxlY3RlZCBhbG9uZyB3aXRoCj4+PiBDT05G
SUdfVk1fREVCVUcuIEFyY2hpdGVjdHVyZXMgd2lsbGluZyB0byBzdWJzY3JpYmUgdGhpcyB0ZXN0
IGFsc28gbmVlZCB0bwo+Pj4gc2VsZWN0IENPTkZJR19BUkNIX0hBU19ERUJVR19WTV9QR1RBQkxF
IHdoaWNoIGZvciBub3cgaXMgbGltaXRlZCB0byB4ODYgYW5kCj4+PiBhcm02NC4gR29pbmcgZm9y
d2FyZCwgb3RoZXIgYXJjaGl0ZWN0dXJlcyB0b28gY2FuIGVuYWJsZSB0aGlzIGFmdGVyIGZpeGlu
Zwo+Pj4gYnVpbGQgb3IgcnVudGltZSBwcm9ibGVtcyAoaWYgYW55KSB3aXRoIHRoZWlyIHBhZ2Ug
dGFibGUgaGVscGVycy4KPj4+Cj4+PiBGb2xrcyBpbnRlcmVzdGVkIGluIG1ha2luZyBzdXJlIHRo
YXQgYSBnaXZlbiBwbGF0Zm9ybSdzIHBhZ2UgdGFibGUgaGVscGVycwo+Pj4gY29uZm9ybSB0byBl
eHBlY3RlZCBnZW5lcmljIE1NIHNlbWFudGljcyBzaG91bGQgZW5hYmxlIHRoZSBhYm92ZSBjb25m
aWcKPj4+IHdoaWNoIHdpbGwganVzdCB0cmlnZ2VyIHRoaXMgdGVzdCBkdXJpbmcgYm9vdC4gQW55
IG5vbiBjb25mb3JtaXR5IGhlcmUgd2lsbAo+Pj4gYmUgcmVwb3J0ZWQgYXMgYW4gd2FybmluZyB3
aGljaCB3b3VsZCBuZWVkIHRvIGJlIGZpeGVkLiBUaGlzIHRlc3Qgd2lsbCBoZWxwCj4+PiBjYXRj
aCBhbnkgY2hhbmdlcyB0byB0aGUgYWdyZWVkIHVwb24gc2VtYW50aWNzIGV4cGVjdGVkIGZyb20g
Z2VuZXJpYyBNTSBhbmQKPj4+IGVuYWJsZSBwbGF0Zm9ybXMgdG8gYWNjb21tb2RhdGUgaXQgdGhl
cmVhZnRlci4KPj4+Cj4gCj4gSSB0cmllZCBlbmFibGluZyB0aGlzIG9uIEFSQyBhbmQgcmFuIGlu
dG8gYSBidWlsZCBpc3N1ZQo+IAo+IC4uL21tL2RlYnVnX3ZtX3BndGFibGUuYzogSW4gZnVuY3Rp
b24g4oCYcG1kX2Jhc2ljX3Rlc3Rz4oCZOgo+IC4uL21tL2RlYnVnX3ZtX3BndGFibGUuYzo3Mzox
NDogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHBmbl9wbWTigJk7
Cj4gZGlkIHlvdSBtZWFuIOKAmHBmbl9wdGXigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXQo+IMKgIHBtZF90IHBtZCA9IHBmbl9wbWQocGZuLCBwcm90KTsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+Cj4gCj4gVGhlIHJlYXNvbiBiZWluZyBUSFAg
d2FzIG5vdCBlbmFibGVkIChhbHRob3VnaCBBUkMgc3VwcG9ydHMgVEhQKSAtIGZvciB0aGUKPiBj
b21iaW5hdGlvbiBiZWxvdwo+IENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0U9
eQo+ICMgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFIGlzIG5vdCBzZXQKPiAKPiBJIHRoaW5r
IHlvdSBuZWVkIHRvIHVzZSBsYXR0ZXIgZm9yIGd1YXJkaW5nIHBtZF9iYXNpY190ZXN0cygpCgpT
byB0aGUgYnVpbGQgY29tcGxhaW5zIHRoYXQgcGZuX3BtZCgpIGlzIG5vdCBkZWZpbmVkIHdoZW4g
dGhlIGZvbGxvd2luZyBjb25maWcKY29tYmluYXRpb24gaXMgaW4gcGxhY2UuCgpDT05GSUdfSEFW
RV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFPXkKQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdF
PW4KCkJ1dCBzaG91bGQgbm90IHBmbl9wbWQoKSBiZSBlbmNhcHN1bGF0ZWQgaW5zaWRlIEhBVkVf
QVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRQphdCB0aGUgbWluaW11bSAoYnV0IEkgd291bGQgc2F5
IGl0IHNob3VsZCBiZSBhdmFpbGFibGUgYWx3YXlzLCBub25ldGhlbGVzcykgd2hlbgp0aGUgcGxh
dGZvcm0gc3Vic2NyaWJlcyB0byBUSFAgaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIgVEhQIGlzIGVu
YWJsZWQgb3Igbm90LgoKSSBjb3VsZCBzZWUgaW4gdGhlIGZpbGUgKGFyY2gvYXJjL2luY2x1ZGUv
YXNtL3BndGFibGUuaCkgdGhhdCBmZXRjaGluZyBwZm5fcG1kKCkKYW5kIGFsbCBvdGhlciBiYXNp
YyBQTUQgZGVmaW5pdGlvbnMgaXMgY29uZGl0aW9uYWwgb24gQ09ORklHX1RSQU5TUEFSRU5UX0hV
R0VQQUdFLgoKI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQojaW5jbHVkZSA8YXNt
L2h1Z2VwYWdlLmg+CiNlbmRpZgoKSUlVQywgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFIHNo
b3VsZCBvbmx5IGVuY2Fwc3VsYXRlIFBNRCBwYWdlIHRhYmxlIGhlbHBlcnMKd2hpY2ggYXJlIGV4
cGVjdGVkIGZyb20gZ2VuZXJpYyBUSFAgY29kZSAocG1kX3RyYW5zX2h1Z2UsIHBtZHBfc2V0X2Fj
Y2Vzc19mbGFncwpldGMpIGJ1dCBub3QgdGhlIGJhc2ljIFBNRCBoZWxwZXJzIGxpa2UgcG1kX3Bm
biwgcG1kX21reW91bmcsIHBtZF9ta2RpcnR5LApwbWRfbWtjbGVhbiBldGMuIEhlbmNlIHdvbmRl
cmluZyB3aWxsIGl0IGJlIHBvc3NpYmxlIHRvIGFjY29tbW9kYXRlIGZvbGxvd2luZwpjb2RlIGNo
YW5nZSBvbiBhcmMgcGxhdGZvcm0gKG5vdCBldmVuIGNvbXBpbGVkKSBpbiBvcmRlciB0byBmaXgg
dGhlIHByb2JsZW0gPwoKZGlmZiAtLWdpdCBhL2FyY2gvYXJjL2luY2x1ZGUvYXNtL2h1Z2VwYWdl
LmggYi9hcmNoL2FyYy9pbmNsdWRlL2FzbS9odWdlcGFnZS5oCmluZGV4IDlhNzRjZTcuLjJhZTE1
YTggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJjL2luY2x1ZGUvYXNtL2h1Z2VwYWdlLmgKKysrIGIvYXJj
aC9hcmMvaW5jbHVkZS9hc20vaHVnZXBhZ2UuaApAQCAtMzYsMTEgKzM2LDExIEBAIHN0YXRpYyBp
bmxpbmUgcG1kX3QgcHRlX3BtZChwdGVfdCBwdGUpCiAjZGVmaW5lIHBtZF9kaXJ0eShwbWQpICAg
ICAgICAgcHRlX2RpcnR5KHBtZF9wdGUocG1kKSkKIAogI2RlZmluZSBta19wbWQocGFnZSwgcHJv
dCkgICAgIHB0ZV9wbWQobWtfcHRlKHBhZ2UsIHByb3QpKQorI2RlZmluZSBwZm5fcG1kKHBmbiwg
cHJvdCkgICAgIChfX3BtZCgoKHBmbikgPDwgUEFHRV9TSElGVCkgfCBwZ3Byb3RfdmFsKHByb3Qp
KSkKIAorI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQogI2RlZmluZSBwbWRfdHJh
bnNfaHVnZShwbWQpICAgIChwbWRfdmFsKHBtZCkgJiBfUEFHRV9IV19TWikKIAotI2RlZmluZSBw
Zm5fcG1kKHBmbiwgcHJvdCkgICAgIChfX3BtZCgoKHBmbikgPDwgUEFHRV9TSElGVCkgfCBwZ3By
b3RfdmFsKHByb3QpKSkKLQogc3RhdGljIGlubGluZSBwbWRfdCBwbWRfbW9kaWZ5KHBtZF90IHBt
ZCwgcGdwcm90X3QgbmV3cHJvdCkKIHsKICAgICAgICAgLyoKQEAgLTczLDUgKzczLDYgQEAgZXh0
ZXJuIHZvaWQgZmx1c2hfcG1kX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwg
dW5zaWduZWQgbG9uZyBzdGFydCwKIAogLyogV2UgZG9uJ3QgaGF2ZSBoYXJkd2FyZSBkaXJ0eS9h
Y2Nlc3NlZCBiaXRzLCBnZW5lcmljX3BtZHBfZXN0YWJsaXNoIGlzIGZpbmUuKi8KICNkZWZpbmUg
cG1kcF9lc3RhYmxpc2ggZ2VuZXJpY19wbWRwX2VzdGFibGlzaAorI2VuZGlmCiAKICNlbmRpZgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcmMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9hcmMvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCmluZGV4IDkwMTllZDkuLjIwMzk1ZjEgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJjL2luY2x1ZGUvYXNtL3BndGFibGUuaAorKysgYi9hcmNoL2FyYy9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKQEAgLTM4NSw3ICszODUsNyBAQCB2b2lkIHVwZGF0ZV9tbXVfY2FjaGUoc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKICAqIHJlbWFwIGEg
cGh5c2ljYWwgcGFnZSBgcGZuJyBvZiBzaXplIGBzaXplJyB3aXRoIHBhZ2UgcHJvdGVjdGlvbiBg
cHJvdCcKICAqIGludG8gdmlydHVhbCBhZGRyZXNzIGBmcm9tJwogICovCi0jaWZkZWYgQ09ORklH
X1RSQU5TUEFSRU5UX0hVR0VQQUdFCisjaWZkZWYgQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVO
VF9IVUdFUEFHRQogI2luY2x1ZGUgPGFzbS9odWdlcGFnZS5oPgogI2VuZGlmCgo+IAo+IE90aGVy
IHRoYW4gdGhhdCB0aGUgdGVzdHMgcGFzcyBmb3IgIVRIUCBhbmQgVEhQIHRvby4gU28gb25jZSBm
aXhlZCwgeW91IGNvdWxkCgpHbGFkIHRoYXQgaXQgd29ya3Mgb24gYXJjIHBsYXRmb3JtIGFzIHdl
bGwuCgo+IGVuYWJsZSB0aGF0IGZvciBBUkMgYXMgd2VsbD4gVGh4IGZvciBkb2luZyB0aGlzLgo+
IAo+IC1WaW5lZXQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
