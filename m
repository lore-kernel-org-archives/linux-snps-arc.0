Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08253C77B78
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 May 2023 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0I9f15p+umTDD8fm1j7TkTyu+t7E7CtmRDWVdOkraw=; b=X3/OJftxOYpVtac0XY7f1j8Hp7
	jJgip1uK6LZ3whdyaIzrrlRCbJ7eyCs/0UKB8EmoWf1XmFKclVhtLL6vOa4oXN+lBAWm17CQURKRW
	VZYzGZ0czWree4heIDLejIZr/Q5EkjFdvD1pphdYPoYloO2ylo22kKW6nT7MC4wVOGSllN51shPx9
	/fdFtQ2HJmXz15y3LG3Hmr5kwjIKVlO/RpjQYqNP8C3KmTCmBMEiXQliTGf7rvapweMT+nOKi1+rt
	VVNjdKrQIPOEH6h3SRPdA8le6uf2jjEj8pBTd0Hv22Vy6QteEwNwBR3x6Uv+6JeJgsHGA6bAddBqh
	O2EhntTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu6cG-003awn-0T;
	Wed, 03 May 2023 07:09:32 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu6cB-003auJ-37;
	Wed, 03 May 2023 07:09:29 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D753322385;
	Wed,  3 May 2023 07:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683097764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=teAFqwFmUnax09TuiGG90Kj7kG6+48TX1tmrs49YNrk=;
	b=tUCwCKB0yD0DPwNpJBV0UjNNW8Pc2Tw1up+vtwWFbFULRjCUTM2r6XN97fpdpeDUsFrRLd
	piKtpzVfJdFFncRwHBH4A9GLbUn0kSC51ADu0zOJdn42pSMYJQLHSNfHItzb4FVIUckF2T
	ILfUkKY1mTGafy1tRkd67jr9sih0wIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683097764;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=teAFqwFmUnax09TuiGG90Kj7kG6+48TX1tmrs49YNrk=;
	b=r2Odk1cw2e32jvI3AbMtbCk05d4jzD0gTvfM1aH+rVq9i59ptSJ85SasU9l54dvJrXnX1I
	ptaVbSF6VtrOoFBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 751D21331F;
	Wed,  3 May 2023 07:09:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FWCdG6QIUmSWRAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 03 May 2023 07:09:24 +0000
Message-ID: <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
Date: Wed, 3 May 2023 09:09:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 4/6] fbdev: Include <linux/io.h> via <asm/fb.h>
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, linux-parisc@vger.kernel.org, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-5-tzimmermann@suse.de>
 <20230502195429.GA319489@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230502195429.GA319489@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_000928_152435_A629C90C 
X-CRM114-Status: GOOD (  24.50  )
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
Content-Type: multipart/mixed; boundary="===============7521385533267477851=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7521385533267477851==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pUWBDJ1Raj0NjYY4OLYhyeQp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pUWBDJ1Raj0NjYY4OLYhyeQp
Content-Type: multipart/mixed; boundary="------------bKIh6R9LGtMQp74D7VXZK0tl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, linux-parisc@vger.kernel.org, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Message-ID: <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
Subject: Re: [PATCH v3 4/6] fbdev: Include <linux/io.h> via <asm/fb.h>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-5-tzimmermann@suse.de>
 <20230502195429.GA319489@ravnborg.org>
In-Reply-To: <20230502195429.GA319489@ravnborg.org>

