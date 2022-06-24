Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658FCC433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9vNFYBA5NHiwd9hWTaJ+kjYmqZ4yPNRNmqMXMh+9zc=; b=UvkUrbA/vPHyEL
	QpyJ4LYkiPjsIEUL1mquxVJIChDUWcxnB9AFwPjK5+keGZ5NEbHyyXPlCy6yOj4UppW7j5Z09GyYY
	n8vy8jKeGEBVwR9edpN35MtkisPAQApM6fvUQLTDZak7pqDWL/vWRo90MiKcyR5pYjPb9betZqb20
	meQLb2oyAehIlEBRVb856g6JBsoWmBnzE+DsbX3YzVOi/Adf7T6OK9xdLAPGJqQfEzvfByCMZIQBt
	As2E74QtDu8wrW5a4WPwEowljn/dkKliQtg1gLjH236Rl4FYJkrv9J4CTy/eSp5o9vqSXr29p2/ir
	wYpghtqgcbfRFwPKlprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4cXw-000oAc-D8; Fri, 24 Jun 2022 06:12:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4cXg-000o5O-RS; Fri, 24 Jun 2022 06:11:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F88B19F0;
	Thu, 23 Jun 2022 23:11:40 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE6293F66F;
	Thu, 23 Jun 2022 23:11:32 -0700 (PDT)
Message-ID: <378e124f-914a-36b1-ff2f-9f4ea3b946a5@arm.com>
Date: Fri, 24 Jun 2022 11:41:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V4 02/26] mm/mmap: Define DECLARE_VM_GET_PAGE_PROT
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc: "hch@infradead.org" <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-3-anshuman.khandual@arm.com>
 <d3676fce-2dc7-6331-66f5-7009ac45f605@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <d3676fce-2dc7-6331-66f5-7009ac45f605@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_231144_960875_FEBAD0EF 
X-CRM114-Status: GOOD (  11.12  )
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

CgpPbiA2LzI0LzIyIDEwOjU4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IExlIDI0LzA2
LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+IFRoaXMganVz
dCBjb252ZXJ0cyB0aGUgZ2VuZXJpYyB2bV9nZXRfcGFnZV9wcm90KCkgaW1wbGVtZW50YXRpb24g
aW50byBhIG5ldwo+PiBtYWNybyBpLmUgREVDTEFSRV9WTV9HRVRfUEFHRV9QUk9UIHdoaWNoIGxh
dGVyIGNhbiBiZSB1c2VkIGFjcm9zcyBwbGF0Zm9ybXMKPj4gd2hlbiBlbmFibGluZyB0aGVtIHdp
dGggQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gVGhpcyBkb2VzIG5vdCBjcmVhdGUgYW55Cj4+
IGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pgo+PiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1m
b3VuZGF0aW9uLm9yZz4KPj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+PiBDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwo+PiBTdWdnZXN0ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAaW5mcmFkZWFkLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFu
c2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Cj4+IC0tLQo+PiAgIGluY2x1ZGUvbGludXgvbW0uaCB8
IDggKysrKysrKysKPj4gICBtbS9tbWFwLmMgICAgICAgICAgfCA2ICstLS0tLQo+PiAgIDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4+IGluZGV4IDQ3
YmZlMDM4ZDQ2ZS4uMjM3ODI4YzJiYWUyIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L21t
LmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCj4+IEBAIC00MjgsNiArNDI4LDE0IEBAIGV4
dGVybiB1bnNpZ25lZCBpbnQga29ianNpemUoY29uc3Qgdm9pZCAqb2JqcCk7Cj4+ICAgZXh0ZXJu
IHBncHJvdF90IHByb3RlY3Rpb25fbWFwWzE2XTsKPj4gICAjZW5kaWYKPj4gICAKPiBJIHRoaW5r
IHRoZSBjb21tZW50IGFib3ZlIHByb3RlY3Rpb25fbWFwWzE2XSBpbiBtbS9tbWFwLmMgc2hvdWxk
IGJlIAo+IG1vdmVkIGhlcmUuCgpTdXJlLCBtYWtlcyBzZW5zZS4gV2lsbCBtb3ZlLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
