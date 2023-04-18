Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89838C77B75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Apr 2023 07:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUmiHH6TTxjbSrdTg7w7huZQfGEcgXGetJZhkSEAvgY=; b=LM//wBGksdLR4Vk6NloJAL4Rur
	n9ugN2ZItuXwSklunJcaQHB2A602Ill26h6m8/5S6XxTMVSSs9NKcCCGpnglfgKHjtPT9YYBYv4SI
	0gtrfun2ZKAJPQdMRfYSCXAfS6wVPYJEvKqmTD0Dh1vFzIo2V3b7ZMjJdxAxHPVJ2X0b7JYpD7zFK
	l4zyyv4KSJnQlNgupoboyyv9mE8gK3jr5E+hvJVLZFp5RicUDGKlztu7DQ9+CBNnEnF125KDQvge+
	Qkegw+49fceM79g7pZyLb143cd1qqvHy9AUi3CwZlvSsJpJFVQ2iQmB2Ajt2L/raEEL0ZdW+nm3KA
	X67J7XsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pog1S-001Azo-2R;
	Tue, 18 Apr 2023 07:45:06 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pog1O-001AxS-1k;
	Tue, 18 Apr 2023 07:45:03 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1CEA11F8D5;
	Tue, 18 Apr 2023 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681803900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k4kCGiDu7eZCY2kHWyBi9arEU5jU+OwaWl9LlmgBgTo=;
	b=01AbIdbC2ZN0fhxv/iYxLgj8ciDX6tD9uCd3cIhELGAw4YSRK9w6/GGAiuAaLtZg7KlYip
	UPvsdBcpWNtNJ71zbqUvLKTD1lA83nSqPPrphOIt3mJsfodK1zfwzqX4BEKAaXkUnOToit
	aPED/mfiOl6WMMIYqzVnNBr0VoJ5y+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681803900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k4kCGiDu7eZCY2kHWyBi9arEU5jU+OwaWl9LlmgBgTo=;
	b=Rmm87b7uMzS061Xyb6C7LuYQh7WlZOBtlpx0lMkwJOlh/1UTUlnJfZxcIJZTcTRQYKl8ZJ
	E719xeledovycCBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B324C139CC;
	Tue, 18 Apr 2023 07:44:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id lXeyKntKPmTxagAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Apr 2023 07:44:59 +0000
Message-ID: <5fa98536-a4b0-7b71-7342-9ba05158062f@suse.de>
Date: Tue, 18 Apr 2023 09:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 00/19] arch: Consolidate <asm/fb.h>
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20230417125651.25126-1-tzimmermann@suse.de>
 <1641007d-7953-426a-a3de-ca9c90f6c5a9@app.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1641007d-7953-426a-a3de-ca9c90f6c5a9@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_004502_729697_253266ED 
X-CRM114-Status: GOOD (  15.66  )
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
Content-Type: multipart/mixed; boundary="===============7910526148887166171=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7910526148887166171==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rFRj0NtGM3Zijx0xyHfeKvB1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rFRj0NtGM3Zijx0xyHfeKvB1
Content-Type: multipart/mixed; boundary="------------18o4xqtdrHnA7yRGq0Gjgi9D";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Message-ID: <5fa98536-a4b0-7b71-7342-9ba05158062f@suse.de>
Subject: Re: [PATCH v3 00/19] arch: Consolidate <asm/fb.h>
References: <20230417125651.25126-1-tzimmermann@suse.de>
 <1641007d-7953-426a-a3de-ca9c90f6c5a9@app.fastmail.com>
In-Reply-To: <1641007d-7953-426a-a3de-ca9c90f6c5a9@app.fastmail.com>

