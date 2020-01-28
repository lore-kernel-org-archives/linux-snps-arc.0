Return-Path: <SRS0=i8W8=3R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C008C33CB3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 06:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 413E82173E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 06:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P5bLMzIa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="lgZskWmS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 413E82173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J6OHjxBxfKXFPw2f/r1czqgQEFMCchVJykjfCpnd6+M=; b=P5bLMzIat0JeoxLZ4/S7lAda5
	LIoZFrG/1LN0OCc/eGx6192S1wEXhOs9C98hDXOOphIqpCF676EMrRwjm9acdUbcG15Wr9Swa+eeq
	NmqefTzdESwRXl2nAZL3Eo1osIt5JDljaXLxEJjsDj1AUXs2ypync08EjMe31iAleDen1nzoF9wqC
	sjHKSc56pAYlPdstBttZ0KVnwfAGp1GQyUbxMGVONuxUlhGpERh1JlZCEg/KVs/OLai47H0kGkraS
	mcj5fPzenZn+KnWQBK07G/BfhRu/TPqhfQfW+S0OPSjGSnY/N+tSy31shvWRjpFq35gJnwbvHEewv
	LLgmFE+Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwKC5-0006xI-Bs; Tue, 28 Jan 2020 06:17:49 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwKBu-0006o1-G9; Tue, 28 Jan 2020 06:17:40 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 486Gcc0WVCz9v22Q;
 Tue, 28 Jan 2020 07:17:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=lgZskWmS; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UkHPZqpb554O; Tue, 28 Jan 2020 07:17:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 486Gcb627Gz9v22N;
 Tue, 28 Jan 2020 07:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580192255; bh=+DPt49RKHi9mO1gnM2058SFaj+Fq0ceAMy7haYJU1NM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lgZskWmSj1VA5v5b98S9ZEmr7USU9rrof5MnKymq+rXgWJyl99vDSXQIZX47bFjeC
 /6k5GZov6uOPE4UU+Xi9hVhZlNd3ZPIeokTTE6E9eAr6ycFttvMUe986W6/vBNtjV8
 Ykd6Kd6ETlhEILSsCQYi5j6eBswWvSBhAxwf3fzs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8873F8B7C2;
 Tue, 28 Jan 2020 07:17:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RqoGVOoiJ5M4; Tue, 28 Jan 2020 07:17:36 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC9498B75B;
 Tue, 28 Jan 2020 07:17:33 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>, Anshuman Khandual <Anshuman.Khandual@arm.com>
References: <012158b7-a40e-050f-cd1b-d6ce7faf042f@arm.com>
 <EE5B936C-121E-4322-A285-603D82D59B3A@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <115c187b-73ce-30b2-0694-999db1f2183b@c-s.fr>
