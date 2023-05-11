Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B35C7EE23
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERnVBP/a1SCYY4fLRIc9Z7BZ8Nn0zbr7TDOWpOOuYdQ=; b=Rtdx8ijVDUUapk
	XCJQTLnnPjkDHL8Ve/abKqa9yXKTMajD9qpz6Z9fHRYS4esHMKyu61Zem/wp9m2I0d1IuD54QXzxe
	vJ2wHmX89zu+PgEkiax38WxlaF27EQnBDlO05Vr1Pi76nK/6Rzy7Ktq51e9VcsfT+jgkEeR5uxzmT
	XNtkF+Yfc1aoD1r7b8b7UfczBwWcgrLsYWOEiP25aGzShVfZqP493rwZV9swRbwYWZsdYD76ij23p
	pIHYP9OAJF78kvs5k1Cmmy/YBFaJaYIIR1EdHgYIOZ9XU+d0owOaXua43/0DacXNGkdA+0CgmYAap
	mVDgGOR8NysQ7E1aqihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px5Wl-008ku8-2c;
	Thu, 11 May 2023 12:36:11 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px5Wh-008ktQ-1x;
	Thu, 11 May 2023 12:36:09 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-55a26b46003so129630117b3.1;
        Thu, 11 May 2023 05:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683808564; x=1686400564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bccEgTIv+NuBZ7b0m7HvDAcmdwRNosK16KRrDt/LqxI=;
        b=YyCYTKMrYFtFNFdK725a1oo7jORoO6mJf03Wzf4zXBGEZ/75krqoQNJZIGFm7EnLws
         Hk/XepMxQf0yPGzVA+QAsmMUVx+H4/yJojWyS3q1WqQstvmX6AksyGin8zxRNEYWU2lU
         yb+QLju8Aff5UVUsVE84D2z7y2hQfFlAAMpmoaTdKbm3J7UdAxlRpq4SJjhk9Qs6dKrs
         MbgUo9Q9TVrYQzMnonvRUFIFaT3F4UHuUSJqJW/l1fcctyIRUMNpEs9UeXemZt3Cl1Qz
         fmQOflLN0MeuxAy9GgU0hrqIkGMoZmKjA9N8AFex7GUb3IlF0GjTKFZQPbRiRFZWx5Lz
         oHVQ==
X-Gm-Message-State: AC+VfDyet7AoUHOEkcr0VxhK8IUFdSbx13Yiw1XFcPCi4rBjlbU0kd64
	6Kv8T7FXLSr7VshOYvpuQvrSz12P2v+kLQ==
X-Google-Smtp-Source: ACHHUZ5TVf/iTTcpH3OGiVMvp2k16X1PsM7l2cp8YcocwiK7aMosNo3gw6BW6u4xavtGYA3j4vpjzQ==
X-Received: by 2002:a0d:e6d5:0:b0:55a:30f5:3d65 with SMTP id p204-20020a0de6d5000000b0055a30f53d65mr22178552ywe.41.1683808564444;
        Thu, 11 May 2023 05:36:04 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id g190-20020a0dddc7000000b00545a081849esm4851507ywe.46.2023.05.11.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 05:36:04 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-559eae63801so129597037b3.2;
        Thu, 11 May 2023 05:36:03 -0700 (PDT)
X-Received: by 2002:a81:8a05:0:b0:556:1b32:343b with SMTP id
 a5-20020a818a05000000b005561b32343bmr19413336ywg.45.1683808563363; Thu, 11
 May 2023 05:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-6-tzimmermann@suse.de> <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com> <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
In-Reply-To: <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 14:35:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Message-ID: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>, 
	Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Vineet Gupta <vgupta@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	"David S . Miller" <davem@davemloft.net>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Sam Ravnborg <sam@ravnborg.org>, 
	suijingfeng@loongson.cn, oe-kbuild-all@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Artur Rojek <contact@artur-rojek.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_053607_646667_AEEBBAE7 
X-CRM114-Status: GOOD (  29.74  )
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

