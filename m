Return-Path: <SRS0=YOVA=CL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1F1C433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 03:58:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C3E206EB
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 03:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJHRefhu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Lez2m5b2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04C3E206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ng0lqRCym7jMpM8FWDBefzpNDun7+8Q8Cx+SoEqEYrI=; b=hJHRefhudeqD2TEmLrrr6UcQB
	f9A7wILa8Wy2tbtq+HrRUWMT9MmTiuvsnZ0JCzzVwdPkn3+BF0FM0mMUKcXRX7f9ybx2ucph4lHHi
	/gMmlEQEwyUvMJeFID0LpElGFNLpMuMAylXs/d+980u+KBtzTW7/JTZKh9NxWxqQgNbMJag8DCRoJ
	FCuhvNCDJY0wFH133yobSn3p2qwyfdVCsSTXCWUtTX5ZGsYkM0Bk8Wg2Bxw/tkXNZFg2blRKZuuCH
	4kxySXCYSVnUZa2ZNrMnuPn6tZnnl6AtmkVQMUDOdAzMZ9TYT6vjUPRh1K2Lm15yiGQ8hExxuNw78
	fb19GrG9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDJut-0001Nd-Bm; Wed, 02 Sep 2020 03:58:35 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDJur-0001Mo-4c; Wed, 02 Sep 2020 03:58:34 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0823WoJu151620; Tue, 1 Sep 2020 23:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NRMxz31et6UNTlJA7+QKz+EOKxjkgpK3zxuT1c6AiN4=;
 b=Lez2m5b261V98rccfFzz0hwukbPMRg+fN6kpKMbUHKhoQx6ijiHRiHmZ5z7/SjEtQYIa
 Lotrl01VlG6KIIbqDAQ7eQdCrJOOgn91SVwSSQlK5kFFNRjIMAZNWSM/vApHas8Z9ypp
 10pujNky2D9tyeDZU3GnQEWmrjm+UHgynRi/sxhWndiLR3n7XeJS2janOBgaT4V/Ej2/
 Pc0QBGcQ7iWfP2rkuvEOGs1JstKp4ovpzGwSsrXpvndrk6Mdj7sRawxwtUiUzmwi0EJJ
 GLPdrHJ8Icf+KFWxCy0l6WwIhLdzvgmQENJQJY5Fg7mQYua1prtkWi4IzFlATglVucEl Ng== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a3dern4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 23:58:17 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0823vMJ3016533;
 Wed, 2 Sep 2020 03:58:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 337e9h2k3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 03:58:14 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0823wCjS30998800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 03:58:12 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7544EA404D;
 Wed,  2 Sep 2020 03:58:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89808A4055;
 Wed,  2 Sep 2020 03:58:09 +0000 (GMT)
Received: from [9.199.61.124] (unknown [9.199.61.124])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 03:58:09 +0000 (GMT)
Subject: Re: [PATCH v3 13/13] mm/debug_vm_pgtable: populate a pte entry before
 fetching it
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-14-aneesh.kumar@linux.ibm.com>
 <edc68223-7f8a-13df-68eb-9682f585adb8@arm.com>
 <abef1791-8779-6b34-3178-3bf3ab36d42b@linux.ibm.com>
 <e3140b44-993e-aa4b-130d-ee2230eff2b5@arm.com>
 <7ef7c302-e7e6-570e-3100-5dd1bf9551be@linux.ibm.com>
 <4ba15b8f-ac90-17ec-9b95-0451e2a38e98@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <7de344c3-26ea-be34-4435-8842360ed565@linux.ibm.com>
Date: Wed, 2 Sep 2020 09:28:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <4ba15b8f-ac90-17ec-9b95-0451e2a38e98@arm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_02:2020-09-01,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009020028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_235833_298652_42A3D6AA 
X-CRM114-Status: GOOD (  28.81  )
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

