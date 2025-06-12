Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0723C71149
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2e08f4D5bYHNEFZa2xd0U9cZlhayvXAP1DpKntZ+u4=; b=Up7lfY/7BA0E+7
	lMp6srryrMqsRS+sylZPDDdlGVYNwS2BxckD6omzZFz51raIcI06MATmFsBKKThVhRdQ6UzZnW5B0
	Tr+vfOqM7NgOM5WTNPExo2lyWnGdI2CeWW3zGkCck/nDlHXJ5oMfwq4p+FkM00dGPXcotlpRXXi1w
	JiARGCiG9ucbqKYXxr42JR3B76oLFk68BjV9aCZ5pAdb1VTvwuFkS2OC+Tw/QANUqZvO2nTkhRLlD
	PZCz/zYPf8ePjtOjegJdxpcoBQCO+BgMF57xuEWcmDeHUHeQ2vypdsq5Prmm2jwPs+TInRgEgij3P
	avF/LFkFoWCCQIQDFrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsT-0000000EMNd-2WfL;
	Thu, 12 Jun 2025 19:46:21 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkXQ-0000000Duht-0bNC
	for linux-snps-arc@lists.infradead.org;
	Thu, 12 Jun 2025 16:12:25 +0000
Message-ID: <755cf90e-acf5-46d1-9ac4-2ea06c93e873@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749744734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wf6edq/KAq3HGPYGLrCGiQwCp9O3FQOz/ZxfLHqxjnQ=;
	b=Mv39LFn8I5zouEC0f5T5xA7Xv20Js1UKmX9aq967+MLRIlPdA0S9b4I6NAKjg4UhnCp1Aq
	9bjf3Ohzf2I6+9qkAmCcwwuAyj7Wlg8zTKUzI3WYwgKOg19uS2u9+WI25/4r3VQwyBp336
	L82OKqGzbTX+EFofYeDNXIjZEm+r4KE=
Date: Thu, 12 Jun 2025 09:12:09 -0700
MIME-Version: 1.0
Subject: Re: [GIT PULL] ARC updates for 6.16
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Vineet Gupta <vgupta@kernel.org>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
 <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_091224_381496_ECA222EF 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

CgpPbiA2LzEyLzI1IDA4OjI2LCBMaW51cyBUb3J2YWxkcyB3cm90ZToKPiBPbiBXZWQsIDExIEp1
biAyMDI1IGF0IDIwOjI5LCBWaW5lZXQgR3VwdGEgPHZndXB0YUBrZXJuZWwub3JnPiB3cm90ZToK
Pj4gICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdmd1cHRh
L2FyYy5naXQvIHRhZ3MvYXJjLTYuMTYtcmMxCj4gU28gdGhpcyBpcyBzaWduZWQgYW5kIEkgcHVs
bGVkLCBidXQgeW91ciBrZXkgaGFzIGV4cGlyZWQuIEFuZCBJIGRvbid0Cj4gZmluZCBhIG5ldyBr
ZXkgb24ga2VybmVsLm9yZyBvciB0aGUgbm9ybWFsIGtleXNlcnZlcnMuCj4KPiBQbGVhc2UgZG9u
J3QgcHV0IGV4cGlyYXRpb24gZGF0ZXMgb24geW91ciBrZXlzIGFuZCB0aGVuIG5vdCByZWZyZXNo
Cj4gdGhlbS4gT3IgdGVsbCBtZSB3aGVyZSB0byBmaW5kIHVwZGF0ZWQga2V5Ly4KClNvcnJ5IGFi
b3V0IHRoaXMgYW5kIHRoeCBmb3IgcHVsbGluZyBhbnl3YXlzLgoKQmFjayB3aGVuIGlpIGhhZCBo
YXBwZW5lZCBJIGRpZCBleHRlbmQgdGhlIGRhdGUgb24gdGhlIGtleSBhbmQgQUZBSUtSIGRpZAot
LXNlbmQta2V5cyB0byBwZ3AubWl0LmVkdQpJJ3ZlIHJlZG9uZSB0aGlzIGFuZCB0b2RheSBhbHNv
IHNlbnQgaXQgb3ZlciBmb3IgaW5jbHVzaW9uIGludG8ga2VybmVsLm9yZyBwZ3AgcmVwby4KCnB1
YsKgwqAgcnNhNDA5NiAyMDEzLTAyLTE2IFtTQ10gW2V4cGlyZXM6IDIwMjktMTItMDhdCsKgwqDC
oMKgwqAgMzk3QTZFMEFFNDdBODVFNzZCNzRCMDg5NjlEN0YxRERFMjhBQzI1RQp1aWTCoMKgwqDC
oMKgwqDCoMKgwqDCoCBbIHVua25vd25dIFZpbmVldCBHdXB0YSAoa2VybmVsKSA8dmd1cHRhQGtl
cm5lbC5vcmc+CnVpZMKgwqDCoMKgwqDCoMKgwqDCoMKgIFsgdW5rbm93bl0gVmluZWV0IEd1cHRh
IChsaW51eCkgPHZpbmVldC5ndXB0YUBsaW51eC5kZXY+CnVpZMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFsgdW5rbm93bl0gVmluZWV0IEd1cHRhIChwZXJzb25hbCkgPHZpbmVldGc3NkBnbWFpbC5jb20+
CnVpZMKgwqDCoMKgwqDCoMKgwqDCoMKgIFsgdW5rbm93bl0gVmluZWV0IEd1cHRhIChhbGlhcykg
PHZndXB0YUBzeW5vcHN5cy5jb20+CnVpZMKgwqDCoMKgwqDCoMKgwqDCoMKgIFsgdW5rbm93bl0g
VmluZWV0IEd1cHRhIChvZmZpY2lhbCkgPHZpbmVldC5ndXB0YTFAc3lub3BzeXMuY29tPgp1aWTC
oMKgwqDCoMKgwqDCoMKgwqDCoCBbIHVua25vd25dIFtqcGVnIGltYWdlIG9mIHNpemUgMjQ0NTJd
CgoKVGh4LAotVmluZWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
