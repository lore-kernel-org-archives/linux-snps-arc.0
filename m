Return-Path: <SRS0=oU4o=3X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0CCC3524F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Feb 2020 15:14:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4252B218AC
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Feb 2020 15:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KEOMb/uJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="OGtzFIa+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4252B218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Ts7z9yJc9TayHJyaDSDFhdIkUbpp/bdrYy96kXub4Q=; b=KEOMb/uJ2ejk98whDShgPSr+P
	moLK4U2ANtvGAOFDJxyXVvPcx5m/2v5VrDTTK9S7fu5xAzmJnye7KATxNieEQL0oLRqfftf+yB5ZN
	ZK0zKL+Yq4HsMFgqesOqNMZtExwECeip08xMYHAMlPLSQKoVHGhpuuvPz16h6ZXJrrevtk4eYThuy
	09wFFLNjHiRX48hh6HldPPqPcvZjzPQfJQY2h/nNEL/AFyqeKVif4wdi1IJcPaa4UeHGOsLSW/HVZ
	pyZl99GLKVuSgVEYApLi5LaxZeST0Av5ZfXZnQnrQSZfnjcFRvxobbfhHuHYOv2EU5s0nGhe/depY
	DJuIbd+QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iydR0-0003lL-0J; Mon, 03 Feb 2020 15:14:46 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iydQr-0003bl-Pu; Mon, 03 Feb 2020 15:14:39 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48BBF846fMz9v3ls;
 Mon,  3 Feb 2020 16:14:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OGtzFIa+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5VszB6UW2Yif; Mon,  3 Feb 2020 16:14:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48BBF82h8pz9v3lm;
 Mon,  3 Feb 2020 16:14:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580742860; bh=i4hAG7YwdO6LNDmYZ4wBEtikutj9N76WG5xl/PwnPrw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OGtzFIa+5ZhSxgd/BuHky5Jny2LDfnoF42zPtabwjmhorMsQSP8od+tqTvY9oMk3O
 ug6+KKaiRNlh/wtS69Y4UVsFdUJC1Vu36ZVhY++cHIlyr4PBVDhCfDbWqmvxtfLxhX
 pBTvZSaYZbiw2B0JwaU6kwU/pCLUp2ai2uhwAOdA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DE228B7B0;
 Mon,  3 Feb 2020 16:14:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id unrhNEULKrXy; Mon,  3 Feb 2020 16:14:25 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12E638B7AC;
 Mon,  3 Feb 2020 16:14:25 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>
References: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
 <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8e94a073-4045-89aa-6a3b-24847ad7c858@c-s.fr>
Date: Mon, 3 Feb 2020 16:14:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_071438_137882_C74D1901 
X-CRM114-Status: GOOD (  12.05  )
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
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 kasan-dev <kasan-dev@googlegroups.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
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

CgpMZSAwMi8wMi8yMDIwIMOgIDEyOjI2LCBRaWFuIENhaSBhIMOpY3JpdMKgOgo+IAo+IAo+PiBP
biBKYW4gMzAsIDIwMjAsIGF0IDk6MTMgQU0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAYy1zLmZyPiB3cm90ZToKPj4KPj4gY29uZmlnIERFQlVHX1ZNX1BHVEFCTEUKPj4gICAg
IGJvb2wgIkRlYnVnIGFyY2ggcGFnZSB0YWJsZSBmb3Igc2VtYW50aWNzIGNvbXBsaWFuY2UiIGlm
IEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUgfHwgRVhQRVJUCj4+ICAgICBkZXBlbmRzIG9uIE1N
VQo+PiAgICAgZGVmYXVsdCAnbicgaWYgIUFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUKPj4gICAg
IGRlZmF1bHQgJ3knIGlmIERFQlVHX1ZNCj4gCj4gRG9lcyBpdCByZWFsbHkgbmVjZXNzYXJ5IHRv
IHBvdGVudGlhbGx5IGZvcmNlIGFsbCBib3RzIHRvIHJ1biB0aGlzPyBTeXpib3QsIGtlcm5lbCB0
ZXN0IHJvYm90IGV0Yz8gRG9lcyBpdCBldmVyIHBheSBvZmYgZm9yIGFsbCB0aGVpciBtYWNoaW5l
IHRpbWVzIHRoZXJlPwo+IAoKTWFjaGluZSB0aW1lID8KCk9uIGEgMzIgYml0cyBwb3dlcnBjIHJ1
bm5pbmcgYXQgMTMyIE1IeiwgdGhlIHRlc3RzIHRha2VzIGxlc3MgdGhhbiAxMG1zLiAKSXMgaXQg
d29ydGggdGFraW5nIHRoZSByaXNrIG9mIG5vdCBkZXRlY3RpbmcgZmF1bHRzIGJ5IG5vdCBzZWxl
Y3RpbmcgaXQgCmJ5IGRlZmF1bHQgPwoKWyAgICA1LjY1NjkxNl0gZGVidWdfdm1fcGd0YWJsZTog
ZGVidWdfdm1fcGd0YWJsZTogVmFsaWRhdGluZyAKYXJjaGl0ZWN0dXJlIHBhZ2UgdGFibGUgaGVs
cGVycwpbICAgIDUuNjY1NjYxXSBkZWJ1Z192bV9wZ3RhYmxlOiBkZWJ1Z192bV9wZ3RhYmxlOiBW
YWxpZGF0ZWQgCmFyY2hpdGVjdHVyZSBwYWdlIHRhYmxlIGhlbHBlcnMKCkNocmlzdG9waGUKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMt
YXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
