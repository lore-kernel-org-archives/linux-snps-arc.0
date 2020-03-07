Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131E7C10F00
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 07:05:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2892073B
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 07:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ThAlBmi9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="hFwvKFlt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA2892073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cGy6MlAX98XWAAF4c6djzuduGD2PgkHPe3YA9JNr1Xo=; b=ThAlBmi9zAHgIYQ3nPc0XWJ/u
	N5S0g52NfSfQX9gvGx53AJiOSascXN8AyLpwQTLSpfJ+uoUCDAmPl/XRPXqUmD9p+7B8UXi1jJnHL
	BVHs47mZe1z7AybO467grEAMaEZOA+cTvAraLNqTDfB7kSGdQDqkrzwG5QNv1zIaulGCgNhjIhKmW
	/8Mj//4xBMb0ujFXTsXTRv0v7jmW3CJoIBZ2IaDOv3kDkUNL+HfnJtBELSF4rbsd8x42v3hRBelp2
	J/DEzsgd0Mi5c8nqbcNSkyMCxbRgGFcKzDHUkwZNgypLcb6v85X5yA96+9W+e7D+0bchoc+eubu3P
	1MG0Xnl5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jATWf-00084I-Dy; Sat, 07 Mar 2020 07:05:33 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jATWW-0007wa-Nk; Sat, 07 Mar 2020 07:05:26 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48ZFqW22V5zB09Zy;
 Sat,  7 Mar 2020 08:05:11 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hFwvKFlt; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JH70JFMo2Nhm; Sat,  7 Mar 2020 08:05:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48ZFqW06j2zB09Zx;
 Sat,  7 Mar 2020 08:05:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583564711; bh=KLykoiwakmvXlj7iOgiNeBA+k4S6on8FDV27weKg6MI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hFwvKFlt5tItEoeChiMcVbq8Z6WEJiAIueL914VqsjAkNiTW/tX4E4mkXgZPRPVQp
 1TSwGC1wl0uEf1SM3tvrvXA0/srRG2BvZ2uOnFi+rWlXqmPEgF9Of2NNwJRqkfVxFW
 8RUJEw8G1tWI+NWaS36EliXDmOzscoTf3q3gSbXQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D550D8B784;
 Sat,  7 Mar 2020 08:05:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OhKGFoGl11OV; Sat,  7 Mar 2020 08:05:11 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A0DC8B776;
 Sat,  7 Mar 2020 08:05:09 +0100 (CET)
Subject: Re: [PATCH V15] mm/debug: Add tests validating architecture page
 table helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, Qian Cai <cai@lca.pw>
References: <61250cdc-f80b-2e50-5168-2ec67ec6f1e6@arm.com>
 <CEEAD95E-D468-4C58-A65B-7E8AED91168A@lca.pw>
 <a45834bc-e6f2-ac21-de9e-1aff67d12797@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c40d907a-b64b-ae0d-e58f-33dddf0e8edc@c-s.fr>
