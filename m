Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70240C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 05:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbihQv8BOTM6au+7Omc74XFSSeIH22ILMS0Cy/fumag=; b=zY9BKE7KUVYDrl
	T6G3L4Sr29Lr0wB6l77H0JYxDNC4dzEZu19mpwpGE2pYGLwwzv8r7IuKL3brt7FZ1ra6wKgCQIkL+
	1NNaMUEAyjXyscHnsu9ptEpHXRSFp/d9ciyj+FdSyf8/hL5W/h1A4tChEqdzMeE67JTNn+yduIfyq
	7QqTtDKocSgOdN5l1yEkONcJV5wE5MRBph+U332nc7jweh8y5gbVAyEBgJ7iioMk2/FKQwXpeMOiC
	XKGBmaAkSicT04uGmzfGHeMHAl+CKzgchYRcTC+LSGTqSqcWPz3OVQk5BBnABxjFeV6fmJm3UTcYx
	LNN1hDoIbDLJQ31gDO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4c0D-000f6e-58; Fri, 24 Jun 2022 05:37:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4c00-000f2I-5y; Fri, 24 Jun 2022 05:36:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17FB9176C;
	Thu, 23 Jun 2022 22:36:54 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D519B3F66F;
	Thu, 23 Jun 2022 22:36:46 -0700 (PDT)
Message-ID: <e536bd05-dbfd-466b-582e-8a220421a8dc@arm.com>
Date: Fri, 24 Jun 2022 11:06:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V4 07/26] mm/mmap: Build protect protection_map[] with
 ARCH_HAS_VM_GET_PAGE_PROT
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
 <20220624044339.1533882-8-anshuman.khandual@arm.com>
 <10aca763-2313-84bf-9200-6a6037fd748c@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <10aca763-2313-84bf-9200-6a6037fd748c@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_223656_358540_15524DD1 
X-CRM114-Status: GOOD (  20.79  )
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

