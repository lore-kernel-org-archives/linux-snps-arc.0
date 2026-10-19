Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006E4CCF2D3
	for <linux-snps-arc@archiver.kernel.org>; Mon, 19 Oct 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wvbh5+AHWqyJuJud2Ldu6dq72qu/AQqiIDAOKeV7qMY=; b=ovBQEIkywr/TdtMXCGfJAykR1U
	nmjHMnJoClkjjN9WRmlAqQYGztG9VMRiIE7JliQL8Z6/UKt1pwgR/nOZgDPSRCtDSUYgyOJCOPkXg
	AOlqD0vc9MPRXoLGHzInO/HBMIlVQ9Uds3sHURxfj9pj0HxvLydIvsoXdvcAjxlwgrjpAyS98ud7C
	j/L0tklNwxRmDdb8X8C94R4h53uuaxjqLixN2G7/QJhRM5nHamiu39zvOkDanHTctqkupNYx7PNAT
	ZozuemExTuX8GyhaeUb5z4U3lgIdF6UhmbyzSWdDpNMgbXA/oxZ28hU7Uh23dJ8Xf6gB6tp4yyqQI
	XdSaIMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlMW-00000007Gp7-1Ugv;
	Mon, 19 Oct 2026 11:17:04 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlMS-00000007GoU-0P6l
	for linux-snps-arc@lists.infradead.org;
	Mon, 19 Oct 2026 11:17:03 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B948E7A00AE
	for <linux-snps-arc@lists.infradead.org>; Mon, 19 Oct 2026 07:16:58 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 07:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792408615;
	 x=1792495015; bh=zgLYa/JnxT/8EIQ/TE2CX6B+wBarwWr0qwjQhA9dpNI=; b=
	b9d7dDhE9PatOGwZBYyfkXv3N3OjEFxIPcP3FItJP4pZeMhgK9InPcYIaBjpDOtq
	d+FKaldDcFyG6HsPEjdruPhwf/rhWdfenmcIQWxN2M7Qn/QKcI8AJNgw8nolYIsK
	DTGExytUlEnhp0xBt81fHxzcRUQ9oCHG8PuzUQexVOfVA4fjfkUuRksqs1admKbs
	nWP33JQCAWF1VOnM6wk2x0CzGkBRr+r4SVb9HkWvNtPmGYwfN/FphQzxzd0s++3A
	mFF1EdItiemGEvO0PN9jQm7KUeA7lA8kx2MneLi8J/VERryhqT5TgcdoOBSDYzaV
	6MaLNbD2m+VG+U0SyQkkEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792408615; x=
	1792495015; bh=zgLYa/JnxT/8EIQ/TE2CX6B+wBarwWr0qwjQhA9dpNI=; b=r
	DB3KOnxG8B8v7pIH2IVJwBK6wpdcjQl1Rr5eZjm2eVJrvU5Eel78XLQOP0QWnl5E
	VFct/6DAZOU7ozsnfU+nPmpi/4U7dOqcDpa2PGLigpf3dPKyKFb2sizoCJlzxZcA
	6638nm7LgI41Jp+ElTp6OxN/jc/Kbh8MMLGcY9k2/97fn3esDoMvy90+ZxS6w+Hx
	Z8uS2qNH1IBsLVryeS6ciLmyca0GOMJGu34urEui/ka1AgkUoM8l06jxVNhOh+Or
	AA9YfqAuZ1WOCOAGqL5n/TzJYcmxumjxhJYJn+iQKVmeNEGCrJgHJYdDHRt2AxRw
	9c53KgKiX/V700NJvz1IA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792408615; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm1:rsa-sha256:fw9QfAsJ6pr3cqyUZSKao6J37eVwuOeoaSFh7/ZpR9+MTCH
	+VPsFGWEIlFUmY+di9Z5jOMpl/GjK7SyGuH5ocTn0C878BCt9lT1ObBHdj4Q6atJ
	19sDobAcz1yZgYKMDRFIoBa5wMG2tKBzP4KDxzye2stmSG2N7H48jjGgq5w7aCPp
	cg8hXtMc1MjYeWDpeBGyvVmlr1I8wgiRhiVSFMzFiX8sisk6SZ+MTN/ZkwulXldj
	vPnWu7z5X/asIJ3gxR0umO5mO3kUt0bWp/I6S6Tzq0sqBwA0fvpEANsyEwJWEdyp
	hyqeqio7jvb+r2oYDwenVnBj1pUb09aHwVzEGiA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zJKx6kBh4q2kkDyKsibzk02wNoyknxOpIXYcNiMoR90=:O+NWByob2gVZL0+tsbFgHWpFXaQuqITlhKc4tDqFErw=;
