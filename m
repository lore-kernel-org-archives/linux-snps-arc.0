Return-Path: <SRS0=9eah=ED=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB49C55178
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Oct 2020 18:14:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CCE7247FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Oct 2020 18:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NYXTZpjY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXNAYzp0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CCE7247FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qDRnTdELqkTUq/HbID/ytIbTUOjUO92TFPEjfo5hSjM=; b=NYXTZpjY8REl0MtTJUjfMhGuz
	0uffJSRV8Ji0Ex5s+J7+WBbkuN6flpb0H17zvQgDpSjXmw8jbTzYywJYkW+tOwxeUkTyuMT00GclL
	L14IG0Sxjw95QM/uyBk+x7OLvVJlE5Kfalgk7Z38VIbX3f0GW2uDPJK//DSDzGaa0nAzziFcT3MWq
	R+71o3d4ykQh8fSReWO9RaJnmbRWk62eU9V7UrUpQiPB8cxle6ubksSGpm4IWLN2oFINKXozNHH0B
	/CR0j/qfUwkd8/ZbZKDvZAV+rcjT+gPBls7ArAR97wqoiirp6f77zW4e9GbvhoTDAZjD17nXEHDCI
	C9fd7ZrgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXpyJ-0001gF-Rx; Wed, 28 Oct 2020 18:14:55 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXpyH-0001ew-J9; Wed, 28 Oct 2020 18:14:54 +0000
Received: by mail-pg1-x544.google.com with SMTP id t14so180814pgg.1;
 Wed, 28 Oct 2020 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=s9cgYbyfQqq5UrYB+51r7q1mjBjejxSSOe4Pf+0dXSc=;
 b=rXNAYzp0HeMoYo9Rs2j7a7wVExN8Iyb5gKJa3ilnzOfGHJwcd+RFugTbbv4YUD3Mnj
 2VUO9dlRzbWeNmhZQWRmIldeVTDDuir4KELQdTV8pKPdUaKgxaJ0IfJxBnM0G7vRBCYg
 wiT8wBbr85sNx5oNi5w1j5zdrDvcm3y/EvCc8kg4eRMh6e4OhiTUEBlFVB0b+ClJRPsJ
 TUQPC9Lpnd7T4yc2WOtO43nneYC6WKlAT53mGvvaNge6Yx9M/aeXZ+pqCJrHxuwPUVlT
 Z3sxPuGh8uWER8Un/fum42c093n9HO5gFE6T+nYBivL+DRtjuefzSY2LaKQepJTmgDcw
 UYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=s9cgYbyfQqq5UrYB+51r7q1mjBjejxSSOe4Pf+0dXSc=;
 b=rJ3ApR/EJ1NBK3d29K6hSPHWI5dJZeGOw6scLhDKj3pMEkqZ0rSzuLBZVMiUqLh2+h
 RjptzfGRR8pgKfSq9LmBHE2xkVv1Yob46YV1x9XTw4i6ENBCWs4euP484jR9bHKAYda7
 V35QiWJ1qR3W16TykktpitIzP9W94Ug6uuILJCrBXYraa1ZZhRwmNsMF8aJKi/BPJ6jK
 P6JwC0vN1VKG+OWLeT3unSoQl+pRNLYBdWuUYiLUtmxOaVTYvTurgiXO2L3J9kd9M3Q2
 Q0fAVlOoSLn/yG/qfZ2s7WGVO7uhUTwUsL5+ZmPWuTBmMqJAkNKD9Ke1c9Gq80WjvhpT
 aJjQ==
X-Gm-Message-State: AOAM5306LB5RecHnJat8qU8GwtDgliNWm/fh8T0Ouf+qo0k7QC93dKiB
 sfb3zywcTPTUID4cUf/0lErdfpxByQd74A==
