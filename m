Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3853C4345F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Apr 2024 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpbK1yy9Bb7vpxWr3Hz8zaU1SztB/9lubB692M9vgCM=; b=PY9j/3hplYBCRQ
	c2zErhjIEaNiuArtROGG+Tfw7+HAJu8imjgHi5RC5K+KJhAVLDV6QDr7RoCKsZnqbds8AdTr/rdtM
	J9HBUP/0wfJM7OPWWd5Pqi6QFs6yy1dOxyNR2oWhpZWEEDz+EqKBHCBSAHR6eNY330Yg38RzL2um6
	Yu4cPy6h4vOa63zugRO3Ak1EM+jABrAVOuZkJAM201ZeAQD5AX1xSP+bv6UL64RhiXmxEXGZVDdi3
	UftqavQai2AbYn9TMOct+97ygVRp4cJdgi3vohjuQaJsCYgWe4nSA3hFUR0DhiSxVcZt4ZRCrKjIj
	ps1pPgo1S9Zf7wVPgrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oyt-00000006xYa-1ASv;
	Tue, 30 Apr 2024 15:01:19 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oyq-00000006xX4-1I2O
	for linux-snps-arc@lists.infradead.org;
	Tue, 30 Apr 2024 15:01:18 +0000
Message-ID: <e9227088-f14a-4357-b0f1-b85a8403fa37@vahedi.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1714489270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtqyUjdRXozzH7nyko5UQ3YSlUhCAxwbk5121nS0yvk=;
	b=pgu64DxqY9MRs/eqLmRps/FEGjwkw9iB04s3QaDl/VHBLXQ7siv+QLgCu07P+PliLU1D1W
	wy+cFfxIDX7uTWmfxnz1jHHQkSvEzcAXItPx83wQL2lrZVVo+1G8KBvuWkYiY9k8pGyZfO
	4CbSOi4NrpEzy/ka50mqGPuk71jKM+ofkg0aq480Gf5BPEro2t1ZkIMl9VBglGIrSdQ6Sa
	Nfedmqzy7oKq/vW649bKfXX00/RqzsjBdrUNDjLGWWL4pnMYXSRiJ6FbSXofa9Vs1BatcA
	sfU3lZ/VKVf3W/OwiHc1WD2I3e/7qwEuib1Y50QFdtbVkBnrcSpoTzGIBJATsQ==
Date: Tue, 30 Apr 2024 17:01:06 +0200
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1] ARC: Add eBPF JIT support
To: Shahab Vahedi <list+bpf@vahedi.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <vgupta@kernel.org>
References: <20240213131946.32068-1-list+bpf@vahedi.org>
 <87ttlnqlmv.fsf@all.your.base.are.belong.to.us>
 <6e4cf7cc-6a2e-4396-b0d5-01ff10d6923a@vahedi.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shahab Vahedi <list+bpf@vahedi.org>
In-Reply-To: <6e4cf7cc-6a2e-4396-b0d5-01ff10d6923a@vahedi.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_080116_569395_B228E308 
X-CRM114-Status: UNSURE (   5.68  )
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

U2hhaGFiIFZhaGVkaSB3cml0ZXM6Cj4gCj4gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9y
Zz4gd3JpdGVzOgo+Pgo+PiBQbGVhc2UgdHJ5IHRvIGF2b2lkIHN0YXRpYyBpbmxpbmUgaW4gdGhl
IEMtZmlsZXMuIFRoZSBjb21waWxlciB1c3VhbGx5Cj4+IGtub3dzIGJldHRlci4KPiAKPiBJIHdp
bGwgcmVwbGFjZSB0aGVtIHdpdGggInN0YXRpYyIgdGhlbi4KCkkgaGF2ZSB0cmllZCBbMV0gdGhp
cyBhbmQgdGhlIHRlc3QgZXhlY3V0aW9uIHRpbWUgdG9vayBhIHBlcmZvcm1hbmNlIGhpdCBvZgoz
NSUuIFRoZXJlZm9yZSwgSSBoYXZlIG5vdCBpbmNsdWRlZCBpdCBpbiB0aGUgcmV3b3JrIFsyXS4K
CgpDaGVlcnMsClNoYWhhYgoKWzFdIEdDQyBjb25maWd1cmF0aW9uIHVzZWQgZm9yIGJ1aWxkaW5n
IHRoZSBMaW51eCBpbWFnZQoiR0NDIDEyLjIuMSAyMDIzMDMwNiIgd2l0aCAzIGRpZmZlcmVudCBv
cHRpbWlzYXRpb25zOiAiLU97MiwzLGd9IgoKWzJdIFtQQVRDSCBicGYtbmV4dCB2Ml0gQVJDOiBB
ZGQgZUJQRiBKSVQgc3VwcG9ydApodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNDA0MzAx
NDU2MDQuMzg1OTItMS1saXN0K2JwZkB2YWhlZGkub3JnLwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
