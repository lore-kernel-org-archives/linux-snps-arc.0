Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E61C48260
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Feb 2024 02:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tHmPaRsJ+kWxA83Yz/djElZYoA7aT3xVqQA/hWF3QQ=; b=HauwUP4mgw/fYP
	Rvv8n20dp+pEmO+3PIhsNmwBaUscYYMM6vpae7yZwXkMAirxflmsnq9V1aK9l2igyjxXvEASVLFwX
	YZ2dVtHTTuvB62h+YtUZLpj+PFf9Lp4onvj0ORKGghc4Ll9c969WATeJ4kuA98XBqmM9lwAo3Sshl
	D5JiUpNz8ekuSlVpVEH+wG9UxBtPeTJ7iXMoJbVPdz//k4iaPjnDZZjNgwAKupudtxQ+HHwatyxz8
	RQvcY51QLpCXFe7sWObesiVFSAR7jxl8AOljRdViGqYFTWBIE9y86NfzHBsF4ywAArHdeRfopU+qr
	7cVT7e6YHBYi44/CmnHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5Bf-0000000BXK7-10Hs;
	Wed, 14 Feb 2024 02:39:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5Bb-0000000BXJj-40EM
	for linux-snps-arc@lists.infradead.org;
	Wed, 14 Feb 2024 02:39:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33cec9ca791so59081f8f.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 13 Feb 2024 18:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707878386; x=1708483186; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBJ/h8HpFTsRsX9eI2f9wRuJMFFDA4Pr5lBNqUR7Ido=;
        b=Akj8Az32MYVsPD0rkQBf4ntD8bQ+axvAOmOSZASFIgJR/MH+vbBNnWSi+1zhlfqWmt
         zrzt+zCir6kdFV0ZzaNdwv/CnXf7DnLwDtvrmi7ft8lz4LFJEVRfTqR7kBhP2ZbL1F21
         shZGKu9/zzom055vpOb6VfbE6A0fX2IU8fx0elfgfj/GXUGL/M6BFzpSXroXAP7z/IX6
         OTDrZSM3eTK/dDWZEkrTT7wFbsR7zRpcKIYULTYZSX0wU2LKdO3JjRITLFH6F2Nar7Mg
         2HdfV3GJo5lCmf826rmxvDxhhgj4Fye+wQhTRslvxeec6mhsihWk7GGICfNxpd76uhVq
         kruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707878386; x=1708483186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBJ/h8HpFTsRsX9eI2f9wRuJMFFDA4Pr5lBNqUR7Ido=;
        b=MkUDbxpVpU13BjsOrcCMzuIt4p5+DNYMRbAiA8lDTLfRtU9WVLVwBm5sEJVdgDgrKV
         AlpkBCkBZVKryaae0lfzmcX9/oyfwfFACNp539nFGvY4zZbxzV2cr5OLBdaSEi93RG0+
         95aWoEh6KtKP2uoaEIzw7vJTMP5G8W67MKjD3+TEwAPFc4LLwCRdSCjb8mVWMTI4i2un
         yHgdkDqLSYXMpru6iZiYno+BNuZ9uHEEwuejVupxL7BWFw0dgfJH1QZ4k66uDlAhejwb
         8Lt/M9tU/abZ16GYc6emyPDsTm3Av3au2b2eF7gTTZDYYyg9k2s3jutuyCxofpCL92Vu
         7reg==
X-Forwarded-Encrypted: i=1; AJvYcCV7NMd4Pf1HWi9gnlngS1Fh46P2Ee6hkGiUKS/7HbD0a0EIivGCiqR9iwrBa8IRtg+klKmBGUCAbr9vC3ajRiGdw4SkzDpYqlWCsTXBGKdri+hl
X-Gm-Message-State: AOJu0YxpHme1KHH+P7Cl5zAsN4aP/02Rj1ld8S9BRgbKlRROFp8nJrbh
	aGi7F96H5WHVDWV5nmCKWbw49X3SZ9n5g2r/MFfq95ItdEOkRhY+v0JQSZkWLwBrEnt5RXOPQhV
	bRmvcfQUink8hGhNJ94UiG1mrSKc=
