Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93476C7EE22
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 May 2023 08:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sB8Yqd0QcOehyxaeEB8NEaOLwCepqZxgl8GXgdvsXc=; b=pGsPwHyebjYegr
	Shjg0F2kPITUbojASSI5/PEXv2gjEFCTj9IUR0j9NRL7QZGbrda+Keesjw8d3tAfdPKatbAZwkR/B
	3JL3E748aDRI5C/X9bBgpYTCzxNxXTc7EDpdOta6HAR0U1sxTvGeBwhnhUrjlrw3lDk5pHl7DCdmF
	n0pDRJibNp+yaRvI8zeeMwT6Zso6O0SV1ggRaWaajTTsTbDmiC8nRSSUo1igingtLaB3iNESXg7nR
	UmvAzKT4+1BWno72pt9fbceAMGAQMEszaixGJO9pT3Ei/RM5RR1BDfUEPmUIvHdfgg7icS01iR/qI
	rEL+zEyelPtCYZ812J9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu7kW-003pJD-2D;
	Wed, 03 May 2023 08:22:08 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu7kT-003pH5-1x;
	Wed, 03 May 2023 08:22:07 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a8019379fso24760007b3.0;
        Wed, 03 May 2023 01:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683102123; x=1685694123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yf0nQOOKHL0GEtmAgACXt9/1DKDkHK6ft7tmYSYGTKo=;
        b=SexG16TPOx+pxvk8+I/VaPlLcI2qv9nzNlMWEg8yaIt3jjHJm5dM1SFxMwsQsDe4BW
         U/+PZhMgrTtncGSb6Hvrv91hQDcFcDfyXfVbQKrbt1a09zzIVfqZ2UOlJd42A1QHK5x4
         QktjFZUCRY45pQb+5iRmJzEaNyG0nEJPMFu5dabtL8kt3s8YDP6y9Coi+ijnpqJ8+jTI
         WHuU5+fJk19/VPOhg1K0wGjQesRvFAc5HnIY/LCXTUsQW1QTinmh+8dFucxICM431DU3
         vNMnPOCct5qyrswkYT7tiORgWvVB+0CIBRk6cmEqTDaozNJZF7uQn9hq57gpkt+kQi+i
         xc0Q==
X-Gm-Message-State: AC+VfDyIOLy4CJya++qWJdr6loWI/hp4NZnO6v9psBb3/NjD/jgr0fMj
	ow70SroNFkjbQ4yEJ5YWaxmvNT7EPAsj0A==
X-Google-Smtp-Source: ACHHUZ5iFCS/cu/2YZvsyF3uvSmD0jd4es++yAD2vXpDN7UvUVkofnSw3MAJfDuJvuvDyEGHnWSiEw==
X-Received: by 2002:a0d:df10:0:b0:55a:26cf:33e with SMTP id i16-20020a0ddf10000000b0055a26cf033emr10827349ywe.42.1683102123285;
        Wed, 03 May 2023 01:22:03 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id f129-20020a816a87000000b00545a08184edsm8509444ywc.125.2023.05.03.01.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:22:02 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-55a8019379fso24759717b3.0;
        Wed, 03 May 2023 01:22:02 -0700 (PDT)
X-Received: by 2002:a25:240f:0:b0:b9d:d5dc:596c with SMTP id
 k15-20020a25240f000000b00b9dd5dc596cmr11998230ybk.12.1683102122353; Wed, 03
 May 2023 01:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230502130223.14719-1-tzimmermann@suse.de>
In-Reply-To: <20230502130223.14719-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 10:21:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV06LN17KzOh42vjyF504myT=D=a-zz3MduOmQPEmv5SA@mail.gmail.com>
Message-ID: <CAMuHMdV06LN17KzOh42vjyF504myT=D=a-zz3MduOmQPEmv5SA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, daniel@ffwll.ch, vgupta@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, davem@davemloft.net, 
	James.Bottomley@hansenpartnership.com, arnd@arndb.de, sam@ravnborg.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-parisc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_012205_640469_C0C5C4A5 
X-CRM114-Status: GOOD (  22.53  )
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

