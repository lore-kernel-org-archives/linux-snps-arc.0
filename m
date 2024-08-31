Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6452CD13D9
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Aug 2024 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYPo6CNJ5HWtI0NTEhmqM/4Z6Kb+Hd2XvorS7EJ7N7c=; b=OrYg6QKzXjU/g1
	OpvZhVsQFd30yUW0Nl2A9yREIfoUnmPJVoAQx0LwGcObnotxRa9qlUVpHa4pur95OAA6vUrl78NxO
	4y1llCLEkQI+QoEjIpcisaSXWdOikbliUXB7KO+De8xFeaM4WN8ricluuoQbAGXll4/X/WBZQhE6j
	I2hvUD9Db9+hknP+KHf2XpbGz3mt8bKju5X6nFg8EelAKXGVr/3UtopJBt/+d3Vv/c9lPSzmrUoRc
	lNi12WGQLmZjoynXjbZ+Kojly5ypMb4Ksvbs8bTOEXFE6H9diKENmfgOtUJEUYpgLkJ1KWQYg3T5Q
	wDIdbGvnBtCmqrHaPjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skX7d-0000000AIxu-2yEZ;
	Sat, 31 Aug 2024 23:03:09 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skX7F-0000000AIso-2vrn
	for linux-snps-arc@lists.infradead.org;
	Sat, 31 Aug 2024 23:03:08 +0000
Message-ID: <8795e8da-981a-4876-99fe-8a4edb2185bf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725145358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xmF6CpyWOJR8fNg1TS1jQi/Ic9PEVUp4NkLcl3FR9NI=;
	b=r5z6sIdryoTxvDIe9eBC+Fi9A016Lf0v2j1TEKTDfEAlFWEjXn16EiPaPHEdjTuqhFytRc
	/0WSWnsHxqmag6ClYcrCgG3OxSVyLeeGvtH5qlvIWwMxsmAWgkgjzVdtzjuaYupRvWx/Fm
	r5uqOWhf2dNGrkTWY89Hjun1Mpj9AHQ=
Date: Sat, 31 Aug 2024 16:02:32 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] ARC: update the help message for
 CONFIG_ARC_BUILTIN_DTB_NAME
To: Masahiro Yamada <masahiroy@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20240831101045.1381258-1-masahiroy@kernel.org>
 <CAK7LNATtOzj175_Y0qQz338FRG1GYCrsorA=jWG+Go1Wjn9rnw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <CAK7LNATtOzj175_Y0qQz338FRG1GYCrsorA=jWG+Go1Wjn9rnw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_160246_188093_5A8F0272 
X-CRM114-Status: GOOD (  11.70  )
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

CgpPbiA4LzMxLzI0IDAzOjEzLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4gT24gU2F0LCBBdWcg
MzEsIDIwMjQgYXQgNzoxMOKAr1BNIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5v
cmc+IHdyb3RlOgo+PiBDb21taXQgYWJlMTFkZGVhMWQ3ICgiQVJDOiBbcGxhdC1hcmNmcGdhXTog
RW5hYmxpbmcgRGV2aWNlVHJlZSBmb3IKPj4gQW5nZWw0IGJvYXJkIikgY2hhbmdlZCB0aGUgZGVm
YXVsdCBidWlsdC1pbiBEVEIgZnJvbSAic2tlbGV0b24iIHRvCj4+ICJhbmdlbDQiLgo+Pgo+PiBD
b21taXQgZmQxNTU3OTIzYjJlICgiQVJDOiBbcGxhdF9hcmNmcGdhXS0+W3BsYXRfc2ltXSIpIGNo
YW5nZWQgaXQKPj4gZnJvbSAiYW5nZWw0IiB0byAibnNpbV83MCIuCj4KPiBBIHR5cG8uCj4KPiAg
Li4uIHRvICJuc2ltXzcwMCIuCj4KPgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEg
PG1hc2FoaXJveUBrZXJuZWwub3JnPgoKQWNrZWQtYnk6IFZpbmVldCBHdXB0YSA8dmd1cHRhQGtl
cm5lbC5vcmc+CgpUaHgsCi1WaW5lZXQKCj4+IC0tLQo+Pgo+PiAgYXJjaC9hcmMvS2NvbmZpZyB8
IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmMvS2NvbmZpZyBiL2FyY2gvYXJjL0tjb25maWcKPj4g
aW5kZXggZmQwYjBhMGQ0Njg2Li5kMDFlNjlhMjliNjkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJj
L0tjb25maWcKPj4gKysrIGIvYXJjaC9hcmMvS2NvbmZpZwo+PiBAQCAtNTUzLDcgKzU1Myw3IEBA
IGNvbmZpZyBBUkNfQlVJTFRJTl9EVEJfTkFNRQo+PiAgICAgICAgIHN0cmluZyAiQnVpbHQgaW4g
RFRCIgo+PiAgICAgICAgIGhlbHAKPj4gICAgICAgICAgIFNldCB0aGUgbmFtZSBvZiB0aGUgRFRC
IHRvIGVtYmVkIGluIHRoZSB2bWxpbnV4IGJpbmFyeQo+PiAtICAgICAgICAgTGVhdmluZyBpdCBi
bGFuayBzZWxlY3RzIHRoZSBtaW5pbWFsICJza2VsZXRvbiIgZHRiCj4+ICsgICAgICAgICBMZWF2
aW5nIGl0IGJsYW5rIHNlbGVjdHMgdGhlICJuc2ltXzcwMCIgZHRiLgo+Pgo+PiAgZW5kbWVudSAg
ICAgICAgICMgIkFSQyBBcmNoaXRlY3R1cmUgQ29uZmlndXJhdGlvbiIKPj4KPj4gLS0KPj4gMi40
My4wCj4+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
