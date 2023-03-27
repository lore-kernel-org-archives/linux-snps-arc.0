Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45A1C76195
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPS7S0sI4QZN957WeoqpI8RTEourBeHoiroszdKd1KY=; b=VhzalEAjb0T45o
	9IAraVZJ7yldvbeGohkzKfS1NKcmhTvrRFOT0AdrUz3vQlJ2osnq1xUXq4ybPq+1adXzuiIow0RO1
	KikfwRt0bjRjoU0PiALCXS8D8a7tQkQE+lE/jAg2UdggTrlXwIEFRN/m2UCsKjU4ck+5h96wGDmuM
	E46PXfepvXcq1ZZqpYFyjwgKOdpkxIc/iiYmdJvMVoIdc72Xn7noEgsWWu8GYlmb8KDIBrBR7Ne3c
	pNZhhCjzH3KKzQD+mBcFmGh17pn6QMrsAPmHbaekqTRxr1I4TdUUXvydgSdsTixIRD2oyM4PzUFq9
	XnmXdWjv6msRV5zQRiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgp07-00Baqq-39;
	Mon, 27 Mar 2023 15:43:15 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgp04-00Baou-2p;
	Mon, 27 Mar 2023 15:43:14 +0000
Received: by mail-pg1-x52b.google.com with SMTP id d8so5413328pgm.3;
        Mon, 27 Mar 2023 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679931790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRasUUTOEu/ok1S92mQy2tcMp/4KwW2lXbLEiKBj/7o=;
        b=HZFjetxTrU0/nv8Y55FAOK1Apm3VUH13SuQEA6blI4LQsquf470BO/HxA5cmFNd3aK
         KhVXkKlmZq93fBkC6giJvUDlt7FuVro1W64JdaQrEtphQxoptl43dqOAsJuOdXDllTly
         etHqoII3GsZRYL1O1XM8c2+DB4jJ3oBH+CWict03ya4f003TK7u/v0bAMMATlIwbsHEE
         Eab9bSU2vOsS7u7Hi3cpukhSfrOKg/M8N1PXdsx2k+lYCOOyiPnKWQEclkXPeaKbVR3e
         gND/Ow1eDKT0AYLAkJBh79+oSz/WTGmxOT1B4ufDuEkJHS9CEZchC2NFdFV6xpk2+oqj
         wINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679931790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRasUUTOEu/ok1S92mQy2tcMp/4KwW2lXbLEiKBj/7o=;
        b=0HGUPRnW8cFaxEkX2wSFXiv37Uzz+0rMIMyc8PCv4QdE/w6cioxylNZLPF+lcjuWxn
         y9zPNgD/IIHVLaOklbeC+8tACFUSFVvFi+fEL+T2CSy2i61lr2uUOIYy+QF9QwVjnsjk
         +ygRmyidakcxlwnU6bQ5ufk0a4ZXQakwuv54s+fs4gEUfE91OzzTgLRqvjnKOfeM3Iiz
         FNb3yIUOxr1qXZEL1sWGamgm6NDNyu0mAFuBGOQE7a4VW4X1k0F1oZuK/gqzNd7VIsgb
         ZzXtsb/QrgUEEEVq5yOpQ6Vz3M6s2gzq5VvmIfbp4MbZLVU9ELeKfJTWtoCwTXEyFlI3
         Y1uQ==
X-Gm-Message-State: AAQBX9dDQ3q3vQH+311V30qGjw/XlEO/2N5li4GzRalUVpq1LgeUIPk8
	o4uEvomIeKnMP5e3rvbtIovxgaqMgSaFM+WvxJc=
X-Google-Smtp-Source: AKy350ZLARTDoGqBnXYfSrHDqt1ndSavaTIx5HilksseUiOHQOdKd5qG9m3KbOwJxwDn1K1TODO6L/v92bKQLX9gh5M=
X-Received: by 2002:a63:e20f:0:b0:50a:592b:25ba with SMTP id
 q15-20020a63e20f000000b0050a592b25bamr3326211pgh.3.1679931790647; Mon, 27 Mar
 2023 08:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-3-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-3-arnd@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Mar 2023 08:42:59 -0700
