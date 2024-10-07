Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77593CFB43F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Oct 2024 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttRzwiESa1dk5oyS4JaZdWqYJ+tzFCYrjkbQo0qf/8k=; b=jcs0dpRw5ipzeTftheYEgLANN3
	U7YdZdywpOxphO3M+7mVyjgggjcIDjkBJN45hy3JE0Y562TJcnnylF4UDk5w4SLqTh1EL6ZVYWGU6
	WQXItjkOdtX+V7ExD7QVh0ee/MPV8b4R8TVtSiIeHZuPHT1c3VL7kyByVao5cw4/kmFVRzOgtLPgR
	XmwpLlhLqAiuSVaCzmgRFyP4keJqtgqHtkbB3Qsj6jZ+GkVMLfIuXiFIJVDHqKsBFbvpeluJA+6KV
	xDzkPUxNt4dxVmDs2a1ut36hQuKQ/xeuCDdX71Cikt5lBbmVnt/Pwmvb/FmOicfmM6k6jMv44oMKG
	zm2tDCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmVG-00000002GPa-0Fpz;
	Mon, 07 Oct 2024 12:06:18 +0000
Received: from fmfe20.freemail.hu ([46.107.16.225] helo=smtp-out.freemail.hu)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmVD-00000002GNO-1NJf
	for linux-snps-arc@lists.infradead.org;
	Mon, 07 Oct 2024 12:06:17 +0000
