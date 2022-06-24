Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A36C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 05:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAIqXe4GNiBf+qdU8aDgkZD1I9G8MdkDOZLnNmpHoVg=; b=g0o+IOipZVjVqp
	1bw6R892ggwnZzytAoR9t5jkuglEcQ5JPbOQno/SVnZDPPF40RxEmBkYFGCsug1meneUb/IUlhOr3
	CXWWl16XsH1ZToypnjbhcT+DNYL2r9BNsR3FG5VXqzuqg/jnYUrCAHZuVcgCk/esjhRTB89xXTEjj
	lklhfYFbt9LAEwt0HqmdRCNS2m9l3ecfnadVAKzOTtwNt9o4T8p3P83TVwEnogiR8YWTgQ9H9VCcE
	SLCDIO8gyo2QY6Xk7BepGsEyg/2nYOeFGuS0O0svhiVm4eacdQAvvRsOaCVhlZrJKfjIknfRILfBO
	w0AZRyekDHqYop28IiOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bnD-000bSl-I6; Fri, 24 Jun 2022 05:23:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bmn-000bGK-8i; Fri, 24 Jun 2022 05:23:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE747176B;
	Thu, 23 Jun 2022 22:23:16 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77AE93F66F;
	Thu, 23 Jun 2022 22:23:08 -0700 (PDT)
Message-ID: <4e8b3213-2ca8-0bff-6ea9-3b03d1d1ad27@arm.com>
Date: Fri, 24 Jun 2022 10:53:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V4 03/26] powerpc/mm: Move protection_map[] inside the
 platform
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-4-anshuman.khandual@arm.com>
 <bce16cfe-45e1-6417-2a01-6a3ff6b67077@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <bce16cfe-45e1-6417-2a01-6a3ff6b67077@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_222317_479606_C9A38125 
X-CRM114-Status: GOOD (  15.66  )
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

