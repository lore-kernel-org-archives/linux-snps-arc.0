Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9B6CA0EFF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Aug 2025 05:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4HZKgpqZ25ux+NCR4B7uBqANKESC14zQoMMYi7yjyw=; b=FiYngoulDxlL5P
	rVt8zv/S0kp4WFuHU/FHoHJ5bURofxYTFS9JGmwL9s9Dq/doRUy/tZPNvb/bM3lMxJDmYFf2Mn8aI
	VMhpuCifnqsqWGmayT6s9eMNBybnp+AmZwQtPzBY8wZikFSdnVFz7o1RjDpgLvtW+cfrdYPWDthwD
	faUKP/7UxyMqogdrD6WxHAIvhq3F15lsYb0kmR4f/ptptlx9eQ2mWDj5Z3f2Hr/lCuBvvxEMfkJw7
	kQNBOVLg1mOCloRSHmMDR/Kw4eaXanA5LDyhW2YqwUWT5sQvFbC/zTYFhO+T+K7PAwUO1Aai0Cn/H
	RvbL1pVzOWO2QiwuKexg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8lh-0000000E8RS-22QT;
	Wed, 27 Aug 2025 05:32:21 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8gr-0000000E7ZS-252b;
	Wed, 27 Aug 2025 05:27:22 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QJuQZo029875;
	Wed, 27 Aug 2025 05:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jxijss
	tmEiNGZJKG6yltOja4dBZKrqMyUi/HgZLz1Sk=; b=fFfa87uMu8acvDC8OVnLiF
	3Gw7T94UM/oONEZ9FfO6ESJm9dykU5EYEWzJ6thKl8AEybeSnU7jVczC+OsbSmIg
	U1DTm1ikvBxQhtMsBkqiirIjOSbWdtCJnpSDht3JKVzPoBOjH3KPPIjRZwjgIoz4
	PIz+4T0pathmf8bjMQQcBo9Nngpp8r0YuSt99tds0+EviRwkVU+5p0dMPKzJ5SJZ
	NqSby3CqAv1CiFuqsjN+UtUj0P6MofPcWemNISQn5nz/ZN8twBsE28xbYF1o/y5D
	T+rxMTdyXFQiS1FQNk9wuoFsc0iqqXm08NakEBDb3JoIMWYZ+sB++DfGZXvYi8bQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42j2cs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 05:27:07 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57R5K8Rl017639;
	Wed, 27 Aug 2025 05:27:06 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42j2cs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 05:27:06 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57R3lXEH029924;
	Wed, 27 Aug 2025 05:27:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfmpe9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 05:27:05 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57R5R1oh53739874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Aug 2025 05:27:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6821520049;
	Wed, 27 Aug 2025 05:27:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A772520040;
	Wed, 27 Aug 2025 05:27:00 +0000 (GMT)
Received: from [9.152.212.92] (unknown [9.152.212.92])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 27 Aug 2025 05:27:00 +0000 (GMT)
Message-ID: <ac6dfaec-38ea-486d-89a0-ab02768cee42@linux.ibm.com>
Date: Wed, 27 Aug 2025 07:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] perf: Introduce positive capability for raw events
To: Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Jan Polensky <japo@linux.ibm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org, acme@kernel.org,
        namhyung@kernel.org, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
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
 <aK259PrpyxguQzdN@J2N7QTR9R3>
Content-Language: en-US
From: Thomas Richter <tmricht@linux.ibm.com>
Organization: IBM
In-Reply-To: <aK259PrpyxguQzdN@J2N7QTR9R3>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMCBTYWx0ZWRfXx7bT3ieVYWZ1
 FvRIJn/6odyl76gPtjq2fdUI3+ddgoyBguazv17xAc0h1PWPsciO7Io1+yf38004HJX48EZKQe4
 jjqa2jsZ613Il7PEWWZLmHVXl0DVElauSgaXsW2jrn5unNTZZAgCkgP5ixkSnbssGkUA98RWoHK
 6CllyViFj8nmb4/kmZamtgDzlo/xirMdIPTqK1ytIy748E4TyQcONzfTAVM6cDoHbAMLdYuTHtD
 UT6EmBwE8Tz6Ajw1M3OeNTbMk21jMwITf/ouwlMB6Q/Hm12FuudC6E2iwfSIPWm8nU5cvD4JBmw
 ghpRUxLnbbdBrU5mCsCpBm2H2yjaVRWCqCxRNsBxe1xCwhV1Oev6PUoPQ5TLoGumXLZUFEfuXwo
 /BJHYr+T
X-Proofpoint-ORIG-GUID: Z1OBCqtS81HxjTSNcENNGRKeOQ0QzPO9
X-Proofpoint-GUID: 4pnWswYamnTcgbcPVqCp3LQWR1ph9h16
X-Authority-Analysis: v=2.4 cv=evffzppX c=1 sm=1 tr=0 ts=68ae972b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=7CQSdrXTAAAA:8 a=KByoUL483hSIROooWq4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_222721_654115_E5DF9CDD 
X-CRM114-Status: GOOD (  28.26  )
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

