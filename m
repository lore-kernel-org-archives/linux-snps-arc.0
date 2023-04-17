Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBC0C77B76
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bx6PFIky+DkXq504M3nzQc8VWDM84tnZoWsHoQ6pyME=; b=SEvd4GtB0n9eoW4UeqvaNBbESe
	LgT5ZafghbM2rSv0iBrg0xzFYAWzGGjeTyL4DLnea2/2zrBH06OkItnU7KoJuIXSPGutV90y5MdE1
	+082QTTNwrZ9QRDVZ5lh47IO2SkuM3BOGCX6btNbclhuQWSyBU3Crrx5OkZlIhecvTkssGeZXqijw
	0HLMprcq2wy4TE+JfexZhsVEuJlaNHyOGgDEDPpTklfu0W/L5ZHz5Q2AJZVyDeL23urTFCFDNj6rm
	OudpBREets/C9RiH4jmMRoQ+plZpN8QvUWV65OG8Ls+Z6iKGybAdpXiEjlipSOOjJqyYUq7TIzbbF
	uxKBVfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPUb-00GWjw-2h;
	Mon, 17 Apr 2023 14:06:05 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPUY-00GWii-26;
	Mon, 17 Apr 2023 14:06:04 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 662D521A28;
	Mon, 17 Apr 2023 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681740361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5mUuxKymXhjOKakNWGIOxAW/7IlZKVWPSwdxH/XYD7c=;
	b=bFUAWa4exGrR+N0addrueDBSgLX0ve+bCGYg/IKFn5+7SrbnI6c5aa9Rn5XF0eHFU2ZrJG
	LYzXpojKnoGJ37gzsenvW0afCThgZHsIdaT2GFS7i40Y01lZHs3H/uS8hgVQT//VPbESF+
	A66u7bWR2mGI3kAbb5uRvleBhgDVeMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681740361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5mUuxKymXhjOKakNWGIOxAW/7IlZKVWPSwdxH/XYD7c=;
	b=n2ZcJ+P3x0YzYgvk4eZMTuLaYuGGr06Hvxf/42v+GDGMp6HNh2QXqkUcOpCKbVHSM1mFg7
	CS4gVq+XSTtN/PBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFD0E13319;
	Mon, 17 Apr 2023 14:06:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SSNHNUhSPWRGBgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 14:06:00 +0000
Message-ID: <132f1185-d61f-b8c7-8d6e-4e4280a1a4ad@suse.de>
Date: Mon, 17 Apr 2023 16:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 16/19] arch/sh: Implement <asm/fb.h> with generic
 helpers
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, arnd@arndb.de,
 daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
References: <20230417125651.25126-1-tzimmermann@suse.de>
 <20230417125651.25126-17-tzimmermann@suse.de>
 <3c188e948506dc97112dcc070cf16e36209c6cc5.camel@physik.fu-berlin.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3c188e948506dc97112dcc070cf16e36209c6cc5.camel@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_070602_838881_8EC6F2A5 
X-CRM114-Status: GOOD (  19.68  )
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
Content-Type: multipart/mixed; boundary="===============2563836385550764628=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2563836385550764628==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GRLvBPfqMPOps21m0NeYuHxf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GRLvBPfqMPOps21m0NeYuHxf
Content-Type: multipart/mixed; boundary="------------jOsx0SUaezXHVt7ObFmVoIUH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, arnd@arndb.de,
 daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Message-ID: <132f1185-d61f-b8c7-8d6e-4e4280a1a4ad@suse.de>
Subject: Re: [PATCH v3 16/19] arch/sh: Implement <asm/fb.h> with generic
 helpers
References: <20230417125651.25126-1-tzimmermann@suse.de>
 <20230417125651.25126-17-tzimmermann@suse.de>
 <3c188e948506dc97112dcc070cf16e36209c6cc5.camel@physik.fu-berlin.de>
In-Reply-To: <3c188e948506dc97112dcc070cf16e36209c6cc5.camel@physik.fu-berlin.de>

