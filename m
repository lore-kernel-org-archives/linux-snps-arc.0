Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA631C77B7C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 May 2023 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRItQJC4cBmdGSbToMRhqxypkEBf1c22WIuyo6XUkkc=; b=fSYGWRvEYBMlSZ
	kMPpNTyrlF7bhexA6e9wGmoTDvva5qHdKJLFdkE+wC/HwNyZHJfKc9EA4+FKBezRr8YCHvpoknfdX
	p3eAIN8z3Ow2SI5pA2yQZXaLDCoUrTz4BR3TWqXZEWffLsr3gDHU8w45tBBRjQoeEQ0Sq7iZok+op
	A5s/1oaaAbcbUoNF7trbrlqkwzYhfysbWRgFt3Flnep0GTtHCRpWzgp4qmV/GHEvcaurS/eUoOq1u
	waXwFyT4Or7QIrummFOzFsKRO+n74eRrI6/HI6kjIoiKacFob/B+kHA6iL4E01yI6aYsye839XBKU
	oM6Pan8R6/Tn1mvnwE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwj1x-0069PI-0v;
	Wed, 10 May 2023 12:34:53 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwj1t-0069Op-2p;
	Wed, 10 May 2023 12:34:51 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-559de1d36a9so103568127b3.1;
        Wed, 10 May 2023 05:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683722086; x=1686314086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGY/0htSfGIvsVgPn7bx+ykp3agguIOsAu0irnl44Xg=;
        b=UxMV/Aar31KGgWQ0xyO6TDQbFQEZFfCw3GxIah/PLXhrAgNmDKd/1Ard8aa+PCDALT
         ZwI2LLumZ7dAS9isrjgDcnXTVc5hmkkIdF7pejcLvIzqVy9oGRHefYTRFbTnpuPXYIN5
         W/BmSxOveV+GNmUnqKEOjpy4Ztzh3rN7CWwRwtBzTcE6NK0hvRw1RwcjeG/i3rk4MjAe
         3sTY6T6nMrMowXjPBERK0Zu2bVFPVdDzBnxk3/M4uY2SlBu8yFms/BVGOBNqMnNAYIWp
         Y5sl2M3rnzBmTnfUgvQJHoJFQD85oel2Zt39HP5kQ84+QBs3Lc3wfu2SdY4skYJQvUnS
         REkw==
X-Gm-Message-State: AC+VfDzuOBn9VX015VzW3PUK290U3QVYw1zLT15mGykENTy6Kke4fNZ3
	y8A/AFlfipJUbVKnpBo78RBZkhKgGU8U0Q==
X-Google-Smtp-Source: ACHHUZ5U4CFPFUF/NGknM5K+QrRCuU24hhjjBy1RhQvLWmWL2RgPbCd/uADaT09W+AdEp/HwcGhv1g==
X-Received: by 2002:a81:9c06:0:b0:55d:6fe1:8ce5 with SMTP id m6-20020a819c06000000b0055d6fe18ce5mr20545668ywa.6.1683722086255;
        Wed, 10 May 2023 05:34:46 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id q7-20020a0de707000000b00545a08184f8sm4071162ywe.136.2023.05.10.05.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 05:34:45 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-559e53d1195so103598477b3.2;
        Wed, 10 May 2023 05:34:45 -0700 (PDT)
X-Received: by 2002:a0d:ead7:0:b0:55a:ae08:163f with SMTP id
 t206-20020a0dead7000000b0055aae08163fmr22367018ywe.32.1683722085095; Wed, 10
 May 2023 05:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de> <20230510110557.14343-6-tzimmermann@suse.de>
In-Reply-To: <20230510110557.14343-6-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2023 14:34:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com>
Message-ID: <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, daniel@ffwll.ch, vgupta@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, davem@davemloft.net, 
	James.Bottomley@hansenpartnership.com, arnd@arndb.de, sam@ravnborg.org, 
	suijingfeng@loongson.cn, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_053449_931266_BB4F774A 
X-CRM114-Status: GOOD (  24.92  )
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

