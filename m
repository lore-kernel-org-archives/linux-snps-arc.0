Return-Path: <SRS0=u26R=4T=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EA5C3F2D1
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Mar 2020 19:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C0B72468A
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Mar 2020 19:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LPy7xI38";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="dWCEq9Tb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C0B72468A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PM7TaO3J2jupdpIM2c0TjqBIPwTMpczbXNceXqPUKlc=; b=LPy7xI38gHOY0J
	bHHMDd3/R18kAy93eK4+kzj3koW7lNuZhYFxnXvrsEGm97KIHQ8whWYVO8YkxrXGDyGE/YoyfOXfQ
	QFoNKt2bJeURNoHJ8CDw8o1QTaaBkok54sijHydtesgROfuPHXbIAxrH353n/Mdrz9neQZ6mB6pCp
	c38v1yuMjad8UH94gQP6STxDrLZe2l2xBpakwz6CjIJjFmaZlnas5qKWNBO26bGR1Eeh8k1MKvOjw
	iBLsbfqTOnfrNLoArMwPD4E9vwiW60AmZY7BqKVN2V38SVU9qr3tPdmpwKbzNGZYPaB4rqzMLoe3d
	L7DvUZALOA7JwpKZolPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8qvz-00076b-Hc; Mon, 02 Mar 2020 19:40:59 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8qvq-0006wy-Qm
 for linux-snps-arc@lists.infradead.org; Mon, 02 Mar 2020 19:40:53 +0000
Received: by mail-qk1-x742.google.com with SMTP id e16so896196qkl.6
 for <linux-snps-arc@lists.infradead.org>; Mon, 02 Mar 2020 11:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fpur9odzhdIzgZKAdXT5OufUWZiXDywyFJGHnsjLJuo=;
 b=dWCEq9TbdtlIn4IlSjT7wsgDMqKSoAKLzae3C569gQfG+p+Vk79gjYDp0p50OXn9hR
 Xm7x5cNfSGrA7pZOqbIyHB6YbB5olZ4ep8KMLse+bohRCUq99hLzFTyhfizQ0g1MVv9z
 PDB5fH+ahTLkKU8vUdes9sSXGelGjiIZoAKN6HTkKzUfig+h5pTHRYeWb9NP7s3wdS9t
 Tt4WNgQv8yFdtznernPNmQzDX+ip0C+UgbaM/+RzUP5kH1SCJgpVi8ZPrt/2QDdNj0Vc
 NTeqpeeYYjJCxNEWEDDoAqM078dLwnuNGGPGzRM4Bt0EmoCaK9xyew4usRNSVcQzIQqy
 2SAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fpur9odzhdIzgZKAdXT5OufUWZiXDywyFJGHnsjLJuo=;
 b=Yn5kRxJURKwmtO0ta/1vZ0kdnXxjfamggWJs+o2DYVah3xlvn/2c8g3Qg09uq2lHgw
 KFANok6oAJEa3zrEJJasd5EIWPZEEHz8/UiuGjlO0LJomVmXsDHMG7yDDPJCpd6iLaro
 H3FDmOf2VY//5mSD1ZjjDpEvZHD6FBNT7Sk3MC9pI8osy0J+pOfOP2YClqHcz3yoBUOm
 HveRwQeJgObzXo3TAGSblWGA1mhHDwL8RvfheTO3VAEVmONJBSjKjpSV+aznn7MnnJQz
 DOqnGswD1c6iACL7LAPd6uxyD5KZtePF9tj6n/UBDv4AJQ/8lgMb5XBvOl/4fTUS2Ghu
 GCiw==
X-Gm-Message-State: ANhLgQ0cY6LofMFI2rUIOVs8jO5MebSIrUkKFMVBVuufOXFsy7dU3mZG
 dkSeI7Qt5ZuOQmNHNSsDEy6++Q==