X-Google-Smtp-Source: ABdhPJxTVCFgGb7WglQERoAc+UBIhCpYSdy5fzH3i6p6S1gDc3JwHMqoX8TTAJWZ5WiJDakcD5Jdcg==
X-Received: by 2002:a17:90b:4a83:: with SMTP id
 lp3mr209008pjb.138.1603908889414; 
 Wed, 28 Oct 2020 11:14:49 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:70b5:cf21:2a3a:f170?
 ([2001:df0:0:200c:70b5:cf21:2a3a:f170])
 by smtp.gmail.com with ESMTPSA id i21sm60510pgh.2.2020.10.28.11.14.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2020 11:14:48 -0700 (PDT)
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
 <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
 <20201028111631.GF1428094@kernel.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fd55643a-a17b-5a23-4c77-9e832c1e5128@gmail.com>
Date: Thu, 29 Oct 2020 07:14:38 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20201028111631.GF1428094@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_141453_713455_F00EFA86 
X-CRM114-Status: GOOD (  28.49  )
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgTWlrZSwKCk9uIDI5LzEwLzIwIDEyOjE2IEFNLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+IEhp
IEdlZXJ0LAo+Cj4gT24gV2VkLCBPY3QgMjgsIDIwMjAgYXQgMTA6MjU6NDlBTSArMDEwMCwgR2Vl
cnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+PiBIaSBNaWtlLAo+Pgo+PiBPbiBUdWUsIE9jdCAyNywg
MjAyMCBhdCAxMjozMSBQTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+
Pj4gRnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+Pj4KPj4+IFRoZSBw
Z19kYXRhX3Qgbm9kZSBzdHJ1Y3R1cmVzIGFuZCB0aGVpciBpbml0aWFsaXphdGlvbiBjdXJyZW50
bHkgZGVwZW5kcyBvbgo+Pj4gIUNPTkZJR19TSU5HTEVfTUVNT1JZX0NIVU5LLiBTaW5jZSB0aGV5
IGFyZSByZXF1aXJlZCBvbmx5IGZvciBESVNDT05USUdNRU0KPj4+IG1ha2UgdGhpcyBkZXBlbmRl
bmN5IGV4cGxpY2l0IGFuZCByZXBsYWNlIHVzYWdlIG9mCj4+PiBDT05GSUdfU0lOR0xFX01FTU9S
WV9DSFVOSyB3aXRoIENPTkZJR19ESVNDT05USUdNRU0gd2hlcmUgYXBwcm9wcmlhdGUuCj4+Pgo+
Pj4gVGhlIENPTkZJR19TSU5HTEVfTUVNT1JZX0NIVU5LIHdhcyBpbXBsaWNpdGx5IGRpc2FibGVk
IG9uIHRoZSBDb2xkRmlyZSBNTVUKPj4+IHZhcmlhbnQsIGFsdGhvdWdoIGl0IGFsd2F5cyBwcmVz
dW1lZCBhIHNpbmdsZSBtZW1vcnkgYmFuay4gQXMgdGhlcmUgaXMgbm8KPj4+IGFjdHVhbCBuZWVk
IGZvciBESVNDT05USUdNRU0gaW4gdGhpcyBjYXNlLCBtYWtlIHN1cmUgdGhhdCBDb2xkRmlyZSBN
TVUKPj4+IHN5c3RlbXMgc2V0IENPTkZJR19TSU5HTEVfTUVNT1JZX0NIVU5LIHRvICd5Jy4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPj4KPj4+IC0tLQo+Pj4gICBhcmNoL202OGsvS2NvbmZp
Zy5jcHUgICAgICAgICAgIHwgNiArKystLS0KPj4+ICAgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3Bh
Z2VfbW0uaCB8IDIgKy0KPj4+ICAgYXJjaC9tNjhrL21tL2luaXQuYyAgICAgICAgICAgICB8IDQg
KystLQo+Pj4gICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKPj4gSXMgdGhlcmUgYW55IHNwZWNpZmljIHJlYXNvbiB5b3UgZGlkbid0IGNvbnZlcnQgdGhl
IGNoZWNrcyBmb3IKPj4gQ09ORklHX1NJTkdMRV9NRU1PUllfQ0hVTksgaW4gYXJjaC9tNjhrL2tl
cm5lbC9zZXR1cF9tbS5jCj4gSW4gYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9tbS5jIHRoZSBDT05G
SUdfU0lOR0xFX01FTU9SWV9DSFVOSyBpcyBuZWVkZWQKPiBmb3IgdGhlIGNhc2Ugd2hlbiBhIHN5
c3RlbSBoYXMgdHdvIGJhbmtzLCB0aGUga2VybmVsIGlzIGxvYWRlZCBpbnRvIHRoZQo+IHNlY29u
ZCBiYW5rIGFuZCBzbyB0aGUgZmlyc3QgYmFuayBjYW5ub3QgYmUgdXNlZCBhcyBub3JtYWwgbWVt
b3J5LiBJdAo+IGRvZXMgbm90IG1hdHRlciB3aGF0IG1lbW9yeSBtb2RlbCB3aWxsIGJlIHVzZWQg
aW4gdGhpcyBjYXNlLgoKClRoYXQgY2FzZSB1c2VkIHRvIGJlIGRldGVjdGVkIGp1c3QgZmluZSBh
dCBydW4gdGltZSAoYnkgZGludCBvZiB0aGUgCnNlY29uZCBtZW1vcnkgY2h1bmsgaGF2aW5nIGFu
IGFkZHJlc3MgYmVsb3cgdGhlIGZpcnN0OyB0aGUgY2h1bmsgdGhlIAprZXJuZWwgcmVzaWRlcyBp
biBpcyBhbHdheXMgbGlzdGVkIGZpcnN0KSwgZXZlbiB3aXRob3V0IHVzaW5nIApDT05GSUdfU0lO
R0xFX01FTU9SWV9DSFVOSy4KClVubGVzcyB5b3UgY2hhbmdlZCB0aGF0IGJlaGF2aW91ciAoYW5k
IEkgc2VlIG5vdGhpbmcgaW4geW91ciBwYXRjaCB0aGF0IAp3b3VsZCBpbmRpY2F0ZSB0aGF0KSwg
dGhpcyBpcyBzdGlsbCB0cnVlLgoKQ29udmVydGluZyB0aGUgY2hlY2sgYXMgR2VlcnQgc3VnZ2Vz
dGVkLCB3aXRob3V0IGFsc28gYWRkaW5nIGEgdGVzdCBmb3IgCm91dC1vZi1vcmRlciBtZW1vcnkg
YmFuayBhZGRyZXNzZXMsIHdvdWxkIGltcGxpY2l0bHkgdHJlYXQgRElTQ09OVElHTUVNIAphc8Kg
IFNJTkdMRV9NRU1PUllfQ0hVTkssIHJlZ2FyZGxlc3Mgb2YgYmFuayBvcmRlcmluZy4gSSBkb24n
dCB0aGluayB0aGF0IAppcyB3aGF0IHdlIHJlYWxseSB3YW50PwoKQ2hlZXJzLAoKIMKgwqDCoCBN
aWNoYWVsCgoKPgo+PiBhbmQgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3ZpcnRjb252ZXJ0Lmg/Cj4g
ICAKPiBJIHJlbWVtYmVyIEkgaGFkIGJ1aWxkIGVycm9ycyBhbmQgdHJvdWJsZXMgd2l0aCBpbmNs
dWRlIGZpbGUKPiBkZXBlbmRlbmNpZXMgaWYgSSBjaGFuZ2VkIGl0IHRoZXJlLCBidXQgSSBtaWdo
dCBiZSBtaXN0YWtlbi4gSSdsbAo+IHJlY2hlY2sgYWdhaW4uCj4KPj4gR3J7b2V0amUsZWV0aW5n
fXMsCj4+Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+Pgo+PiAtLSAKPj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwo+Pgo+PiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4+IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