X-ME-Sender: <xms:I_zVarT5Lgv-2DoJUZgLQMZFY97RfuFlkPOeDxLbChcpwDkB2Qksvg>
    <xme:I_zVannd1hxnR8nmeYawmXognSuRkBoL3a_hs9rbym3hZQJt8IjFV1glt28N99gQY
    fu6w9bRmiYXB-nWDWe1G6hFJ-SghD1tmgYdCicUU8KWRLCeQT4tpufs>
X-ME-Proxy-Cause: dmFkZTEePN2YjTBxNqBq6SGh7R9IGsuxzB9KQLpmOmK8t2xw8fGIOVtNR0QZoXk1P/Q/g8
    OZkIR4pW2xOs+HI1XHcf+t3+iGN20YB/VTDRi4vrloTts1K8NgzN7aN5327SNIuAdTv0Q+
    5Ecv0zod5j88/5rvNstwTWrgPmUQCScJJlL6HsmGB9E4+Rn5sVUO3X32XsclpFyb50Vsmf
    MDGOrh8xHZmUqqduCMKeCeXdnrT2XpHr1ajdCNwUikRiFq8J+7h/2XWE5S/qFlSpZPUwBe
    o5UPjj51lL0iGsTrdo2NNCpri1PwEv6O2DvJpnWeqk2HX0AGUcLvuxKBmaeeuV7JCfy3Z7
    6NBS/rrbaeTm8NwGyEwtTfVp0wMI6Cuf5GhOq1BoBYD/8a1ZoTEJtGZcAYkueo0jSq/zzA
    Y9V6WDXeM6wQrG9B9vYcuphhepJHG4ekCh1ZGYTOetk22buwMQVjBMyT7CUsS/LwXo/+er
    /Df7BxOS2YRh2E+zDNem3o3CNOV0C9PEX7Jy3k33LXVU7hSMkZ3wopMqF3jeHmDEcFrNWM
    Mlj3yB6zOtWaruwSGlFZUK6WV66erjBVjCEyUskQ3owvfv9iiLHZAFfvWIoEvsuQ3AU+SD
    c0pGq6O1qaHeG3qT88Uu4eqisdG9ZLZhSAwYM8log1bxF8ZXMuAO3rMqC+DQ
X-ME-Proxy: <xmx:JfzValXUnZpTpDusRZV1vLvtQNbAWaxKSU_Ak8W6Lc_-sq4oelrcog>
    <xmx:JfzVai-ecXK3lnBb4vQ-CR1vgF378ComkXeXPHiPsaIpauZrZ1Bx-Q>
    <xmx:JfzVaosL1TyTy9XB4kT8GI18YvMZt0yb62eACVS7DlxHs2B85iIcDQ>
    <xmx:JfzVai01-RAq6QmJxGw7hgGwPqm4wTvrzdsD_gLN5rNWuOW874IkTg>
    <xmx:J_zVajy6JIXpwrovofzYrk4T4uBzCgl6TpTFIuJIaSYYt_YkaFgkYAtw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6352A32A008E; Mon, 19 Oct 2026 07:16:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2HaaWELKR9F
Date: Mon, 19 Oct 2026 13:16:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Ley Foon Tan" <lftan@altera.com>
Cc: linux-kernel@vger.kernel.org, "kernel test robot" <lkp@intel.com>,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
Message-Id: <47eb6b48-d664-440f-84b6-ba09f34d5e08@app.fastmail.com>
In-Reply-To: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
References: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
Subject: Re: [PATCH] nios2: ksyms: Declare __mulsi3 export
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_041700_468374_67CA824E 
X-CRM114-Status: GOOD (  11.35  )
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

