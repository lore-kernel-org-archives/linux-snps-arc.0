Return-Path: <SRS0=YOVA=CL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC64C433E6
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 03:46:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 784B1206EB
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 03:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OHB41+Id"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 784B1206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w/SwDIBJ7BxQpOJT83VnzEKCivVUA7GPUWE9S1bM3JI=; b=OHB41+IdNeHptySBCvtjN7AlK
	7bWKj2t5w6lPb2JW3HCkyvcDS1mLbVBUrF+0xOPGaYvhOSlStxt4MdmtFscO1V+JyderKegpvMiRF
	8GeEuo7zWbP1NUDTuaWbipPM15gTLWUEtRWGlEy2sC/vsdvEy8Y8dwVY4eGHAwono1+wCvAeWkBpH
	7ysGKI7MZMLb0PU9BFNBXqYc4HjjHwdttvE+TO2F6E1NlOTyqOM3QezHnYBeJC/1LryR7ZcldnIiN
	Mj/gEsCUFFU8KBSAsxO2V0OiDQeb2TNoFbEgzHl/NSdZuaq2D03/pvVhkW3DN+U5w7ZJkDPOLkTsx
	GpbPtwG4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDJjV-0008Rc-NN; Wed, 02 Sep 2020 03:46:49 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDJjR-0008QF-DO; Wed, 02 Sep 2020 03:46:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71E69D6E;
 Tue,  1 Sep 2020 20:46:42 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E0F23F66F;
 Tue,  1 Sep 2020 20:46:38 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 08/13] mm/debug_vm_pgtable/thp: Use page table
 depost/withdraw with THP
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-9-aneesh.kumar@linux.ibm.com>
 <e7877a8d-b433-0cb4-50a7-631de0022c24@arm.com>
 <9beaaf93-b2dd-6d56-7737-9f022760f246@linux.ibm.com>
 <d80a91c3-0edf-7e2f-8101-2d37a371f4bd@csgroup.eu>
 <2fb4ac88-d417-2bdd-3c56-a816c356636a@linux.ibm.com>
 <5d25b02a-887a-432e-7ecd-cc5cbcea9b02@csgroup.eu>
Message-ID: <ffdc1dfb-4ed3-f1d6-5d90-9e2ed7637a97@arm.com>
Date: Wed, 2 Sep 2020 09:15:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5d25b02a-887a-432e-7ecd-cc5cbcea9b02@csgroup.eu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_234645_529100_DC490E51 
X-CRM114-Status: GOOD (  16.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAwOS8wMS8yMDIwIDAxOjIxIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+
IExlIDAxLzA5LzIwMjAgw6AgMDk6NDAsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoKPj4g
T24gOS8xLzIwIDEyOjIwIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4KPj4+Cj4+PiBM
ZSAwMS8wOS8yMDIwIMOgIDA4OjI1LCBBbmVlc2ggS3VtYXIgSy5WIGEgw6ljcml0wqA6Cj4+Pj4g
T24gOS8xLzIwIDg6NTIgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+Pj4+Pgo+Pj4+Pgo+
Pj4+Pgo+Pj4+PiBUaGVyZSBpcyBhIGNoZWNrcGF0Y2gucGwgd2FybmluZyBoZXJlLgo+Pj4+Pgo+
Pj4+PiBXQVJOSU5HOiBQb3NzaWJsZSB1bndyYXBwZWQgY29tbWl0IGRlc2NyaXB0aW9uIChwcmVm
ZXIgYSBtYXhpbXVtIDc1IGNoYXJzIHBlciBsaW5lKQo+Pj4+PiAjNzoKPj4+Pj4gQXJjaGl0ZWN0
dXJlcyBsaWtlIHBwYzY0IHVzZSBkZXBvc2l0ZWQgcGFnZSB0YWJsZSB3aGlsZSB1cGRhdGluZyB0
aGUgaHVnZSBwdGUKPj4+Pj4KPj4+Pj4gdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCA0MCBs
aW5lcyBjaGVja2VkCj4+Pj4+Cj4+Pj4KPj4+PiBJIHdpbGwgaWdub3JlIGFsbCB0aGVzZSwgYmVj
YXVzZSB0aGV5IGFyZSBub3QgcmVhbGx5IGltcG9ydGFudCBJTUhPLgo+Pj4+Cj4+Pgo+Pj4gV2hl
biBkb2luZyBhIGdpdCBsb2cgaW4gYSA4MCBjaGFycyB0ZXJtaW5hbCB3aW5kb3csIGhhdmluZyB3
cmFwcGluZyBsaW5lcyBpcyBub3QgcmVhbGx5IGNvbnZlbmllbnQuIEl0IHNob3VsZCBiZSBlYXN5
IHRvIGF2b2lkIGl0Lgo+Pj4KPj4KPj4gV2UgaGF2ZSBiZWVuIGlnbm9yaW5nIHRoYXQgZm9yIGEg
bG9uZyB0aW1lwqAgaXNuJ3QgaXQ/Cj4+Cj4+IEZvciBleGFtcGxlIHBwYzY0IGNoZWNrcGF0Y2gg
YWxyZWFkeSBoYWQKPj4gLS1tYXgtbGluZS1sZW5ndGg9OTAKPj4KPj4KPj4gVGhlcmUgd2FzIGFs
c28gcmVjZW50IGRpc2N1c3Npb24gd2hldGhlciA4MCBjaGFyYWN0ZXIgbGltaXQgaXMgdmFsaWQg
YW55IG1vcmUuIEJ1dCBJIGRvIGtlZXAgaXQgcmVzdHJpY3RlZCB0byA4MCBjaGFyYWN0ZXIgd2hl
cmUgZXZlciBpdCBpcyBlYXN5L21ha2Ugc2Vuc2UuCj4+Cj4gCj4gSGVyZSB3ZSBhcmUgbm90IHRh
bGtpbmcgYWJvdXQgdGhlIGNvZGUsIGJ1dCB0aGUgY29tbWl0IGxvZy4KPiAKPiBBcyBmYXIgYXMg
SSBrbm93LCB0aGUgZGlzY3Vzc2lvbnMgYWJvdXQgODAgY2hhcmFjdGVyIGxpbmVzLCA5MCBsaW5l
cyBpbiBwb3dlcnBjIGV0YyAuLi4gaXMgZm9yIHRoZSBjb2RlLgo+IAo+IFdlIHN0aWxsIGFpbSBh
dCBrZWVwaW5nIGxpbmVzIG5vdCBsb25nZXIgdGhhbiA3NSBjaGFycyBpbiB0aGUgY29tbWl0IGxv
Zy4KCkFncmVlZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
