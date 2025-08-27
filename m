Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74506CA0EFF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Aug 2025 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ah8tibZcdsJ2ADrF61rweplI/Q+VQtkBkgP9+5mMNSY=; b=A4tJoXEPQQJXQg
	C3LOsTcVuuxIJgXvnpqJqyG7NlDf60JbN+4Zmf/SVsUWUu/IxYeWInumPre4yp40h1ALFFQ6xl0aI
	nmBL2lzTycNlftma4PR5xcsLUmZIMW3uCW/qEMXzLaHWzPU8OrdfPoxUp+ItwyQo9WuKpXIx5WPAR
	yYRKevxs8Yto2Cepx/ofo00TWE/a5erYURYBaXmg61YcG58xaWMX14H+EfgUSdEN9CFuVeKgIoV8Z
	VHI3huskOCZ6S/tErntKQBSqMjyEzOJNnQD5TsSfJ/m6p9KDBBGpcYYvrq2Ubc/duRK10cRroWWCx
	gq0KHa4w/y3jBDc3t3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBdT-0000000EgsS-0F0x;
	Wed, 27 Aug 2025 08:36:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBMo-0000000EdBL-2niP;
	Wed, 27 Aug 2025 08:18:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 875DD1515;
	Wed, 27 Aug 2025 01:18:41 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8D1A3F694;
	Wed, 27 Aug 2025 01:18:41 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:18:38 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ian Rogers <irogers@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
	will@kernel.org, acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, kan.liang@linux.intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
Message-ID: <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
 <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_011850_786207_B56C2E3C 
X-CRM114-Status: GOOD (  24.85  )
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