SGkgVGhvbWFzLAoKT24gVHVlLCBNYXkgMiwgMjAyMyBhdCAzOjAy4oCvUE0gVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+ICh3YXM6IGZiZGV2OiBVc2UgcmVn
dWxhciBJL08gZnVuY3Rpb24gZm9yIGZyYW1lYnVmZmVycykKPgo+IEZiZGV2IHByb3ZpZGVzIGhl
bHBlcnMgZm9yIGZyYW1lYnVmZmVyIEkvTywgc3VjaCBhcyBmYl9yZWFkbCgpLAo+IGZiX3dyaXRl
bCgpIG9yIGZiX21lbWNweV90b19mYigpLiBUaGUgaW1wbGVtZW50YXRpb24gb2YgZWFjaCBoZWxw
ZXIKPiBkZXBlbmRzIG9uIHRoZSBhcmNoaXRlY3R1cmUsIGJ1dCB0aGV5IGFyZSBhbGwgZXF1aXZh
bGVudCB0byByZWd1bGFyCj4gSS9PIGZ1bmN0aW9ucyBvZiBzaW1pbGFyIG5hbWVzLiBTbyB1c2Ug
cmVndWxhciBmdW5jdGlvbnMgaW5zdGVhZCBhbmQKPiBtb3ZlIGFsbCBoZWxwZXJzIGludG8gPGFz
bS1nZW5lcmljL2ZiLmg+Cj4KPiBUaGUgZmlyc3QgcGF0Y2ggYSBzaW1wbGUgd2hpdGVzcGFjZSBj
bGVhbnVwLgo+Cj4gVW50aWwgbm93LCA8bGludXgvZmIuaD4gY29udGFpbmVkIGFuIGluY2x1ZGUg
b2YgPGFzbS9pby5oPi4gQXMgdGhpcwo+IHdpbGwgZ28gYXdheSBwYXRjaGVzIDIgdG8gNCBwcmVw
YXJlIGluY2x1ZGUgc3RhdGVtZW50cyBpbiB0aGUgdmFyaW91cwo+IGRyaXZlcnMuIFNvdXJjZSBm
aWxlcyB0aGF0IHVzZSByZWd1bGFyIEkvTyBoZWxwZXJzLCBzdWNoIGFzIHJlYWRsKCksCj4gbm93
IGluY2x1ZGUgPGxpbnV4L2lvLmg+LiBTb3VyY2UgZmlsZXMgdGhhdCB1c2UgZnJhbWVidWZmZXIg
SS9PCj4gaGVscGVycywgc3VjaCBhcyBmYl9yZWFkbCgpLCBhbHNvIGluY2x1ZGUgPGFzbS9mYi5o
Pi4KPgo+IFBhdGNoIDUgcmVwbGFjZXMgdGhlIGFyY2hpdGVjdHVyZS1iYXNlZCBpZi1lbHNlIGJy
YW5jaGluZyBpbgo+IDxsaW51eC9mYi5oPiBieSBoZWxwZXJzIGluIDxhc20tZ2VuZXJpYy9mYi5o
Pi4gQWxsIGhlbHBlcnMgdXNlIExpbnV4Jwo+IGV4aXN0aW5nIEkvTyBmdW5jdGlvbnMuCj4KPiBQ
YXRjaCA2IGhhcm1vbml6ZXMgbmFtaW5nIGFtb25nIGZiZGV2IGFuZCBleGlzdGluZyBJL08gZnVu
Y3Rpb25zLgo+Cj4gVGhlIHBhdGNoc2V0IGhhcyBiZWVuIGJ1aWx0IGZvciBhIHZhcmlldHkgb2Yg
cGxhdGZvcm1zLCBzdWNoIGFzIHg4Ni02NCwKPiBhcm0sIGFhcmNoNjQsIHBwYzY0LCBwYXJpc2Ms
IG02NGssIG1pcHMgYW5kIHNwYXJjLgo+Cj4gdjM6Cj4gICAgICAgICAqIGFkZCB0aGUgbmV3IGhl
bHBlcnMgaW4gPGFzbS1nZW5lcmljL2ZiLmg+Cj4gICAgICAgICAqIHN1cHBvcnQgcmVvcmRlcmlu
ZyBhbmQgbmF0aXZlIGJ5dGUgb3JkZXIgKEdlZXJ0LCBBcm5kKQoKVGhhbmtzLCB0aGlzIGZpeGVz
IHRoZSBtYW5nbGVkIGRpc3BsYXkgSSB3YXMgc2VlaW5nIG9uIEFSQW55TQp3aXRoIGJwcD0xNi4K
CkJUVywgdGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBtaXhlZCBkZXBlbmRlbmNpZXM6IHRoZSBj
aGFuZ2UKdG8gaW5jbHVkZS9hc20tZ2VuZXJpYy9mYi5oIGRlcGVuZHMgb24gIltQQVRDSCB2MyAw
MC8xOV0gYXJjaDoKQ29uc29saWRhdGUgPGFzbS9mYi5oPiJbMV0sIGJ1dCB3aXRoIHRoYXQgYXBw
bGllZCwgSSBoYWQgdG8gbWFudWFsbHkKZml4dXAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zi
X2NmYl9mb3BzLmMuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNDE3MTI1
NjUxLjI1MTI2LTEtdHppbW1lcm1hbm5Ac3VzZS5kZSwKCkdye29ldGplLGVldGluZ31zLAoKICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0
IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
