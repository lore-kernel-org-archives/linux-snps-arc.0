Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D28FC2D0E8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 06:47:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07EE920714
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 06:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pnqnrgze"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07EE920714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fz1FMEV5wSuvTRu6BIyDalUwbTkuukrE7qEI/JEqqK8=; b=PnqnrgzestTay9
	jGp+dZCyF2/dq3maxgeO04TpSWKUvU5iY785nWaKtjvBhCnLGzU/fWAUGXyht1PkYZUBh2S4rAoBC
	Mx2JePYVperGe5jp1NUIGQXkI82acREcWfdKt8rE+FU34DkEezDlUer8ahj2qsWcvhtm678zv/Wqj
	TJtLihUqH5etNRmZuO01FEEEv6Vpl/tjkfSX1Tg9DMxr2ga+6eAtkfk97a8zwTPClvmzOJAZIUOHt
	W80lcT16UCli2A0GDneqBvGdEiQWfuykaUz/C0ROKJEm+FTTsvDg+1JSFUl9RDDGrdE1SSkqzZDtZ
	PsNhAt1jxMas+XNYyXSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHiln-0000lQ-38; Fri, 27 Mar 2020 06:47:07 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHila-0000Zi-F9; Fri, 27 Mar 2020 06:46:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC7317FA;
 Thu, 26 Mar 2020 23:46:50 -0700 (PDT)
Received: from [10.163.1.31] (unknown [10.163.1.31])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B53F3F71F;
 Thu, 26 Mar 2020 23:50:47 -0700 (PDT)
Subject: Re: [PATCH V2 0/3] mm/debug: Add more arch page table helper tests
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
References: <1585027375-9997-1-git-send-email-anshuman.khandual@arm.com>
 <2bb4badc-2b7a-e15d-a99b-b1bd38c9d9bf@arm.com>
 <a46d18ed-8911-1ec3-c32f-58b6e0d959d7@c-s.fr>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <9675882f-0ec5-5e46-551f-dd3aa38bf8d8@arm.com>
Date: Fri, 27 Mar 2020 12:16:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a46d18ed-8911-1ec3-c32f-58b6e0d959d7@c-s.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_234654_596930_8CFBCDF9 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: linux-doc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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

