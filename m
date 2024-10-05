Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41803CFB42B
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Oct 2024 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERbf9RmpU9ITzhMfEVmxnsUz8IIXjIpQreefz6vnUHY=; b=GAxuPozdBsU1QK
	eSf3Pni2jqETacryFvO5Q9sEVVJnfZn5WRPQgHqDO244XDd3T9IFuC/Eh2sQYXRV81z3CChL6Zv7N
	PxXNg/L7eAHxCD6X5nXZy05hdHXKjvee8lTE4tpxr/f+i7AdjrZ6yK81/imIR/CySoMpiCozYsKpg
	3HJanIdCwqYJjKqvtYhv5CV9ZfsKQ9yz6mSLK8fPJvZZWK5SLbSNh3ZXpfyGHoIjr2yGYtPKbE/dM
	fEc6nSmANtzCgvzM01EaAT5GPDj1OVa/x1TO5j4Eaj0XE70YDrWfuLl12jtJ+lDO0OyMDRAAhZhJL
	ILRnIRQ8yL27R2tGdLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAdy-0000000FoPe-3TuA;
	Sat, 05 Oct 2024 19:40:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAdv-0000000FoPJ-47i4
	for linux-snps-arc@lists.infradead.org;
	Sat, 05 Oct 2024 19:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0581DA40196;
	Sat,  5 Oct 2024 19:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B881C4CEC2;
	Sat,  5 Oct 2024 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728157241;
	bh=OJlIMIdVQBSc5Pq4FZGy6yQS081QxMVzghaCIDVw6JY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=imJSFUa6NzEbUkaJ0sLxT7qd/Z4doeJy3LQbMATyaaRqq1BgkIe+6enPs5hn/h5Ks
	 zyftrdEJryor+ftFcYN5nw/T1h7rwvlPy+pC7DW5zrEP39HhpZSnIzciOdPa3sqNJK
	 XMMFjHusz1d9Izi3M5kz2R/UWFLebXovGSGhPka1Bwv4Cadpsq3yX1glyN7Fx2hnvH
	 yvkFQ9hhVkWuZJFCUuNf2Iu7jbkbno8svq3spiWrCddYWjSUBw38Y9FjmV3ZjzjbZz
	 xTmjXET7ZAKK5ajFbM5lladE9Z0uF7xBNB0C1tXXoQL5px3HDa8M5v89U3GmyQ1pi8
	 oVGiOpJXlEmCw==
Message-ID: <7686811a-7a70-4f56-b43d-175ba8fce985@kernel.org>
Date: Sat, 5 Oct 2024 12:40:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arc: rename aux.h to arc_aux.h
To: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>,
 Shahab Vahedi <list+bpf@vahedi.org>, linux-snps-arc@lists.infradead.org,
 abrodkin@synopsys.com
References: <2d28065c-1536-44f1-9132-3d6922c09ca2@freemail.hu>
 <397dbb19cf2e951a4d24772ca26c836d682e69bf@vahedi.org>
 <aadacd1c-f9e4-4b88-ac03-b522b6c43761@freemail.hu>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <aadacd1c-f9e4-4b88-ac03-b522b6c43761@freemail.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_124044_114134_49228BDD 
X-CRM114-Status: GOOD (  12.72  )
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

