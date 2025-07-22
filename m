Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61814C83F27
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Jul 2025 05:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf/mOFWmwWu2UYBpa0m3kxnrJdax2eakxO5RYaOfrG0=; b=KZTgF0JzQseEKv
	QZDijO6Gqk4RnqeY0OOkhmqY/THCSH4+cXuLMJkjx1KQZp8WWZ8N5nra47sJSHzDBwV77iVwP2ojd
	gCL8ztuMvUBQGKhXHPrnRYHUTH1VnZAOiOTpGlRH8uoU2/nhLxbIa5bFQ4UX49nn5B2LZBPU2RARi
	rLaAWzwqVjiml3OxQoV76KIn95Iv0dk9uenYX+WGcBDBIHl8o0xD5ae7OIj6LSBuzjILby08LemHg
	hl22zRBJOSHwUOlQdHz7EpYmO3xM0rJxpXw3P2YeyQTsbg9fiu5KDjtY0P8gnZkU3iDqhadJ6dzsr
	qNxC8KDB92UnCJOI0umQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5Am-00000001J9o-407i;
	Tue, 22 Jul 2025 05:04:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue443-00000001DD7-0d4a
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 22 Jul 2025 03:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k+4A4Wcwmx0vcAwCCnC1T75w7LAAjengjw+UcaUHyos=; b=fSvQLtap25ut9BHwVFAnOZqai3
	A9l66/VEM/0WglwAv1XQw1pfUgmG3npx10lnFdWJlH6sc5l3cKUn6v38A+RR1nqUuF4P3OhyrYK1a
	Ygxn10TCIiO+DPzyjo5r9yHp45btVQPq2Na4jfnCRrIaSTwroYhP9u9Ju1EuFbpnPjhPdhKMc66lh
	LVYUdPwTMEbH9HUUqdsG0AimkmnzbkP1VoKxrMyXIinI2alayArlEtaOEj0djKGIXDt8u2gEIm2eC
	95LOUX5ZnR2oaspveN77PraKstlsA77KRnL3VNgBkqGpw/DFXHr8nfAn/WVEJism5WCt47+Aw17mj
	nP9Xkkqw==;
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue43z-0000000BC4h-38AM
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Jul 2025 03:53:13 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e8bcbe46cf1so4734835276.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 21 Jul 2025 20:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753156389; x=1753761189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+4A4Wcwmx0vcAwCCnC1T75w7LAAjengjw+UcaUHyos=;
        b=D1XisiaMNUW0C8mB5h2gxjQOhaSKnwqWUr4fjuHJ5BA/XXGE2NS8Htg7iR0/8VylxE
         RXdpSr4dA0h8e+hek4iW8LjoYhLTDXZ1nBfeamk5MGO16y/k3rGfgblIqoiMZg+hptfT
         Hn9L/ZgKvRNi1DfxCRgzQVTuNSOnTE4S7z4hiXBQszyTWFX2R0IkAS5osK5pMMFoeycl
         1BEwvAK7QJ2Rw7aBRFOBReyBlRm+SDm9pTg183wG7zIuaQKSqRxm0bKmheYuecXHzNBB
         V7wP2AbpI0coMVuhr41BUr9+Re50niDlxqQ06cvsjq3i5jwnSEeheJVQxKzeRrNr4ZD0
         U8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753156389; x=1753761189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+4A4Wcwmx0vcAwCCnC1T75w7LAAjengjw+UcaUHyos=;
        b=RkEsxca202K5FVujVMlmni22cBbgrzOSOrNyK9NFmCWnYymRf1ZJdO2blh1ew6iFlR
         cb+Sexvqu6YttWPdr/7ELNQZ4QXXWMewMDNrDEQa/XeLGefWD003aJvhaWfaNNbineHH
         ZqD5ojHFbzfVjIsMRHCppBjXmNZbsOJeJWbhBOPFRx/ZUqjJ0DzAePwxnySdRD6NA72m
         3NhKaSx+gS3YE3ug1Qd9xH4cR1vqvGw8sYFjMRXqUzMB234d8yXNFBhguaUNMr7r9iAv
         VIyxMGsKd02wDPHtbOoZtnNEoCH2lbyWjH4ZabqwgjoHBaZTXtpV2QtOIAZAaudQJ3Ic
         WpSg==
