Return-Path: <SRS0=flIm=4W=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9915FC3F2CD
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Mar 2020 05:43:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6747F208C3
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Mar 2020 05:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aQCaw+hz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="UCg+E84G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6747F208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=adxgr+sgMQNhVa+uXvPnT6cW7HABYfZiQabG/GWbJpo=; b=aQCaw+hzWJgJ8LBAiUGX7845o
	KssxQMTNpLUNdG4VDGSjIrEg2oE9RhgVlK63r9PjAjGiRoi6v7VnQrnZb3/KJsMmo+o3HniJ1qwfE
	8aAZTcdCiTdn45OMMgwhWaQgyBdkiVaQfB+jcmaAfgLfzAhmUF/2B41fOQGfSys3NvvRJe0KiqmLh
	Ig6SKt6eAa5+uFlBZGsd3ZOMRwtUPV4Z0uzsMErD7aNdGJsOE2rPs9jMxzo/tJAZTAzlRHIHu4g8n
	LC57lnXin0xNVCcG7+zODwj6IiumFzYIfACXQkAoHKhp3hwX8sD/K6ULlmDXNuDYgbyb803d9g0oO
	4E1gH8eTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9jIU-0000pL-JR; Thu, 05 Mar 2020 05:43:50 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9jIG-0000bz-Vz; Thu, 05 Mar 2020 05:43:38 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Y06D6b32z9v0Cs;
 Thu,  5 Mar 2020 06:43:32 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UCg+E84G; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VTVXXCiiDbWA; Thu,  5 Mar 2020 06:43:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Y06D4WRtz9v0Cr;
 Thu,  5 Mar 2020 06:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583387012; bh=O7lgY+PnhSJPbSOI4sr3mclek/SOkIJfidyuwCRZt5E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UCg+E84GGdl1tJQVZH1Ovf1X2MFT1jANeg/avNyTa/wgDK/AFcZlsHC6wtBCTreEW
 IIBoeTbu/OvYV0fGWK+oS5bBaBBh3LdZWCoVTQj2d42uZgyX7h61ciJf6DYFn7C5sq
 y7FFPsJ/rH3Z+NZSn+w0vMP0V2uU5bzXosVLrKE4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5850C8B78D;
 Thu,  5 Mar 2020 06:43:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id y-ltjW1KjHqS; Thu,  5 Mar 2020 06:43:33 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9213B8B756;
 Thu,  5 Mar 2020 06:43:31 +0100 (CET)
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, Qian Cai <cai@lca.pw>
References: <c022e863-0807-fab1-cd41-3c320381f448@c-s.fr>
 <11F41980-97CF-411F-8120-41287DC1A382@lca.pw>
 <57a3bc61-bbd5-e251-9621-7bc28f7901a1@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <bcba7b7f-f351-4ee7-d74e-004a0bfbee47@c-s.fr>
Date: Thu, 5 Mar 2020 06:43:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <57a3bc61-bbd5-e251-9621-7bc28f7901a1@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_214337_326489_849A39E7 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAwNS8wMy8yMDIwIMOgIDAxOjU0LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IAo+IAo+IE9uIDAzLzA0LzIwMjAgMDQ6NTkgUE0sIFFpYW4gQ2FpIHdyb3RlOgo+Pgo+Pgo+Pj4g
T24gTWFyIDQsIDIwMjAsIGF0IDE6NDkgQU0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAYy1zLmZyPiB3cm90ZToKPj4+Cj4+PiBBRkFJVSwgeW91IGFyZSBub3QgdGFraW5nIGFu
IGludGVycnVwdCBoZXJlLiBZb3UgYXJlIHN0dWNrIGluIHRoZSBwdGVfdXBkYXRlKCksIG1vc3Qg
bGlrZWx5IGR1ZSB0byBuZXN0ZWQgbG9ja3MuIFRyeSB3aXRoIExPQ0tERVAgPwo+Pgo+PiBOb3Qg
ZXhhY3RseSBzdXJlIHdoYXQgZGlkIHlvdSBtZWFuIGhlcmUsIGJ1dCB0aGUga2VybmVsIGhhcyBh
bGwgbG9ja2RlcCBlbmFibGVkIGFuZCBkaWQgbm90IGZsYWcgYW55dGhpbmcgaGVyZS4KPiAKPiBB
cyB0aGUgcGF0Y2ggaGFzIGJlZW4gZHJvcHBlZCBmcm9tIExpbnV4IG5leHQgKG5leHQtMjAyMDAz
MDQpIHBlcmhhcHMgaW4KPiBvcmRlciB0byBmb2xkIGJhY2sgdGhlIF9fcGFfc3ltYm9sKCkgZml4
IFsxXSwgc28gSSBhbSBwbGFubmluZyB0byByZXNwaW4KPiB0aGUgb3JpZ2luYWwgcGF0Y2ggb25j
ZSBtb3JlIGFzIFYxNSB3aGlsZSBhZGRpbmcgUWlhbidzIHNpZ25lZCBvZmYgYnkgZm9yCj4gdGhl
IHBvd2VycGMgcGFydC4gRm9yIG5vdyBsZXRzIGVuYWJsZSByYWRpeCBNTVUgcHBjNjQgYWxvbmcg
d2l0aCBleGlzdGluZwo+IHBwYzMyLiBBcyBQUENfUkFESVhfTU1VIGRlcGVuZHMgb24gUFBDX0JP
T0szU182NCwgdGhlIGZvbGxvd2luZyBjaGFuZ2UKPiBzaG91bGQgYmUgZ29vZCBlbm91Z2ggPwoK
SSBkb24ndCB0aGluayBzbywgZXZlbiBpZiB5b3UgaGF2ZSB0aGUgUmFkaXggTU1VIGNvbXBpbGVk
IGluLCBoYXNoIE1NVSAKaXMgdXNlZCB3aGVuIFJhZGl4IGlzIG5vdCBhdmFpbGFibGUgb3IgZGlz
YWJsZWQuIFNvIHVudGlsIHRoZSBIYXNoIE1NVSAKcHJvYmxlbSBpcyBmaXhlZCwgeW91IGNhbm5v
dCBlbmFibGUgaXQgYnkgZGVmYXVsdC4KCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
