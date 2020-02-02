Return-Path: <SRS0=mK5U=3W=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC18C35240
	for <linux-snps-arc@archiver.kernel.org>; Sun,  2 Feb 2020 08:26:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC67A206D3
	for <linux-snps-arc@archiver.kernel.org>; Sun,  2 Feb 2020 08:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AY0VzaC7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC67A206D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hq4epJsNWtJPHUONDrqelpPIxAPYCQSIfIhtTSEnODY=; b=AY0VzaC7OYLUfn
	WpMQKHK/VaIRfA+wUWtWAbtQ1ZEbn9A+owZB4BtBjIQiLiNhFKowY7iMUuITrct7E7LSn/8CuiSxu
	dWukSe4SXlMTKLTWsNzXklzVGUqq6SfR6ikfsjjum7yjx2cJTN53wY41TP/jTxTMHaYztKb3WRS7Q
	tSdFfBZtWoT2IgI/6b9TpoD8eePpdD5Rd4TeUUteEOkmi4z79ump9AWw8usFnD3Yc6pCCtXYv69KA
	SjX9sVLpP1+jqpjGEQG8x1l+Djl5fsGC77QaBGDMjD39C2RZkdQRXUz8tOuuQPwkMt70hqLno5OKO
	age505XXX860LBUMcMQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyAaM-0006LU-Gb; Sun, 02 Feb 2020 08:26:30 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyAaG-0006H2-FB; Sun, 02 Feb 2020 08:26:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C77E1045;
 Sun,  2 Feb 2020 00:26:22 -0800 (PST)
