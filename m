Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA7BC19F28
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Aug 2022 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wv/hzYFKcZrQoqhNYrJ9hGjEIAD4vTgfDQEab8E1bT8=; b=kOO2e5MXH6UTkE
	/MrTfs530BADGj/Dgyi5M6hbdp++C/b3NH2dQTgkMz1KG30lAJuTmgPqeZPU2yMBeCjnenSaK0mVQ
	1hhlCZTAA/psqezTvgte5UEgW9/oh1VvNAwr7GVDDPc6qmX9mRJdipxpNbJiGx2fjiJ+oQWgOMn0V
	YG6obO33Wi7tXNb8jH281XcTqXysd3q1AY6xtkanqXiDcd27DMWICyAHJ5fXin80v8euZUc7hfaw1
	N+eb8woe+gyAryqPM5PdpkgyzMFi+VQTCGs1Gyx9CsP/HeOnPTmNsCPMJoIyFMvD9F9d/WZigZlqr
	s262xeQ6U2mekFzpsDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJA32-0042Ff-57; Wed, 03 Aug 2022 08:48:12 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJA2z-0042Bp-5I
	for linux-snps-arc@lists.infradead.org; Wed, 03 Aug 2022 08:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659516489; x=1691052489;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+qvKUwqmQKAYYrLXg2GV2+q+xTQp35oEGWNYLkPBXjQ=;
  b=jx8InOV9tdM3B+5+WIn6hym0v2CYPyMmScEeRj2oGstQe0nrtTH/+kYR
   MJdLMz+pEDHCfpWzY0WBfmidW/tTM0p112p7sRLfm6KJPw/K4htICeiy/
   ZmotqRi+Q0tntw+50/nDjnUhDCNMDwTbP2VTdKasVw4VYb9HggbJfbu18
   upc6QqCjSvdWXzBe2mKK4x6FJk7mTuoefEqbY2sYACSUBk7QsjGPMGwdQ
   3RDKpnrBoUpVWUPQ7QL+7paeLkorHykpG1wOHp+Hl14P4Yce70jzUrtrK
   NM932TeenUSYYphkhdmr+38fSRxoyTz1i9wBYtrGaQveRG1Po+CveD3CB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="290838034"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="290838034"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 01:48:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="661991747"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.118]) ([10.99.241.118])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 01:48:03 -0700
Message-ID: <2d4fac14-eaf8-c899-dba2-b2ffb484358d@linux.intel.com>
Date: Wed, 3 Aug 2022 10:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] sparc64: bitops: Change __fls to return unsigned
 long
Content-Language: en-US
To: Vineet Gupta <vgupta@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "David S . Miller" <davem@davemloft.net>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-snps-arc@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>
References: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com>
 <20220527115345.2588775-4-amadeuszx.slawinski@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220527115345.2588775-4-amadeuszx.slawinski@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_014809_327379_71655B20 
X-CRM114-Status: GOOD (  13.20  )
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

T24gNS8yNy8yMDIyIDE6NTMgUE0sIEFtYWRldXN6IFPFgmF3acWEc2tpIHdyb3RlOgo+IEFzIHBl
ciBhc20tZ2VuZXJpYyBkZWZpbml0aW9uIGFuZCBvdGhlciBhcmNoaXRlY3R1cmVzIF9fZmxzIHNo
b3VsZAo+IHJldHVybiB1bnNpZ25lZCBsb25nLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlz
IGV4cGVjdGVkIGFzIHJldHVybiB2YWx1ZSBzaG91bGQgZml0IGluIHVuc2lnbmVkCj4gbG9uZy4K
PiAKPiBSZXZpZXdlZC1ieTogQ2V6YXJ5IFJvamV3c2tpIDxjZXphcnkucm9qZXdza2lAaW50ZWwu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xh
d2luc2tpQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgIGFyY2gvc3BhcmMvaW5jbHVkZS9hc20v
Yml0b3BzXzY0LmggfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9iaXRv
cHNfNjQuaCBiL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vYml0b3BzXzY0LmgKPiBpbmRleCAwMDVh
OGFlODU4ZjEuLmNkYWMzOWJkN2IzMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3NwYXJjL2luY2x1ZGUv
YXNtL2JpdG9wc182NC5oCj4gKysrIGIvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9iaXRvcHNfNjQu
aAo+IEBAIC0yNCw3ICsyNCw3IEBAIHZvaWQgY2xlYXJfYml0KHVuc2lnbmVkIGxvbmcgbnIsIHZv
bGF0aWxlIHVuc2lnbmVkIGxvbmcgKmFkZHIpOwo+ICAgdm9pZCBjaGFuZ2VfYml0KHVuc2lnbmVk
IGxvbmcgbnIsIHZvbGF0aWxlIHVuc2lnbmVkIGxvbmcgKmFkZHIpOwo+ICAgCj4gICBpbnQgZmxz
KHVuc2lnbmVkIGludCB3b3JkKTsKPiAtaW50IF9fZmxzKHVuc2lnbmVkIGxvbmcgd29yZCk7Cj4g
K3Vuc2lnbmVkIGxvbmcgX19mbHModW5zaWduZWQgbG9uZyB3b3JkKTsKPiAgIAo+ICAgI2luY2x1
ZGUgPGFzbS1nZW5lcmljL2JpdG9wcy9ub24tYXRvbWljLmg+Cj4gICAKCkhpLAoKYW55IGNoYW5j
ZSB0aGlzIG9uZSBjb3VsZCBhbHNvIGdldCBtZXJnZWQ/IE90aGVyIHR3byBwYXRjaGVzIGFyZSBh
bHJlYWR5IAppbiBsaW51eC1uZXh0IGFuZCBJIHdvdWxkIGxpa2UgdG8gcmVtb3ZlIGl0IGZyb20g
bGlzdCBvZiB0aGluZ3MgSSBoYXZlIAp0byByZW1lbWJlciA7KQoKQW1hZGV1c3oKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