Ck9uIDAzLzI2LzIwMjAgMDg6NTMgUE0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gCj4gCj4g
TGUgMjYvMDMvMjAyMCDDoCAwMzoyMywgQW5zaHVtYW4gS2hhbmR1YWwgYSDDqWNyaXTCoDoKPj4K
Pj4KPj4gT24gMDMvMjQvMjAyMCAxMDo1MiBBTSwgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6Cj4+
PiBUaGlzIHNlcmllcyBhZGRzIG1vcmUgYXJjaCBwYWdlIHRhYmxlIGhlbHBlciB0ZXN0cy4gVGhl
IG5ldyB0ZXN0cyBoZXJlIGFyZQo+Pj4gZWl0aGVyIHJlbGF0ZWQgdG8gY29yZSBtZW1vcnkgZnVu
Y3Rpb25zIGFuZCBhZHZhbmNlZCBhcmNoIHBndGFibGUgaGVscGVycy4KPj4+IFRoaXMgYWxzbyBj
cmVhdGVzIGEgZG9jdW1lbnRhdGlvbiBmaWxlIGVubGlzdGluZyBhbGwgZXhwZWN0ZWQgc2VtYW50
aWNzIGFzCj4+PiBzdWdnZXN0ZWQgYnkgTWlrZSBSYXBvcG9ydCAoaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMjAvMS8zMC80MCkuCj4+Pgo+Pj4gVGhpcyBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIG9u
IGFybTY0IGFuZCB4ODYgcGxhdGZvcm1zLgo+Pgo+PiBJZiBmb2xrcyBjYW4gdGVzdCB0aGVzZSBw
YXRjaGVzIG91dCBvbiByZW1haW5pbmcgQVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRQo+PiBlbmFi
bGVkIHBsYXRmb3JtcyBpLmUgczM5MCwgYXJjLCBwb3dlcnBjICgzMiBhbmQgNjQpLCB0aGF0IHdp
bGwgYmUgcmVhbGx5Cj4+IGFwcHJlY2lhdGVkLiBUaGFuayB5b3UuCj4+Cj4gCj4gT24gcG93ZXJw
YyA4eHggKFBQQzMyKSwgSSBnZXQ6Cj4gCj4gW8KgwqAgNTMuMzM4MzY4XSBkZWJ1Z192bV9wZ3Rh
YmxlOiBkZWJ1Z192bV9wZ3RhYmxlOiBWYWxpZGF0aW5nIGFyY2hpdGVjdHVyZSBwYWdlIHRhYmxl
IGhlbHBlcnMKPiBbwqDCoCA1My4zNDc0MDNdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0t
LS0tLS0tLQo+IFvCoMKgIDUzLjM1MTgzMl0gV0FSTklORzogQ1BVOiAwIFBJRDogMSBhdCBtbS9k
ZWJ1Z192bV9wZ3RhYmxlLmM6NjQ3IGRlYnVnX3ZtX3BndGFibGUrMHgyODAvMHgzZjQKCm1tL2Rl
YnVnX3ZtX3BndGFibGUuYzo2NDcgPwoKV2l0aCB0aGUgZm9sbG93aW5nIGNvbW1pdHMgaW4gcGxh
Y2UKCjUzYTgzMzhjZSAoSEVBRCkgRG9jdW1lbnRhdGlvbi9tbTogQWRkIGRlc2NyaXB0aW9ucyBm
b3IgYXJjaCBwYWdlIHRhYmxlIGhlbHBlcgo1ZDQ5MTNmYzEgbW0vZGVidWc6IEFkZCB0ZXN0cyB2
YWxpZGF0aW5nIGFyY2ggYWR2YW5jZWQgcGFnZSB0YWJsZSBoZWxwZXJzCmJjYWYxMjBhNyBtbS9k
ZWJ1ZzogQWRkIHRlc3RzIHZhbGlkYXRpbmcgYXJjaCBwYWdlIHRhYmxlIGhlbHBlcnMgZm9yIGNv
cmUgZmVhdHVyZXMKZDZlZDVhNGE1IHg4Ni9tZW1vcnk6IERyb3AgcHVkX21rbm90cHJlc2VudCgp
CjA3MzlkMWY4ZCBtbS9kZWJ1ZzogQWRkIHRlc3RzIHZhbGlkYXRpbmcgYXJjaGl0ZWN0dXJlIHBh
Z2UgdGFibGUgaGVscGVycwoxNmZiZjc5YjAgKHRhZzogdjUuNi1yYzcpIExpbnV4IDUuNi1yYzcK
Cm1tL2RlYnVnX3ZtX3BndGFibGUuYzo2NDcgaXMgaGVyZS4KCiNpZmRlZiBDT05GSUdfQVJDSF9F
TkFCTEVfVEhQX01JR1JBVElPTgpzdGF0aWMgdm9pZCBfX2luaXQgcG1kX3N3YXBfdGVzdHModW5z
aWduZWQgbG9uZyBwZm4sIHBncHJvdF90IHByb3QpCnsKICAgICAgICBzd3BfZW50cnlfdCBzd3A7
CiAgICAgICAgcG1kX3QgcG1kOyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+IExpbmUg
IzY0NwoKICAgICAgICBwbWQgPSBwZm5fcG1kKHBmbiwgcHJvdCk7CiAgICAgICAgc3dwID0gX19w
bWRfdG9fc3dwX2VudHJ5KHBtZCk7CiAgICAgICAgV0FSTl9PTighcG1kX3NhbWUocG1kLCBfX3N3
cF9lbnRyeV90b19wbWQoc3dwKSkpOwp9CiNlbHNlCnN0YXRpYyB2b2lkIF9faW5pdCBwbWRfc3dh
cF90ZXN0cyh1bnNpZ25lZCBsb25nIHBmbiwgcGdwcm90X3QgcHJvdCkgeyB9CiNlbmQKCkRpZCBJ
IG1pc3Mgc29tZXRoaW5nID8KCj4gW8KgwqAgNTMuMzYwMTQwXSBDUFU6IDAgUElEOiAxIENvbW06
IHN3YXBwZXIgTm90IHRhaW50ZWQgNS42LjAtcmM3LXMzay1kZXYtMDEwOTAtZzkyNzEwZTk5ODgx
ZiAjMzU0NAo+IFvCoMKgIDUzLjM2ODcxOF0gTklQOsKgIGMwNzc3YzA0IExSOiBjMDc3N2JiOCBD
VFI6IDAwMDAwMDAwCj4gW8KgwqAgNTMuMzczNzIwXSBSRUdTOiBjOTAyM2RmMCBUUkFQOiAwNzAw
wqDCoCBOb3QgdGFpbnRlZCAoNS42LjAtcmM3LXMzay1kZXYtMDEwOTAtZzkyNzEwZTk5ODgxZikK
PiBbwqDCoCA1My4zODIwNDJdIE1TUjrCoCAwMDAyOTAzMiA8RUUsTUUsSVIsRFIsUkk+wqAgQ1I6
IDIyMDAwMjIywqAgWEVSOiAyMDAwMDAwMAo+IFvCoMKgIDUzLjM4ODY2N10KPiBbwqDCoCA1My4z
ODg2NjddIEdQUjAwOiBjMDc3N2JiOCBjOTAyM2VhOCBjNjEyMDAwMCAwMDAwMDAwMSAxZTQxMDAw
MCAwMDAwMDAwMCAwMDAwMDAwMCAwMDc2NDFjOQo+IFvCoMKgIDUzLjM4ODY2N10gR1BSMDg6IDAw
MDAwMDAwIDAwMDAwMDAxIDAwMDAwMDAwIGZmZmZmZmZmIDgyMDAwMjIyIDAwMDAwMDAwIGMwMDAz
OWI4IDAwMDAwMDAwCj4gW8KgwqAgNTMuMzg4NjY3XSBHUFIxNjogMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgZmZmZmZmZjAgMDY1ZmMwMDAgMWU0MTAwMDAgYzY2MDAwMDAgMDAwMDAxZTQKPiBb
wqDCoCA1My4zODg2NjddIEdQUjI0OiAwMDAwMDFkOSBjMDYyZDE0YyBjNjVmYzAwMCBjNjQyZDQ0
OCAwMDAwMDZjOSAwMDAwMDAwMCBjNjVmODAwMCBjNjVmYzA0MAo+IFvCoMKgIDUzLjQyMzQwMF0g
TklQIFtjMDc3N2MwNF0gZGVidWdfdm1fcGd0YWJsZSsweDI4MC8weDNmNAo+IFvCoMKgIDUzLjQy
ODU1OV0gTFIgW2MwNzc3YmI4XSBkZWJ1Z192bV9wZ3RhYmxlKzB4MjM0LzB4M2Y0Cj4gW8KgwqAg
NTMuNDMzNTkzXSBDYWxsIFRyYWNlOgo+IFvCoMKgIDUzLjQzNjA0OF0gW2M5MDIzZWE4XSBbYzA3
NzdiYjhdIGRlYnVnX3ZtX3BndGFibGUrMHgyMzQvMHgzZjQgKHVucmVsaWFibGUpCj4gW8KgwqAg
NTMuNDQyOTM2XSBbYzkwMjNmMjhdIFtjMDAwMzllMF0ga2VybmVsX2luaXQrMHgyOC8weDEyNAo+
IFvCoMKgIDUzLjQ0ODE4NF0gW2M5MDIzZjM4XSBbYzAwMGYxNzRdIHJldF9mcm9tX2tlcm5lbF90
aHJlYWQrMHgxNC8weDFjCj4gW8KgwqAgNTMuNDU0MjQ1XSBJbnN0cnVjdGlvbiBkdW1wOgo+IFvC
oMKgIDUzLjQ1NzE4MF0gNDFhMjAwMDggNGJlYTNlZDkgNjI4OTAwMjEgN2QzNmI5MmUgN2QzNmI4
MmUgNzEyOTBmZDAgMzE0OWZmZmYgN2QyYTQ5MTAKPiBbwqDCoCA1My40NjQ4MzhdIDBmMDkwMDAw
IDU3ODkwNzdlIDMxNDlmZmZmIDdkMmE0OTEwIDwwZjA5MDAwMD4gMzhjMDAwMDAgMzhhMDAwMDAg
Mzg4MDAwMDAKPiBbwqDCoCA1My40NzI2NzFdIC0tLVsgZW5kIHRyYWNlIGZkNWRkOTI3NDRkYzAw
NjUgXS0tLQpDb3VsZCB5b3UgcGxlYXNlIHBvaW50IG1lIHRvIHRoZSBleGFjdCB0ZXN0IHdoaWNo
IGlzIGZhaWxpbmcgPwoKPiBbwqDCoCA1My41MTk3NzhdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBt
ZW1vcnk6IDYwOEsKPiAKPiAKU28gSSBhc3N1bWUgdGhhdCB0aGUgc3lzdGVtIHNob3VsZCBoYXZl
IGNvbWUgdGlsbCBydW50aW1lIGp1c3QgZmluZSBhcGFydCBmcm9tCnRoZSBhYm92ZSB3YXJuaW5n
IG1lc3NhZ2UgYmVjYXVzZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK
