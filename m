Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09138CA6002
	for <linux-snps-arc@archiver.kernel.org>; Thu,  8 Oct 2026 05:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXeM6ZT7+h8UkQigyo88xQneLi15R9mupDV88JtyJAk=; b=OGJPA2gg8DbjHp
	mxJWNtwm14Rv6NCqXNJih3bvzxD65kCKV7H5bj+kKiCnZ0KBzQvxETUOpuOtJhpDZazrqf0kkvViC
	GXZ/1/SnXdM7cVtwwFdmEeEP6nH/Q/gfhhOgvr1Ez8NRVRwbr0XRbREiWi6zdAG1czV3r6GcvdcLv
	uO01LlJG6B9A3vMm2JaOqonFgZc3kogYG0Yl5d3rCxUojteS9HvjY/zxlSSP/DrLn6P2qtu5SETO3
	hVwexfpmQsJ8C5VZihTHgpSNJcaBsf8cYMxN3E4rOOUv5vSEeY7plYxWiAKg/8SyiA+dSNXqQ+Iei
	y9kOR8oOqbpXrs3tgc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEh61-00000003Zsq-1WD2;
	Thu, 08 Oct 2026 05:55:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEh5z-00000003Zsh-2IrI
	for linux-snps-arc@lists.infradead.org;
	Thu, 08 Oct 2026 05:55:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0257F44790
	for <linux-snps-arc@lists.infradead.org>; Thu,  8 Oct 2026 05:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE6E1F0089A
	for <linux-snps-arc@lists.infradead.org>; Thu,  8 Oct 2026 05:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791438910;
	bh=d+dRBYUod/fcxf5Iqkdq4xO/QoiSyB4U5wDhK8pZlUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J6l6T/G5e+D6fTKENQSW1IbzzSblV3BheIph5N9an6pxKneuaxd0nnOGDBNY4Ljgy
	 qSMJ6NPF8itY9e/UHVOQFiC5npIvIxt8XZKwDbqMpJsB3nNjKO/VIahmLvhIF2gYFY
	 I9VXHpRlQm++++JR5vtRksGeLO2XsL4UakgiNUczs8zu68OXXTUXd0m9o0A17RdAmM
	 uoN1UUIFjwqgwAQczOJpETM7S06ugufdKjBAe445dHJZ9RWCxYdhnLS2QivL9YVxnW
	 zuMmkkzviLTIu3tIZrS7afxPqN3GvdPkisXlGjgyX1M7LXC3Ny32oAaVNfkxjRNQe+
	 jv/VqC2gACvpw==
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso3816158f8f.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 07 Oct 2026 22:55:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzTYvDsbvsoFOOgge5Q0wjjxRpajYVqmM9fMCTDCI6voqI+bd5FwUYwsqbFitqNtHytAjvg3g7at2CueA1GQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIgFh/tWLyCKZaZyTLd2KUkJk/yfjgrnsYUDCqGKYZaFMcejzas
	k+kmpT/ISY/HKb6j37ruAA41l2eD7FiN9PDg64bM3Wx+pFkUHmMIBI1dh7cph4XmUkcw9nwaJN5
	qTUbMmr7ZhZSsTsrPnooY04/CjnUC0bA=
X-Received: by 2002:a05:6000:2886:b0:48b:fdd:fbe4 with SMTP id
 ffacd0b85a97d-48c72889c8fmr7729946f8f.21.1791438909215; Wed, 07 Oct 2026
 22:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop> <20261007203636.1982188-4-paulmck@kernel.org>
In-Reply-To: <20261007203636.1982188-4-paulmck@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 8 Oct 2026 13:54:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQbbPAdjS3p3oMoCGdkBWFM3Hx5+JnCu=9hdXuPQaM5Zg@mail.gmail.com>
X-Gm-Features: AclHuK_i3yfeFM1Mqj1_rFbFa07SZwIrjJoViyoWe8JhZO_JNtdsTVGKx8Q49n0
Message-ID: <CAJF2gTQbbPAdjS3p3oMoCGdkBWFM3Hx5+JnCu=9hdXuPQaM5Zg@mail.gmail.com>
Subject: Re: [PATCH 4/5] csky: Emulate two-byte cmpxchg
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>, 
	Vineet Gupta <vgupta@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, linux-snps-arc@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-sh@vger.kernel.org, kernel-team@meta.com
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

