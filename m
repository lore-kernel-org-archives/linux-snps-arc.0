Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0087C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 08:04:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBA4B2065F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 08:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FnPa+swM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBA4B2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XbOtJLf7XvTpek8xhEGWz3E+cc7jBX3Lhk3D3/QrCJg=; b=FnPa+swMNzaDnCbIrMegpc4QH
	U+15bRovhAH6DzIdcJ3pUeF16K3k+Ao32RqHtugDv1SqdW+sP/k+JBFWbyK9f39RX0w3dFBxz6rw3
	UUX73nUrXRfZvNdP0qI1CL9pxaWweaVMV/4UhjSf4kaqAPug+Xxk6gvpfhbf2Ae2I0IRfK33n/I2C
	A6ycMwLetHKKsQXR/bZGIbTv5ZucXn4xvQvPEOQjc3v6iQPZPx2dO53fszCLBRnWfBgyn/nyOPP//
	cvovQujMvVgxdZMiYmshHPv+hvjYm9EzFPt7N0RoHIVCB5OGkg6RL/uXfQTgBDisiRy897ES5IRi+
	ypd8TrVWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD1Gr-0002qb-0j; Tue, 01 Sep 2020 08:04:01 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD1Gl-0002nh-Lx; Tue, 01 Sep 2020 08:03:56 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bgfj35351z9v0Hp;
 Tue,  1 Sep 2020 10:03:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id o-eFXfCEiBu6; Tue,  1 Sep 2020 10:03:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bgfj348tSz9v0Hm;
 Tue,  1 Sep 2020 10:03:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7698C8B774;
 Tue,  1 Sep 2020 10:03:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UvDPBkwWDzC9; Tue,  1 Sep 2020 10:03:52 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 838268B75E;
 Tue,  1 Sep 2020 10:03:51 +0200 (CEST)
Subject: Re: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <52e9743e-fa2f-3fd2-f50e-2c6c38464b96@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c0de2c68-826b-bf0f-dc2c-a501fa7bef38@csgroup.eu>
Date: Tue, 1 Sep 2020 10:03:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <52e9743e-fa2f-3fd2-f50e-2c6c38464b96@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_040355_821715_71FAE999 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, mpe@ellerman.id.au,
 "x86@kernel.org" <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Qian Cai <cai@lca.pw>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAyMS8wOC8yMDIwIMOgIDEwOjUxLCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IAo+IE9uIDA4LzE5LzIwMjAgMDY6MzAgUE0sIEFuZWVzaCBLdW1hciBLLlYgd3JvdGU6Cj4+IFRo
aXMgcGF0Y2ggc2VyaWVzIGluY2x1ZGVzIGZpeGVzIGZvciBkZWJ1Z192bV9wZ3RhYmxlIHRlc3Qg
Y29kZSBzbyB0aGF0Cj4+IHRoZXkgZm9sbG93IHBhZ2UgdGFibGUgdXBkYXRlcyBydWxlcyBjb3Jy
ZWN0bHkuIFRoZSBmaXJzdCB0d28gcGF0Y2hlcyBpbnRyb2R1Y2UKPj4gY2hhbmdlcyB3LnIudCBw
cGM2NC4gVGhlIHBhdGNoZXMgYXJlIGluY2x1ZGVkIGluIHRoaXMgc2VyaWVzIGZvciBjb21wbGV0
ZW5lc3MuIFdlIGNhbgo+PiBtZXJnZSB0aGVtIHZpYSBwcGM2NCB0cmVlIGlmIHJlcXVpcmVkLgo+
Pgo+PiBIdWdldGxiIHRlc3QgaXMgZGlzYWJsZWQgb24gcHBjNjQgYmVjYXVzZSB0aGF0IG5lZWRz
IGxhcmdlciBjaGFuZ2UgdG8gc2F0aXNmeQo+PiBwYWdlIHRhYmxlIHVwZGF0ZSBydWxlcy4KPj4K
Cj4gCj4gQ2hhbmdlcyBwcm9wb3NlZCBoZXJlIHdpbGwgaW1wYWN0IG90aGVyIGVuYWJsZWQgcGxh
dGZvcm1zIGFzIHdlbGwuCj4gQWRkaW5nIHRoZSBmb2xsb3dpbmcgZm9sa3MgYW5kIG1haWxpbmcg
bGlzdHMsIGFuZCBob3BpbmcgdG8gZ2V0IGEKPiBicm9hZGVyIHJldmlldyBhbmQgdGVzdCBjb3Zl
cmFnZS4gUGxlYXNlIGRvIGluY2x1ZGUgdGhlbSBpbiB0aGUKPiBuZXh0IGl0ZXJhdGlvbiBhcyB3
ZWxsLgo+IAo+ICsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gKyBsaW51
eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+ICsgbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ICsgeDg2QGtlcm5lbC5vcmcKPiArIGxpbnV4LWFyY2hAdmdlci5rZXJuZWwub3JnCj4g
Cj4gKyBHZXJhbGQgU2NoYWVmZXIgPGdlcmFsZC5zY2hhZWZlckBkZS5pYm0uY29tPgo+ICsgQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+CgpQbGVhc2UgZG9uJ3QgdXNl
IGFueW1vcmUgdGhlIGFib3ZlIGFkZHJlc3MuIE9ubHkgdXNlIHRoZSBvbmUgYmVsb3cuCgo+ICsg
Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+ICsgVmluZWV0
IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPgo+ICsgTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51
eC5pYm0uY29tPgo+ICsgUWlhbiBDYWkgPGNhaUBsY2EucHc+Cj4gCgpUaGFua3MKQ2hyaXN0b3Bo
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
