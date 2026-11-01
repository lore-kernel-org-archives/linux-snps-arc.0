Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A223E606A31A
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2026 00:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0QN4oPOV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSJi3sDz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PRvFk1Fy1DrzWeTCLfxcuAqwktDORnd4W8amehEy0V8=; b=0QN4oPOVQ79GL4mCV9wR3lIBw7
	QOV2ozzM6wnO7Ymmaqy15znzQYSa0L1sPE3b9x+3ynUyVldE6w7MMd0zhE102ATd85EMswrqqC1+K
	TcA7TuczHkj9LAHeAyT/7CpwfeIJ6FcWzRODXXKeh02MF7FeCTzNYsaGYw32JDmRZyp3nXrRxq80N
	wufEaSCxcNvIHdMtdGaYIByQstpK/9ZcgmS3MroNGTVrRljr2iUTo85LH7J7tYnkWXxWAzMO6/d+G
	yo8/VQmXuabR/t+x7sQZ3tNARWto0jNPF6+PItDHSKW6/hajCkZvW8Gkyns6G06DI6zakiUJHuoq0
	l0TYtS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNJPa-0000000Dllv-0YXU;
	Sun, 01 Nov 2026 00:27:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNJPY-0000000Dlll-03vS
	for linux-snps-arc@lists.infradead.org;
	Sun, 01 Nov 2026 00:27:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 12DDA60054;
	Sun,  1 Nov 2026 00:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9621F000C1;
	Sun,  1 Nov 2026 00:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793492818;
	bh=LC77J+RN6Dhy59laDBKh+N+IhdE7yeQVClWRQIT4qUg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=LSJi3sDzqNH53xwgmCQVRjs5P3KxhDowBzhYuUU8msQ2AgB7lpotYxsHRrJG0iClj
	 kpIrcXC40v6h63d1PdapIP12ArfdiJoWwpWDXHQdq1no5M4gvXZ0KVb1XNuiiAzYu3
	 7GzqVw2Pcn1U1Xz+6nbGQwhOSWakM7WMwGBaWsl0hqb34ftplQn7PLgeKJqsCD/XNW
	 t3n1MCHTs76kO1sksUX6LYr948fLQUWPWTcEIgxOf/3lq2NM/mgiXEsL4sbiIBLwpB
	 KX6+RWCZD+IEqyN0t4epgjEdQspqh8J59zPctS4a5HZB/Owc8dTCb/rOIVtS1AqPO0
	 aIxSiDg5CFOUw==
Message-ID: <e9f9ac85-442a-4bcc-8ec6-a03a6519178d@kernel.org>
Date: Sat, 31 Oct 2026 17:26:55 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nios2: ksyms: Declare __mulsi3 export
From: Vineet Gupta <vgupta@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 Ley Foon Tan <lftan@altera.com>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
References: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
 <47eb6b48-d664-440f-84b6-ba09f34d5e08@app.fastmail.com>
 <3175caa0-9f49-465d-959e-6b6c9bbb4f01@kernel.org>
