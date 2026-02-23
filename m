Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C891AE9A02C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Feb 2026 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4kUlsJwv2AoTC68XSBaK23dnXZTrl94GTrrB8AnTsU=; b=jk0lQ/38o/AK70
	JAgR+4GK3kEn0I7YAvuIoEB8MoEhZgUtoAxnh5myz0PU/NlFy0M3TqV0zlu6R3V6oIrWoglazpEVl
	VodEDs+p9ZbH6WlYOKXkHjMfi/tTqtvgl5hIFyHYNXhmM0ZVwdNop+a9Z7V1p6VolRYwov6xkw/Ve
	KkhM17BpolI5scCFFG47i+rsoz79iHlGY1ZiADjQtueMrM4SROLlI/U7Jc6xeJ54+9GgwVEaEf11m
	gJhv8k72mc/5Axk8Ffj8KOW3nJVBYdRT42A9S0Te8CF8HpzHYWMQsRwueVuTEDI5q/SqEN86miyK0
	7oS/cTBP+14zvXKgBIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTXq-000000005ni-0y6E;
	Mon, 23 Feb 2026 10:52:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTXo-000000005mn-08uY
	for linux-snps-arc@lists.infradead.org;
	Mon, 23 Feb 2026 10:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DACD444D6
	for <linux-snps-arc@lists.infradead.org>; Mon, 23 Feb 2026 10:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CA5C2BC87
	for <linux-snps-arc@lists.infradead.org>; Mon, 23 Feb 2026 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771843922;
	bh=LjdaAWL18J+XKlo5pWyw58zzYxvAGx+T2tXNF0wzVmQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ioPfrsJ7MZImZfNwXSWciqkf8iAA7MOxMQT64UMxezIbjJI2+Ieebe186kpsCvy1G
	 vLiUnMhkCO7BWsyhGVon1S7ZHurxm8sZQK7bLpN8Jf5AIKPeZpkGk702dCO+N8Fwjv
	 SC0TZ8D2S2M9BzfrwRGAuH9JZU7epq+Mj1qpLYQfJgrrBGupFbmeH19NCdSeZLXWKo
	 0G2W50vMld8V4ywalJfv37A4qYwoe4KqaJ+szucm+M0JWnVkuEfiBK3ORosR4t+HvI
	 ZocYyPvViP0HPUTe3gaNmWf4qIr2fr8mrbSI3NuQaKt5cHJbscKEk10IL4fbhi2sJt
	 MYoe0NazDLj8Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-385d9fb297dso45920891fa.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 23 Feb 2026 02:52:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtD5GqdxtGCKG94jHuCaHsSw8rvoCrWPSk65/TH9cLLbH2GOC8nx5OqtCyzVU7qi2VFJVgF4r1RUVgHptjHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgnnzmQbfn3iXfLlO2QCRvhy+6YF7MrHEAm86+dM2UyC1T8Y6C
	Ua3he2wj+bkKOYb/uV7Upuj56tCEEzrkkNn5gSEJ4tZbdo6r7uU7hpo+aPxP6geXTjrQOX6pJ8M
	Y690zWzG5t74FeT9JTQChbEeb0MCYcL/58DSKKr9acQ==
X-Received: by 2002:a05:651c:2104:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-389a5c9276fmr24333271fa.6.1771843921104; Mon, 23 Feb 2026
 02:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20260106133534.46065-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106133534.46065-1-bartosz.golaszewski@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Feb 2026 11:51:48 +0100
X-Gmail-Original-Message-ID: <CAMRc=McBt=FO2Wqe4ESU9Xs9VdFdSGhUMmhBzQYA4mgdOJ9rhw@mail.gmail.com>
X-Gm-Features: AaiRm51XnAmM6WSP1gDcTw_jFiEUyp2Nr9VAarTAUkqyR73Bm6WKuxaH2iAc_yc
Message-ID: <CAMRc=McBt=FO2Wqe4ESU9Xs9VdFdSGhUMmhBzQYA4mgdOJ9rhw@mail.gmail.com>
Subject: Re: [PATCH] arc: axs10x: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025204_133042_0642B43A 
X-CRM114-Status: GOOD (  13.43  )
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCAyOjM24oCvUE0gQmFydG9zeiBHb2xhc3pld3NraQo8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9GX0dQSU8gaXMg
YXV0b21hdGljYWxseSBlbmFibGVkIG9uIGFsbCBPRiBzeXN0ZW1zLiBUaGVyZSdzIG5vIG5lZWQg
dG8KPiBzZWxlY3QgaXQgZXhwbGljaXRseS4KPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiAg
YXJjaC9hcmMvcGxhdC1heHMxMHgvS2NvbmZpZyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjL3BsYXQtYXhzMTB4L0tjb25maWcg
Yi9hcmNoL2FyYy9wbGF0LWF4czEweC9LY29uZmlnCj4gaW5kZXggYjk2NTJjNjlkMWI5Li40MGYy
YTc0ZDQwNGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcmMvcGxhdC1heHMxMHgvS2NvbmZpZwo+ICsr
KyBiL2FyY2gvYXJjL3BsYXQtYXhzMTB4L0tjb25maWcKPiBAQCAtNyw3ICs3LDYgQEAgbWVudWNv
bmZpZyBBUkNfUExBVF9BWFMxMFgKPiAgICAgICAgIGJvb2wgIlN5bm9wc3lzIEFSQyBBWFMxMHgg
U29mdHdhcmUgRGV2ZWxvcG1lbnQgUGxhdGZvcm1zIgo+ICAgICAgICAgc2VsZWN0IERXX0FQQl9J
Q1RMCj4gICAgICAgICBzZWxlY3QgR1BJT19EV0FQQgo+IC0gICAgICAgc2VsZWN0IE9GX0dQSU8K
PiAgICAgICAgIHNlbGVjdCBIQVZFX1BDSQo+ICAgICAgICAgc2VsZWN0IEdFTkVSSUNfSVJRX0NI
SVAKPiAgICAgICAgIHNlbGVjdCBHUElPTElCCj4gLS0KPiAyLjQ3LjMKPgo+CgpHZW50bGUgcGlu
Zy4KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