--------------jOsx0SUaezXHVt7ObFmVoIUH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDQuMjMgdW0gMTU6MDIgc2NocmllYiBKb2huIFBhdWwgQWRyaWFuIEds
YXViaXR6Og0KPiBIaSBUaG9tYXMhDQo+IA0KPiBPbiBNb24sIDIwMjMtMDQtMTcgYXQgMTQ6
NTYgKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gUmVwbGFjZSB0aGUgYXJj
aGl0ZWN0dXJlJ3MgZmJkZXYgaGVscGVycyB3aXRoIHRoZSBnZW5lcmljDQo+PiBvbmVzIGZy
b20gPGFzbS1nZW5lcmljL2ZiLmg+LiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+Pg0KPj4g
djI6DQo+PiAJKiB1c2UgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiBmb3IgZmJfcGdwcm90ZWN0
KCkgKEFybmQpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBDYzogWW9zaGlub3JpIFNhdG8gPHlzYXRvQHVzZXJz
LnNvdXJjZWZvcmdlLmpwPg0KPj4gQ2M6IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+
DQo+PiBDYzogSm9obiBQYXVsIEFkcmlhbiBHbGF1Yml0eiA8Z2xhdWJpdHpAcGh5c2lrLmZ1
LWJlcmxpbi5kZT4NCj4+IC0tLQ0KPj4gICBhcmNoL3NoL2luY2x1ZGUvYXNtL2ZiLmggfCAx
NSArLS0tLS0tLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zaC9pbmNsdWRl
L2FzbS9mYi5oIGIvYXJjaC9zaC9pbmNsdWRlL2FzbS9mYi5oDQo+PiBpbmRleCA5YTBiY2Ey
Njg2ZmQuLjE5ZGYxM2VlOWNhNyAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvc2gvaW5jbHVkZS9h
c20vZmIuaA0KPj4gKysrIGIvYXJjaC9zaC9pbmNsdWRlL2FzbS9mYi5oDQo+PiBAQCAtMiwx
OSArMiw2IEBADQo+PiAgICNpZm5kZWYgX0FTTV9GQl9IXw0KPj4gICAjZGVmaW5lIF9BU01f
RkJfSF8NCj4+ICAgDQo+PiAtI2luY2x1ZGUgPGxpbnV4L2ZiLmg+DQo+PiAtI2luY2x1ZGUg
PGxpbnV4L2ZzLmg+DQo+PiAtI2luY2x1ZGUgPGFzbS9wYWdlLmg+DQo+PiAtDQo+PiAtc3Rh
dGljIGlubGluZSB2b2lkIGZiX3BncHJvdGVjdChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+PiAtCQkJCXVuc2lnbmVkIGxvbmcgb2ZmKQ0KPj4g
LXsNCj4+IC0Jdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfd3JpdGVjb21iaW5lKHZtYS0+
dm1fcGFnZV9wcm90KTsNCj4+IC19DQo+IA0KPiBMb29raW5nIGF0IHRoZSBtYWNybyBpbiBh
c20tZ2VuZXJpYy9mYi5oLCBmYl9wZ3Byb3RlY3QoKSBpcyBiZWluZyByZXBsYWNlZCB3aXRo
DQo+IGEgbm8tb3AgZnVuY3Rpb24uIElzIHRoYXQgaW50ZW50aW9uYWw/IENhbiB5b3UgYnJp
ZWZseSBleHBsYWluIHRoZSBiYWNrZ3JvdW5kDQo+IGZvciB0aGlzIGNoYW5nZT8NCg0KUGF0
Y2ggMDEgb2YgdGhpcyBwYXRjaHNldCBjaGFuZ2VzIHRoZSBnZW5lcmljIGZiX3BncHJvdGVj
dCgpIHRvIHNldCANCnBncHJvdF93cml0ZWNvbWJpbmUoKS4gU28gb24gU0gsIHRoZXJlIHNo
b3VsZCBiZSBubyBjaGFuZ2UgYXQgYWxsLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPj4gLXN0YXRpYyBpbmxpbmUgaW50IGZiX2lzX3ByaW1hcnlfZGV2aWNlKHN0cnVjdCBm
Yl9pbmZvICppbmZvKQ0KPj4gLXsNCj4+IC0JcmV0dXJuIDA7DQo+PiAtfQ0KPj4gKyNpbmNs
dWRlIDxhc20tZ2VuZXJpYy9mYi5oPg0KPj4gICANCj4+ICAgI2VuZGlmIC8qIF9BU01fRkJf
SF8gKi8NCj4gDQo+IFRoYW5rcywNCj4gQWRyaWFuDQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------jOsx0SUaezXHVt7ObFmVoIUH--

--------------GRLvBPfqMPOps21m0NeYuHxf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ9UkgFAwAAAAAACgkQlh/E3EQov+CT
dxAAlaeZyea9oxbjHET7y9S9z07PiGslCvB1B9EMC4ni/lgz7L6gx7STXzzpd5ONJWiY7auM2WAN
t3hqR7Dzuw6zSaOSaI8cC2ea0BqmRqB9Kp5PsHVHfeDd+ttE3hfeeLb+UDY0tbe0RZQfOL0elv34
caKqb0i3LzJ+6khaquE0KFN8zvATCMTtsKourTtuC6g7r+ZmSLRM3j1NT5kAahgAelYHHuFXPakP
k1cXqj1GgFzFh61UACffWRXCEhxGkN837BkWsB2JDolMRXCnU6v1+hjopS+Q+feiYpFKdI7/92qy
mwkMLfHZx6vruJaZYOPyGP7eqA+kXZ62Qrs5quhoG1/gtJhjCnMYdlgcH/oCUpWL3SloQQHlq3BG
bzaOYloNOGEEGrFroFyE0aMYMIKipcKiYCCdHK0mDn3om+hBaGQnCbcl2Ee+RtfjM7IsJjz8R82F
xkdAvmr99dYQdvJq6BvElO6D2k4M6XPucghD8jW9+kiZKdTz4p8q5Y7iY/b5eXbozEhrcAj8zsM2
2Cfv8zmqbUCfOiasUAXCtsHeZ0rC49nLHlF4UdJF9N6KIVCxwwLhKeojr0Y8fd/tSL26bxFH209G
hUHBENKZ4zwpXWSHyhLDzs5fIWo4wAAM13/2OVhgT8W1anIX0riForyhNb4EO+FVbdBZIIMyj+8u
sMs=
=sWM8
-----END PGP SIGNATURE-----

--------------GRLvBPfqMPOps21m0NeYuHxf--


--===============2563836385550764628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============2563836385550764628==--

