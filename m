Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41BCC76196
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Apr 2023 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zbzux9/ZSdtPQSclvkX/EFOhB1L4PmgTglBmRVfab5w=; b=r0JBnnzDK9kZlE
	8mHrFuGmXFT+LtM8s+oaiGAhVg+qoRMbrJ9CwNo31Fe9++hCdb24vxN6J1UmZNfjlCO/jCmb0egBJ
	nVjYONVVAOzJTrMCH5WWVzOqL7xPT9ZVvIrRXJXk87nIZmIqN4rPZbS5socfeUZ+OI35/rbCkvm6q
	Rc5JYGK3gxOlupu93P45QM0FGjCagtxKi54v5dDDDWz31juVr51VT8+LtkwyOaNTSAwYoKiQjSH3G
	c70OWnHAgPAOF+aGhc3gM1lL3ZJ5onN9K9ejS8LuImgKkom7/2orQjRRTXt3getE/H3ZFicO2RDqA
	jA6pM4rIH/ol4sWAbbkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm93t-00Gmxo-1u;
	Tue, 11 Apr 2023 08:09:09 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm93r-00GmwX-1S;
	Tue, 11 Apr 2023 08:09:08 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-54f21cdfadbso93075837b3.7;
        Tue, 11 Apr 2023 01:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681200542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hALJfm4jnccIo090MDgna4b/Z74t0kji7w+cuP7uYXI=;
        b=xTpkfu1FMfmHzRqh4EwYT3P/7jC50sWpAtNFBXYUt8tYOHEj9aC5WMnSk4iqL7UG8I
         HJxD1LLENrgfR2Xg1F+9ZciOKdemBkuo5PCVTBq4wGNVPiqMx/iVmcC0zsoXpgRwZkyE
         /MhCwwjW8ifPu3EtYjK7tmFy30/zYMJ/dsgRH7hfj1Gh3S8aSpujkIi0Df0c8YAnwImW
         qKbTvROB3dqnEGLgCdcz+X5pqhBScyOePGg/Jbz4/9H63bcovtMecGlHOtoUNDQ13pE7
         osGU4ZT8eBTAcOCGFZ6JaU3uatHn1uyGUm7CZaV8g1csUz1CKhOCbwXdbUdEeH1p+NDV
         sSmw==
X-Gm-Message-State: AAQBX9c7RxDj2ycSkfAG4VaM0DCqyLZZyJnayUcUQnExBhhzSIns6LSI
	ai7XwBC1UwE6YT4v48xluTP94pfY4ztmpw==
X-Google-Smtp-Source: AKy350b7qdGdQtj9ePz6DwhQoMfP1+9/PyskHRLS1R2g5NFLhXR1DWweK4qEpWmatCEKPy1gh0/CSA==
X-Received: by 2002:a81:720b:0:b0:541:8845:302d with SMTP id n11-20020a81720b000000b005418845302dmr6468690ywc.43.1681200542340;
        Tue, 11 Apr 2023 01:09:02 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 187-20020a8103c4000000b00545a081847fsm3346689ywd.15.2023.04.11.01.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:09:00 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54bfa5e698eso297519297b3.13;
        Tue, 11 Apr 2023 01:09:00 -0700 (PDT)
X-Received: by 2002:a81:e401:0:b0:54c:19a6:480 with SMTP id
 r1-20020a81e401000000b0054c19a60480mr7173247ywl.4.1681200539960; Tue, 11 Apr
 2023 01:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-2-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:08:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
Message-ID: <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] fbdev: Prepare generic architecture helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com, 
	gregkh@linuxfoundation.org, linux-arch@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_010907_487055_74B5539E 
X-CRM114-Status: GOOD (  25.53  )
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