T24gOC8yNi8yNSAxNTo0MywgTWFyayBSdXRsYW5kIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDEzLCAy
MDI1IGF0IDA2OjAxOjEwUE0gKzAxMDAsIFJvYmluIE11cnBoeSB3cm90ZToKPj4gT25seSBhIGhh
bmRmdWwgb2YgQ1BVIFBNVXMgYWNjZXB0IFBFUkZfVFlQRV97UkFXLEhBUkRXQVJFLEhXX0NBQ0hF
fQo+PiBldmVudHMgd2l0aG91dCByZWdpc3RlcmluZyB0aGVtc2VsdmVzIGFzIFBFUkZfVFlQRV9S
QVcgaW4gdGhlIGZpcnN0Cj4+IHBsYWNlLiBBZGQgYW4gZXhwbGljaXQgb3B0LWluIGZvciB0aGVz
ZSBzcGVjaWFsIGNhc2VzLCBzbyB0aGF0IHdlIGNhbgo+PiBtYWtlIGxpZmUgZWFzaWVyIGZvciBl
dmVyeSBvdGhlciBkcml2ZXIgKGFuZCBwcm9iYWJseSBhbHNvIHNwZWVkIHVwIHRoZQo+PiBzbG93
LXBhdGggc2VhcmNoKSBieSBoYXZpbmcgcGVyZl90cnlfaW5pdF9ldmVudCgpIGRvIHRoZSBiYXNp
YyB0eXBlCj4+IGNoZWNraW5nIHRvIGNvdmVyIHRoZSBtYWpvcml0eSBvZiBjYXNlcy4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiAKPiAK
PiBUbyBiaWtlc2hlZCBhIGxpdHRsZSBoZXJlLCBJJ20gbm90IGtlZW4gb24gdGhlIFBFUkZfUE1V
X0NBUF9SQVdfRVZFTlRTCj4gbmFtZSwgYmVjYXVzZSBpdCdzIG5vdCBjbGVhciB3aGF0ICJSQVci
IHJlYWxseSBtZWFucywgYW5kIHBlb3BsZSB3aWxsCj4gZGVmaW5pdGVseSByZWFkIHRoYXQgdG8g
bWVhbiBzb21ldGhpbmcgZWxzZS4KPiAKPiBDb3VsZCB3ZSBnbyB3aXRoIHNvbWV0aGluZyBsaWtl
IFBFUkZfUE1VX0NBUF9DT01NT05fQ1BVX0VWRU5UUywgdG8gbWFrZQo+IGl0IGNsZWFyIHRoYXQg
dGhpcyBpcyBhYm91dCBvcHRpbmcgaW50byBDUFUtUE1VIHNwZWNpZmljIGV2ZW50IHR5cGVzIChv
Zgo+IHdoaWNoIFBFUkZfVFlQRV9SQVcgaXMgb25lIG9mKT8KPiAKPiBMaWtld2lzZSwgcy9pc19y
YXdfcG11KCkvcG11X3N1cHBvcnRzX2NvbW1vbl9jcHVfZXZlbnRzKCkvLgo+IAo+PiAtLS0KPj4K
Pj4gQSBmdXJ0aGVyIHBvc3NpYmlsaXR5IGlzIHRvIGF1dG9tYXRpY2FsbHkgYWRkIHRoZSBjYXAg
dG8gUEVSRl9UWVBFX1JBVwo+PiBQTVVzIGluIHBlcmZfcG11X3JlZ2lzdGVyKCkgdG8gaGF2ZSBh
IHNpbmdsZSBwb2ludC1vZi11c2UgY29uZGl0aW9uOyBJJ20KPj4gdW5kZWNpZGVkLi4uCj4gCj4g
SSByZWNrb24gd2UgZG9uJ3QgbmVlZCB0byBhdXRvbWFnaWNhbGx5IGRvIHRoYXQsIGJ1dCBJIHJl
Y2tvbiB0aGF0Cj4gaXNfcmF3X3BtdSgpL3BtdV9zdXBwb3J0c19jb21tb25fY3B1X2V2ZW50cygp
IHNob3VsZCBvbmx5IGNoZWNrIHRoZSBjYXAsCj4gYW5kIHdlIGRvbid0IHJlYWQgYW55dGhpbmcg
c3BlY2lhbCBpbnRvIGFueSBvZgo+IFBFUkZfVFlQRV97UkFXLEhBUkRXQVJFLEhXX0NBQ0hFfS4K
PiAKPj4gLS0tCj4+ICBhcmNoL3MzOTAva2VybmVsL3BlcmZfY3B1bV9jZi5jICAgIHwgIDEgKwo+
PiAgYXJjaC9zMzkwL2tlcm5lbC9wZXJmX3BhaV9jcnlwdG8uYyB8ICAyICstCj4+ICBhcmNoL3Mz
OTAva2VybmVsL3BlcmZfcGFpX2V4dC5jICAgIHwgIDIgKy0KPj4gIGFyY2gveDg2L2V2ZW50cy9j
b3JlLmMgICAgICAgICAgICAgfCAgMiArLQo+PiAgZHJpdmVycy9wZXJmL2FybV9wbXUuYyAgICAg
ICAgICAgICB8ICAxICsKPj4gIGluY2x1ZGUvbGludXgvcGVyZl9ldmVudC5oICAgICAgICAgfCAg
MSArCj4+ICBrZXJuZWwvZXZlbnRzL2NvcmUuYyAgICAgICAgICAgICAgIHwgMTUgKysrKysrKysr
KysrKysrCj4+ICA3IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAva2VybmVsL3BlcmZfY3B1bV9jZi5jIGIv
YXJjaC9zMzkwL2tlcm5lbC9wZXJmX2NwdW1fY2YuYwo+PiBpbmRleCAxYTk0ZTA5NDRiYzUuLjc4
MmFiNzU1ZGRkNCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9zMzkwL2tlcm5lbC9wZXJmX2NwdW1fY2Yu
Ywo+PiArKysgYi9hcmNoL3MzOTAva2VybmVsL3BlcmZfY3B1bV9jZi5jCj4+IEBAIC0xMDU0LDYg
KzEwNTQsNyBAQCBzdGF0aWMgdm9pZCBjcHVtZl9wbXVfZGVsKHN0cnVjdCBwZXJmX2V2ZW50ICpl
dmVudCwgaW50IGZsYWdzKQo+PiAgLyogUGVyZm9ybWFuY2UgbW9uaXRvcmluZyB1bml0IGZvciBz
MzkweCAqLwo+PiAgc3RhdGljIHN0cnVjdCBwbXUgY3B1bWZfcG11ID0gewo+PiAgCS50YXNrX2N0
eF9uciAgPSBwZXJmX3N3X2NvbnRleHQsCj4+ICsJLmNhcGFiaWxpdGllcyA9IFBFUkZfUE1VX0NB
UF9SQVdfRVZFTlRTLAo+PiAgCS5wbXVfZW5hYmxlICAgPSBjcHVtZl9wbXVfZW5hYmxlLAo+PiAg
CS5wbXVfZGlzYWJsZSAgPSBjcHVtZl9wbXVfZGlzYWJsZSwKPj4gIAkuZXZlbnRfaW5pdCAgID0g
Y3B1bWZfcG11X2V2ZW50X2luaXQsCj4gCj4gVGFuZ2VudGlhbCwgYnV0IHVzZSBvZiBwZXJmX3N3
X2NvbnRleHQgaGVyZSBsb29rcyBib2d1cy4KPiAKCkl0IG1pZ2h0IGxvb2sgc3RyYW5nZSwgYnV0
IGl0IHdhcyBkb25lIG9uIHB1cnBvc2UuIEZvciBkZXRhaWxzIHNlZQpjb21taXQgOTI1NGU3MGM0
ZWYxICgiczM5MC9jcHVtX2NmOiB1c2UgcGVyZiBzb2Z0d2FyZSBjb250ZXh0IGZvciBoYXJkd2Fy
ZSBjb3VudGVycyIpCgpCYWNrZ3JvdW5kIHdhcyBhIFdBUk5fT04oKSBzdGF0ZW1lbnQgd2hpY2gg
ZmlyZWQsIGJlY2F1c2Ugc2V2ZXJhbCBQTVUgZGV2aWNlIGRyaXZlcnMKZXhpc3RlZCBpbiBwYXJh
bGxlbCBvbiBzMzkweCBwbGF0Zm9ybS4KTm90IHN1cmUgaWYgdGhpcyBjb25kaXRpb24gaXMgc3Rp
bGwgdHJ1ZSBhZnRlciBhbGwgdGhlc2UgeWVhcnMuLi4KCi0tIApUaG9tYXMgUmljaHRlciwgRGVw
dCAzMzAzLCBJQk0gczM5MCBMaW51eCBEZXZlbG9wbWVudCwgQm9lYmxpbmdlbiwgR2VybWFueQot
LQpJQk0gRGV1dHNjaGxhbmQgUmVzZWFyY2ggJiBEZXZlbG9wbWVudCBHbWJICgpWb3JzaXR6ZW5k
ZXIgZGVzIEF1ZnNpY2h0c3JhdHM6IFdvbGZnYW5nIFdlbmR0CgpHZXNjaMOkZnRzZsO8aHJ1bmc6
IERhdmlkIEZhbGxlcgoKU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBCw7ZibGluZ2VuIC8gUmVnaXN0
ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBTdHV0dGdhcnQsIEhSQiAyNDMyOTQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxp
bmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
