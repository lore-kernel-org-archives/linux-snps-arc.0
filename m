Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9188CFB44D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Oct 2024 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhzYG6yn4pC7bn6wtRFTTr7v/Xjr8o/vmabr6flUwPE=; b=E2mhpPSIk4+qpq
	JxCVDRVxVR0WiahPJXZIKK+AkPSMp3WUwgFVvFYRKPbsmlMS5eVL9nFoyTKxwTYJmF9nx7EUQ1s5C
	nLGwMmcp29djO0fZjF3WHJ9LXrW94FKGfgqqflT9eeK+xTnVG14pmL3fKfY0MEUkcbWz/G1ZNWHw8
	GfS13s926OO/k5UqU0GFUbXjJO53M1LF0lAgEJkwVIlRVxHtL9nozflkAi+44eOB+zLR9KKcWtSwD
	PtPC5aPnOkpfPyPEZzkhVCSSFd0/6bywukhVmC5ylbxr0lTN6bP/zYoBIVDb2o41nWPS1s5ldYC9C
	i7XvBBwZonpZujqa6Evw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqt8-00000003DR7-1TZx;
	Mon, 07 Oct 2024 16:47:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqrv-00000003CzO-05Ht
	for linux-snps-arc@lists.infradead.org;
	Mon, 07 Oct 2024 16:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB32F5C0703;
	Mon,  7 Oct 2024 16:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F590C4CEC6;
	Mon,  7 Oct 2024 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728319557;
	bh=gC/TN7vL8i1LkuCQaEaPDbNbUDRa/rDtkXLXrG4H28k=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=jxpnEt50jzY5xwyHV40FN0GNcyG76jLKyBZ9K56Ab58tp6PwyRaHl6qrTMt6VGq4U
	 fSp+QeivXBbLNUMLvXA8Efn5kPAZq/UddWDa+LEm3SQn54hK45YFLqcPpc9bevx7d7
	 xEJ4MrwbXWxupIYeHrYGZYoOMg1LqnFVQMYeWXoQwckotMy9kFHdQk2GIU5DfK+H+h
	 As4/1noQDcSzFNjhNdjiM1k/qkTAs69h+wpYdNzjD5pvzOFFJNCjigog+fKnIB1y1a
	 xokVp4LoxIz75dgrYxAyxyCvvAkLqJL07Sh/G9AMvFfYXmWYm/fl/XfY3DyLbSPtiZ
	 kXdIvkxvm9XSg==
Message-ID: <f8855a99-15e6-47af-a1e5-bbd20648c801@kernel.org>
Date: Mon, 7 Oct 2024 09:45:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arc: rename aux.h to arc_aux.h
To: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>,
 Shahab Vahedi <list+bpf@vahedi.org>, linux-snps-arc@lists.infradead.org,
 abrodkin@synopsys.com, Shahab Vahedi <list+bpf@vahedi.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <2d28065c-1536-44f1-9132-3d6922c09ca2@freemail.hu>
 <397dbb19cf2e951a4d24772ca26c836d682e69bf@vahedi.org>
 <aadacd1c-f9e4-4b88-ac03-b522b6c43761@freemail.hu>
 <7686811a-7a70-4f56-b43d-175ba8fce985@kernel.org>
 <c803e9b3-5203-4993-98d2-2ecd95ac3c53@freemail.hu>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <c803e9b3-5203-4993-98d2-2ecd95ac3c53@freemail.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_094559_172337_1E1EEF2E 
X-CRM114-Status: GOOD (  22.67  )
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

