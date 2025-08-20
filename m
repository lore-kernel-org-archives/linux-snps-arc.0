Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E436FCA0EDC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Aug 2025 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMgN8Of6jap+ximLANl3RBRiJ/GFV7OcDI5yRtvDl4k=; b=3vRfey8G/lDQ2q
	kFS6zVngAnEFCmUt0TLeaUega9zbjS2dhMSJXA7LX7PZyQ/klpbeQ8QqXdH6tjQX4MuEDTqOsAIDQ
	g/hCPm7sxwU9NIEkDGQpBuzH5HvGGQfzt02i04F70BJUFM3cK+rdqUTwktVgdUVo3bczBYnSV/iu+
	//QOmNBO0fzV8r6dVEILtg3zpU+IZAIbVcU+SI2il1DbjrYrndfmeGcDe7C24AN16RhvfoUIOA7qY
	2oCmIFrXvNlyjmvsnaMslOLx8mwHg290BCszh/AXGA0PQmJDbQrD5pClzVxmr5fJrp9orNqAEkQNy
	xFHLs1u7yVvafC/GiILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeNa-0000000CmIQ-24kA;
	Wed, 20 Aug 2025 08:41:10 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodsx-0000000CgOe-1VoO;
	Wed, 20 Aug 2025 08:09:32 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JNmmLo017631;
	Wed, 20 Aug 2025 08:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XyEp7P
	B6Crc5O/n3hDpRBdclhiXWepi7f2DlP7ISOnE=; b=Xixm2oi8D/e/+wAITPeDp3
	TALHrRG4EBVti1e3wM1Z6LnCfvINBVfhRGmgOPkipNfgbFhBD0MWSeZRRuGZ/NN+
	NKDq98HPciL4Zozeql4srzji2nvV3CzcZ3UlmCS5mUo4axD1CO9niYr/utY3r3nU
	R/k9YIllh44h9uoNOFLeppTj5ZpJGLc7EDb+zLBQQ5R2NO8ZqfzYF65N+NeIflzl
	gTcYt/B8t87ieiFU691ZjDHQqARPeaX+Fy6nA8Cm30nsgWe9R3Iis8b6CyGL5Xlw
	ovWuvSCaaobgeWwxqiRAGHpZnDDJ13JX7jkAK7240Uso3SZWpw/1sppbNb+XqHPQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48n38vhrww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 08:09:13 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57K89CuX005377;
	Wed, 20 Aug 2025 08:09:12 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48n38vhrwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 08:09:12 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57K4xm2t015619;
	Wed, 20 Aug 2025 08:09:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48my422cjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 08:09:11 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57K899B961342160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Aug 2025 08:09:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A734720043;
	Wed, 20 Aug 2025 08:09:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 407A620040;
	Wed, 20 Aug 2025 08:09:08 +0000 (GMT)
Received: from [9.111.5.117] (unknown [9.111.5.117])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 20 Aug 2025 08:09:08 +0000 (GMT)
Message-ID: <295ae4dd-4734-42a0-be63-2d322f00c799@linux.ibm.com>
Date: Wed, 20 Aug 2025 10:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] perf: Introduce positive capability for raw events
To: Robin Murphy <robin.murphy@arm.com>, peterz@infradead.org,
        mingo@redhat.com, will@kernel.org, mark.rutland@arm.com,
        acme@kernel.org, namhyung@kernel.org,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
        linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
        iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
        linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <cover.1755096883.git.robin.murphy@arm.com>
 <542787fd188ea15ef41c53d557989c962ed44771.1755096883.git.robin.murphy@arm.com>
 <67a0d778-6e2c-4955-a7ce-56a10043ae8d@arm.com>
