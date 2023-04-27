Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3D8C77B61
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Apr 2023 22:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AtIYEfN1M0WcmEI17zo/Hw08o3Hx7u0NWo85arCYwlM=; b=soVCUiheGzzVGs
	EDTQ1QQUwzeeGd214SvxVcfUkWRmGePgCEjzz0VWfAnDkqiVgQVxwJn499sUvZc01t04wHgMzXTj0
	aY+0C093VqvBYxjjav+XFn11qGGtjxLYVd2BXWUnXstZVAkbkcO4AtDuyT+GHnv3GFZxrczlx/y1O
	aUJwm9IKHTu1AMlLs+uhXq4VuEBtdlJBXqWulAvKyAq2kFwYiy77CT0ofrhW9ksi8/n64Tc4bNDyb
	JcIz6NtWUPtoPzqxLMUzYBGh2AHNhjiH1S9v0V9Ok0TL+ujRt0clGpG/9xeP54rjOzmolWItwDFz3
	GgKvyQ+7JG6ZxWtXNYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps9et-007eSq-0V;
	Thu, 27 Apr 2023 22:00:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps9eq-007eRj-1T
	for linux-snps-arc@lists.infradead.org;
	Thu, 27 Apr 2023 22:00:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 74A2463FD1
	for <linux-snps-arc@lists.infradead.org>; Thu, 27 Apr 2023 22:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5707C4339E
	for <linux-snps-arc@lists.infradead.org>; Thu, 27 Apr 2023 22:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682632806;
	bh=XAJcs9Tq27uSYzyxKqynry6iOShK22+/4P+2nWhnVG4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nmduOKFPBzQZKl9iACWKsy1r+NBRkDCvE/gjaOt5trThiFnAgRb8ApVPqQ0ai4ZPg
	 HQjeNRXos8H2zB0tzul+TrvMaJLKJPFD7Arn6gxSppALgIY6tZoA+FdQNyafXACfCn
	 GnqJ8rHXfVt0zO6R94Olgc+uj2Gz7pXBzJLqX7Pu4NTScksSQ+2PGAGKNnc/igsH5P
	 oYlklycCDK4Mz1CbFvMdZ51p84cmb1Knv6tjca3gxDes3I/9V/noC1AxlX7m4uwL+O
	 gtKlVxu8YvXn5/Jg4l7aEhtCPvgGQbJA9+lz5Ka8i1Gk93fRyhIm7ijtbHE3ehJs75
	 KL12Joi/HBsvw==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-b8f510fecf4so13756576276.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 27 Apr 2023 15:00:06 -0700 (PDT)
X-Gm-Message-State: AC+VfDwlOjQVDof1SevEslIq9lhOgxRt0rwyK4s632abjmTVNe2/Or0/
	MnG4mmLjKo09vEqrRghDCYxcZIr++EjDIXesbg==
X-Google-Smtp-Source: ACHHUZ7mW/EfaNcdgWrWRr2AEvbTi7Q+LlVB+H74Yy1MlvvgiGwV1CSsI0Flt3OOunhIdUkchExT6Rm/BmnFgYyRSHM=
X-Received: by 2002:a05:6902:18c8:b0:b8f:3781:248e with SMTP id
 ck8-20020a05690218c800b00b8f3781248emr2890576ybb.51.1682632805841; Thu, 27
 Apr 2023 15:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230426012721.6856-1-m202171830@hust.edu.cn>
In-Reply-To: <20230426012721.6856-1-m202171830@hust.edu.cn>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Apr 2023 16:59:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLR_REJWVn_dO8R4ngkrqL=E_ksNr=jS0qRmdpmAaD8hQ@mail.gmail.com>
Message-ID: <CAL_JsqLR_REJWVn_dO8R4ngkrqL=E_ksNr=jS0qRmdpmAaD8hQ@mail.gmail.com>
Subject: Re: [PATCH] serial: arc_uart: fix of_iomap leak in `arc_serial_probe`
To: Ke Zhang <m202171830@hust.edu.cn>
Cc: Vineet Gupta <vgupta@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, hust-os-kernel-patches@googlegroups.com, 
	Dongliang Mu <dzm91@hust.edu.cn>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, 
	linux-snps-arc@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_150008_575465_96670BB7 
X-CRM114-Status: GOOD (  20.20  )
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

