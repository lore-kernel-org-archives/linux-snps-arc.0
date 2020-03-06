Return-Path: <SRS0=e3HE=4X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4930FC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 20:45:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1408D206CC
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 20:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VJB0H6m6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="sVQp0SNz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1408D206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLoAUQnxi4AzDxkojhnRvPPw7p9el9QFSBjJZYeNBpI=; b=VJB0H6m6kwu/lY
	qBFjNk2ux/rqc9q+wKTVYm0jz/UY6m0hbVA8KKub3mY89QIm0n8Q5bi9f+eA24zOcQh3Ff7PCjH8X
	s9lnakHOorK9RjbZkGz74SBUX8d8Za1ICFjrGPid3tPPH9UHE6MTdrNDpNIR0PNXI2GKbQ9xJRQQB
	2Etf2oAzIcTx2mVkzjmEiyfBSVS4BvJJspOExKooRH6EeOwPf2D20rKJs9UvwDCieEbMOSllDFiLz
	L48P3hWdKwG17cqKXskHz4cMijXR8Efwh3MRth9bqi9HGermSjZucN9oZOx4jkTDCUERaIz10vXDT
	Ao4BUM9AKH+bGzYlWOYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAJqA-0000j1-2c; Fri, 06 Mar 2020 20:45:02 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAJpu-0000UP-NQ
 for linux-snps-arc@lists.infradead.org; Fri, 06 Mar 2020 20:44:50 +0000
Received: by mail-qt1-x841.google.com with SMTP id 59so2770897qtb.1
 for <linux-snps-arc@lists.infradead.org>; Fri, 06 Mar 2020 12:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VIytyDCq7f0kiHtZyAPYuhAfxkdQ6oPpVlPc91ezlzw=;
 b=sVQp0SNzavyEmQgQgPO7gOzbjdxNHOBGOKLb2+i6xH5nTB6ZP6ociRcsHZFKZahWzv
 lVQMhT0TucKZE0jr1svRTaAecWqS9Lak/5QCDTaDSkOc6vq9y74In5QZ3C0vju5Y/YSJ
 seKiYzybOes0y2OWOOVvb45ZEYoBXTTL7/NQZvUeV5Umj/iFPmYuELjQmpwwRG/RbM00
 WMRsRryr0bUnfhZtTUXyLUc60zizY1/bRX7olknPmplQ8VZG+HU7CqTLWPWwICtR5QAk
 sPbgocfLtbClg6uijm1uY7WawL446OXTMUcERTf+StMaVG507VDTlm1AAJaTPJabMPKz
 9fdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VIytyDCq7f0kiHtZyAPYuhAfxkdQ6oPpVlPc91ezlzw=;
 b=m4Z1gnIfPzNLZhXKSzCLvKQADDlqgfX17w0ds4N8s+0CnVC++jSML6+6SBe7l4vy+6
 8tnYUNXOOB2KT+VAWN8D42VlmxbrVBsqBIVPjBnKA2ZxkJ8bhgtm9CRvj3fBfLjyUGRN
 b4NnDCyoVq8ut7oeNjWqZqADcSX/uT4CBC1hCXO7IYQaZJ8YJ07ue1bMvAS58TP9BlBO
 AuxPnFGkL1/M5IKhG3Hu6+LRPc7Rw8jNb0q1MbriKhHQxU5Eah4jwY9wo7hKAe6MWhjL
 L3wJ7tog08ZTOODBOdF58LcmvK5+OTOhA7Mu6qBggsg2wkaayF6JR8lP6TNuk/cgv1eB
 f5lQ==
X-Gm-Message-State: ANhLgQ04xkJKFmHO4UjElHaSAinfHd4g5dhkEEj3nFLXj1KPrXP0V6p9
 oNFevWyj2ADBV9RLvRYx0+a0jA==
