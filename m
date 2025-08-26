Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB440CA0FE7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Aug 2025 18:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxgSp494nAOh3vZlOJMZvDhhekKXSNZOigiwDYkVWsU=; b=jQX7NvvVHNAc7e
	0ISVTuyrzFYr2edpl6HZ45V5ORYxhi3EjCK564ds5h3x/QPlGtv/VMSLw2ve21Xcelu6bRhzlSQf0
	aJPGKtSA+chw2NvYm6VtnwJcj3hWjtFbPh7nwbDh/gom5IP9NquxTb2pd6qzUZ88d3haahcI7RJjG
	3QD1D4bx/7cEhrjah+XIcUTNAUGbGsrjihkStcecvpJKBw0xbn3miZjg+hMfP2q/I+Gxg+8VplbxV
	OQvusIWkEwtd57sZiVhQgNcgQKxvnPdFsuhwhpm6UVXK4rBHm1hKzbSopvbOgQ6jCMnPIXKFOg7aH
	XjNH6TQKWAx3w3QLVFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqyls-0000000Cutr-0mJ1;
	Tue, 26 Aug 2025 18:51:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqyj7-0000000CuQi-2cLH
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Aug 2025 18:49:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-24611734e50so26155ad.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 26 Aug 2025 11:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756234141; x=1756838941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
        b=jJ/dwj/AlFqnBpfUvJ5LJwfS+pj2hnPfW0zswMiU5UexA0WP88bYNn928kqWqifQUM
         /GwpHLwhhmEGN1esTPcZG+VC1m8eZMMJNK64akijE13umpu2Ggj8BMOq0t8Vsd3nwtzA
         5hRZGN0fBS9NNMTwYWF7aT9fHUfx/+/MmMcGLryT3kzkej7T86HkJJrSRKPzF5Q/ZURs
         a/dxCjZ7rVQugh9GUaM4AqsssTuR14hokAbddFiSdtUuh53HaBT/O4cAZRSRbTMRPn5h
         M5ozMEhJUKe+8OL9s/V25nzfoCOU2WiuYYtQmaIb0iqKbW43SvoOaFIFdLwu9Bh9WjwY
         TQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756234141; x=1756838941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
        b=VrZwHSN0kdkhKL7RY3RnjEGeEaOxlympXlFyBubKOhGP7qNbuFS+jEc3VqwHP689t2
         40AoCARNC4Lz+Ses9V9W6TB0cS8Ux50SWplCifVwO5kegfzMQbaxru88BY/v1GuxBtKE
         Iw03N5NVf0N+bXSPgKnY828PDW9Xu98vA6l2N1Xuuy/4pi+F/VDwGknODuc+JN7MzcVo
         adBY+vLHG8JRvlw+RIm+B1XQkJN+X7d1qaM6lW6FpwDuLN/tYFwog9KAboKq5KAanUCl
         hSJHa8kVaNuHoOXseFfNdKz/YQ9BZ9X3DaIBqhGFd9YLSeQnGCqXZ06MhQU8JlwWaw/z
         vyCA==
X-Forwarded-Encrypted: i=1; AJvYcCWuzmzhR20+iRjimj9JpIJ3eEqME7A9nn2VuSPhNjYOh6ZGuv6Lu1hsmdgfbVShFixGwE3j9PelsdWd06ENbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMuL2d0deWOBn6DV2x1Rz/0a2DOdU7DdZ9SuCP8m52wHYaWwot
	TLzgYYfYZKkQwNfx6GqmNS62w5oC6umgg56Ep2ytW+vt+mNZ1CqzcVVZ6S14xm4lsVseF/XRqB8
	yYD/X2J2YejigFIVmzQHgwhtkX8Jcak+bCugjHqcV
