Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C96C77B7C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 May 2023 09:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AP1UpFce+k8zea3iqoAhItVIX+zzDsFOX8J8BiyNSzU=; b=QemV9r8cWyDxO1
	QU0yPphqn2XXbZtb2Sab/SjLZcgBzhuEc1qJmWvzNnoE8M2LhCrwP73D2pu63Rtgm6SnY2tVT0si/
	7MlmE18Pxw4/aCLdtkojbDKiekUviV/tUXGnjphbiaB0SghlLc1ZmFzDstNlXQ5jZZe0dKb2iYlIL
	Yq0X3sVBkGF12777XFet9/RvdR1LfB9O8zeYizoT6cRFpfhX3kj8OWgn0YRladKZPSM9/1UHuRpbz
	JqhGQHynJRV668givLU+ExX+JtktBsnu8AYYo644inVqsn5OV+oczS1LSUR2a76vNhaB0XUcn3m6F
	GUEUtCLAbvZeRA6HiFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPVZ-00BW2G-0i;
	Fri, 12 May 2023 09:56:17 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPVW-00BW0r-0y;
	Fri, 12 May 2023 09:56:15 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-55a5e0f5b1aso95038407b3.0;
        Fri, 12 May 2023 02:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683885367; x=1686477367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G26aphgD58tBa5cm3UBUurmWT+f5Rv1D2HQTBHZMzO8=;
        b=PB/9oXfn0G7ar9RF9+LYUkhUAkcVpi02XBYKBIzJ3Enk76fso+UYewmTjwOmfjn0PQ
         ogiNf1sGqOiuvAhte/smG40C8psCNMV0Z11WZMFf8H1i/uLpRJ2WQWUMCwERjwCZnRIG
         fakb+v12hAUmN7Uk31JyHLg2g4nIvLBrr1GcUmPrdsBYxSO3axyEKtRzTUgTKujHPkgg
         YjOHv3MCjms26ENu9HGppynQ/enfxyUwjz5OfrrGfcN98bXuKq/AFpuh6igvWtYwzaTf
         zxoXY+V/Lw++me+xrdIcoAeGMeGHXM+gZTFBpgSyNj/nlCp2YfA138eBdKud5ieXsFRG
         aOGA==
X-Gm-Message-State: AC+VfDxYhiCRm8ZxZikrEV9cwYNTyZiqshARrx/9+JY14Dzvksm5tR7M
	6DumFVZ6rERCF0QI5h0UEWL8jq8rf/pEoA==
X-Google-Smtp-Source: ACHHUZ5foBRWzGH2hJIunt6LqmAfFcqierBcPi9BXhhayuAHQR2rTSPw8gvZnPRnh+WzTQWpZQUq8w==
X-Received: by 2002:a81:d54b:0:b0:55a:6dc8:e084 with SMTP id l11-20020a81d54b000000b0055a6dc8e084mr22477524ywj.17.1683885367273;
        Fri, 12 May 2023 02:56:07 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id d185-20020a814fc2000000b00545cb6adc16sm5546057ywb.6.2023.05.12.02.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 02:56:06 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-55a8e9e2c53so94737387b3.1;
        Fri, 12 May 2023 02:56:06 -0700 (PDT)
X-Received: by 2002:a81:a012:0:b0:555:f33e:e32e with SMTP id
 x18-20020a81a012000000b00555f33ee32emr22884527ywg.51.1683885366474; Fri, 12
 May 2023 02:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org> <20230503-virt-to-pfn-v6-4-rc1-v1-2-6c4698dcf9c8@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-2-6c4698dcf9c8@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2023 11:55:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJjjo9TMeow1-i27ybpQOu9-VZYnTkY5p8p_Cm6sW_GA@mail.gmail.com>
Message-ID: <CAMuHMdVJjjo9TMeow1-i27ybpQOu9-VZYnTkY5p8p_Cm6sW_GA@mail.gmail.com>
Subject: Re: [PATCH 02/12] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Greg Ungerer <gerg@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_025614_344701_7D73B8C9 
X-CRM114-Status: GOOD (  22.22  )
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

SGkgTGludXMsCgpPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCAxOjU54oCvUE0gTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiBGdW5jdGlvbnMgdGhhdCB3b3Jr
IG9uIGEgcG9pbnRlciB0byB2aXJ0dWFsIG1lbW9yeSBzdWNoIGFzCj4gdmlydF90b19wZm4oKSBh
bmQgdXNlcnMgb2YgdGhhdCBmdW5jdGlvbiBzdWNoIGFzCj4gdmlydF90b19wYWdlKCkgYXJlIHN1
cHBvc2VkIHRvIHBhc3MgYSBwb2ludGVyIHRvIHZpcnR1YWwKPiBtZW1vcnksIGlkZWFsbHkgYSAo
dm9pZCAqKSBvciBvdGhlciBwb2ludGVyLiBIb3dldmVyIHNpbmNlCj4gbWFueSBhcmNoaXRlY3R1
cmVzIGltcGxlbWVudCB2aXJ0X3RvX3BmbigpIGFzIGEgbWFjcm8sCj4gdGhpcyBmdW5jdGlvbiBi
ZWNvbWVzIHBvbHltb3JwaGljIGFuZCBhY2NlcHRzIGJvdGggYQo+ICh1bnNpZ25lZCBsb25nKSBh
bmQgYSAodm9pZCAqKS4KPgo+IEZpeCB1cCB0aGUgb2ZmZW5kaW5nIGNhbGxzIGluIGFyY2gvbTY4
ayB3aXRoIGV4cGxpY2l0IGNhc3RzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IC0tLQo+IENoYW5nZUxvZyB2MS0+djI6Cj4gLSBB
ZGQgYW4gZXh0cmEgcGFyZW5zIGFyb3VuZCB0aGUgcGFnZSBhcmd1bWVudCB0byB0aGUKPiAgIFBE
X1BUQUJMRSgpIG1hY3JvLCBhcyBpcyBub3JtYWxseSByZXF1aXJlZC4KClRoYW5rcyBmb3IgdGhl
IHVwZGF0ZSEKClRvIGJ1aWxkIHN1bjNfZGVmY29uZmlnIGFuZCBtNTQ3NWV2Yl9kZWZjb25maWcg
Y2xlYW5seSwgeW91IG5lZWQgdG8KaW5jbHVkZSB0aGUgKEdtYWlsLXdoaXRlc3BhY2UtZGFtYWdl
ZCkgY2hhbmdlcyBiZWxvdy4KVGhlc2Ugd2VyZSBjb21waWxlLXRlc3RlZCBvbmx5LgoKZGlmZiAt
LWdpdCBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9tY2ZfcGd0YWJsZS5oCmIvYXJjaC9tNjhrL2lu
Y2x1ZGUvYXNtL21jZl9wZ3RhYmxlLmgKaW5kZXggOTZkMDY5ODI5ODAzNTA1Yy4uNDZhZTM3OWJi
MTRkNWUwNSAxMDA2NDQKLS0tIGEvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL21jZl9wZ3RhYmxlLmgK
KysrIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL21jZl9wZ3RhYmxlLmgKQEAgLTEzNSw3ICsxMzUs
NyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHRlX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAp1
bnNpZ25lZCBsb25nIGFkZHIsCiB9CgogI2RlZmluZSBwdGVfcGFnZW5yKHB0ZSkgICAgICAgICgo
X19wdGVfcGFnZShwdGUpIC0gUEFHRV9PRkZTRVQpID4+IFBBR0VfU0hJRlQpCi0jZGVmaW5lIHB0
ZV9wYWdlKHB0ZSkgIHZpcnRfdG9fcGFnZShfX3B0ZV9wYWdlKHB0ZSkpCisjZGVmaW5lIHB0ZV9w
YWdlKHB0ZSkgIHZpcnRfdG9fcGFnZSgodm9pZCAqKV9fcHRlX3BhZ2UocHRlKSkKCiBzdGF0aWMg
aW5saW5lIGludCBwbWRfbm9uZTIocG1kX3QgKnBtZCkgeyByZXR1cm4gIXBtZF92YWwoKnBtZCk7
IH0KICNkZWZpbmUgcG1kX25vbmUocG1kKSBwbWRfbm9uZTIoJihwbWQpKQpkaWZmIC0tZ2l0IGEv
YXJjaC9tNjhrL2luY2x1ZGUvYXNtL3N1bjNfcGd0YWJsZS5oCmIvYXJjaC9tNjhrL2luY2x1ZGUv
YXNtL3N1bjNfcGd0YWJsZS5oCmluZGV4IGU1ODJiMDQ4NGE1NWNkODIuLmYzZTc3MjhmNThjZDlk
ZDAgMTAwNjQ0Ci0tLSBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9zdW4zX3BndGFibGUuaAorKysg
Yi9hcmNoL202OGsvaW5jbHVkZS9hc20vc3VuM19wZ3RhYmxlLmgKQEAgLTEwOSw5ICsxMDksOSBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgcHRlX2NsZWFyIChzdHJ1Y3QgbW1fc3RydWN0CiptbSwgdW5z
aWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcAogI2RlZmluZSBwZm5fcHRlKHBmbiwgcGdwcm90KSBc
CiAoeyBwdGVfdCBfX3B0ZTsgcHRlX3ZhbChfX3B0ZSkgPSBwZm4gfCBwZ3Byb3RfdmFsKHBncHJv
dCk7IF9fcHRlOyB9KQoKLSNkZWZpbmUgcHRlX3BhZ2UocHRlKSAgICAgICAgICB2aXJ0X3RvX3Bh
Z2UoX19wdGVfcGFnZShwdGUpKQorI2RlZmluZSBwdGVfcGFnZShwdGUpICAgICAgICAgIHZpcnRf
dG9fcGFnZSgodm9pZCAqKV9fcHRlX3BhZ2UocHRlKSkKICNkZWZpbmUgcG1kX3BmbihwbWQpICAg
ICAgICAgICAocG1kX3ZhbChwbWQpID4+IFBBR0VfU0hJRlQpCi0jZGVmaW5lIHBtZF9wYWdlKHBt
ZCkgICAgICAgICAgdmlydF90b19wYWdlKHBtZF9wYWdlX3ZhZGRyKHBtZCkpCisjZGVmaW5lIHBt
ZF9wYWdlKHBtZCkgICAgICAgICAgdmlydF90b19wYWdlKCh2b2lkICopcG1kX3BhZ2VfdmFkZHIo
cG1kKSkKCgogc3RhdGljIGlubGluZSBpbnQgcG1kX25vbmUyIChwbWRfdCAqcG1kKSB7IHJldHVy
biAhcG1kX3ZhbCAoKnBtZCk7IH0KZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9tbS9tY2ZtbXUuYyBi
L2FyY2gvbTY4ay9tbS9tY2ZtbXUuYwppbmRleCA3MGFhMDk3OWUwMjcxMGE4Li5hNGM1NTJjN2Uy
YzhjYTEyIDEwMDY0NAotLS0gYS9hcmNoL202OGsvbW0vbWNmbW11LmMKKysrIGIvYXJjaC9tNjhr
L21tL21jZm1tdS5jCkBAIC02OSw3ICs2OSw3IEBAIHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZv
aWQpCgogICAgICAgICAgICAgICAgLyogbm93IGNoYW5nZSBwZ190YWJsZSB0byBrZXJuZWwgdmly
dHVhbCBhZGRyZXNzZXMgKi8KICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBQVFJTX1BF
Ul9QVEU7ICsraSwgKytwZ190YWJsZSkgewotICAgICAgICAgICAgICAgICAgICAgICBwdGVfdCBw
dGUgPSBwZm5fcHRlKHZpcnRfdG9fcGZuKGFkZHJlc3MpLCBQQUdFX0lOSVQpOworICAgICAgICAg
ICAgICAgICAgICAgICBwdGVfdCBwdGUgPSBwZm5fcHRlKHZpcnRfdG9fcGZuKCh2b2lkCiopYWRk
cmVzcyksIFBBR0VfSU5JVCk7CiAgICAgICAgICAgICAgICAgICAgICAgIGlmIChhZGRyZXNzID49
ICh1bnNpZ25lZCBsb25nKSBoaWdoX21lbW9yeSkKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwdGVfdmFsKHB0ZSkgPSAwOwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
