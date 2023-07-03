Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D1DEB64DC
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Jul 2023 07:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzpBemN0SlFBFnBv1+bn4YU0X6q8lkeez5SFqmKRkFM=; b=G2ZyDTdpLczqAW
	0Do6cNzVKAFBSWxHxe6lMmybpJP28g0kOhn3AHLI/osH3GIoXiPwx8Y3kONEpP52396z961bKtndk
	Dy1ewLHZaA5OIMQmIt+TliC6MDFglLZQk4WA/GiO5f/4qjwU/CLeJAmYku9GwuvovLTRs4Kiw1GV/
	Ppc9rwBRb4V7NSifaNVhWV4VGpFoCjWyYYm0HZdsV0yOr8Y7LVLFkeI+W5wAAoenjfnsMsdXNsVbP
	KXQwiE+A1FDDaiVNW5o16xcahc0O2bQkNemEO3X8sncPnCB/r5kCUoFkG16G/QGeRXHxrM9RedG5O
	EQTvEFuPx8TXxg1I+ZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEP7-009eae-1s;
	Mon, 03 Jul 2023 07:55:25 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEP4-009eZU-26;
	Mon, 03 Jul 2023 07:55:24 +0000
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7659dc74da1so383035485a.3;
        Mon, 03 Jul 2023 00:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688370919; x=1690962919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap+98X7lUU4Mb/R2w4KrLGdPkASGfI2gOWe+xareG/w=;
        b=T3WMmRS8E9u8+o/xThzeRAgtd16eLil5hZV8yVkUeB7/q1j46wjEGUDMvtA5dc6kHa
         IR8Zu8RmmWQJIu/8AJkckqxP5371taCNWX/Vo32h8QUa78B8AJrM9a6qUV6iNEiCHrv2
         7xRgixEeBrCF7EGLT309Ls4xFHyakoycjJ7sdNqt2edEMQuCeHDgvgRGFg7OO2fddQpp
         Yk/EbdAr/QXXKcWonXfoefZjLxHzlj6jdBe4ecVH7+1N7lr5exh86ZQzad5jufpnuB73
         9GV/g37pq4ZF6xXkl3pMkSLlahjEhY2EBx6nKuqtHN8dNSLHURHQMtqw/WAK/Cui4L14
         fS7A==
X-Gm-Message-State: AC+VfDyIKy1NlNuTXOSr8/525Q3i13UtUV4DKGW5nH/I2BgfMJodtI1P
	1wy4gsmg1uAKvKNliUbtAf4EIMeKU1dW6A==
X-Google-Smtp-Source: ACHHUZ6fKqo7jMxrfXsiYC2nNL8UeW5DJE0yiFvMNXAIXqKtnWqQ8+t0Id/BPvWp+ATA//SPboa7AQ==
X-Received: by 2002:a05:620a:2b10:b0:75d:50bb:b173 with SMTP id do16-20020a05620a2b1000b0075d50bbb173mr10231703qkb.16.1688370919082;
        Mon, 03 Jul 2023 00:55:19 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 18-20020a05620a079200b00763b94432ebsm4918526qka.18.2023.07.03.00.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 00:55:18 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-76571dae5feso383456685a.1;
        Mon, 03 Jul 2023 00:55:18 -0700 (PDT)
X-Received: by 2002:a25:a287:0:b0:c1a:2928:74ab with SMTP id
 c7-20020a25a287000000b00c1a292874abmr8554017ybi.31.1688370898299; Mon, 03 Jul
 2023 00:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-21-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-21-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Jul 2023 09:54:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5bXeE=nr7+hHxL+xhm2q05udkJpMBM-BG7g9S7Nt7Zg@mail.gmail.com>
Message-ID: <CAMuHMdW5bXeE=nr7+hHxL+xhm2q05udkJpMBM-BG7g9S7Nt7Zg@mail.gmail.com>
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean() helper
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_005522_696493_0F657734 
X-CRM114-Status: GOOD (  34.04  )
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