T24gVGh1LCBPY3QgOCwgMjAyNiBhdCA0OjM24oCvQU0gUGF1bCBFLiBNY0tlbm5leSA8cGF1bG1j
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEJyYWRsZXkgTW9yZ2FuIDxicmFkc0BtYWlu
bGluaW5nLm9yZz4KPgo+IEMtU0tZIGhhcyBubyB0d28tYnl0ZSBhdG9taWMgY29tcGFyZSBhbmQg
c3dhcCwgc28gdGhlIF9fY21weGNoZygpCj4gbWFjcm9zIGxldCBjYXNlIDIgZmFsbCB0aHJvdWdo
IHRvIEJVSUxEX0JVRygpIHZpYSBkZWZhdWx0LCBhbmQgYQo+IHR3by1ieXRlIGNtcHhjaGcoKSBm
YWlscyB0aGUgYnVpbGQuCj4KPiBSb3V0ZSBjYXNlIDIgdGhyb3VnaCB0aGUgbmV3IGNtcHhjaGdf
ZW11X3UxNigpLCB3aGljaCBuYXJyb3dzIHRoZQo+IG9sZCBhbmQgbmV3IHZhbHVlcyBpdHNlbGYs
IHNvIGFsbCB0aHJlZSBvcmRlcmluZ3MsIHJlbGF4ZWQsIGFjcXVpcmUKPiBhbmQgZnVsbCwga2Vl
cCB0aGUgKHVpbnRwdHJfdCkgY2FzdHMgdGhlIGNhc2UgMSBwYXRoIGFscmVhZHkgdXNlcy4KPgo+
IFNpZ25lZC1vZmYtYnk6IEJyYWRsZXkgTW9yZ2FuIDxicmFkc0BtYWlubGluaW5nLm9yZz4KPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIEUuIE1jS2VubmV5IDxwYXVsbWNrQGtlcm5lbC5vcmc+Cj4gLS0t
Cj4gIGFyY2gvY3NreS9pbmNsdWRlL2FzbS9jbXB4Y2hnLmggfCA5ICsrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L2lu
Y2x1ZGUvYXNtL2NtcHhjaGcuaCBiL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiBp
bmRleCBkYjZkZGE0NzE4NGU0Li42ZjNjYTc5ZTU0YWNmIDEwMDY0NAo+IC0tLSBhL2FyY2gvY3Nr
eS9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiArKysgYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vY21w
eGNoZy5oCj4gQEAgLTY0LDYgKzY0LDkgQEAKPiAgICAgICAgIHN3aXRjaCAoc2l6ZSkgeyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgY2FzZSAxOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAg
ICAgICAgICAgIF9fcmV0ID0gKF9fdHlwZW9mX18oKihwdHIpKSljbXB4Y2hnX2VtdV91OCgodm9s
YXRpbGUgdTggKilfX3B0ciwgKHVpbnRwdHJfdClfX29sZCwgKHVpbnRwdHJfdClfX25ldyk7IFwK
PiArICAgICAgICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBjYXNlIDI6ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgX19yZXQgPSAo
X190eXBlb2ZfXygqKHB0cikpKWNtcHhjaGdfZW11X3UxNigodm9sYXRpbGUgdTE2ICopX19wdHIs
ICh1bnNpZ25lZCBsb25nKV9fb2xkLCAodW5zaWduZWQgbG9uZylfX25ldyk7IFwKPiAgICAgICAg
ICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICAgICAgICAgY2FzZSA0OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgIGFzbSB2b2xhdGlsZSAoICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiBAQCAtOTcsNiArMTAwLDkgQEAKPiAgICAgICAgIHN3
aXRjaCAoc2l6ZSkgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ICAgICAgICAgY2FzZSAxOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gICAgICAgICAgICAgICAgIF9fcmV0ID0gKF9fdHlwZW9mX18oKihwdHIpKSlj
bXB4Y2hnX2VtdV91OCgodm9sYXRpbGUgdTggKilfX3B0ciwgKHVpbnRwdHJfdClfX29sZCwgKHVp
bnRwdHJfdClfX25ldyk7IFwKPiArICAgICAgICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBjYXNlIDI6ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAg
ICAgICAgICAgX19yZXQgPSAoX190eXBlb2ZfXygqKHB0cikpKWNtcHhjaGdfZW11X3UxNigodm9s
YXRpbGUgdTE2ICopX19wdHIsICh1bnNpZ25lZCBsb25nKV9fb2xkLCAodW5zaWduZWQgbG9uZylf
X25ldyk7IFwKPiAgICAgICAgICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgY2FzZSA0OiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgIGFzbSB2b2xh
dGlsZSAoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiBAQCAtMTMxLDYgKzEz
Nyw5IEBACj4gICAgICAgICBzd2l0Y2ggKHNpemUpIHsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIGNhc2UgMTogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICBfX3JldCA9IChf
X3R5cGVvZl9fKCoocHRyKSkpY21weGNoZ19lbXVfdTgoKHZvbGF0aWxlIHU4ICopX19wdHIsICh1
aW50cHRyX3QpX19vbGQsICh1aW50cHRyX3QpX19uZXcpOyBcCj4gKyAgICAgICAgICAgICAgIGJy
ZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ICsgICAgICAgY2FzZSAyOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIF9fcmV0ID0gKF9fdHlwZW9mX18oKihwdHIpKSlj
bXB4Y2hnX2VtdV91MTYoKHZvbGF0aWxlIHUxNiAqKV9fcHRyLCAodW5zaWduZWQgbG9uZylfX29s
ZCwgKHVuc2lnbmVkIGxvbmcpX19uZXcpOyBcCkxHVE0hCgpBY2tlZC1ieTogR1VPIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+Cgo+ICAgICAgICAgICAgICAgICBicmVhazsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICBjYXNlIDQ6ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAg
YXNtIHZvbGF0aWxlICggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0tCj4g
Mi40MC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QK
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
