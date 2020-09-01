Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC181C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:56:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2412087D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FpjVEF3k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WeMGrXOj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2412087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N4MD9kbdk1OIfZGu+GNjihaGdy0d7epmPRFlFkmdEgo=; b=FpjVEF3kfRkhwzCWiM10dNrHB
	0GpjDcNU/yGnxye33QM1Z33QDrx0VKr0FjtuPKTQi5AUhcv7IIjKrPLho7MLU9WxLsGlhO3xj9FK1
	kYL/M8rPwyDOFbH83y0k5d9VdGBygMFWeRp4+W89CLJsQS+Lqy/bW3rlkFapEXhMscFTDgqDSQVim
	4aITSjIiRgCC7CqcVFKEwhOVVw+6HSODJ+tXigPI6YPKfq/UE/Dw2E3MmnDrI4aGtEZPmB1tnLd+I
	5Kc9OGMVPbgniVmb1Jd4Is8b1S5KunYKUxMyfj+4gJNxn2BOIdz0Mci/aR/TgoQfIsjh6HwzwUk5P
	QcghVxfFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD19f-0007ad-T1; Tue, 01 Sep 2020 07:56:35 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD18V-0006rZ-ST; Tue, 01 Sep 2020 07:55:28 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0817WoKV140706; Tue, 1 Sep 2020 03:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XTtN1jV7Et+1GeMKl4ogc3mT6nlqn7rNPzY6fodlILc=;
 b=WeMGrXOj3vUVmEPVhPMDloTByUNUfWr1R97STPPM5BmD0izC3CZfXJtHcZqNl5DQzwgB
 4e73CzdTi3INFo/8HvUztz/iZA/UpIZQVYGRtewCguyyEh8fKT9xCP25QmbVr1sHpIOx
 8f52syLL5bKCSMRrXEheztpQlyE0CO2ymhoRmbycefwcIFwo7TVFXPIiaCxzRkM0RoMH
 aOEHREG6EnfS8vh9PcsRPU4SLcnVNgHz3DgQe53i04klUWcvzX/6ogul4kIbNtzU7z9O
 /cS0zV9ozyojYi5TFvrlOej13AQiAAa8nkLJcn3Jbo4Iv4CIRVyD14clYjWQcW2AfRsb JA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339g8jbnp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 03:55:09 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0817qArf007322;
 Tue, 1 Sep 2020 07:55:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 337en7hx1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 07:55:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0817t5I221430600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 07:55:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4388111C052;
 Tue,  1 Sep 2020 07:55:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC9E711C05B;
 Tue,  1 Sep 2020 07:55:02 +0000 (GMT)
Received: from [9.85.87.174] (unknown [9.85.87.174])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 07:55:02 +0000 (GMT)
Subject: Re: [PATCH v3 03/13] mm/debug_vm_pgtable/ppc64: Avoid setting top
 bits in radom value
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-4-aneesh.kumar@linux.ibm.com>
 <3a0b0101-e6ec-26c5-e104-5b0bb95c3e51@arm.com>
 <1a8abe92-032b-f60f-1df1-52bb409b35a3@linux.ibm.com>
 <75771782-734b-69f6-4a07-2d3542458319@arm.com>
 <e5d32d12-d904-ed8c-8963-d43d2c3744d9@linux.ibm.com>
 <c371e316-7533-62c7-a1c6-9b6745d8d1ea@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <3f20130a-f9fc-db9d-50a9-76aca5a1a6d7@linux.ibm.com>
Date: Tue, 1 Sep 2020 13:25:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c371e316-7533-62c7-a1c6-9b6745d8d1ea@arm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_035524_104584_F6EE5841 
X-CRM114-Status: GOOD (  24.82  )
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