X-Forwarded-Encrypted: i=1; AJvYcCUlMsQoSci+IZNdrHEBaIEnuAIJSlVN/A+x5lCoN0EfaJonhlr5+wSm6Y+HASLKNJdkVeBl/SpW90KAzGfZgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoS35aIc9Yz/+qYy6o7tlTL7K95rBLOMfDdU1TejffN5HnV33n
	vG+y++To8JzJTZU2ZtayteEi3R0aKdWv2Y6hidcqFdHYGwWxgJpNvxAiQQVGWPtVENe0DEPyNOa
	g3Xjaziqgyc7fnwSKoOrlHSn/9CjAOUg=
X-Gm-Gg: ASbGncs3IiVlmglEcicF+uTxFAP4yba6fLbHEZunLg18ZuT5N5sI+SfBrFzLpSaN/fY
	+eu5KiPe8K+KbARCtnyC056rKhUQ3jPDsqukXDqUejNSOui4e4HkcrSGiMvLR/9uy9M2vXLIpv4
	pQS6RGI7ItG1TPv2DZBk+zuooWYZv4RdewXldnFaWgvwiUxjX8inFH5zcTFX4ZjpItVIVfwsQt/
	OdrIEgkuuTQBXaaLA==
X-Google-Smtp-Source: AGHT+IE2FkHxdrwRPSB7f1DXPrRY4tIYyDgF/3RU5l1sRBiDems9bE84T4ajYrT80tKcsAE4Nmrz8g+X4HTBOTPFxGA=
X-Received: by 2002:a05:690c:48c4:b0:70e:2d17:84b3 with SMTP id
 00721157ae682-71837547df4mr306229807b3.37.1753156388642; Mon, 21 Jul 2025
 20:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <aGjUpI1yNjEhSiAq@brak3rDesk> <CAG+54DZQC+-6E-P3D4BUtVujNegL1qKpcB5SGh28+rX5hrHFiw@mail.gmail.com>
 <2025071801-driveway-curly-698c@gregkh>
In-Reply-To: <2025071801-driveway-curly-698c@gregkh>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Tue, 22 Jul 2025 09:22:57 +0530
X-Gm-Features: Ac12FXyMU8t_OUOIvb1DtwpsQJHRb5Os8gf_VjBQVLO8HO3XkJ8g8JphfHbx7A8
Message-ID: <CAG+54DZS36Lp3Wc2nh+uSR14GPOWK+LJePp-jW1oB13uGtiSHw@mail.gmail.com>
Subject: Re: [PATCH] arc:kernel:perf_event.c : replaced sprintf with sysfs_emit()
To: Greg KH <greg@kroah.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, vgupta@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_045312_061805_6541C602 
X-CRM114-Status: GOOD (  25.27  )
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