SGkgQXJuZCwKCkNDIEFydHVyLCB3aG8ncyB3b3JraW5nIG9uIEhQIEpvcm5hZGEgNjgwLgoKT24g
V2VkLCBNYXkgMTAsIDIwMjMgYXQgNTo1NeKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+IE9uIFdlZCwgTWF5IDEwLCAyMDIzLCBhdCAxNjoyNywgVGhvbWFzIFppbW1l
cm1hbm4gd3JvdGU6Cj4gPiBBbSAxMC4wNS4yMyB1bSAxNjoxNSBzY2hyaWViIEFybmQgQmVyZ21h
bm46Cj4gPj4gT24gV2VkLCBNYXkgMTAsIDIwMjMsIGF0IDE2OjAzLCBrZXJuZWwgdGVzdCByb2Jv
dCB3cm90ZToKPgo+ID4+IEkgdGhpbmsgdGhhdCdzIGEgcHJlZXhpc3RpbmcgYnVnIGFuZCBJIGhh
dmUgbm8gaWRlYSB3aGF0IHRoZQo+ID4+IGNvcnJlY3Qgc29sdXRpb24gaXMuIExvb2tpbmcgZm9y
IEhENjQ0NjEgc2hvd3MgaXQgYmVpbmcgdXNlZAo+ID4+IGJvdGggd2l0aCBpbncvb3V0dyBhbmQg
cmVhZHcvd3JpdGV3LCBzbyB0aGVyZSBpcyBubyB3YXkgdG8gaGF2ZQo+ID4+IHRoZSBjb3JyZWN0
IHR5cGUuIFRoZSBzaCBfX3Jhd19yZWFkdygpIGRlZmluaXRpb24gaGlkZXMgdGhpcyBidWcsCj4g
Pj4gYnV0IHRoYXQgaXMgYSBwcm9ibGVtIHdpdGggYXJjaC9zaCBhbmQgaXQgcHJvYmFibHkgaGlk
ZXMgb3RoZXJzCj4gPj4gYXMgd2VsbC4KPiA+Cj4gPiBUaGUgY29uc3RhbnQgSEQ2NDQ2MV9JT0JB
U0UgaXMgZGVmaW5lZCBhcyBpbnRlZ2VyIGF0Cj4gPgo+ID4KPiA+IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9zaC9pbmNsdWRlL2FzbS9oZDY0NDYx
LmgjTDE3Cj4gPgo+ID4gYnV0IGZiX3JlYWR3KCkgZXhwZWN0cyBhIHZvbGF0aWxlLXZvaWQgcG9p
bnRlci4gSSBndWVzcyB3ZSBjb3VsZCBhZGQgYQo+ID4gY2FzdCBzb21ld2hlcmUgdG8gc2lsZW5j
ZSB0aGUgcHJvYmxlbS4gSW4gdGhlIGN1cnJlbnQgdXBzdHJlYW0gY29kZSwKPiA+IHRoYXQgYXBw
ZWFycyB0byBiZSBkb25lIGJ5IHNoJ3MgX19yYXdfcmVhZHcoKSBpbnRlcm5hbGx5Ogo+ID4KPiA+
Cj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gv
c2gvaW5jbHVkZS9hc20vaW8uaCNMMzUKPgo+IFN1cmUsIHRoYXQgd291bGQgbWFrZSBpdCBidWls
ZCBhZ2FpbiwgYnV0IHRoYXQgc3RpbGwgZG9lc24ndCBtYWtlIHRoZQo+IGNvZGUgY29ycmVjdCwg
c2luY2UgaXQncyBjb21wbGV0ZWx5IHVuY2xlYXIgd2hhdCBiYXNlIGFkZHJlc3MgdGhlCj4gSEQ2
NDQ2MV9JT0JBU0UgaXMgcmVsYXRpdmUgdG8uIFRoZSBocDZ4eCBwbGF0Zm9ybSBjb2RlIG9ubHkg
cGFzc2VzIGl0Cj4gdGhyb3VnaCBpbncoKS9vdXR3KCksIHdoaWNoIHRha2UgYW4gb2Zmc2V0IHJl
bGF0aXZlIHRvIHNoX2lvX3BvcnRfYmFzZSwKPiBidXQgdGhhdCBpcyBub3QgaW5pdGlhbGl6ZWQg
b24gaHA2eHguIEkgdHJpZWQgdG8gZmluZCBpbiB0aGUgaGlzdG9yeQo+IHdoZW4gaXQgYnJva2Us
IGFwcGFyZW50bHkgdGhhdCB3YXMgaW4gMjAwNyBjb21taXQgMzRhNzgwYTBhZmViICgic2g6Cj4g
aHA2eHggcGF0YV9wbGF0Zm9ybSBzdXBwb3J0LiIpLCB3aGljaCByZW1vdmVkIHRoZSBjdXN0b20g
aW53L291dHcKPiBpbXBsZW1lbnRhdGlvbnMuCgpTZWUgYWxzbyBjb21taXQgNGFhZmFlMjdkMGNl
NzNmOCAoInNoOiBoZDY0NDYxIHRpZHlpbmcuIiksIHdoaWNoCmNsYWltcyB0aGV5IGFyZSBubyBs
b25nZXIgbmVlZGVkLgoKRG9uJ3QgdGhlIEkvTyBwb3J0IG1hY3JvcyBqdXN0IHRyZWF0IHRoZSBw
b3J0IGFzIGFuIGFic29sdXRlIGJhc2UgYWRkcmVzcwp3aGVuIHNoX2lvX3BvcnRfYmFzZSBpc24n
dCBzZXQ/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
