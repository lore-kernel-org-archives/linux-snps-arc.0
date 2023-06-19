Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF48DEB64D9
	for <linux-snps-arc@archiver.kernel.org>; Mon, 19 Jun 2023 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIfjUjJ+pABKHkaIH1C9fhMKX1ZsN1bmbG4biXu+xRA=; b=OnuQE1Ct1dzNyP
	lzxXflCVeoO+rXJE22xf9L0xmQmXxL4SUl5ECZBvbebXhCvUSwLuhAjJuS0eO+aW2RlUkKBR/3h1Y
	jrSZSVcio8bwyZRyJAdX2Q2myUchTTKlfZbQoym9iylguN4Rlm+EU0m7UcIDeYcRiu7cs6xnxcZnU
	T5E508eiCgg5jG1RRrsPOLMkUy/b0sEsPD9ylRo9FlX28dOI3W+LNg+hxbLRLqbrlTwpI6MR3s9C1
	yknnbV7WlfJztYjRcj22z0ZT3Rw9U0PldM77n/xYLuuxfJiatPSeYwH3t48U4/NwsQUK9oFjkCa/R
	ywfsfkHq90U/AGVFoJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBE5v-008URo-0Z;
	Mon, 19 Jun 2023 12:34:55 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBE5l-008UPm-2K
	for linux-snps-arc@lists.infradead.org;
	Mon, 19 Jun 2023 12:34:53 +0000
Received: from leknes.fjasle.eu ([46.142.49.195]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M7s1M-1q7OKy2RNa-0054s7; Mon, 19 Jun 2023 14:34:22 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 01E303E9B6; Mon, 19 Jun 2023 14:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1687178060; bh=IiwVpF5r5BNsW/AliB2hKvy37hPs7k+/ZJCAuSdVtnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rdy75r3J5X+wP1JRjD9sGiB4DLoDHiMwahZlLEhBmqc8LJ3lJJOAPX7kR/EO2ZQX2
	 vnC15WyeCvq+3QgkI3rhOj+N0S8vInSBoByTSCMwQFr8AS5wYuntYVA8tfwk7/CxP0
	 zXVYl3vI5j2TMxQG5SU0TXo+JEelTBh7KersUj+w=
Date: Mon, 19 Jun 2023 14:34:19 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ben Hutchings <ben@decadent.org.uk>,
	linux-snps-arc@lists.infradead.org,
	Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH] kbuild: make modules_install copy
 modules.builtin(.modinfo)
Message-ID: <ZJBLS+Dzcj5wOJTb@fjasle.eu>
References: <20230615111743.883891-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230615111743.883891-1-masahiroy@kernel.org>
X-Provags-ID: V03:K1:lGiBjMXuiyOpcn1NmIsG6Em6LaomC9AlZNR8VnFYV7P47rGqGzk
 gEdj4HKoWC+rkXjD09fJlcx2yrq1icBbr0M0DaeYm2TH28MF8GeX7aau8o21eEJGHGgRH4W
 XRWOG/ps07jwoOpd0XclweJqSuCVVGxFtP5WamHLjd8FVfHxa3BhsPNh45ofbxU2LUzTsHj
 rqLvWgF5j+qXA21TEg7gg==
UI-OutboundReport: notjunk:1;M01:P0:fJLWB0XZUWo=;aBsZVDORVX7MHFJqgDDY2IeZC6l
 7U5O9PgErYt95oFdXHkjxE76yzbCCHXlhYpjaVDmtfJD1qfjOiYpKJ+E/x0wta5sygmTMpgWH
 mcUg1uBgRgWNpq6x/5gubCm17l55pVaLgTwJV0+yb6e7t5/yxJ8/csXxr82Z0h1m68MsueBdo
 Z6szlkTkiZjkd/cX1VMgiBeQJgdXVrAMDN+SVXDeeT53uVypLRiVxrvVzC369e3aljQ8UeQeo
 PKtRkPX5jSZN8spyLFUTjBewuQoUzc3zzEcvHdJBcmfnaK15a6rjOurMVBixpSD/utXrTzyzD
 MQ8UJVLv6eNyHApP6nFMERc+6j7BgrZzgyYBBSrigImt6dJuvc9KiN4pHtckK53DZmFEXegd6
 IUIZYj8Wqke9JZdKK8U8bttdW5HxpgPRNqHIUh6MdJebPJGnfD8a2CdPyLmKVbjKNX5PjxX1T
 bte1ep+Ui8NLqGIPEg2HIoxI1TFJjKE0ZY9+byakuD0hyrzhkGaK3ra5GpgzzNCs6SqH6VvR5
 tWIKVcSQarao0ZggzHgsKs+kU5J6GwE1j8guuve5xtBo7zBx2TjbpljMRLaPOikl2vaSWw5pR
 UIYZYmKgGdIuMY2H3r6kE7ojLSZC7yc5efeqa1uS5fu6pkw8y0efKI7pKs3h99ZOJMGcpSNx+
 EtG4zDsy9rRmCotKCbChGpGSu7b8Pes5+ukVO/elew==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_053447_293297_841D21FE 
