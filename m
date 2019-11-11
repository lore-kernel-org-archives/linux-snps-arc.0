Return-Path: <SRS0=N5rj=ZD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87175C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 21:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144EF20818
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 21:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WhePG0eR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 144EF20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6p7z1qgIqmI9FvQRZbncjg1Gay19XDXD05SWaQBGPk=; b=WhePG0eRL24o3d
	a2EVcG2hyRsrSKeBEbE1Yi1u0PID/Go+QKtKWaN2mvzw9y7eFquPzA7oz8MmDlN6mzdV9o/IgePfR
	gXEKQ4o5pAPmqcXrex7P2TtlARxVkaVsts5y43kLcQmQZapamsc93nVgBiactlOLoxCSGhEU/P7xq
	5Bw9XMzj4vay/r/RKw10fZHBonmhpjXKT5C1AYAPdrxOg5dVxE/rtI3SZkOmoTXjgwwowo9kCqBiE
	6rMG2gjjkM11Y7/t+RY46DfQBI0VAk+eI83hYpBOrwbPDbVpy5Q9WX0xDrVzHeowk30Jq5DtbiQO5
	bo+J52FDBBe4IIPTH2pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUGw8-00089y-B4; Mon, 11 Nov 2019 21:09:24 +0000
Received: from smtp4-g21.free.fr ([212.27.42.4])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUGw5-00089J-7a
 for linux-snps-arc@lists.infradead.org; Mon, 11 Nov 2019 21:09:23 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:644e:7eec:8a85:2361])
 (Authenticated sender: yann.morin.1998)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 684B619F5AD;
 Mon, 11 Nov 2019 22:09:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 11 Nov 2019 22:09:00 +0100
Date: Mon, 11 Nov 2019 22:09:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
Message-ID: <20191111210900.GH3419@scaer>
References: <20191108174112.28183-1-vgupta@synopsys.com>
 <20191108174112.28183-2-vgupta@synopsys.com>
 <20191109144656.3da6a1b0@windsurf>
 <1112f6a7-8a23-6cd9-0af0-76e0b92e496b@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1112f6a7-8a23-6cd9-0af0-76e0b92e496b@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_130921_563257_393F48E2 
X-CRM114-Status: GOOD (  21.87  )
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
Cc: "buildroot@busybox.net" <buildroot@busybox.net>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