T24gVHVlLCBBdWcgMjYsIDIwMjUgYXQgMTE6NDg6NDhBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBUdWUsIEF1ZyAyNiwgMjAyNSBhdCA4OjMy4oCvQU0gUm9iaW4gTXVycGh5IDxyb2Jp
bi5tdXJwaHlAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gMjAyNS0wOC0yNiAyOjAzIHBtLCBQ
ZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+ID4gT24gV2VkLCBBdWcgMTMsIDIwMjUgYXQgMDY6MDE6
MDRQTSArMDEwMCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+ID4gPj4gSXQgbWF5IGhhdmUgYmVlbiBk
aWZmZXJlbnQgbG9uZyBhZ28sIGJ1dCB0b2RheSBpdCBzZWVtcyB3cm9uZyBmb3IgdGhlc2UKPiA+
ID4+IGRyaXZlcnMgdG8gc2tpcCBjb3VudGluZyBkaXNhYmxlZCBzaWJsaW5nIGV2ZW50cyBpbiBn
cm91cCB2YWxpZGF0aW9uLAo+ID4gPj4gZ2l2ZW4gdGhhdCBwZXJmX2V2ZW50X2VuYWJsZSgpIGNv
dWxkIG1ha2UgdGhlbSBzY2hlZHVsYWJsZSBhZ2FpbiwgYW5kCj4gPiA+PiB0aHVzIGluY3JlYXNl
IHRoZSBlZmZlY3RpdmUgc2l6ZSBvZiB0aGUgZ3JvdXAgbGF0ZXIuIENvbnZlcnNlbHksIGlmIGEK
PiA+ID4+IHNpYmxpbmcgZXZlbnQgaXMgdHJ1bHkgZGVhZCB0aGVuIGl0IHN0YW5kcyB0byByZWFz
b24gdGhhdCB0aGUgd2hvbGUKPiA+ID4+IGdyb3VwIGlzIGRlYWQsIHNvIGl0J3Mgbm90IHdvcnRo
IGdvaW5nIHRvIGFueSBzcGVjaWFsIGVmZm9ydCB0byB0cnkgdG8KPiA+ID4+IHNxdWVlemUgaW4g
YSBuZXcgZXZlbnQgdGhhdCdzIG5ldmVyIGdvaW5nIHRvIHJ1biBhbnl3YXkuIFRodXMsIHdlIGNh
bgo+ID4gPj4gc2ltcGx5IHJlbW92ZSBhbGwgdGhlc2UgY2hlY2tzLgo+ID4gPgo+ID4gPiBTbyBj
dXJyZW50bHkgeW91IGNhbiBkbyBzb3J0IG9mIGEgbWFudWFsIGV2ZW50IHJvdGF0aW9uIGluc2lk
ZSBhbgo+ID4gPiBvdmVyLXNpemVkIGdyb3VwIGFuZCBoYXZlIGl0IHdvcmsuCj4gPiA+Cj4gPiA+
IEknbSBub3Qgc3VyZSBpZiBhbnlib2R5IGFjdHVhbGx5IGRvZXMgdGhpcywgYnV0IGl0cyBwb3Nz
aWJsZS4KPiA+ID4KPiA+ID4gRWcuIG9uIGEgUE1VIHRoYXQgc3VwcG9ydHMgb25seSA0IGNvdW50
ZXJzLCBjcmVhdGUgYSBncm91cCBvZiA1IGFuZAo+ID4gPiBwZXJpb2RpY2FsbHkgY3ljbGUgd2hp
Y2ggb2YgdGhlIDUgZXZlbnRzIGlzIG9mZi4KPiAKPiBJJ20gbm90IHN1cmUgdGhpcyBpcyB0cnVl
LCBJIHRob3VnaHQgdGhpcyB3b3VsZCBmYWlsIGluIHRoZQo+IHBlcmZfZXZlbnRfb3BlbiB3aGVu
IGFkZGluZyB0aGUgNXRoIGV2ZW50IGFuZCB0aGVyZSBiZWluZyBpbnN1ZmZpY2llbnQKPiBjb3Vu
dGVycyBmb3IgdGhlIGdyb3VwLgoKV2UncmUgdGFsa2luZyBzcGVjaWZpY2FsbHkgYWJvdXQgY2Fz
ZXMgd2hlcmUgdGhlIGxvZ2ljIGluIGEgcG11J3MKcG11OjpldmVudF9pbml0KCkgY2FsbGJhY2sg
ZG9lc24ndCBjb3VudCBldmVudHMgaW4gc3BlY2lmaWMgc3RhdGVzLCBhbmQKaGVuY2UgdGhlIDV0
aCBldmVuIGRvZXNuJ3QgZ2V0IHJlamVjdGVkIHdoZW4gaXQgaXMgaW5pdGlhbGlzZWQuCgpGb3Ig
ZXhhbXBsZSwgaW4gYXJjaC94ODYvZXZlbnRzL2NvcmUuYywgdmFsaWRhdGVfZ3JvdXAoKSB1c2Vz
CmNvbGxlY3RfZXZlbnRzKCksIHdoaWNoIGhhczoKCglmb3JfZWFjaF9zaWJsaW5nX2V2ZW50KGV2
ZW50LCBsZWFkZXIpIHsKCQlpZiAoIWlzX3g4Nl9ldmVudChldmVudCkgfHwgZXZlbnQtPnN0YXRl
IDw9IFBFUkZfRVZFTlRfU1RBVEVfT0ZGKQoJCQljb250aW51ZTsKCgkJaWYgKGNvbGxlY3RfZXZl
bnQoY3B1YywgZXZlbnQsIG1heF9jb3VudCwgbikpCgkJCXJldHVybiAtRUlOVkFMOwoKCQluKys7
Cgl9CgouLi4gYW5kIHNvIHdoZXJlIGFuIGV2ZW50J3Mgc3RhdGUgaXMgPD0gUEVSRl9FVkVOVF9T
VEFURV9PRkYgYXQgaW5pdAp0aW1lLCB0aGF0IGV2ZW50IGlzIG5vdCBjb3VudGVkIHRvIHNlZSBp
ZiBpdCBmaXRzIGludG8gSFcgY291bnRlcnMuCgpNYXJrLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
