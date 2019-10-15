Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA15ECE588
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 15:21:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892302086A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 15:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="alSZ3pIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 892302086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cd7KoD8+enB/RkVH0agJeVB8kNpbNiJUn/5d0s5UtP4=; b=alSZ3pIeTruaLC
	VSnVDnHLwWvbQEK0mlnQnWeVmxrhffuY8iRpavwvvyTdneJPcJUmKkAgLQBZUg90R6LXCdZtWs8fK
	gw2nYZw4IXk9NYq/2utHqtBickjEtA2eV/9Vic8tJfzHTvS9kDodxM47yrw43Lr3JysAZC9NskBCt
	OAUsN2qzvQd/FcOopwMJ0o7xdZ456MSzZmIM6SCypAuyb5lS+ZvShE1tYUthyRT0eVYmhv/UReBvu
	IOhaM0ohSnanb9gQBUOqAu1QGcZvOmjKna1rDiUEbtMFaxbxRbJqyllIP2xDFRgoaWqIK37QxAuJW
	ehnGU/eZK+Z76MTddSRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKOdI-0006Kp-G5; Tue, 15 Oct 2019 15:21:08 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKOd8-0006Bq-Kx; Tue, 15 Oct 2019 15:21:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68FF928;
 Tue, 15 Oct 2019 08:20:55 -0700 (PDT)
Received: from [10.162.42.142] (p8cg001049571a15.blr.arm.com [10.162.42.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 754823F718; Tue, 15 Oct 2019 08:20:44 -0700 (PDT)
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>, linux-mm@kvack.org
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571150502.5937.39.camel@lca.pw>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
Date: Tue, 15 Oct 2019 20:51:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1571150502.5937.39.camel@lca.pw>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_082058_774109_51727E3C 
X-CRM114-Status: GOOD (  15.34  )
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
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAxMC8xNS8yMDE5IDA4OjExIFBNLCBRaWFuIENhaSB3cm90ZToKPiBUaGUgeDg2IHdpbGwg
Y3Jhc2ggd2l0aCBsaW51eC1uZXh0IGR1cmluZyBib290IGR1ZSB0byB0aGlzIHNlcmllcyAodjUp
IHdpdGggdGhlCj4gY29uZmlnIGJlbG93IHBsdXMgQ09ORklHX0RFQlVHX1ZNX1BHVEFCTEU9eS4g
SSBhbSBub3Qgc3VyZSBpZiB2NiB3b3VsZCBhZGRyZXNzCj4gaXQuCj4gCj4gaHR0cHM6Ly9yYXcu
Z2l0aHVidXNlcmNvbnRlbnQuY29tL2NhaWxjYS9saW51eC1tbS9tYXN0ZXIveDg2LmNvbmZpZwo+
IAo+IFvCoMKgwqAzMy44NjI2MDBdW8KgwqDCoMKgVDFdIHBhZ2U6ZmZmZmVhMDAwOTAwMDAwMCBp
cyB1bmluaXRpYWxpemVkIGFuZCBwb2lzb25lZAo+IFvCoMKgwqAzMy44NjI2MDhdW8KgwqDCoMKg
VDFdIHJhdzogZmZmZmZmZmZmZmZmZmZmZiBmZmZmZmZmZmZmZmZmZmZmIGZmZmZmZmZmZmZmZmZm
ZmYKPiBmZmZmZmY4NzExNDBdW8KgwqDCoMKgVDFdwqDCoD8gX3Jhd19zcGluX3VubG9ja19pcnEr
MHgyNy8weDQwCj4gW8KgwqDCoDMzLjg3MTE0MF1bwqDCoMKgwqBUMV3CoMKgPyByZXN0X2luaXQr
MHgzMDcvMHgzMDcKPiBbwqDCoMKgMzMuODcxMTQwXVvCoMKgwqDCoFQxXcKgwqBrZXJuZWxfaW5p
dCsweDExLzB4MTM5Cj4gW8KgwqDCoDMzLjg3MTE0MF1bwqDCoMKgwqBUMV3CoMKgPyByZXN0X2lu
aXQrMHgzMDcvMHgzMDcKPiBbwqDCoMKgMzMuODcxMTQwXVvCoMKgwqDCoFQxXcKgwqByZXRfZnJv
bV9mb3JrKzB4MjcvMHg1MAo+IFvCoMKgwqAzMy44NzExNDBdW8KgwqDCoMKgVDFdIE1vZHVsZXMg
bGlua2VkIGluOgo+IFvCoMKgwqAzMy44NzExNDBdW8KgwqDCoMKgVDFdIC0tLVsgZW5kIHRyYWNl
IGU5OWQzOTJiMGY3YmVmYmQgXS0tLQo+IFvCoMKgwqAzMy44NzExNDBdW8KgwqDCoMKgVDFdIFJJ
UDogMDAxMDphbGxvY19naWdhbnRpY19wYWdlX29yZGVyKzB4M2ZlLzB4NDkwCgpIbW0sIHdpdGgg
ZGVmY29uZmlnIChERUJVR19WTT15IGFuZCBERUJVR19WTV9QR1RBQkxFPXkpIGl0IGRvZXMgbm90
IGNyYXNoIGJ1dAp3aXRoIHRoZSBjb25maWcgYWJvdmUsIGl0IGRvZXMuIEp1c3Qgd29uZGVyaW5n
IGlmIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlc2UKcGFnZXMgbWlnaHQgbm90IGJlZW4gaW5pdGlh
bGl6ZWQgeWV0IGJlY2F1c2UgREVGRVJSRURfU1RSVUNUX1BBR0VfSU5JVD15ID8KClsgICAxMy44
OTg1NDldWyAgICBUMV0gcGFnZTpmZmZmZWEwMDA1MDAwMDAwIGlzIHVuaW5pdGlhbGl6ZWQgYW5k
IHBvaXNvbmVkClsgICAxMy44OTg1NDldWyAgICBUMV0gcmF3OiBmZmZmZmZmZmZmZmZmZmZmIGZm
ZmZmZmZmZmZmZmZmZmYgZmZmZmZmZmZmZmZmZmZmZiBmZmZmZmZmZmZmZmZmZmZmClsgICAxMy44
OTg1NDldWyAgICBUMV0gcmF3OiBmZmZmZmZmZmZmZmZmZmZmIGZmZmZmZmZmZmZmZmZmZmYgZmZm
ZmZmZmZmZmZmZmZmZiBmZmZmZmZmZmZmZmZmZmZmClsgICAxMy44OTg1NDldWyAgICBUMV0gcGFn
ZSBkdW1wZWQgYmVjYXVzZTogVk1fQlVHX09OX1BBR0UoUGFnZVBvaXNvbmVkKHApKQpbICAgMTMu
ODk4NTQ5XVsgICAgVDFdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQpbICAg
MTMuODk4NTQ5XVsgICAgVDFdIGtlcm5lbCBCVUcgYXQgLi9pbmNsdWRlL2xpbnV4L21tLmg6MTEw
NyEKWyAgIDEzLjg5ODU0OV1bICAgIFQxXSBpbnZhbGlkIG9wY29kZTogMDAwMCBbIzFdIFNNUCBE
RUJVR19QQUdFQUxMT0MgS0FTQU4gUFRJClsgICAxMy44OTg1NDldWyAgICBUMV0gQ1BVOiAwIFBJ
RDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNS40LjAtcmMzLW5leHQtMjAxOTEwMTUr
ICMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