Content-Language: en-US
In-Reply-To: <3175caa0-9f49-465d-959e-6b6c9bbb4f01@kernel.org>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMzEvMjYgMTY6NTcsIFZpbmVldCBHdXB0YSB3cm90ZToKPj4gKiBubyBnZW5lcmljIGlt
cGxlbWVudGF0aW9uIGluIGtlcm5lbCwgbmVlZCB0byBjb3B5IGZyb20KPj4gICAgIGxpYmdjYy9s
aWIxZnVuY3MuUyBjb2RlOgo+Pgo+PiA9PT0gX19kaXZzaTMgPT09Cj4+IGFyY2gvYXJjL2tlcm5l
bC9hcmNrc3ltcy5jCj4+IGFyY2gvbmlvczIva2VybmVsL25pb3MyX2tzeW1zLmMKPj4gYXJjaC9v
cGVucmlzYy9rZXJuZWwvb3IzMl9rc3ltcy5jCj4+IC0+IGFyY2gvYXJtL2xpYi9saWIxZnVuY3Mu
Uwo+PiAgICAgIGFyY2gvbTY4ay9saWIvZGl2c2kzLlMKPj4gICAgICBhcmNoL21pY3JvYmxhemUv
bGliL2RpdnNpMy5TCj4+ICAgICAgYXJjaC94dGVuc2EvbGliL2RpdnNpMy5TCj4+ID09PSBfX21v
ZHNpMyA9PT0KPj4gYXJjaC9hcmMva2VybmVsL2FyY2tzeW1zLmMKPj4gYXJjaC9uaW9zMi9rZXJu
ZWwvbmlvczJfa3N5bXMuYwo+PiBhcmNoL29wZW5yaXNjL2tlcm5lbC9vcjMyX2tzeW1zLmMKPj4g
LT4gYXJjaC9tNjhrL2xpYi9tb2RzaTMuUwo+PiAgICAgIGFyY2gvbWljcm9ibGF6ZS9saWIvbW9k
c2kzLlMKPj4gICAgICBhcmNoL3h0ZW5zYS9saWIvbW9kc2kzLlMKPj4gPT09IF9fdWRpdnNpMyA9
PT0KPj4gYXJjaC9hcmMva2VybmVsL2FyY2tzeW1zLmMKPj4gYXJjaC9uaW9zMi9rZXJuZWwvbmlv
czJfa3N5bXMuYwo+PiBhcmNoL29wZW5yaXNjL2tlcm5lbC9vcjMyX2tzeW1zLmMKPj4gLT4gYXJj
aC9hcm0vbGliL2xpYjFmdW5jcy5TCj4+ICAgICAgYXJjaC9tNjhrL2xpYi91ZGl2c2kzLlMKPj4g
ICAgICBhcmNoL21pY3JvYmxhemUvbGliL3VkaXZzaTMuUwo+PiAgICAgIGFyY2gvc2gvbGliL3Vk
aXZzaTMuUwo+PiAgICAgIGFyY2gveHRlbnNhL2xpYi91ZGl2c2kzLlMKPj4gPT09IF9fdW1vZHNp
MyA9PT0KPj4gYXJjaC9hcmMva2VybmVsL2FyY2tzeW1zLmMKPj4gYXJjaC9uaW9zMi9rZXJuZWwv
bmlvczJfa3N5bXMuYwo+PiBhcmNoL29wZW5yaXNjL2tlcm5lbC9vcjMyX2tzeW1zLmMKPj4gLT4g
YXJjaC9hcm0vbGliL2xpYjFmdW5jcy5TCj4+ICAgICAgYXJjaC9tNjhrL2xpYi91bW9kc2kzLlMK
Pj4gICAgICBhcmNoL21pY3JvYmxhemUvbGliL3Vtb2RzaTMuUwo+PiAgICAgIGFyY2gveHRlbnNh
L2xpYi91bW9kc2kzLlMKPiBBUkN2MiBoYXMgaGFyZHdhcmUgZGl2aWRlIHNvIHRoZXNlIGFyZSBu
b3QgbmVlZGVkLCBidXQgQVJDNzAwIGRvZXNuJ3QKPiBhbmQgdGhlcmUncyBhIHRvbiBvZiBjYWxs
cyBmb3IgdGhvc2UuCj4KPiDilIzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilKzi
lIDilIDilIDilIDilIDilIDilIDilKzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lJAKPiDilILCoCByb3V0aW5lwqAg4pSCIGNhbGxzIOKUgiBmdW5jdGlvbnMg4pSCCj4g4pSc4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS8
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSkCj4g4pSCIF9fdWRpdnNpMyDilIIg
NDE1wqAgwqDilIIgMjM4wqAgwqAgwqAgwqDilIIKPiDilJzilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilKQKPiDilIIgX191bW9kc2kzIOKUgiAyMDPCoCDCoOKUgiAxMzHCoCDC
oCDCoCDCoOKUggo+IOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUpAo+
IOKUgiBfX2RpdnNpM8KgIOKUgiA3N8KgIMKgIOKUgiA1N8KgIMKgIMKgIMKgIOKUggo+IOKUnOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
vOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUpAo+IOKUgiBfX21vZHNpM8KgIOKU
giA0McKgIMKgIOKUgiAzM8KgIMKgIMKgIMKgIOKUggo+IOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUmAo+Cj4gSSBjYW4gdGFrZSBhIHN0YWIgYXQgcHJvdmlkaW5nIHRo
ZSBnZW5lcmljIGxpYmdjYyBpbXBsZW1lbnRhdGlvbiBpbgo+IGxpYi8qIGJ1dCBJIG9ubHkgZXhw
ZWN0IHRoZSBhcmNoZXMgdXNpbmcgbGliZ2NjIHZlcnNpb24gdG8gc3dpdGNoLgoKSXQgc2VlbXMg
dGhlcmUgNCBhcmUgYWx3YXlzIG5lZWRlZCB0b2dldGhlciBvciBub3QgYXQgYWxsLgpEbyB3ZSB3
YW50IDQgS2NvbmZpZyBnYXRlcyBvciBqdXN0IG9uZSB3aWxsIHN1ZmZpY2UgPwoKVGh4LAotVmlu
ZWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