T24gVHVlLCBBcHIgMjUsIDIwMjMgYXQgODoyN+KAr1BNIEtlIFpoYW5nIDxtMjAyMTcxODMwQGh1
c3QuZWR1LmNuPiB3cm90ZToKPgo+IFNtYXRjaCByZXBvcnRzOgo+Cj4gZHJpdmVycy90dHkvc2Vy
aWFsL2FyY191YXJ0LmM6NjMxIGFyY19zZXJpYWxfcHJvYmUoKSB3YXJuOgo+ICdwb3J0LT5tZW1i
YXNlJyBmcm9tIG9mX2lvbWFwKCkgbm90IHJlbGVhc2VkIG9uIGxpbmVzOiA2MzEuCj4KPiBJbiBh
cmNfc2VyaWFsX3Byb2JlKCksIGlmIHVhcnRfYWRkX29uZV9wb3J0KCkgZmFpbHMsCj4gcG9ydC0+
bWVtYmFzZSBpcyBub3QgcmVsZWFzZWQsIHdoaWNoIHdvdWxkIGNhdXNlIGEgcmVzb3VyY2UgbGVh
ay4KPgo+IFRvIGZpeCB0aGlzLCBJIHJlcGxhY2Ugb2ZfaW9tYXAgd2l0aCBkZXZtX29mX2lvbWFw
LgoKSG93IGFib3V0IHVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKSBpbnN0ZWFk
IChvciBhbnkgaW9yZW1hcAp2YXJpYW50KSBhcyB0aGF0IGlzIHByZWZlcnJlZCBvdmVyIG9mX2lv
bWFwKCkuCgpSb2IKCj4KPiBGaXhlczogOGRiZTFkNWUwOWE3ICgic2VyaWFsL2FyYzogaW5saW5l
IHRoZSBwcm9iZSBoZWxwZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEtlIFpoYW5nIDxtMjAyMTcxODMw
QGh1c3QuZWR1LmNuPgo+IFJldmlld2VkLWJ5OiBEb25nbGlhbmcgTXUgPGR6bTkxQGh1c3QuZWR1
LmNuPgo+IC0tLQo+IFRoaXMgaXNzdWUgaXMgZm91bmQgYnkgc3RhdGljIGFuYWx5c2lzIGFuZCBy
ZW1haW5zIHVudGVzdGVkLgo+IC0tLQo+ICBkcml2ZXJzL3R0eS9zZXJpYWwvYXJjX3VhcnQuYyB8
IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvYXJjX3VhcnQuYyBiL2RyaXZl
cnMvdHR5L3NlcmlhbC9hcmNfdWFydC5jCj4gaW5kZXggNTllMjVmMmI2NjMyLi5iZTFmM2MzNzkz
ODIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL2FyY191YXJ0LmMKPiArKysgYi9k
cml2ZXJzL3R0eS9zZXJpYWwvYXJjX3VhcnQuYwo+IEBAIC02MDYsMTAgKzYwNiwxMSBAQCBzdGF0
aWMgaW50IGFyY19zZXJpYWxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
ICAgICAgIH0KPiAgICAgICAgIHVhcnQtPmJhdWQgPSB2YWw7Cj4KPiAtICAgICAgIHBvcnQtPm1l
bWJhc2UgPSBvZl9pb21hcChucCwgMCk7Cj4gLSAgICAgICBpZiAoIXBvcnQtPm1lbWJhc2UpCj4g
KyAgICAgICBwb3J0LT5tZW1iYXNlID0gZGV2bV9vZl9pb21hcCgmcGRldi0+ZGV2LCBucCwgMCwg
TlVMTCk7Cj4gKyAgICAgICBpZiAoSVNfRVJSKHBvcnQtPm1lbWJhc2UpKSB7Cj4gICAgICAgICAg
ICAgICAgIC8qIE5vIHBvaW50IG9mIGRldl9lcnIgc2luY2UgVUFSVCBpdHNlbGYgaXMgaG9zZWQg
aGVyZSAqLwo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOWElPOwoKSWYgYW4gZXJybm8gd2Fz
IHJldHVybmVkLCB5b3Ugc2hvdWxkIHJldHVybiB0aGF0IGVycm5vIGFuZCBub3QgYSBkaWZmZXJl
bnQgb25lLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