X-CRM114-Status: GOOD (  19.13  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMDg6MTc6NDNQTSArMDkwMCBNYXNhaGlybyBZYW1hZGEg
d3JvdGU6Cj4gSm9zaCBUcmlwbGV0dCByZXBvcnRzIHRoYXQgaW5pdHJhbWZzLXRvb2xzIG5lZWRz
IG1vZHVsZXMuYnVpbHRpbiBhbmQKPiBtb2R1bGVzLmJ1aWx0aW4ubW9kaW5mbyB0byBjcmVhdGUg
YSB3b3JraW5nIGluaXRyYW1mcyBmb3IgYSBub24tbW9kdWxhcgo+IGtlcm5lbC4KPiAKPiBJZiB0
aGlzIGlzIGEgZ2VuZXJhbCB0b29saW5nIGlzc3VlIG5vdCBsaW1pdGVkIHRvIERlYmlhbiwgSSB0
aGluayBpdAo+IG1ha2VzIHNlbnNlIHRvIGNoYW5nZSBtb2R1bGVzX2luc3RhbGwuCj4gCj4gVGhp
cyBjb21taXQgY2hhbmdlcyB0aGUgdGFyZ2V0cyBhcyBmb2xsb3dzIHdoZW4gQ09ORklHX01PRFVM
RVM9bi4KPiAKPiBJbi10cmVlIGJ1aWxkczoKPiAgIG1ha2UgbW9kdWxlcyAgICAgICAgICAtPiBu
by1vcAo+ICAgbWFrZSBtb2R1bGVzX2luc3RhbGwgIC0+IGluc3RhbGwgbW9kdWxlcy5idWlsdGlu
KC5tb2RpbmZvKQo+IAo+IEV4dGVybmFsIG1vZHVsZSBidWlsZHM6Cj4gICBtYWtlIG1vZHVsZXMg
ICAgICAgICAgLT4gc2hvdyBlcnJvciBtZXNzYWdlIGxpa2UgYmVmb3JlCj4gICBtYWtlIG1vZHVs
ZXNfaW5zdGFsbCAgLT4gc2hvdyBlcnJvciBtZXNzYWdlIGxpa2UgYmVmb3JlCj4gCj4gTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8zNmE0MDE0YzczYTUyYWYyN2Q5MzBkM2NhMzFk
MzYyYjYwZjQ0NjFjLjE2ODYzNTYzNjQuZ2l0Lmpvc2hAam9zaHRyaXBsZXR0Lm9yZy8KPiBSZXBv
cnRlZC1ieTogSm9zaCBUcmlwbGV0dCA8am9zaEBqb3NodHJpcGxldHQub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4gLS0tCgpSZXZp
ZXdlZC1ieTogTmljb2xhcyBTY2hpZXIgPG5pY29sYXNAZmphc2xlLmV1PgpUZXN0ZWQtYnk6IE5p
Y29sYXMgU2NoaWVyIDxuaWNvbGFzQGZqYXNsZS5ldT4KCj4gIE1ha2VmaWxlIHwgMjYgKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4g
aW5kZXggY2MzZmUwOWM0ZGVjLi5mMThkNTljODEyNDEgMTAwNjQ0Cj4gLS0tIGEvTWFrZWZpbGUK
PiArKysgYi9NYWtlZmlsZQo+IEBAIC0xNTQ1LDYgKzE1NDUsOCBAQCBtb2R1bGVzX3NpZ25fb25s
eSA6PSB5Cj4gIGVuZGlmCj4gIGVuZGlmCj4gIAo+ICtlbmRpZiAjIENPTkZJR19NT0RVTEVTCj4g
Kwo+ICBtb2RpbnN0X3ByZSA6PQo+ICBpZm5lcSAoJChmaWx0ZXIgbW9kdWxlc19pbnN0YWxsLCQo
TUFLRUNNREdPQUxTKSksKQo+ICBtb2RpbnN0X3ByZSA6PSBfX21vZGluc3RfcHJlCj4gQEAgLTE1
NTUsMTggKzE1NTcsMTggQEAgUEhPTlkgKz0gX19tb2RpbnN0X3ByZQo+ICBfX21vZGluc3RfcHJl
Ogo+ICAJQHJtIC1yZiAkKE1PRExJQikva2VybmVsCj4gIAlAcm0gLWYgJChNT0RMSUIpL3NvdXJj
ZQo+IC0JQG1rZGlyIC1wICQoTU9ETElCKS9rZXJuZWwKPiArCUBta2RpciAtcCAkKE1PRExJQikK
PiAraWZkZWYgQ09ORklHX01PRFVMRVMKPiAgCUBsbiAtcyAkKGFic3BhdGggJChzcmN0cmVlKSkg
JChNT0RMSUIpL3NvdXJjZQo+ICAJQGlmIFsgISAkKG9ianRyZWUpIC1lZiAgJChNT0RMSUIpL2J1
aWxkIF07IHRoZW4gXAo+ICAJCXJtIC1mICQoTU9ETElCKS9idWlsZCA7IFwKPiAgCQlsbiAtcyAk
KENVUkRJUikgJChNT0RMSUIpL2J1aWxkIDsgXAo+ICAJZmkKPiAgCUBzZWQgJ3M6XlwoLipcKVwu
byQkOmtlcm5lbC9cMS5rbzonIG1vZHVsZXMub3JkZXIgPiAkKE1PRExJQikvbW9kdWxlcy5vcmRl
cgo+ICtlbmRpZgo+ICAJQGNwIC1mIG1vZHVsZXMuYnVpbHRpbiAkKE1PRExJQikvCj4gIAlAY3Ag
LWYgJChvYmp0cmVlKS9tb2R1bGVzLmJ1aWx0aW4ubW9kaW5mbyAkKE1PRExJQikvCj4gIAo+IC1l
bmRpZiAjIENPTkZJR19NT0RVTEVTCj4gLQo+ICAjIyMKPiAgIyBDbGVhbmluZyBpcyBkb25lIG9u
IHRocmVlIGxldmVscy4KPiAgIyBtYWtlIGNsZWFuICAgICBEZWxldGUgbW9zdCBnZW5lcmF0ZWQg
ZmlsZXMKPiBAQCAtMTkwOCw2ICsxOTEwLDEzIEBAIGhlbHA6Cj4gIAlAZWNobyAgJyAgY2xlYW4g
ICAgICAgICAgIC0gcmVtb3ZlIGdlbmVyYXRlZCBmaWxlcyBpbiBtb2R1bGUgZGlyZWN0b3J5IG9u
bHknCj4gIAlAZWNobyAgJycKPiAgCj4gK19fZXh0ZXJuYWxfbW9kdWxlc19lcnJvcjoKPiArCUBl
Y2hvID4mMiAnKioqJwo+ICsJQGVjaG8gPiYyICcqKiogVGhlIHByZXNlbnQga2VybmVsIGRpc2Fi
bGVkIENPTkZJR19NT0RVTEVTLicKPiArCUBlY2hvID4mMiAnKioqIFlvdSBjYW5ub3QgYnVpbGQg
b3IgaW5zdGFsbCBleHRlcm5hbCBtb2R1bGVzLicKPiArCUBlY2hvID4mMiAnKioqJwo+ICsJQGZh
bHNlCj4gKwo+ICBlbmRpZiAjIEtCVUlMRF9FWFRNT0QKPiAgCj4gICMgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gQEAgLTE5NDQsMTMgKzE5NTMsMTAgQEAgZWxzZSAjIENPTkZJR19NT0RVTEVTCj4gICMg
TW9kdWxlcyBub3QgY29uZmlndXJlZAo+ICAjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAKPiAtbW9k
dWxlcyBtb2R1bGVzX2luc3RhbGw6Cj4gLQlAZWNobyA+JjIgJyoqKicKPiAtCUBlY2hvID4mMiAn
KioqIFRoZSBwcmVzZW50IGtlcm5lbCBjb25maWd1cmF0aW9uIGhhcyBtb2R1bGVzIGRpc2FibGVk
LicKPiAtCUBlY2hvID4mMiAnKioqIFRvIHVzZSB0aGUgbW9kdWxlIGZlYXR1cmUsIHBsZWFzZSBy
dW4gIm1ha2UgbWVudWNvbmZpZyIgZXRjLicKPiAtCUBlY2hvID4mMiAnKioqIHRvIGVuYWJsZSBD
T05GSUdfTU9EVUxFUy4nCj4gLQlAZWNobyA+JjIgJyoqKicKPiAtCUBleGl0IDEKPiArUEhPTlkg
Kz0gX19leHRlcm5hbF9tb2R1bGVzX2Vycm9yCj4gKwo+ICttb2R1bGVzIG1vZHVsZXNfaW5zdGFs
bDogX19leHRlcm5hbF9tb2R1bGVzX2Vycm9yCj4gKwlAOgo+ICAKPiAgS0JVSUxEX01PRFVMRVMg
Oj0KPiAgCj4gLS0gCj4gMi4zOS4yCgotLSAKZXBvc3R8eG1wcDogbmljb2xhc0BmamFzbGUuZXUg
ICAgICAgICAgaXJjOi8vb2Z0Yy5uZXQvbnNjCuKGsyBncGc6IDE4ZWQgNTJkYiBlMzRmIDg2MGUg
ZTlmYiAgYzgyYiA3ZDk3IDA5MzIgNTVhMCBjZTdmCiAgICAgLS0gZnJ5a3RlbiBmb3IgaGVycmVu
IGVyIG9wcGhhdiB0aWwga3VubnNrYXAgLS0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBz
LWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
