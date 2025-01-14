Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE49AE77188
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2025 04:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxSZXejLlMI2Mx8PMYERgtB5zzfcZrhR5NgHUpXdSLk=; b=zjqeTQAvr5XeRL
	7womj4k/m8Q+0yBdcYXRyGUI82xYY9gadGmY5nnyVaekONIM3iGmljWCDk1O8zYkxtxaFFnIIjNtf
	RbnqDI3xnawkKNEu4j8yuVWZVoxjfqQPCxiP9Hjat3HlEovqP4rPhLtO1GgBaUfuuS6nhshoIQW1X
	jJpVz9eonKwItY4nBW/8oVPmjQm2N48OMChJoMuM5v8Nw1m5XwL6mnaOn7WQ54rM+BiuqjBDhfoGp
	gI1EybzfYAb7y8JxGz8cCBmyGRtC0hZN3mzv0x61DF/iY8Y1d6/yIyUEHcdrlcUVYwca6DfdKEC75
	9RN/ay28z6sAxEZCBEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYoD-00000007SEj-0W43;
	Tue, 14 Jan 2025 04:45:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYoB-00000007SEO-0Fmd
	for linux-snps-arc@lists.infradead.org;
	Tue, 14 Jan 2025 04:45:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0CC6DA401DC
	for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2025 04:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AE4C4CEE1
	for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2025 04:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736829941;
	bh=0RL1sAC+TWEMOw1/sGIgeD4+QIaqMWdSvFWI2yz1c0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JO5h0lhCvkfWvCFUbFdVblTBu/LKzKoAH79MBlFKqTZ8hQTMjYeY/dsF4ZIN6cHKA
	 NxvmxFJy43Lw5M/tPNgyrqdiFR7w1473RrRs3JXI9xfCTTq3aseuF90cluLi+7SrNe
	 p0tW2J8PQhG08eFDWzEe1+n3zKhhaouQ85w1cRZZ8n+VBGSj18K7FTGJNzCjHSJs2y
	 xAUi7kbdYtN4ANqBqQSHciQCtrCJp7IkAKqgwxzK7k1Srb6i3/WZ38oCzjK5b9f5YH
	 6ZIhEwHBe9SsLJ0iMBdFcAbA0ILrjgYrVG4Qq8DVhZ7GGS5ANHEsRNOv8RFLLhnKZL
	 TugX7i831m/iA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3002c324e7eso49195361fa.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Jan 2025 20:45:41 -0800 (PST)
X-Gm-Message-State: AOJu0YycEPY+ZQOWd7QwolnkeY2CYFDc8cNZMad+m2mOUWAbta7RpDB0
	x4IZfminZ8tOhxx1bBAjT4svbr7gjVbfirUITN/wE1yWKxJ4518sa7LbgWxauBgLylWygKXInfU
	SuSF9qNiSfbWrd/uxWGv/Lq5pNuE=
X-Google-Smtp-Source: AGHT+IFromhJpMsSdG6hsFmL/T4o9doxyFHn4S/TbLsGt4ei8YSJ8yLDOMeIg9IwY/90JW7+Z833Zm9kxA7cehdDkAQ=
X-Received: by 2002:a05:651c:505:b0:300:26bc:4311 with SMTP id
 38308e7fff4ca-305f4560b73mr97858061fa.18.1736829940573; Mon, 13 Jan 2025
 20:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20241222001505.2579630-1-masahiroy@kernel.org> <829e5a35-1f13-4d6b-a49e-8ab1a4a6d249@kernel.org>
In-Reply-To: <829e5a35-1f13-4d6b-a49e-8ab1a4a6d249@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 14 Jan 2025 13:45:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFDCnoW8_dtGi+FzN1Fzj+2G5aX93og3OO7PEFkpZhgA@mail.gmail.com>
X-Gm-Features: AbW1kvZCH4-BKiV7JjBpQUqh7rXG9n0mFvk0WRgRK8iCmT9tAqqrqQ0xY1Yh3Vc
Message-ID: <CAK7LNAQFDCnoW8_dtGi+FzN1Fzj+2G5aX93og3OO7PEFkpZhgA@mail.gmail.com>
Subject: Re: [PATCH] ARC: migrate to the generic rule for built-in DTB
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_204543_168931_EEB1B65A 
X-CRM114-Status: UNSURE (   9.70  )
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

T24gVHVlLCBEZWMgMjQsIDIwMjQgYXQgNzowNuKAr0FNIFZpbmVldCBHdXB0YSA8dmd1cHRhQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMTIvMjEvMjQgMTY6MTUsIE1hc2FoaXJvIFlhbWFkYSB3
cm90ZToKPiA+IENvbW1pdCA2NTQxMDJkZjJhYzIgKCJrYnVpbGQ6IGFkZCBnZW5lcmljIHN1cHBv
cnQgZm9yIGJ1aWx0LWluIGJvb3QKPiA+IERUQnMiKSBpbnRyb2R1Y2VkIGdlbmVyaWMgc3VwcG9y
dCBmb3IgYnVpbHQtaW4gRFRCcy4KPiA+Cj4gPiBTZWxlY3QgR0VORVJJQ19CVUlMVElOX0RUQiB0
byB1c2UgdGhlIGdlbmVyaWMgcnVsZS4KPiA+Cj4gPiBUbyBrZWVwIGNvbnNpc3RlbmN5IGFjcm9z
cyBhcmNoaXRlY3R1cmVzLCB0aGlzIGNvbW1pdCBhbHNvIHJlbmFtZXMKPiA+IENPTkZJR19BUkNf
QlVJTFRJTl9EVEJfTkFNRSB0byBDT05GSUdfQlVJTFRJTl9EVEJfTkFNRS4KPiA+Cj4gPiBOb3cs
ICJuc2ltXzcwMCIgaXMgdGhlIGRlZmF1bHQgdmFsdWUgZm9yIENPTkZJR19CVUlMVElOX0RUQl9O
QU1FLCByYXRoZXIKPiA+IHRoYW4gYSBmYWxsYmFjayBpbiBjYXNlIGl0IGlzIGVtcHR5Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+
Cj4KPiBBY2tlZC1ieTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAa2VybmVsLm9yZz4KCgpBcHBsaWVk
IHRvIGxpbnV4LWtidWlsZC4gVGhhbmtzLgoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlh
bWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