Received: from [192.168.0.16] (catv-178-48-208-49.catv.fixed.vodafone.hu [178.48.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4XMdCZ2Zmqz73H;
	Mon, 07 Oct 2024 14:06:02 +0200 (CEST)
Message-ID: <c803e9b3-5203-4993-98d2-2ecd95ac3c53@freemail.hu>
Date: Mon, 7 Oct 2024 14:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arc: rename aux.h to arc_aux.h
To: Vineet Gupta <vgupta@kernel.org>, Shahab Vahedi <list+bpf@vahedi.org>,
 linux-snps-arc@lists.infradead.org, abrodkin@synopsys.com,
 torvalds@linux-foundation.org
References: <2d28065c-1536-44f1-9132-3d6922c09ca2@freemail.hu>
 <397dbb19cf2e951a4d24772ca26c836d682e69bf@vahedi.org>
 <aadacd1c-f9e4-4b88-ac03-b522b6c43761@freemail.hu>
 <7686811a-7a70-4f56-b43d-175ba8fce985@kernel.org>
Content-Language: hu
From: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>
In-Reply-To: <7686811a-7a70-4f56-b43d-175ba8fce985@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1728302762;
 
	s=20181004; d=freemail.hu;
 
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 
	l=2619; bh=c26tQg1UJp6agsx9N+Yx1EanS57uqKv4wDXlMwgAlno=;
 
	b=o/kB0ukozush6g9Wwn7e//qG5kRErcq2AlGpTHs08zfd2yNY+z7RGRg8mmgTOqPh
 
	kkRs8P7X/uYwc37l3o4ZfWznxEdv1pL7LOnMM/D1ErQelZkf0h7cWc50hKZcoxiOhP4
 
	lKszhI3ztQG4Jg7lcQvQBG14lomml1oHMHGfAXmCqQs8wr5VzR/YZV/yDj7BMW/uq/E
 
	E/gzXfgCEizmIj4JcL1bVxFVPZRiJyuaCjmRqP0LMPZKSOiud6ix+xqNosNW80r8LJn
 
	orwdmnzkW2zJv3AVn5mJNa9vnNcRzi9OUmfYt/ngCzaNtrtrIknAH7iFWsjDF6QKGBv
 
	0nz3W/oTPA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_050615_574612_1A4958A1 
X-CRM114-Status: GOOD (  19.72  )
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

MjAyNC4gMTAuIDA1LiAyMTo0MCBrZWx0ZXrDqXNzZWwsIFZpbmVldCBHdXB0YSDDrXJ0YToKPiBP
biAxMC81LzI0IDA2OjQxLCBTesWRa2UgQmVuamFtaW4gd3JvdGU6Cj4+IDIwMjQuIDA5LiAyNS4g
MTA6NDgga2VsdGV6w6lzc2VsLCBTaGFoYWIgVmFoZWRpIMOtcnRhOgo+Pj4gK0FkZCBWaW5lZXQg
KHdpdGggdGhlIHJpZ2h0IGFkZHJlc3MpCj4+PiArVXBkYXRlIEFsZXhleSdzIGFkZHJlc3MgdG8g
YnVzaW5lc3MgaW5zdGFuY2UKPj4+Cj4+PiBTZXB0ZW1iZXIgMjMsICJTesWRa2UgQmVuamFtaW4i
IHdyb3RlOgo+Pj4KPj4+PiBMb25nIHRpbWUgYWdvIGkgc3VibWl0dGVkIGEgcGF0Y2gsIHdoZW4g
aXQgd2lsbCBiZSByZXZpZXdlZD8gSXMgdGhlcmUgYW55IGFjdGl2aXRpZXMgaGVyZSBpbiB0aGUg
c3lub3BzeXMvQVJDIGtlcm5lbCBsaXN0Pwo+Pj4+Cj4+Pj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtc25wcy1hcmMvMjAyNDA1MjAxNDI2NDcuNzA0NDAtMS1lZ3lzemVyZWd5QGZy
ZWVtYWlsLmh1L1QvI3UKPj4+PiAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvbGludXgtYXJjL3BhdGNoLzIwMjQwNTIwMTQyNjQ3LjcwNDQwLTEtZWd5c3plcmVneUBmcmVl
bWFpbC5odS8KPj4+IFRoZXkgbG9vayBnb29kIHRvIG1lLiBUaGFuayB5b3UgU3rFkWtlIQo+Pj4K
Pj4+IFJldmlld2VkLWJ5OiBTaGFoYWIgVmFoZWRpIDxsaXN0K2JwZkB2YWhlZGkub3JnPgo+Pj4K
Pj4+IENoZWVycywKPj4+IFNoYWhhYgo+PiBQbGVhc2UgdXBkYXRlIHRoZSBlLW1haWwgYWRkcmVz
c2VzIGluIHRoZSBNQUlOVEFJTkVSUyBsaXN0IG9mIExpbnV4IGtlcm5lbC4KPj4gaHR0cHM6Ly9n
aXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL01BSU5UQUlORVJTI0wyMjM3OQo+
Pgo+PiBXaGljaCByZXBvIGlzIHRvIHVzZSBmb3IgbWFrZSBhbmQgc2VuZCBwYXRjaGVzPyBJbiB0
aGUgTUFJTlRBSU5FUlMgZmlsZSBvZiBMaW51eAo+PiB0aGUgZm9sbG93aW5nIHdhcyBtZW50aW9u
ZWQsIGJ1dCBzaW5jZSAyMDIzIHRoZXJlIGFyZSBubyBhbnkgbmV3IGNvbW1pdAo+IAo+IFRoZSBl
QlBGIGppdCB3ZW50IGludG8gQVJDIHBvcnQgMjAyNCwgYW5kIGl0IGNhbid0IGxhbmQgdmlhIHRo
ZSBBUkMgdHJlZS4KPiBQbGVhc2UgdHJ5IHNlYXJjaGluZyBwcm9wZXJseSBiZWZvcmUgcHV0dGlu
ZyByYW5kb20gc3R1ZmYgb3V0IHRoZXJlLgo+IAo+IEJUVyB3aGF0IGV4YWN0bHkgaXMgeW91ciBy
YW50IGFib3V0LiBUaGUgZmlsZSByZW5hbWUgcGF0Y2ggLSB0byBhbGxvdyBidWlsZGluZyBvbiB3
aW5kb3dzID8gU2VyaW91c2x5Lgo+IERvIHlvdSBoYXZlIGEgcmVhbCBwYXRjaCBhbmQgYXJlIHRy
eWluZyB0byBzb2x2ZSBhIHJlYWwgcHJvYmxlbS4KPiAKPiAKPj4gaW4gaXQgYW5zIHN0aWxsIGhh
cyBubyBicmFuY2ggZm9yIGxhdGVzdCBMaW51eCBrZXJuZWxzLgo+PiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92Z3VwdGEvYXJjLmdpdAo+IAo+IFRoYXQg
aXMgdGhlIHRyZWUgYW5kIHN0dWZmIGdvZXMgdmlhIGl0Lgo+IAo+IC1WaW5lZXQKCkdvYWwgaXMg
dG8gaW1wcm92ZSBMaW51eCBrZXJuZWwgY29kZWJhc2UgdG8gYWJsZSB0byBkZXZlbG9wIGluIGFu
eSBwbGF0Zm9ybSB2aWEgClZTIGNvZGUgKEludGVsbGlTZW5zZSArIHJlbW90ZSBjb21waWxlciBv
ciBsb2NhbCBjcm9zcy1jb21waWxlciBmb3IgQVJNIFNvQ3MpLgoKSW4gdGhlIExpbnV4IGdpdCBy
ZXBvIHRyZWUgdGhlcmUgYXJlIHR3byBkcml2ZXIgc291cmNlcyB3aGVyZSB0aGUgYXV4IGZpbGVu
YW1lIAppcyBleGlzdCBmb3IgdGhpcyBpbXByb3ZlbWVudCwgaXQgbmVlZCB0byBiZSBzb2x2ZWQg
d2l0aCByZW5hbWluZy4KCkluIGRybS9ub3V2ZWF1L2kyYyBkcml2ZXIsIGF1eCBmaWxlcyB3YXMg
YWxyZWFkeSBzb2x2ZWQsIGl0IGlzIG1lcmdlZC4KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS9taXNjL2tlcm5lbC8tL2NvbW1pdC8yMzFiYjliNGM0MjM5OGRiMzExNGMwODdiYTM5
YmEwMGM0YjdhYzJjCgpPbmx5IGFyYyBzb3VyY2VzIG5lZWQgdG8gYmUgZml4ZWQgZmluYWxseS4K
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LWFyYy9wYXRjaC8yMDI0
MDUyMDE0MjY0Ny43MDQ0MC0xLWVneXN6ZXJlZ3lAZnJlZW1haWwuaHUvCgpJdCBpcyBub3QgYSBj
cml0aWNhbCBidWdmaXggZm9yIHlvdXIgY29tcGFueSdzIGRhaWx5IHdvcmsuIEJ1dCBpdCBpcyBh
biBvcGVuIApzb3VyY2Ugb3BlcmF0aW5nIHN5c3RlbSwgeW91IGhhdmUgdG8gY2FyZSBhYm91dCB0
aGlzIGltcHJvdm1lbnQgYWxzbywgaWYgeW91IGFyZSAKYSBtYWludGFpbmVyLgoKCldoeSBpcyBp
dCBpbXBvcnRhbnQ/CkJlY2F1c2UgeW91bmcgZGV2ZWxvcGVycyB3aWxsIG5ldmVyIGJlIHdpbGxp
bmcgdG8gam9pbiBhbmQgY29udHJpYnV0aW5nIGluIExpbnV4IAprZXJuZWwgaW4gdGhlIGZ1dHVy
ZSBpZiB0aGVyZSBhcmUgbm8gYW55IGhpZ2gtcXVhbGl0eSBlYXN5LXRvLXVzZSBJREUgZm9yIExp
bnV4IAprZXJuZWwgY29kaW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1zbnBzLWFyYwo=
