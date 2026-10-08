Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDCFCA600C
	for <linux-snps-arc@archiver.kernel.org>; Thu,  8 Oct 2026 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6InHpTvGYU5cs5quKbNNYwDzoaT108uA/nH1TpeDX3Y=; b=1lMxd/rKJWZxyN
	iOy+HexFLciHcmX54jOtQ0kWFyTqdmS0O+7kqh9ZTF/zc62hnia+ueenWip/C6fAT3mPKL6A4WTog
	z6zj81qoSFQUdi4yi7iPa0W+fkmgrDHqsFkPnsRiNKZo/oFWuZ7kcyCdvNb9i6dZb6G7y4SLeeEhk
	+B6m3C3VJdUDxlS9iQAOsXzZ92HHbDDZX1H+M1HsbZPr4qdsuzKGo0xhEXO/6UbjyJcv+H6OmjGGm
	I317TFKtDJq8kNe4xzP55D736zwNJ86eJjV4YoaJ/In6Ck/8YdpCx4HIPpmIZSPmAUdTQwPCayzEW
	QvniDu34l8dz3Eekwq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqC3-00000004ces-16Iu;
	Thu, 08 Oct 2026 15:38:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqC1-00000004ceZ-30rW
	for linux-snps-arc@lists.infradead.org;
	Thu, 08 Oct 2026 15:38:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9F8C601EF;
	Thu,  8 Oct 2026 15:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0F91F000FF;
	Thu,  8 Oct 2026 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791473880;
	bh=ie7wR03RucgsB/jgJe4FU0Vwspb7ELUKAMZ57zUu0sE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=G2iU6EW9EFIllbh3aVrRfKKXqDkxcF0TBv8st/BCo5pUJAfjqVKnOh+mEdtx0NjMM
	 HBQ2SnVVFaLMu9fJOL0SZDdrfY5C5l58muGuiGZJHy+UQJf3WXP5TlcGZAWe7qZ6fB
	 tujJGNSQUFY4tn1VoF0TTGgvOUckabbBFRTMGHPwOJKXVt+5+ouB8MxfOFwqdxBjC5
	 eP/YzTcBkWvWjGKYh2RJORIQS4fLIi68PbaalWWLpUBFQ9h72DYG7inT3EIqZc58PK
	 aWlDl9WvG5RL0sxFslbBc9eITx/iTfTIp6z9o8sWVw3ZhfXXJjuw4SEh0QXGKIbF/h
	 uQI2iYoJauGTA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 48E57CE399B; Thu,  8 Oct 2026 08:38:00 -0700 (PDT)