Content-Language: en-US
From: Thomas Richter <tmricht@linux.ibm.com>
Organization: IBM
In-Reply-To: <67a0d778-6e2c-4955-a7ce-56a10043ae8d@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rc1CmpHVUr4PjN6HeVNNaTAKVoWbVX32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDIyMiBTYWx0ZWRfX4xTzLYCTQsxG
 AGD1we0J4ezItB0ejTfm7DJNuDAARyH4VivdukTDV+G2c134zt0WbxSJSEE76uDxTym3DRzLeZX
 mOf6bUkLRc8HI2z83HLeSrLnCDaUzt6ctsGigqq+Yny6dHl56O82/ysxGcmIZx9UyZO+hyMZvb/
 ecuWa/hbBYOZ6yeacF65qy/00k1eAjO++Mj45cxXjqV85T1khiwKHAStutPkN05LIcWmzIOI2N6
 JcZUW/XH3ZbwPgzY20enHnuM+rxpiC2AXWamVYRgBgnxytZoHYJTbh5BurqPVICmyND/IQHxcAh
 w3J7un0oPnbnMNdQ3B2TA6VUHKYY82ln4UWEvFzI/Jn0XaQRTQr//JuEseTSCgQIqbo5FGoTW85
 ypKOH5UDXA9ip20lItNjpe1wLNO1nQ==