SGkgVGhvbWFzLAoKT24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgMTowNuKAr1BNIFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToKPiBJbXBsZW1lbnQgZnJhbWVidWZm
ZXIgSS9PIGhlbHBlcnMsIHN1Y2ggYXMgZmJfcmVhZCooKSBhbmQgZmJfd3JpdGUqKCksCj4gaW4g
dGhlIGFyY2hpdGVjdHVyZSdzIDxhc20vZmIuaD4gaGVhZGVyIGZpbGUgb3IgdGhlIGdlbmVyaWMg
b25lLgo+Cj4gVGhlIGNvbW1vbiBjYXNlIGhhcyBiZWVuIHRoZSB1c2Ugb2YgcmVndWxhciBJL08g
ZnVuY3Rpb25zLCBzdWNoIGFzCj4gX19yYXdfcmVhZGIoKSBvciBtZW1zZXRfaW8oKS4gQSBmZXcg
YXJjaGl0ZWN0dXJlcyB1c2VkIHBsYWluIHN5c3RlbS0KPiBtZW1vcnkgcmVhZHMgYW5kIHdyaXRl
cy4gU3BhcmMgdXNlZCBoZWxwZXJzIGZvciBpdHMgU0J1cy4KPgo+IFRoZSBhcmNoaXRlY3R1cmVz
IHRoYXQgdXNlZCBzcGVjaWFsIGNhc2VzIHByb3ZpZGUgdGhlIHNhbWUgY29kZSBpbgo+IHRoZWly
IF9fcmF3XyooKSBJL08gaGVscGVycy4gU28gdGhlIHBhdGNoIHJlcGxhY2VzIHRoaXMgY29kZSB3
aXRoIHRoZQo+IF9fcmF3XyooKSBmdW5jdGlvbnMgYW5kIG1vdmVzIGl0IHRvIDxhc20tZ2VuZXJp
Yy9mYi5oPiBmb3IgYWxsCj4gYXJjaGl0ZWN0dXJlcy4KPgo+IHY2Ogo+ICAgICAgICAgKiBmaXgg
ZmJfcmVhZHEoKS9mYl93cml0ZXEoKSBvbiA2NC1iaXQgbWlwcyAoa2VybmVsIHRlc3Qgcm9ib3Qp
Cj4gdjU6Cj4gICAgICAgICAqIGluY2x1ZGUgPGxpbnV4L2lvLmg+IGluIDxhc20tZ2VuZXJpYy9m
Yj47IGZpeCBzMzkwIGJ1aWxkCj4gdjQ6Cj4gICAgICAgICAqIGlhNjQsIGxvb25nYXJjaCwgc3Bh
cmM2NDogYWRkIGZiX21lbSooKSB0byBhcmNoIGhlYWRlcnMKPiAgICAgICAgICAgdG8ga2VlcCBj
dXJyZW50IHNlbWFudGljcyAoQXJuZCkKPiB2MzoKPiAgICAgICAgICogaW1wbGVtZW50IGFsbCBh
cmNoaXRlY3R1cmVzIHdpdGggZ2VuZXJpYyBoZWxwZXJzCj4gICAgICAgICAqIHN1cHBvcnQgcmVv
cmRlcmluZyBhbmQgbmF0aXZlIGJ5dGUgb3JkZXIgKEdlZXJ0LCBBcm5kKQo+Cj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gVGVzdGVkLWJ5
OiBTdWkgSmluZ2ZlbmcgPHN1aWppbmdmZW5nQGxvb25nc29uLmNuPgo+IFJldmlld2VkLWJ5OiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4gYWRkIG1pcHMgZmJfcSgpCgo+IC0tLSBh
L2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9mYi5oCj4gKysrIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNt
L2ZiLmgKPiBAQCAtMTIsNiArMTIsMjggQEAgc3RhdGljIGlubGluZSB2b2lkIGZiX3BncHJvdGVj
dChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gIH0KPiAg
I2RlZmluZSBmYl9wZ3Byb3RlY3QgZmJfcGdwcm90ZWN0Cj4KPiArLyoKPiArICogTUlQUyBkb2Vz
bid0IGRlZmluZSBfX3Jhd18gSS9PIG1hY3Jvcywgc28gdGhlIGhlbHBlcnMKPiArICogaW4gPGFz
bS1nZW5lcmljL2ZiLmg+IGRvbid0IGdlbmVyYXRlIGZiX3JlYWRxKCkgYW5kCj4gKyAqIGZiX3dy
aXRlKCkuIFdlIGhhdmUgdG8gcHJvdmlkZSB0aGVtIGhlcmUuCgpNSVBTIGRvZXMgbm90IGluY2x1
ZGUgPGFzbS1nZW5lcmljL2lvLmg+LCAgbm9yIGRlZmluZSBpdHMgb3duCl9fcmF3X3JlYWRxKCkg
YW5kIF9fcmF3X3dyaXRlcSgpLi4uCgo+ICsgKgo+ICsgKiBUT0RPOiBDb252ZXJ0IE1JUFMgdG8g
Z2VuZXJpYyBJL08uIFRoZSBoZWxwZXJzIGJlbG93IGNhbgo+ICsgKiAgICAgICB0aGVuIGJlIHJl
bW92ZWQuCj4gKyAqLwo+ICsjaWZkZWYgQ09ORklHXzY0QklUCj4gK3N0YXRpYyBpbmxpbmUgdTY0
IGZiX3JlYWRxKGNvbnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcikKPiArewo+ICsgICAg
ICAgcmV0dXJuIF9fcmF3X3JlYWRxKGFkZHIpOwoKLi4uIHNvIGhvdyBjYW4gdGhpcyBjYWxsIHdv
cms/Cgo+ICt9Cj4gKyNkZWZpbmUgZmJfcmVhZHEgZmJfcmVhZHEKPiArCj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBmYl93cml0ZXEodTY0IGIsIHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcikKPiAr
ewo+ICsgICAgICAgX19yYXdfd3JpdGVxKGIsIGFkZHIpOwo+ICt9Cj4gKyNkZWZpbmUgZmJfd3Jp
dGVxIGZiX3dyaXRlcQo+ICsjZW5kaWYKPiArCj4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9mYi5o
PgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
