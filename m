Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CA8C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Mar 2022 03:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wcMv5A+5InB/WxCkzI0omwG+DBcAB83HFP4RJsLnaz8=; b=paBcyCr0c7sUYj/XKrV2JWTtdf
	0BRJOYSXjwVU0lu2N/feFrZrrS7BGSW56aDtd+EHQzIVKLRwGZFl1cJydQLJT/bvp8SYldySs346W
	fvgc0x4AhC8QQxilJJKm0NnQGchIP4bItidq++Hci1URKlxGSSEWa+2Ktodpw3e/fK64qIkMzCGA1
	eZKZjcnQIukLJ7FYsQHTgYwhcdXnStuczeW6WdjoQUkiK21vrBSqcVVJI/sIgbJ2IWzOkx28Wz/0N
	GoRB1G5x4dzmS6ozdfkkLl6zNRip4crpHldYsjEQnypCCNa8ol2ikevPIWOwPx7K5u8z+aPyicdAd
	PC9dpINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPFZb-001IBA-VW; Wed, 02 Mar 2022 03:22:43 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPFZK-001I54-VG; Wed, 02 Mar 2022 03:22:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D55FF11FB;
 Tue,  1 Mar 2022 19:22:25 -0800 (PST)
Received: from [10.163.49.202] (unknown [10.163.49.202])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 000B23F73D;
 Tue,  1 Mar 2022 19:22:16 -0800 (PST)
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
 <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <c3b60de0-38cd-160a-aa15-831349e07e23@arm.com>
Date: Wed, 2 Mar 2022 08:52:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_192227_127916_5371CA49 
X-CRM114-Status: GOOD (  19.58  )
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

