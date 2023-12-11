Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42041C4167B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Dec 2023 17:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNisRH6IrHYxDNs9+IJp41kbPHbTl0ycai3C2oF8Nxg=; b=f4L6RgzbdDuu57
	w66exXDw0d0bB3YEQXsy/W/F3RHanrx1LpppKq947vxdMncm85jP1NtnUIE/1Mk+YnIo6z95smmDD
	AjdnkdF/XyITOKue+GEXLttdhW1mmMF+cGgFlGlWrjowpzxZqkuZwya6xXYY9Jgtd4AiYrxNpLf2u
	2kt9ZO41KbRDZ46C7J7V+u7P+HlpVYsEd/1SK0vAvJA+ABMYD3wr45+wi9IudPzCd2tJjSPXuHES4
	V1CB4sufRUXZihcuMbpLQqNRxKjIbB9rn/l5f6GkEgz1vr0vyh6QGZ/9Lntw0hgaRAwEssySA7+dr
	sGA6yWKXHFg3Jyp8EaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkEw-006PRo-3A;
	Mon, 11 Dec 2023 17:38:46 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkEu-006POD-19
	for linux-snps-arc@lists.infradead.org;
	Mon, 11 Dec 2023 17:38:45 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBH6dL6029061;
	Mon, 11 Dec 2023 09:38:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	pfptdkimsnps; bh=l+kpSoS+PY72igUtxxPDUvvI4e9L7a6PJQDcJzTFarQ=; b=
	q5QYyErPlMHWcSYMM924Zi/VgHw657p2qE+UKjmvrGkbwGl+rkP3uJVO3HxcmX48
	PjhoIpzsgxpIAnYzzNDfhRYSwWiA3Nmpe5BJSTGeH09z5LhCg1oahGRco6DbAPfH
	y1i+vvAilTRq38aNkUL3CSOk1PDxNEg6tKV5PN5zanF2ouKG4wj2pIqRvOoDfypX
	S5ae/OoxhB3xDSFXnPhaBqLFT9tGKhBPERCme+9XduUNBNTglAYHAojX8wc4XCbS
	+iXjasOdIvswXlQkbGNCVFkCIz6tVcL7jEBRl3RAPn+CCwTtTSxN9cy2+7daysyy
	MgfvPj1CIfaDdJrFUO9CfA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3uvrc57edn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 09:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1702316317; bh=JNUrErkUi2w7A6JLLzwoHbrjSIgvAqABYx3IioDXalA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZDCqz2fBxFMPixxGYM3XvHyL6UFp9L7okEiXxBzvRNcY9E1wBzz4lcaMQaMLUWIUt
	 Fwh4ZNQBL3Le+mGdQSwCafHb6n+syxZ8mvzBSxG+ieVMsKRJgQCwPhcXssY14JO7OF
	 LDd8plQ1gargbMkKqwlnSq+sBvbwrLrAZEWAMl4Bevfd+8DVNWF//k47L9hLRwp+73
	 QjDuQi3/CMTHhL9nDotFz2yje2bOgVeFR9ImTdfil02gsSHZgfa7TTxnADDZgHHr6Z
	 Gk+6rYKQR6giqg1B+04ajTfpDtzYwNf2CZvTTCEyjN8f5endeo/RIM+raNT3zBBbyU
	 tJKcivJsKgT8g==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 581DA40528;
	Mon, 11 Dec 2023 17:38:36 +0000 (UTC)
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.104.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 23388A0091;
	Mon, 11 Dec 2023 17:38:34 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel.Kozlov@synopsys.com
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] ARC updates
Date: Mon, 11 Dec 2023 21:38:20 +0400
Message-Id: <20231211173820.30330-1-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231209003307.480051-1-vgupta@kernel.org>
References: <20231209003307.480051-1-vgupta@kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 3kUDZ4YFpW3-JLE8akvzP_khzdMzivjX
X-Proofpoint-GUID: 3kUDZ4YFpW3-JLE8akvzP_khzdMzivjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312110145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_093844_441430_4AF9624E 
X-CRM114-Status: GOOD (  14.36  )
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

SGkgVmluZWV0LAoKPiBBIHBpbGUgb2YgYWNjcnVlZCBjaGFuZ2VzLCBjb21waWxlIHRlc3RlZCBv
bmx5Lgo+IFBsZWFzZSB0ZXN0LgoKPiBUaHgsCj4gLVZpbmVldAoKSSdtIHRlc3RpbmcgeW91IHBh
dGNoZXMuIEF0IGZpcnN0IGdsYW5jZSBldmVyeXRoaW5nIGlzIGZpbmUsIG5vIG9idmlvdXMKcmVn
cmVzc2lvbnMuCgpCdXQgSSd2ZSBmb3VuZCBhbiBBUkMgYnVpbGQgaXNzdWUgd2l0aCB0aGUgbGF0
ZXN0IHVwc3RyZWFtIHNvdXJjZQoodGFnOiB2Ni43LXJjNSkuIEl0IGlzIG5vdCBsaW5rZWQgd2l0
aCB5b3VyIHVwZGF0ZXMuClRoZSBidWlsZCBpc3N1ZSBvY2N1cnMgd2hlbiB0aGUgQ09ORklHX1RS
QU5TUEFSRU5UX0hVR0VQQUdFIG9wdGlvbgppcyBlbmFibGVkOgoKfCAuLi9mcy9wcm9jL3Rhc2tf
bW11LmM6IEluIGZ1bmN0aW9uIOKAmHBhZ2VtYXBfc2Nhbl90aHBfZW50cnnigJk6CnwgLi4vZnMv
cHJvYy90YXNrX21tdS5jOjIxMTU6Mjg6IGVycm9yOiDigJhIUEFHRV9TSVpF4oCZIHVuZGVjbGFy
ZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmFBBR0VfU0la
ReKAmT8KfCAgMjExNSB8ICAgICAgICAgaWYgKGVuZCAhPSBzdGFydCArIEhQQUdFX1NJWkUpIHsK
fCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KfCAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfU0laRQp8IC4uL2ZzL3Byb2MvdGFza19t
bXUuYzoyMTE1OjI4OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRl
ZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgp8IG1ha2VbNF06ICoq
KiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNDM6IGZzL3Byb2MvdGFza19tbXUub10gRXJy
b3IgMQp8IG1ha2VbM106ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0ODA6IGZzL3By
b2NdIEVycm9yIDIKCk1heSBiZSB5b3UgY291bGQgYWRkcmVzcyB0aGlzIGlzc3VlIGluIHlvdXIg
dXBkYXRlcyB0b28/CgpUaGFua3MKUGF2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBz
LWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
