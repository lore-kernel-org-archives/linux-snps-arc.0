Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F997C001DB
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Aug 2023 00:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpznMqAqrWfI1lxYa9/8ktXoDrBNJ4Rb2UbKH/Ko09M=; b=U1ot1Z6K63lCEk
	5brWa9OhLmetkLa7bmFkpMePPuGz/tcrnE/WS7I/Cs5ZPO4A+BfUm4BEL1TITSbLSo9FjJ6qjStBh
	OvQxgBb0/9qbQ2Joty8tjxHBF+DSPA8XeQHN8PUFQKF5Y2LnDIeiAWL8aNz2u4Z+T30fCtfuCrxu5
	Fp9tIkdXheMxgqW3LNMWt7a0oIiyoc089R42/elb0fUKpDQqLUmnDqqVJblXMUW0b0OFQMu2XXWzD
	AHEKUpt284lPoVB04elLZ3bbCqnCSWjovZdR/5+9Lkx1AtdVmecQc/VzpGga22GQhDrH/h0zz2sb/
	VIewpI+liiHYQZOFXhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWrZ-003j7v-2n;
	Wed, 09 Aug 2023 00:15:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWrX-003j7U-11
	for linux-snps-arc@lists.infradead.org;
	Wed, 09 Aug 2023 00:15:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C143B62B17
	for <linux-snps-arc@lists.infradead.org>; Wed,  9 Aug 2023 00:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FBDC433C8
	for <linux-snps-arc@lists.infradead.org>; Wed,  9 Aug 2023 00:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691540142;
	bh=Z/PzABt4yt6pB7W6zcNJyZg9QLMe8RQXoLL9jioMaLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JgAwzxI3HMQmgfnxNA6oQck5CYyBENOfzYqBCGCzf80RKP8dYRnV2Rnq5twL6cWoW
	 Oqg87XbROkHnYNTE02odPJKBjYYym1CwcOlMg+xOIInOfACVjLMGmAiLt4Fm8KUGqc
	 31p530ZuBdh2ZbHBRsyo4AItz3TklpspwKSzppaJQbYrUyhuzbo7g18CpzBNg08fVu
	 Iexigjzin9wr4LM0P9jSIAZsJJM/GzXU3VmnS0n3ATXQdGSiy+R7pPSHj+e9CRctoJ
	 /BFZIFLz/ioMlNWucqXxvF5OT3TkE1PJtsxLiN0/90P6EBQyrTVv9ck/9d6h8FDUnR
	 PtIsUIDyrUX+w==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso96167971fa.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 08 Aug 2023 17:15:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YxFqRxWPlRdLQ28hFhNBWkROIO2TYv45r8d8JFB6HZen862yUhU
	JpywlvwUdQ9wIl7ZGbKyWPmuhjvkRFjWAYEhMiQ=
X-Google-Smtp-Source: AGHT+IFRENO8L5910xSKB4YBZKHrFeiO4P731S9dDkQX5Tj3Roeili0J2IZROdoUlzfJiaySP9X2B+lj60fK00xb0Nk=
X-Received: by 2002:a05:651c:214:b0:2b6:de52:34f with SMTP id
 y20-20020a05651c021400b002b6de52034fmr728417ljn.24.1691540140217; Tue, 08 Aug
 2023 17:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230808-csky-virt-to-phys-v1-0-ac727f8def2f@linaro.org>
In-Reply-To: <20230808-csky-virt-to-phys-v1-0-ac727f8def2f@linaro.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 9 Aug 2023 08:15:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS3xmn7YFzBLfOEJ-WX5FRth=_Q5YDwzXrK0dJBOECBvw@mail.gmail.com>
Message-ID: <CAJF2gTS3xmn7YFzBLfOEJ-WX5FRth=_Q5YDwzXrK0dJBOECBvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] csky: Convert memory accessors to static inlines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_171543_398030_6DBA6970 
X-CRM114-Status: GOOD (  13.32  )
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCA0OjI24oCvUE0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFRoaXMgY29udmVydHMgdGhlIHZpcnRfdG9fcGZu
IGFuZCBwZm5fdG9fdmlydCBtYWNyb3MKPiBpbnRvIHN0YXRpYyBpbmxpbmVzIHNvIHdlIGdldCBw
cm9wZXIgdHlwZSBjaGVja2luZyBvbgo+IHRoZSBwb2ludGVycyBwYXNzZWQgaW4uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gLS0t
Cj4gTGludXMgV2FsbGVpaiAoMik6Cj4gICAgICAgY3NreTogQ2FzdCBhcmd1bWVudCB0byB2aXJ0
X3RvX3BmbigpIHRvICh2b2lkICopCj4gICAgICAgY3NreTogTWFrZSBwZm4gYWNjZXNzb3JzIHN0
YXRpYyBpbmxpbmVzCj4KPiAgYXJjaC9hcmMvaW5jbHVkZS9hc20vcGFnZS5oICB8ICAyICstCj4g
IGFyY2gvY3NreS9pbmNsdWRlL2FzbS9wYWdlLmggfCAxMyArKysrKysrKysrLS0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNl
LWNvbW1pdDogMDZjMmFmYjg2MmY5ZGE4ZGM1ZWZhNGI2MDc2YTBlNDhjM2ZiYWFhNQo+IGNoYW5n
ZS1pZDogMjAyMzA4MDgtY3NreS12aXJ0LXRvLXBoeXMtM2Q4MGMxNzIxMWY5Cj4KPiBCZXN0IHJl
Z2FyZHMsCj4gLS0KPiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4K
VGh4LCBBcHByb3ZlZC4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