T24gOS8yLzIwIDk6MTkgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+IAo+IAo+IE9uIDA5
LzAxLzIwMjAgMDM6MjggUE0sIEFuZWVzaCBLdW1hciBLLlYgd3JvdGU6Cj4+IE9uIDkvMS8yMCAx
OjA4IFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMDkvMDEvMjAy
MCAxMjowNyBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+PiBPbiA5LzEvMjAgODo1NSBB
TSwgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDA4LzI3LzIw
MjAgMDE6MzQgUE0sIEFuZWVzaCBLdW1hciBLLlYgd3JvdGU6Cj4+Pj4+PiBwdGVfY2xlYXJfdGVz
dHMgb3BlcmF0ZSBvbiBhbiBleGlzdGluZyBwdGUgZW50cnkuIE1ha2Ugc3VyZSB0aGF0IGlzIG5v
dCBhIG5vbmUKPj4+Pj4+IHB0ZSBlbnRyeS4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBB
bmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4KPj4+Pj4+IC0tLQo+
Pj4+Pj4gIMKgwqAgbW0vZGVidWdfdm1fcGd0YWJsZS5jIHwgNiArKysrLS0KPj4+Pj4+ICDCoMKg
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+
Pj4+Pj4gZGlmZiAtLWdpdCBhL21tL2RlYnVnX3ZtX3BndGFibGUuYyBiL21tL2RlYnVnX3ZtX3Bn
dGFibGUuYwo+Pj4+Pj4gaW5kZXggMjEzMjljN2Q2NzJmLi44NTI3ZWJiNzVmMmMgMTAwNjQ0Cj4+
Pj4+PiAtLS0gYS9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+Pj4+ICsrKyBiL21tL2RlYnVnX3Zt
X3BndGFibGUuYwo+Pj4+Pj4gQEAgLTU0Niw3ICs1NDYsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
cGdkX3BvcHVsYXRlX3Rlc3RzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwZ2RfdCAqcGdkcCwKPj4+
Pj4+ICDCoMKgIHN0YXRpYyB2b2lkIF9faW5pdCBwdGVfY2xlYXJfdGVzdHMoc3RydWN0IG1tX3N0
cnVjdCAqbW0sIHB0ZV90ICpwdGVwLAo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHZhZGRyKQo+Pj4+Pj4gIMKgwqAgewo+Pj4+
Pj4gLcKgwqDCoCBwdGVfdCBwdGUgPSBwdGVwX2dldChwdGVwKTsKPj4+Pj4+ICvCoMKgwqAgcHRl
X3QgcHRlID3CoCBwdGVwX2dldF9hbmRfY2xlYXIobW0sIHZhZGRyLCBwdGVwKTsKPj4+Pj4KPj4+
Pj4gU2VlbXMgbGlrZSBwdGVwX2dldF9hbmRfY2xlYXIoKSBoZXJlIGp1c3QgY2xlYXJzIHRoZSBl
bnRyeSBpbiBwcmVwYXJhdGlvbgo+Pj4+PiBmb3IgYSBmb2xsb3dpbmcgc2V0X3B0ZV9hdCgpIHdo
aWNoIG90aGVyd2lzZSB3b3VsZCBoYXZlIGJlZW4gYSBwcm9ibGVtIG9uCj4+Pj4+IHBwYzY0IGFz
IHlvdSBoYWQgcG9pbnRlZCBvdXQgZWFybGllciBpLmUgc2V0X3B0ZV9hdCgpIHNob3VsZCBub3Qg
dXBkYXRlIGFuCj4+Pj4+IGV4aXN0aW5nIHZhbGlkIGVudHJ5LiBTbyB0aGUgY29tbWl0IG1lc3Nh
Z2UgaGVyZSBpcyBiaXQgbWlzbGVhZGluZy4KPj4+Pj4KPj4+Pgo+Pj4+IGFuZCBhbHNvIGZldGNo
IHRoZSBwdGUgdmFsdWUgd2hpY2ggaXMgdXNlZCBmdXJ0aGVyLgo+Pj4+Cj4+Pj4KPj4+Pj4+ICDC
oMKgIMKgwqDCoMKgwqAgcHJfZGVidWcoIlZhbGlkYXRpbmcgUFRFIGNsZWFyXG4iKTsKPj4+Pj4+
ICDCoMKgwqDCoMKgwqAgcHRlID0gX19wdGUocHRlX3ZhbChwdGUpIHwgUkFORE9NX09SVkFMVUUp
Owo+Pj4+Pj4gQEAgLTk0NCw3ICs5NDQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBkZWJ1Z192bV9w
Z3RhYmxlKHZvaWQpCj4+Pj4+PiAgwqDCoMKgwqDCoMKgIHA0ZF90ICpwNGRwLCAqc2F2ZWRfcDRk
cDsKPj4+Pj4+ICDCoMKgwqDCoMKgwqAgcHVkX3QgKnB1ZHAsICpzYXZlZF9wdWRwOwo+Pj4+Pj4g
IMKgwqDCoMKgwqDCoCBwbWRfdCAqcG1kcCwgKnNhdmVkX3BtZHAsIHBtZDsKPj4+Pj4+IC3CoMKg
wqAgcHRlX3QgKnB0ZXA7Cj4+Pj4+PiArwqDCoMKgIHB0ZV90ICpwdGVwLCBwdGU7Cj4+Pj4+PiAg
wqDCoMKgwqDCoMKgIHBndGFibGVfdCBzYXZlZF9wdGVwOwo+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBw
Z3Byb3RfdCBwcm90LCBwcm90bm9uZTsKPj4+Pj4+ICDCoMKgwqDCoMKgwqAgcGh5c19hZGRyX3Qg
cGFkZHI7Cj4+Pj4+PiBAQCAtMTA0OSw2ICsxMDQ5LDggQEAgc3RhdGljIGludCBfX2luaXQgZGVi
dWdfdm1fcGd0YWJsZSh2b2lkKQo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgICovCj4+Pj4+PiAgwqDC
oCDCoMKgwqDCoMKgIHB0ZXAgPSBwdGVfYWxsb2NfbWFwX2xvY2sobW0sIHBtZHAsIHZhZGRyLCAm
cHRsKTsKPj4+Pj4+ICvCoMKgwqAgcHRlID0gcGZuX3B0ZShwdGVfYWxpZ25lZCwgcHJvdCk7Cj4+
Pj4+PiArwqDCoMKgIHNldF9wdGVfYXQobW0sIHZhZGRyLCBwdGVwLCBwdGUpOwo+Pj4+Pgo+Pj4+
PiBOb3QgaGVyZSwgY3JlYXRpbmcgYW5kIHBvcHVsYXRpbmcgYW4gZW50cnkgbXVzdCBiZSBkb25l
IGluIHJlc3BlY3RpdmUKPj4+Pj4gdGVzdCBmdW5jdGlvbnMgaXRzZWxmLiBCZXNpZGVzLCB0aGlz
IHNlZW1zIGJpdCByZWR1bmRhbnQgYXMgd2VsbC4gVGhlCj4+Pj4+IHRlc3QgcHRlX2NsZWFyX3Rl
c3RzKCkgd2l0aCB0aGUgYWJvdmUgY2hhbmdlIGFkZGVkLCBhbHJlYWR5Cj4+Pj4+Cj4+Pj4+IC0g
Q2xlYXJzIHRoZSBQVEVQIGVudHJ5IHdpdGggcHRlcF9nZXRfYW5kX2NsZWFyKCkKPj4+Pgo+Pj4+
IGFuZCBmZXRjaCB0aGUgb2xkIHZhbHVlIHNldCBwcmV2aW91c2x5Lgo+Pj4KPj4+IEluIHRoYXQg
Y2FzZSwgcGxlYXNlIG1vdmUgYWJvdmUgdHdvIGxpbmVzIGkuZQo+Pj4KPj4+IHB0ZSA9IHBmbl9w
dGUocHRlX2FsaWduZWQsIHByb3QpOwo+Pj4gc2V0X3B0ZV9hdChtbSwgdmFkZHIsIHB0ZXAsIHB0
ZSk7Cj4+Pgo+Pj4gZnJvbSBkZWJ1Z192bV9wZ3RhYmxlKCkgdG8gcHRlX2NsZWFyX3Rlc3RzKCkg
YW5kIHVwZGF0ZSBpdCdzIGFyZ3VtZW50cwo+Pj4gYXMgcmVxdWlyZWQuCj4+Pgo+Pgo+PiBGcmFu
a2x5LCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB0aGVzZSB0ZXN0cyBhcmUgdGVzdGluZy4gSXQg
YWxsIGxvb2tzIGxpa2Ugc29tZSByYW5kb20gY2xlYXIgYW5kIHNldC4KPiAKPiBUaGUgaWRlYSBo
ZXJlIGlzIHRvIGhhdmUgc29tZSB2YWx1ZSB3aXRoIHNvbWUgcmFuZG9tbmVzcyBwcmVmZXJhYmx5
LCBpbgo+IGEgZ2l2ZW4gUFRFUCBiZWZvcmUgYXR0ZW1wdGluZyB0byBjbGVhciB0aGUgZW50cnks
IGluIG9yZGVyIHRvIG1ha2Ugc3VyZQo+IHRoYXQgcHRlX2NsZWFyKCkgaXMgaW5kZWVkIGNsZWFy
aW5nIHNvbWV0aGluZyBvZiBub24temVybyB2YWx1ZS4KPiAKPj4KPj4gc3RhdGljIHZvaWQgX19p
bml0IHB0ZV9jbGVhcl90ZXN0cyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcHRlX3QgKnB0ZXAsCj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyB2YWRk
ciwgdW5zaWduZWQgbG9uZyBwZm4sCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcGdwcm90X3QgcHJvdCkKPj4gewo+Pgo+PiAgwqDCoMKgwqBwdGVfdCBwdGUgPSBwZm5f
cHRlKHBmbiwgcHJvdCk7Cj4+ICDCoMKgwqDCoHNldF9wdGVfYXQobW0sIHZhZGRyLCBwdGVwLCBw
dGUpOwo+Pgo+PiAgwqDCoMKgwqBwdGUgPcKgIHB0ZXBfZ2V0X2FuZF9jbGVhcihtbSwgdmFkZHIs
IHB0ZXApOwo+IAo+IExvb2tpbmcgYXQgdGhpcyBhZ2FpbiwgdGhpcyBwcmVjZWRpbmcgcGZuX3B0
ZSgpIGZvbGxvd2VkIGJ5IHNldF9wdGVfYXQoKQo+IGlzIG5vdCByZWFsbHkgcmVxdWlyZWQuIEl0
cyByZWFzb25hYmxlIHRvIHN0YXJ0IHdpdGggd2hhdCBldmVyIHdhcyB0aGVyZQo+IGluIHRoZSBQ
VEVQIGFzIGEgc2VlZCB2YWx1ZSB3aGljaCBhbnl3YXkgZ2V0cyBhZGRlZCB3aXRoIFJBTkRPTV9P
UlZBTFVFLgo+IHMvcHRlcF9nZXQvcHRlcF9nZXRfYW5kX2NsZWFyIGlzIHN1ZmZpY2llbnQgdG8g
dGFrZSBjYXJlIG9mIHRoZSBwb3dlcnBjCj4gc2V0X3B0ZV9hdCgpIGNvbnN0cmFpbnQuCj4gCgpC
dXQgdGhlIHdheSB0ZXN0IGlzIHdyaXR0ZW4gd2UgaGFkIG5vbmUgcHRlIGJlZm9yZS4gVGhhdCBp
cyB3aHkgSSBhZGRlZCAKdGhhdCBzZXRfcHRlX2F0IHRvIHB1dCBzb21ldGhpbmcgdGhlcmUuIFdp
dGggbm9uZSBwdGUgdGhlIGJlbG93IHNlcXVlbmNlIApmYWlscy4KCglwdGUgPSBfX3B0ZShwdGVf
dmFsKHB0ZSkgfCBSQU5ET01fT1JWQUxVRSk7CglzZXRfcHRlX2F0KG1tLCB2YWRkciwgcHRlcCwg
cHRlKTsKCgpiZWNhdXNlIG5vYm9keSBpcyBtYXJraW5nIGEgX1BBR0VfUFRFIHRoZXJlLgoKCXB0
ZV90IHB0ZSA9IHBmbl9wdGUocGZuLCBwcm90KTsKCglwcl9kZWJ1ZygiVmFsaWRhdGluZyBQVEUg
Y2xlYXJcbiIpOwoJcHRlID0gX19wdGUocHRlX3ZhbChwdGUpIHwgUkFORE9NX09SVkFMVUUpOwoJ
c2V0X3B0ZV9hdChtbSwgdmFkZHIsIHB0ZXAsIHB0ZSk7CgliYXJyaWVyKCk7CglwdGVfY2xlYXIo
bW0sIHZhZGRyLCBwdGVwKTsKCXB0ZSA9IHB0ZXBfZ2V0KHB0ZXApOwoJV0FSTl9PTighcHRlX25v
bmUocHRlKSk7Cgp3aWxsIHRoYXQgd29yayBmb3IgeW91PwoKLWFuZWVzaAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGlu
ZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
