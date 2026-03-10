Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65842F3C27D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2026 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHLs3LjKnIRiymtK9irKR2Y2UmfzLGjZ8BfWq4gYm8s=; b=WAj3sQr7CWdiux
	EhuDNWXIC3mxbqwsuXUq2vFZodjgo8IUC/IB6B77o/gVdosoPbLSUSKS128pOV3KEXAm7tyk++n3Q
	Z6NpW7OtUrRG3ALUy4TwoC2oXM0dTNDdcTzcH55Af+aBepXetm0QbbRfal0dxZhoM909qn9+tAj1Q
	hIHAOA3mxq9pCe0pCdL6kJos+nGcmCINYTSbWbdyjXhi9NvwTV8RterIZmEU3Tm8x5Y6Et3S7y0qI
	35csR7TOHWmGX1wSY5BF9A099MwN/4I9aQHAxQ5HlLyXUKyJfD6Qw1Tp9hOHHJxileL+oAdaDWzMS
	jWyQAoYFI4ROI5OJJ8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt88-000000092z7-3vzy;
	Tue, 10 Mar 2026 09:11:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt87-000000092yV-3ee2
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 10 Mar 2026 09:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k2F848Zif0ENv+dioxwCTNyt1oN71pv8VacY1VvtFtA=; b=DuQ0+ltaybzpUUEZ4f8rkkcNHw
	uSN1fk9X4kbSf/P4GJfmDdKqiDBeKltxFA2L6bV+QAfk5D5598g/FOQEpIK8LzO6vYLU6hlaYpHyB
	5vcyHXjQ2TVfUfVc3v3WQlFVZ+y1j0tBcGxZ/n1tsEL3FTo4F8USjweJIbQlgGJWWc0c/8wQh3tGb
	x009k8rQDrJ+DNeJsEenXyd5/AWb/EGvzqZ0xQMQlKTxUtKCiKMdCeD7MnYBLwCLayH99doSuRzS4
	xRannzDEv8BBER7RLGGPfxc4CM/rw3RwISR+HkgKEfrNJCNvn67iD9TIImNe3eQ2ZhCkP525CnTsa
	JTBpao2g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt84-0000000E4ae-1DbZ
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Mar 2026 09:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A10744552
	for <linux-snps-arc@lists.infradead.org>; Tue, 10 Mar 2026 09:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E172C2BCB2
	for <linux-snps-arc@lists.infradead.org>; Tue, 10 Mar 2026 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133905;
	bh=k2F848Zif0ENv+dioxwCTNyt1oN71pv8VacY1VvtFtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KGzE+AkPTbDePLOfxxSTz0NJMri0EekeriaoMph7b9Jbqih5Ia32kL2tB0bpRXAaZ
	 Xd6EgwIO3zW8wsj5KPHnW557mQOlYLsZmYMSs3/zPmDxiTQ1jEJyWWcLDAgaOVZ26j
	 8FNpzsqFjoQvFDl4B1/w6djudKuYNee9wTmWamLyhMa75x3wa/pvdJZWCYDV6nWoc9
	 f2cKKUD8Pm9nT3qQuRFerXNryMwk6751oxzDK5gkcVrGPVN+HdpSxKhW+p/6F3f2aq
	 TBbzKVwfBxOwsnrEtZL5vhU6EQaU8FtIppabfHdyf8tNXzvPe1lMPdjxpy8rJPAK6p
	 E1LbYo0/ajrAw==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64c9a6d6b70so10813031d50.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 10 Mar 2026 02:11:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVr9LonRvhljsT+dCU9EHe1z2bLIs0EDWcrK/bzFLx/iuy2ZbX1Wwwh7swmGvAZqjjgJdJMWmjOxB8hN5L0qA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzp7K1lFjZl1TlD3pTi4Pgki879ujLxbGPGNEaVpx7vRHqdomP
	xi/4GMqZflwqKxtwDMopRwN9E5+f8zU3Pksge3aqtJkInYn0eSccn0aOsBdqr/DxpbsYctg9jda
	/D5pQmUxyunPjlHvt1Tx22RrZ7YW85IY=
X-Received: by 2002:a05:690e:b8c:b0:64c:905:6f2c with SMTP id
 956f58d0204a3-64d1411d8b4mr13101525d50.20.1773133904182; Tue, 10 Mar 2026
 02:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com> <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:11:32 +0100
X-Gmail-Original-Message-ID: <CAD++jL=pOw2ZZqMXFK4cQ67g3yUGho6mjbW3JM8iQDQpiKL8TA@mail.gmail.com>
X-Gm-Features: AaiRm53Xu9gGfY3MrM83r361-dKQ36aGj99vP6wgofH18qCwDYgWNRZvm6MhVmA
Message-ID: <CAD++jL=pOw2ZZqMXFK4cQ67g3yUGho6mjbW3JM8iQDQpiKL8TA@mail.gmail.com>
Subject: Re: [PATCH 07/14] pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_091152_716146_1392E7DC 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBNYXIgNCwgMjAyNiBhdCAxMDowM+KAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kKPGJh
cnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cgo+IE9GX0dQSU8gaXMg
c2VsZWN0ZWQgYXV0b21hdGljYWxseSBvbiBhbGwgT0Ygc3lzdGVtcy4gQW55IHN5bWJvbHMgaXQK
PiBjb250cm9scyBhbHNvIHByb3ZpZGUgc3R1YnMgc28gdGhlcmUncyByZWFsbHkgbm8gcmVhc29u
IHRvIHNlbGVjdCBpdAo+IGV4cGxpY2l0bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+CgpQYXRjaCBh
cHBsaWVkIHRvIHRoZSBwaW5jdHJsIHRyZWUhCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
