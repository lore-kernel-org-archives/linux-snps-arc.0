Return-Path: <SRS0=PWXp=YO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D3BCA9EAF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Oct 2019 14:17:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C66920882
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Oct 2019 14:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LQakrd3n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLAJ14s9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C66920882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeQTjhazwZ/YbBbuvFxnCi37/XgDbY70CbgawbqWgtI=; b=LQakrd3n+KlOuQ
	mEvcJrbLpYZC961KL1lNeUdgIDhBzULi3JHMextZTSw51EnTAuyDJ+I8Gq1XGh++tZy/tFylBAtjI
	ULAMKQoO0hZUZpmQunSh5Zc35TcRFzZYNt2mZ87N3ewfsm+vaB3YC13l4BpKlNFZr206CdltRQZFi
	m6r1o3b7MFWvkuP+4BFX8qwj52gTvhDZmuN9qqfnejies0FmJ9Q/T0XHxDe6F7eX6LQkkIfF17QG1
	w+kzUZ2SSm1yS6E8zvoYU8+Z8sjXx/p8j4Tj3kqhoEx2rThyTR6a8kZUwQkDGizeo9WY1x4uDnjSh
	5zF1Sx53wl37delpmi4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMYVN-0001sW-Nq; Mon, 21 Oct 2019 14:17:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYVE-0001hc-8y
 for linux-snps-arc@lists.infradead.org; Mon, 21 Oct 2019 14:17:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id o28so14202326wro.7
 for <linux-snps-arc@lists.infradead.org>; Mon, 21 Oct 2019 07:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/WDnw20hof//f108sNDoL9I+yqZkabrTq50r3yQY+F0=;
 b=KLAJ14s95s88cfdnvfzEhPDx+9y5y7BXCERNYqrUCirDIG8cK//syX5WafrxKwBIl6
 UzUk/FbGc8qGNi38WvElvMf/9yvqotbOv5yAJKDQylbV5YyKHTLs4UBv+SkUunv7iNzh
 cNKyPIeCBaii3LSjApY6m0ivRNHwn0ptiAP1IAj6gXljol7LCqo7YSp1Al4c8TrT1XLq
 l+ajZnRTJ7+PuDZTbBvIahSjf507dBB6H4g8jHlC/aI5tv+MmzHt2Khz7QXpdp0jPjNO
 /niof0v5ywrTO54OfQVGzIGUk2Y0q1IBLSSaQcCCA/L3ZlhcWrW9QeP9wVyVUqycZYq1
 2FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/WDnw20hof//f108sNDoL9I+yqZkabrTq50r3yQY+F0=;
 b=cpCK5F2Ao39+2joHXHUrhX4PDdugS/HfMuAaGBYXMzRvCmLUaZRFMx3AZIOjOcKwcx
 2WtkhtG2v4hr9OCoGNu9XUXtsh1aAOYr82L8cm2hIAMSpq/LShyZjGq2ulK5SCELq+fU
 YZPTPkG8B6hykfoyCk2QUw0TL3HzLxJ8rvc72f6nW8PuZBYg6scFAmsREJ5bLhvYn3tR
 rlah0FWm+tQp2lSx8lCwiVHUQkWz6koQ6In0RZ2QmFbJNobKPlAqmPKJAzIvwwEIP3bU
 YQexC15AbF8QGycD+FN4x7gtFcgRXgheoVtyZ+KNwQRt1ybYaFsUIh6kRYqON08I3DfP
 w6bQ==
X-Gm-Message-State: APjAAAXDBdMoDkK7H/hl2bFdV1hdLeA5SE4I462c1cyf1t2hr56ppYUB
 NkUC1/sCoehW3BIMHPXKtB3D8w==
X-Google-Smtp-Source: APXvYqwREJVP2GbyCg/6FXksJwBQ7zGgd1HfpYrdxGm2nXuyGb9IrjXUFxsO9HicW8AQCtYZQhoggQ==
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr20897350wro.378.1571667461332; 
 Mon, 21 Oct 2019 07:17:41 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:516c:4b89:6e4b:aa56?
 ([2a01:e34:ed2f:f020:516c:4b89:6e4b:aa56])
 by smtp.googlemail.com with ESMTPSA id m18sm17882307wrg.97.2019.10.21.07.17.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 07:17:40 -0700 (PDT)