CgpPbiA2LzI0LzIyIDEwOjUyLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+IExlIDI0
LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+IHByb3Rl
Y3Rpb25fbWFwW10gaGFzIGFscmVhZHkgYmVlbiBtb3ZlZCBpbnNpZGUgdGhvc2UgcGxhdGZvcm1z
IHdoaWNoIGVuYWJsZQo+IAo+IFVzdWFsbHkgImFscmVhZHkiIG1lYW5zIGJlZm9yZSB5b3VyIHNl
cmllcy4KPiAKPiBZb3VyIHNlcmllcyBpcyB0aGUgb25lIHRoYXQgbW92ZXMgcHJvdGVjdGlvbl9t
YXBbXSBzbyBJIHdvdWxkIGhhdmUganVzdCAKPiBzYWlkICJOb3cgdGhhdCBwcm90ZWN0aW9uX21h
cFtdIGhhcyBiZWVuIG1vdmVkIGluc2lkZSB0aG9zZSBwbGF0Zm9ybXMgCj4gd2hpY2ggZW5hYmxl
IC4uLi4iCgpHb3QgaXQsIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZS4KCj4gCj4+IEFS
Q0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QuIEhlbmNlIGdlbmVyaWMgcHJvdGVjdGlvbl9tYXBbXSBh
cnJheSBub3cgY2FuIGJlCj4+IHByb3RlY3RlZCB3aXRoIENPTkZJR19BUkNIX0hBU19WTV9HRVRf
UEFHRV9QUk9UIGludGVhZCBvZiBfX1AwMDAuCj4+Cj4+IENjOiBBbmRyZXcgTW9ydG9uIDxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+PiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4+IENjOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEto
YW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgo+PiAtLS0KPj4gICBpbmNsdWRlL2xp
bnV4L21tLmggfCAyICstCj4+ICAgbW0vbW1hcC5jICAgICAgICAgIHwgNSArLS0tLQo+PiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4+IGluZGV4
IDIzNzgyOGMyYmFlMi4uNzBkOTAwZjZkZjQzIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4
L21tLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCj4+IEBAIC00MjQsNyArNDI0LDcgQEAg
ZXh0ZXJuIHVuc2lnbmVkIGludCBrb2Jqc2l6ZShjb25zdCB2b2lkICpvYmpwKTsKPj4gICAgKiBt
YXBwaW5nIGZyb20gdGhlIGN1cnJlbnRseSBhY3RpdmUgdm1fZmxhZ3MgcHJvdGVjdGlvbiBiaXRz
ICh0aGUKPj4gICAgKiBsb3cgZm91ciBiaXRzKSB0byBhIHBhZ2UgcHJvdGVjdGlvbiBtYXNrLi4K
Pj4gICAgKi8KPj4gLSNpZmRlZiBfX1AwMDAKPj4gKyNpZm5kZWYgQ09ORklHX0FSQ0hfSEFTX1ZN
X0dFVF9QQUdFX1BST1QKPj4gICBleHRlcm4gcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdOwo+
IAo+IElzIHRoaXMgZGVjbGFyYXRpb24gc3RpbGwgbmVlZGVkID8gSSBoYXZlIHRoZSBmZWVsaW5n
IHRoYXQgCj4gcHJvdGVjdGlvbl9tYXBbXSBpcyBvbmx5IHVzZWQgaW4gbW0vbW1hcC5jIG5vdy4K
CkF0IHRoaXMgcG9pbnQgZ2VuZXJpYyBwcm90ZWN0aW9uX21hcFtdIGFycmF5IGlzIHN0aWxsIGJl
aW5nIHVzZWQgdmlhCnRoaXMgZGVjbGFyYXRpb24gb24gbWFueSAoIUFSQ0hfSEFTX1ZNX0dFVF9Q
QUdFX1BST1QpIHBsYXRmb3JtcyBzdWNoCmFzIG1pcHMsIG02OGssIGFybSBldGMuCgo+IAo+PiAg
ICNlbmRpZgo+PiAgIAo+PiBkaWZmIC0tZ2l0IGEvbW0vbW1hcC5jIGIvbW0vbW1hcC5jCj4+IGlu
ZGV4IDU1YzMwYWVlMzk5OS4uNDNkYjNiZDQ5MDcxIDEwMDY0NAo+PiAtLS0gYS9tbS9tbWFwLmMK
Pj4gKysrIGIvbW0vbW1hcC5jCj4+IEBAIC0xMDEsNyArMTAxLDcgQEAgc3RhdGljIHZvaWQgdW5t
YXBfcmVnaW9uKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+PiAgICAqCQkJCQkJCQl3OiAobm8pIG5v
Cj4+ICAgICoJCQkJCQkJCXg6ICh5ZXMpIHllcwo+PiAgICAqLwo+PiAtI2lmZGVmIF9fUDAwMAo+
PiArI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVAo+PiAgIHBncHJvdF90
IHByb3RlY3Rpb25fbWFwWzE2XSBfX3JvX2FmdGVyX2luaXQgPSB7Cj4gCj4gU2hvdWxkIHRoaXMg
YmUgc3RhdGljLCBhcyBpdCBzZWVtcyB0byBub3cgYmUgdXNlZCBvbmx5IGluIHRoaXMgZmlsZSA/
CgpUaGlzIGlzIGJlaW5nIHVzZWQgaW4gc29tZSBwbGF0Zm9ybXMgYXMgbWVudGlvbmVkIGJlZm9y
ZS4KCj4gQW5kIGl0IGNvdWxkIGFsc28gYmUgJ2NvbnN0JyBpbnN0ZWFkIG9mIF9fcm9fYWZ0ZXJf
aW5pdC4KClRoZW4gc2hvdWxkIGJlIGFibGUgdG8gYmUgYSAnY29uc3QnIHdydCAgbWlwcywgbTY4
aywgYXJtIHBsYXRmb3Jtcy4KQnV0IHNob3VsZCB0aGlzIGV2ZW4gYmUgY2hhbmdlZCwgaWYgdGhp
cyBpcyBnb2luZyB0byBiZSBkcm9wcGVkIG9mZgpldmVudHVhbGx5ID8KCj4gCj4+ICAgCVtWTV9O
T05FXQkJCQkJPSBfX1AwMDAsCj4+ICAgCVtWTV9SRUFEXQkJCQkJPSBfX1AwMDEsCj4+IEBAIC0x
MjAsOSArMTIwLDYgQEAgcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdIF9fcm9fYWZ0ZXJfaW5p
dCA9IHsKPj4gICAJW1ZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9XUklURV0JCT0gX19TMTEwLAo+
PiAgIAlbVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRF0JPSBfX1MxMTEK
Pj4gICB9Owo+PiAtI2VuZGlmCj4+IC0KPj4gLSNpZm5kZWYgQ09ORklHX0FSQ0hfSEFTX1ZNX0dF
VF9QQUdFX1BST1QKPj4gICBERUNMQVJFX1ZNX0dFVF9QQUdFX1BST1QKPj4gICAjZW5kaWYJLyog
Q09ORklHX0FSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QgKi8KPj4gICAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