T24gMTAvNy8yNCAwNTowNCwgU3rFkWtlIEJlbmphbWluIHdyb3RlOgo+IDIwMjQuIDEwLiAwNS4g
MjE6NDAga2VsdGV6w6lzc2VsLCBWaW5lZXQgR3VwdGEgw61ydGE6Cj4+IE9uIDEwLzUvMjQgMDY6
NDEsIFN6xZFrZSBCZW5qYW1pbiB3cm90ZToKPj4+IDIwMjQuIDA5LiAyNS4gMTA6NDgga2VsdGV6
w6lzc2VsLCBTaGFoYWIgVmFoZWRpIMOtcnRhOgo+Pj4+ICtBZGQgVmluZWV0ICh3aXRoIHRoZSBy
aWdodCBhZGRyZXNzKQo+Pj4+ICtVcGRhdGUgQWxleGV5J3MgYWRkcmVzcyB0byBidXNpbmVzcyBp
bnN0YW5jZQo+Pj4+Cj4+Pj4gU2VwdGVtYmVyIDIzLCAiU3rFkWtlIEJlbmphbWluIiB3cm90ZToK
Pj4+Pgo+Pj4+PiBMb25nIHRpbWUgYWdvIGkgc3VibWl0dGVkIGEgcGF0Y2gsIHdoZW4gaXQgd2ls
bCBiZSByZXZpZXdlZD8gSXMgdGhlcmUgYW55IGFjdGl2aXRpZXMgaGVyZSBpbiB0aGUgc3lub3Bz
eXMvQVJDIGtlcm5lbCBsaXN0Pwo+Pj4+Pgo+Pj4+PiAgICBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1zbnBzLWFyYy8yMDI0MDUyMDE0MjY0Ny43MDQ0MC0xLWVneXN6ZXJlZ3lAZnJlZW1h
aWwuaHUvVC8jdQo+Pj4+PiAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
bGludXgtYXJjL3BhdGNoLzIwMjQwNTIwMTQyNjQ3LjcwNDQwLTEtZWd5c3plcmVneUBmcmVlbWFp
bC5odS8KPj4+PiBUaGV5IGxvb2sgZ29vZCB0byBtZS4gVGhhbmsgeW91IFN6xZFrZSEKPj4+Pgo+
Pj4+IFJldmlld2VkLWJ5OiBTaGFoYWIgVmFoZWRpIDxsaXN0K2JwZkB2YWhlZGkub3JnPgo+Pj4+
Cj4+Pj4gQ2hlZXJzLAo+Pj4+IFNoYWhhYgo+Pj4gUGxlYXNlIHVwZGF0ZSB0aGUgZS1tYWlsIGFk
ZHJlc3NlcyBpbiB0aGUgTUFJTlRBSU5FUlMgbGlzdCBvZiBMaW51eCBrZXJuZWwuCj4+PiBodHRw
czovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvTUFJTlRBSU5FUlMjTDIy
Mzc5Cj4+Pgo+Pj4gV2hpY2ggcmVwbyBpcyB0byB1c2UgZm9yIG1ha2UgYW5kIHNlbmQgcGF0Y2hl
cz8gSW4gdGhlIE1BSU5UQUlORVJTIGZpbGUgb2YgTGludXgKPj4+IHRoZSBmb2xsb3dpbmcgd2Fz
IG1lbnRpb25lZCwgYnV0IHNpbmNlIDIwMjMgdGhlcmUgYXJlIG5vIGFueSBuZXcgY29tbWl0Cj4+
IFRoZSBlQlBGIGppdCB3ZW50IGludG8gQVJDIHBvcnQgMjAyNCwgYW5kIGl0IGNhbid0IGxhbmQg
dmlhIHRoZSBBUkMgdHJlZS4KPj4gUGxlYXNlIHRyeSBzZWFyY2hpbmcgcHJvcGVybHkgYmVmb3Jl
IHB1dHRpbmcgcmFuZG9tIHN0dWZmIG91dCB0aGVyZS4KPj4KPj4gQlRXIHdoYXQgZXhhY3RseSBp
cyB5b3VyIHJhbnQgYWJvdXQuIFRoZSBmaWxlIHJlbmFtZSBwYXRjaCAtIHRvIGFsbG93IGJ1aWxk
aW5nIG9uIHdpbmRvd3MgPyBTZXJpb3VzbHkuCj4+IERvIHlvdSBoYXZlIGEgcmVhbCBwYXRjaCBh
bmQgYXJlIHRyeWluZyB0byBzb2x2ZSBhIHJlYWwgcHJvYmxlbS4KPj4KPj4KPj4+IGluIGl0IGFu
cyBzdGlsbCBoYXMgbm8gYnJhbmNoIGZvciBsYXRlc3QgTGludXgga2VybmVscy4KPj4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3ZndXB0YS9hcmMuZ2l0
Cj4+IFRoYXQgaXMgdGhlIHRyZWUgYW5kIHN0dWZmIGdvZXMgdmlhIGl0Lgo+Pgo+PiAtVmluZWV0
Cj4gR29hbCBpcyB0byBpbXByb3ZlIExpbnV4IGtlcm5lbCBjb2RlYmFzZSB0byBhYmxlIHRvIGRl
dmVsb3AgaW4gYW55IHBsYXRmb3JtIHZpYSAKPiBWUyBjb2RlIChJbnRlbGxpU2Vuc2UgKyByZW1v
dGUgY29tcGlsZXIgb3IgbG9jYWwgY3Jvc3MtY29tcGlsZXIgZm9yIEFSTSBTb0NzKS4KPgo+IElu
IHRoZSBMaW51eCBnaXQgcmVwbyB0cmVlIHRoZXJlIGFyZSB0d28gZHJpdmVyIHNvdXJjZXMgd2hl
cmUgdGhlIGF1eCBmaWxlbmFtZSAKPiBpcyBleGlzdCBmb3IgdGhpcyBpbXByb3ZlbWVudCwgaXQg
bmVlZCB0byBiZSBzb2x2ZWQgd2l0aCByZW5hbWluZy4KPgo+IEluIGRybS9ub3V2ZWF1L2kyYyBk
cml2ZXIsIGF1eCBmaWxlcyB3YXMgYWxyZWFkeSBzb2x2ZWQsIGl0IGlzIG1lcmdlZC4KPiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21pc2Mva2VybmVsLy0vY29tbWl0LzIzMWJi
OWI0YzQyMzk4ZGIzMTE0YzA4N2JhMzliYTAwYzRiN2FjMmMKPgo+IE9ubHkgYXJjIHNvdXJjZXMg
bmVlZCB0byBiZSBmaXhlZCBmaW5hbGx5Lgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9saW51eC1hcmMvcGF0Y2gvMjAyNDA1MjAxNDI2NDcuNzA0NDAtMS1lZ3lzemVyZWd5
QGZyZWVtYWlsLmh1Lwo+Cj4gSXQgaXMgbm90IGEgY3JpdGljYWwgYnVnZml4IGZvciB5b3VyIGNv
bXBhbnkncyBkYWlseSB3b3JrLiBCdXQgaXQgaXMgYW4gb3BlbiAKPiBzb3VyY2Ugb3BlcmF0aW5n
IHN5c3RlbSwgeW91IGhhdmUgdG8gY2FyZSBhYm91dCB0aGlzIGltcHJvdm1lbnQgYWxzbywgaWYg
eW91IGFyZSAKPiBhIG1haW50YWluZXIuCj4KPgo+IFdoeSBpcyBpdCBpbXBvcnRhbnQ/Cj4gQmVj
YXVzZSB5b3VuZyBkZXZlbG9wZXJzIHdpbGwgbmV2ZXIgYmUgd2lsbGluZyB0byBqb2luIGFuZCBj
b250cmlidXRpbmcgaW4gTGludXggCj4ga2VybmVsIGluIHRoZSBmdXR1cmUgaWYgdGhlcmUgYXJl
IG5vIGFueSBoaWdoLXF1YWxpdHkgZWFzeS10by11c2UgSURFIGZvciBMaW51eCAKPiBrZXJuZWwg
Y29kaW5nLgoKRmFpciBlbm91Z2guCkFkZGVkIHRvIGZvci1jdXJyIC0gd2lsbCBiZSBzZW50IExp
bnVzJyBvbmNlIEkgaGF2ZSBhbm90aGVyIHBlbmRpbmcgcGF0Y2ggZ28gdGhydSBzb21lIHRlc3Rp
bmcuCgpUaHggZm9yIHlvdXIgcGF0aWVuY2UuCi1WaW5lZXQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