Subject: Re: [PATCH 0/7] add support for clocksource/clockevent DT selection
To: Claudiu.Beznea@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, nsekhar@ti.com, bgolaszewski@baylibre.com,
 monstr@monstr.eu, john@phrozen.org, ralf@linux-mips.org,
 paul.burton@mips.com, jhogan@kernel.org, lftan@altera.com,
 tglx@linutronix.de, vgupta@synopsys.com, marc.zyngier@arm.com,
 patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 linus.walleij@linaro.org, shc_work@mail.ru, kgene@kernel.org,
 krzk@kernel.org, ysato@users.sourceforge.jp, liviu.dudau@arm.com,
 sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, baohua@kernel.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com,
 baruch@tkos.co.il, u.kleine-koenig@pengutronix.de, guoren@kernel.org,
 kaloz@openwrt.org, khalasa@piap.pl, ssantosh@kernel.org, vz@mleia.com,
 slemieux.tyco@gmail.com, khilman@baylibre.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, afaerber@suse.de,
 manivannan.sadhasivam@linaro.org, narmstrong@baylibre.com,
 agross@kernel.org, palmer@sifive.com, aou@eecs.berkeley.edu,
 heiko@sntech.de, orsonzhai@gmail.com, baolin.wang@linaro.org,
 zhang.lyra@gmail.com, maxime.ripard@bootlin.com, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, linux@prisktech.co.nz,
 john.stultz@linaro.org, sboyd@kernel.org, matthias.bgg@gmail.com
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
 <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
 <187d7020-fbe9-7984-2358-8a70faef019f@microchip.com>
 <14df6e5d-19ef-4ebc-fd11-9953bc3fc44e@linaro.org>
 <7071b6fa-f7ed-c879-4a43-44100dbe6121@microchip.com>
 <8e9f709f-2ded-c666-26e0-9235d6107c34@linaro.org>
 <215a1cd3-b1a8-5171-d70c-8d8081038e7f@microchip.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <99688909-929a-a1c2-5dfe-be98b50b6328@linaro.org>
