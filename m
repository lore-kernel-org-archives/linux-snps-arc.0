Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60F5C77B75
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 10:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fi9WwDPYGbG+mITX9JXvVyX5yy6q0Abf2VAulFDAIps=; b=fuTHsb//xw7RTQ
	XwRpllbg8uGB9MVM1j9PD7NJiH3LBo8F1YxDonJ+21kpwiwI68RHGyNR98VLvTxZN4Mle/qJQOPns
	UrB2Vvq6M0pWFhNSU7vMFw2SOE/lCBVX33b71jdlExlecaKMvWE1ZEtendcF3g69m6Tb7iydvSrPQ
	4di1CSEoHKL53dBb8lWUMSuOqqD1Qvl9hF9o+AfL/oySjuJR+AkjyPYxrteRUeUowcFMkZbnZjwNp
	QfRmZ/8ion8UzOEffbj6XfPfidLRVQa3btzKT0kvI2Fhd4WMc+A5I87bD3x3VQDxl+Vprb2FZRNBV
	TSe7v516HyjOPIy3pQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q12W2-005wkg-00;
	Mon, 22 May 2023 10:11:46 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q12Vy-005wjf-1m;
	Mon, 22 May 2023 10:11:44 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-561f23dc55aso58412297b3.3;
        Mon, 22 May 2023 03:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684750300; x=1687342300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQATq2c9SwOWOfQ7A10Go9afc2yqePz2ONTwzgTVwBU=;
        b=Ty7yDsJwF0eS7ONLFGxnCN+eDGx/4Huy3bhBe5EA3EKgp20Kcv1LAL95cb4rxJsfod
         KbcxhahRlQjSyb7QqpINKkCk1PaEvLRG2zoSIFwkoxnoXIPL+n9CLPk1jTDYIRKMw+z5
         gVlSG+RB8ZGgS0tcX5opbTQo8X1iMs5V3Ln7uc2MbjFOi+h1E4jXsEkuEISJGlTAqonF
         BrOdejAr8Q6lMKM+1SQAReDcH2Q5fAdaiAm/ZlnAJxF7+ei3gCJt0cd0/LnXr8kHPwdH
         D9Vw2/WAxv9VmVc6HhDYRKD4pXm26ravakszzlox5ua639B4ln/+Hpr1vyZ4T5nGoqy3
         elJA==
X-Gm-Message-State: AC+VfDzT07wRQWheE4vrwvZCV6xfKf9K1UHLBPuQnOJdQHjAO7cZVDYO
	dM0FgAQ5KG7yEeHig/RXOPvWwO6BsG8HWQ==
X-Google-Smtp-Source: ACHHUZ6BA/ajMB/bwGcSjh9qg5kNty06Rw1rJ8MRj88OWXcKlWqca5QG1lP6bODj8t5dC5rMhBLOrA==
X-Received: by 2002:a81:5247:0:b0:561:c5c3:9d79 with SMTP id g68-20020a815247000000b00561c5c39d79mr9162016ywb.45.1684750300281;
        Mon, 22 May 2023 03:11:40 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id a128-20020a816686000000b00561e2cb2d3bsm1967815ywc.23.2023.05.22.03.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 03:11:39 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ba8afcc82c0so8660367276.2;
        Mon, 22 May 2023 03:11:38 -0700 (PDT)
X-Received: by 2002:a81:5247:0:b0:561:c5c3:9d79 with SMTP id
 g68-20020a815247000000b00561c5c39d79mr9161977ywb.45.1684750298756; Mon, 22
 May 2023 03:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org> <20230503-virt-to-pfn-v6-4-rc1-v2-2-0948d38bddab@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v2-2-0948d38bddab@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 May 2023 12:11:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXB1fK_G=QZ59qkJWXhb61TyLRMwH3qo_0sSmW0Cfv8hA@mail.gmail.com>
