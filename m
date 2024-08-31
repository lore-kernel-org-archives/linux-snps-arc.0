Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2020BCD1293
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Aug 2024 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kRPAZnCjrlH0/soyJb0lLl1tjGGW67GCcH7vkBRqZs=; b=jClp8z4n6Z+Bba
	brOFfPNMcqlhTtiYP5fyzZwVhvTd2IgXhtVO6TxChlKe1YPyH/UeGYsfaPr3/bgkBLj4/bs+p7sVB
	D1cQYenazHoQ1zkRz20auRSilQnuKiN5NWV2MYAeBuUP+B2inIlg/9PJIy+6OC7HHDDVSI3E9/s7B
	dQ4K8ppTpry38YIscRFnpXe7AQs/urEGhVuq7fgKMAzxe1EIb2xz2uCTXxg7r4IDhzIHq0HJ0QmIQ
	Kdu6PODno8K9UZdWgjv2aTo4IirWQXmFPvokiQW0vSc5T8xcPQQwJJtSPi2D00MSeu8A3gNaeHe5U
	rHm7SsxXxo4hSBF5roIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skL7q-000000096Im-1ufT;
	Sat, 31 Aug 2024 10:14:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skL7n-000000096IG-1EvC
	for linux-snps-arc@lists.infradead.org;
	Sat, 31 Aug 2024 10:14:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A7C1A4028C
	for <linux-snps-arc@lists.infradead.org>; Sat, 31 Aug 2024 10:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1852C4CEC8
	for <linux-snps-arc@lists.infradead.org>; Sat, 31 Aug 2024 10:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725099270;
	bh=yj38hRBpjkYukw9Ls4kNpywcL2S3VVmPB0OsAP1YOvA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CB8Iy569E0WF8foH21kMyeaIxGfu5WeOENrdTNXAyKKdpVcpbWgXhWSH4nQK+0WTJ
	 MU4QZmdMic+BPZxnat7apdTN7bYTMu752636mWfAnA2Z6pJ4lOSGb/wQ54JcjOvmaO
	 hxgsRcCCcoGIRC7hD6Umb9TlvWSeah2vXCVKSuBAaGkX2+eNFJkDdsWpsdzbySuBbK
	 mWcLI/YtUOfte7flJRh/IMncb51fMckC+mJwVd8fSR3lQYeoenxLHCUdAAJy65yGTJ
	 QrvAhMx+fTS9YRD0uWvD3ylBPFwU9WuASPd1Me879LYbxidSk0nC5gCvPPTTXhDCVk
	 0tOrWkkD0dqqA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53345dcd377so3567263e87.2
        for <linux-snps-arc@lists.infradead.org>; Sat, 31 Aug 2024 03:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBXKDdTjcusMvv1sacr9rG+Ncj9aYuTlUAbOKn5pbXR9IMC1tdmOFMz9rxdOJQogJsdNlixsnYw77Weggb+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpN2Bczr8NwE1qTowT/UFvR2blEFusarkbw7TUBZZZ2XjvVpwo
	R40iHw2Xvgij0kVk8vbGNVhnf2hH2ahAJJTQJAjeho2m0gam5LNT2qqr+ywG8/kViAzN8bvZdu/
	jI7fA1Y1MCoNwHWXyPWpgRaozQlo=
X-Google-Smtp-Source: AGHT+IGJqUs8p1NGO3fICcAO4WPlEKDkIXDQ0GM8sqsZT/kWKVLCi9wH3j8eFXId92Z1hO6A+ReMAxL2r6Ovfk5SVI4=
X-Received: by 2002:a05:6512:12c7:b0:533:4689:973c with SMTP id
 2adb3069b0e04-53546b28914mr3103561e87.23.1725099268477; Sat, 31 Aug 2024
 03:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240831101045.1381258-1-masahiroy@kernel.org>
In-Reply-To: <20240831101045.1381258-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 31 Aug 2024 19:13:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATtOzj175_Y0qQz338FRG1GYCrsorA=jWG+Go1Wjn9rnw@mail.gmail.com>
Message-ID: <CAK7LNATtOzj175_Y0qQz338FRG1GYCrsorA=jWG+Go1Wjn9rnw@mail.gmail.com>
Subject: Re: [PATCH] ARC: update the help message for CONFIG_ARC_BUILTIN_DTB_NAME
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_031431_420440_057FCDA6 
X-CRM114-Status: GOOD (  15.70  )
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

T24gU2F0LCBBdWcgMzEsIDIwMjQgYXQgNzoxMOKAr1BNIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhp
cm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQ29tbWl0IGFiZTExZGRlYTFkNyAoIkFSQzogW3Bs
YXQtYXJjZnBnYV06IEVuYWJsaW5nIERldmljZVRyZWUgZm9yCj4gQW5nZWw0IGJvYXJkIikgY2hh
bmdlZCB0aGUgZGVmYXVsdCBidWlsdC1pbiBEVEIgZnJvbSAic2tlbGV0b24iIHRvCj4gImFuZ2Vs
NCIuCj4KPiBDb21taXQgZmQxNTU3OTIzYjJlICgiQVJDOiBbcGxhdF9hcmNmcGdhXS0+W3BsYXRf
c2ltXSIpIGNoYW5nZWQgaXQKPiBmcm9tICJhbmdlbDQiIHRvICJuc2ltXzcwIi4KCgpBIHR5cG8u
CgogLi4uIHRvICJuc2ltXzcwMCIuCgoKPgo+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFk
YSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4gLS0tCj4KPiAgYXJjaC9hcmMvS2NvbmZpZyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcmMvS2NvbmZpZyBiL2FyY2gvYXJjL0tjb25maWcKPiBpbmRleCBm
ZDBiMGEwZDQ2ODYuLmQwMWU2OWEyOWI2OSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FyYy9LY29uZmln
Cj4gKysrIGIvYXJjaC9hcmMvS2NvbmZpZwo+IEBAIC01NTMsNyArNTUzLDcgQEAgY29uZmlnIEFS
Q19CVUlMVElOX0RUQl9OQU1FCj4gICAgICAgICBzdHJpbmcgIkJ1aWx0IGluIERUQiIKPiAgICAg
ICAgIGhlbHAKPiAgICAgICAgICAgU2V0IHRoZSBuYW1lIG9mIHRoZSBEVEIgdG8gZW1iZWQgaW4g
dGhlIHZtbGludXggYmluYXJ5Cj4gLSAgICAgICAgIExlYXZpbmcgaXQgYmxhbmsgc2VsZWN0cyB0
aGUgbWluaW1hbCAic2tlbGV0b24iIGR0Ygo+ICsgICAgICAgICBMZWF2aW5nIGl0IGJsYW5rIHNl
bGVjdHMgdGhlICJuc2ltXzcwMCIgZHRiLgo+Cj4gIGVuZG1lbnUgICAgICAgICAjICJBUkMgQXJj
aGl0ZWN0dXJlIENvbmZpZ3VyYXRpb24iCj4KPiAtLQo+IDIuNDMuMAo+CgoKLS0gCkJlc3QgUmVn
YXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtc25wcy1hcmMK