X-Proofpoint-GUID: GZ2wu60A03msHy_JXXsuf0f5WSTi9QT-
X-Authority-Analysis: v=2.4 cv=KPwDzFFo c=1 sm=1 tr=0 ts=68a582a9 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=7CQSdrXTAAAA:8 a=gUTjnckvcJroK4elFEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_010931_403938_90266019 
X-CRM114-Status: GOOD (  25.84  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gOC8xOS8yNSAxNToxNSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDEzLzA4LzIwMjUgNjow
MSBwbSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+PiBPbmx5IGEgaGFuZGZ1bCBvZiBDUFUgUE1VcyBh
Y2NlcHQgUEVSRl9UWVBFX3tSQVcsSEFSRFdBUkUsSFdfQ0FDSEV9Cj4+IGV2ZW50cyB3aXRob3V0
IHJlZ2lzdGVyaW5nIHRoZW1zZWx2ZXMgYXMgUEVSRl9UWVBFX1JBVyBpbiB0aGUgZmlyc3QKPj4g
cGxhY2UuIEFkZCBhbiBleHBsaWNpdCBvcHQtaW4gZm9yIHRoZXNlIHNwZWNpYWwgY2FzZXMsIHNv
IHRoYXQgd2UgY2FuCj4+IG1ha2UgbGlmZSBlYXNpZXIgZm9yIGV2ZXJ5IG90aGVyIGRyaXZlciAo
YW5kIHByb2JhYmx5IGFsc28gc3BlZWQgdXAgdGhlCj4+IHNsb3ctcGF0aCBzZWFyY2gpIGJ5IGhh
dmluZyBwZXJmX3RyeV9pbml0X2V2ZW50KCkgZG8gdGhlIGJhc2ljIHR5cGUKPj4gY2hlY2tpbmcg
dG8gY292ZXIgdGhlIG1ham9yaXR5IG9mIGNhc2VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2Jp
biBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+PiAtLS0KPj4KPj4gQSBmdXJ0aGVyIHBv
c3NpYmlsaXR5IGlzIHRvIGF1dG9tYXRpY2FsbHkgYWRkIHRoZSBjYXAgdG8gUEVSRl9UWVBFX1JB
Vwo+PiBQTVVzIGluIHBlcmZfcG11X3JlZ2lzdGVyKCkgdG8gaGF2ZSBhIHNpbmdsZSBwb2ludC1v
Zi11c2UgY29uZGl0aW9uOyBJJ20KPj4gdW5kZWNpZGVkLi4uCj4+IC0tLQo+PiDCoCBhcmNoL3Mz
OTAva2VybmVsL3BlcmZfY3B1bV9jZi5jwqDCoMKgIHzCoCAxICsKPj4gwqAgYXJjaC9zMzkwL2tl
cm5lbC9wZXJmX3BhaV9jcnlwdG8uYyB8wqAgMiArLQo+PiDCoCBhcmNoL3MzOTAva2VybmVsL3Bl
cmZfcGFpX2V4dC5jwqDCoMKgIHzCoCAyICstCj4+IMKgIGFyY2gveDg2L2V2ZW50cy9jb3JlLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPj4gwqAgZHJpdmVycy9wZXJmL2FybV9w
bXUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIGluY2x1ZGUvbGludXgv
cGVyZl9ldmVudC5owqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIGtlcm5lbC9ldmVudHMv
Y29yZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE1ICsrKysrKysrKysrKysrKwo+
PiDCoCA3IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAva2VybmVsL3BlcmZfY3B1bV9jZi5jIGIvYXJjaC9z
MzkwL2tlcm5lbC9wZXJmX2NwdW1fY2YuYwo+PiBpbmRleCAxYTk0ZTA5NDRiYzUuLjc4MmFiNzU1
ZGRkNCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9zMzkwL2tlcm5lbC9wZXJmX2NwdW1fY2YuYwo+PiAr
KysgYi9hcmNoL3MzOTAva2VybmVsL3BlcmZfY3B1bV9jZi5jCj4+IEBAIC0xMDU0LDYgKzEwNTQs
NyBAQCBzdGF0aWMgdm9pZCBjcHVtZl9wbXVfZGVsKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwg
aW50IGZsYWdzKQo+PiDCoCAvKiBQZXJmb3JtYW5jZSBtb25pdG9yaW5nIHVuaXQgZm9yIHMzOTB4
ICovCj4+IMKgIHN0YXRpYyBzdHJ1Y3QgcG11IGNwdW1mX3BtdSA9IHsKPj4gwqDCoMKgwqDCoCAu
dGFza19jdHhfbnLCoCA9IHBlcmZfc3dfY29udGV4dCwKPj4gK8KgwqDCoCAuY2FwYWJpbGl0aWVz
ID0gUEVSRl9QTVVfQ0FQX1JBV19FVkVOVFMsCj4+IMKgwqDCoMKgwqAgLnBtdV9lbmFibGXCoMKg
ID0gY3B1bWZfcG11X2VuYWJsZSwKPj4gwqDCoMKgwqDCoCAucG11X2Rpc2FibGXCoCA9IGNwdW1m
X3BtdV9kaXNhYmxlLAo+PiDCoMKgwqDCoMKgIC5ldmVudF9pbml0wqDCoCA9IGNwdW1mX3BtdV9l
dmVudF9pbml0LAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2tlcm5lbC9wZXJmX3BhaV9jcnlw
dG8uYyBiL2FyY2gvczM5MC9rZXJuZWwvcGVyZl9wYWlfY3J5cHRvLmMKPj4gaW5kZXggYTY0YjZi
MDU2YTIxLi5iNWI2ZDhiNWQ5NDMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvczM5MC9rZXJuZWwvcGVy
Zl9wYWlfY3J5cHRvLmMKPj4gKysrIGIvYXJjaC9zMzkwL2tlcm5lbC9wZXJmX3BhaV9jcnlwdG8u
Ywo+PiBAQCAtNTY5LDcgKzU2OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dy
b3VwICpwYWljcnlwdF9hdHRyX2dyb3Vwc1tdID0gewo+PiDCoCAvKiBQZXJmb3JtYW5jZSBtb25p
dG9yaW5nIHVuaXQgZm9yIG1hcHBlZCBjb3VudGVycyAqLwo+PiDCoCBzdGF0aWMgc3RydWN0IHBt
dSBwYWljcnlwdCA9IHsKPj4gwqDCoMKgwqDCoCAudGFza19jdHhfbnLCoCA9IHBlcmZfaHdfY29u
dGV4dCwKPj4gLcKgwqDCoCAuY2FwYWJpbGl0aWVzID0gUEVSRl9QTVVfQ0FQX1NBTVBMSU5HLAo+
PiArwqDCoMKgIC5jYXBhYmlsaXRpZXMgPSBQRVJGX1BNVV9DQVBfU0FNUExJTkcgfCBQRVJGX1BN
VV9DQVBfUkFXX0VWRU5UUywKPj4gwqDCoMKgwqDCoCAuZXZlbnRfaW5pdMKgwqAgPSBwYWljcnlw
dF9ldmVudF9pbml0LAo+PiDCoMKgwqDCoMKgIC5hZGTCoMKgwqDCoMKgwqDCoMKgwqAgPSBwYWlj
cnlwdF9hZGQsCj4+IMKgwqDCoMKgwqAgLmRlbMKgwqDCoMKgwqDCoMKgwqDCoCA9IHBhaWNyeXB0
X2RlbCwKPj4gZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9rZXJuZWwvcGVyZl9wYWlfZXh0LmMgYi9h
cmNoL3MzOTAva2VybmVsL3BlcmZfcGFpX2V4dC5jCj4+IGluZGV4IDEyNjFmODBjNmQ1Mi4uYmNk
MjhjMzhkYTcwIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3MzOTAva2VybmVsL3BlcmZfcGFpX2V4dC5j
Cj4+ICsrKyBiL2FyY2gvczM5MC9rZXJuZWwvcGVyZl9wYWlfZXh0LmMKPj4gQEAgLTU5NSw3ICs1
OTUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqcGFpZXh0X2F0dHJf
Z3JvdXBzW10gPSB7Cj4+IMKgIC8qIFBlcmZvcm1hbmNlIG1vbml0b3JpbmcgdW5pdCBmb3IgbWFw
cGVkIGNvdW50ZXJzICovCj4+IMKgIHN0YXRpYyBzdHJ1Y3QgcG11IHBhaWV4dCA9IHsKPj4gwqDC
oMKgwqDCoCAudGFza19jdHhfbnLCoCA9IHBlcmZfaHdfY29udGV4dCwKPj4gLcKgwqDCoCAuY2Fw
YWJpbGl0aWVzID0gUEVSRl9QTVVfQ0FQX1NBTVBMSU5HLAo+PiArwqDCoMKgIC5jYXBhYmlsaXRp
ZXMgPSBQRVJGX1BNVV9DQVBfU0FNUExJTkcgfCBQRVJGX1BNVV9DQVBfUkFXX0VWRU5UUywKPj4g
wqDCoMKgwqDCoCAuZXZlbnRfaW5pdMKgwqAgPSBwYWlleHRfZXZlbnRfaW5pdCwKPj4gwqDCoMKg
wqDCoCAuYWRkwqDCoMKgwqDCoMKgwqDCoMKgID0gcGFpZXh0X2FkZCwKPj4gwqDCoMKgwqDCoCAu
ZGVswqDCoMKgwqDCoMKgwqDCoMKgID0gcGFpZXh0X2RlbCwKPj4gZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2V2ZW50cy9jb3JlLmMgYi9hcmNoL3g4Ni9ldmVudHMvY29yZS5jCj4+IGluZGV4IDc4OWRm
Y2EyZmE2Ny4uNzY0NzI4YmI4MGFlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9ldmVudHMvY29y
ZS5jCj4+ICsrKyBiL2FyY2gveDg2L2V2ZW50cy9jb3JlLmMKPj4gQEAgLTI2OTcsNyArMjY5Nyw3
IEBAIHN0YXRpYyBib29sIHg4Nl9wbXVfZmlsdGVyKHN0cnVjdCBwbXUgKnBtdSwgaW50IGNwdSkK
Pj4gwqAgfQo+PiDCoCDCoCBzdGF0aWMgc3RydWN0IHBtdSBwbXUgPSB7Cj4+IC3CoMKgwqAgLmNh
cGFiaWxpdGllc8KgwqDCoMKgwqDCoMKgID0gUEVSRl9QTVVfQ0FQX1NBTVBMSU5HLAo+PiArwqDC
oMKgIC5jYXBhYmlsaXRpZXPCoMKgwqDCoMKgwqDCoCA9IFBFUkZfUE1VX0NBUF9TQU1QTElORyB8
IFBFUkZfUE1VX0NBUF9SQVdfRVZFTlRTLAo+PiDCoCDCoMKgwqDCoMKgIC5wbXVfZW5hYmxlwqDC
oMKgwqDCoMKgwqAgPSB4ODZfcG11X2VuYWJsZSwKPj4gwqDCoMKgwqDCoCAucG11X2Rpc2FibGXC
oMKgwqDCoMKgwqDCoCA9IHg4Nl9wbXVfZGlzYWJsZSwKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGVyZi9hcm1fcG11LmMgYi9kcml2ZXJzL3BlcmYvYXJtX3BtdS5jCj4+IGluZGV4IDcyZDhmMzhk
MGFhNS4uYmM3NzJhM2JmNDExIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3BlcmYvYXJtX3BtdS5j
Cj4+ICsrKyBiL2RyaXZlcnMvcGVyZi9hcm1fcG11LmMKPj4gQEAgLTg3Nyw2ICs4NzcsNyBAQCBz
dHJ1Y3QgYXJtX3BtdSAqYXJtcG11X2FsbG9jKHZvaWQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICogc3BlY2lmaWMgUE1VLgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgLmNhcGFiaWxpdGllc8KgwqDCoCA9IFBFUkZfUE1VX0NBUF9TQU1QTElORyB8Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBFUkZfUE1VX0NBUF9SQVdfRVZF
TlRTIHwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUEVSRl9QTVVf
Q0FQX0VYVEVOREVEX1JFR1MgfAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBQRVJGX1BNVV9DQVBfRVhURU5ERURfSFdfVFlQRSwKPj4gwqDCoMKgwqDCoCB9Owo+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wZXJmX2V2ZW50LmggYi9pbmNsdWRlL2xpbnV4L3Bl
cmZfZXZlbnQuaAo+PiBpbmRleCAxODNiN2M0OGIzMjkuLmM2YWQwMzZjMDAzNyAxMDA2NDQKPj4g
LS0tIGEvaW5jbHVkZS9saW51eC9wZXJmX2V2ZW50LmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9w
ZXJmX2V2ZW50LmgKPj4gQEAgLTMwNSw2ICszMDUsNyBAQCBzdHJ1Y3QgcGVyZl9ldmVudF9wbXVf
Y29udGV4dDsKPj4gwqAgI2RlZmluZSBQRVJGX1BNVV9DQVBfRVhURU5ERURfSFdfVFlQRcKgwqDC
oCAweDAxMDAKPj4gwqAgI2RlZmluZSBQRVJGX1BNVV9DQVBfQVVYX1BBVVNFwqDCoMKgwqDCoMKg
wqAgMHgwMjAwCj4+IMKgICNkZWZpbmUgUEVSRl9QTVVfQ0FQX0FVWF9QUkVGRVJfTEFSR0XCoMKg
wqAgMHgwNDAwCj4+ICsjZGVmaW5lIFBFUkZfUE1VX0NBUF9SQVdfRVZFTlRTwqDCoMKgwqDCoMKg
wqAgMHgwODAwCj4+IMKgIMKgIC8qKgo+PiDCoMKgICogcG11OjpzY29wZQo+PiBkaWZmIC0tZ2l0
IGEva2VybmVsL2V2ZW50cy9jb3JlLmMgYi9rZXJuZWwvZXZlbnRzL2NvcmUuYwo+PiBpbmRleCA3
MWIyYTY3MzA3MDUuLjJlY2VlNzZkMmFlMiAxMDA2NDQKPj4gLS0tIGEva2VybmVsL2V2ZW50cy9j
b3JlLmMKPj4gKysrIGIva2VybmVsL2V2ZW50cy9jb3JlLmMKPj4gQEAgLTEyNTU2LDExICsxMjU1
NiwyNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaGFzX2V4dGVuZGVkX3JlZ3Moc3RydWN0IHBlcmZf
ZXZlbnQgKmV2ZW50KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGV2ZW50LT5hdHRyLnNh
bXBsZV9yZWdzX2ludHIgJiBQRVJGX1JFR19FWFRFTkRFRF9NQVNLKTsKPj4gwqAgfQo+PiDCoCAr
c3RhdGljIGJvb2wgaXNfcmF3X3BtdShjb25zdCBzdHJ1Y3QgcG11ICpwbXUpCj4+ICt7Cj4+ICvC
oMKgwqAgcmV0dXJuIHBtdS0+dHlwZSA9PSBQRVJGX1RZUEVfUkFXIHx8Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwbXUtPmNhcGFiaWxpdGllcyAmIFBFUkZfUE1VX0NBUF9SQVdfRVZFTlRTOwo+
PiArfQo+PiArCj4+IMKgIHN0YXRpYyBpbnQgcGVyZl90cnlfaW5pdF9ldmVudChzdHJ1Y3QgcG11
ICpwbXUsIHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0
cnVjdCBwZXJmX2V2ZW50X2NvbnRleHQgKmN0eCA9IE5VTEw7Cj4+IMKgwqDCoMKgwqAgaW50IHJl
dDsKPj4gwqAgK8KgwqDCoCAvKgo+PiArwqDCoMKgwqAgKiBCZWZvcmUgdG91Y2hpbmcgYW55dGhp
bmcsIHdlIGNhbiBzYWZlbHkgc2tpcDoKPj4gK8KgwqDCoMKgICogLSBhbnkgZXZlbnQgZm9yIGEg
c3BlY2lmaWMgUE1VIHdoaWNoIGlzIG5vdCB0aGlzIG9uZQo+PiArwqDCoMKgwqAgKiAtIGFueSBj
b21tb24gZXZlbnQgaWYgdGhpcyBQTVUgZG9lc24ndCBzdXBwb3J0IHRoZW0KPj4gK8KgwqDCoMKg
ICovCj4+ICvCoMKgwqAgaWYgKGV2ZW50LT5hdHRyLnR5cGUgIT0gcG11LT50eXBlICYmCj4+ICvC
oMKgwqDCoMKgwqDCoCAoZXZlbnQtPmF0dHIudHlwZSA+PSBQRVJGX1RZUEVfTUFYIHx8IGlzX3Jh
d19wbXUocG11KSkpCj4gCj4gQWgsIHRoYXQgc2hvdWxkIGJlICIhaXNfcmF3X3BtdShwbXUpIiB0
aGVyZSAoYWx0aG91Z2ggaXQncyBub3QgZW50aXJlbHkgdGhlIGNhdXNlIG9mIHRoZSBMS1AgcmVw
b3J0IG9uIHRoZSBmaW5hbCBwYXRjaC4pCj4gCj4gVGhhbmtzLAo+IFJvYmluLgo+IAo+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9FTlQ7Cj4+ICsKPj4gwqDCoMKgwqDCoCBpZiAoIXRyeV9t
b2R1bGVfZ2V0KHBtdS0+bW9kdWxlKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5P
REVWOwo+PiDCoCAKPiAKPiAKCkhpIFJvYmluLAoKd2hhdCBpcyB0aGUgaW50ZW50aW9uIG9mIHRo
YXQgcGF0Y2g/CkNhbiB5b3UgZXhwbGFpbiB0aGF0IGEgYml0IG1vcmUuCgpUaGFua3MuCgotLSAK
VGhvbWFzIFJpY2h0ZXIsIERlcHQgMzMwMywgSUJNIHMzOTAgTGludXggRGV2ZWxvcG1lbnQsIEJv
ZWJsaW5nZW4sIEdlcm1hbnkKLS0KSUJNIERldXRzY2hsYW5kIFJlc2VhcmNoICYgRGV2ZWxvcG1l
bnQgR21iSAoKVm9yc2l0emVuZGVyIGRlcyBBdWZzaWNodHNyYXRzOiBXb2xmZ2FuZyBXZW5kdAoK
R2VzY2jDpGZ0c2bDvGhydW5nOiBEYXZpZCBGYWxsZXIKClNpdHogZGVyIEdlc2VsbHNjaGFmdDog
QsO2YmxpbmdlbiAvIFJlZ2lzdGVyZ2VyaWNodDogQW10c2dlcmljaHQgU3R1dHRnYXJ0LCBIUkIg
MjQzMjk0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