T24gTW9uLCBPY3QgMTksIDIwMjYsIGF0IDExOjQ5LCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToK
PiBHQ0MgbWF5IGVtaXQgbGliY2FsbHMgdG8gX19tdWxzaTMoKS4gQXMgbW9kcG9zdCBpcyBub3Qg
YXdhcmUgdGhhdCB0aGlzCj4gZnVuY3Rpb24gaXMgcHJvdmlkZWQgdGhyb3VnaCB0aGUgbGlua2Vk
IGluIGxpYmdjYywgaXQgZmFpbHM6Cj4KPiBFUlJPUjogbW9kcG9zdDoga2VybmVsL2xvY2tpbmcv
dGVzdC13d19tdXRleC5rbzogc3ltYm9sICdfX211bHNpMycgdW5kZWZpbmVkIQo+IEVSUk9SOiBt
b2Rwb3N0OiBrZXJuZWwvdGltZS90ZXN0X3VkZWxheS5rbzogc3ltYm9sICdfX211bHNpMycgdW5k
ZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0OiBrZXJuZWwvcmVzb3VyY2Vfa3VuaXQua286IHN5bWJv
bCAnX19tdWxzaTMnIHVuZGVmaW5lZCEKPiBFUlJPUjogbW9kcG9zdDogZnMvZnVzZS92aXJ0aW9m
cy5rbzogc3ltYm9sICdfX211bHNpMycgdW5kZWZpbmVkIQo+IGV0Yy4KPgo+IE1ha2Ugc3VyZSBt
b2Rwb3N0IGNhbiBzZWUgdGhlIHN5bWJvbCBmcm9tIGxpYmdjYy4KPgo+IFJlcG9ydGVkLWJ5OiBr
ZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBDbG9zZXM6IAo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjEwMTcxOTMzLko0YkZPZkw4LWxrcEBpbnRl
bC5jb20vCj4gRml4ZXM6IDJmYzg0ODNmZGNkZSAoIm5pb3MyOiBCdWlsZCBpbmZyYXN0cnVjdHVy
ZSIpCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVo
QGxpbnV0cm9uaXguZGU+CgpBY2tlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
ClRoZSBwYXRjaCBsb29rcyBjb3JyZWN0IHRvIG1lLCBidXQgaXQgd291bGQgYWxzbyBiZSBuaWNl
IHRvIG5vdCB1c2UKbGliZ2NjIGF0IGFsbC4gV2hhdCBJIHNlZSBpcyB0aGF0IG9ubHkgYXJjLCBu
aW9zMiwgb3BlbnJpc2MgYW5kCnBhcmlzYyBzdGlsbCBsaW5rIGFnYWluc3QgdGhlIHRvb2xjaGFp
bi1wcm92aWRlZCBsaWJnY2MsIGV2ZXJ5dGhpbmcKZWxzZSB1c2VzIHRoZSBrZXJuZWwncyBvd24g
cnVudGltZS4KCkl0J3MgcHJvYmFibHkgbm90IGV2ZW4gdGhhdCBoYXJkIHRvIGRvIHJpZ2h0LCBo
ZXJlIGlzIHdoYXQgSSBmb3VuZAppcyBpbXBvcnRlZCBmcm9tIGxpYmdjYy4KCiogR2VuZXJpYyBs
aWJyYXJ5IGhlbHBlciBleGlzdHMsIGNhbiBiZSBlbmFibGVkIHRocm91Z2ggS2NvbmZpZzoKCj09
PSBfX2xzaHJkaTMgPT09CmFyY2gvYXJjL2tlcm5lbC9hcmNrc3ltcy5jCmFyY2gvbmlvczIva2Vy
bmVsL25pb3MyX2tzeW1zLmMKYXJjaC9vcGVucmlzYy9rZXJuZWwvb3IzMl9rc3ltcy5jCmFyY2gv
cGFyaXNjL2tlcm5lbC9wYXJpc2Nfa3N5bXMuYwotPiBsaWIvbHNocmRpMy5jCj09PSBfX2FzaGxk
aTMgPT09CmFyY2gvYXJjL2tlcm5lbC9hcmNrc3ltcy5jCmFyY2gvbmlvczIva2VybmVsL25pb3My
X2tzeW1zLmMKYXJjaC9vcGVucmlzYy9rZXJuZWwvb3IzMl9rc3ltcy5jCmFyY2gvcGFyaXNjL2tl
cm5lbC9wYXJpc2Nfa3N5bXMuYwotPiBsaWIvYXNobGRpMy5jCj09PSBfX2FzaHJkaTMgPT09CmFy
Y2gvYXJjL2tlcm5lbC9hcmNrc3ltcy5jCmFyY2gvbmlvczIva2VybmVsL25pb3MyX2tzeW1zLmMK
YXJjaC9vcGVucmlzYy9rZXJuZWwvb3IzMl9rc3ltcy5jCmFyY2gvcGFyaXNjL2tlcm5lbC9wYXJp
c2Nfa3N5bXMuYwotPiBsaWIvYXNocmRpMy5jCj09PSBfX2NtcGRpMiA9PT0KYXJjaC9hcmMva2Vy
bmVsL2FyY2tzeW1zLmMKLT4gbGliL2NtcGRpMi5jCj09PSBfX211bGRpMyA9PT0KYXJjaC9hcmMv
a2VybmVsL2FyY2tzeW1zLmMKYXJjaC9uaW9zMi9rZXJuZWwvbmlvczJfa3N5bXMuYwphcmNoL29w
ZW5yaXNjL2tlcm5lbC9vcjMyX2tzeW1zLmMKYXJjaC9wYXJpc2Mva2VybmVsL3BhcmlzY19rc3lt
cy5jCi0+IGxpYi9tdWxkaTMuYwo9PT0gX191Y21wZGkyID09PQphcmNoL2FyYy9rZXJuZWwvYXJj
a3N5bXMuYwphcmNoL25pb3MyL2tlcm5lbC9uaW9zMl9rc3ltcy5jCmFyY2gvb3BlbnJpc2Mva2Vy
bmVsL29yMzJfa3N5bXMuYwphcmNoL3BhcmlzYy9rZXJuZWwvcGFyaXNjX2tzeW1zLmMKLT4gbGli
L3VjbXBkaTIuYwoKKiA2NC1iaXQgZGl2aXNpb24gcHJvYmFibHkgc2hvdWxkIG5vdCBiZSBwcm92
aWRlZCBvbiBhcmMgb3IKICBuaW9zMiAoYW5kIHNwYXJjMzIsIHdoaWNoIGhhcyBhIHByaXZhdGUg
Y29weSkuCiAgcGFyaXNjNjQgc2hvdWxkIGdldCB0aGVzZSBmcm9tIGxpYmdjYy9saWJnY2MyLmMu
Cgo9PT0gX19kaXZkaTMgPT09CmFyY2gvcGFyaXNjL2tlcm5lbC9wYXJpc2Nfa3N5bXMuYwo9PT0g
X191ZGl2bW9kZGk0ID09PQphcmNoL25pb3MyL2tlcm5lbC9uaW9zMl9rc3ltcy5jCj09PSBfX3Vk
aXZkaTMgPT09CmFyY2gvYXJjL2tlcm5lbC9hcmNrc3ltcy5jCmFyY2gvcGFyaXNjL2tlcm5lbC9w
YXJpc2Nfa3N5bXMuYwo9PT0gX191bW9kZGkzID09PQphcmNoL25pb3MyL2tlcm5lbC9uaW9zMl9r
c3ltcy5jCmFyY2gvcGFyaXNjL2tlcm5lbC9wYXJpc2Nfa3N5bXMuYwo9PT0gX19tb2RkaTMgPT09
CmFyY2gvbmlvczIva2VybmVsL25pb3MyX2tzeW1zLmMKYXJjaC9wYXJpc2Mva2VybmVsL3Bhcmlz
Y19rc3ltcy5jCgoqIGZsb2F0aW5nLXBvaW50IG1hdGggc2hvdWxkIG5vdCBiZSBwcm92aWRlZCBi
eSBrZXJuZWw6Cgo9PT0gX19kaXZkZjMgPT09CmFyY2gvYXJjL2tlcm5lbC9hcmNrc3ltcy5jCj09
PSBfX2RpdnNmMyA9PT0KYXJjaC9hcmMva2VybmVsL2FyY2tzeW1zLmMKPT09IF9fZml4dW5zZGZz
aSA9PT0KYXJjaC9hcmMva2VybmVsL2FyY2tzeW1zLmMKPT09IF9fZmxvYXR1bnNpZGYgPT09CmFy
Y2gvYXJjL2tlcm5lbC9hcmNrc3ltcy5jCj09PSBfX2Zsb2F0dW5zaXNmID09PQphcmNoL2FyYy9r
ZXJuZWwvYXJja3N5bXMuYwo9PT0gX19tdWxkZjMgPT09CmFyY2gvYXJjL2tlcm5lbC9hcmNrc3lt
cy5jCgoqIG5vIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gaW4ga2VybmVsLCBuZWVkIHRvIGNvcHkg
ZnJvbQogIGxpYmdjYy9saWIxZnVuY3MuUyBjb2RlOgoKPT09IF9fZGl2c2kzID09PQphcmNoL2Fy
Yy9rZXJuZWwvYXJja3N5bXMuYwphcmNoL25pb3MyL2tlcm5lbC9uaW9zMl9rc3ltcy5jCmFyY2gv
b3BlbnJpc2Mva2VybmVsL29yMzJfa3N5bXMuYwotPiBhcmNoL2FybS9saWIvbGliMWZ1bmNzLlMK
ICAgYXJjaC9tNjhrL2xpYi9kaXZzaTMuUwogICBhcmNoL21pY3JvYmxhemUvbGliL2RpdnNpMy5T
CiAgIGFyY2gveHRlbnNhL2xpYi9kaXZzaTMuUwo9PT0gX19tb2RzaTMgPT09CmFyY2gvYXJjL2tl
cm5lbC9hcmNrc3ltcy5jCmFyY2gvbmlvczIva2VybmVsL25pb3MyX2tzeW1zLmMKYXJjaC9vcGVu
cmlzYy9rZXJuZWwvb3IzMl9rc3ltcy5jCi0+IGFyY2gvbTY4ay9saWIvbW9kc2kzLlMKICAgYXJj
aC9taWNyb2JsYXplL2xpYi9tb2RzaTMuUwogICBhcmNoL3h0ZW5zYS9saWIvbW9kc2kzLlMKPT09
IF9fdWRpdnNpMyA9PT0KYXJjaC9hcmMva2VybmVsL2FyY2tzeW1zLmMKYXJjaC9uaW9zMi9rZXJu
ZWwvbmlvczJfa3N5bXMuYwphcmNoL29wZW5yaXNjL2tlcm5lbC9vcjMyX2tzeW1zLmMKLT4gYXJj
aC9hcm0vbGliL2xpYjFmdW5jcy5TCiAgIGFyY2gvbTY4ay9saWIvdWRpdnNpMy5TCiAgIGFyY2gv
bWljcm9ibGF6ZS9saWIvdWRpdnNpMy5TCiAgIGFyY2gvc2gvbGliL3VkaXZzaTMuUwogICBhcmNo
L3h0ZW5zYS9saWIvdWRpdnNpMy5TCj09PSBfX3Vtb2RzaTMgPT09CmFyY2gvYXJjL2tlcm5lbC9h
cmNrc3ltcy5jCmFyY2gvbmlvczIva2VybmVsL25pb3MyX2tzeW1zLmMKYXJjaC9vcGVucmlzYy9r
ZXJuZWwvb3IzMl9rc3ltcy5jCi0+IGFyY2gvYXJtL2xpYi9saWIxZnVuY3MuUwogICBhcmNoL202
OGsvbGliL3Vtb2RzaTMuUwogICBhcmNoL21pY3JvYmxhemUvbGliL3Vtb2RzaTMuUwogICBhcmNo
L3h0ZW5zYS9saWIvdW1vZHNpMy5TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
