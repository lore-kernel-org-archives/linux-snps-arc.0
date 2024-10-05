Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498CDCF8878
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Oct 2024 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zezNS7Ubr8S+uRW3PGynj1voPntsv0RazmrDOOQlU6E=; b=omCM0dyZtMX4cOzIdWsEFPUeAn
	Sjp1A1EshFgN7JHeiEme9oXn9Oy6jNAl1Ob8XkSGU+r3ua3j4JtGsA8JywWLI45rCJAx+rm9SzZS/
	p6e/WR/3RlKMFYMb9ssjWBbWrQHc0SDG9WeNLTqmRYSBHgaJuei4N2g6oAe163Lj2gMZmYhhvmqbK
	te+OjIOMKAMMc6vCJLH0AXlX+xWhAMn1Ha3Ebm2xOcVsNVIvBX2ZelrYpS8gfIa86ntCJfeqZBBT/
	qJuO6B9liF57d4rZquaCiVijgJSV5BGYe/+oXRDFE4AYBhif/zcYXElki7STwayr1TF5u9uM38/2w
	iOXOhlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx53r-0000000FPen-1L4F;
	Sat, 05 Oct 2024 13:43:07 +0000
Received: from fmfe06.freemail.hu ([46.107.16.199] helo=smtp-out.freemail.hu)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx53n-0000000FPeG-1xEp
	for linux-snps-arc@lists.infradead.org;
	Sat, 05 Oct 2024 13:43:05 +0000
Received: from [192.168.0.16] (catv-178-48-208-49.catv.fixed.vodafone.hu [178.48.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4XLRSB17Ftz6bx;
	Sat, 05 Oct 2024 15:42:50 +0200 (CEST)
Message-ID: <aadacd1c-f9e4-4b88-ac03-b522b6c43761@freemail.hu>
Date: Sat, 5 Oct 2024 15:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arc: rename aux.h to arc_aux.h
To: Shahab Vahedi <list+bpf@vahedi.org>, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <vineet.gupta@linux.dev>, abrodkin@synopsys.com
References: <2d28065c-1536-44f1-9132-3d6922c09ca2@freemail.hu>
 <397dbb19cf2e951a4d24772ca26c836d682e69bf@vahedi.org>
Content-Language: hu
From: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>
In-Reply-To: <397dbb19cf2e951a4d24772ca26c836d682e69bf@vahedi.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1728135770;
 
	s=20181004; d=freemail.hu;
 
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 
	l=1066; bh=kBLLQvjRQQTE73+0jE8N+vnMomA4wUfNdJ1gL7v8fHA=;
 
	b=S3+jhfhIwJuX7Om+kJkjVCj0uACSSGLpQ9lh2B3JTRx0rkM9qpPAHiF/MrkGPAro
 
	RFCs+AWbYuLR92oFJqIy4u6kJHVXiHL6Qm+myF7CscDWrMClAmW2wPS5aEVHuID6Gvh
 
	knXDnVbLo1OkLUlsR7S/Zo54ogD6khGWw3gce0ZJ4HGXkjETLp9I1FR6faey9UflELI
 
	AECl4RkrJES15B1BEMwFfZ0mLjhXVwOFF9pytIlNK/CyRZRQC2IL+s1AIbcyOiDaqjq
 
	wPlUmxE8MNZ3EDeyvs7oG0VqIjCAR2Mt3DmJcSQnheGBRCD9+npR9Qx5FYcLr7CnhYv
 
	LRnGvZiLwA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_064303_714688_23C44612 
X-CRM114-Status: UNSURE (   8.87  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

MjAyNC4gMDkuIDI1LiAxMDo0OCBrZWx0ZXrDqXNzZWwsIFNoYWhhYiBWYWhlZGkgw61ydGE6Cj4g
K0FkZCBWaW5lZXQgKHdpdGggdGhlIHJpZ2h0IGFkZHJlc3MpCj4gK1VwZGF0ZSBBbGV4ZXkncyBh
ZGRyZXNzIHRvIGJ1c2luZXNzIGluc3RhbmNlCj4gCj4gU2VwdGVtYmVyIDIzLCAiU3rFkWtlIEJl
bmphbWluIiB3cm90ZToKPiAKPj4gTG9uZyB0aW1lIGFnbyBpIHN1Ym1pdHRlZCBhIHBhdGNoLCB3
aGVuIGl0IHdpbGwgYmUgcmV2aWV3ZWQ/IElzIHRoZXJlIGFueSBhY3Rpdml0aWVzIGhlcmUgaW4g
dGhlIHN5bm9wc3lzL0FSQyBrZXJuZWwgbGlzdD8KPj4KPj4gICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1zbnBzLWFyYy8yMDI0MDUyMDE0MjY0Ny43MDQ0MC0xLWVneXN6ZXJlZ3lAZnJl
ZW1haWwuaHUvVC8jdQo+PiAgIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9s
aW51eC1hcmMvcGF0Y2gvMjAyNDA1MjAxNDI2NDcuNzA0NDAtMS1lZ3lzemVyZWd5QGZyZWVtYWls
Lmh1Lwo+IAo+IFRoZXkgbG9vayBnb29kIHRvIG1lLiBUaGFuayB5b3UgU3rFkWtlIQo+IAo+IFJl
dmlld2VkLWJ5OiBTaGFoYWIgVmFoZWRpIDxsaXN0K2JwZkB2YWhlZGkub3JnPgo+IAo+IENoZWVy
cywKPiBTaGFoYWIKClBsZWFzZSB1cGRhdGUgdGhlIGUtbWFpbCBhZGRyZXNzZXMgaW4gdGhlIE1B
SU5UQUlORVJTIGxpc3Qgb2YgTGludXgga2VybmVsLgpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFs
ZHMvbGludXgvYmxvYi9tYXN0ZXIvTUFJTlRBSU5FUlMjTDIyMzc5CgpXaGljaCByZXBvIGlzIHRv
IHVzZSBmb3IgbWFrZSBhbmQgc2VuZCBwYXRjaGVzPyBJbiB0aGUgTUFJTlRBSU5FUlMgZmlsZSBv
ZiBMaW51eCAKdGhlIGZvbGxvd2luZyB3YXMgbWVudGlvbmVkLCBidXQgc2luY2UgMjAyMyB0aGVy
ZSBhcmUgbm8gYW55IG5ldyBjb21taXQgaW4gaXQgCmFucyBzdGlsbCBoYXMgbm8gYnJhbmNoIGZv
ciBsYXRlc3QgTGludXgga2VybmVscy4KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdmd1cHRhL2FyYy5naXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
