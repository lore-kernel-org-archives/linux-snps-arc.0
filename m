Return-Path: <SRS0=BbR1=4O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39719C4BA14
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 15:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0921120838
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 15:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OhYFY9aL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="PEkBC2gG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0921120838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0obYeKNeHPpHPBrGM1NtQ1G+D7Nr3DmaXTWqd9RUhA=; b=OhYFY9aLMrTu4k
	/0f4pue7YtLmBLSj1YLyOoqu1Hd6BE+ZsftCRkLVVpf7dUu/7reTMGSZGbJNAYVbgP/SLggVpt61Y
	RDQ9R3lWSUThDjnBliIjNOlSIHG+FHx0wC/9kTHxNXnprPj3eGP05OUPYHwQcP8fe9FvX0/TNfADP
	FvjVH1s8yadw0wfXADn/UIfK60zKDAT3nozrxWTT+o8UPwatYMHjKdR8f+ytcQVUnrobR1w+D4gOa
	vdWKEKruLWQLzFEm5tJWPqUk5I6zyoMMqSGhNXz0mUf/Lf6Ib6mKSbF8GKiHYY93P2ln/2azk7zXi
	ZE+63cSkUrxO5V7Zcwqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6yyu-00068I-Ce; Wed, 26 Feb 2020 15:52:16 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6yyh-0005yY-CG
 for linux-snps-arc@lists.infradead.org; Wed, 26 Feb 2020 15:52:05 +0000
Received: by mail-qk1-x743.google.com with SMTP id z19so3062016qkj.5
 for <linux-snps-arc@lists.infradead.org>; Wed, 26 Feb 2020 07:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4GYwlf0Xa2QHt1cHVU8f4uTPVQEe66S6tW8iKIjB1EY=;
 b=PEkBC2gGo9Wp0CTNFzcX/uGLGqh45la2h+234pEbgb0JKCTWiVwR5CK2qWd8o7GV9+
 vZ0V3mJmWDxwpkokIiWuE2AK5D0JvSuKri12uT1Y5ZmnM2+2x1lk6TfjQrITZNEH8kqT
 OpLenMqGsrmR+s2Jh+PZTctbpw7UkSpOJj3m46DAs7sTe9V+A8PrxIZxTU0Jx2ozkU+h
 l2FfR5Vf/ZZGO7KqofRi3aS6TzSV2SHQoTpS42nUl+B16nz+oN/qYJaqXNzKW0WQZswg
 b+O0gHwTc4Y9Ju+CjJy1uD3JRDYV9kySWYvBERLoM4RJvQwJnkBJANxBmrBhZlFtAjqz
 NmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4GYwlf0Xa2QHt1cHVU8f4uTPVQEe66S6tW8iKIjB1EY=;
 b=eBXcdn7dPfjlF0Ukuzetiu4xS2sSafeme6PMtPkAlnMTYfCU8uWGp3JuEBMo//oSAZ
 bP66uMU5zziQFMWpJIadeA1XeCLHI46pg1mfOWtprKxFhavQm2QUZUazZ5xhYLri5Tbo
 GvhiyKM6ynPlVL2BOSC6UodxTnz4mVDWi9qrZTZtG8j6D3tuyzJ6f4XCYQYdNLRu1i7a
 34lf4Tav8CVmFrFmPyuPelQ42QaSduM4nVypCQtgez+fbRHqRK1YCauOzzA+LEkXWRtR
 8ifYB3QKHa5Hd12ySQIswYIxBPyrRoNmcwW2wUO0xyjuhYzlTfyht/tzQTLIfGGDrBl0
 Z1tw==
X-Gm-Message-State: APjAAAXcZuRmsLmfVLKoRCFXIkDH+8wjZSGiMqtofPSKGedumSk08iTs
 sTt2LIhRRpghKruow9K7SIMUDw==
X-Google-Smtp-Source: APXvYqxycYwltSMF6mRZHm7TjXsCzQqI/GC2y1t3waZQf56agLdqkPAjaYu5yvSrjxUQYf0tQtgA0w==
X-Received: by 2002:a37:64cb:: with SMTP id y194mr5808427qkb.364.1582732321799; 
 Wed, 26 Feb 2020 07:52:01 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id 3sm1332599qte.59.2020.02.26.07.51.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 07:52:01 -0800 (PST)
Message-ID: <1582732318.7365.129.camel@lca.pw>
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Anshuman Khandual
 <anshuman.khandual@arm.com>, linux-mm@kvack.org