Date: Tue, 28 Jan 2020 07:17:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <EE5B936C-121E-4322-A285-603D82D59B3A@lca.pw>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_221738_843290_92D77207 
X-CRM114-Status: GOOD (  18.31  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAyOC8wMS8yMDIwIMOgIDA2OjQ4LCBRaWFuIENhaSBhIMOpY3JpdMKgOgo+IAo+IAo+PiBP
biBKYW4gMjcsIDIwMjAsIGF0IDExOjU4IFBNLCBBbnNodW1hbiBLaGFuZHVhbCA8QW5zaHVtYW4u
S2hhbmR1YWxAYXJtLmNvbT4gd3JvdGU6Cj4+Cj4+IEFzIEkgaGFkIG1lbnRpb25lZCBiZWZvcmUs
IHRoZSB0ZXN0IGF0dGVtcHRzIHRvIGZvcm1hbGl6ZSBwYWdlIHRhYmxlIGhlbHBlciBzZW1hbnRp
Y3MKPj4gYXMgZXhwZWN0ZWQgZnJvbSBnZW5lcmljIE1NIGNvZGUgcGF0aHMgYW5kIGludGVuZCB0
byBjYXRjaCBkZXZpYXRpb25zIHdoZW4gZW5hYmxlZCBvbgo+PiBhIGdpdmVuIHBsYXRmb3JtLiBI
b3cgZWxzZSBzaG91bGQgd2UgdGVzdCBzZW1hbnRpY3MgZXJyb3JzIG90aGVyd2lzZSA/IFRoZXJl
IGFyZSBwYXN0Cj4+IGV4YW1wbGVzIG9mIHVzZWZ1bG5lc3MgZm9yIHRoaXMgcHJvY2VkdXJlIG9u
IGFybTY0IGFuZCBvbiBzMzkwLiBJIGFtIHdvbmRlcmluZyBob3cKPj4gZWxzZSB0byBwcm92ZSB0
aGUgdXNlZnVsbmVzcyBvZiBhIGRlYnVnIGZlYXR1cmUgaWYgdGhlc2UgcmVmZXJlbmNlcyBhcmUg
bm90IGVub3VnaC4KPiAKPiBOb3Qgc2F5aW5nIGl0IHdpbGwgbm90IGJlIHVzZWZ1bC4gQXMgeW91
IG1lbnRpb25lZCBpdCBhY3R1YWxseSBmb3VuZCBhIGJ1ZyBvciB0d28gaW4gdGhlIHBhc3QuIFRo
ZSBwcm9ibGVtIGlzIHRoYXQgdGhlcmUgaXMgYWx3YXlzIGEgY29zdCB0byBtYWludGFpbiBzb21l
dGhpbmcgbGlrZSB0aGlzLCBhbmQgbm9ib2R5IGtuZXcgaG93IHRoaW5ncyBjb3VsZCBiZSBicm9r
ZW4gZXZlbiBmb3IgdGhlIGlzb2xhdGVkIGNvZGUgeW91IG1lbnRpb25lZCBpbiB0aGUgZnV0dXJl
IGdpdmVuIGhvdyBjb21wbGljYXRlZCB0aGUga2VybmVsIGNvZGUgYmFzZSBpcy4gSSBhbSBub3Qg
c28gcG9zaXRpdmUgdGhhdCBtYW55IGRldmVsb3BlcnMgd291bGQgZW5hYmxlIHRoaXMgZGVidWcg
ZmVhdHVyZSBhbmQgdXNlIGl0IG9uIGEgcmVndWxhciBiYXNpcyBmcm9tIHRoZSBpbmZvcm1hdGlv
biB5b3UgZ2F2ZSBzbyBmYXIuCj4gCj4gT24gdGhlIG90aGVyIGhhbmQsIGl0IG1pZ2h0IGp1c3Qg
YmUgZ29vZCBhdCBtYWludGFpbmluZyB0aGlzIHRoaW5nIG91dCBvZiB0cmVlIGJ5IHlvdXJzZWxm
IGFueXdheSwgYmVjYXVzZSBpZiB0aGVyZSBpc27igJl0IGdvaW5nIHRvIGJlIHVzZWQgYnkgbWFu
eSBkZXZlbG9wZXJzLCBmZXcgcGVvcGxlIGlzIGdvaW5nIHRvIGNvbnRyaWJ1dGUgdG8gdGhpcyBh
bmQgZXZlbiBub3RpY2VkIHdoZW4gaXQgaXMgYnJva2VuLiBXaGF04oCZcyB0aGUgcG9pbnQgb2Yg
Z2V0dGluZyB0aGlzIG1lcmdlZCBhcGFydCBmcm9tIGJlaW5nIGdldHRpbmcgc29tZSBtZWFuaW5n
bGVzcyBjcmVkaXRzPwo+IAoKSXQgaXMgJ2RlZmF1bHQgeScgc28gdGhlcmUgaXMgbm8gbXVjaCBy
aXNrIHRoYXQgaXQgaXMgZm9yZ290dGVuLCBhdCAKbGVhc3QgYWxsIHRlc3Qgc3VpdGVzIHJ1biB3
aXRoICdhbGx5ZXNfZGVmY29uZmlnJyB3aWxsIHRyaWdnZXIgdGhlIHRlc3QsIApzbyBJIHRoaW5r
IGl0IGlzIHJlYWxseSBhIGdvb2QgZmVhdHVyZS4KCkNocmlzdG9waGUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