T24gRnJpLCBKdWwgMTgsIDIwMjUgYXQgNToxOOKAr1BNIEdyZWcgS0ggPGdyZWdAa3JvYWguY29t
PiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDE4LCAyMDI1IGF0IDAzOjU3OjIwUE0gKzA1MzAsIFJ1
anJhIEJoYXR0IHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gT24gU2F0LCBKdWwgNSwgMjAyNSBhdCAx
OjAw4oCvUE0gUnVqcmEgQmhhdHQgPGJyYWtlci5ub29iLmtlcm5lbEBnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBSZXBsYWNlZCBzcHJpbnRmKCkgd2l0aCBzeXNmc19lbWl0KCkgaW4gc3lz
ZnMqX3Nob3coKSBmdW5jdGlvbiBpbgo+ID4gPiBwZXJmX2V2ZW50LmMgZmlsZSB0byBmb2xsb3cg
dGhlIGtlcm5lbCdzIGd1aWRlbGluZXMgZnJvbQo+ID4gPiBkb2N1bWVudGF0aW9uL2ZpbGVzeXN0
ZW1zL3N5c2ZzLnJzdAo+ID4gPiBUaGlzIHdpbGwgaW1wcm92ZSBjb25zaXN0ZW5jeSwgc2FmZXR5
LCBhbmQgbWFrZXMgaXQgZWFzaWVyIHRvIG1haW50YWluCj4gPiA+IGFuZCB1cGRhdGUgaW4gZnV0
dXJlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSdWpyYSBCaGF0dCA8YnJha2VyLm5vb2Iu
a2VybmVsQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL2FyYy9rZXJuZWwvcGVyZl9l
dmVudC5jIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FyYy9rZXJuZWwvcGVyZl9l
dmVudC5jIGIvYXJjaC9hcmMva2VybmVsL3BlcmZfZXZlbnQuYwo+ID4gPiBpbmRleCBlZDZkNGYw
Y2Q2MjEuLjQyNGVjMDcyYzQ0MSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcmMva2VybmVsL3Bl
cmZfZXZlbnQuYwo+ID4gPiArKysgYi9hcmNoL2FyYy9rZXJuZWwvcGVyZl9ldmVudC5jCj4gPiA+
IEBAIC02NDgsNyArNjQ4LDcgQEAgc3RhdGljIHNzaXplX3QgYXJjX3BtdV9ldmVudHNfc3lzZnNf
c2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ICAgICAgICAgc3RydWN0IHBlcmZfcG11X2V2
ZW50c19hdHRyICpwbXVfYXR0cjsKPiA+ID4KPiA+ID4gICAgICAgICBwbXVfYXR0ciA9IGNvbnRh
aW5lcl9vZihhdHRyLCBzdHJ1Y3QgcGVyZl9wbXVfZXZlbnRzX2F0dHIsIGF0dHIpOwo+ID4gPiAt
ICAgICAgIHJldHVybiBzcHJpbnRmKHBhZ2UsICJldmVudD0weCUwNGxseFxuIiwgcG11X2F0dHIt
PmlkKTsKPiA+ID4gKyAgICAgICByZXR1cm4gc3lzZnNfZW1pdChwYWdlLCAiZXZlbnQ9MHglMDRs
bHhcbiIsIHBtdV9hdHRyLT5pZCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICAvKgo+ID4gPiAtLQo+
ID4gPiAyLjQzLjAKPiA+ID4KPiA+Cj4gPiBHZW50bGUgcmVtaW5kZXIgZm9yIHRoZSByZXBsYWNl
bWVudCBvZiBzcHJpbnRmKCkgd2l0aCB0aGUgc3lzZnNfZW1pdCgpLCBraW5kbHkKPiA+IHJldmll
dyBpdC4KPgo+IFdoeSBpcyB0aGlzIHJlcXVpcmVkPyAgVGhlcmUgaXMgbm8gYnVnIGluIHRoZSBj
dXJyZW50IGNvZGUsIHNvIG5vIG5lZWQKPiB0byBjaGFuZ2UgaXQgYXQgYWxsLiAgUGxlYXNlIGp1
c3QgdXNlIHN5c2ZzX2VtaXQoKSBmb3IgbmV3IHN5c2ZzIGZpbGVzLAo+IG5vIG5lZWQgdG8gY2h1
cm4gdGhlIHRyZWUgYW5kIGNoYW5nZSBhbGwgZXhpc3RpbmcgZW50cmllcywgb3RoZXJ3aXNlIHdl
Cj4gd291bGQgaGF2ZSBkb25lIHRoaXMgYSBsb25nIHRpbWUgYWdvIHdoZW4gd2UgaW50cm9kdWNl
ZCB0aGVzZSBmdW5jdGlvbnMuCj4KCkhpIEdyZWcsCkkgYXBwcmVjaWF0ZSB5b3VyIGZlZWRiYWNr
LgoKSSB3YW50ZWQgdG8gYnJpbmcgdGhlIGZvcm1hdHRpbmcgaW4gbGluZSB3aXRoIHRoZQpsYXRl
c3QgZ3VpZGFuY2UsIGVzcGVjaWFsbHkgc2luY2Ugc3lzZnNfZW1pdCgpIGhhcyBiZWNvbWUgdGhl
IHJlY29tbWVuZGVkCm1ldGhvZCBmb3Igc3lzZnMgb3V0cHV0LiBJIHNlZSBub3csIHRob3VnaCwg
dGhhdCBJIHNob3VsZCByZXN0cmljdCBteXNlbGYgdG8KdXNpbmcgdGhhdCBoZWxwZXIgb25seSBp
biB0aGUgY29udGV4dCBvZiBnZW51aW5lIGJ1ZyBmaXhlcyBvciBpbiB0aGUgY291cnNlCm9mIGFk
ZGluZyBmZWF0dXJlcy4KSSdsbCBtYWtlIHN1cmUgdG8gb25seSB1c2Ugc3lzZnNfZW1pdCgpIGZv
ciBuZXcgc3lzZnMgZW50cmllcyBvciB3aGVuCm1vZGlmeWluZyBleGlzdGluZyBmaWxlcyBmb3Ig
YWN0dWFsIGJ1Z3Mgb3IgZmVhdHVyZSBjaGFuZ2VzLAphcyBwZXIgeW91ciBndWlkYW5jZS4KClRo
YW5rIHlvdSBzbyBtdWNoIGZvciBwb2ludGluZyB0aGlzIG91dC4KCnJlZ2FyZHMsClJ1anJhIEJo
YXR0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