Date: Wed, 26 Feb 2020 10:51:58 -0500
In-Reply-To: <7c707b7f-ce3d-993b-8042-44fdc1ed28bf@c-s.fr>
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
 <1582726182.7365.123.camel@lca.pw>
 <7c707b7f-ce3d-993b-8042-44fdc1ed28bf@c-s.fr>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_075203_448088_F0572F00 
X-CRM114-Status: GOOD (  18.44  )
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

T24gV2VkLCAyMDIwLTAyLTI2IGF0IDE1OjQ1ICswMTAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Ogo+IAo+IExlIDI2LzAyLzIwMjAgw6AgMTU6MDksIFFpYW4gQ2FpIGEgw6ljcml0wqA6Cj4gPiBP
biBNb24sIDIwMjAtMDItMTcgYXQgMDg6NDcgKzA1MzAsIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3Rl
Ogo+ID4gPiBUaGlzIGFkZHMgdGVzdHMgd2hpY2ggd2lsbCB2YWxpZGF0ZSBhcmNoaXRlY3R1cmUg
cGFnZSB0YWJsZSBoZWxwZXJzIGFuZAo+ID4gPiBvdGhlciBhY2Nlc3NvcnMgaW4gdGhlaXIgY29t
cGxpYW5jZSB3aXRoIGV4cGVjdGVkIGdlbmVyaWMgTU0gc2VtYW50aWNzLgo+ID4gPiBUaGlzIHdp
bGwgaGVscCB2YXJpb3VzIGFyY2hpdGVjdHVyZXMgaW4gdmFsaWRhdGluZyBjaGFuZ2VzIHRvIGV4
aXN0aW5nCj4gPiA+IHBhZ2UgdGFibGUgaGVscGVycyBvciBhZGRpdGlvbiBvZiBuZXcgb25lcy4K
PiA+ID4gCj4gPiA+IFRoaXMgdGVzdCBjb3ZlcnMgYmFzaWMgcGFnZSB0YWJsZSBlbnRyeSB0cmFu
c2Zvcm1hdGlvbnMgaW5jbHVkaW5nIGJ1dCBub3QKPiA+ID4gbGltaXRlZCB0byBvbGQsIHlvdW5n
LCBkaXJ0eSwgY2xlYW4sIHdyaXRlLCB3cml0ZSBwcm90ZWN0IGV0YyBhdCB2YXJpb3VzCj4gPiA+
IGxldmVsIGFsb25nIHdpdGggcG9wdWxhdGluZyBpbnRlcm1lZGlhdGUgZW50cmllcyB3aXRoIG5l
eHQgcGFnZSB0YWJsZSBwYWdlCj4gPiA+IGFuZCB2YWxpZGF0aW5nIHRoZW0uCj4gPiA+IAo+ID4g
PiBUZXN0IHBhZ2UgdGFibGUgcGFnZXMgYXJlIGFsbG9jYXRlZCBmcm9tIHN5c3RlbSBtZW1vcnkg
d2l0aCByZXF1aXJlZCBzaXplCj4gPiA+IGFuZCBhbGlnbm1lbnRzLiBUaGUgbWFwcGVkIHBmbnMg
YXQgcGFnZSB0YWJsZSBsZXZlbHMgYXJlIGRlcml2ZWQgZnJvbSBhCj4gPiA+IHJlYWwgcGZuIHJl
cHJlc2VudGluZyBhIHZhbGlkIGtlcm5lbCB0ZXh0IHN5bWJvbC4gVGhpcyB0ZXN0IGdldHMgY2Fs
bGVkCj4gPiA+IGluc2lkZSBrZXJuZWxfaW5pdCgpIHJpZ2h0IGFmdGVyIGFzeW5jX3N5bmNocm9u
aXplX2Z1bGwoKS4KPiA+ID4gCj4gPiA+IFRoaXMgdGVzdCBnZXRzIGJ1aWx0IGFuZCBydW4gd2hl
biBDT05GSUdfREVCVUdfVk1fUEdUQUJMRSBpcyBzZWxlY3RlZC4gQW55Cj4gPiA+IGFyY2hpdGVj
dHVyZSwgd2hpY2ggaXMgd2lsbGluZyB0byBzdWJzY3JpYmUgdGhpcyB0ZXN0IHdpbGwgbmVlZCB0
byBzZWxlY3QKPiA+ID4gQVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRS4gRm9yIG5vdyB0aGlzIGlz
IGxpbWl0ZWQgdG8gYXJjLCBhcm02NCwgeDg2LCBzMzkwCj4gPiA+IGFuZCBwcGMzMiBwbGF0Zm9y
bXMgd2hlcmUgdGhlIHRlc3QgaXMga25vd24gdG8gYnVpbGQgYW5kIHJ1biBzdWNjZXNzZnVsbHku
Cj4gPiA+IEdvaW5nIGZvcndhcmQsIG90aGVyIGFyY2hpdGVjdHVyZXMgdG9vIGNhbiBzdWJzY3Jp
YmUgdGhlIHRlc3QgYWZ0ZXIgZml4aW5nCj4gPiA+IGFueSBidWlsZCBvciBydW50aW1lIHByb2Js
ZW1zIHdpdGggdGhlaXIgcGFnZSB0YWJsZSBoZWxwZXJzLiBNZWFud2hpbGUgZm9yCj4gPiA+IGJl
dHRlciBwbGF0Zm9ybSBjb3ZlcmFnZSwgdGhlIHRlc3QgY2FuIGFsc28gYmUgZW5hYmxlZCB3aXRo
IENPTkZJR19FWFBFUlQKPiA+ID4gZXZlbiB3aXRob3V0IEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFC
TEUuCj4gPiA+IAo+ID4gPiBGb2xrcyBpbnRlcmVzdGVkIGluIG1ha2luZyBzdXJlIHRoYXQgYSBn
aXZlbiBwbGF0Zm9ybSdzIHBhZ2UgdGFibGUgaGVscGVycwo+ID4gPiBjb25mb3JtIHRvIGV4cGVj
dGVkIGdlbmVyaWMgTU0gc2VtYW50aWNzIHNob3VsZCBlbmFibGUgdGhlIGFib3ZlIGNvbmZpZwo+
ID4gPiB3aGljaCB3aWxsIGp1c3QgdHJpZ2dlciB0aGlzIHRlc3QgZHVyaW5nIGJvb3QuIEFueSBu
b24gY29uZm9ybWl0eSBoZXJlIHdpbGwKPiA+ID4gYmUgcmVwb3J0ZWQgYXMgYW4gd2FybmluZyB3
aGljaCB3b3VsZCBuZWVkIHRvIGJlIGZpeGVkLiBUaGlzIHRlc3Qgd2lsbCBoZWxwCj4gPiA+IGNh
dGNoIGFueSBjaGFuZ2VzIHRvIHRoZSBhZ3JlZWQgdXBvbiBzZW1hbnRpY3MgZXhwZWN0ZWQgZnJv
bSBnZW5lcmljIE1NIGFuZAo+ID4gPiBlbmFibGUgcGxhdGZvcm1zIHRvIGFjY29tbW9kYXRlIGl0
IHRoZXJlYWZ0ZXIuCj4gPiAKPiA+IEhvdyB1c2VmdWwgaXMgdGhpcyB0aGF0IHN0cmFpZ2h0bHkg
Y3Jhc2ggdGhlIHBvd2VycGM/Cj4gPiAKPiA+IFvCoMKgwqAyMy4yNjM0MjVdW8KgwqDCoMKgVDFd
IGRlYnVnX3ZtX3BndGFibGU6IGRlYnVnX3ZtX3BndGFibGU6IFZhbGlkYXRpbmcKPiA+IGFyY2hp
dGVjdHVyZSBwYWdlIHRhYmxlIGhlbHBlcnMKPiA+IFvCoMKgwqAyMy4yNjM2MjVdW8KgwqDCoMKg
VDFdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4gW8KgwqDCoDIzLjI2
MzY0OV1bwqDCoMKgwqBUMV0ga2VybmVsIEJVRyBhdCBhcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5j
OjI3NCEKPiAKPiBUaGUgcHJvYmxlbSBvbiBQUEM2NCBpcyBrbm93biBhbmQgaGFzIHRvIGJlIGlu
dmVzdGlnYXRlZCBhbmQgZml4ZWQuCgpJdCBtaWdodCBiZSBpbnRlcmVzdGluZyB0byBoZWFyIHdo
YXQgcG93ZXJwYzY0IG1haW50YWluZXJzIHdvdWxkIHNheSBhYm91dCBpdAphbmQgaWYgaXQgaXMg
YWN0dWFsbHkgd29ydGggImZpeGluZyIgaW4gdGhlIGFyY2ggY29kZSwgYnV0IHRoYXQgQlVHX09O
KCkgd2FzCnRoZXJlIHNpbmNlIDIwMDkgYW5kIGhhZCBub3QgYmVlbiBleHBvc2VkIHVudGlsIHRo
aXMgcGF0Y2ggY29tZXMgYWxvbmU/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