Message-ID: <CAMuHMdXB1fK_G=QZ59qkJWXhb61TyLRMwH3qo_0sSmW0Cfv8hA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <vgupta@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, linux-mm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_031142_593884_A00D7C91 
X-CRM114-Status: GOOD (  27.94  )
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

SGkgTGludXMsCgpPbiBNb24sIE1heSAyMiwgMjAyMyBhdCA5OjAw4oCvQU0gTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiBGdW5jdGlvbnMgdGhhdCB3b3Jr
IG9uIGEgcG9pbnRlciB0byB2aXJ0dWFsIG1lbW9yeSBzdWNoIGFzCj4gdmlydF90b19wZm4oKSBh
bmQgdXNlcnMgb2YgdGhhdCBmdW5jdGlvbiBzdWNoIGFzCj4gdmlydF90b19wYWdlKCkgYXJlIHN1
cHBvc2VkIHRvIHBhc3MgYSBwb2ludGVyIHRvIHZpcnR1YWwKPiBtZW1vcnksIGlkZWFsbHkgYSAo
dm9pZCAqKSBvciBvdGhlciBwb2ludGVyLiBIb3dldmVyIHNpbmNlCj4gbWFueSBhcmNoaXRlY3R1
cmVzIGltcGxlbWVudCB2aXJ0X3RvX3BmbigpIGFzIGEgbWFjcm8sCj4gdGhpcyBmdW5jdGlvbiBi
ZWNvbWVzIHBvbHltb3JwaGljIGFuZCBhY2NlcHRzIGJvdGggYQo+ICh1bnNpZ25lZCBsb25nKSBh
bmQgYSAodm9pZCAqKS4KPgo+IEZpeCB1cCB0aGUgb2ZmZW5kaW5nIGNhbGxzIGluIGFyY2gvbTY4
ayB3aXRoIGV4cGxpY2l0IGNhc3RzLgo+Cj4gVGhlIHBhZ2UgdGFibGUgaW5jbHVkZSA8YXNtL3Bn
dGFibGUuaD4gd2lsbCBpbmNsdWRlIGRpZmZlcmVudAo+IHZhcmlhbnRzIG9mIHRoZSBkZWZpbmVz
IGRlcGVuZGluZyBvbiB3aGV0aGVyIHlvdSBidWlsZCBmb3IKPiBjbGFzc2ljIG02OGssIENvbGRG
aXJlIG9yIFN1bjMsIHNvIGZpeCBhbGwgdmFyaWFudHMuCj4KPiBUZXN0ZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKVGhhbmtzIGZvciB0aGUgdXBkYXRl
IQoKPiAtLS0KPiBDaGFuZ2VMb2cgdjItPnYzOgoKdjM/Cgo+IC0gRml4IHRoZSBzdW4zIHBndGFi
bGUgbWFjcm8gdG8gbm90IGNhc3QgdG8gdW5zaWduZWQgbG9uZy4KPiAtIE1ha2UgYSBzaW1pbGFy
IGNoYW5nZSB0byB0aGUgQ29sZEZpcmUgaW5jbHVkZS4KClRoZSBDb2xkRmlyZSBjaGFuZ2UgaXMg
bm90IGNvcnJlY3QsIGNmci4gYmVsb3cuLi4KCj4gQ2hhbmdlTG9nIHYxLT52MjoKPiAtIEFkZCBh
biBleHRyYSBwYXJlbnMgYXJvdW5kIHRoZSBwYWdlIGFyZ3VtZW50IHRvIHRoZQo+ICAgUERfUFRB
QkxFKCkgbWFjcm8sIGFzIGlzIG5vcm1hbGx5IHJlcXVpcmVkLgo+IC0tLQo+ICBhcmNoL202OGsv
aW5jbHVkZS9hc20vbWNmX3BndGFibGUuaCAgfCA0ICsrLS0KPiAgYXJjaC9tNjhrL2luY2x1ZGUv
YXNtL3N1bjNfcGd0YWJsZS5oIHwgNCArKy0tCj4gIGFyY2gvbTY4ay9tbS9tY2ZtbXUuYyAgICAg
ICAgICAgICAgICB8IDMgKystCj4gIGFyY2gvbTY4ay9tbS9tb3Rvcm9sYS5jICAgICAgICAgICAg
ICB8IDQgKystLQo+ICBhcmNoL202OGsvbW0vc3VuM21tdS5jICAgICAgICAgICAgICAgfCAyICst
Cj4gIGFyY2gvbTY4ay9zdW4zL2R2bWEuYyAgICAgICAgICAgICAgICB8IDIgKy0KPiAgYXJjaC9t
NjhrL3N1bjN4L2R2bWEuYyAgICAgICAgICAgICAgIHwgMiArLQo+ICA3IGZpbGVzIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
bTY4ay9pbmNsdWRlL2FzbS9tY2ZfcGd0YWJsZS5oIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL21j
Zl9wZ3RhYmxlLmgKPiBpbmRleCBkOTdmYmI4MTJmNjMuLmY2N2M1OTMzNmFiNCAxMDA2NDQKPiAt
LS0gYS9hcmNoL202OGsvaW5jbHVkZS9hc20vbWNmX3BndGFibGUuaAo+ICsrKyBiL2FyY2gvbTY4
ay9pbmNsdWRlL2FzbS9tY2ZfcGd0YWJsZS5oCj4gQEAgLTExNSw4ICsxMTUsOCBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgcGdkX3NldChwZ2RfdCAqcGdkcCwgcG1kX3QgKnBtZHApCj4gICAgICAgICBw
Z2RfdmFsKCpwZ2RwKSA9IHZpcnRfdG9fcGh5cyhwbWRwKTsKPiAgfQo+Cj4gLSNkZWZpbmUgX19w
dGVfcGFnZShwdGUpICAgICAgICAoKHVuc2lnbmVkIGxvbmcpIChwdGVfdmFsKHB0ZSkgJiBQQUdF
X01BU0spKQo+IC0jZGVmaW5lIHBtZF9wYWdlX3ZhZGRyKHBtZCkgICAgKCh1bnNpZ25lZCBsb25n
KSAocG1kX3ZhbChwbWQpKSkKPiArI2RlZmluZSBfX3B0ZV9wYWdlKHB0ZSkgICAgICAgIChfX3Zh
IChwdGVfdmFsKHB0ZSkgJiBQQUdFX01BU0spKQoKSSBndWVzcyAiX192YSguLi4pIiBzaG91bGQg
YmUgIih2b2lkICopLi4uIiBpbnN0ZWFkPwoKSG93ZXZlciwgdGhhdCB3aWxsIGNhdXNlIGFuIGlz
c3VlIGJlbG93LCBhcwoKICAgICNkZWZpbmUgcHRlX3BhZ2VucihwdGUpICAgICAgICAoKF9fcHRl
X3BhZ2UocHRlKSAtIFBBR0VfT0ZGU0VUKSA+PgpQQUdFX1NISUZUKQoKZG9lcyBkZXBlbmQgb24g
X19wdGVfcGFnZSgpIHJldHVybmluZyAidW5zaWduZWQgbG9uZyIuCkZvcnR1bmF0ZWx5IHB0ZV9w
YWdlbnIoKSBhcHBlYXJzIHVudXNlZCwgc28gaXQgY2FuIGJlIHJlbW92ZWQuCgpTbyBmb3Igbm93
LCBpdCBtaWdodCBiZSBzaW1wbGVyIHRvIGFkZCB0aGUgY2FzdCB0byB0aGUgY2FsbGVyLgoKCj4g
KyNkZWZpbmUgcG1kX3BhZ2VfdmFkZHIocG1kKSAgICAoX192YSAocG1kX3ZhbChwbWQpKSkKClRo
aXMgbG9va3MgYm9ndXMsIHRvbywgYXMgaXQgc2hvdWxkIHJldHVybiAidW5zaWduZWQgbG9uZyIu
CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAK
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