X-Google-Smtp-Source: ADFU+vvIre6Pknx1npljKo6V/87YN9X3Pm++i6mQcGcNAIn71bgolvXPcuZTIRGu9NVtwEvKfxAUQw==
X-Received: by 2002:ae9:f205:: with SMTP id m5mr857097qkg.152.1583178047563;
 Mon, 02 Mar 2020 11:40:47 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id s139sm6748558qke.70.2020.03.02.11.40.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 11:40:46 -0800 (PST)
Message-ID: <1583178042.7365.146.camel@lca.pw>
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Anshuman Khandual
 <anshuman.khandual@arm.com>, linux-mm@kvack.org
Date: Mon, 02 Mar 2020 14:40:42 -0500
In-Reply-To: <1582732318.7365.129.camel@lca.pw>
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
 <1582726182.7365.123.camel@lca.pw>
 <7c707b7f-ce3d-993b-8042-44fdc1ed28bf@c-s.fr>
 <1582732318.7365.129.camel@lca.pw>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_114050_867407_5F2269D4 
X-CRM114-Status: GOOD (  23.33  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIwLTAyLTI2IGF0IDEwOjUxIC0wNTAwLCBRaWFuIENhaSB3cm90ZToKPiBPbiBX
ZWQsIDIwMjAtMDItMjYgYXQgMTU6NDUgKzAxMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4g
PiAKPiA+IExlIDI2LzAyLzIwMjAgw6AgMTU6MDksIFFpYW4gQ2FpIGEgw6ljcml0wqA6Cj4gPiA+
IE9uIE1vbiwgMjAyMC0wMi0xNyBhdCAwODo0NyArMDUzMCwgQW5zaHVtYW4gS2hhbmR1YWwgd3Jv
dGU6Cj4gPiA+ID4gVGhpcyBhZGRzIHRlc3RzIHdoaWNoIHdpbGwgdmFsaWRhdGUgYXJjaGl0ZWN0
dXJlIHBhZ2UgdGFibGUgaGVscGVycyBhbmQKPiA+ID4gPiBvdGhlciBhY2Nlc3NvcnMgaW4gdGhl
aXIgY29tcGxpYW5jZSB3aXRoIGV4cGVjdGVkIGdlbmVyaWMgTU0gc2VtYW50aWNzLgo+ID4gPiA+
IFRoaXMgd2lsbCBoZWxwIHZhcmlvdXMgYXJjaGl0ZWN0dXJlcyBpbiB2YWxpZGF0aW5nIGNoYW5n
ZXMgdG8gZXhpc3RpbmcKPiA+ID4gPiBwYWdlIHRhYmxlIGhlbHBlcnMgb3IgYWRkaXRpb24gb2Yg
bmV3IG9uZXMuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyB0ZXN0IGNvdmVycyBiYXNpYyBwYWdlIHRh
YmxlIGVudHJ5IHRyYW5zZm9ybWF0aW9ucyBpbmNsdWRpbmcgYnV0IG5vdAo+ID4gPiA+IGxpbWl0
ZWQgdG8gb2xkLCB5b3VuZywgZGlydHksIGNsZWFuLCB3cml0ZSwgd3JpdGUgcHJvdGVjdCBldGMg
YXQgdmFyaW91cwo+ID4gPiA+IGxldmVsIGFsb25nIHdpdGggcG9wdWxhdGluZyBpbnRlcm1lZGlh
dGUgZW50cmllcyB3aXRoIG5leHQgcGFnZSB0YWJsZSBwYWdlCj4gPiA+ID4gYW5kIHZhbGlkYXRp
bmcgdGhlbS4KPiA+ID4gPiAKPiA+ID4gPiBUZXN0IHBhZ2UgdGFibGUgcGFnZXMgYXJlIGFsbG9j
YXRlZCBmcm9tIHN5c3RlbSBtZW1vcnkgd2l0aCByZXF1aXJlZCBzaXplCj4gPiA+ID4gYW5kIGFs
aWdubWVudHMuIFRoZSBtYXBwZWQgcGZucyBhdCBwYWdlIHRhYmxlIGxldmVscyBhcmUgZGVyaXZl
ZCBmcm9tIGEKPiA+ID4gPiByZWFsIHBmbiByZXByZXNlbnRpbmcgYSB2YWxpZCBrZXJuZWwgdGV4
dCBzeW1ib2wuIFRoaXMgdGVzdCBnZXRzIGNhbGxlZAo+ID4gPiA+IGluc2lkZSBrZXJuZWxfaW5p
dCgpIHJpZ2h0IGFmdGVyIGFzeW5jX3N5bmNocm9uaXplX2Z1bGwoKS4KPiA+ID4gPiAKPiA+ID4g
PiBUaGlzIHRlc3QgZ2V0cyBidWlsdCBhbmQgcnVuIHdoZW4gQ09ORklHX0RFQlVHX1ZNX1BHVEFC
TEUgaXMgc2VsZWN0ZWQuIEFueQo+ID4gPiA+IGFyY2hpdGVjdHVyZSwgd2hpY2ggaXMgd2lsbGlu
ZyB0byBzdWJzY3JpYmUgdGhpcyB0ZXN0IHdpbGwgbmVlZCB0byBzZWxlY3QKPiA+ID4gPiBBUkNI
X0hBU19ERUJVR19WTV9QR1RBQkxFLiBGb3Igbm93IHRoaXMgaXMgbGltaXRlZCB0byBhcmMsIGFy
bTY0LCB4ODYsIHMzOTAKPiA+ID4gPiBhbmQgcHBjMzIgcGxhdGZvcm1zIHdoZXJlIHRoZSB0ZXN0
IGlzIGtub3duIHRvIGJ1aWxkIGFuZCBydW4gc3VjY2Vzc2Z1bGx5Lgo+ID4gPiA+IEdvaW5nIGZv
cndhcmQsIG90aGVyIGFyY2hpdGVjdHVyZXMgdG9vIGNhbiBzdWJzY3JpYmUgdGhlIHRlc3QgYWZ0
ZXIgZml4aW5nCj4gPiA+ID4gYW55IGJ1aWxkIG9yIHJ1bnRpbWUgcHJvYmxlbXMgd2l0aCB0aGVp
ciBwYWdlIHRhYmxlIGhlbHBlcnMuIE1lYW53aGlsZSBmb3IKPiA+ID4gPiBiZXR0ZXIgcGxhdGZv
cm0gY292ZXJhZ2UsIHRoZSB0ZXN0IGNhbiBhbHNvIGJlIGVuYWJsZWQgd2l0aCBDT05GSUdfRVhQ
RVJUCj4gPiA+ID4gZXZlbiB3aXRob3V0IEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUuCj4gPiA+
ID4gCj4gPiA+ID4gRm9sa3MgaW50ZXJlc3RlZCBpbiBtYWtpbmcgc3VyZSB0aGF0IGEgZ2l2ZW4g
cGxhdGZvcm0ncyBwYWdlIHRhYmxlIGhlbHBlcnMKPiA+ID4gPiBjb25mb3JtIHRvIGV4cGVjdGVk
IGdlbmVyaWMgTU0gc2VtYW50aWNzIHNob3VsZCBlbmFibGUgdGhlIGFib3ZlIGNvbmZpZwo+ID4g
PiA+IHdoaWNoIHdpbGwganVzdCB0cmlnZ2VyIHRoaXMgdGVzdCBkdXJpbmcgYm9vdC4gQW55IG5v
biBjb25mb3JtaXR5IGhlcmUgd2lsbAo+ID4gPiA+IGJlIHJlcG9ydGVkIGFzIGFuIHdhcm5pbmcg
d2hpY2ggd291bGQgbmVlZCB0byBiZSBmaXhlZC4gVGhpcyB0ZXN0IHdpbGwgaGVscAo+ID4gPiA+
IGNhdGNoIGFueSBjaGFuZ2VzIHRvIHRoZSBhZ3JlZWQgdXBvbiBzZW1hbnRpY3MgZXhwZWN0ZWQg
ZnJvbSBnZW5lcmljIE1NIGFuZAo+ID4gPiA+IGVuYWJsZSBwbGF0Zm9ybXMgdG8gYWNjb21tb2Rh
dGUgaXQgdGhlcmVhZnRlci4KPiA+ID4gCj4gPiA+IEhvdyB1c2VmdWwgaXMgdGhpcyB0aGF0IHN0
cmFpZ2h0bHkgY3Jhc2ggdGhlIHBvd2VycGM/Cj4gPiA+IAo+ID4gPiBbwqDCoMKgMjMuMjYzNDI1
XVvCoMKgwqDCoFQxXSBkZWJ1Z192bV9wZ3RhYmxlOiBkZWJ1Z192bV9wZ3RhYmxlOiBWYWxpZGF0
aW5nCj4gPiA+IGFyY2hpdGVjdHVyZSBwYWdlIHRhYmxlIGhlbHBlcnMKPiA+ID4gW8KgwqDCoDIz
LjI2MzYyNV1bwqDCoMKgwqBUMV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0t
Cj4gPiA+IFvCoMKgwqAyMy4yNjM2NDldW8KgwqDCoMKgVDFdIGtlcm5lbCBCVUcgYXQgYXJjaC9w
b3dlcnBjL21tL3BndGFibGUuYzoyNzQhCj4gPiAKPiA+IFRoZSBwcm9ibGVtIG9uIFBQQzY0IGlz
IGtub3duIGFuZCBoYXMgdG8gYmUgaW52ZXN0aWdhdGVkIGFuZCBmaXhlZC4KPiAKPiBJdCBtaWdo
dCBiZSBpbnRlcmVzdGluZyB0byBoZWFyIHdoYXQgcG93ZXJwYzY0IG1haW50YWluZXJzIHdvdWxk
IHNheSBhYm91dCBpdAo+IGFuZCBpZiBpdCBpcyBhY3R1YWxseSB3b3J0aCAiZml4aW5nIiBpbiB0
aGUgYXJjaCBjb2RlLCBidXQgdGhhdCBCVUdfT04oKSB3YXMKPiB0aGVyZSBzaW5jZSAyMDA5IGFu
ZCBoYWQgbm90IGJlZW4gZXhwb3NlZCB1bnRpbCB0aGlzIHBhdGNoIGNvbWVzIGFsb25lPwoKVGhp
cyBwYXRjaCBiZWxvdyBtYWtlcyBpdCB3b3JrcyBvbiBwb3dlcnBjNjQgaW4gb3JkZXIgdG8gZG9k
Z2UgdGhlIEJVR19PTigpcyBpbiAKYXNzZXJ0X3B0ZV9sb2NrZWQoKSB0cmlnZ2VyZWQgYnkgcHRl
X2NsZWFyX3Rlc3RzKCkuCgoKZGlmZiAtLWdpdCBhL21tL2RlYnVnX3ZtX3BndGFibGUuYyBiL21t
L2RlYnVnX3ZtX3BndGFibGUuYwppbmRleCA5NmRkN2Q1NzRjZWYuLjUwYjM4NTIzMzk3MSAxMDA2
NDQKLS0tIGEvbW0vZGVidWdfdm1fcGd0YWJsZS5jCisrKyBiL21tL2RlYnVnX3ZtX3BndGFibGUu
YwpAQCAtNTUsNiArNTUsOCBAQArCoCNkZWZpbmUgUkFORE9NX09SVkFMVUUJR0VOTUFTSyhCSVRT
X1BFUl9MT05HIC0gMSwgUzM5MF9NQVNLX0JJVFMpCsKgI2RlZmluZSBSQU5ET01fTlpWQUxVRQlH
RU5NQVNLKDcsIDApCsKgCit1bnNpZ25lZCBsb25nIHZhZGRyOworCsKgc3RhdGljIHZvaWQgX19p
bml0IHB0ZV9iYXNpY190ZXN0cyh1bnNpZ25lZCBsb25nIHBmbiwgcGdwcm90X3QgcHJvdCkKwqB7
CsKgCXB0ZV90IHB0ZSA9IHBmbl9wdGUocGZuLCBwcm90KTsKQEAgLTI1Niw3ICsyNTgsNyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgcHRlX2NsZWFyX3Rlc3RzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLApw
dGVfdCAqcHRlcCkKwqAKwqAJcHRlID0gX19wdGUocHRlX3ZhbChwdGUpIHwgUkFORE9NX09SVkFM
VUUpOwrCoAlXUklURV9PTkNFKCpwdGVwLCBwdGUpOwotCXB0ZV9jbGVhcihtbSwgMCwgcHRlcCk7
CisJcHRlX2NsZWFyKG1tLCB2YWRkciwgcHRlcCk7CsKgCXB0ZSA9IFJFQURfT05DRSgqcHRlcCk7
CsKgCVdBUk5fT04oIXB0ZV9ub25lKHB0ZSkpOwrCoH0KQEAgLTMxMCw4ICszMTIsOSBAQCB2b2lk
IF9faW5pdCBkZWJ1Z192bV9wZ3RhYmxlKHZvaWQpCsKgCXBndGFibGVfdCBzYXZlZF9wdGVwOwrC
oAlwZ3Byb3RfdCBwcm90OwrCoAlwaHlzX2FkZHJfdCBwYWRkcjsKLQl1bnNpZ25lZCBsb25nIHZh
ZGRyLCBwdGVfYWxpZ25lZCwgcG1kX2FsaWduZWQ7CisJdW5zaWduZWQgbG9uZyBwdGVfYWxpZ25l
ZCwgcG1kX2FsaWduZWQ7CsKgCXVuc2lnbmVkIGxvbmcgcHVkX2FsaWduZWQsIHA0ZF9hbGlnbmVk
LCBwZ2RfYWxpZ25lZDsKKwlzcGlubG9ja190ICpwdGw7CsKgCsKgCXByX2luZm8oIlZhbGlkYXRp
bmcgYXJjaGl0ZWN0dXJlIHBhZ2UgdGFibGUgaGVscGVyc1xuIik7CsKgCXByb3QgPSB2bV9nZXRf
cGFnZV9wcm90KFZNRkxBR1MpOwpAQCAtMzQ0LDcgKzM0Nyw3IEBAIHZvaWQgX19pbml0IGRlYnVn
X3ZtX3BndGFibGUodm9pZCkKwqAJcDRkcCA9IHA0ZF9hbGxvYyhtbSwgcGdkcCwgdmFkZHIpOwrC
oAlwdWRwID0gcHVkX2FsbG9jKG1tLCBwNGRwLCB2YWRkcik7CsKgCXBtZHAgPSBwbWRfYWxsb2Mo
bW0sIHB1ZHAsIHZhZGRyKTsKLQlwdGVwID0gcHRlX2FsbG9jX21hcChtbSwgcG1kcCwgdmFkZHIp
OworCXB0ZXAgPSBwdGVfYWxsb2NfbWFwX2xvY2sobW0sIHBtZHAsIHZhZGRyLCAmcHRsKTsKwqAK
wqAJLyoKwqAJwqAqIFNhdmUgYWxsIHRoZSBwYWdlIHRhYmxlIHBhZ2UgYWRkcmVzc2VzIGFzIHRo
ZSBwYWdlIHRhYmxlCkBAIC0zNzAsNyArMzczLDcgQEAgdm9pZCBfX2luaXQgZGVidWdfdm1fcGd0
YWJsZSh2b2lkKQrCoAlwNGRfY2xlYXJfdGVzdHMobW0sIHA0ZHApOwrCoAlwZ2RfY2xlYXJfdGVz
dHMobW0sIHBnZHApOwrCoAotCXB0ZV91bm1hcChwdGVwKTsKKwlwdGVfdW5tYXBfdW5sb2NrKHB0
ZXAsIHB0bCk7CsKgCsKgCXBtZF9wb3B1bGF0ZV90ZXN0cyhtbSwgcG1kcCwgc2F2ZWRfcHRlcCk7
CsKgCXB1ZF9wb3B1bGF0ZV90ZXN0cyhtbSwgcHVkcCwgc2F2ZWRfcG1kcCk7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