--------------18o4xqtdrHnA7yRGq0Gjgi9D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDQuMjMgdW0gMTY6MTIgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBP
biBNb24sIEFwciAxNywgMjAyMywgYXQgMTQ6NTYsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gVmFyaW91cyBhcmNoaXRlY3R1cmVzIHByb3ZpZGUgPGFzbS9mYi5oPiB3aXRoIGhl
bHBlcnMgZm9yIGZiZGV2DQo+PiBmcmFtZWJ1ZmZlciBkZXZpY2VzLiBTaGFyZSB0aGUgY29u
dGFpbmVkIGNvZGUgd2hlcmUgcG9zc2libGUuIFRoZXJlDQo+PiBpcyBhbHJlYWR5IDxhc20t
Z2VuZXJpYy9mYi5oPiwgd2hpY2ggaW1wbGVtZW50cyBnZW5lcmljIChhcyBpbg0KPj4gJ2Vt
cHR5JykgZnVuY3Rpb25zIG9mIHRoZSBmYmRldiBoZWxwZXJzLiBUaGUgaGVhZGVyIHdhcyBh
ZGRlZCBpbg0KPj4gY29tbWl0IGFhZmU0ZGJlZDBiZiAoImFzbS1nZW5lcmljOiBhZGQgZ2Vu
ZXJpYyB2ZXJzaW9ucyBvZiBjb21tb24NCj4+IGhlYWRlcnMiKSwgYnV0IG5ldmVyIHVzZWQu
DQo+Pg0KPj4gRWFjaCBwZXItYXJjaGl0ZWN0dXJlIGhlYWRlciBmaWxlIGRlY2xhcmVzIGFu
ZC9vciBpbXBsZW1lbnRzIGZiZGV2DQo+PiBoZWxwZXJzIGFuZCBkZWZpbmVzIGEgcHJlcHJv
Y2Vzc29yIHRva2VuIGZvciBlYWNoLiBUaGUgZ2VuZXJpYw0KPj4gaGVhZGVyIHRoZW4gcHJv
dmlkZXMgdGhlIHJlbWFpbmluZyBoZWxwZXJzLiBJdCB3b3JrcyBsaWtlIHRoZSBJL08NCj4+
IGhlbHBlcnMgaW4gPGFzbS9pby5oPi4NCj4gDQo+IExvb2tzIGFsbCBnb29kIHRvIG1lLA0K
PiANCj4gQWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQoNClRoYW5r
cyBhIGxvdC4gSSBrbm93IHRoYXQgSGVsZ2Ugd2FudHMgdG8gdGVzdCB0aGUgUEFSSVNDIGNo
YW5nZXMsIHNvIA0KSSdsbCBrZWVwIHRoaXMgc2VyaWVzIHBlbmRpbmcgZm9yIGEgYml0IGxv
bmdlci4gSSdkIGxpa2UgdG8gbWVyZ2UgdGhlIA0KcGF0Y2hlcyB0aHJvdWdoIHRoZSBEUk0g
dHJlZSwgaWYgbm8gb25lIG9iamVjdHMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+ICAgICAgIEFybmQNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------18o4xqtdrHnA7yRGq0Gjgi9D--

--------------rFRj0NtGM3Zijx0xyHfeKvB1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ+SnsFAwAAAAAACgkQlh/E3EQov+Dd
XQ//Zqe+Ke6gkghrBiUGQ20ACZc8VRAA3V1KtkJbElUAoQFaUum7w/yrlS81UEEJjoRMuX1FFcG+
Rgbn5SQ/UepB6HwWPDfLlwvC4oUfNthoc8c95PMqnBG4qC6ln8pmzQf0Kh3KqcP7JSLUCZQ5hk0S
UQ5o4XBTJvdwLDkcwaKIk8l4Up8BSKjx4CtpCLiplMu6raS6B2gHyKJ4Z5JRPPQBfR8XmfJKoBGA
cJaPYTFMY4Nds0+lkFOgVFZeXpMuhIEt+jScoLwoDxb/2Ee+uaacWl7kCE2BQ8Hdhtm5Z18SDIUv
oI7I2ASXRLCQbUMl+7R2paUr8KyYfV3f3FOq9KIfU0GiZP07CCLHEkojxcdp001KJV4Y8/u91nqe
XPAjD+qEVK/Dqfe8J1nSZESRHsy3f30yr4kUhVBpZpeqdt205SA3Aa3z8Wa+bbk8vJ+7hqoc1pXp
OAwdl1qf48I5AvxZiDdJ9d3lAJBhzEzStBvilwdb+hloJ1vlt/N7eG9d10qCSvEfHdMOma7ym+da
0cHlXkncuXTzhVUj4UWbF/qWakRRElf7lGym4/Ns7gdxWb5/sHGmamxH8cT7lu16UXcGO6JyKi8J
GT7X/bWqUKOYRFUujmWoafHadee1TGvLnPd3nI9GHLZ9WIH6fz8EopcK3bOx3WIBF3E/KBhrZYHH
Nvk=
=wq7p
-----END PGP SIGNATURE-----

--------------rFRj0NtGM3Zijx0xyHfeKvB1--


--===============7910526148887166171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============7910526148887166171==--

