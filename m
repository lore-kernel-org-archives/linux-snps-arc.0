Return-Path: <SRS0=otmf=CZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDD2C43461
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2020 06:58:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A98A20771
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2020 06:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFEm8dnU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A98A20771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rm+gWPBCdP03Vnc77OOjIopVh5V2krCzn9n5P+b/XF0=; b=bFEm8dnUhEykiYPN2TFelZ2vm
	ClPZ8peop1s+QEtWQmt7Tb77E7Fnw1bSy6d5ih3K/u7srU37qXXwyZgKkWFQPXrQW/fTFE9lCMyO2
	NgPqzznNDX64SZ34U0zPs7TmBVzMXktIna/sFLUezoAsM9vQR9dBLyEB2hKij3nbkkNhaRy/rxXzf
	+pwEIVC/4HKJaav5zsTedSpPYh2rGIIzu69EMrW7jKy5xcjHzlXBmj00dwFNza7VP7TcPlWZuDEsg
	5mJZU9bAJLuhBMVGMtAlvRN2YRB+DCeMzZCqifCCrPciINGVI0E834q29Wh+6xSvBf+SpgjxPWgul
	F9NRSSWzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIROY-0004D9-95; Wed, 16 Sep 2020 06:58:22 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIROV-0004Ch-Ht
 for linux-snps-arc@lists.infradead.org; Wed, 16 Sep 2020 06:58:20 +0000
Received: from windsurf.hq.k.grp (lfbn-tou-1-420-199.w86-206.abo.wanadoo.fr
 [86.206.245.199])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5338510000E;
 Wed, 16 Sep 2020 06:58:15 +0000 (UTC)
Date: Wed, 16 Sep 2020 08:58:14 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH] package/glibc: ARC: use upstream 2.32
Message-ID: <20200916085814.1b555f69@windsurf.hq.k.grp>
In-Reply-To: <94daa7f5-5780-9716-cea8-a355930e33c6@synopsys.com>
References: <20200914213748.3953423-1-vgupta@synopsys.com>
 <20200915153324.318c612b@windsurf.hq.k.grp>
 <94daa7f5-5780-9716-cea8-a355930e33c6@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_025819_677395_6679E7F1 
X-CRM114-Status: GOOD (  17.79  )
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
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxNiBTZXAgMjAyMCAwNDoyMjozNiArMDAwMApWaW5lZXQgR3VwdGEgPFZpbmVldC5H
dXB0YTFAc3lub3BzeXMuY29tPiB3cm90ZToKCj4gT24gOS8xNS8yMCA2OjMzIEFNLCBUaG9tYXMg
UGV0YXp6b25pIHdyb3RlOgo+ID4gSGVsbG8sCj4gPgo+ID4gT24gTW9uLCAxNCBTZXAgMjAyMCAx
NDozNzo0OCAtMDcwMAo+ID4gVmluZWV0IEd1cHRhIDxWaW5lZXQuR3VwdGExQHN5bm9wc3lzLmNv
bT4gd3JvdGU6Cj4gPiAgCj4gPj4gQVJDIGdsaWJjIHBvcnQgd2FzIG1lcmdlZCB1cHN0cmVhbSBp
biAyLjMyCj4gPj4gVGhlcmUncyBubyBuZWVkIHRvIHJlZmVyIHRvIGdpdGh1YiBhcyBpdCBoYXMg
dGhlIGV4YWN0IHNhbWUgdmVyc2lvbiBhbmQKPiA+PiBjYW4gYmUgcmV0aXJlZCBpbiBmdXR1cmUu
Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZndXB0YUBzeW5vcHN5cy5j
b20+Cj4gPj4gLS0tCj4gPj4gIC4uLi9nbGliYy5oYXNoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICsrCj4gPj4gIHBhY2thZ2UvZ2xpYmMvZ2xpYmMubWsgICAgICAgICAgICAg
ICAgICAgICAgICB8IDIwICsrKysrKysrKystLS0tLS0tLS0KPiA+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9nbGliYy8yLjMyLTItZzM4NjU0M2JjNDQ5NWY2NThkY2NlNmNkNGQxMWU0YmE2
NTc0YTQ2ZjUvZ2xpYmMuaGFzaCAgCj4gPiBUaGUgaGFzaCBmaWxlIGZvciB0aGUgQVJDLXNwZWNp
ZmljIGdsaWJjIHZlcnNpb24gdXNlZCBvbiBHaXRodWIgc2hvdWxkCj4gPiBiZSBkcm9wcGVkLiAg
Cj4gCj4gVGhlIGhhc2ggaW4gdGhlIHBhdGNoIGlzIGZyb20gdGhlIHNvdXJjZXdhcmUgZG93bmxv
YWRlZCBnei4KPiAKPiAkIHNoYTI1NnN1bSAuLi9kbC9nbGliYy9nbGliYy0yLjMyLTItZzM4NjU0
M2JjNDQ5NWY2NThkY2NlNmNkNGQxMWU0YmE2NTc0YTQ2ZjUudGFyLmd6Cj4gCj4gMDdmMzgwNGFi
YmM2YTIzMzE1ZjA5NTY4Njg2YzBlNWJiODFkNzE0MjUxY2Y1MzdkMjVhMzZmODI2Y2FlNTQwYsKg
Cj4gLi4vZGwvZ2xpYmMvZ2xpYmMtMi4zMi0yLWczODY1NDNiYzQ0OTVmNjU4ZGNjZTZjZDRkMTFl
NGJhNjU3NGE0NmY1LnRhci5nego+IAoKSSB0aGluayB5b3UgbWlzc2VkIG15IHBvaW50OiB3aXRo
IHRoaXMgcGF0Y2gsIHlvdSBhcmUgcmVtb3Zpbmcgc3VwcG9ydApmb3IgdXNpbmcgdGhlIGFyYy0y
MDIwLjAzLXJlbGVhc2UgdmVyc2lvbiBvZiBnbGliYy4gVGhlcmVmb3JlIHRoZQpmb2xkZXIgcGFj
a2FnZS9nbGliYy9hcmMtMjAyMC4wMy1yZWxlYXNlLywgd2hpY2ggY29udGFpbnMgdGhlIGhhc2gg
ZmlsZQpvZiBnbGliYyBvZiB0aGUgYXJjLTIwMjAuMDMtcmVsZWFzZSB2ZXJzaW9uIHNob3VsZCBi
ZSByZW1vdmVkLgoKT3IgaXMgaXQgbWUgd2hvIGlzIG1pc3Npbmcgc29tZXRoaW5nID8KCkJlc3Qg
cmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1h
cmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