SGkgQXJuZCwKCk9uIE1vbiwgTWFyIDI3LCAyMDIzIGF0IDI6MTbigK9QTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4KPiBUaGUgYXJtIHZlcnNpb24gb2YgdGhlIGFyY2hfc3luY19kbWFfZm9yX2NwdSgp
IGZ1bmN0aW9uIGFubm90YXRlcyBwYWdlcyBhcwo+IFBHX2RjYWNoZV9jbGVhbiBhZnRlciBhIERN
QSwgYnV0IG5vIG90aGVyIGFyY2hpdGVjdHVyZSBkb2VzIHRoaXMgaGVyZS4gT24KPiBpYTY0LCB0
aGUgc2FtZSB0aGluZyBpcyBkb25lIGluIGFyY2hfc3luY19kbWFfZm9yX2NwdSgpLCBzbyBpdCBt
YWtlcyBzZW5zZQo+IHRvIHVzZSB0aGUgc2FtZSBob29rIGluIG9yZGVyIHRvIGhhdmUgaWRlbnRp
Y2FsIGFyY2hfc3luY19kbWFfZm9yX2NwdSgpCj4gc2VtYW50aWNzIGFzIGFsbCBvdGhlciBhcmNo
aXRlY3R1cmVzLgo+Cj4gU3BsaXR0aW5nIHRoaXMgb3V0IGhhcyBtdWx0aXBsZSBlZmZlY3RzOgo+
Cj4gIC0gZm9yIGRtYS1kaXJlY3QsIHRoaXMgbm93IGdldHMgY2FsbGVkIGFmdGVyIGFyY2hfc3lu
Y19kbWFfZm9yX2NwdSgpCj4gICAgZm9yIERNQV9GUk9NX0RFVklDRSBtYXBwaW5ncywgYnV0IG5v
dCBmb3IgRE1BX0JJRElSRUNUSU9OQUwuIFdoaWxlCj4gICAgaXQgd291bGQgbm90IGJlIGhhcm1m
dWwgdG8ga2VlcCBkb2luZyBpdCBmb3IgYmlkaXJlY3Rpb25hbCBtYXBwaW5ncywKPiAgICB0aG9z
ZSBhcmUgYXBwYXJlbnRseSBub3QgdXNlZCBpbiBhbnkgY2FsbGVycyB0aGF0IGNhcmUgYWJvdXQg
dGhlIGZsYWcuCj4KPiAgLSBTaW5jZSBhcm0gaGFzIGl0cyBvd24gZG1hLWlvbW11IGFic3RyYWN0
aW9uLCB0aGlzIG5vdyBhbHNvIG5lZWRzIHRvCj4gICAgY2FsbCB0aGUgc2FtZSBmdW5jdGlvbiwg
c28gdGhlIGNhbGxzIGFyZSBhZGRlZCB0aGVyZSB0byBtaXJyb3IgdGhlCj4gICAgZG1hLWRpcmVj
dCB2ZXJzaW9uLgo+Cj4gIC0gTGlrZSBkbWEtZGlyZWN0LCB0aGUgZG1hLWlvbW11IHZlcnNpb24g
bm93IG1hcmtzIHRoZSBkY2FjaGUgY2xlYW4KPiAgICBmb3IgYm90aCBjb2hlcmVudCBhbmQgbm9u
Y29oZXJlbnQgZGV2aWNlcyBhZnRlciBhIERNQSwgYnV0IGl0IG9ubHkKPiAgICBkb2VzIHRoaXMg
Zm9yIERNQV9GUk9NX0RFVklDRSwgbm90IERNQV9CSURJUkVDVElPTkFMLgo+Cj4gWyBIRUxQIE5F
RURFRDogY2FuIGFueW9uZSBjb25maXJtIHRoYXQgaXQgaXMgYSBjb3JyZWN0IGFzc3VtcHRpb24K
PiAgIG9uIGFybSB0aGF0IGEgY2FjaGUtY29oZXJlbnQgZGV2aWNlIHdyaXRpbmcgdG8gYSBwYWdl
IGFsd2F5cyByZXN1bHRzCj4gICBpbiBpdCBiZWluZyBpbiBhIFBHX2RjYWNoZV9jbGVhbiBzdGF0
ZSBsaWtlIG9uIGlhNjQsIG9yIGNhbiBhIGRldmljZQo+ICAgd3JpdGUgZGlyZWN0bHkgaW50byB0
aGUgZGNhY2hlP10KPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgMzIyZGJlODk4
ZjgyZmQ4YQooIkFSTTogZG1hLW1hcHBpbmc6IHNwbGl0IG91dCBhcmNoX2RtYV9tYXJrX2NsZWFu
KCkgaGVscGVyIikgaW4KZXNtaWwvamg3MTAwLWRtYXBvb2wuCgpJZiBDT05GSUdfQVJNX0RNQV9V
U0VfSU9NTVU9eSwgdGhlIGJ1aWxkIGZhaWxzLgoKPiAtLS0gYS9hcmNoL2FybS9tbS9kbWEtbWFw
cGluZy5jCj4gKysrIGIvYXJjaC9hcm0vbW0vZG1hLW1hcHBpbmcuYwoKPiBAQCAtMTI5NCw2ICsx
Mjk4LDE3IEBAIHN0YXRpYyBpbnQgYXJtX2lvbW11X21hcF9zZyhzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBzY2F0dGVybGlzdCAqc2csCj4gICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgfQo+
Cj4gK3N0YXRpYyB2b2lkIGFybV9pb21tdV9zeW5jX2RtYV9mb3JfY3B1KHBoeXNfYWRkcl90IHBo
eXMsIHNpemVfdCBsZW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJvb2wgZG1hX2NvaGVyZW50KQo+ICt7Cj4gKyAgICAgICBpZiAoIWRtYV9j
b2hlcmVudCkKPiArICAgICAgICAgICAgICAgYXJjaF9zeW5jX2RtYV9mb3JfY3B1KHBoeXMsIHMt
Pmxlbmd0aCwgZGlyKTsKCnMvcy0+bGVuZ3RoL2xlbi8KCj4gKwo+ICsgICAgICAgaWYgKGRpciA9
PSBETUFfRlJPTV9ERVZJQ0UpCj4gKyAgICAgICAgICAgICAgIGFyY2hfZG1hX21hcmtfY2xlYW4o
cGh5cywgcy0+bGVuZ3RoKTsKCkxpa2V3aXNlLgoKPiArfQo+ICsKPiAgLyoqCj4gICAqIGFybV9p
b21tdV91bm1hcF9zZyAtIHVubWFwIGEgc2V0IG9mIFNHIGJ1ZmZlcnMgbWFwcGVkIGJ5IGRtYV9t
YXBfc2cKPiAgICogQGRldjogdmFsaWQgc3RydWN0IGRldmljZSBwb2ludGVyCgo+IEBAIC0xNDI1
LDkgKzE0MzgsOSBAQCBzdGF0aWMgdm9pZCBhcm1faW9tbXVfdW5tYXBfcGFnZShzdHJ1Y3QgZGV2
aWNlICpkZXYsIGRtYV9hZGRyX3QgaGFuZGxlLAo+ICAgICAgICAgaWYgKCFpb3ZhKQo+ICAgICAg
ICAgICAgICAgICByZXR1cm47Cj4KPiAtICAgICAgIGlmICghZGV2LT5kbWFfY29oZXJlbnQgJiYg
IShhdHRycyAmIERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMpKSB7Cj4gKyAgICAgICBpZiAoIShhdHRy
cyAmIERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMpKQoKTWlzc2luZyBvcGVuaW5nIGN1cmx5IGJyYWNl
LgoKPiAgICAgICAgICAgICAgICAgcGh5cyA9IGlvbW11X2lvdmFfdG9fcGh5cyhtYXBwaW5nLT5k
b21haW4sIGhhbmRsZSk7Cj4gLSAgICAgICAgICAgICAgIGFyY2hfc3luY19kbWFfZm9yX2NwdShw
aHlzLCBzaXplLCBkaXIpOwo+ICsgICAgICAgICAgICAgICBhcm1faW9tbXVfc3luY19kbWFfZm9y
X2NwdShwaHlzLCBzaXplLCBkaXIsIGRldi0+ZG1hX2NvaGVyZW50KTsKPiAgICAgICAgIH0KPgo+
ICAgICAgICAgaW9tbXVfdW5tYXAobWFwcGluZy0+ZG9tYWluLCBpb3ZhLCBsZW4pOwoKV2l0aCB0
aGUgYWJvdmUgZml4ZWQsIGl0IGJ1aWxkcyBhbmQgYm9vdHMgZmluZSAob24gUi1DYXIgTTItVyku
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