--------------bKIh6R9LGtMQp74D7VXZK0tl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDUuMjMgdW0gMjE6NTQgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIFR1ZSwgTWF5IDAyLCAyMDIzIGF0IDAzOjAyOjIxUE0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gRmJkZXYncyBtYWluIGhlYWRlciBm
aWxlLCA8bGludXgvZmIuaD4sIGluY2x1ZGVzIDxhc20vaW8uaD4gdG8gZ2V0DQo+PiBkZWNs
YXJhdGlvbnMgZm9yIEkvTyBoZWxwZXIgZnVuY3Rpb25zLiBGcm9tIHRoZXNlIGRlY2xhcmF0
aW9ucywgaXQNCj4+IGxhdGVyIGRlZmluZXMgZnJhbWVidWZmZXIgSS9PIGhlbHBlcnMsIHN1
Y2ggYXMgZmJfe3JlYWQsd3JpdGV9W2J3bHFdKCkNCj4+IG9yIGZiX21lbXNldCgpLg0KPj4N
Cj4+IFRoZSBmcmFtZWJ1ZmZlciBJL08gaGVscGVycyBkZXBlbmQgb24gdGhlIHN5c3RlbSBh
cmNoaXRlY3R1cmUgYW5kDQo+PiB3aWxsIHRoZXJlZm9yZSBiZSBtb3ZlZCBpbnRvIDxhc20v
ZmIuaD4uIFByZXBhcmUgdGhpcyBjaGFuZ2UgYnkgZmlyc3QNCj4+IGFkZGluZyBhbiBpbmNs
dWRlIHN0YXRlbWVudCBmb3IgPGxpbnV4L2lvLmg+IHRvIDxhc20tZ2VuZXJpYy9mYi5oPi4N
Cj4+IEluY2x1ZGUgPGFzbS9mYi5oPiBpbiBhbGwgc291cmNlIGZpbGVzIHRoYXQgdXNlIHRo
ZSBmcmFtZWJ1ZmZlciBJL08NCj4+IGhlbHBlcnMsIHNvIHRoYXQgdGhleSBzdGlsbCBnZXQg
dGhlIG5lY2Vzc2FyeSBJL08gZnVuY3Rpb25zLg0KPj4NCj4gLi4uDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXJrZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvYXJrZmIuYw0KPj4gaW5kZXggNjBhOTZmZGI1ZGQ4Li5mZDM4ZThhMDczYjggMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Fya2ZiLmMNCj4+ICsrKyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvYXJrZmIuYw0KPj4gQEAgLTI3LDYgKzI3LDggQEANCj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4gLyogV2h5IHNob3VsZCBmYiBkcml2ZXIgY2FsbCBj
b25zb2xlIGZ1bmN0aW9ucz8gYmVjYXVzZSBjb25zb2xlX2xvY2soKSAqLw0KPj4gICAjaW5j
bHVkZSA8dmlkZW8vdmdhLmg+DQo+PiAgIA0KPj4gKyNpbmNsdWRlIDxhc20vZmIuaD4NCj4g
DQo+IFdoZW4gd2UgaGF2ZSBhIGhlYWRlciBsaWtlIGxpbnV4L2ZiLmggLSBpdCBpcyBteSB1
bmRlcnN0YW5kaW5nIHRoYXQgaXQgaXMNCj4gcHJlZmVycmVkIHRvIGluY2x1ZGUgdGhhdCBm
aWxlLCBhbmQgbm90IHRoZSBhc20vZmIuaCB2YXJpYW50Lg0KPiANCj4gVGhpcyBpcyBhc3N1
bWluZyB0aGUgbGludXgvZmIuaCBjb250YWlucyB0aGUgZ2VuZXJpYyBzdHVmZiwgYW5kIGlu
Y2x1ZGVzDQo+IGFzbS9mYi5oIGZvciB0aGUgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIHBhcnRz
Lg0KPiANCj4gU28gZHJpdmVycyB3aWxsIGluY2x1ZGUgbGludXgvZmIuaCBhbmQgdGhlbiB0
aGV5IGF1dG9tYXRpY2FsbHkgZ2V0IHRoZQ0KPiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgcGFy
dHMgZnJvbSBhc20vZmIuaC4NCj4gDQo+IEluIG90aGVyIHdvcmRzLCBkcml2ZXJzIGFyZSBu
b3Qgc3VwcG9zZWQgdG8gaW5jbHVkZSBhc20vZmIuaCwgaWYNCj4gbGludXguZmIuaCBleGlz
dHMgLSBhbmQgbGludXgvZmIuaCBzaGFsbCBpbmNsdWRlIHRoZSBhc20vZmIuaC4NCj4gDQo+
IElmIHRoZSBhYm92ZSBob2xkcyB0cnVlLCB0aGVuIGl0IGlzIHdyb25nIGFuZCBub3QgbmVl
ZGVkIHRvIGFkZCBhc20vZmIuaA0KPiBhcyBzZWVuIGFib3ZlLg0KPiANCj4gDQo+IFRoZXJl
IGFyZSBjb3VudGxlc3MgZXhhbXBsZXMgd2hlcmUgdGhlIGFib3ZlIGFyZSBub3QgZm9sbG93
ZWQsDQo+IGJ1dCB0byBteSBiZXN0IHVuZGVyc3RhbmRpbmcgdGhlIGFib3ZlIGl0IHRoZSBw
cmVmZXJyZWQgd2F5IHRvIGRvIGl0Lg0KDQpXaGVyZSBkaWQgeW91aGVyIHRoaXM/IEkgb25s
eSBrbm93IGFib3V0IHRoaXMgaW4gdGhlIGNhc2Ugb2YgYXNtL2lvLmggDQp2cy4gbGludXgv
aW8uaC4NCg0KSWYgdGhhdCdzIHRoZSBjYXNlLCB3ZSBzaG91bGQgcHV0IHRob3NlIGhlbHBl
cnMgaW50byBhIG5ldyBoZWFkZXIgZmlsZSwgDQpiZWNhdXNlIG9uZSBvZiB0aGUgbW90aXZh
dGlvbnMgaGVyZSBpcyB0byByZW1vdmUgPGFzbS9pby5oPiBmcm9tIA0KPGxpbnV4L2ZiLmg+
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAJU2FtDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------bKIh6R9LGtMQp74D7VXZK0tl--

