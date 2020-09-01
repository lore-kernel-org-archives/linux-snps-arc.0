Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227A4C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:36:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFA14206CD
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aQP3N/L+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qAzX2egf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFA14206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=59Kg8bLWBL2C+4qX0GFTt3/VuJPPBP2D2C+32OKmFOw=; b=aQP3N/L+9zUOAc2pKnHCW73+G
	hKayVvy2vJEjdKrvbz07xKyDFkivdqd8edJaEcXXUCP1PmKnxp5nUIFu/FPMhCq6NsVyBzy7ypeAo
	kxYE2RLY8a06KHLGhVE0t5xzJUK//rzgtL5z8hKcLSkeSGxE/tXbsRMddOhxxwN8BalHO/jPGbeoo
	cJQ2au7/eOcmJRawretOkBUQ5j/xJ/6DqF2YwGjVpFBpzGgsraBrh8dEb/IUjAU2Zx5jh7Vf8PHx3
	xSeDfFm+lnIwJjskRYLFD1zy2CgJMpjf7ZFQqJB7WAmkHSVQfS5vCLeY+CjT3OUoE1VpATE36VH9M
	g2U9OtH/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD0qb-0003Y3-5U; Tue, 01 Sep 2020 07:36:53 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD0qZ-0003XQ-Pi; Tue, 01 Sep 2020 07:36:52 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0817XhAE175056; Tue, 1 Sep 2020 03:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=S1iFBELk1ZZ0IXFWXLknB8xFI5Dvn7zCRePqC6H6n0E=;
 b=qAzX2egf4bRqOSovcMdlhe+Klb9UcCF+mfetU5ELczRGOAonM1XPrKHpGCLkV/7ECnlb
 c0ZlWtAF0ekbod0dpingsaxLaomVnMZfuc+lTHOlVCTxJNRfO7mLH334CQELkLDa2nYg
 x/8zInckBZbXqZgRfsgXNIbAA9rDB1R8452kPbCx512HVVlr4tfG9ZNXFVUeopIPzOdu
 G7XvR+9hj4bDiePY69LQeLp29BQY8+uT1gkpfJOKcDUkG1rJy5LMnMApe0+q0BOXHSkY
 jwa4/US6NQ538GsRN33etEv4qYMWCut8/PC647aGGflyugse6pgWKMgmKXaYq1jWsqSR 9Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339gupa3ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 03:36:37 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0817XA8Z013173;
 Tue, 1 Sep 2020 07:36:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 337en8b3x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 07:36:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0817aWtp25559510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 07:36:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98CFA11C052;
 Tue,  1 Sep 2020 07:36:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C20A911C04A;
 Tue,  1 Sep 2020 07:36:29 +0000 (GMT)
Received: from [9.85.87.174] (unknown [9.85.87.174])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 07:36:29 +0000 (GMT)
Subject: Re: [PATCH v3 03/13] mm/debug_vm_pgtable/ppc64: Avoid setting top
 bits in radom value
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-4-aneesh.kumar@linux.ibm.com>
 <3a0b0101-e6ec-26c5-e104-5b0bb95c3e51@arm.com>
 <1a8abe92-032b-f60f-1df1-52bb409b35a3@linux.ibm.com>
 <75771782-734b-69f6-4a07-2d3542458319@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <e5d32d12-d904-ed8c-8963-d43d2c3744d9@linux.ibm.com>
Date: Tue, 1 Sep 2020 13:06:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <75771782-734b-69f6-4a07-2d3542458319@arm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009010065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_033651_968174_D52E3631 
X-CRM114-Status: GOOD (  24.32  )
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

