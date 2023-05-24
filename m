Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0357DC77B73
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 May 2023 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5uwA+q3R2HPqAgM92UNr50te3IA1UA5J6UEw1/a37Q=; b=l6+4uiaJN1OhEj
	zRtjRxo7yIo6bJfMvpTpo/ngWfmgTdN8l7mOyLqjMlZKfv1/d8oxAXVcAprfRONugatRwigQPJJt+
	E1aAko2WqOPtrQxW3UGSz9ffIJLnqiii1/R+TbM8W+45UXsBINNGQwy4DHriEl5ju6Co4M5/TC9p3
	E7OnLv2TqxARcW9Ed2EFkrKX+QTIiO6hJrk1DkNpEqpIL5OehBmq+OFOTZNjR8ZujJSNb5L6WWyW9
	zGC+jvSkF0v3tCtVCgteRs9uClJL0mgNHhAj5WTaQmf6MBNXQgjBk5yaLb5ZdAghM5eLyMrgrkTew
	eobs6s/f3hzgBhSwColQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1lVN-00D4Pe-24;
	Wed, 24 May 2023 10:14:05 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1lVL-00D4P0-0I;
	Wed, 24 May 2023 10:14:04 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-563b1e5f701so7030357b3.3;
        Wed, 24 May 2023 03:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684923240; x=1687515240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dz+M1KSdnKMmcmYWNiYwzrnxigtUcBsMNIJcHfr8PAI=;
        b=K8R3LhiS4kNX+BzZR6eFjXVQmKitFZPtfV9bf2FGR00wnwjRtvDpvVcSmUQFFgDcF7
         UJTR8Fh6Matc7zjRt2LyymzdEMHL/WDBwUYNsIQyhbaZYnWusN4U5IjsfhS4Rc/BCKhh
         7XSL2jjSD34/OCXYEcc8jg1GuhkaOy8cdws5Alhjt7PJ8Bgx8EnVXJNrGdtZ0AbNj5LH
         amm5bzFJf3zpTLMOMVAU/Fh+psV/cX0QOx165nYuyaJClEP3VHPE31BieShXwm6JNOl2
         Q4+CtJiCT5KFu3d6mGhdLWxnq+m3s3hacEFwuF5Tm6NbqN5ZyRSMrtRCOsbuO2aybWya
         6Qww==
X-Gm-Message-State: AC+VfDwr23mK0YfOPQScUGpnXpL9TkFfEdsFvyw4ovQ2alUoHhBLgAsM
	dqswMnzOPF8HuCqoa1DG8DFTxjpEVJV/AA==
X-Google-Smtp-Source: ACHHUZ4cc4Bev6AT+fbaK51l4XRSEEKYjhSs6GMFuO0T84xM2TvQ+m8XIyn2EdUYvfHK61xoj/7adg==
X-Received: by 2002:a81:5ac3:0:b0:565:347a:46ee with SMTP id o186-20020a815ac3000000b00565347a46eemr6575475ywb.7.1684923240223;
        Wed, 24 May 2023 03:14:00 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id i16-20020a0ddf10000000b0054f80928ea4sm3547537ywe.140.2023.05.24.03.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 03:13:59 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-ba1815e12efso671035276.3;
        Wed, 24 May 2023 03:13:59 -0700 (PDT)
X-Received: by 2002:a81:5ac3:0:b0:565:347a:46ee with SMTP id
 o186-20020a815ac3000000b00565347a46eemr6575440ywb.7.1684923239253; Wed, 24
 May 2023 03:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org> <20230503-virt-to-pfn-v6-4-rc1-v3-12-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-12-a16c19c03583@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 May 2023 12:13:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFX6vtiiNgZyXTLmhcxdsyOwRL3kb3tDZ4E_LUN2MaeA@mail.gmail.com>
Message-ID: <CAMuHMdVFX6vtiiNgZyXTLmhcxdsyOwRL3kb3tDZ4E_LUN2MaeA@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] m68k/mm: Make pfn accessors static inlines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <vgupta@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, linux-mm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_031403_149174_1BCA0ACD 
X-CRM114-Status: GOOD (  16.97  )
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

T24gVHVlLCBNYXkgMjMsIDIwMjMgYXQgNDowNeKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gTWFraW5nIHZpcnRfdG9fcGZuKCkgYSBzdGF0aWMg
aW5saW5lIHRha2luZyBhIHN0cm9uZ2x5IHR5cGVkCj4gKGNvbnN0IHZvaWQgKikgbWFrZXMgdGhl
IGNvbnRyYWN0IG9mIGEgcGFzc2luZyBhIHBvaW50ZXIgb2YgdGhhdAo+IHR5cGUgdG8gdGhlIGZ1
bmN0aW9uIGV4cGxpY2l0IGFuZCBleHBvc2VzIGFueSBtaXN1c2Ugb2YgdGhlCj4gbWFjcm8gdmly
dF90b19wZm4oKSBhY3RpbmcgcG9seW1vcnBoaWMgYW5kIGFjY2VwdGluZyBtYW55IHR5cGVzCj4g
c3VjaCBhcyAodm9pZCAqKSwgKHVuaXRwdHJfdCkgb3IgKHVuc2lnbmVkIGxvbmcpIGFzIGFyZ3Vt
ZW50cwo+IHdpdGhvdXQgd2FybmluZ3MuCj4KPiBGb3Igc3ltbWV0cnksIGRvIHRoZSBzYW1lIHdp
dGggcGZuX3RvX3ZpcnQoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4
IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0
CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIg
b3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1zbnBzLWFyYwo=
