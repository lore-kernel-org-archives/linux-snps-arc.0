Return-Path: <SRS0=fm4X=4V=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A053EC3F2CD
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2020 06:49:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765222146E
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2020 06:49:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DDvhG0kC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="TjnV6xMQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765222146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ynKzLseo9mzac+q+OLXUMbYXMHeU5/5bC8QyajynEM=; b=DDvhG0kCQPnn4PVxHnnNmc3ou
	keBdMMPgOvotjFP9bwMdWXUhmia4RAniCCFZtTnaZcmMQcmU1GJR7SxDB8wmykEdK/5xfx3emxxhm
	rmDH+CS3/xu1ZBQUvaQWFn+gvAeoe5dftzLJ4BsNNEsAeg4nRX0Z2qVyMtGw6xU78DdIDxk+77Gff
	9l3FU+3GMhsrjmeRqrAITs2mt4sNmqbMSnWtDPHWe9v6wI3LW2B+v0IMeGz622dT6KLv30t8okn0W
	+FxOyZBMzKxbFLVQJgWwxtE9g40ZdliKD3kM3Y8iqJm/Pn/fkgvKKT5b7QOJlezx4Rt+eTlNrUYjl
	iTDoi6C1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9NqL-0008UR-Cr; Wed, 04 Mar 2020 06:49:21 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9Nq7-0008GN-Md; Wed, 04 Mar 2020 06:49:09 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48XPcF5vVkz9v0st;
 Wed,  4 Mar 2020 07:49:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TjnV6xMQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dW39OVxTZgd8; Wed,  4 Mar 2020 07:49:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48XPcF4ZcKz9v0ss;
 Wed,  4 Mar 2020 07:49:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583304541; bh=wrQNL9rvesEDlWoNS4tGcfPvGhYnLZNAbgZHq9fGbnE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TjnV6xMQKz2IO1bGDE4HAZJMFDjYTtnjTtNNjZEsh1GJH/DNUiegOPbfzQzRdUJdq
 mfbcsqR6vxFcKaMgtar20QBjEJl5cDZGZqEWM5VabMwt/qfmG0b/5ARzKJJU0pQlpP
 HX98Thi1AQonukArlC4ShOrxhDCLgoABIqbXgKFo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 784788B826;
 Wed,  4 Mar 2020 07:49:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oPUcSMTN_Vcy; Wed,  4 Mar 2020 07:49:02 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A1098B820;
 Wed,  4 Mar 2020 07:49:02 +0100 (CET)
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>, Anshuman Khandual <anshuman.khandual@arm.com>
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
 <1582726182.7365.123.camel@lca.pw>
 <7c707b7f-ce3d-993b-8042-44fdc1ed28bf@c-s.fr>
 <1582732318.7365.129.camel@lca.pw> <1583178042.7365.146.camel@lca.pw>
 <e8516497-f1b9-b222-e219-73b68880ac75@arm.com>
 <12260F9A-695D-40F8-932F-61D86D77D441@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c022e863-0807-fab1-cd41-3c320381f448@c-s.fr>
Date: Wed, 4 Mar 2020 07:48:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <12260F9A-695D-40F8-932F-61D86D77D441@lca.pw>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_224908_201407_50865962 
X-CRM114-Status: GOOD (  11.45  )
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

CgpMZSAwNC8wMy8yMDIwIMOgIDAyOjM5LCBRaWFuIENhaSBhIMOpY3JpdMKgOgo+IAo+PiBCZWxv
dyBpcyBzbGlnaHRseSBtb2RpZmllZCB2ZXJzaW9uIG9mIHlvdXIgY2hhbmdlIGFib3ZlIGFuZCBz
aG91bGQgc3RpbGwKPj4gcHJldmVudCB0aGUgYnVnIG9uIHBvd2VycGMuIFdpbGwgaXQgYmUgcG9z
c2libGUgZm9yIHlvdSB0byByZS10ZXN0IHRoaXMKPj4gPyBPbmNlIGNvbmZpcm1lZCwgd2lsbCBz
ZW5kIGEgcGF0Y2ggZW5hYmxpbmcgdGhpcyB0ZXN0IG9uIHBvd2VycGM2NAo+PiBrZWVwaW5nIHlv
dXIgYXV0aG9yc2hpcC4gVGhhbmsgeW91Lgo+IAo+IFRoaXMgd29ya3MgZmluZSBvbiByYWRpeCBN
TVUgYnV0IEkgZGVjaWRlZCB0byBnbyBhIGJpdCBmdXR1cmUgdG8gdGVzdCBoYXNoCj4gTU1VLiBU
aGUga2VybmVsIHdpbGwgc3R1Y2sgaGVyZSBiZWxvdy4gSSBkaWQgY29uZmlybSB0aGF0IHB0ZV9h
bGxvY19tYXBfbG9jaygpCj4gd2FzIHN1Y2Nlc3NmdWwsIHNvIEkgZG9u4oCZdCB1bmRlcnN0YW5k
IGhhc2ggTU1VIHdlbGwgZW5vdWdoIHRvIHRlbGwgd2h5Cj4gaXQgY291bGQgc3RpbGwgdGFrZSBh
biBpbnRlcnJ1cHQgYXQgcHRlX2NsZWFyX3Rlc3RzKCkgZXZlbiBiZWZvcmUgd2UgY2FsbHMKPiBw
dGVfdW5tYXBfdW5sb2NrKCk/CgpBRkFJVSwgeW91IGFyZSBub3QgdGFraW5nIGFuIGludGVycnVw
dCBoZXJlLiBZb3UgYXJlIHN0dWNrIGluIHRoZSAKcHRlX3VwZGF0ZSgpLCBtb3N0IGxpa2VseSBk
dWUgdG8gbmVzdGVkIGxvY2tzLiBUcnkgd2l0aCBMT0NLREVQID8KCkNocmlzdG9waGUKCj4gCj4g
WyAgIDMzLjg4MTUxNV1bICAgIFQxXSBvayA4IC0gcHJvcGVydHktZW50cnkKPiBbICAgMzMuODgz
NjUzXVsgICAgVDFdIGRlYnVnX3ZtX3BndGFibGU6IGRlYnVnX3ZtX3BndGFibGU6IFZhbGlkYXRp
bmcKPiBhcmNoaXRlY3R1cmUgcGFnZSB0YWJsZSBoZWxwZXJzCj4gWyAgIDYwLjQxODg4NV1bICAg
IEM4XSB3YXRjaGRvZzogQlVHOiBzb2Z0IGxvY2t1cCAtIENQVSM4IHN0dWNrIGZvciAyM3MhCj4g
W3N3YXBwZXIvMDoxXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