CgpPbiA2LzI0LzIyIDEwOjQ4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+IExlIDI0
LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+IFRoaXMg
bW92ZXMgcHJvdGVjdGlvbl9tYXBbXSBpbnNpZGUgdGhlIHBsYXRmb3JtIGFuZCB3aGlsZSBoZXJl
LCBhbHNvIGVuYWJsZQo+PiBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UIG9uIDMyIGJpdCBwbGF0
Zm9ybXMgdmlhIERFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVC4KPiAKPiBOb3Qgb25seSAzMiBiaXQg
cGxhdGZvcm1zLCBhbHNvIG5vaGFzaCA2NCAoYWthIGJvb2szZS82NCkKClN1cmUsIHdpbGwgdXBk
YXRlIHRoZSBjb21taXQgbWVzc2FnZS4KCj4gCj4+Cj4+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxt
cGVAZWxsZXJtYW4uaWQuYXU+Cj4+IENjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9y
Zz4KPj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+Cj4+IENjOiBsaW51
eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1
YWxAYXJtLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAg
ICB8ICAyICstCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDIwICst
LS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyAgICAgICAg
ICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMjYg
aW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCj4+IGluZGV4IGMyY2UyZTYwYzhm
MC4uMTAzNWQxNzJjN2RkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+PiAr
KysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+PiBAQCAtMTQwLDcgKzE0MCw3IEBAIGNvbmZpZyBQ
UEMKPj4gICAJc2VsZWN0IEFSQ0hfSEFTX1RJQ0tfQlJPQURDQVNUCQlpZiBHRU5FUklDX0NMT0NL
RVZFTlRTX0JST0FEQ0FTVAo+PiAgIAlzZWxlY3QgQVJDSF9IQVNfVUFDQ0VTU19GTFVTSENBQ0hF
Cj4+ICAgCXNlbGVjdCBBUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEwKPj4gLQlzZWxlY3QgQVJD
SF9IQVNfVk1fR0VUX1BBR0VfUFJPVAlpZiBQUENfQk9PSzNTXzY0Cj4+ICsJc2VsZWN0IEFSQ0hf
SEFTX1ZNX0dFVF9QQUdFX1BST1QKPj4gICAJc2VsZWN0IEFSQ0hfSEFWRV9OTUlfU0FGRV9DTVBY
Q0hHCj4+ICAgCXNlbGVjdCBBUkNIX0tFRVBfTUVNQkxPQ0sKPj4gICAJc2VsZWN0IEFSQ0hfTUlH
SFRfSEFWRV9QQ19QQVJQT1JUCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+PiBpbmRl
eCBkNTY0ZDBlY2Q0Y2QuLmJmOThkYjg0NDU3OSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCj4+IEBAIC0yMCwyNSArMjAsNiBAQCBzdHJ1Y3QgbW1fc3RydWN0Owo+PiAgICNp
bmNsdWRlIDxhc20vbm9oYXNoL3BndGFibGUuaD4KPj4gICAjZW5kaWYgLyogIUNPTkZJR19QUENf
Qk9PSzNTICovCj4+ICAgCj4+IC0vKiBOb3RlIGR1ZSB0byB0aGUgd2F5IHZtIGZsYWdzIGFyZSBs
YWlkIG91dCwgdGhlIGJpdHMgYXJlIFhXUiAqLwo+PiAtI2RlZmluZSBfX1AwMDAJUEFHRV9OT05F
Cj4+IC0jZGVmaW5lIF9fUDAwMQlQQUdFX1JFQURPTkxZCj4+IC0jZGVmaW5lIF9fUDAxMAlQQUdF
X0NPUFkKPj4gLSNkZWZpbmUgX19QMDExCVBBR0VfQ09QWQo+PiAtI2RlZmluZSBfX1AxMDAJUEFH
RV9SRUFET05MWV9YCj4+IC0jZGVmaW5lIF9fUDEwMQlQQUdFX1JFQURPTkxZX1gKPj4gLSNkZWZp
bmUgX19QMTEwCVBBR0VfQ09QWV9YCj4+IC0jZGVmaW5lIF9fUDExMQlQQUdFX0NPUFlfWAo+PiAt
Cj4+IC0jZGVmaW5lIF9fUzAwMAlQQUdFX05PTkUKPj4gLSNkZWZpbmUgX19TMDAxCVBBR0VfUkVB
RE9OTFkKPj4gLSNkZWZpbmUgX19TMDEwCVBBR0VfU0hBUkVECj4+IC0jZGVmaW5lIF9fUzAxMQlQ
QUdFX1NIQVJFRAo+PiAtI2RlZmluZSBfX1MxMDAJUEFHRV9SRUFET05MWV9YCj4+IC0jZGVmaW5l
IF9fUzEwMQlQQUdFX1JFQURPTkxZX1gKPj4gLSNkZWZpbmUgX19TMTEwCVBBR0VfU0hBUkVEX1gK
Pj4gLSNkZWZpbmUgX19TMTExCVBBR0VfU0hBUkVEX1gKPj4gLQo+PiAgICNpZm5kZWYgX19BU1NF
TUJMWV9fCj4+ICAgCj4+ICAgI2lmbmRlZiBNQVhfUFRSU19QRVJfUEdECj4+IEBAIC03OSw2ICs2
MCw3IEBAIGV4dGVybiB2b2lkIHBhZ2luZ19pbml0KHZvaWQpOwo+PiAgIHZvaWQgcG9raW5nX2lu
aXQodm9pZCk7Cj4+ICAgCj4+ICAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgaW9yZW1hcF9ib3Q7Cj4+
ICtleHRlcm4gcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdIF9fcm9fYWZ0ZXJfaW5pdDsKPj4g
ICAKPj4gICAvKgo+PiAgICAqIGtlcm5fYWRkcl92YWxpZCBpcyBpbnRlbmRlZCB0byBpbmRpY2F0
ZSB3aGV0aGVyIGFuIGFkZHJlc3MgaXMgYSB2YWxpZAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMKPj4gaW5kZXggZTYx
NjZiNzFkMzZkLi42MThmMzBkMzViMTcgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9w
Z3RhYmxlLmMKPj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwo+PiBAQCAtNDcyLDMg
KzQ3MiwyNyBAQCBwdGVfdCAqX19maW5kX2xpbnV4X3B0ZShwZ2RfdCAqcGdkaXIsIHVuc2lnbmVk
IGxvbmcgZWEsCj4+ICAgCXJldHVybiByZXRfcHRlOwo+PiAgIH0KPj4gICBFWFBPUlRfU1lNQk9M
X0dQTChfX2ZpbmRfbGludXhfcHRlKTsKPj4gKwo+PiArLyogTm90ZSBkdWUgdG8gdGhlIHdheSB2
bSBmbGFncyBhcmUgbGFpZCBvdXQsIHRoZSBiaXRzIGFyZSBYV1IgKi8KPj4gK3BncHJvdF90IHBy
b3RlY3Rpb25fbWFwWzE2XSBfX3JvX2FmdGVyX2luaXQgPSB7Cj4gCj4gSSBjYW4ndCBzZWUgYW55
IHBsYWNlIHdoZXJlIHByb3RlY3Rpb25fbWFwW10gZ2V0cyBtb2RpZmllZC4gVGhpcyBjb3VsZCAK
PiBiZSBtYWRlIGNvbnN0LgoKU3VyZSwgd2lsbCBtYWtlIGl0IGEgY29uc3QgYXMgaW4gY2FzZSBm
b3IgbWFueSBvdGhlciBwbGF0Zm9ybXMgYXMgd2VsbC4KCj4gCj4+ICsJW1ZNX05PTkVdCQkJCQk9
IFBBR0VfTk9ORSwKPj4gKwlbVk1fUkVBRF0JCQkJCT0gUEFHRV9SRUFET05MWSwKPj4gKwlbVk1f
V1JJVEVdCQkJCQk9IFBBR0VfQ09QWSwKPj4gKwlbVk1fV1JJVEUgfCBWTV9SRUFEXQkJCQk9IFBB
R0VfQ09QWSwKPj4gKwlbVk1fRVhFQ10JCQkJCT0gUEFHRV9SRUFET05MWV9YLAo+PiArCVtWTV9F
WEVDIHwgVk1fUkVBRF0JCQkJPSBQQUdFX1JFQURPTkxZX1gsCj4+ICsJW1ZNX0VYRUMgfCBWTV9X
UklURV0JCQkJPSBQQUdFX0NPUFlfWCwKPj4gKwlbVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVB
RF0JCQk9IFBBR0VfQ09QWV9YLAo+PiArCVtWTV9TSEFSRURdCQkJCQk9IFBBR0VfTk9ORSwKPj4g
KwlbVk1fU0hBUkVEIHwgVk1fUkVBRF0JCQkJPSBQQUdFX1JFQURPTkxZLAo+PiArCVtWTV9TSEFS
RUQgfCBWTV9XUklURV0JCQkJPSBQQUdFX1NIQVJFRCwKPj4gKwlbVk1fU0hBUkVEIHwgVk1fV1JJ
VEUgfCBWTV9SRUFEXQkJPSBQQUdFX1NIQVJFRCwKPj4gKwlbVk1fU0hBUkVEIHwgVk1fRVhFQ10J
CQkJPSBQQUdFX1JFQURPTkxZX1gsCj4+ICsJW1ZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9SRUFE
XQkJCT0gUEFHRV9SRUFET05MWV9YLAo+PiArCVtWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fV1JJ
VEVdCQk9IFBBR0VfU0hBUkVEX1gsCj4+ICsJW1ZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9XUklU
RSB8IFZNX1JFQURdCT0gUEFHRV9TSEFSRURfWAo+PiArfTsKPj4gKwo+PiArI2lmbmRlZiBDT05G
SUdfUFBDX0JPT0szU182NAo+PiArREVDTEFSRV9WTV9HRVRfUEFHRV9QUk9UCj4+ICsjZW5kaWYK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNu
cHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
