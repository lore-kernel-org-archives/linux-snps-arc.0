Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CF5C77B61
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMTVwxV5/0DdLFjrtptQRUdLwGBYIL6IGAR0JYLr/Aw=; b=d9F/PfBudAPTR5
	1xczuHT5bB4idYID54h7k4hl+CsK+ceKnmusQm/v+ao455aLIttte5KU7uOnUWypThUzAt5OfVwvq
	B1SsBLVyamegGxYKtt6MPnjG9U/ad9d+izTh7g+WGnYoiSaIGEeaeetcVUarDmZf6y9PLLWsKFyot
	U0kOzM1zLh+zx/Xibq6wxRBiYMtvb23DBtED6DBd59j1W617w8oe4RhSOZUzi6dNoMR+gluXKcE0R
	udXlEWUzfK0NZwh+g78s7ZaQB9r0tQ/7pN38ZjTVfuCBPvu/Q5OBza01QQPPIjQb0KUB88lo7SNG6
	59yictDhmYREEJh+Tc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNCC-009nfG-2t;
	Fri, 28 Apr 2023 12:27:28 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNCA-009nbV-0S;
	Fri, 28 Apr 2023 12:27:27 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-555d2b43a23so112888317b3.2;
        Fri, 28 Apr 2023 05:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682684841; x=1685276841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDsEdn6WDxg314v0qLuVGHvJOHZvS1YLN0vYRrRrPEc=;
        b=WWpovWC1/7g8WT+vAKQAY+LlmnP24NKPJbHFFj0EWuVrJTxuMKtJgreQ6vJi3p+2lE
         g+uSMfeyYa3363Gk5H2YSZLYFvXB8X7+A3osIXp+zWTCZu8HNDU1faTC8Qve5dBHCzjq
         +BCHm0OOA6KuYTPcB2CZ8EEiOcrTZlRbIsho7N2SFJHTd9Wiv3UvlJJ8weI1u21DNQqM
         Sn5jTltEvPWGH6mRwnwqsU7NuXY6WKrOqpZyqTvHL6G1iY7wSEXxSlVA7IeNHBkhQHo8
         /TRijlCdiIqYNZtz0iMPJAaBmHknHU1e68w7WWpcBPB2RT+FVz9IifSmnaD1uzp5eHic
         XQgw==
X-Gm-Message-State: AC+VfDxIzKoCwjO0rGBnkfhCLRphPfTCHZt18xA0vvlw0BPRfYO9zASF
	oX2gwyaVu4i/dn19MpTdlZr8mga/Au/++g==
X-Google-Smtp-Source: ACHHUZ6Un+errl7u/4YfKXZAY3APUDKtrspCv5iBsGUhmcIFF5+S1KdgO+VO1x3ocyVdjF0ovvCZfA==
X-Received: by 2002:a0d:cb0c:0:b0:54f:a23a:7bd2 with SMTP id n12-20020a0dcb0c000000b0054fa23a7bd2mr3884038ywd.2.1682684841533;
        Fri, 28 Apr 2023 05:27:21 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id e64-20020a0df543000000b00545b02d4af5sm4650913ywf.48.2023.04.28.05.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 05:27:20 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-555d2b43a23so112887167b3.2;
        Fri, 28 Apr 2023 05:27:19 -0700 (PDT)
X-Received: by 2002:a81:8a01:0:b0:544:69f5:fadc with SMTP id
 a1-20020a818a01000000b0054469f5fadcmr3593096ywg.6.1682684839491; Fri, 28 Apr
 2023 05:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230428092711.406-1-tzimmermann@suse.de> <20230428092711.406-6-tzimmermann@suse.de>
 <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
In-Reply-To: <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Apr 2023 14:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
Message-ID: <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O functions
To: Robin Murphy <robin.murphy@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, javierm@redhat.com, daniel@ffwll.ch, 
	vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	davem@davemloft.net, James.Bottomley@hansenpartnership.com, arnd@arndb.de, 
	sam@ravnborg.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_052726_186809_68D6E045 
X-CRM114-Status: GOOD (  32.70  )
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