X-Gm-Gg: ASbGncszO/RETJVAQvwmvTZaQjoC2MM1zifTYBgpi3wJMWTp74dxJJ4z9IGSOCh+wpD
	lJ6DRaqXWQewroetuTdDmbHdGeicyWqG+gcOIflflCVCLXNDgvEjnH4Kstv/sh42FrHiFQCL+jA
	EWdDe/a/WJ61bq3vv1gtUydD1DuNABZ8HIIIigO0Rd/1u8rU4zyyyU7kFyAhZojNdInhqOxz8LA
	uYoGr1kB44xDVNu4Epv+wX2ZOnWmtKLnYbrx61C/hZrlnCPilPqFnQ1EPwmjmNr
X-Google-Smtp-Source: AGHT+IG+ollMBmiaOYcyGD4fK0EXbH34IwD2F+IqBBnZbD5S5EK8GUe1Cco16tj20beWZxJ5YP1hQInru/5q0vhDcUY=
X-Received: by 2002:a17:903:228c:b0:243:afef:cd88 with SMTP id
 d9443c01a7336-2486395f193mr4627105ad.11.1756234140425; Tue, 26 Aug 2025
 11:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com> <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net> <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
In-Reply-To: <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 26 Aug 2025 11:48:48 -0700
X-Gm-Features: Ac12FXxL0fQGFTk6-3SCJz15Qd8Ums9V_bcQA6gIxaEwQacWk3scYfeQZZ7cYZQ
Message-ID: <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, will@kernel.org, 
	mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_114901_666460_E87DD15C 
X-CRM114-Status: GOOD (  37.30  )
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