X-Google-Smtp-Source: ADFU+vtc3atgWoG361itKB4xApBMGrMUExpxNIdab4Ow4UUWS5fC6T+QADXDozQS4OkwoR392p5sKA==
X-Received: by 2002:ac8:43c1:: with SMTP id w1mr4780630qtn.381.1583527484932; 
 Fri, 06 Mar 2020 12:44:44 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id g15sm14611541qtq.71.2020.03.06.12.44.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 12:44:44 -0800 (PST)
Message-ID: <1583527481.7365.165.camel@lca.pw>
Subject: Re: [PATCH V15] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Date: Fri, 06 Mar 2020 15:44:41 -0500
In-Reply-To: <1583452659-11801-1-git-send-email-anshuman.khandual@arm.com>
References: <1583452659-11801-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_124446_821589_0F6AB826 
X-CRM114-Status: GOOD (  15.83  )
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
 Christophe Leroy <christophe.leroy@c-s.fr>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDIwLTAzLTA2IGF0IDA1OjI3ICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90
ZToKPiBUaGlzIGFkZHMgdGVzdHMgd2hpY2ggd2lsbCB2YWxpZGF0ZSBhcmNoaXRlY3R1cmUgcGFn
ZSB0YWJsZSBoZWxwZXJzIGFuZAo+IG90aGVyIGFjY2Vzc29ycyBpbiB0aGVpciBjb21wbGlhbmNl
IHdpdGggZXhwZWN0ZWQgZ2VuZXJpYyBNTSBzZW1hbnRpY3MuCj4gVGhpcyB3aWxsIGhlbHAgdmFy
aW91cyBhcmNoaXRlY3R1cmVzIGluIHZhbGlkYXRpbmcgY2hhbmdlcyB0byBleGlzdGluZwo+IHBh
Z2UgdGFibGUgaGVscGVycyBvciBhZGRpdGlvbiBvZiBuZXcgb25lcy4KPiAKPiBUaGlzIHRlc3Qg
Y292ZXJzIGJhc2ljIHBhZ2UgdGFibGUgZW50cnkgdHJhbnNmb3JtYXRpb25zIGluY2x1ZGluZyBi
dXQgbm90Cj4gbGltaXRlZCB0byBvbGQsIHlvdW5nLCBkaXJ0eSwgY2xlYW4sIHdyaXRlLCB3cml0
ZSBwcm90ZWN0IGV0YyBhdCB2YXJpb3VzCj4gbGV2ZWwgYWxvbmcgd2l0aCBwb3B1bGF0aW5nIGlu
dGVybWVkaWF0ZSBlbnRyaWVzIHdpdGggbmV4dCBwYWdlIHRhYmxlIHBhZ2UKPiBhbmQgdmFsaWRh
dGluZyB0aGVtLgo+IAo+IFRlc3QgcGFnZSB0YWJsZSBwYWdlcyBhcmUgYWxsb2NhdGVkIGZyb20g
c3lzdGVtIG1lbW9yeSB3aXRoIHJlcXVpcmVkIHNpemUKPiBhbmQgYWxpZ25tZW50cy4gVGhlIG1h
cHBlZCBwZm5zIGF0IHBhZ2UgdGFibGUgbGV2ZWxzIGFyZSBkZXJpdmVkIGZyb20gYQo+IHJlYWwg
cGZuIHJlcHJlc2VudGluZyBhIHZhbGlkIGtlcm5lbCB0ZXh0IHN5bWJvbC4gVGhpcyB0ZXN0IGdl
dHMgY2FsbGVkCj4gaW5zaWRlIGtlcm5lbF9pbml0KCkgcmlnaHQgYWZ0ZXIgYXN5bmNfc3luY2hy
b25pemVfZnVsbCgpLgo+IAo+IFRoaXMgdGVzdCBnZXRzIGJ1aWx0IGFuZCBydW4gd2hlbiBDT05G
SUdfREVCVUdfVk1fUEdUQUJMRSBpcyBzZWxlY3RlZC4gQW55Cj4gYXJjaGl0ZWN0dXJlLCB3aGlj
aCBpcyB3aWxsaW5nIHRvIHN1YnNjcmliZSB0aGlzIHRlc3Qgd2lsbCBuZWVkIHRvIHNlbGVjdAo+
IEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUuIEZvciBub3cgdGhpcyBpcyBsaW1pdGVkIHRvIGFy
YywgYXJtNjQsIHg4NiwgczM5MAo+IGFuZCBwcGMzMiBwbGF0Zm9ybXMgd2hlcmUgdGhlIHRlc3Qg
aXMga25vd24gdG8gYnVpbGQgYW5kIHJ1biBzdWNjZXNzZnVsbHkuCj4gR29pbmcgZm9yd2FyZCwg
b3RoZXIgYXJjaGl0ZWN0dXJlcyB0b28gY2FuIHN1YnNjcmliZSB0aGUgdGVzdCBhZnRlciBmaXhp
bmcKPiBhbnkgYnVpbGQgb3IgcnVudGltZSBwcm9ibGVtcyB3aXRoIHRoZWlyIHBhZ2UgdGFibGUg
aGVscGVycy4gTWVhbndoaWxlIGZvcgo+IGJldHRlciBwbGF0Zm9ybSBjb3ZlcmFnZSwgdGhlIHRl
c3QgY2FuIGFsc28gYmUgZW5hYmxlZCB3aXRoIENPTkZJR19FWFBFUlQKPiBldmVuIHdpdGhvdXQg
QVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRS4KPiAKPiBGb2xrcyBpbnRlcmVzdGVkIGluIG1ha2lu
ZyBzdXJlIHRoYXQgYSBnaXZlbiBwbGF0Zm9ybSdzIHBhZ2UgdGFibGUgaGVscGVycwo+IGNvbmZv
cm0gdG8gZXhwZWN0ZWQgZ2VuZXJpYyBNTSBzZW1hbnRpY3Mgc2hvdWxkIGVuYWJsZSB0aGUgYWJv
dmUgY29uZmlnCj4gd2hpY2ggd2lsbCBqdXN0IHRyaWdnZXIgdGhpcyB0ZXN0IGR1cmluZyBib290
LiBBbnkgbm9uIGNvbmZvcm1pdHkgaGVyZSB3aWxsCj4gYmUgcmVwb3J0ZWQgYXMgYW4gd2Fybmlu
ZyB3aGljaCB3b3VsZCBuZWVkIHRvIGJlIGZpeGVkLiBUaGlzIHRlc3Qgd2lsbCBoZWxwCj4gY2F0
Y2ggYW55IGNoYW5nZXMgdG8gdGhlIGFncmVlZCB1cG9uIHNlbWFudGljcyBleHBlY3RlZCBmcm9t
IGdlbmVyaWMgTU0gYW5kCj4gZW5hYmxlIHBsYXRmb3JtcyB0byBhY2NvbW1vZGF0ZSBpdCB0aGVy
ZWFmdGVyLgoKT0ssIEkgZ2V0IHRoaXMgd29ya2luZyBvbiBwb3dlcnBjIGhhc2ggTU1VIGFzIHdl
bGwsIHNvIHRoaXM/CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9mZWF0dXJlcy9kZWJ1Zy9k
ZWJ1Zy12bS1wZ3RhYmxlL2FyY2gtc3VwcG9ydC50eHQKYi9Eb2N1bWVudGF0aW9uL2ZlYXR1cmVz
L2RlYnVnL2RlYnVnLXZtLXBndGFibGUvYXJjaC1zdXBwb3J0LnR4dAppbmRleCA2NGQwZjliMTVj
NDkuLmM1MjdkMDVjMDQ1OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9mZWF0dXJlcy9kZWJ1
Zy9kZWJ1Zy12bS1wZ3RhYmxlL2FyY2gtc3VwcG9ydC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9m
ZWF0dXJlcy9kZWJ1Zy9kZWJ1Zy12bS1wZ3RhYmxlL2FyY2gtc3VwcG9ydC50eHQKQEAgLTIyLDgg
KzIyLDcgQEAKwqDCoMKgwqDCoHzCoMKgwqDCoMKgwqDCoG5pb3MyOiB8IFRPRE8gfArCoMKgwqDC
oMKgfMKgwqDCoMKgb3BlbnJpc2M6IHwgVE9ETyB8CsKgwqDCoMKgwqB8wqDCoMKgwqDCoMKgcGFy
aXNjOiB8IFRPRE8gfAotwqDCoMKgwqB8wqDCoHBvd2VycGMvMzI6IHzCoMKgb2vCoMKgfAotwqDC
oMKgwqB8wqDCoHBvd2VycGMvNjQ6IHwgVE9ETyB8CivCoMKgwqDCoHzCoMKgwqDCoMKgcG93ZXJw
YzogfMKgwqBva8KgwqB8CsKgwqDCoMKgwqB8wqDCoMKgwqDCoMKgwqByaXNjdjogfCBUT0RPIHwK
wqDCoMKgwqDCoHzCoMKgwqDCoMKgwqDCoMKgczM5MDogfMKgwqBva8KgwqB8CsKgwqDCoMKgwqB8
wqDCoMKgwqDCoMKgwqDCoMKgwqBzaDogfCBUT0RPIHwKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKaW5kZXggMmU3ZWVlNTIzYmExLi4xNzY5
MzBmNDBlMDcgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnCisrKyBiL2FyY2gvcG93
ZXJwYy9LY29uZmlnCkBAIC0xMTYsNyArMTE2LDcgQEAgY29uZmlnIFBQQwrCoAkjCsKgCXNlbGVj
dCBBUkNIXzMyQklUX09GRl9UIGlmIFBQQzMyCsKgCXNlbGVjdCBBUkNIX0hBU19ERUJVR19WSVJU
VUFMCi0Jc2VsZWN0IEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUgaWYgUFBDMzIKKwlzZWxlY3Qg
QVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRQrCoAlzZWxlY3QgQVJDSF9IQVNfREVWTUVNX0lTX0FM
TE9XRUQKwqAJc2VsZWN0IEFSQ0hfSEFTX0VMRl9SQU5ET01JWkUKwqAJc2VsZWN0IEFSQ0hfSEFT
X0ZPUlRJRllfU09VUkNFCmRpZmYgLS1naXQgYS9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMgYi9tbS9k
ZWJ1Z192bV9wZ3RhYmxlLmMKaW5kZXggOTZhOTFiZGEzYTg1Li45ODk5MGE1MTUyNjggMTAwNjQ0
Ci0tLSBhL21tL2RlYnVnX3ZtX3BndGFibGUuYworKysgYi9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMK
QEAgLTI1Niw3ICsyNTYsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHRlX2NsZWFyX3Rlc3RzKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLApwdGVfdCAqcHRlcCwKwqAJcHRlX3QgcHRlID0gUkVBRF9PTkNF
KCpwdGVwKTsKwqAKwqAJcHRlID0gX19wdGUocHRlX3ZhbChwdGUpIHwgUkFORE9NX09SVkFMVUUp
OwotCVdSSVRFX09OQ0UoKnB0ZXAsIHB0ZSk7CisJc2V0X3B0ZV9hdChtbSwgdmFkZHIsIHB0ZXAs
IHB0ZSk7CisJYmFycmllcigpOwrCoAlwdGVfY2xlYXIobW0sIHZhZGRyLCBwdGVwKTsKwqAJcHRl
ID0gUkVBRF9PTkNFKCpwdGVwKTsKwqAJV0FSTl9PTighcHRlX25vbmUocHRlKSk7CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