Date: Thu, 8 Oct 2026 08:38:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 4/5] csky: Emulate two-byte cmpxchg
Message-ID: <f4e71ae2-e97e-4667-8d97-bcdab56caf86@paulmck-laptop>
References: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
 <20261007203636.1982188-4-paulmck@kernel.org>
 <CAJF2gTQbbPAdjS3p3oMoCGdkBWFM3Hx5+JnCu=9hdXuPQaM5Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQbbPAdjS3p3oMoCGdkBWFM3Hx5+JnCu=9hdXuPQaM5Zg@mail.gmail.com>
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgMDgsIDIwMjYgYXQgMDE6NTQ6NTdQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUaHUsIE9jdCA4LCAyMDI2IGF0IDQ6MzbigK9BTSBQYXVsIEUuIE1jS2VubmV5IDxwYXVs
bWNrQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206IEJyYWRsZXkgTW9yZ2FuIDxicmFk
c0BtYWlubGluaW5nLm9yZz4KPiA+Cj4gPiBDLVNLWSBoYXMgbm8gdHdvLWJ5dGUgYXRvbWljIGNv
bXBhcmUgYW5kIHN3YXAsIHNvIHRoZSBfX2NtcHhjaGcoKQo+ID4gbWFjcm9zIGxldCBjYXNlIDIg
ZmFsbCB0aHJvdWdoIHRvIEJVSUxEX0JVRygpIHZpYSBkZWZhdWx0LCBhbmQgYQo+ID4gdHdvLWJ5
dGUgY21weGNoZygpIGZhaWxzIHRoZSBidWlsZC4KPiA+Cj4gPiBSb3V0ZSBjYXNlIDIgdGhyb3Vn
aCB0aGUgbmV3IGNtcHhjaGdfZW11X3UxNigpLCB3aGljaCBuYXJyb3dzIHRoZQo+ID4gb2xkIGFu
ZCBuZXcgdmFsdWVzIGl0c2VsZiwgc28gYWxsIHRocmVlIG9yZGVyaW5ncywgcmVsYXhlZCwgYWNx
dWlyZQo+ID4gYW5kIGZ1bGwsIGtlZXAgdGhlICh1aW50cHRyX3QpIGNhc3RzIHRoZSBjYXNlIDEg
cGF0aCBhbHJlYWR5IHVzZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQnJhZGxleSBNb3JnYW4g
PGJyYWRzQG1haW5saW5pbmcub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBFLiBNY0tlbm5l
eSA8cGF1bG1ja0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9jc2t5L2luY2x1ZGUvYXNt
L2NtcHhjaGcuaCB8IDkgKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vY21weGNoZy5o
IGIvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+ID4gaW5kZXggZGI2ZGRhNDcxODRl
NC4uNmYzY2E3OWU1NGFjZiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9j
bXB4Y2hnLmgKPiA+ICsrKyBiL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+IEBA
IC02NCw2ICs2NCw5IEBACj4gPiAgICAgICAgIHN3aXRjaCAoc2l6ZSkgeyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICBjYXNlIDE6ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAgICAg
ICAgICBfX3JldCA9IChfX3R5cGVvZl9fKCoocHRyKSkpY21weGNoZ19lbXVfdTgoKHZvbGF0aWxl
IHU4ICopX19wdHIsICh1aW50cHRyX3QpX19vbGQsICh1aW50cHRyX3QpX19uZXcpOyBcCj4gPiAr
ICAgICAgICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiArICAgICAgIGNhc2UgMjogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIF9fcmV0ID0g
KF9fdHlwZW9mX18oKihwdHIpKSljbXB4Y2hnX2VtdV91MTYoKHZvbGF0aWxlIHUxNiAqKV9fcHRy
LCAodW5zaWduZWQgbG9uZylfX29sZCwgKHVuc2lnbmVkIGxvbmcpX19uZXcpOyBcCj4gPiAgICAg
ICAgICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gICAgICAgICBjYXNlIDQ6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUgKCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiBAQCAtOTcsNiArMTAwLDkgQEAKPiA+
ICAgICAgICAgc3dpdGNoIChzaXplKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiAgICAgICAgIGNhc2UgMTogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICAgIF9fcmV0ID0gKF9fdHlw
ZW9mX18oKihwdHIpKSljbXB4Y2hnX2VtdV91OCgodm9sYXRpbGUgdTggKilfX3B0ciwgKHVpbnRw
dHJfdClfX29sZCwgKHVpbnRwdHJfdClfX25ldyk7IFwKPiA+ICsgICAgICAgICAgICAgICBicmVh
azsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
ICsgICAgICAgY2FzZSAyOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgX19yZXQgPSAoX190eXBlb2ZfXygqKHB0cikp
KWNtcHhjaGdfZW11X3UxNigodm9sYXRpbGUgdTE2ICopX19wdHIsICh1bnNpZ25lZCBsb25nKV9f
b2xkLCAodW5zaWduZWQgbG9uZylfX25ldyk7IFwKPiA+ICAgICAgICAgICAgICAgICBicmVhazsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgIGNh
c2UgNDogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gICAgICAgICAgICAgICAgIGFzbSB2b2xhdGlsZSAoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+IEBAIC0xMzEsNiArMTM3LDkgQEAKPiA+ICAgICAgICAgc3dpdGNoIChz
aXplKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAg
ICAgIGNhc2UgMTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gICAgICAgICAgICAgICAgIF9fcmV0ID0gKF9fdHlwZW9mX18oKihwdHIpKSljbXB4
Y2hnX2VtdV91OCgodm9sYXRpbGUgdTggKilfX3B0ciwgKHVpbnRwdHJfdClfX29sZCwgKHVpbnRw
dHJfdClfX25ldyk7IFwKPiA+ICsgICAgICAgICAgICAgICBicmVhazsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgY2FzZSAyOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAg
ICAgICAgICAgICAgX19yZXQgPSAoX190eXBlb2ZfXygqKHB0cikpKWNtcHhjaGdfZW11X3UxNigo
dm9sYXRpbGUgdTE2ICopX19wdHIsICh1bnNpZ25lZCBsb25nKV9fb2xkLCAodW5zaWduZWQgbG9u
ZylfX25ldyk7IFwKPiBMR1RNIQo+IAo+IEFja2VkLWJ5OiBHVU8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4KClRoYW5rIHlvdSEgIEkgd2lsbCBhcHBseSB0aGlzIG9uIG15IG5leHQgcmViYXNlLgoK
CQkJCQkJCVRoYW54LCBQYXVsCgo+ID4gICAgICAgICAgICAgICAgIGJyZWFrOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAgY2FzZSA0OiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAg
ICAgICAgICAgYXNtIHZvbGF0aWxlICggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ID4gLS0KPiA+IDIuNDAuMQo+ID4KPiAKPiAKPiAtLSAKPiBCZXN0IFJlZ2FyZHMKPiAgR3Vv
IFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