T24gVHVlLCBBdWcgMjYsIDIwMjUgYXQgODozMuKAr0FNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVy
cGh5QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyNS0wOC0yNiAyOjAzIHBtLCBQZXRlciBaaWps
c3RyYSB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDA2OjAxOjA0UE0gKzAxMDAs
IFJvYmluIE11cnBoeSB3cm90ZToKPiA+PiBJdCBtYXkgaGF2ZSBiZWVuIGRpZmZlcmVudCBsb25n
IGFnbywgYnV0IHRvZGF5IGl0IHNlZW1zIHdyb25nIGZvciB0aGVzZQo+ID4+IGRyaXZlcnMgdG8g
c2tpcCBjb3VudGluZyBkaXNhYmxlZCBzaWJsaW5nIGV2ZW50cyBpbiBncm91cCB2YWxpZGF0aW9u
LAo+ID4+IGdpdmVuIHRoYXQgcGVyZl9ldmVudF9lbmFibGUoKSBjb3VsZCBtYWtlIHRoZW0gc2No
ZWR1bGFibGUgYWdhaW4sIGFuZAo+ID4+IHRodXMgaW5jcmVhc2UgdGhlIGVmZmVjdGl2ZSBzaXpl
IG9mIHRoZSBncm91cCBsYXRlci4gQ29udmVyc2VseSwgaWYgYQo+ID4+IHNpYmxpbmcgZXZlbnQg
aXMgdHJ1bHkgZGVhZCB0aGVuIGl0IHN0YW5kcyB0byByZWFzb24gdGhhdCB0aGUgd2hvbGUKPiA+
PiBncm91cCBpcyBkZWFkLCBzbyBpdCdzIG5vdCB3b3J0aCBnb2luZyB0byBhbnkgc3BlY2lhbCBl
ZmZvcnQgdG8gdHJ5IHRvCj4gPj4gc3F1ZWV6ZSBpbiBhIG5ldyBldmVudCB0aGF0J3MgbmV2ZXIg
Z29pbmcgdG8gcnVuIGFueXdheS4gVGh1cywgd2UgY2FuCj4gPj4gc2ltcGx5IHJlbW92ZSBhbGwg
dGhlc2UgY2hlY2tzLgo+ID4KPiA+IFNvIGN1cnJlbnRseSB5b3UgY2FuIGRvIHNvcnQgb2YgYSBt
YW51YWwgZXZlbnQgcm90YXRpb24gaW5zaWRlIGFuCj4gPiBvdmVyLXNpemVkIGdyb3VwIGFuZCBo
YXZlIGl0IHdvcmsuCj4gPgo+ID4gSSdtIG5vdCBzdXJlIGlmIGFueWJvZHkgYWN0dWFsbHkgZG9l
cyB0aGlzLCBidXQgaXRzIHBvc3NpYmxlLgo+ID4KPiA+IEVnLiBvbiBhIFBNVSB0aGF0IHN1cHBv
cnRzIG9ubHkgNCBjb3VudGVycywgY3JlYXRlIGEgZ3JvdXAgb2YgNSBhbmQKPiA+IHBlcmlvZGlj
YWxseSBjeWNsZSB3aGljaCBvZiB0aGUgNSBldmVudHMgaXMgb2ZmLgoKSSdtIG5vdCBzdXJlIHRo
aXMgaXMgdHJ1ZSwgSSB0aG91Z2h0IHRoaXMgd291bGQgZmFpbCBpbiB0aGUKcGVyZl9ldmVudF9v
cGVuIHdoZW4gYWRkaW5nIHRoZSA1dGggZXZlbnQgYW5kIHRoZXJlIGJlaW5nIGluc3VmZmljaWVu
dApjb3VudGVycyBmb3IgdGhlIGdyb3VwLiBOb3QgYWxsIFBNVXMgdmFsaWRhdGUgYSBncm91cCB3
aWxsIGZpdCBvbiB0aGUKY291bnRlcnMsIGJ1dCBJIHRob3VnaHQgYXQgbGVhc3QgSW50ZWwncyBj
b3JlIFBNVSB3b3VsZCB2YWxpZGF0ZSBhbmQKbm90IGFsbG93IHRoaXMuIEZ3aXcsIHRoZSBtZXRy
aWMgY29kZSBpcyByZWxpYW50IG9uIHRoaXMgYmVoYXZpb3IgYXMKYnkgZGVmYXVsdCBhbGwgZXZl
bnRzIGFyZSBwbGFjZWQgaW50byBhIHdlYWsgZ3JvdXA6Cmh0dHBzOi8vd2ViLmdpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJl
ZS90b29scy9wZXJmL3V0aWwvbWV0cmljZ3JvdXAuYz9oPXBlcmYtdG9vbHMtbmV4dCNuNjMxCldl
YWsgZ3JvdXBzIGFyZSByZWFsbHkganVzdCBncm91cHMgdGhhdCB3aGVuIHRoZSBwZXJmX2V2ZW50
X29wZW4gZmFpbHMKcmV0cnkgd2l0aCB0aGUgZ3JvdXBpbmcgcmVtb3ZlZC4gUE1VcyB0aGF0IGRv
bid0IGZhaWwgdGhlCnBlcmZfZXZlbnRfb3BlbiBhcmUgcHJvYmxlbWF0aWMgYXMgdGhlIHJlYWRz
IGp1c3QgcmVwb3J0ICJub3QgY291bnRlZCIKYW5kIHRoZSBtZXRyaWMgZG9lc24ndCB3b3JrLiBT
b21ldGltZXMgdGhlIFBNVSBjYW4ndCBoZWxwIGl0IGR1ZSB0bwplcnJhdGEuIFRoZXJlIGFyZSBh
IGJ1bmNoIG9mIHdvcmthcm91bmRzIGZvciB0aG9zZSBjYXNlcyBjYXJyaWVkIGluCnRoZSBwZXJm
IHRvb2wsIGJ1dCBpbiBnZW5lcmFsIHdlYWsgZ3JvdXBzIHdvcmtpbmcgaXMgcmVsaWVkIHVwb246
Cmh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJm
L3BlcmYtdG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9wZXJmL3BtdS1ldmVudHMvcG11LWV2ZW50
cy5oP2g9cGVyZi10b29scy1uZXh0I24xNgoKVGhhbmtzLApJYW4KCj4gPiBTbyBJJ20gbm90IGFn
YWluc3QgY2hhbmdpbmcgdGhpcywgYnV0IGNoYW5naW5nIHN0dWZmIGxpa2UgdGhpcyBhbHdheXMK
PiA+IG1ha2VzIG1lIGEgbGl0dGxlIGZlYXJmdWwgLS0gaXQgd291bGRuJ3QgYmUgdGhlIGZpcnN0
IHRpbWUgdGhhdCB3aGVuIGl0Cj4gPiBmaW5hbGx5IHRyaWNrbGVzIGRvd24gdG8gc29tZSAnZW50
ZXJwcmlzZScgdXNlciBpbiA1IHllYXJzIHNvbWVvbmUgY29tZXMKPiA+IGFuZCBmaW5hbGx5IHNh
eXMsIG9oIGhleSwgeW91IGJyb2tlIG15IHNoaXQgOi0oCj4KPiBFd3csIEkgc2VlIHdoYXQgeW91
IG1lYW4uLi4gYW5kIEkgZ3Vlc3MgdGhhdCdzIHByb2JhYmx5IGxvd2VyLW92ZXJoZWFkCj4gdGhh
biBhY3R1YWxseSBkZWxldGluZyBhbmQgcmVjcmVhdGluZyB0aGUgc2libGluZyBldmVudChzKSBl
YWNoIHRpbWUsCj4gYW5kIHBvdGVudGlhbGx5IGxlc3MgYm90aGVyIHRoZW4gd3JhbmdsaW5nIG11
bHRpcGxlIGdyb3VwcyBmb3IgZGlmZmVyZW50Cj4gY29tYmluYXRpb25zIG9mIHN1YnNldHMgd2hl
biBvbmUgc2ltcGx5IG11c3Qgc3RpbGwgYXBwcm94aW1hdGUgYSBjb21wbGV4Cj4gbWV0cmljIHRo
YXQgcmVxdWlyZXMgbW9yZSBjb3VudGVycyB0aGFuIHRoZSBoYXJkd2FyZSBvZmZlcnMuCj4KPiBJ
J20gYWxzbyBub3Qga2VlbiB0byBicmVhayBhbnl0aGluZyB0aGF0IHdhc24ndCBhbHJlYWR5IHNv
bWV3aGF0IGJyb2tlbiwKPiBlc3BlY2lhbGx5IHNpbmNlIHRoaXMgcGF0Y2ggaXMgb25seSBpbnRl
bmRlZCBhcyBjbGVhbnVwLCBzbyBlaXRoZXIgd2UKPiBjb3VsZCBqdXN0IGRyb3AgaXQgYWx0b2dl
dGhlciwgb3IgcGVyaGFwcyBJIGNhbiB3cmFwIHRoZSBleGlzdGluZwo+IGJlaGF2aW91ciBpbiBh
IGhlbHBlciB0aGF0IGNhbiBhdCBsZWFzdCBkb2N1bWVudCB0aGlzIGFzc3VtcHRpb24gYW5kCj4g
ZGlzY291cmFnZSBuZXcgZHJpdmVycyBmcm9tIGNvcHlpbmcgaXQuIEFtIEkgcmlnaHQgdGhhdCBv
bmx5Cj4gUEVSRl9FVkVOVF9TVEFURV97T0ZGLEVSUk9SfSB3b3VsZCBtYXR0ZXIgZm9yIHRoaXMs
IHRob3VnaCwgYW5kIG15Cj4gcmVhc29uaW5nIGZvciBzdGF0ZSA8PSBQRVJGX0VWRU5UX1NUQVRF
X0VYSVQgc2hvdWxkIHN0aWxsIHN0YW5kPyBBcyBmb3IKPiB0aGUgZmlkZGx5IGRpc2NyZXBhbmN5
IHdpdGggZW5hYmxlX29uX2V4ZWMgYmV0d2VlbiBhcm1fcG11IGFuZCBvdGhlcnMKPiBJJ20gbm90
IHJlYWxseSBzdXJlIHdoYXQgdG8gdGhpbmsuLi4KPgo+IFRoYW5rcywKPiBSb2Jpbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJj
IG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
