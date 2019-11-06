Return-Path: <SRS0=N0Bh=Y6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02242C5DF62
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 07:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6419217F4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 07:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TU8MAAQI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6419217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07YceAxpbAgFIGNYDeIGNqJ/nnVY9+tpW+UHsYbRwK0=; b=TU8MAAQI2dX+pC
	SU+pXf79liNflzw0vE8+JnRxe4ahvoPjFlYeSa7wdoA/LtJeBkoZV4MkHvrV//7KW/6dCfXUMWCq9
	875bOTWRr+Q3yV4mHrkIMMjkXwTygdfO+DW/YI4bXpivv9THHrkxbaUZzz2wuD1Y/yurIds+QT1rO
	RjAhrVHt/A0PsYU8pvkNt26XhzU1ghQWMH+YaV5er2I5LonU+gf/Vww25oBgv+zz+5KOn8pRKg1O6
	4PjHrR+3VmRruY0lOUm1X5QS1Q2LfGxi7WVo4DJVs9EqjBfq6zDUR4vHGT4lB2h8UqFDGhIFhQhsB
	nVAa6RtVuDJJT0VVHjDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSFpd-0002Gn-Pc; Wed, 06 Nov 2019 07:34:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSFpW-00029N-Hc; Wed, 06 Nov 2019 07:34:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EE3430E;
 Tue,  5 Nov 2019 23:34:13 -0800 (PST)
Received: from [192.168.225.149] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F42D3F71A;
 Tue,  5 Nov 2019 23:36:40 -0800 (PST)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <3229d68d-0b9d-0719-3370-c6e1df0ea032@arm.com>
 <42160baa-0e9d-73d0-bf72-58bdbacf10ff@c-s.fr>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <0e0c2ce9-636d-1153-2451-baf7317ed45f@arm.com>
Date: Wed, 6 Nov 2019 13:04:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <42160baa-0e9d-73d0-bf72-58bdbacf10ff@c-s.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_233414_667275_F85B521A 
X-CRM114-Status: GOOD (  15.07  )
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

CgpPbiAxMS8wNi8yMDE5IDEyOjExIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+
IExlIDA2LzExLzIwMTkgw6AgMDQ6MjIsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+
Cj4+Cj4+IE9uIDEwLzI4LzIwMTkgMTA6NTkgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+
Pj4gK8KgwqDCoCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gK8KgwqDCoCB8wqDCoMKgwqDC
oMKgwqDCoCBhcmNoIHxzdGF0dXN8Cj4+PiArwqDCoMKgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4+PiArwqDCoMKgIHzCoMKgwqDCoMKgwqAgYWxwaGE6IHwgVE9ETyB8Cj4+PiArwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgIGFyYzogfCBUT0RPIHwKPj4+ICvCoMKgwqAgfMKgwqDCoMKgwqDCoMKg
wqAgYXJtOiB8IFRPRE8gfAo+Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKgIGFybTY0OiB8wqAgb2vC
oCB8Cj4+PiArwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgIGM2eDogfCBUT0RPIHwKPj4+ICvCoMKg
wqAgfMKgwqDCoMKgwqDCoMKgIGNza3k6IHwgVE9ETyB8Cj4+PiArwqDCoMKgIHzCoMKgwqDCoMKg
wqAgaDgzMDA6IHwgVE9ETyB8Cj4+PiArwqDCoMKgIHzCoMKgwqDCoCBoZXhhZ29uOiB8IFRPRE8g
fAo+Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKgwqAgaWE2NDogfCBUT0RPIHwKPj4+ICvCoMKgwqAg
fMKgwqDCoMKgwqDCoMKgIG02OGs6IHwgVE9ETyB8Cj4+PiArwqDCoMKgIHzCoCBtaWNyb2JsYXpl
OiB8IFRPRE8gfAo+Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKgwqAgbWlwczogfCBUT0RPIHwKPj4+
ICvCoMKgwqAgfMKgwqDCoMKgwqDCoCBuZHMzMjogfCBUT0RPIHwKPj4+ICvCoMKgwqAgfMKgwqDC
oMKgwqDCoCBuaW9zMjogfCBUT0RPIHwKPj4+ICvCoMKgwqAgfMKgwqDCoCBvcGVucmlzYzogfCBU
T0RPIHwKPj4+ICvCoMKgwqAgfMKgwqDCoMKgwqAgcGFyaXNjOiB8IFRPRE8gfAo+Pj4gK8KgwqDC
oCB8wqDCoMKgwqAgcG93ZXJwYzogfCBUT0RPIHwKPj4+ICvCoMKgwqAgfMKgwqDCoMKgwqDCoCBw
cGMzMjogfMKgIG9rwqAgfAo+IAo+IE5vdGUgdGhhdCBwcGMzMiBpcyBhIHBhcnQgb2YgcG93ZXJw
Yywgbm90IGEgc3RhbmRhbG9uZSBhcmNoLgoKUmlnaHQsIEkgdW5kZXJzdGFuZC4gQnV0IHdlIGFy
ZSB5ZXQgdG8gaGVhciBhYm91dCBob3cgdGhpcyB0ZXN0CmNhbWUgYWJvdXQgb24gcG93ZXJwYyBz
ZXJ2ZXIgcGxhdGZvcm1zLiBXaWxsIHVwZGF0ZSAncG93ZXJwYycKYXJjaCBsaXN0aW5nIGFib3Zl
IG9uY2Ugd2UgZ2V0IHNvbWUgY29uZmlybWF0aW9uLiBNYXkgYmUgb25jZQp0aGlzIHdvcmtzIG9u
IGFsbCByZWxldmFudCBwb3dlcnBjIHBsYXRmb3Jtcywgd2UgY2FuIGp1c3QgbWVyZ2UKJ3Bvd2Vy
cGMnIGFuZCAncHBjMzInIGVudHJpZXMgaGVyZSBhcyBqdXN0ICdwb3dlcnBjJy4KCj4gCj4gTWF5
YmUgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyB3b3VsZCBiZSBtb3JlIGNvcnJlY3Q6Cj4g
fMKgIHBvd2VycGMvMzI6IHzCoCBva8KgIHwKPiB8wqAgcG93ZXJwYy82NDogfCBUT0RPIHwKPiAK
PiBDaHJpc3RvcGhlCj4gCj4+PiArwqDCoMKgIHzCoMKgwqDCoMKgwqAgcmlzY3Y6IHwgVE9ETyB8
Cj4+PiArwqDCoMKgIHzCoMKgwqDCoMKgwqDCoCBzMzkwOiB8IFRPRE8gfAo+Pj4gK8KgwqDCoCB8
wqDCoMKgwqDCoMKgwqDCoMKgIHNoOiB8IFRPRE8gfAo+Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKg
IHNwYXJjOiB8IFRPRE8gfAo+Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgIHVtOiB8IFRP
RE8gfAo+Pj4gK8KgwqDCoCB8wqDCoCB1bmljb3JlMzI6IHwgVE9ETyB8Cj4+PiArwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgIHg4NjogfMKgIG9rwqAgfAo+Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoCB4
dGVuc2E6IHwgVE9ETyB8Cj4+PiArwqDCoMKgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+
IFdoaWxlIGhlcmUsIGFyZSB0aGVyZSBzb21lIHZvbHVudGVlcnMgdG8gdGVzdCB0aGlzIG9uIGFu
eSBvZiB0aGUKPj4gJ3lldCB0byBiZSB0ZXN0ZWQgYW5kIHN1cHBvcnRlZCcgcGxhdGZvcm1zID8K
Pj4KPj4gLSBBbnNodW1hbgo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zbnBzLWFyYwo=