SGkgVGhvbWFzLAoKT24gVGh1LCBBcHIgNiwgMjAyMyBhdCA0OjMw4oCvUE0gVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+IEdlbmVyaWMgaW1wbGVtZW50YXRp
b25zIG9mIGZiX3BncHJvdGVjdCgpIGFuZCBmYl9pc19wcmltYXJ5X2RldmljZSgpCj4gaGF2ZSBi
ZWVuIGluIHRoZSBzb3VyY2UgY29kZSBmb3IgYSBsb25nIHRpbWUuIFByZXBhcmUgdGhlIGhlYWRl
ciBmaWxlCj4gdG8gbWFrZSB1c2Ugb2YgdGhlbS4KPgo+IEltcHJvdmUgdGhlIGNvZGUgYnkgdXNp
bmcgYW4gaW5saW5lIGZ1bmN0aW9uIGZvciBmYl9wZ3Byb3RlY3QoKQo+IGFuZCBieSByZW1vdmlu
ZyBpbmNsdWRlIHN0YXRlbWVudHMuIFRoZSBkZWZhdWx0IG1vZGUgc2V0IGJ5Cj4gZmJfcGdwcm90
ZWN0KCkgaXMgbm93IHdyaXRlY29tYmluZSwgd2hpY2ggaXMgd2hhdCBtb3N0IHBsYXRmb3Jtcwo+
IHdhbnQuCj4KPiBTeW1ib2xzIGFyZSBwcm90ZWN0ZWQgYnkgcHJlcHJvY2Vzc29yIGd1YXJkcy4g
QXJjaGl0ZWN0dXJlcyB0aGF0Cj4gcHJvdmlkZSBhIHN5bWJvbCBuZWVkIHRvIGRlZmluZSBhIHBy
ZXByb2Nlc3NvciB0b2tlbiBvZiB0aGUgc2FtZQo+IG5hbWUgYW5kIHZhbHVlLiBPdGhlcndpc2Ug
dGhlIGhlYWRlciBmaWxlIHdpbGwgcHJvdmlkZSBhIGdlbmVyaWMKPiBpbXBsZW1lbnRhdGlvbi4g
VGhpcyBwYXR0ZXJuIGhhcyBiZWVuIHRha2VuIGZyb20gPGFzbS9pby5oPi4KPgo+IHYyOgo+ICAg
ICAgICAgKiAgdXNlIHdyaXRlY29tYmluZSBtYXBwaW5ncyBieSBkZWZhdWx0IChBcm5kKQo+Cj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CgpU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgo+IC0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvZmIuaAo+
ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvZmIuaAo+IEBAIC0xLDEzICsxLDMyIEBACj4gIC8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gKwo+ICAjaWZuZGVmIF9fQVNN
X0dFTkVSSUNfRkJfSF8KPiAgI2RlZmluZSBfX0FTTV9HRU5FUklDX0ZCX0hfCj4gLSNpbmNsdWRl
IDxsaW51eC9mYi5oPgo+Cj4gLSNkZWZpbmUgZmJfcGdwcm90ZWN0KC4uLikgZG8ge30gd2hpbGUg
KDApCj4gKy8qCj4gKyAqIE9ubHkgaW5jbHVkZSB0aGlzIGhlYWRlciBmaWxlIGZyb20geW91ciBh
cmNoaXRlY3R1cmUncyA8YXNtL2ZiLmg+Lgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxhc20vcGFn
ZS5oPgo+ICsKPiArc3RydWN0IGZiX2luZm87Cj4gK3N0cnVjdCBmaWxlOwo+ICsKPiArI2lmbmRl
ZiBmYl9wZ3Byb3RlY3QKPiArI2RlZmluZSBmYl9wZ3Byb3RlY3QgZmJfcGdwcm90ZWN0Cj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBmYl9wZ3Byb3RlY3Qoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBvZmYpCgpEb2VzIHRoaXMgYWZmZWN0IGFueSBub01NVSBwbGF0Zm9ybXMgdGhh
dCByZWxpZWQgb24gZmJfcGdwcm90ZWN0KCkKZG9pbmcgbm90aGluZyBiZWZvcmU/ClBlcmhhcHMg
dGhlIGJvZHkgYmVsb3cgc2hvdWxkIGJlIHByb3RlY3RlZCBieSAiI2lmZGVmIENPTkZJR19NTVUi
PwoKPiArewo+ICsgICAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfd3JpdGVjb21iaW5l
KHZtYS0+dm1fcGFnZV9wcm90KTsKClNob3VsZG4ndCB0aGlzIHVzZSB0aGUgcGdwcm90X3ZhbCgp
IHdyYXBwZXI/Cgo+ICt9Cj4gKyNlbmRpZgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25w
cy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
