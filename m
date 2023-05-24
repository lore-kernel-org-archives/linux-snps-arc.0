Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CED1C7EE33
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 May 2023 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5Z6ppB6/mUiGi0qVUa/kNyNFWLgVa11LX2PMd/mBac=; b=NjUT2SyqtTdSdZ
	Kyr+b28V125EFFZng4yGWwwZ8nRBV15iBPKjy/xiEZ1z8hVj1xur7s9xM4aya4HXQFCp2xWAHShzW
	ntYyAwI3h8x4O8/cIDoMK+jXTqZy+v/B2iAYYzHEQGNMSAOtmarxHZGYcqr+kjwCOmjtvJGd9Qtmx
	NJZXmT2Q+px+sRSXHnmwLImmnU2pilzQ/Uf6jSyUCB4HsJmWCkN3yqvUIBTg/dwc9VM0KqE5NF4KP
	tJyqnn3fPqX23fvfMe098ZEY2m/gsuXAe8PFluYRtNB3nIghh05+T+tlTnOAL2LIOmRvd6TV/XItU
	9utzOF8X2GP0Emzd8fvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1lSJ-00D47X-1P;
	Wed, 24 May 2023 10:10:55 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1lSG-00D46W-2O;
	Wed, 24 May 2023 10:10:54 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-561f10b6139so7038457b3.2;
        Wed, 24 May 2023 03:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684923050; x=1687515050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjsS8fRbVoZU8c34Ms8NTam545AKBDbkDG6TRRcdYb4=;
        b=ZUvaDj6xjTVD7n15DPH5Yg45a5hBZx1H1OsEc0ETP1pnUxHoWu2GOHZPMJJERqPRfC
         lpYdzl5CXRobftbpIvoJSBrOqov9MtFt4hErnt5Vdy7sP/67U6xf6pBUwFmcl3MUBDEe
         I61gQtGmqfXi/CgfLjltlaBukKZ3U5y8+n9ciNswX2K4UwZRM0BmzYIHLR38ynOMhu0k
         ZaIekrHUd6ywkrdSPHCUbr1pjuNUUMiWWl7S/OIXqUY1gsBYRwQnlB2q1vLZfMv0M1Jr
         mzC3q/GZms4Dw4AQJAmQADYIK5uZCQGA33vGuDC2NiMskZj3hFbD4GI+wb2U0K4L2HVJ
         REQA==
X-Gm-Message-State: AC+VfDwBdSQUI3Q/g5D5oitwGZrF6jP68z05/WsjpvD5uEnSwAZ1amiF
	0s/T5XFTnrd3pD3beCgjjedn7qy5ziVlIQ==
X-Google-Smtp-Source: ACHHUZ6q7sI24qp5M9KGLWqKFeeDxZorNmHohTsU42LUAa0NzGEL4oEyxeQW2QcSIhUK22u/rvYvDA==
X-Received: by 2002:a0d:d743:0:b0:55a:59cb:4c1a with SMTP id z64-20020a0dd743000000b0055a59cb4c1amr18139632ywd.14.1684923050025;
        Wed, 24 May 2023 03:10:50 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id i16-20020a0ddf10000000b0054f80928ea4sm3545955ywe.140.2023.05.24.03.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 03:10:49 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-564dc3dc075so7136997b3.1;
        Wed, 24 May 2023 03:10:48 -0700 (PDT)
X-Received: by 2002:a0d:c007:0:b0:560:ee0d:1d95 with SMTP id
 b7-20020a0dc007000000b00560ee0d1d95mr18669163ywd.3.1684923047913; Wed, 24 May
 2023 03:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org> <20230503-virt-to-pfn-v6-4-rc1-v3-2-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-2-a16c19c03583@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 May 2023 12:10:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXafb3SYUgu=ZWFRSiqGdt5ahvPEa75v6jGPBPGARaBhw@mail.gmail.com>
Message-ID: <CAMuHMdXafb3SYUgu=ZWFRSiqGdt5ahvPEa75v6jGPBPGARaBhw@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <vgupta@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, linux-mm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_031052_799182_95BD13E7 
X-CRM114-Status: GOOD (  24.22  )
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

SGkgTGludXMsCgpPbiBUdWUsIE1heSAyMywgMjAyMyBhdCA0OjA14oCvUE0gTGludXMgV2FsbGVp
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
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQoKPiAtLS0KPiBDaGFuZ2VMb2cgdjItPnYzOgo+IC0gRml4IHVwIHZlcnNpb25pbmcuIFRoaXMg
aXMgdjMuCj4gLSBMZXQgQ29sZGZpcmUgX19wdGVfcGFnZSgpIHJldHVybiBhICh2b2lkICopIGlu
c3RlYWQgb2YgX192YQo+IC0gRGVsZXRlIENvbGRmaXJlIHB0ZV9wYWdlbnIoKSB3aGljaCB3YXMg
dXNpbmcgdW5zaWduZWQgbG9uZwo+ICAgc2VtYW50aWNzIGZyb20gX19wdGVfcGFnZSgpCgpZb3Ug
bWF5IHdhbnQgdG8gbWVudGlvbiB0aGlzIHJlbW92YWwgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW4u
Cgo+IC0gRHJvcCBpbGwtYWR2aXNlZCBjaGFuZ2UgdG8gQ29sZGZpcmUgcG1kX3BhZ2VfdmFkZHIo
KQoKPiAtLS0gYS9hcmNoL202OGsvaW5jbHVkZS9hc20vc3VuM19wZ3RhYmxlLmgKPiArKysgYi9h
cmNoL202OGsvaW5jbHVkZS9hc20vc3VuM19wZ3RhYmxlLmgKCj4gQEAgLTExMSw3ICsxMTEsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgcHRlX2NsZWFyIChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5z
aWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcAo+Cj4gICNkZWZpbmUgcHRlX3BhZ2UocHRlKSAgICAg
ICAgICB2aXJ0X3RvX3BhZ2UoX19wdGVfcGFnZShwdGUpKQo+ICAjZGVmaW5lIHBtZF9wZm4ocG1k
KSAgICAgICAgICAgKHBtZF92YWwocG1kKSA+PiBQQUdFX1NISUZUKQo+IC0jZGVmaW5lIHBtZF9w
YWdlKHBtZCkgICAgICAgICAgdmlydF90b19wYWdlKHBtZF9wYWdlX3ZhZGRyKHBtZCkpCj4gKyNk
ZWZpbmUgcG1kX3BhZ2UocG1kKSAgICAgICAgICB2aXJ0X3RvX3BhZ2UoKHZvaWQgICopcG1kX3Bh
Z2VfdmFkZHIocG1kKSkKClRoZXJlJ3MgYW4gZXh0cmEgc3BhY2UgYmV0d2VlbiAidm9pZCIgYW5k
ICIqIi4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4K
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