Date: Sat, 7 Mar 2020 08:05:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a45834bc-e6f2-ac21-de9e-1aff67d12797@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_230525_070600_8ACC380D 
X-CRM114-Status: GOOD (  14.43  )
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
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAwNy8wMy8yMDIwIMOgIDAxOjU2LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IAo+IAo+IE9uIDAzLzA3LzIwMjAgMDY6MDQgQU0sIFFpYW4gQ2FpIHdyb3RlOgo+Pgo+Pgo+Pj4g
T24gTWFyIDYsIDIwMjAsIGF0IDc6MDMgUE0sIEFuc2h1bWFuIEtoYW5kdWFsIDxBbnNodW1hbi5L
aGFuZHVhbEBhcm0uY29tPiB3cm90ZToKPj4+Cj4+PiBIbW0sIHNldF9wdGVfYXQoKSBmdW5jdGlv
biBpcyBub3QgcHJlZmVycmVkIGhlcmUgZm9yIHRoZXNlIHRlc3RzLiBUaGUgaWRlYQo+Pj4gaXMg
dG8gYXZvaWQgb3IgYXRsZWFzdCBtaW5pbWl6ZSBUTEIvY2FjaGUgZmx1c2hlcyB0cmlnZ2VyZWQg
ZnJvbSB0aGVzZSBzb3J0Cj4+PiBvZiAnc3RhdGljJyB0ZXN0cy4gc2V0X3B0ZV9hdCgpIGlzIHBs
YXRmb3JtIHByb3ZpZGVkIGFuZCBjb3VsZC9taWdodCB0cmlnZ2VyCj4+PiB0aGVzZSBmbHVzaGVz
IG9yIHNvbWUgb3RoZXIgcGxhdGZvcm0gc3BlY2lmaWMgc3luY2hyb25pemF0aW9uIHN0dWZmLiBK
dXN0Cj4+Cj4+IFdoeSBpcyB0aGF0IGltcG9ydGFudCBmb3IgdGhpcyBkZWJ1Z2dpbmcgb3B0aW9u
Pwo+IAo+IFByaW1hcmlseSByZWFzb24gaXMgdG8gYXZvaWQgVExCL2NhY2hlIGZsdXNoIGluc3Ry
dWN0aW9ucyBvbiB0aGUgc3lzdGVtCj4gZHVyaW5nIHRoZXNlIHRlc3RzIHRoYXQgb25seSBpbnZv
bHZlIHRyYW5zZm9ybWluZyBkaWZmZXJlbnQgcGFnZSB0YWJsZQo+IGxldmVsIGVudHJpZXMgdGhy
b3VnaCBoZWxwZXJzLiBVbmxlc3MgcmVhbGx5IG5lY2Vzc2FyeSwgd2h5IHNob3VsZCBpdAo+IGVt
aXQgYW55IFRMQi9jYWNoZSBmbHVzaCBpbnN0cnVjdGlvbnMgPwoKV2hhdCdzIHRoZSBwcm9ibGVt
IHdpdGggdGhvc2VzIGZsdXNoZXMgPwoKPiAKPj4KPj4+IHdvbmRlcmluZyBpcyB0aGVyZSBzcGVj
aWZpYyByZWFzb24gd2l0aCByZXNwZWN0IHRvIHRoZSBzb2Z0IGxvY2sgdXAgcHJvYmxlbQo+Pj4g
bWFraW5nIGl0IG5lY2Vzc2FyeSB0byB1c2Ugc2V0X3B0ZV9hdCgpIHJhdGhlciB0aGFuIGEgc2lt
cGxlIFdSSVRFX09OQ0UoKSA/Cj4+Cj4+IExvb2tzIGF0IHRoZSBzMzkwIHZlcnNpb24gb2Ygc2V0
X3B0ZV9hdCgpLCBpdCBoYXMgdGhpcyBjb21tZW50LAo+PiB2bWFkZHIpOwo+Pgo+PiAvKgo+PiAg
ICogQ2VydGFpbiBhcmNoaXRlY3R1cmVzIG5lZWQgdG8gZG8gc3BlY2lhbCB0aGluZ3Mgd2hlbiBQ
VEVzCj4+ICAgKiB3aXRoaW4gYSBwYWdlIHRhYmxlIGFyZSBkaXJlY3RseSBtb2RpZmllZC4gIFRo
dXMsIHRoZSBmb2xsb3dpbmcKPj4gICAqIGhvb2sgaXMgbWFkZSBhdmFpbGFibGUuCj4+ICAgKi8K
Pj4KPj4gSSBjYW4gb25seSBndWVzcyB0aGF0IHBvd2VycGMgIGNvdWxkIGJlIHRoZSBzYW1lIGhl
cmUuCj4gCj4gVGhpcyBjb21tZW50IGlzIHByZXNlbnQgaW4gbXVsdGlwbGUgcGxhdGZvcm1zIHdo
aWxlIGRlZmluaW5nIHNldF9wdGVfYXQoKS4KPiBJcyBub3QgJ2JhcnJpZXIoKScgaGVyZSBhbG9u
ZSBnb29kIGVub3VnaCA/IEVsc2Ugd2hhdCBleGFjdGx5IHNldF9wdGVfYXQoKQo+IGRvZXMgYXMg
Y29tcGFyZWQgdG8gV1JJVEVfT05DRSgpIHRoYXQgYXZvaWRzIHRoZSBzb2Z0IGxvY2sgdXAsIGp1
c3QgdHJ5aW5nCj4gdG8gdW5kZXJzdGFuZC4KPiAKCgpBcmdoICEgSSBkaWRuJ3QgcmVhbGlzZSB0
aGF0IHlvdSB3ZXJlIHdyaXRpbmcgZGlyZWN0bHkgaW50byB0aGUgcGFnZSAKdGFibGVzLiBXaGVu
IGl0IHdvcmtzLCB0aGF0J3Mgb25seSBieSBjaGFuY2UgSSBndWVzcy4KClRvIHByb3Blcmx5IHNl
dCB0aGUgcGFnZSB0YWJsZSBlbnRyaWVzLCBzZXRfcHRlX2F0KCkgaGFzIHRvIGJlIHVzZWQ6Ci0g
T24gcG93ZXJwYyA4eHgsIHdpdGggMTZrIHBhZ2VzLCB0aGUgcGFnZSB0YWJsZSBlbnRyeSBtdXN0
IGJlIGNvcGllZCAKZm91ciB0aW1lcy4gc2V0X3B0ZV9hdCgpIGRvZXMgaXQsIFdSSVRFX09OQ0Uo
KSBkb2Vzbid0LgotIE9uIHBvd2VycGMgYm9vazNzLzMyIChoYXNoIE1NVSksIHRoZSBmbGFnIF9Q
QUdFX0hBU0hQVEUgbXVzdCBiZSAKcHJlc2VydmVkIGFtb25nIHdyaXRlcy4gc2V0X3B0ZV9hdCgp
IHByZXNlcnZlcyBpdCwgV1JJVEVfT05DRSgpIGRvZXNuJ3QuCgpzZXRfcHRlX2F0KCkgYWxzbyBk
b2VzIGEgZmV3IG90aGVyIG1hbmRhdG9yeSB0aGluZ3MsIGxpa2UgY2FsbGluZyAKcHRlX21rcHRl
KCkKClNvLCB0aGUgV1JJVEVfT05DRSgpIG11c3QgZGVmaW5pdGVseSBiZWNvbWUgYSBzZXRfcHRl
X2F0KCkKCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK
