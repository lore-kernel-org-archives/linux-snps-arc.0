Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAD7C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 09:22:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4140206A5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 09:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dn+D+S4h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4140206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kxTIWs5GHMB4ogbI7QBz+pEXEgro+vsxEcTnxkFZ0hE=; b=dn+D+S4h19aXR5tFlWzbkAx/V
	R7oJQyl9qiNX9weW9s1evHGeUZyzgSezdyTYabmj3aKHniNjkmrarNDOwGM177LO+4QZusmbaXk9o
	UY7nH/nhvsHAzp2daDSgcMRoi+JlzjYrJKDN6xdnySo4TdPDSOpX/JI5PHxD4xVCX7tAatt4r4W/Q
	zh6tVnvrzmeCCDFvkURGhNQX+BV7i5usS9SEBDkYRB+qf7DoPsqjMdHj2Ffvg5605zCGgv6XKVtcj
	VHr06fOzC3wynRT8nQwDZ4cQzqmCWuJLr8QMoEGc0tYJJy3DCfG9/jK049foC558V1DQgjwrjNqyp
	FwGrfOy2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD2Ud-00022R-Jy; Tue, 01 Sep 2020 09:22:19 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD2LB-0004Nu-Td; Tue, 01 Sep 2020 09:12:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D4D330E;
 Tue,  1 Sep 2020 02:12:33 -0700 (PDT)
Received: from [10.163.69.134] (unknown [10.163.69.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13CEF3F71F;
 Tue,  1 Sep 2020 02:12:27 -0700 (PDT)
Subject: Re: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <52e9743e-fa2f-3fd2-f50e-2c6c38464b96@arm.com>
 <c0de2c68-826b-bf0f-dc2c-a501fa7bef38@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <74db4583-36a3-629b-9423-4e4961a91ea6@arm.com>
Date: Tue, 1 Sep 2020 14:41:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c0de2c68-826b-bf0f-dc2c-a501fa7bef38@csgroup.eu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_051234_087829_1147813E 
X-CRM114-Status: GOOD (  17.26  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAwOS8wMS8yMDIwIDAxOjMzIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+
IExlIDIxLzA4LzIwMjAgw6AgMTA6NTEsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+
Cj4+IE9uIDA4LzE5LzIwMjAgMDY6MzAgUE0sIEFuZWVzaCBLdW1hciBLLlYgd3JvdGU6Cj4+PiBU
aGlzIHBhdGNoIHNlcmllcyBpbmNsdWRlcyBmaXhlcyBmb3IgZGVidWdfdm1fcGd0YWJsZSB0ZXN0
IGNvZGUgc28gdGhhdAo+Pj4gdGhleSBmb2xsb3cgcGFnZSB0YWJsZSB1cGRhdGVzIHJ1bGVzIGNv
cnJlY3RseS4gVGhlIGZpcnN0IHR3byBwYXRjaGVzIGludHJvZHVjZQo+Pj4gY2hhbmdlcyB3LnIu
dCBwcGM2NC4gVGhlIHBhdGNoZXMgYXJlIGluY2x1ZGVkIGluIHRoaXMgc2VyaWVzIGZvciBjb21w
bGV0ZW5lc3MuIFdlIGNhbgo+Pj4gbWVyZ2UgdGhlbSB2aWEgcHBjNjQgdHJlZSBpZiByZXF1aXJl
ZC4KPj4+Cj4+PiBIdWdldGxiIHRlc3QgaXMgZGlzYWJsZWQgb24gcHBjNjQgYmVjYXVzZSB0aGF0
IG5lZWRzIGxhcmdlciBjaGFuZ2UgdG8gc2F0aXNmeQo+Pj4gcGFnZSB0YWJsZSB1cGRhdGUgcnVs
ZXMuCj4+Pgo+IAo+Pgo+PiBDaGFuZ2VzIHByb3Bvc2VkIGhlcmUgd2lsbCBpbXBhY3Qgb3RoZXIg
ZW5hYmxlZCBwbGF0Zm9ybXMgYXMgd2VsbC4KPj4gQWRkaW5nIHRoZSBmb2xsb3dpbmcgZm9sa3Mg
YW5kIG1haWxpbmcgbGlzdHMsIGFuZCBob3BpbmcgdG8gZ2V0IGEKPj4gYnJvYWRlciByZXZpZXcg
YW5kIHRlc3QgY292ZXJhZ2UuIFBsZWFzZSBkbyBpbmNsdWRlIHRoZW0gaW4gdGhlCj4+IG5leHQg
aXRlcmF0aW9uIGFzIHdlbGwuCj4+Cj4+ICsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4+ICsgbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPj4gKyBsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+ICsgeDg2QGtlcm5lbC5vcmcKPj4gKyBsaW51eC1hcmNo
QHZnZXIua2VybmVsLm9yZwo+Pgo+PiArIEdlcmFsZCBTY2hhZWZlciA8Z2VyYWxkLnNjaGFlZmVy
QGRlLmlibS5jb20+Cj4+ICsgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMu
ZnI+Cj4gCj4gUGxlYXNlIGRvbid0IHVzZSBhbnltb3JlIHRoZSBhYm92ZSBhZGRyZXNzLiBPbmx5
IHVzZSB0aGUgb25lIGJlbG93Lgo+IAo+PiArIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4KClN1cmUsIG5vdGVkLgoKPj4gKyBWaW5lZXQgR3VwdGEgPHZndXB0
YUBzeW5vcHN5cy5jb20+Cj4+ICsgTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+
PiArIFFpYW4gQ2FpIDxjYWlAbGNhLnB3Pgo+Pgo+IAo+IFRoYW5rcwo+IENocmlzdG9waGUKPiAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