--------------pUWBDJ1Raj0NjYY4OLYhyeQp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRSCKQFAwAAAAAACgkQlh/E3EQov+CW
BQ//YDmcKk7ERaH80k2npCB1rdHjACWs3GOdia4iNkVhYtPfK/loYq5roG9jBM+wXyR2nOo+RLD7
0VtULvCiWgrJPT6BoA6hzeoOb+LGQ1gvDPJklhli0P+WaF13ibt8hnKPwJrCH19pjuRNtTzoSP1C
SYXmx0uSU+ffenGiJdDfCAikIruhy/8N1qSfhKFvOvzDbazitLCGPZwCr+jdbh3IwtnEXz1uaFjY
U+y7S/Z2CcvCqcGKsvyB/NnYg8zES/r0fwCzl5f4Y6jqr3jyU9Mi3wb2dbubLErIPkqiHsol7fmq
zC8SvTXJFqLe2zKke7yZc1L6phcFbWdpcf6DLRhaQDBmylbz8uzXHkOjxjHuI8pnAHLTvF/VkOtj
uZy/Reb7x0qboXTc2ivFUOwk2cKBJEwVab2hJFYdY4YAewUoINv+7vXs9XNoDjr8/LDmXLi+JYlu
h8A38vUXFD4pi5xeFG57n1XlXhIDv38IzjxeozkQZ/RyxGF/HAbLLL6aK7kNnEn6+nU1krrOtbEV
4w29Z2qCHW0LXsh1k0pGOEMx6K0w3gruoubOC4Wzr9sMom6tA31s11j21PHxYMLEtbhJMi0LzcNa
r0w/T9Co/W6rI+j5TAH0rZNyxAywrj8YZIDmg/E7wk1CElgMIsECcxlGW2k1+Opr928kYYM4L97M
50o=
=a/zq
-----END PGP SIGNATURE-----

--------------pUWBDJ1Raj0NjYY4OLYhyeQp--


--===============7521385533267477851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============7521385533267477851==--