X-Google-Smtp-Source: AGHT+IEmkqCeLSuNPGHm40ofC8anlPtrotFEsVhKQWGpJshiZofVQffcDTg1Ap5YbcR4I3W+UgDE6d4cBXw9NyTidUw=
X-Received: by 2002:a05:6000:1188:b0:33c:e07d:17a7 with SMTP id
 g8-20020a056000118800b0033ce07d17a7mr629130wrx.54.1707878385614; Tue, 13 Feb
 2024 18:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20240213131946.32068-1-list+bpf@vahedi.org>
In-Reply-To: <20240213131946.32068-1-list+bpf@vahedi.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 13 Feb 2024 18:39:33 -0800
Message-ID: <CAADnVQLvh3dd5tXcJnKJis9bJZNV-_dR203PXVyrubZHBuU2_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1] ARC: Add eBPF JIT support
To: Shahab Vahedi <list+bpf@vahedi.org>
Cc: bpf <bpf@vger.kernel.org>, Shahab Vahedi <shahab@synopsys.com>, 
	Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_183948_017619_3BA3AB1D 
X-CRM114-Status: GOOD (  11.23  )
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgNToyMOKAr0FNIFNoYWhhYiBWYWhlZGkgPGxpc3QrYnBm
QHZhaGVkaS5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogU2hhaGFiIFZhaGVkaSA8c2hhaGFiQHN5bm9w
c3lzLmNvbT4KPgo+IFRoaXMgd2lsbCBhZGQgZUJQRiBKSVQgc3VwcG9ydCB0byB0aGUgMzItYml0
IEFSQ3YyIHByb2Nlc3NvcnMuIFRoZQo+IGltcGxlbWVudGF0aW9uIGlzIHF1YWxpZmllZCBieSBy
dW5uaW5nIHRoZSBCUEYgdGVzdHMgb24gYSBTeW5vcHN5cyBIU0RLCj4gYm9hcmQgd2l0aCAiQVJD
IEhTMzggdjIuMWMgYXQgNTAwIE1IeiIgYXMgdGhlIDQtY29yZSBDUFUuCi4uLgo+IFNpZ25lZC1v
ZmYtYnk6IFNoYWhhYiBWYWhlZGkgPHNoYWhhYkBzeW5vcHN5cy5jb20+Cj4gLS0tCj4gIERvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL25ldC5yc3QgfCAgICAxICsKPiAgRG9jdW1lbnRh
dGlvbi9uZXR3b3JraW5nL2ZpbHRlci5yc3QgICAgICB8ICAgIDQgKy0KPiAgYXJjaC9hcmMvS2J1
aWxkICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwo+ICBhcmNoL2FyYy9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gIGFyY2gvYXJjL25ldC9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgfCAgICA2ICsKPiAgYXJjaC9hcmMvbmV0L2JwZl9qaXQuaCAg
ICAgICAgICAgICAgICAgICB8ICAxNjEgKysKPiAgYXJjaC9hcmMvbmV0L2JwZl9qaXRfYXJjdjIu
YyAgICAgICAgICAgICB8IDMwMDEgKysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL2FyYy9u
ZXQvYnBmX2ppdF9jb3JlLmMgICAgICAgICAgICAgIHwgMTQyNSArKysrKysrKysrCj4gIDggZmls
ZXMgY2hhbmdlZCwgNDU5OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKVGhpcyBpcyBw
cmV0dHkgY29vbCB0byBzZWUuCkknbSBhc3N1bWluZyB0aGlzIHdpbGwgZ2V0IHJldmlld2VkIGFu
ZCB3aWxsIGdvIHRocm91Z2ggYXJjLmdpdCB0cmVlLgoKQ291bGQgeW91IHNoYXJlIHBlcmZvcm1h
bmNlIG51bWJlcnMgaW50ZXJwcmV0ZXIgdnMgSklUZWQgPwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
