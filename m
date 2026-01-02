Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3318FA3751
	for <linux-snps-arc@archiver.kernel.org>; Fri,  2 Jan 2026 21:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxNWPvDufq1Gu9LoSJiS062Gspn3/9mKcXj+dztolRI=; b=bONLDf4/xEZbbV
	uliEJjfo8IKGd80MPUXH0hDW6hFk39k5a2zViegfMgvLYSMNhckXMVmY0PHhwQM4J2BLb+0d+AWmK
	EucWGPsVXZUOayJay55Nwd6fxrEryeOdgcCf/t/vyb3gQc9k1FIEP/+b4tC7ywKEIhNDv4GQyeaUi
	RgcpKKHBWeLXe4HPKRfaKnHlp8Ra6oUdTNr8Q7sbQKr0uBqt6pLOmlgRST5wjVFotwfvJVPEtvWVf
	u1rjhQLqvfOoFdWK8wJHLxpidjDROuyBd6H/d3npdIY57eDnUhWwPoY1vVOIv6zJ+Vo5dFVDZQYUx
	MX9AgHt7Vfp1uvkf0mHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbn5L-00000008jvY-16zd;
	Fri, 02 Jan 2026 21:53:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbn5J-00000008jv9-1mJk;
	Fri, 02 Jan 2026 21:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D1D76013D;
	Fri,  2 Jan 2026 21:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D09C116B1;
	Fri,  2 Jan 2026 21:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767390803;
	bh=oNaPKUGx0i7GPxS9qV3ftiVed/UzQ6HG+Hft9CuDkyk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ogDzbZHKQU2RBx2fdNIwScC07hsN0kNwhvw61Cp1uwYQF9wL9aqBSUXCUHzW+rIGT
	 4QwueY/wh3z5MoMKqkPRVZjdTLNM/MUZW1xCRckve05zeOnnbu9Ryn1ji6V1Nugt8G
	 +U50XhR5on5uJ7E/nyGPNweV7lBotly6NVuxFBF1riH+tR6hf/LQKE/8wofZU3FD4S
	 RYx2QBbOCdyJm6NcdUasdWS2i75pPF/XNFb5vVu7zcKTqkWeatboEOCC/JZDrsjLd6
	 5ufIwbcI1v1WW1qYzf10IGubd119PdiNX9b+8sdiUVP6C2i2t5uif4+zJI/vefRl6f
	 Nc6THmFT3pzZQ==
Message-ID: <a033a402-e3c5-4982-9fff-b6a4c55817ae@kernel.org>
Date: Fri, 2 Jan 2026 13:53:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE
 reference to userspace
To: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
 <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
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

SGkgQXJuZCwKCkxvbmcgdGltZSBubyBzZWUuIEhhcHB5IE5ldyBZZWFyICEKCk9uIDEyLzMwLzI1
IDEzOjIzLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDMwLCAyMDI1LCBhdCAw
ODoxMCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4+IFVBUEkgaGVhZGVycyBhcmUgbm90IHN1
cHBvc2VkIHRvIGxlYWsgcmVmZXJlbmNlcyB0byBrY29uZmlnIHN5bWJvbHMuCj4+IFRoZXNlIHdv
bid0IGJlIHNldCB3aGVuIGJ1aWxkaW5nIHVzZXJzcGFjZS4gSGlkZSB0aGUga2NvbmZpZyByZWZl
cmVuY2UKPj4gYmVoaW5kICdpZiBkZWZpbmVkKF9fS0VSTkVMX18pJywgc28gaXQgd2lsbCBiZSBz
dHJpcHBlZCBieQo+PiBoZWFkZXJzX2luc3RhbGwuc2guIFRoZSByZXN1bHQgZm9yIHVzZXJzcGFj
ZSB3aWxsIGJlIHRoZSBzYW1lLCBidXQgdGhlCj4+IGV4Y2VwdGlvbiBpbiBoZWFkZXJzX2luc3Rh
bGwuc2ggY2FuIGFsc28gYmUgcmVtb3ZlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdl
acOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Cj4gQWNrZWQtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBTYW1lIGFzIGZvciB0aGUgbmlvczIgdmVy
c2lvbiwgSSB0aGluayB0aGUgbmljZXIgc29sdXRpb24gd291bGQKPiBiZSB0byB1c2UgdGhlIGFz
bS1nZW5lcmljIGhlYWRlciBmb3IgdWFwaSBhbmQgbW92ZSB0aGlzIG9uZQo+IHRvIGFyY2gvYXJj
L2luY2x1ZGUvYXNtL3N3YWIuaCBmb3Iga2VybmVsLWludGVybmFsIHVzZS4KPgo+IEluIHRoZW9y
eSwgdXNpbmcgJ3NlbGVjdCBBUkNIX1VTRV9CVUlMVElOX0JTV0FQJyBpbiBLY29uZmlnIHNob3Vs
ZAo+IGxldCB0aGUgY29tcGlsZXIgcGljayB0aGUgYmVzdCBzd2FwIGluc3RydWN0aW9uLCB3aGlj
aCB3b3VsZAo+IGJlIGV2ZW4gbGVzcyBjb2RlLCBidXQgSSdtIG5vdCBzdXJlIGlmIHRoZXJlIHdh
cyBhIHJlYXNvbiB0aGF0Cj4gbmlvczIgYW5kIGFyYyBkb24ndCBhbHJlYWR5IGRvIHRoaXMuCgpU
aGUgYnVpbHRpbnMgZGlkbid0IGV4aXN0IHdoZW4gdGhlIGluc25zIHdlcmUgZmlyc3Qgcm9sbGVk
IG91dCBpbiBody4KSXQgc2VlbXMgQVJDSF9VU0VfQlVJTFRJTl9CU1dBUCBhc3N1bWVzIDE2LDMy
LDY0IHZhcmlhbnRzIHRvIGJlIGF2YWlsYWJsZSB3aGljaApzdXJwcmlzaW5nbHkgc2VlbXMgdG8g
YmUgdHJ1ZS4KCmZvbzMyOgrCoCDCoCBqX3MuZMKgIMKgIFtibGlua10KwqAgwqAgc3dhcGXCoCDC
oCByMCxyMAoKZm9vMTY6CsKgIMKgIGV4dGhfc8KgIMKgIHIwLHIwCsKgIMKgIGFzbMKgIMKgIHIy
LHIwLDgKwqAgwqAgbHNyX3PCoCDCoCByMCxyMCw4CsKgIMKgIG9yX3PCoCDCoCByMCxyMCxyMgrC
oCDCoCBqX3MuZMKgIMKgIFtibGlua10KwqAgwqAgZXh0aF9zwqAgwqAgcjAscjAKCmZvbzY0OgrC
oCDCoCBtb3Zfc8KgIMKgIHIyLHIxwqAgwqAgOzQKwqAgwqAgc3dhcGXCoCDCoCByMSxyMArCoCDC
oCBqX3MuZMKgIMKgIFtibGlua10KwqAgwqAgc3dhcGXCoCDCoCByMCxyMgoKQW5kIGFzIHlvdSBz
YWlkLCBzaW5jZSBhbGwgdXBzdHJlYW0gY29yZXMgc3VwcG9ydCBTV0FQRSwgd2UgY2FuIHJlYWxs
eSBnZXQgcmlkCm9mIGFsbCB0aGUgbGVnYWN5IHN0dWZmIGFuZCBqdXN0IHJlbHkgb24gYnVpbHRp
bnMuCgpUaHgsCi1WaW5lZXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK
