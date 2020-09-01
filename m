Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E89C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 08:00:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B76A6208DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 08:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J6CMr2L2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B76A6208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JGje+G3sX5iBMOvYhPVbj81fMjf2u0XlHI+YNkrZRhw=; b=J6CMr2L2hhS4b7vmTW6WAfUGT
	MzcXyX87qPcNiCWDeifh/7L4ZZ/3dd6rGQeYDovdbd4fPuCdSSpL3/a9EZZvCLdYNa4jmSNzoghVb
	XggsnwN8HzUBHSh82XfPcvPwW5b3QaELO6tAfgdPruAHrD5VwOCv6aQZin31/jcCIaQUtkaKoC1/+
	hLr5L3ik5mQrbnlaUOGEbmMerrbW2MRLXWgerKnmaNhoCwtVeVT10eVTtjXiNFhDh+a0bCg/k4LME
	5fNHxqtwywh7EVUfoJw/9OAykdTUDQ0afUAmASQaj51fRtCW7g075/VR0R7xu9TMVR6ALRKL8NNGg
	WD87LTAqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD1DF-0001QZ-2s; Tue, 01 Sep 2020 08:00:17 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD1D1-0001Iz-Kn; Tue, 01 Sep 2020 08:00:08 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BgfcZ4pZKz9v4j6;
 Tue,  1 Sep 2020 09:59:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jFpzCAZ8F1-s; Tue,  1 Sep 2020 09:59:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BgfcZ3qkxz9v4j8;
 Tue,  1 Sep 2020 09:59:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B3A98B774;
 Tue,  1 Sep 2020 09:59:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sXuYaJ7qSsE1; Tue,  1 Sep 2020 09:59:59 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A8AAA8B75E;
 Tue,  1 Sep 2020 09:59:58 +0200 (CEST)
Subject: Re: [PATCH v3 12/13] mm/debug_vm_pgtable/hugetlb: Disable hugetlb
 test on ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-13-aneesh.kumar@linux.ibm.com>
 <6191e77f-c3b7-21ea-6dbd-eecc09735923@arm.com>
 <68f90b44-b830-58be-3c21-424fee05da37@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2ca78670-eb76-0192-7a83-1c1fa4a0fff5@csgroup.eu>
Date: Tue, 1 Sep 2020 09:59:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <68f90b44-b830-58be-3c21-424fee05da37@linux.ibm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_040003_837997_80305F33 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, "Erhard F." <erhard_f@mailbox.org>,
 Qian Cai <cai@lca.pw>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAwMS8wOS8yMDIwIMOgIDA4OjMwLCBBbmVlc2ggS3VtYXIgSy5WIGEgw6ljcml0wqA6Cj4+
Cj4gCj4gSSBhY3R1YWxseSB3YW50ZWQgdG8gYWRkICNpZmRlZiBCUk9LRU4uIFRoYXQgdGVzdCBp
cyBjb21wbGV0ZWx5IGJyb2tlbi4gCj4gSW5mYWN0IEkgd291bGQgc3VnZ2VzdCB0byByZW1vdmUg
dGhhdCB0ZXN0IGNvbXBsZXRlbHkuCj4gCj4gCj4gCj4+ICNpZmRlZiB3aWxsIG5vdCBiZSByZXF1
aXJlZCBoZXJlIGFzIHRoZXJlIHdvdWxkIGJlIGEgc3R1YiBkZWZpbml0aW9uCj4+IGZvciBodWdl
dGxiX2FkdmFuY2VkX3Rlc3RzKCkgd2hlbiBDT05GSUdfUFBDX0JPT0szU182NCBpcyBlbmFibGVk
Lgo+Pgo+Pj4gwqDCoMKgwqDCoCBzcGluX2xvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+Pj4g
wqDCoMKgwqDCoCBwNGRfY2xlYXJfdGVzdHMobW0sIHA0ZHApOwo+Pj4KPj4KPj4gQnV0IGFnYWlu
LCB3ZSBzaG91bGQgcmVhbGx5IHRyeSBhbmQgYXZvaWQgdGFraW5nIHRoaXMgcGF0aC4KPj4KPiAK
PiBUbyBiZSBmcmFuayBpIGFtIGtpbmQgb2YgZnJ1c3RyYXRlZCB3aXRoIGhvdyB0aGlzIHBhdGNo
IHNlcmllcyBpcyBiZWluZyAKPiBsb29rZWQgYXQuIFdlIHB1c2hlZCBhIGNvbXBsZXRlbHkgYnJv
a2VuIHRlc3QgdG8gdXBzdHJlYW0gYW5kIHJpZ2h0IG5vdyAKPiB3ZSBoYXZlIGEgY29kZSBpbiB1
cHN0cmVhbSB0aGF0IGNyYXNoIHdoZW4gYm9vdGVkIG9uIHBwYzY0LiBNeSBhdHRlbXB0IAo+IGhh
cyBiZWVuIHRvIG1ha2UgcHJvZ3Jlc3MgaGVyZSBhbmQgeW91IGRlZmluaXRlbHkgc2VlbXMgdG8g
YmUgbm90IGluIAo+IGFncmVlbWVudCB0byB0aGF0Lgo+IAo+IEF0IHRoaXMgcG9pbnQgSSBhbSB0
ZW1wdGVkIHRvIHN1Z2dlc3Qgd2UgcmVtb3ZlIHRoZSBERUJVR19WTV9QR1RBQkxFIAo+IHN1cHBv
cnQgb24gcHBjNjQgYmVjYXVzZSBBRkFJVSBpdCBkb2Vzbid0IGFkZCBhbnkgdmFsdWUuCj4gCgpO
b3RlIHRoYXQgYSBidWcgaGFzIGJlZW4gZmlsZWQgYXQgCmh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA5MDI5CgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
