Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0849C4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Dec 2022 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1gciyOZIx3Xq3JRKH7wKkP6OkEoc+YHtRIEmKi8RGQ=; b=3HDs59yalpPl60
	OWMcHGxMZoCnltqd8PGUofoDruVOLg11jvMdq8p0bMSpAX16XVSV12Zem21A7mYSKOamzUNuNw5c3
	Dsde1nqq7sIWBti5x23mZ8ac6U+ofo3hjPrtaAhplGfqI7/Cma31weCF1bnHyHDvnoTfFgXafxy/K
	6t2YpYM2Y1ml2AfKsKG463JEjitckE40mwF3pb1GAxVmI97pRHswXdPSvUV69gyDDLChAtRWxFO2d
	8iyIj7YIT9Fi85Cl93CbsoEcERd4i7jenAn5Br/Tn3BfzENjVqYKtl/LgGowLMposV1BEXX7O7kXJ
	ajGRqijLT1ulbuo4Kqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApdA-00EPKX-Qo; Thu, 29 Dec 2022 09:55:20 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApcp-00EPAD-EO; Thu, 29 Dec 2022 09:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672307699; x=1703843699;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ekul8eGeWcmCvyM+3dUi16jfyX+OFQQRDZLG3bQVomQ=;
  b=OMIL9ZP33K+TuGN4A1dPSmcEoxWdCfkJlXT/nwyFuaDNClHbtBYzxpjC
   LsAAGmisTlFXLKINY8ljJPbSnykjvs3BPLyNFhEjDJp7sM4dus82Y+6rD
   oAovSPrvPl+BLxlz3aJFK1hbUIXUsdytYHHPIL17n4bZthgqVPvcg/w7g
   BN/BhC23mW3+tI9wfH0TYsaGgtwfr4fbU1RBoZNlg8urpNckp5dgpZZ+z
   eYUHpJAdoudqbiLJO8CDOdMPoGPGGjipJjH10Q79B2r3C/0Dld0PDb0pk
   ggeoaCPpCP9n1UmXXHbbXcDHmGj4Z3uDU2bXPzh8mDYK7lt7A0gP/9GLO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="318699304"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; 
   d="scan'208";a="318699304"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2022 01:54:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="742258354"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; 
   d="scan'208";a="742258354"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.17.178]) ([10.213.17.178])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2022 01:54:52 -0800
Message-ID: <6e727952-3ad0-fcc3-82f1-c465dcffd56f@intel.com>
Date: Thu, 29 Dec 2022 10:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@vger.kernel.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_015459_672137_94409719 
X-CRM114-Status: GOOD (  20.55  )
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

