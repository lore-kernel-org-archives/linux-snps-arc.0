Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B8AC433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:51:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F4F208DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 06:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t6su1kgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79F4F208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0SseEr2YEoL8/zjG9MPDiYvTTVuqvh2Gc793jCzHok0=; b=t6su1kgmm/3BZYTrffNEDmons
	TQQ+atsHv7Nrxq6Lv+dELAAtpm4f3lJwWSZPqAtoWi/uL2ptRYfxgRAeIlFtxQbCqkvxieldxU5IC
	PSOegvkiozk1QpxVhx8VEyY0a9SHul0aYklopLkfcpLI2MXi713cuVuwAkDh67iiezJL/UycV2ACL
	+mXtv8dhmm3tzKw0sMWPU0CbmHqSq/Ml8T2/F7yXOV9GydG1XGVNsUeYqfN1RDTbp8cwEgYBjrUmg
	hrJCMtvt15nThQmEEA95kO6PKqiGxFZUwpi3hfDgV/VCbSKLPaeKlfZ/9YYZ7XHMcNjxZAQsamEU9
	6+dfZxgjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD08U-00071y-US; Tue, 01 Sep 2020 06:51:18 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD08R-00070Q-5e; Tue, 01 Sep 2020 06:51:16 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bgd553xHtz9txw9;
 Tue,  1 Sep 2020 08:51:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Rn8oc928E3D7; Tue,  1 Sep 2020 08:51:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bgd552r2nz9txww;
 Tue,  1 Sep 2020 08:51:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 514358B774;
 Tue,  1 Sep 2020 08:51:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Pc-EGvx7jn7B; Tue,  1 Sep 2020 08:51:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B8028B75E;
 Tue,  1 Sep 2020 08:51:05 +0200 (CEST)
Subject: Re: [PATCH v3 08/13] mm/debug_vm_pgtable/thp: Use page table
 depost/withdraw with THP
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-9-aneesh.kumar@linux.ibm.com>
 <e7877a8d-b433-0cb4-50a7-631de0022c24@arm.com>
 <9beaaf93-b2dd-6d56-7737-9f022760f246@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d80a91c3-0edf-7e2f-8101-2d37a371f4bd@csgroup.eu>
Date: Tue, 1 Sep 2020 08:50:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9beaaf93-b2dd-6d56-7737-9f022760f246@linux.ibm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_025115_323025_183425B4 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAwMS8wOS8yMDIwIMOgIDA4OjI1LCBBbmVlc2ggS3VtYXIgSy5WIGEgw6ljcml0wqA6Cj4g
T24gOS8xLzIwIDg6NTIgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+Pgo+Pgo+Pgo+PiBU
aGVyZSBpcyBhIGNoZWNrcGF0Y2gucGwgd2FybmluZyBoZXJlLgo+Pgo+PiBXQVJOSU5HOiBQb3Nz
aWJsZSB1bndyYXBwZWQgY29tbWl0IGRlc2NyaXB0aW9uIChwcmVmZXIgYSBtYXhpbXVtIDc1IAo+
PiBjaGFycyBwZXIgbGluZSkKPj4gIzc6Cj4+IEFyY2hpdGVjdHVyZXMgbGlrZSBwcGM2NCB1c2Ug
ZGVwb3NpdGVkIHBhZ2UgdGFibGUgd2hpbGUgdXBkYXRpbmcgdGhlIAo+PiBodWdlIHB0ZQo+Pgo+
PiB0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDQwIGxpbmVzIGNoZWNrZWQKPj4KPiAKPiBJ
IHdpbGwgaWdub3JlIGFsbCB0aGVzZSwgYmVjYXVzZSB0aGV5IGFyZSBub3QgcmVhbGx5IGltcG9y
dGFudCBJTUhPLgo+IAoKV2hlbiBkb2luZyBhIGdpdCBsb2cgaW4gYSA4MCBjaGFycyB0ZXJtaW5h
bCB3aW5kb3csIGhhdmluZyB3cmFwcGluZyAKbGluZXMgaXMgbm90IHJlYWxseSBjb252ZW5pZW50
LiBJdCBzaG91bGQgYmUgZWFzeSB0byBhdm9pZCBpdC4KCkNocmlzdG9waGUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxp
bmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