T24gOS8xLzIwIDE6MTYgUE0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+IAo+IAo+IE9uIDA5
LzAxLzIwMjAgMDE6MDYgUE0sIEFuZWVzaCBLdW1hciBLLlYgd3JvdGU6Cj4+IE9uIDkvMS8yMCAx
OjAyIFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMDkvMDEvMjAy
MCAxMTo1MSBBTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+PiBPbiA5LzEvMjAgODo0NSBB
TSwgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDA4LzI3LzIw
MjAgMDE6MzQgUE0sIEFuZWVzaCBLdW1hciBLLlYgd3JvdGU6Cj4+Pj4+PiBwcGM2NCB1c2UgYml0
IDYyIHRvIGluZGljYXRlIGEgcHRlIGVudHJ5IChfUEFHRV9QVEUpLiBBdm9pZCBzZXR0aW5nIHRo
YXQgYml0IGluCj4+Pj4+PiByYW5kb20gdmFsdWUuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogQW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+Cj4+Pj4+PiAt
LS0KPj4+Pj4+ICDCoMKgIG1tL2RlYnVnX3ZtX3BndGFibGUuYyB8IDEzICsrKysrKysrKystLS0K
Pj4+Pj4+ICDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMgYi9t
bS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+Pj4+IGluZGV4IDA4NjMwOWZiOWI2Zi4uYmJmOWRmMGU2
NGM2IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvbW0vZGVidWdfdm1fcGd0YWJsZS5jCj4+Pj4+PiArKysg
Yi9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+Pj4+IEBAIC00NCwxMCArNDQsMTcgQEAKPj4+Pj4+
ICDCoMKgwqAgKiBlbnRyeSB0eXBlLiBCdXQgdGhlc2UgYml0cyBtaWdodCBhZmZlY3QgdGhlIGFi
aWxpdHkgdG8gY2xlYXIgZW50cmllcyB3aXRoCj4+Pj4+PiAgwqDCoMKgICogcHh4X2NsZWFyKCkg
YmVjYXVzZSBvZiBob3cgZHluYW1pYyBwYWdlIHRhYmxlIGZvbGRpbmcgd29ya3Mgb24gczM5MC4g
U28KPj4+Pj4+ICDCoMKgwqAgKiB3aGlsZSBsb2FkaW5nIHVwIHRoZSBlbnRyaWVzIGRvIG5vdCBj
aGFuZ2UgdGhlIGxvd2VyIDQgYml0cy4gSXQgZG9lcyBub3QKPj4+Pj4+IC0gKiBoYXZlIGFmZmVj
dCBhbnkgb3RoZXIgcGxhdGZvcm0uCj4+Pj4+PiArICogaGF2ZSBhZmZlY3QgYW55IG90aGVyIHBs
YXRmb3JtLiBBbHNvIGF2b2lkIHRoZSA2Mm5kIGJpdCBvbiBwcGM2NCB0aGF0IGlzCj4+Pj4+PiAr
ICogdXNlZCB0byBtYXJrIGEgcHRlIGVudHJ5Lgo+Pj4+Pj4gIMKgwqDCoCAqLwo+Pj4+Pj4gLSNk
ZWZpbmUgUzM5MF9NQVNLX0JJVFPCoMKgwqAgNAo+Pj4+Pj4gLSNkZWZpbmUgUkFORE9NX09SVkFM
VUXCoMKgwqAgR0VOTUFTSyhCSVRTX1BFUl9MT05HIC0gMSwgUzM5MF9NQVNLX0JJVFMpCj4+Pj4+
PiArI2RlZmluZSBTMzkwX1NLSVBfTUFTS8KgwqDCoMKgwqDCoMKgIEdFTk1BU0soMywgMCkKPj4+
Pj4+ICsjaWZkZWYgQ09ORklHX1BQQ19CT09LM1NfNjQKPj4+Pj4+ICsjZGVmaW5lIFBQQzY0X1NL
SVBfTUFTS8KgwqDCoMKgwqDCoMKgIEdFTk1BU0soNjIsIDYyKQo+Pj4+Pj4gKyNlbHNlCj4+Pj4+
PiArI2RlZmluZSBQUEM2NF9TS0lQX01BU0vCoMKgwqDCoMKgwqDCoCAweDAKPj4+Pj4+ICsjZW5k
aWYKPj4+Pj4KPj4+Pj4gUGxlYXNlIGRyb3AgdGhlICNpZmRlZiBDT05GSUdfUFBDX0JPT0szU182
NCBoZXJlLiBXZSBhbHJlYWR5IGFjY29tbW9kYXRlIHNraXAKPj4+Pj4gYml0cyBmb3IgYSBzMzkw
IHBsYXRmb3JtIHJlcXVpcmVtZW50IGFuZCBjYW4gYWxzbyBkbyBzbyBmb3IgcHBjNjQgYXMgd2Vs
bC4gQXMKPj4+Pj4gbWVudGlvbmVkIGJlZm9yZSwgcGxlYXNlIGF2b2lkIGFkZGluZyBhbnkgcGxh
dGZvcm0gc3BlY2lmaWMgY29uc3RydWN0cyBpbiB0aGUKPj4+Pj4gdGVzdC4KPj4+Pj4KPj4+Pgo+
Pj4+Cj4+Pj4gdGhhdCBpcyBuZWVkZWQgc28gdGhhdCBpdCBjYW4gYmUgYnVpbHQgb24gMzIgYml0
IGFyY2hpdGVjdHVyZXMuSSBkaWQgZmFjZSBidWlsZCBlcnJvcnMgd2l0aCBhcmNoLWxpbnV4Cj4+
Pgo+Pj4gQ291bGQgbm90ICgjaWYgX19CSVRTX1BFUl9MT05HID09IDMyKSBiZSB1c2VkIGluc3Rl
YWQgb3Igc29tZXRoaW5nIGxpa2UKPj4+IHRoYXQuIEJ1dCBzaG91bGQgYmUgYSBnZW5lcmljIGNv
bmRpdGlvbmFsIGNoZWNrIGlkZW50aWZ5aW5nIDMyIGJpdCBhcmNoCj4+PiBub3QgYW55dGhpbmcg
cGxhdGZvcm0gc3BlY2lmaWMuCj4+Pgo+Pgo+PiB0aGF0IF9QQUdFX1BURSBiaXQgaXMgcHJldHR5
IG11Y2ggc3BlY2lmaWMgdG8gUFBDIEJPT0szU182NC7CoCBOb3Qgc3VyZSB3aHkgb3RoZXIgYXJj
aGl0ZWN0dXJlcyBuZWVkIHRvIGJvdGhlcmVkIGFib3V0IGlnbm9yaW5nIGJpdCA2Mi4KPiAKPiBU
aGF0cyBva2F5IGFzIGxvbmcgaXQgZG9lcyBub3QgYWR2ZXJzZWx5IGFmZmVjdCBvdGhlciBhcmNo
aXRlY3R1cmVzLCBpZ25vcmluZwo+IHNvbWUgbW9yZSBiaXRzIGlzIGFjY2VwdGFibGUuIExpa2Ug
ZXhpc3RpbmcgUzM5MF9NQVNLX0JJVFMgZ2V0cyBpZ25vcmVkIG9uIGFsbAo+IG90aGVyIHBsYXRm
b3JtcyBldmVuIGlmIGl0IGlzIGEgczM5MCBzcGVjaWZpYyBjb25zdHJhaW50LiBOb3QgaGF2aW5n
IHBsYXRmb3JtCj4gc3BlY2lmaWMgI2lmZGVmIGhlcmUsIGlzIGVzc2VudGlhbC4KPiAKCldoeSBp
cyBpdCBlc3NlbnRpYWw/CgotYW5lZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