T24gMTAvNS8yNCAwNjo0MSwgU3rFkWtlIEJlbmphbWluIHdyb3RlOgo+IDIwMjQuIDA5LiAyNS4g
MTA6NDgga2VsdGV6w6lzc2VsLCBTaGFoYWIgVmFoZWRpIMOtcnRhOgo+PiArQWRkIFZpbmVldCAo
d2l0aCB0aGUgcmlnaHQgYWRkcmVzcykKPj4gK1VwZGF0ZSBBbGV4ZXkncyBhZGRyZXNzIHRvIGJ1
c2luZXNzIGluc3RhbmNlCj4+Cj4+IFNlcHRlbWJlciAyMywgIlN6xZFrZSBCZW5qYW1pbiIgd3Jv
dGU6Cj4+Cj4+PiBMb25nIHRpbWUgYWdvIGkgc3VibWl0dGVkIGEgcGF0Y2gsIHdoZW4gaXQgd2ls
bCBiZSByZXZpZXdlZD8gSXMgdGhlcmUgYW55IGFjdGl2aXRpZXMgaGVyZSBpbiB0aGUgc3lub3Bz
eXMvQVJDIGtlcm5lbCBsaXN0Pwo+Pj4KPj4+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtc25wcy1hcmMvMjAyNDA1MjAxNDI2NDcuNzA0NDAtMS1lZ3lzemVyZWd5QGZyZWVtYWlsLmh1
L1QvI3UKPj4+ICAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LWFy
Yy9wYXRjaC8yMDI0MDUyMDE0MjY0Ny43MDQ0MC0xLWVneXN6ZXJlZ3lAZnJlZW1haWwuaHUvCj4+
IFRoZXkgbG9vayBnb29kIHRvIG1lLiBUaGFuayB5b3UgU3rFkWtlIQo+Pgo+PiBSZXZpZXdlZC1i
eTogU2hhaGFiIFZhaGVkaSA8bGlzdCticGZAdmFoZWRpLm9yZz4KPj4KPj4gQ2hlZXJzLAo+PiBT
aGFoYWIKPiBQbGVhc2UgdXBkYXRlIHRoZSBlLW1haWwgYWRkcmVzc2VzIGluIHRoZSBNQUlOVEFJ
TkVSUyBsaXN0IG9mIExpbnV4IGtlcm5lbC4KPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMv
bGludXgvYmxvYi9tYXN0ZXIvTUFJTlRBSU5FUlMjTDIyMzc5Cj4KPiBXaGljaCByZXBvIGlzIHRv
IHVzZSBmb3IgbWFrZSBhbmQgc2VuZCBwYXRjaGVzPyBJbiB0aGUgTUFJTlRBSU5FUlMgZmlsZSBv
ZiBMaW51eCAKPiB0aGUgZm9sbG93aW5nIHdhcyBtZW50aW9uZWQsIGJ1dCBzaW5jZSAyMDIzIHRo
ZXJlIGFyZSBubyBhbnkgbmV3IGNvbW1pdAoKVGhlIGVCUEYgaml0IHdlbnQgaW50byBBUkMgcG9y
dCAyMDI0LCBhbmQgaXQgY2FuJ3QgbGFuZCB2aWEgdGhlIEFSQyB0cmVlLgpQbGVhc2UgdHJ5IHNl
YXJjaGluZyBwcm9wZXJseSBiZWZvcmUgcHV0dGluZyByYW5kb20gc3R1ZmYgb3V0IHRoZXJlLgoK
QlRXIHdoYXQgZXhhY3RseSBpcyB5b3VyIHJhbnQgYWJvdXQuIFRoZSBmaWxlIHJlbmFtZSBwYXRj
aCAtIHRvIGFsbG93IGJ1aWxkaW5nIG9uIHdpbmRvd3MgPyBTZXJpb3VzbHkuCkRvIHlvdSBoYXZl
IGEgcmVhbCBwYXRjaCBhbmQgYXJlIHRyeWluZyB0byBzb2x2ZSBhIHJlYWwgcHJvYmxlbS4KCgo+
IGluIGl0IGFucyBzdGlsbCBoYXMgbm8gYnJhbmNoIGZvciBsYXRlc3QgTGludXgga2VybmVscy4K
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92Z3VwdGEv
YXJjLmdpdAoKVGhhdCBpcyB0aGUgdHJlZSBhbmQgc3R1ZmYgZ29lcyB2aWEgaXQuCgotVmluZWV0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1z
bnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj
Cg==
