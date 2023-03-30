Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB83DC6FD1D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Mar 2023 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5nRAka+EWildk4d9lEOxKTY/IENhsFM2AW91TZ/ZpM=; b=zXoEmv5+pvyva8
	CVUW5JGYdQaCBD/VPgoB/3+MdIXnoBJrpdrw5EuLI/RuCgmLZWByG9un1KDiHcBYg2WeixOqFuHR2
	pY6EA+hN++q0Wmxgyds9ujfcirtEivpdJOez5u1t1kBDKKJ3P2vlFD4pv2hspw35E1xxljNncrcaP
	Ll251BZLvoqow3UMIc80TAGEDwY3TMIx8a1C5BZaBp0gOG14YEQb+kxsA9c3r7w71irx3ecyT1XWW
	S/MSIgrPApgkHnnwqvn6l0REiZSp9cyMBFA+si53TIfKO5sP5WXPYOVNgB2C+u8b4ljpj/tgGmxf1
	ruElQ9k27WNQ9AcGzJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phsIj-003sl9-2q;
	Thu, 30 Mar 2023 13:26:49 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phsIh-003sjx-1R;
	Thu, 30 Mar 2023 13:26:48 +0000
Received: by mail-il1-x134.google.com with SMTP id q5so4406646ilg.12;
        Thu, 30 Mar 2023 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680182805; x=1682774805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2pZnebNGLahNe2yjgjrKsFqnYvTRYd7uF1JoUeedu4=;
        b=ipMmc4f2rhe9ZxmiesNtaMCdByaDBx7tN+zc7KMJSrXwy2WiELheDph1YzfOyUJK5G
         2D9w1lws05LiLD96ktr9W079igf4FZMXTfy1rli6Syf8wtA/xOvdvesIM/xHoHpQ4mp2
         kGaQPBqZIeQg75WZRmLC1J0vvz0N+J/wHgPfeNx6CWqljr2xVRlnhMmqStDFXeH9OteD
         UdDKlBrcDx+IHVgGRnNql6fNqhC8UJ/0zLJcMACiQdKHQjGURJds5lWBs1vyz5ebkPWw
         0o6fGsGo2wE6PVztfykuJW8aKjmi0krcntJGszy/82gq0ndxxs4fJ8aJQW98nZewfAkA
         hgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680182805; x=1682774805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2pZnebNGLahNe2yjgjrKsFqnYvTRYd7uF1JoUeedu4=;
        b=ynROi4VrkCgfavFO4uaFU9c91FlAk0159VXWeWHTWjjB5b22T/ZAIAJxAGscYhFgoE
         ptZgzvPlnAsWUeGJnbsNINxngnoFE5gN1V/SdESJSs2wWW4bSCysCwtuTpAwYaoxpg02
         OoJCx/xjUWbatW5RPKxW3SVCINoAd+TrBosnEJWJ5egj/jjLN5s4tohh1hkeJo5Njcni
         Lnqkz0cC6HtJcYH18BVbi1gceBa2MnqxcKI9UN1EvzEMxU8w54DXO4HfrFt2Pb05y4zN
         rVYPH9wI+BEvNHn1ozKCuBoaClRRVXvre3FBxoHY5MHUJi1DFSU+/DKDCbXNUb0tmtjf
         4prg==
X-Gm-Message-State: AAQBX9cTBFhjExS41nMCBFD1fpz7ktqmEaQJ7yWO7awpll/KjIf2GSnd
	r59ZNoD3f/WZmWQe/vWGgcLzFblkdhMLcd+d+h0=
X-Google-Smtp-Source: AKy350b7GKjd6GbmSD4bjqzZzqd/x8SBG7vY+M0wf9Tl0Xt+rzmxZqELne3/hmMfJjmFaGc7B3VEjdENhXkZ8+X22Co=
X-Received: by 2002:a05:6e02:1047:b0:325:dd36:7451 with SMTP id
 p7-20020a056e02104700b00325dd367451mr11322497ilj.1.1680182805604; Thu, 30 Mar
 2023 06:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-10-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-10-arnd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Mar 2023 14:26:18 +0100
Message-ID: <CA+V-a8twDb_P3TOpOqhz3Umump_NZg2Bw-8tgMCAmAdadUxfkw@mail.gmail.com>
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before
 bidirectional DMA
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
	"David S. Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>, 
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
X-CRM114-CacheID: sfid-20230330_062647_482860_A023B148 
X-CRM114-Status: GOOD (  19.16  )
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

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgMToxNuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4gRm9yIGEgRE1BX0JJRElSRUNUSU9OQUwgdHJhbnNmZXIsIHRoZSBjYWNoZXMgaGF2ZSB0byBi
ZSBjbGVhbmVkCj4gZmlyc3QgdG8gbGV0IHRoZSBkZXZpY2Ugc2VlIGRhdGEgd3JpdHRlbiBieSB0
aGUgQ1BVLCBhbmQgaW52YWxpZGF0ZWQKPiBhZnRlciB0aGUgdHJhbnNmZXIgdG8gbGV0IHRoZSBD
UFUgc2VlIGRhdGEgd3JpdHRlbiBieSB0aGUgZGV2aWNlLgo+Cj4gcmlzY3YgYWxzbyBpbnZhbGlk
YXRlcyB0aGUgY2FjaGVzIGJlZm9yZSB0aGUgdHJhbnNmZXIsIHdoaWNoIGRvZXMKPiBub3QgYXBw
ZWFyIHRvIHNlcnZlIGFueSBwdXJwb3NlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBi
cC5yZW5lc2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L21tL2RtYS1ub25jb2hlcmVudC5jIGIvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQu
Ywo+IGluZGV4IDY0MGY0YzQ5NmQyNi4uNjljODBiMjE1NWExIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2RtYS1ub25j
b2hlcmVudC5jCj4gQEAgLTI1LDcgKzI1LDcgQEAgdm9pZCBhcmNoX3N5bmNfZG1hX2Zvcl9kZXZp
Y2UocGh5c19hZGRyX3QgcGFkZHIsIHNpemVfdCBzaXplLAo+ICAgICAgICAgICAgICAgICBBTFRf
Q01PX09QKGNsZWFuLCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPiAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIERNQV9CSURJUkVDVElPTkFMOgo+IC0g
ICAgICAgICAgICAgICBBTFRfQ01PX09QKGZsdXNoLCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9i
bG9ja19zaXplKTsKPiArICAgICAgICAgICAgICAgQUxUX0NNT19PUChjbGVhbiwgdmFkZHIsIHNp
emUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAg
ICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gLS0KPiAyLjM5LjIKPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25w
cy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