T24gRnJpLCBBcHIgMjgsIDIwMjMgYXQgMjoxOOKAr1BNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVy
cGh5QGFybS5jb20+IHdyb3RlOgo+IE9uIDIwMjMtMDQtMjggMTA6MjcsIFRob21hcyBaaW1tZXJt
YW5uIHdyb3RlOgo+ID4gSW1wbGVtZW50IGZyYW1lYnVmZmVyIEkvTyBoZWxwZXJzLCBzdWNoIGFz
IGZiX3JlYWQqKCkgYW5kIGZiX3dyaXRlKigpCj4gPiB3aXRoIExpbnV4JyByZWd1bGFyIEkvTyBm
dW5jdGlvbnMuIFJlbW92ZSBhbGwgaWZkZWYgY2FzZXMgZm9yIHRoZQo+ID4gdmFyaW91cyBhcmNo
aXRlY3R1cmVzLgo+ID4KPiA+IE1vc3Qgb2YgdGhlIHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzIHVz
ZSBfX3Jhd18oKSBJL08gZnVuY3Rpb25zIG9yIHRyZWF0Cj4gPiBmcmFtZWJ1ZmZlciBtZW1vcnkg
bGlrZSByZWd1bGFyIG1lbW9yeS4gVGhpcyBpcyBhbHNvIGltcGxlbWVudGVkIGJ5IHRoZQo+ID4g
YXJjaGl0ZWN0dXJlcycgSS9PIGZ1bmN0aW9uLCBzbyB3ZSBjYW4gdXNlIHRoZW0gaW5zdGVhZC4K
PiA+Cj4gPiBTcGFyYyB1c2VzIFNCdXMgdG8gY29ubmVjdCB0byBmcmFtZWJ1ZmZlciBkZXZpY2Vz
LiBJdCBwcm92aWRlcyByZXNwZWN0aXZlCj4gPiBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIGZyYW1l
YnVmZmVyIEkvTyBoZWxwZXJzLiBUaGUgaW52b2x2ZWQgc2J1c18oKQo+ID4gSS9PIGhlbHBlcnMg
bWFwIHRvIHRoZSBzYW1lIGNvZGUgYXMgU3BhcmMncyByZWd1bGFyIEkvTyBmdW5jdGlvbnMuIEFz
Cj4gPiB3aXRoIG90aGVyIHBsYXRmb3Jtcywgd2UgY2FuIHVzZSB0aG9zZSBpbnN0ZWFkLgo+ID4K
PiA+IFdlIGxlYXZlIGEgVE9ETyBpdGVtIHRvIHJlcGxhY2UgYWxsIGZiXygpIGZ1bmN0aW9ucyB3
aXRoIHRoZWlyIHJlZ3VsYXIKPiA+IEkvTyBjb3VudGVycGFydHMgdGhyb3VnaG91dCB0aGUgZmJk
ZXYgZHJpdmVycy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KPiA+IC0tLQo+ID4gICBpbmNsdWRlL2xpbnV4L2ZiLmggfCA2MyAr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mYi5oIGIvaW5jbHVkZS9saW51eC9mYi5oCj4gPiBpbmRl
eCAwOGNiNDdkYTcxZjguLjRhYTllOTBlZGQxNyAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvZmIuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9mYi5oCj4gPiBAQCAtMTUsNyArMTUsNiBA
QAo+ID4gICAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgo+ID4gICAjaW5jbHVkZSA8bGludXgvYmFj
a2xpZ2h0Lmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiAtI2luY2x1ZGUgPGFz
bS9pby5oPgo+ID4KPiA+ICAgc3RydWN0IHZtX2FyZWFfc3RydWN0Owo+ID4gICBzdHJ1Y3QgZmJf
aW5mbzsKPiA+IEBAIC01MTEsNTggKzUxMCwyNiBAQCBzdHJ1Y3QgZmJfaW5mbyB7Cj4gPiAgICAq
Lwo+ID4gICAjZGVmaW5lIFNUVVBJRF9BQ0NFTEZfVEVYVF9TSElUCj4gPgo+ID4gLS8vIFRoaXMg
d2lsbCBnbyBhd2F5Cj4gPiAtI2lmIGRlZmluZWQoX19zcGFyY19fKQo+ID4gLQo+ID4gLS8qIFdl
IG1hcCBhbGwgb2Ygb3VyIGZyYW1lYnVmZmVycyBzdWNoIHRoYXQgYmlnLWVuZGlhbiBhY2Nlc3Nl
cwo+ID4gLSAqIGFyZSB3aGF0IHdlIHdhbnQsIHNvIHRoZSBmb2xsb3dpbmcgaXMgc3VmZmljaWVu
dC4KPiA+ICsvKgo+ID4gKyAqIFRPRE86IFVwZGF0ZSBmYmRldiBkcml2ZXJzIHRvIGNhbGwgdGhl
IEkvTyBoZWxwZXJzIGRpcmVjdGx5IGFuZAo+ID4gKyAqICAgICAgIHJlbW92ZSB0aGUgZmJfKCkg
dG9rZW5zLgo+ID4gICAgKi8KPiA+IC0KPiA+IC0vLyBUaGlzIHdpbGwgZ28gYXdheQo+ID4gLSNk
ZWZpbmUgZmJfcmVhZGIgc2J1c19yZWFkYgo+ID4gLSNkZWZpbmUgZmJfcmVhZHcgc2J1c19yZWFk
dwo+ID4gLSNkZWZpbmUgZmJfcmVhZGwgc2J1c19yZWFkbAo+ID4gLSNkZWZpbmUgZmJfcmVhZHEg
c2J1c19yZWFkcQo+ID4gLSNkZWZpbmUgZmJfd3JpdGViIHNidXNfd3JpdGViCj4gPiAtI2RlZmlu
ZSBmYl93cml0ZXcgc2J1c193cml0ZXcKPiA+IC0jZGVmaW5lIGZiX3dyaXRlbCBzYnVzX3dyaXRl
bAo+ID4gLSNkZWZpbmUgZmJfd3JpdGVxIHNidXNfd3JpdGVxCj4gPiAtI2RlZmluZSBmYl9tZW1z
ZXQgc2J1c19tZW1zZXRfaW8KPiA+IC0jZGVmaW5lIGZiX21lbWNweV9mcm9tZmIgc2J1c19tZW1j
cHlfZnJvbWlvCj4gPiAtI2RlZmluZSBmYl9tZW1jcHlfdG9mYiBzYnVzX21lbWNweV90b2lvCj4g
PiAtCj4gPiAtI2VsaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX2FscGhhX18pIHx8
IGRlZmluZWQoX194ODZfNjRfXykgfHwgICAgICBcCj4gPiAtICAgICBkZWZpbmVkKF9faHBwYV9f
KSB8fCBkZWZpbmVkKF9fc2hfXykgfHwgZGVmaW5lZChfX3Bvd2VycGNfXykgfHwgXAo+ID4gLSAg
ICAgZGVmaW5lZChfX2FybV9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKSB8fCBkZWZpbmVkKF9f
bWlwc19fKQo+ID4gLQo+ID4gLSNkZWZpbmUgZmJfcmVhZGIgX19yYXdfcmVhZGIKPiA+IC0jZGVm
aW5lIGZiX3JlYWR3IF9fcmF3X3JlYWR3Cj4gPiAtI2RlZmluZSBmYl9yZWFkbCBfX3Jhd19yZWFk
bAo+ID4gLSNkZWZpbmUgZmJfcmVhZHEgX19yYXdfcmVhZHEKPiA+IC0jZGVmaW5lIGZiX3dyaXRl
YiBfX3Jhd193cml0ZWIKPiA+IC0jZGVmaW5lIGZiX3dyaXRldyBfX3Jhd193cml0ZXcKPiA+IC0j
ZGVmaW5lIGZiX3dyaXRlbCBfX3Jhd193cml0ZWwKPiA+IC0jZGVmaW5lIGZiX3dyaXRlcSBfX3Jh
d193cml0ZXEKPgo+IE5vdGUgdGhhdCBvbiBhdCBsZWFzdCBzb21lIGFyY2hpdGVjdHVyZXMsIHRo
ZSBfX3JhdyB2YXJpYW50cyBhcmUKPiBuYXRpdmUtZW5kaWFuLCB3aGVyZWFzIHRoZSByZWd1bGFy
IGFjY2Vzc29ycyBhcmUgZXhwbGljaXRseQo+IGxpdHRsZS1lbmRpYW4sIHNvIHRoZXJlIGlzIGEg
c2xpZ2h0IHJpc2sgb2YgaW5hZHZlcnRlbnRseSBjaGFuZ2luZwo+IGJlaGF2aW91ciBvbiBiaWct
ZW5kaWFuIHN5c3RlbXMgKE1JUFMgbW9zdCBsaWtlbHksIGJ1dCBhIGZldyBvbGQgQVJNCj4gcGxh
dGZvcm1zIHJ1biBCRSBhcyB3ZWxsKS4KCkFsc28gb24gbTY4aywgd2hlbiBJU0Egb3IgUENJIGFy
ZSBlbmFibGVkLgoKSW4gYWRkaXRpb24sIHRoZSBub24tcmF3IHZhcmlhbnRzIG1heSBkbyBzb21l
IGV4dHJhcyB0byBndWFyYW50ZWUKb3JkZXJpbmcsIHdoaWNoIHlvdSBkbyBub3QgbmVlZCBvbiBh
IGZyYW1lIGJ1ZmZlci4KClNvIEknZCBnbyBmb3IgdGhlIF9fcmF3XyooKSB2YXJpYW50cyBldmVy
eXdoZXJlLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