Rm9yZ2l2ZSBtZSBsYXRlIHJlc3BvbnNlIC0gSG9saWRheXMsCgpPbiAyMi4xMi4yMDIyIDE4OjIx
LCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IE9uIFRodSwgMjIgRGVjIDIwMjIgMTI6NDY6MTYgKzAx
MDAgQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4+IEhp
IGFsbCwKPj4KPj4gSSBob3BlIHRoZXJlIHdpbGwgYmUgcGxhY2UgZm9yIHN1Y2ggdGlueSBoZWxw
ZXIgaW4ga2VybmVsLgo+PiBRdWljayBjb2NjaSBhbmFseXplIHNob3dzIHRoZXJlIGlzIHByb2Jh
Ymx5IGZldyB0aG91c2FuZHMgcGxhY2VzCj4+IHdoZXJlIGl0IGNvdWxkIGJlIHVzZWZ1bC4KPiBT
byB0byBjbGFyaWZ5LCB0aGUgaW50ZW50IGhlcmUgaXMgYSBzaW1wbGUgcmVhZGFiaWxpdHkgY2xl
YW51cCBmb3IKPiBleGlzdGluZyBvcGVuLWNvZGVkIGV4Y2hhbmdlIG9wZXJhdGlvbnMuCgpBbmQg
cmVwbGFjZSBwcml2YXRlIGhlbHBlcnMgd2l0aCBjb21tb24gb25lLCBzZWUgdGhlIGxhc3QgcGF0
Y2ggLSB0aGUgCnVsdGltYXRlIGdvYWwKd291bGQgYmUgdG8gcmVwbGFjZSBhbGwgb2NjdXJyZW5j
ZXMgb2YgZmV0Y2hfYW5kX3plcm8gd2l0aCBfX3hjaGcuCgo+IFRoZSBpbnRlbnQgaXMgKm5vdCog
dG8KPiBpZGVudGlmeSBleGlzdGluZyB4Y2hnKCkgc2l0ZXMgd2hpY2ggYXJlIHVubmVjZXNzYXJp
bHkgYXRvbWljIGFuZCB0bwo+IG9wdGltaXplIHRoZW0gYnkgdXNpbmcgdGhlIG5vbi1hdG9taWMg
dmVyc2lvbi4KPgo+IEhhdmUgeW91IGNvbnNpZGVyZWQgdGhlIGxhdHRlcj8KCklmIHlvdSBtZWFu
IHNvbWUgd2F5IG9mIChzZW1pLSlhdXRvbWF0aWMgZGV0ZWN0aW9uIG9mIHN1Y2ggY2FzZXMsIHRo
ZW4gCm5vLiBBbnl3YXkgdGhpcyBjb3VsZCBiZSBxdWl0ZSBpbnRlcmVzdGluZyBjaGFsbGVuZ2Uu
Cgo+Cj4+IEkgYW0gbm90IHN1cmUgd2hvIGlzIGdvb2QgcGVyc29uIHRvIHJldmlldy9hY2sgc3Vj
aCBwYXRjaGVzLAo+IEkgY2FuIHRha2UgJ2VtLgo+Cj4+IHNvIEkndmUgdXNlZCBteSBpbnR1aXRp
b24gdG8gY29uc3RydWN0IHRvL2NjIGxpc3RzLCBzb3JyeSBmb3IgbWlzdGFrZXMuCj4+IFRoaXMg
aXMgdGhlIDJuZCBhcHByb2FjaCBvZiB0aGUgc2FtZSBpZGVhLCB3aXRoIGNvbW1lbnRzIGFkZHJl
c3NlZFswXS4KPj4KPj4gVGhlIGhlbHBlciBpcyB0aW55IGFuZCB0aGVyZSBhcmUgYWR2aWNlcyB3
ZSBjYW4gbGVhdmUgd2l0aG91dCBpdCwgc28KPj4gSSB3YW50IHRvIHByZXNlbnQgZmV3IGFyZ3Vt
ZW50cyB3aHkgaXQgd291bGQgYmUgZ29vZCB0byBoYXZlIGl0Ogo+Pgo+PiAxLiBDb2RlIHJlYWRh
YmlsaXR5L3NpbXBsaWZpY2F0aW9uL251bWJlciBvZiBsaW5lczoKPj4KPj4gUmVhbCBleGFtcGxl
IGZyb20gZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVsbGFub3gvbWx4NS9jb3JlL2Vzdy9xb3MuYzoK
Pj4gLSAgICAgICBwcmV2aW91c19taW5fcmF0ZSA9IGV2cG9ydC0+cW9zLm1pbl9yYXRlOwo+PiAt
ICAgICAgIGV2cG9ydC0+cW9zLm1pbl9yYXRlID0gbWluX3JhdGU7Cj4+ICsgICAgICAgcHJldmlv
dXNfbWluX3JhdGUgPSBfX3hjaGcoZXZwb3J0LT5xb3MubWluX3JhdGUsIG1pbl9yYXRlKTsKPj4K
Pj4gRm9yIHN1cmUgdGhlIGNvZGUgaXMgbW9yZSBjb21wYWN0LCBhbmQgSU1ITyBtb3JlIHJlYWRh
YmxlLgo+Pgo+PiAyLiBQcmVzZW5jZSBvZiBzaW1pbGFyIGhlbHBlcnMgaW4gb3RoZXIgc29tZWhv
dyByZWxhdGVkIGxhbmd1YWdlcy9saWJzOgo+Pgo+PiBhKSBSdXN0WzFdOiAncmVwbGFjZScgZnJv
bSBzdGQ6Om1lbSBtb2R1bGUsIHRoZXJlIGlzIGFsc28gJ3Rha2UnCj4+ICAgICAgaGVscGVyIChf
X3hjaGcoJngsIDApKSwgd2hpY2ggaXMgdGhlIHNhbWUgYXMgcHJpdmF0ZSBoZWxwZXIgaW4KPj4g
ICAgICBpOTE1IC0gZmV0Y2hfYW5kX3plcm8sIHNlZSBsYXRlc3QgcGF0Y2guCj4+IGIpIEMrKyBb
Ml06ICdleGNoYW5nZScgZnJvbSB1dGlsaXR5IGhlYWRlci4KPj4KPj4gSWYgdGhlIGlkZWEgaXMg
T0sgdGhlcmUgYXJlIHN0aWxsIDIgcWVzdGlvbnMgdG8gYW5zd2VyOgo+Pgo+PiAxLiBOYW1lIG9m
IHRoZSBoZWxwZXIsIF9feGNoZyBmb2xsb3dzIGtlcm5lbCBjb252ZW50aW9ucywKPj4gICAgICBi
dXQgZm9yIG1lIFJ1c3QgbmFtZXMgYXJlIGFsc28gT0suCj4gSSBsaWtlIHJlcGxhY2UoKSwgb3Is
IHNob2NraW5nbHksIGV4Y2hhbmdlKCkuCj4KPiBCdXQuLi4gICBDYW4gd2Ugc2ltcGx5IG1ha2Ug
c3dhcCgpIHJldHVybiB0aGUgcHJldmlvdXMgdmFsdWU/Cj4KPiAJcHJldmlvdXNfbWluX3JhdGUg
PSBzd2FwKCZldnBvcnQtPnFvcy5taW5fcmF0ZSwgbWluX3JhdGUpOwoKQXMgQWxleGFuZGVyIGFs
cmVhZHkgcG9pbnRlZCBvdXQsIHN3YXAgcmVxdWlyZXMgJ3JlZmVyZW5jZXMnIHRvIHR3byAKdmFy
aWFibGVzLAppbiBjb250cmFzdCB0byB4Y2hnIHdoaWNoIHJlcXVpcmVzIHJlZmVyZW5jZSB0byB2
YXJpYWJsZSBhbmQgdmFsdWUuClNvIHdlIGNhbm5vdCB1c2Ugc3dhcCBmb3IgY2FzZXM6CiDCoMKg
wqAgb2xkX3ZhbHVlID0gX194Y2hnKCZ4LCBuZXdfdmFsdWUpOwoKUmVnYXJkcwpBbmRyemVqCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25w
cy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