T24gOS8xLzIwIDE6MDIgUE0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+IAo+IAo+IE9uIDA5
LzAxLzIwMjAgMTE6NTEgQU0sIEFuZWVzaCBLdW1hciBLLlYgd3JvdGU6Cj4+IE9uIDkvMS8yMCA4
OjQ1IEFNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMDgvMjcvMjAy
MCAwMTozNCBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+PiBwcGM2NCB1c2UgYml0IDYy
IHRvIGluZGljYXRlIGEgcHRlIGVudHJ5IChfUEFHRV9QVEUpLiBBdm9pZCBzZXR0aW5nIHRoYXQg
Yml0IGluCj4+Pj4gcmFuZG9tIHZhbHVlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5lZXNo
IEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKg
IG1tL2RlYnVnX3ZtX3BndGFibGUuYyB8IDEzICsrKysrKysrKystLS0KPj4+PiAgwqAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvbW0vZGVidWdfdm1fcGd0YWJsZS5jIGIvbW0vZGVidWdfdm1fcGd0YWJsZS5jCj4+
Pj4gaW5kZXggMDg2MzA5ZmI5YjZmLi5iYmY5ZGYwZTY0YzYgMTAwNjQ0Cj4+Pj4gLS0tIGEvbW0v
ZGVidWdfdm1fcGd0YWJsZS5jCj4+Pj4gKysrIGIvbW0vZGVidWdfdm1fcGd0YWJsZS5jCj4+Pj4g
QEAgLTQ0LDEwICs0NCwxNyBAQAo+Pj4+ICDCoMKgICogZW50cnkgdHlwZS4gQnV0IHRoZXNlIGJp
dHMgbWlnaHQgYWZmZWN0IHRoZSBhYmlsaXR5IHRvIGNsZWFyIGVudHJpZXMgd2l0aAo+Pj4+ICDC
oMKgICogcHh4X2NsZWFyKCkgYmVjYXVzZSBvZiBob3cgZHluYW1pYyBwYWdlIHRhYmxlIGZvbGRp
bmcgd29ya3Mgb24gczM5MC4gU28KPj4+PiAgwqDCoCAqIHdoaWxlIGxvYWRpbmcgdXAgdGhlIGVu
dHJpZXMgZG8gbm90IGNoYW5nZSB0aGUgbG93ZXIgNCBiaXRzLiBJdCBkb2VzIG5vdAo+Pj4+IC0g
KiBoYXZlIGFmZmVjdCBhbnkgb3RoZXIgcGxhdGZvcm0uCj4+Pj4gKyAqIGhhdmUgYWZmZWN0IGFu
eSBvdGhlciBwbGF0Zm9ybS4gQWxzbyBhdm9pZCB0aGUgNjJuZCBiaXQgb24gcHBjNjQgdGhhdCBp
cwo+Pj4+ICsgKiB1c2VkIHRvIG1hcmsgYSBwdGUgZW50cnkuCj4+Pj4gIMKgwqAgKi8KPj4+PiAt
I2RlZmluZSBTMzkwX01BU0tfQklUU8KgwqDCoCA0Cj4+Pj4gLSNkZWZpbmUgUkFORE9NX09SVkFM
VUXCoMKgwqAgR0VOTUFTSyhCSVRTX1BFUl9MT05HIC0gMSwgUzM5MF9NQVNLX0JJVFMpCj4+Pj4g
KyNkZWZpbmUgUzM5MF9TS0lQX01BU0vCoMKgwqDCoMKgwqDCoCBHRU5NQVNLKDMsIDApCj4+Pj4g
KyNpZmRlZiBDT05GSUdfUFBDX0JPT0szU182NAo+Pj4+ICsjZGVmaW5lIFBQQzY0X1NLSVBfTUFT
S8KgwqDCoMKgwqDCoMKgIEdFTk1BU0soNjIsIDYyKQo+Pj4+ICsjZWxzZQo+Pj4+ICsjZGVmaW5l
IFBQQzY0X1NLSVBfTUFTS8KgwqDCoMKgwqDCoMKgIDB4MAo+Pj4+ICsjZW5kaWYKPj4+Cj4+PiBQ
bGVhc2UgZHJvcCB0aGUgI2lmZGVmIENPTkZJR19QUENfQk9PSzNTXzY0IGhlcmUuIFdlIGFscmVh
ZHkgYWNjb21tb2RhdGUgc2tpcAo+Pj4gYml0cyBmb3IgYSBzMzkwIHBsYXRmb3JtIHJlcXVpcmVt
ZW50IGFuZCBjYW4gYWxzbyBkbyBzbyBmb3IgcHBjNjQgYXMgd2VsbC4gQXMKPj4+IG1lbnRpb25l
ZCBiZWZvcmUsIHBsZWFzZSBhdm9pZCBhZGRpbmcgYW55IHBsYXRmb3JtIHNwZWNpZmljIGNvbnN0
cnVjdHMgaW4gdGhlCj4+PiB0ZXN0Lgo+Pj4KPj4KPj4KPj4gdGhhdCBpcyBuZWVkZWQgc28gdGhh
dCBpdCBjYW4gYmUgYnVpbHQgb24gMzIgYml0IGFyY2hpdGVjdHVyZXMuSSBkaWQgZmFjZSBidWls
ZCBlcnJvcnMgd2l0aCBhcmNoLWxpbnV4Cj4gCj4gQ291bGQgbm90ICgjaWYgX19CSVRTX1BFUl9M
T05HID09IDMyKSBiZSB1c2VkIGluc3RlYWQgb3Igc29tZXRoaW5nIGxpa2UKPiB0aGF0LiBCdXQg
c2hvdWxkIGJlIGEgZ2VuZXJpYyBjb25kaXRpb25hbCBjaGVjayBpZGVudGlmeWluZyAzMiBiaXQg
YXJjaAo+IG5vdCBhbnl0aGluZyBwbGF0Zm9ybSBzcGVjaWZpYy4KPiAKCnRoYXQgX1BBR0VfUFRF
IGJpdCBpcyBwcmV0dHkgbXVjaCBzcGVjaWZpYyB0byBQUEMgQk9PSzNTXzY0LiAgTm90IHN1cmUg
CndoeSBvdGhlciBhcmNoaXRlY3R1cmVzIG5lZWQgdG8gYm90aGVyZWQgYWJvdXQgaWdub3Jpbmcg
Yml0IDYyLgoKLWFuZWVzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1zbnBzLWFyYwo=