VmluZWV0LCBBbGwsCgpPbiAyMDE5LTExLTExIDE4OjQ3ICswMDAwLCBWaW5lZXQgR3VwdGEgc3Bh
a2UgdGh1c2x5Ogo+IE9uIDExLzkvMTkgNTo0NiBBTSwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToK
PiA+IE9uIEZyaSwgIDggTm92IDIwMTkgMDk6NDE6MTAgLTA4MDAKPiA+IFZpbmVldCBHdXB0YSA8
VmluZWV0Lkd1cHRhMUBzeW5vcHN5cy5jb20+IHdyb3RlOgo+ID4+IFNpZ25lZC1vZmYtYnk6IFZp
bmVldCBHdXB0YSA8dmd1cHRhQHN5bm9wc3lzLmNvbT4KPiA+PiAtLS0KPiA+PiAgYXJjaC9Db25m
aWcuaW4uYXJjIHwgMjEgKysrKysrKysrKysrKystLS0tLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBh
L2FyY2gvQ29uZmlnLmluLmFyYyBiL2FyY2gvQ29uZmlnLmluLmFyYwo+ID4+IGluZGV4IGM2NWJi
MDFmMWY0Zi4uMjg0OTUxYjgyY2VlIDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvQ29uZmlnLmluLmFy
Ywo+ID4+ICsrKyBiL2FyY2gvQ29uZmlnLmluLmFyYwo+ID4+IEBAIC0xMSwxMyArMTEsMTkgQEAg
Y29uZmlnIEJSMl9hcmM3NTBkCj4gPj4gIGNvbmZpZyBCUjJfYXJjNzcwZAo+ID4+ICAJYm9vbCAi
QVJDIDc3MEQiCj4gPj4gIAo+ID4+IC1jb25maWcgQlIyX2FyY2hzMzgKPiA+PiArY29uZmlnIEJS
Ml9hcmNocwoKW05vdGUgdGhpcyBjaGFuZ2UsIGFib3ZlIF5eXl0KCj4gPj4gIAlib29sICJBUkMg
SFMzOCIKPiA+PiAgCWhlbHAKPiA+PiAgCSAgR2VuZXJpYyBBUkMgSFMgY2FwYWJsZSBvZiBydW5u
aW5nIExpbnV4LCBpLmUuIHdpdGggTU1VLAo+ID4+IC0JICBjYWNoZXMgYW5kIG11bHRpcGxpZXIu
IEFsc28gaXQgY29ycmVzcG9uZHMgdG8gdGhlIGRlZmF1bHQKPiA+PiArCSAgY2FjaGVzIGFuZCAz
Mi1iaXQgbXVsdGlwbGllci4gQWxzbyBpdCBjb3JyZXNwb25kcyB0byB0aGUgZGVmYXVsdAo+ID4+
ICAJICBjb25maWd1cmF0aW9uIGluIG9sZGVyIEdOVSB0b29sY2hhaW4gdmVyc2lvbnMuCj4gPj4g
IAo+ID4+ICtjb25maWcgQlIyX2FyY2hzMzgKPiA+PiArCWJvb2wgIkFSQyBIUzM4IHdpdGggNjQt
Yml0IG1weSIKClthbmQgbm90ZSB0aGlzLCBhYm92ZV5eXl0KCj4gPiBUaGlzIHJlLXVzZSBvZiBh
biBleGlzdGluZyBuYW1lIGlzIGEgYml0IGFubm95aW5nLiBJbmRlZWQsIGFsbCBleGlzdGluZwo+
ID4gdXNlcnMgb2YgQnVpbGRyb290IHRoYXQgaGF2ZSBhIGNvbmZpZ3VyYXRpb24gd2l0aCBCUjJf
YXJjaHMzOCB3aWxsIG5vdwo+ID4gYmUgYnVpbGRpbmcgZm9yIGEgQVJDIHN5c3RlbSB3aXRoIGEg
NjQtYml0IG11bHRpcGxpZXIsIHdoaWxlIHRoZXkgd2VyZQo+ID4gcHJldmlvdXNseSBidWlsZGlu
ZyBmb3IgYSAzMi1iaXQgbXVsdGlwbGllci4KPiA+Cj4gPiBJIHNlZSB0aGF0IHdoYXQgeW91IGhh
dmUgZG9uZSBpcyB0byB0cnkgdG8gYmUgY29uc2lzdGVudCBiZXR3ZWVuIHRoZQo+ID4gQlIyXyBv
cHRpb25zIGFuZCB0aGUgZ2NjIG9wdGlvbnMuIEknbSBoZXNpdGF0aW5nIGJldHdlZW4ga2VlcGlu
ZyB0aGUKPiA+IGNvbnNpc3RlbmN5IGJ1dCBtYWtpbmcgdGhlIG1pZ3JhdGlvbiBhIGJpdCBhbm5v
eWluZyBmb3IgdXNlcnMsIG9yCj4gPiBicmVha2luZyB0aGUgY29uc2lzdGVuY3kgdG8gbWFrZSB0
aGUgbWlncmF0aW9uIHNtb290aCBmb3IgdXNlcnMuCj4gPgo+ID4gU2luY2UgSSB0aGluayB0aGUg
bnVtYmVyIG9mIGFmZmVjdGVkIHVzZXJzIHdpbGwgcHJvYmFibHkgYmUgcXVpdGUKPiA+IHNtYWxs
L2xpbWl0ZWQsIEkgdGhpbmsgSSB3b3VsZCBiZSBmaW5lIHdpdGggbWVyZ2luZyB5b3VyIHBhdGNo
IGFzLWlzLAo+ID4gYnV0IEknZCBsaWtlIHRvIGhlYXIgZnJvbSBvdGhlcnMuCj4gCj4gSSBhZ3Jl
ZSB0aGF0IHRoaXMgbWlnaHQgY2F1c2UgcG90ZW50aWFsIGJyZWFrYWdlLCBidXQgdGhpcyBpcyBu
b3QgdG90YWxseQo+IHVuY2hhcnRlZCB0ZXJyaXRvcnkgZm9yIHNvZnR3YXJlIGJ1aWxkIGNvbmZp
Zy4gV2UndmUgYmVlbiBidWlsZGluZyBMaW51eCBrZXJuZWwKPiB3aXRoIHRoaXMgb3B0aW9uIGFz
IGRlZmF1bHQgc2luY2UgbWlkIDIwMTguCgpJIHRoaW5rIHRoZXJlIGlzIHNvbWUgbWlzdW5kZXJz
dGFuZGluZy4KCldoYXQgVGhvbWFzIGFuZCBJIGFyZ3VlIG9uLCBpcyB0aGUgd2F5IHRvIGNoYW5n
ZSB0aGUgbWVhbmluZyBmb3IgdGhlCkJSMl9hcmNoczM4IG9wdGlvbi4KCkJlZm9yZSB0aGlzIHBh
dGNoLCBCUjJfYXJjaHMzOCBtZWFudCAiQVJDIEhTMzgiLiBCdXQgd2l0aCB5b3VyIHBhdGNoLCBp
dApub3cgbWVhbnMgIkFSQyBIUzM4IHdpdGggNjQtYml0IG1weSIuCgpTbywgYSB1c2VyIHRoYXQg
dXBkYXRlcyB0aGVpciBCdWlsZHJvb3QgY29uZmlndXJhdGlvbmkgd2hpY2ggcHJldmlvdXNseQpo
YWQgYSAicGxhaW4iIEhTMzggc2V0dXAsIGJ1dCB3aXRoIHRoaXMgcGF0Y2gsIHRoZXkgZ2V0IGFu
ICJleHRlbmRlZCIKSFMzOCB3aXRoIHRoZSA2NC1iaXQgbXVsdGlwbGllci4KClRoYXQncyB3aHkg
SSBzdWdnZXN0ZWQgaW4gbXkgb3duIHJlcGx5LCB0byBrZWVwIEJSMl9hcmNoczM4IGFzIGl0IHdh
cwpiZWZvcmUsIGFuZCBpbnRyb2R1Y2UgQlIyX2FyY2hzMzhfNjRtcHkgdG8gbWVhbiB0aGUgbmV3
IEhTMzggdy8gdGhlCjY0LWJpdCBtdWx0aXBsaWVyLgoKSW5kZWVkLCBpdCBkb2VzIG5vdCBtYXRj
aCB0aGUgZ2NjIGNvbmZpZyBvcHRpb25zLCBidXQgdGhhdCB3b3VsZCBoYXJkbHkKYmUgdGhlIG9u
bHkgZGVyb2dhdGlvbiB3ZSBoYXZlIGluIEJ1aWxkcm9vdC4uLiA7LSkKCj4gMjAxOC0wOS0wNyAw
MGE5OTMzOWYwYTMgQVJDdjI6IGJ1aWxkOiB1c2UgbWNwdT1oczM4IGlzbyBnZW5lcmljIG1jcHU9
YXJjaHPCoAo+IAo+IEdyYW50ZWQgdGhhdCBrZXJuZWwgYnVpbGQgaXMganVzdCBvbmUgcGFydCBv
ZiBwdXp6bGUgYW5kIGFueSBsYXRlbnQgY29kZWdlbiBpc3N1ZXMKPiBhcmUgbW9yZSBsaWtlbHkg
dG8gc3VyZmFjZSB3aXRoIGRlZmF1bHQgYXBwbGllZCB0byBmdWxsIHNvZnR3YXJlIHN0YWNrLCBJ
IHdvdWxkCj4gc3RpbGwgdm90ZSBmb3Igc3dpdGNoaW5nIGRlZmF1bHQgdG8gLW1jcHU9aHMzOAoK
Q2hhbmdpbmcgdGhlIG1lYW5pbmcgb2YgYW4gb3B0aW9uLCBhbmQgY2hhbmdpbmcgdGhlIGRlZmF1
bHQgb2YgYSBjaG9pY2UsCmFyZSB0d28gZGlmZmVyZW50IHRoaW5ncy4gSSdtIE9LIHdpdGggY2hh
bmdpbmcgdGhlIGRlZmF1bHQsIGJ1dCBJJ2QKcmF0aGVyIHRoYXQgb3B0aW9ucyBrZWVwIHRoZWly
IG1lYW5pbmcuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