Date: Mon, 21 Oct 2019 16:17:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <215a1cd3-b1a8-5171-d70c-8d8081038e7f@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_071744_367411_8C8ED3CD 
X-CRM114-Status: GOOD (  19.17  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: uclinux-h8-devel@lists.sourceforge.jp, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-oxnas@groups.io,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-tegra@vger.kernel.org, nios2-dev@lists.rocketboards.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMjEvMTAvMjAxOSAxMDo1OCwgQ2xhdWRpdS5CZXpuZWFAbWljcm9jaGlwLmNvbSB3cm90ZToK
PiBIaSBEYW5pZWwsCj4gCj4gT24gMTguMTAuMjAxOSAyMzoyNCwgRGFuaWVsIExlemNhbm8gd3Jv
dGU6Cj4+IEhpIENsYXVkaXUsCj4+Cj4+IE9uIDE1LzEwLzIwMTkgMTE6MjMsIENsYXVkaXUuQmV6
bmVhQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+Cj4+IFsgLi4uIF0KPj4KPj4+IFRoZSB0aW1lciBj
bG9jayBzb3VyY2UgY291bGQgYmUgZGl2aWRlZCBieSBNUi5QUkVTICsgMS4KPj4+Cj4+PiBTbywg
SSB1c2VkIHRoZSBjbG9jay1mcmVxdWVuY3kgRFQgYmluZGluZyB0byBsZXQgdXNlciBjaG9vc2Ug
dGhlIHRpbWVyJ3MKPj4+IGZyZXF1ZW5jeS4gQmFzZWQgb24gdGhlIHZhbHVlIHByb3ZpZGVkIHZp
YSB0aGlzIERUIGJpbmRpbmcgdGhlIGJlc3QgY2xvY2sKPj4+IHNvdXJjZSBhbmQgcHJlc2NhbGVy
IGlzIGNob3NlbiB2aWEgbWNocF9waXQ2NGJfcHJlc19wcmVwYXJlKCkgZnVuY3Rpb24uCj4+Cj4+
IEknbSB3aWxsaW5nIHRvIHRha2UgdGhlIGRyaXZlciBidXQgSSBkb3VidCB0aGUgcHVycG9zZSBv
ZiB0aGUKPj4gY2xvY2stZnJlcXVlbmN5IGlzIHRvIGxldCB0aGUgdXNlciBjaG9vc2UgdGhlIGZy
ZXF1ZW5jeS4KPj4KPiAKPiBJIGZvdW5kIHRoaXMgYXBwcm9hY2ggaW4gdGhlIGZvbGxvd2luZyBh
bHJlYWR5IGludGVncmF0ZWQgZHJpdmVyczoKPiBkcml2ZXJzL2Nsb2Nrc291cmNlL2FybXY3bV9z
eXN0aWNrLmMKPiBkcml2ZXJzL2Nsb2Nrc291cmNlL2JjbTI4MzVfdGltZXIuYwo+IGRyaXZlcnMv
Y2xvY2tzb3VyY2UvYmNtX2tvbmFfdGltZXIuYwo+IGRyaXZlcnMvY2xvY2tzb3VyY2UvbWlwcy1n
aWMtdGltZXIuYwo+IGRyaXZlcnMvY2xvY2tzb3VyY2UvbXBzMi10aW1lci5jCj4gZHJpdmVycy9j
bG9ja3NvdXJjZS90aW1lci1xY29tLmMKPiBkcml2ZXJzL2Nsb2Nrc291cmNlL2FybV9hcmNoX3Rp
bWVyLmMKPiAKPiBMb29raW5nIHRocm91Z2ggdGhlIGRvY3VtZW50YXRpb24gb2YgdGhlc2UsIG1v
c3Qgb2YgdGhlbSBkb2N1bWVudCB0aGlzIERUCj4gcHJvcGVydHkgYXMgdGhlIGZyZXF1ZW5jeSBv
ZiB0aGUgY2xvY2sgdGhhdCBkcml2ZXJzIHRoZSB0aW1lciwgYnV0IG5vbmUgb2YKPiB0aGVtIHNl
ZW1zIHRvIGhhdmUgc29tZSBJUCBpbnRlcm5hbCBkaXZpZGVycyBzbyB0aGF0IHRoZSB0aW1lciB0
byB0aWNrIGF0Cj4gZGlmZmVyZW50IGZyZXF1ZW5jeSB0aGFuIHRoZSBjbG9jayB0aGF0IGZlZWRz
IHRoZSBJUC4gRnJvbSB0aGUKPiBkb2N1bWVudGF0aW9uIG9mIHRoZSBhYm92ZSBkcml2ZXJzOwo+
IGRyaXZlcnMvY2xvY2tzb3VyY2UvYXJtdjdtX3N5c3RpY2suYwo+IAktIGNsb2NrLWZyZXF1ZW5j
eSA6IFRoZSByYXRlIGluIEhaIGluIGlucHV0IG9mIHRoZSBBUk0gU3lzVGljawo+IAo+IGRyaXZl
cnMvY2xvY2tzb3VyY2UvYmNtMjgzNV90aW1lci5jCj4gCS0gY2xvY2stZnJlcXVlbmN5IDogVGhl
IGZyZXF1ZW5jeSBvZiB0aGUgY2xvY2sgdGhhdCBkcml2ZXMgdGhlIGNvdW50ZXIsIGluCj4gSHou
Cj4gZHJpdmVycy9jbG9ja3NvdXJjZS9iY21fa29uYV90aW1lci5jCj4gCS0gY2xvY2stZnJlcXVl
bmN5OiBmcmVxdWVuY3kgdGhhdCB0aGUgY2xvY2sgb3BlcmF0ZXMKPiAKPiBkcml2ZXJzL2Nsb2Nr
c291cmNlL21pcHMtZ2ljLXRpbWVyLmMKPiAJY2xvY2stZnJlcXVlbmN5IDogQ2xvY2sgZnJlcXVl
bmN5IGF0IHdoaWNoIHRoZSBHSUMgdGltZXJzIG9wZXJhdGUuCj4gZHJpdmVycy9jbG9ja3NvdXJj
ZS9tcHMyLXRpbWVyLmMKPiAJLSBjbG9jay1mcmVxdWVuY3kgOiBUaGUgcmF0ZSBpbiBIWiBpbiBp
bnB1dCBvZiB0aGUgQVJNIE1QUzIgdGltZXIKPiAKPiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVy
LXFjb20uYwo+IAktIGNsb2NrLWZyZXF1ZW5jeSA6IFRoZSBmcmVxdWVuY3kgb2YgdGhlIGRlYnVn
IHRpbWVyIGFuZCB0aGUgZ2VuZXJhbAo+IHB1cnBvc2UKPiAgICAgICAgICAgICAgICAgICAgIHRp
bWVyKHMpIGluIEh6IGluIHRoYXQgb3JkZXIuCj4gCj4gCj4gVGhpcyBpcyB3aHkgSSBhbHNvIGNo
b3NlIHRoaXMgRFQgYmluZGluZ3MuCj4gCj4gSWYgeW91IHdhbnQgSSBjYW4gc3RpY2sgdG8gYSBm
aXhlZCBmcmVxdWVuY3kgaGFyZCBjb2RlZCBpbiB0aGUgZHJpdmVyLgo+IFBsZWFzZSBsZXQgbWUg
a25vdyBpZiB0aGlzIHdvdWxkIGJlIE9LIGZvciB5b3UuCgpZZXMsIHRoZSBjbG9jay1mcmVxdWVu
Y3kgaXMgdXNlZCB0byBzcGVjaWZ5IHRoZSBmcmVxdWVuY3kgd2hlbiB0aGUKaW5mb3JtYXRpb24g
Y2FuIG5vdCBiZSByZXRyaWV2ZWQgZnJvbSB0aGUgY2xvY2suIFRoZSBnb2FsIGlzIG5vdCB0bwpz
cGVjaWZ5IGEgZnJlcXVlbmN5IGFuZCBjb21wdXRlIGZyb20gdGhlcmUgYSBwcmVzY2FsYXIgdmFs
dWUuCgpIYXJkY29kaW5nIHRoZSBmcmVxdWVuY3kgaXMgZmluZSBvciBoYXJkY29kZSB0aGUgZGl2
aWRlciBhbmQgY29tcHV0ZSB0aGUKZnJlcXVlbmN5IGZyb20gdGhlIGNsb2NrIHJhdGUuCgoKCi0t
IAogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29r
LmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5h
cm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxv
ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