Received: from [10.163.1.42] (unknown [10.163.1.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53D883F68E;
 Sun,  2 Feb 2020 00:29:45 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
 <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <eecaf6d6-66d2-1c17-ce02-74ed399fc58e@arm.com>
Date: Sun, 2 Feb 2020 13:56:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_002624_597372_20D814CD 
X-CRM114-Status: GOOD (  16.00  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAwMS8zMC8yMDIwIDA2OjM0IFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPiBPbiAw
MS8yOC8yMDIwIDEwOjM1IFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+PiBMZSAyOC8w
MS8yMDIwIMOgIDAyOjI3LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+Pj4gVGhpcyBh
ZGRzIHRlc3RzIHdoaWNoIHdpbGwgdmFsaWRhdGUgYXJjaGl0ZWN0dXJlIHBhZ2UgdGFibGUgaGVs
cGVycyBhbmQKPj4+IG90aGVyIGFjY2Vzc29ycyBpbiB0aGVpciBjb21wbGlhbmNlIHdpdGggZXhw
ZWN0ZWQgZ2VuZXJpYyBNTSBzZW1hbnRpY3MuCj4+PiBUaGlzIHdpbGwgaGVscCB2YXJpb3VzIGFy
Y2hpdGVjdHVyZXMgaW4gdmFsaWRhdGluZyBjaGFuZ2VzIHRvIGV4aXN0aW5nCj4+PiBwYWdlIHRh
YmxlIGhlbHBlcnMgb3IgYWRkaXRpb24gb2YgbmV3IG9uZXMuCj4+Pgo+Pj4gVGhpcyB0ZXN0IGNv
dmVycyBiYXNpYyBwYWdlIHRhYmxlIGVudHJ5IHRyYW5zZm9ybWF0aW9ucyBpbmNsdWRpbmcgYnV0
IG5vdAo+Pj4gbGltaXRlZCB0byBvbGQsIHlvdW5nLCBkaXJ0eSwgY2xlYW4sIHdyaXRlLCB3cml0
ZSBwcm90ZWN0IGV0YyBhdCB2YXJpb3VzCj4+PiBsZXZlbCBhbG9uZyB3aXRoIHBvcHVsYXRpbmcg
aW50ZXJtZWRpYXRlIGVudHJpZXMgd2l0aCBuZXh0IHBhZ2UgdGFibGUgcGFnZQo+Pj4gYW5kIHZh
bGlkYXRpbmcgdGhlbS4KPj4+Cj4+PiBUZXN0IHBhZ2UgdGFibGUgcGFnZXMgYXJlIGFsbG9jYXRl
ZCBmcm9tIHN5c3RlbSBtZW1vcnkgd2l0aCByZXF1aXJlZCBzaXplCj4+PiBhbmQgYWxpZ25tZW50
cy4gVGhlIG1hcHBlZCBwZm5zIGF0IHBhZ2UgdGFibGUgbGV2ZWxzIGFyZSBkZXJpdmVkIGZyb20g
YQo+Pj4gcmVhbCBwZm4gcmVwcmVzZW50aW5nIGEgdmFsaWQga2VybmVsIHRleHQgc3ltYm9sLiBU
aGlzIHRlc3QgZ2V0cyBjYWxsZWQKPj4+IHJpZ2h0IGFmdGVyIHBhZ2VfYWxsb2NfaW5pdF9sYXRl
KCkuCj4+Pgo+Pj4gVGhpcyBnZXRzIGJ1aWxkIGFuZCBydW4gd2hlbiBDT05GSUdfREVCVUdfVk1f
UEdUQUJMRSBpcyBzZWxlY3RlZCBhbG9uZyB3aXRoCj4+PiBDT05GSUdfVk1fREVCVUcuIEFyY2hp
dGVjdHVyZXMgd2lsbGluZyB0byBzdWJzY3JpYmUgdGhpcyB0ZXN0IGFsc28gbmVlZCB0bwo+Pj4g
c2VsZWN0IENPTkZJR19BUkNIX0hBU19ERUJVR19WTV9QR1RBQkxFIHdoaWNoIGZvciBub3cgaXMg
bGltaXRlZCB0byB4ODYgYW5kCj4+PiBhcm02NC4gR29pbmcgZm9yd2FyZCwgb3RoZXIgYXJjaGl0
ZWN0dXJlcyB0b28gY2FuIGVuYWJsZSB0aGlzIGFmdGVyIGZpeGluZwo+Pj4gYnVpbGQgb3IgcnVu
dGltZSBwcm9ibGVtcyAoaWYgYW55KSB3aXRoIHRoZWlyIHBhZ2UgdGFibGUgaGVscGVycy4KPj4+
Cj4+PiBGb2xrcyBpbnRlcmVzdGVkIGluIG1ha2luZyBzdXJlIHRoYXQgYSBnaXZlbiBwbGF0Zm9y
bSdzIHBhZ2UgdGFibGUgaGVscGVycwo+Pj4gY29uZm9ybSB0byBleHBlY3RlZCBnZW5lcmljIE1N
IHNlbWFudGljcyBzaG91bGQgZW5hYmxlIHRoZSBhYm92ZSBjb25maWcKPj4+IHdoaWNoIHdpbGwg
anVzdCB0cmlnZ2VyIHRoaXMgdGVzdCBkdXJpbmcgYm9vdC4gQW55IG5vbiBjb25mb3JtaXR5IGhl
cmUgd2lsbAo+Pj4gYmUgcmVwb3J0ZWQgYXMgYW4gd2FybmluZyB3aGljaCB3b3VsZCBuZWVkIHRv
IGJlIGZpeGVkLiBUaGlzIHRlc3Qgd2lsbCBoZWxwCj4+PiBjYXRjaCBhbnkgY2hhbmdlcyB0byB0
aGUgYWdyZWVkIHVwb24gc2VtYW50aWNzIGV4cGVjdGVkIGZyb20gZ2VuZXJpYyBNTSBhbmQKPj4+
IGVuYWJsZSBwbGF0Zm9ybXMgdG8gYWNjb21tb2RhdGUgaXQgdGhlcmVhZnRlci4KPj4+Cj4+IFsu
Li5dCj4+Cj4+PiBUZXN0ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lA
Yy1zLmZyPsKgwqDCoMKgwqDCoMKgICNQUEMzMgo+PiBBbHNvIHRlc3RlZCBvbiBQUEM2NCAodW5k
ZXIgUUVNVSk6IGJvb2szcy82NCA2NGsgcGFnZXMsIGJvb2szcy82NCA0ayBwYWdlcyBhbmQgYm9v
azNlLzY0Cj4gSG1tIGJ1dCBlYXJsaWVyIE1pY2hhZWwgRWxsZXJtYW4gaGFkIHJlcG9ydGVkIHNv
bWUgcHJvYmxlbXMgd2hpbGUKPiBydW5uaW5nIHRoZXNlIHRlc3RzIG9uIFBQQzY0LCBhIHNvZnQg
bG9jayB1cCBpbiBoYXNoX19wdGVfdXBkYXRlKCkKPiBhbmQgYSBrZXJuZWwgQlVHIChyYWRpeCBN
TVUpLiBBcmUgdGhvc2UgcHJvYmxlbXMgZ29uZSBhd2F5IG5vdyA/Cj4gCj4gRGV0YWlscyBpbiB0
aGlzIHRocmVhZCAtIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEyMTQ2MDMv
Cj4gCgpJdCBpcyBhbHdheXMgYmV0dGVyIHRvIGhhdmUgbW9yZSBwbGF0Zm9ybXMgZW5hYmxlZCB0
aGFuIG5vdC4gQnV0IGxldHMga2VlcAp0aGlzIHRlc3QgZGlzYWJsZWQgb24gUFBDNjQgZm9yIG5v
dywgaWYgdGhlcmUgaXMgYW55IGluY29uc2lzdGVuY3kgYmV0d2VlbgpyZXN1bHRzIHdoaWxlIHJ1
bm5pbmcgdGhpcyB1bmRlciBRRU1VIGFuZCBvbiBhY3R1YWwgc3lzdGVtcy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxp
bmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
