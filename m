Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0465C27C7A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Aug 2023 23:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpwB8IjoP/uaLPpLOeNYJ4be5xnJP3RIESYUI7k+XiM=; b=3H+pCI1/sWw57F
	okHifqLmE9C7Ws+jSiy7rJi4ZEgBpI1oiloVuVqY5ldk6EHuvBZcRiCMRncmKxEA0lnJhOTraFK1Y
	0P0VrgR24wFLPTvKAfuGezhxodzzXoU77V3qPTJy9hxrDFv1rRphJl2vgVTKRCGHAjbX6c/BnMeJu
	5fsKbT5QcV5sydfrkN0x2M5NO7LEbVOdp6Vf95SjhKyWxlVQyLfZ06WIn+IZXxDfKAEmLXSFB1FTF
	ZT0TqsWH3pEl0yzQZEjpzHkuT9oaQ2bPvg1gOkkfW8WiRCJHidzrt2K9vXNjciIc/Z8Lle5D+7866
	9vkiSNV4ndMOUpjciKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPW0-0058rR-32;
	Wed, 16 Aug 2023 23:01:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPVw-0058qK-2I;
	Wed, 16 Aug 2023 23:01:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E78D60B4E;
	Wed, 16 Aug 2023 23:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE96C433C8;
	Wed, 16 Aug 2023 23:01:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gc9k8+mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1692226870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJ+exFyMwxf+Sp/aWFmN/k274aR2STKWbu8odcAPWm8=;
	b=gc9k8+mNE3tCbsH90oF9EzW/vFgVR7y8QrFQqWbAkwx60mdBY+E0jIfiI91PeccfihL/gM
	FMX1aYXN8cQZi12ilCcCuGfxoyD69z/0vr/tMG59rHz0ZBubcWsbwNOtndqttWdolGCiWT
	Of1/5rCi2Ck2bOcv0XhM9Tnvc2d7p2w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aa23e6dc (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 16 Aug 2023 23:01:10 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-79414715edeso1459492241.0;
        Wed, 16 Aug 2023 16:01:09 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy24ToQlXaeC0N5lJF+W6kySccbtqhl5hrpvwPXn7Zprr3c2f02
	T0wtV616VcwOHeiFCTCP310jccYT9Pl/MPK+zy4=
X-Google-Smtp-Source: AGHT+IFdKTop/dTzxxplY5bDLsdLZZ0m1tGPXQJd6rkmBy2Wm4exC645Mb9rMUW6TK7Pnh6+pZhH7oflLvX5KYDSdqc=
X-Received: by 2002:a67:e211:0:b0:443:c87f:ebb1 with SMTP id
 g17-20020a67e211000000b00443c87febb1mr2517297vsa.29.1692226866965; Wed, 16
 Aug 2023 16:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230816055010.31534-1-rdunlap@infradead.org>
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 17 Aug 2023 00:58:18 +0200
X-Gmail-Original-Message-ID: <CAHmME9pxC_e6Ftj1MJ4H2skhhKfNubd=7OwcH9xepCxjkDxpkg@mail.gmail.com>
Message-ID: <CAHmME9pxC_e6Ftj1MJ4H2skhhKfNubd=7OwcH9xepCxjkDxpkg@mail.gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	wireguard@lists.zx2c4.com, linux-arch@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org, 
	Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	linux-openrisc@vger.kernel.org, linux-mips@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org, 
	Max Filippov <jcmvbkbc@gmail.com>, Josh Triplett <josh@joshtriplett.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_160120_835634_D42AACF4 
X-CRM114-Status: GOOD (  17.11  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgNzo1MOKAr0FNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IFRoZXJlIGlzIG9ubHkgb25lIEtjb25maWcgdXNlciBv
ZiBDT05GSUdfRU1CRURERUQgYW5kIGl0IGNhbiBiZQo+IHN3aXRjaGVkIHRvIEVYUEVSVCBvciAi
aWYgIUFSQ0hfTVVMVElQTEFURk9STSIgKHN1Z2dlc3RlZCBieSBBcm5kKS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IENjOiBSdXNzZWxs
IEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gQ2M6
IEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25AengyYzQuY29tPgo+IENjOiB3aXJlZ3VhcmRAbGlz
dHMuengyYzQuY29tCj4gQ2M6IGxpbnV4LWFyY2hAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogVmluZWV0IEd1cHRhIDx2Z3VwdGFA
a2VybmVsLm9yZz4KPiBDYzogQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+Cj4gQ2M6IGxp
bnV4LWhleGFnb25Admdlci5rZXJuZWwub3JnCj4gQ2M6IEdyZWcgVW5nZXJlciA8Z2VyZ0BsaW51
eC1tNjhrLm9yZz4KPiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4KPiBDYzogbGludXgtbTY4a0BsaXN0cy5saW51eC1tNjhrLm9yZwo+IENjOiBNaWNoYWwgU2lt
ZWsgPG1vbnN0ckBtb25zdHIuZXU+Cj4gQ2M6IFRob21hcyBCb2dlbmRvZXJmZXIgPHRzYm9nZW5k
QGFscGhhLmZyYW5rZW4uZGU+Cj4gQ2M6IERpbmggTmd1eWVuIDxkaW5ndXllbkBrZXJuZWwub3Jn
Pgo+IENjOiBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUuc2U+Cj4gQ2M6IFN0ZWZhbiBLcmlz
dGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KPiBDYzogU3RhZmZv
cmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gQ2M6IGxpbnV4LW9wZW5yaXNjQHZnZXIua2Vy
bmVsLm9yZwo+IENjOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+IENjOiBNaWNoYWVsIEVs
bGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dp
bkBnbWFpbC5jb20+Cj4gQ2M6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nn
cm91cC5ldT4KPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPiBDYzogbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1z
bGV5QHNpZml2ZS5jb20+Cj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
Cj4gQ2M6IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1Pgo+IENjOiBZb3NoaW5vcmkg
U2F0byA8eXNhdG9AdXNlcnMuc291cmNlZm9yZ2UuanA+Cj4gQ2M6IFJpY2ggRmVsa2VyIDxkYWxp
YXNAbGliYy5vcmc+Cj4gQ2M6IEpvaG4gUGF1bCBBZHJpYW4gR2xhdWJpdHogPGdsYXViaXR6QHBo
eXNpay5mdS1iZXJsaW4uZGU+Cj4gQ2M6IGxpbnV4LXNoQHZnZXIua2VybmVsLm9yZwo+IENjOiBN
YXggRmlsaXBwb3YgPGpjbXZia2JjQGdtYWlsLmNvbT4KPiBDYzogSm9zaCBUcmlwbGV0dCA8am9z
aEBqb3NodHJpcGxldHQub3JnPgo+IENjOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJu
ZWwub3JnPgo+IENjOiBsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnCj4gQ2M6IEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gLS0tCj4gZGlmZiAtLSBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3dpcmVndWFyZC9xZW11L2tlcm5lbC5jb25maWcgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy93aXJlZ3VhcmQvcWVtdS9rZXJuZWwuY29uZmlnCj4gLS0tIGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvd2lyZWd1YXJkL3FlbXUva2VybmVsLmNvbmZpZwo+ICsrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3dpcmVndWFyZC9xZW11L2tlcm5lbC5jb25maWcKPiBA
QCAtNDEsNyArNDEsNiBAQCBDT05GSUdfS0FMTFNZTVM9eQo+ICBDT05GSUdfQlVHPXkKPiAgQ09O
RklHX0NDX09QVElNSVpFX0ZPUl9QRVJGT1JNQU5DRT15Cj4gIENPTkZJR19KVU1QX0xBQkVMPXkK
PiAtQ09ORklHX0VNQkVEREVEPW4KPiAgQ09ORklHX0JBU0VfRlVMTD15Cj4gIENPTkZJR19GVVRF
WD15Cj4gIENPTkZJR19TSE1FTT15CgpBY2tlZC1ieTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNv
bkB6eDJjNC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