CgpPbiAzLzEvMjIgMTo0NiBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAw
MS8wMy8yMDIyIMOgIDAxOjMxLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgYSDDqWNyaXTCoDoKPj4g
T24gVHVlLCBNYXIgMDEsIDIwMjIgYXQgMDU6MzA6NDFBTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1
YWwgd3JvdGU6Cj4+PiBPbiAyLzI4LzIyIDQ6MjcgUE0sIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3
cm90ZToKPj4+PiBPbiBNb24sIEZlYiAyOCwgMjAyMiBhdCAwNDoxNzozMlBNICswNTMwLCBBbnNo
dW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Pj4gVGhpcyBkZWZpbmVzIGFuZCBleHBvcnRzIGEgcGxh
dGZvcm0gc3BlY2lmaWMgY3VzdG9tIHZtX2dldF9wYWdlX3Byb3QoKSB2aWEKPj4+Pj4gc3Vic2Ny
aWJpbmcgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gU3Vic2VxdWVudGx5IGFsbCBfX1NYWFgg
YW5kIF9fUFhYWAo+Pj4+PiBtYWNyb3MgY2FuIGJlIGRyb3BwZWQgd2hpY2ggYXJlIG5vIGxvbmdl
ciBuZWVkZWQuCj4+Pj4KPj4+PiBXaGF0IEkgd291bGQgcmVhbGx5IGxpa2UgdG8ga25vdyBpcyB3
aHkgaGF2aW5nIHRvIHJ1biBfY29kZV8gdG8gd29yayBvdXQKPj4+PiB3aGF0IHRoZSBwYWdlIHBy
b3RlY3Rpb25zIG5lZWQgdG8gYmUgaXMgYmV0dGVyIHRoYW4gbG9va2luZyBpdCB1cCBpbiBhCj4+
Pj4gdGFibGUuCj4+Pj4KPj4+PiBOb3Qgb25seSBpcyB0aGlzIG1vcmUgZXhwZW5zaXZlIGluIHRl
cm1zIG9mIENQVSBjeWNsZXMsIGl0IGFsc28gYnJpbmdzCj4+Pj4gYWRkaXRpb25hbCBjb2RlIHNp
emUgd2l0aCBpdC4KPj4+Pgo+Pj4+IEknbSBzdHJ1Z2dsaW5nIHRvIHNlZSB3aGF0IHRoZSBiZW5l
Zml0IGlzLgo+Pj4KPj4+IEN1cnJlbnRseSB2bV9nZXRfcGFnZV9wcm90KCkgaXMgYWxzbyBiZWlu
ZyBfcnVuXyB0byBmZXRjaCByZXF1aXJlZCBwYWdlCj4+PiBwcm90ZWN0aW9uIHZhbHVlcy4gQWx0
aG91Z2ggdGhhdCBpcyBiZWluZyBydW4gaW4gdGhlIGNvcmUgTU0gYW5kIGZyb20gYQo+Pj4gcGxh
dGZvcm0gcGVyc3BlY3RpdmUgX19TWFhYLCBfX1BYWFggYXJlIGp1c3QgYmVpbmcgZXhwb3J0ZWQg
Zm9yIGEgdGFibGUuCj4+PiBMb29raW5nIGl0IHVwIGluIGEgdGFibGUgKGFuZCBhcHBseWluZyBt
b3JlIGNvbnN0cnVjdHMgdGhlcmUgYWZ0ZXIpIGlzCj4+PiBub3QgbXVjaCBkaWZmZXJlbnQgdGhh
biBhIGNsZWFuIHN3aXRjaCBjYXNlIHN0YXRlbWVudCBpbiB0ZXJtcyBvZiBDUFUKPj4+IHVzYWdl
LiBTbyB0aGlzIGlzIG5vdCBtb3JlIGV4cGVuc2l2ZSBpbiB0ZXJtcyBvZiBDUFUgY3ljbGVzLgo+
Pgo+PiBJIGRpc2FncmVlLgo+IAo+IFNvIGRvIEkuCj4gCj4+Cj4+IEhvd2V2ZXIsIGxldCdzIGJh
c2UgdGhpcyBkaXNhZ3JlZW1lbnQgb24gc29tZSBldmlkZW5jZS4gSGVyZSBpcyB0aGUKPj4gcHJl
c2VudCAzMi1iaXQgQVJNIGltcGxlbWVudGF0aW9uOgo+Pgo+PiAwMDAwMDA0OCA8dm1fZ2V0X3Bh
Z2VfcHJvdD46Cj4+ICAgICAgICA0ODogICAgICAgZTIwMDAwMGYgICAgICAgIGFuZCAgICAgcjAs
IHIwLCAjMTUKPj4gICAgICAgIDRjOiAgICAgICBlMzAwMzAwMCAgICAgICAgbW92dyAgICByMywg
IzAKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIDRjOiBSX0FSTV9NT1ZXX0FCU19OQyAgIC5M
QU5DSE9SMQo+PiAgICAgICAgNTA6ICAgICAgIGUzNDAzMDAwICAgICAgICBtb3Z0ICAgIHIzLCAj
MAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgNTA6IFJfQVJNX01PVlRfQUJTICAgICAgLkxB
TkNIT1IxCj4+ICAgICAgICA1NDogICAgICAgZTc5MzAxMDAgICAgICAgIGxkciAgICAgcjAsIFty
MywgcjAsIGxzbCAjMl0KPj4gICAgICAgIDU4OiAgICAgICBlMTJmZmYxZSAgICAgICAgYnggICAg
ICBscgo+Pgo+PiBUaGF0IGlzIGZpdmUgaW5zdHJ1Y3Rpb25zIGxvbmcuCj4gCj4gT24gcHBjMzIg
SSBnZXQ6Cj4gCj4gMDAwMDAwOTQgPHZtX2dldF9wYWdlX3Byb3Q+Ogo+ICAgICAgICA5NDoJM2Qg
MjAgMDAgMDAgCWxpcyAgICAgcjksMAo+IAkJCTk2OiBSX1BQQ19BRERSMTZfSEEJLmRhdGEuLnJv
X2FmdGVyX2luaXQKPiAgICAgICAgOTg6CTU0IDg0IDE2IGJhIAlybHdpbm0gIHI0LHI0LDIsMjYs
MjkKPiAgICAgICAgOWM6CTM5IDI5IDAwIDAwIAlhZGRpICAgIHI5LHI5LDAKPiAJCQk5ZTogUl9Q
UENfQUREUjE2X0xPCS5kYXRhLi5yb19hZnRlcl9pbml0Cj4gICAgICAgIGEwOgk3ZCAyOSAyMCAy
ZSAJbHd6eCAgICByOSxyOSxyNAo+ICAgICAgICBhNDoJOTEgMjMgMDAgMDAgCXN0dyAgICAgcjks
MChyMykKPiAgICAgICAgYTg6CTRlIDgwIDAwIDIwIAlibHIKPiAKPiAKPj4KPj4gUGxlYXNlIHNo
b3cgdGhhdCB5b3VyIG5ldyBpbXBsZW1lbnRhdGlvbiBpcyBub3QgbW9yZSBleHBlbnNpdmUgb24K
Pj4gMzItYml0IEFSTS4gUGxlYXNlIGRvIHNvIGJ5IGJ1aWxkaW5nIGEgMzItYml0IGtlcm5lbCwg
YW5kIHByb3ZpZGluZwo+PiB0aGUgZGlzYXNzZW1ibHkuCj4gCj4gV2l0aCB5b3VyIHNlcmllcyBJ
IGdldDoKPiAKPiAwMDAwMDAwMCA8dm1fZ2V0X3BhZ2VfcHJvdD46Cj4gICAgIDA6CTNkIDIwIDAw
IDAwIAlsaXMgICAgIHI5LDAKPiAJCQkyOiBSX1BQQ19BRERSMTZfSEEJLnJvZGF0YQo+ICAgICA0
OgkzOSAyOSAwMCAwMCAJYWRkaSAgICByOSxyOSwwCj4gCQkJNjogUl9QUENfQUREUjE2X0xPCS5y
b2RhdGEKPiAgICAgODoJNTQgODQgMTYgYmEgCXJsd2lubSAgcjQscjQsMiwyNiwyOQo+ICAgICBj
Ogk3ZCA0OSAyMCAyZSAJbHd6eCAgICByMTAscjkscjQKPiAgICAxMDoJN2QgNGEgNGEgMTQgCWFk
ZCAgICAgcjEwLHIxMCxyOQo+ICAgIDE0Ogk3ZCA0OSAwMyBhNiAJbXRjdHIgICByMTAKPiAgICAx
ODoJNGUgODAgMDQgMjAgCWJjdHIKPiAgICAxYzoJMzkgMjAgMDMgMTUgCWxpICAgICAgcjksNzg5
Cj4gICAgMjA6CTkxIDIzIDAwIDAwIAlzdHcgICAgIHI5LDAocjMpCj4gICAgMjQ6CTRlIDgwIDAw
IDIwIAlibHIKPiAgICAyODoJMzkgMjAgMDEgMTUgCWxpICAgICAgcjksMjc3Cj4gICAgMmM6CTkx
IDIzIDAwIDAwIAlzdHcgICAgIHI5LDAocjMpCj4gICAgMzA6CTRlIDgwIDAwIDIwIAlibHIKPiAg
ICAzNDoJMzkgMjAgMDcgMTUgCWxpICAgICAgcjksMTgxMwo+ICAgIDM4Ogk5MSAyMyAwMCAwMCAJ
c3R3ICAgICByOSwwKHIzKQo+ICAgIDNjOgk0ZSA4MCAwMCAyMCAJYmxyCj4gICAgNDA6CTM5IDIw
IDA1IDE1IAlsaSAgICAgIHI5LDEzMDEKPiAgICA0NDoJOTEgMjMgMDAgMDAgCXN0dyAgICAgcjks
MChyMykKPiAgICA0ODoJNGUgODAgMDAgMjAgCWJscgo+ICAgIDRjOgkzOSAyMCAwMSAxMSAJbGkg
ICAgICByOSwyNzMKPiAgICA1MDoJNGIgZmYgZmYgZDAgCWIgICAgICAgMjAgPHZtX2dldF9wYWdl
X3Byb3QrMHgyMD4KPiAKPiAKPiBUaGF0IGlzIGRlZmluaXRlbHkgbW9yZSBleHBlbnNpdmUsIGl0
IGltcGxlbWVudHMgYSB0YWJsZSBvZiBicmFuY2hlcy4KCk9rYXksIHdpbGwgc3BsaXQgb3V0IHRo
ZSBQUEMzMiBpbXBsZW1lbnRhdGlvbiB0aGF0IHJldGFpbnMgZXhpc3RpbmcKdGFibGUgbG9vayB1
cCBtZXRob2QuIEFsc28gcGxhbm5pbmcgdG8ga2VlcCB0aGF0IGluc2lkZSBzYW1lIGZpbGUKKGFy
Y2gvcG93ZXJwYy9tbS9tbWFwLmMpLCB1bmxlc3MgeW91IGhhdmUgYSBkaWZmZXJlbmNlIHByZWZl
cmVuY2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
