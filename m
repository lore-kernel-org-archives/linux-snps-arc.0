Return-Path: <SRS0=flIm=4W=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C29CC3F2D1
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Mar 2020 06:23:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CF6207FD
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Mar 2020 06:23:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rPmQQuq8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CF6207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDw+6JJIhySzsMdC84pU9UjO4g5sZsR7c9bNwEpyIF8=; b=rPmQQuq8xR2y2w
	nPaqLouCEJOKMQtCpFKmr3u9a5zGEsP5gaOJs/KDwGFTVptPANbFwv/2dlyKsla89dkzy34kfHmXB
	y4A+9KLPQWYmCoN8NGvrYaYU8XA8MKgVkjAwvTMcqOHS6LWrRzI901r8/WyQKO4toaAkRNbP+W1XT
	ds/GPjzWc34W2OWUOJRfeRyHym75D5O1JsxvvmfozaKyrlP2y04txbvxQ4EzN9CGuBk0+8ywt3PIv
	UejPRwjwCRZ7wTJNvP21Msh/7rn34Q4kZ5XVIGgZKxfVIg8wvElMRzRTemMmi7m30XSCZhMdD/kZj
	qhs/5yFN6EFvDJMfSgyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9jv2-0006oZ-C7; Thu, 05 Mar 2020 06:23:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9jup-0006cO-JV; Thu, 05 Mar 2020 06:23:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17EB71FB;
 Wed,  4 Mar 2020 22:23:23 -0800 (PST)
Received: from [10.163.1.88] (unknown [10.163.1.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D1843F534;
 Wed,  4 Mar 2020 22:27:09 -0800 (PST)
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qian Cai <cai@lca.pw>
References: <c022e863-0807-fab1-cd41-3c320381f448@c-s.fr>
 <11F41980-97CF-411F-8120-41287DC1A382@lca.pw>
 <57a3bc61-bbd5-e251-9621-7bc28f7901a1@arm.com>
 <bcba7b7f-f351-4ee7-d74e-004a0bfbee47@c-s.fr>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d198fc5a-5337-c346-a21c-1ff133202e68@arm.com>
Date: Thu, 5 Mar 2020 11:53:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bcba7b7f-f351-4ee7-d74e-004a0bfbee47@c-s.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_222327_688084_C37DEE1F 
X-CRM114-Status: GOOD (  15.27  )
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
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAwMy8wNS8yMDIwIDExOjEzIEFNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+
IExlIDA1LzAzLzIwMjAgw6AgMDE6NTQsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+
Cj4+Cj4+IE9uIDAzLzA0LzIwMjAgMDQ6NTkgUE0sIFFpYW4gQ2FpIHdyb3RlOgo+Pj4KPj4+Cj4+
Pj4gT24gTWFyIDQsIDIwMjAsIGF0IDE6NDkgQU0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAYy1zLmZyPiB3cm90ZToKPj4+Pgo+Pj4+IEFGQUlVLCB5b3UgYXJlIG5vdCB0YWtp
bmcgYW4gaW50ZXJydXB0IGhlcmUuIFlvdSBhcmUgc3R1Y2sgaW4gdGhlIHB0ZV91cGRhdGUoKSwg
bW9zdCBsaWtlbHkgZHVlIHRvIG5lc3RlZCBsb2Nrcy4gVHJ5IHdpdGggTE9DS0RFUCA/Cj4+Pgo+
Pj4gTm90IGV4YWN0bHkgc3VyZSB3aGF0IGRpZCB5b3UgbWVhbiBoZXJlLCBidXQgdGhlIGtlcm5l
bCBoYXMgYWxsIGxvY2tkZXAgZW5hYmxlZCBhbmQgZGlkIG5vdCBmbGFnIGFueXRoaW5nIGhlcmUu
Cj4+Cj4+IEFzIHRoZSBwYXRjaCBoYXMgYmVlbiBkcm9wcGVkIGZyb20gTGludXggbmV4dCAobmV4
dC0yMDIwMDMwNCkgcGVyaGFwcyBpbgo+PiBvcmRlciB0byBmb2xkIGJhY2sgdGhlIF9fcGFfc3lt
Ym9sKCkgZml4IFsxXSwgc28gSSBhbSBwbGFubmluZyB0byByZXNwaW4KPj4gdGhlIG9yaWdpbmFs
IHBhdGNoIG9uY2UgbW9yZSBhcyBWMTUgd2hpbGUgYWRkaW5nIFFpYW4ncyBzaWduZWQgb2ZmIGJ5
IGZvcgo+PiB0aGUgcG93ZXJwYyBwYXJ0LiBGb3Igbm93IGxldHMgZW5hYmxlIHJhZGl4IE1NVSBw
cGM2NCBhbG9uZyB3aXRoIGV4aXN0aW5nCj4+IHBwYzMyLiBBcyBQUENfUkFESVhfTU1VIGRlcGVu
ZHMgb24gUFBDX0JPT0szU182NCwgdGhlIGZvbGxvd2luZyBjaGFuZ2UKPj4gc2hvdWxkIGJlIGdv
b2QgZW5vdWdoID8KPiAKPiBJIGRvbid0IHRoaW5rIHNvLCBldmVuIGlmIHlvdSBoYXZlIHRoZSBS
YWRpeCBNTVUgY29tcGlsZWQgaW4sIGhhc2ggTU1VIGlzIHVzZWQgd2hlbiBSYWRpeCBpcyBub3Qg
YXZhaWxhYmxlIG9yIGRpc2FibGVkLiBTbyB1bnRpbCB0aGUgSGFzaCBNTVUgcHJvYmxlbSBpcyBm
aXhlZCwgeW91IGNhbm5vdCBlbmFibGUgaXQgYnkgZGVmYXVsdC4KClNvIHRoaXMgaW1wbGllcywg
dGhhdCB3aXRoIERFQlVHX1ZNIGdpdmVuIGtlcm5lbCBjb21waWxlZCB3aXRoIFJhZGl4IE1NVSB3
aWxsCmdldCBzdHVjayBpbiBzb2Z0IGxvY2sgdXAgd2hlbiBmb3JjZWQgdG8gdXNlIGhhc2ggTU1V
IGluIGNhc2VzIHdoZXJlIFJhZGl4IE1NVQppcyBlaXRoZXIgbm90IGF2YWlsYWJsZSBvciBpcyBk
aXNhYmxlZC4gSGVuY2UsIHdlIGNhbm5vdCBlbmFibGUgdGhhdC4KCkkgd2lsbCBzdGlsbCBmb2xk
IHRoZSBjaGFuZ2VzIGZyb20gUWlhbiB3aXRob3V0IGVuYWJsaW5nIHBwYzY0IFJhZGl4IE1NVSBh
bmQKcmVzcGluIFYxNS4gVGhlc2UgbmV3IGNoYW5nZXMgZG9udCBodXJ0LCBidWlsZCBldmVyeSB3
aGVyZSBhbmQgd29ya3MgZ29vZApvbiBhcm02NCBhbmQgeDg2IHBsYXRmb3Jtcy4gTW9yZSBvdmVy
IHdlIGtub3cgdGhhdCB0aGV5IGFsc28gZml4IGEgcHJvYmxlbQpmb3IgcHBjNjQgUmFkaXggTU1V
IHBsYXRmb3Jtcy4gSGVuY2UgdW5sZXNzIHRoZXJlIGFyZSBzb21lIG90aGVyIGNvbmNlcm5zIHdl
CnNob3VsZCBmb2xkIHRoZW0gaW4uCgo+IAo+IENocmlzdG9waGUKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