Message-ID: <CAMo8BfJwjcQxWVW9o6brvBYTgUe9v=QGgs39=_V6Oc9-OKv7Sw@mail.gmail.com>
Subject: Re: [PATCH 02/21] xtensa: dma-mapping: use normal cache invalidation rules
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_084312_908920_8D8D2662 
X-CRM114-Status: GOOD (  19.94  )
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

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgNToxNOKAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4geHRlbnNhIGlzIG9uZSBvZiB0aGUgcGxhdGZvcm1zIHRoYXQgaGFzIGJvdGggd3JpdGUtYmFj
ayBhbmQgd3JpdGUtdGhyb3VnaAo+IGNhY2hlcywgYW5kIG5lZWRzIHRvIGFjY291bnQgZm9yIGJv
dGggaW4gaXRzIERNQSBtYXBwaW5nIG9wZXJhdGlvbnMuCj4KPiBJdCBkb2VzIHRoaXMgdGhyb3Vn
aCBhIHNldCBvZiBvcGVyYXRpb25zIHRoYXQgaXMgZGlmZmVyZW50IGZyb20gYW55Cj4gYXJjaGl0
ZWN0dXJlLiBUaGlzIGlzIG5vdCBhIHByb2JsZW0gYnkgaXRzZWxmLCBidXQgaXQgbWFrZXMgaXQg
cmF0aGVyCj4gaGFyZCB0byBmaWd1cmUgb3V0IHdoZXRoZXIgdGhpcyBpcyBjb3JyZWN0IG9yIG5v
dCwgYW5kIHRvIHVuaWZ5IHRoaXMKPiBpbXBsZW1lbnRhdGlvbiB3aXRoIHRoZSBvdGhlcnMuCj4K
PiBDaGFuZ2UgdGhlIHNlbWFudGljcyB0byB0aGUgdXN1YWwgb25lcyBmb3Igbm9uLXNwZWN1bGF0
aW5nIENQVXM6Cj4KPiAgLSBPbiBETUFfVE9fREVWSUNFLCBjYWxsIF9fZmx1c2hfZGNhY2hlX3Jh
bmdlKCkgdG8gcGVyZm9ybSB0aGUKPiAgICB3cml0ZWJhY2sgZXZlbiBvbiB3cml0ZXRocm91Z2gg
Y2FjaGVzLCB3aGVyZSB0aGlzIGlzIGEgbm9wLgo+Cj4gIC0gT24gRE1BX0ZST01fREVWSUNFLCBp
bnZhbGlkYXRlIHRoZSBtYXBwaW5nIGJlZm9yZSB0aGUgRE1BIHJhdGhlcgo+ICAgIHRoYW4gYWZ0
ZXJ3YXJkcy4KPgo+ICAtIE9uIERNQV9CSURJUkVDVElPTkFMLCBjb21iaW5lIHRoZSBwcmUtd3Jp
dGViYWNrIHdpdGggdGhlCj4gICAgcG9zdC1pbnZhbGlkYXRlIGludG8gYSBjYWxsIHRvIF9fZmx1
c2hfaW52YWxpZGF0ZV9kY2FjaGVfcmFuZ2UoKQo+ICAgIHRoYXQgdHVybnMgaW50byBhIHNpbXBs
ZSBpbnZhbGlkYXRlIG9uIHdyaXRlYmFjayBjYWNoZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5k
IEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBhcmNoL3h0ZW5zYS9LY29uZmlnICAg
ICAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gveHRlbnNhL2luY2x1ZGUvYXNtL2NhY2hlZmx1
c2guaCB8ICA2ICsrKy0tLQo+ICBhcmNoL3h0ZW5zYS9rZXJuZWwvcGNpLWRtYS5jICAgICAgICAg
fCAyOSArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBNYXggRmlsaXBwb3Yg
PGpjbXZia2JjQGdtYWlsLmNvbT4KCi0tIApUaGFua3MuCi0tIE1heAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
