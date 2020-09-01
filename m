Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAB9C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:51:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B5862071B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="axPJJTCJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B5862071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sMgFPJ2uKxi9TgyJPBYmlqRk2Tqgb88YdgpDAAbjxIg=; b=axPJJTCJRvhQW/0SA+qDecciG
	km5woSCxQNj4ylHTlzHqbme/nJUP2Ss4dVtlU1Yfatm30IowX2GANn5/eTze8BTsAcxPpuc/14DsR
	QzUJnnmy9gZNxoM6g95YsSju76K3mTfLm6tpLzFSEadywRz4L78gw1aRlK5I+7dxV7tcXiXmkTvDB
	PE5fsuvUZsmduoeFZstTy0V3NBFpcmBzJmELNqwL3omKC0+Pk5AsrGxHU70mfUm+22blqjO3EprG5
	P2idGx+sufgfd+UsMnaBgBVG4IM78/Hf2vZPO6AQaFA15MBKJDH4l1vJMPgoCy9lcayFN9Z413Krh
	S16H7fexA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD14n-0005yp-Ew; Tue, 01 Sep 2020 07:51:33 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD14i-0005wo-OA; Tue, 01 Sep 2020 07:51:30 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BgfQj5ZqZz9v4j1;
 Tue,  1 Sep 2020 09:51:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id otG6xobMGX17; Tue,  1 Sep 2020 09:51:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BgfQj4hHYz9v1SD;
 Tue,  1 Sep 2020 09:51:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A99F68B774;
 Tue,  1 Sep 2020 09:51:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0bfitLpUFTsu; Tue,  1 Sep 2020 09:51:26 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8C8D8B75E;
 Tue,  1 Sep 2020 09:51:25 +0200 (CEST)
Subject: Re: [PATCH v3 08/13] mm/debug_vm_pgtable/thp: Use page table
 depost/withdraw with THP
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-9-aneesh.kumar@linux.ibm.com>
 <e7877a8d-b433-0cb4-50a7-631de0022c24@arm.com>
 <9beaaf93-b2dd-6d56-7737-9f022760f246@linux.ibm.com>
 <d80a91c3-0edf-7e2f-8101-2d37a371f4bd@csgroup.eu>
 <2fb4ac88-d417-2bdd-3c56-a816c356636a@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5d25b02a-887a-432e-7ecd-cc5cbcea9b02@csgroup.eu>
Date: Tue, 1 Sep 2020 09:51:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2fb4ac88-d417-2bdd-3c56-a816c356636a@linux.ibm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_035128_893838_2342164E 
X-CRM114-Status: GOOD (  13.83  )
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, mpe@ellerman.id.au,
 x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAwMS8wOS8yMDIwIMOgIDA5OjQwLCBBbmVlc2ggS3VtYXIgSy5WIGEgw6ljcml0wqA6Cj4g
T24gOS8xLzIwIDEyOjIwIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAw
MS8wOS8yMDIwIMOgIDA4OjI1LCBBbmVlc2ggS3VtYXIgSy5WIGEgw6ljcml0wqA6Cj4+PiBPbiA5
LzEvMjAgODo1MiBBTSwgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+Cj4+
Pj4gVGhlcmUgaXMgYSBjaGVja3BhdGNoLnBsIHdhcm5pbmcgaGVyZS4KPj4+Pgo+Pj4+IFdBUk5J
Tkc6IFBvc3NpYmxlIHVud3JhcHBlZCBjb21taXQgZGVzY3JpcHRpb24gKHByZWZlciBhIG1heGlt
dW0gNzUgCj4+Pj4gY2hhcnMgcGVyIGxpbmUpCj4+Pj4gIzc6Cj4+Pj4gQXJjaGl0ZWN0dXJlcyBs
aWtlIHBwYzY0IHVzZSBkZXBvc2l0ZWQgcGFnZSB0YWJsZSB3aGlsZSB1cGRhdGluZyB0aGUgCj4+
Pj4gaHVnZSBwdGUKPj4+Pgo+Pj4+IHRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgNDAgbGlu
ZXMgY2hlY2tlZAo+Pj4+Cj4+Pgo+Pj4gSSB3aWxsIGlnbm9yZSBhbGwgdGhlc2UsIGJlY2F1c2Ug
dGhleSBhcmUgbm90IHJlYWxseSBpbXBvcnRhbnQgSU1ITy4KPj4+Cj4+Cj4+IFdoZW4gZG9pbmcg
YSBnaXQgbG9nIGluIGEgODAgY2hhcnMgdGVybWluYWwgd2luZG93LCBoYXZpbmcgd3JhcHBpbmcg
Cj4+IGxpbmVzIGlzIG5vdCByZWFsbHkgY29udmVuaWVudC4gSXQgc2hvdWxkIGJlIGVhc3kgdG8g
YXZvaWQgaXQuCj4+Cj4gCj4gV2UgaGF2ZSBiZWVuIGlnbm9yaW5nIHRoYXQgZm9yIGEgbG9uZyB0
aW1lwqAgaXNuJ3QgaXQ/Cj4gCj4gRm9yIGV4YW1wbGUgcHBjNjQgY2hlY2twYXRjaCBhbHJlYWR5
IGhhZAo+IC0tbWF4LWxpbmUtbGVuZ3RoPTkwCj4gCj4gCj4gVGhlcmUgd2FzIGFsc28gcmVjZW50
IGRpc2N1c3Npb24gd2hldGhlciA4MCBjaGFyYWN0ZXIgbGltaXQgaXMgdmFsaWQgYW55IAo+IG1v
cmUuIEJ1dCBJIGRvIGtlZXAgaXQgcmVzdHJpY3RlZCB0byA4MCBjaGFyYWN0ZXIgd2hlcmUgZXZl
ciBpdCBpcyAKPiBlYXN5L21ha2Ugc2Vuc2UuCj4gCgpIZXJlIHdlIGFyZSBub3QgdGFsa2luZyBh
Ym91dCB0aGUgY29kZSwgYnV0IHRoZSBjb21taXQgbG9nLgoKQXMgZmFyIGFzIEkga25vdywgdGhl
IGRpc2N1c3Npb25zIGFib3V0IDgwIGNoYXJhY3RlciBsaW5lcywgOTAgbGluZXMgaW4gCnBvd2Vy
cGMgZXRjIC4uLiBpcyBmb3IgdGhlIGNvZGUuCgpXZSBzdGlsbCBhaW0gYXQga2VlcGluZyBsaW5l
cyBub3QgbG9uZ2VyIHRoYW4gNzUgY2hhcnMgaW4gdGhlIGNvbW1pdCBsb2cuCgpDaHJpc3RvcGhl
CgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
