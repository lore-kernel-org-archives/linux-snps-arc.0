Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB6DC7EE22
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9zhfmjXBx56PWw6/6YCPMq0Pf7ts6cEMuNkiYdxwrQ=; b=WKuzxcXAOASuxfMkVWIpbm6mO+
	x01L1q5J7LiRrohTIRJWIQK2CPlHHXLhcPAXhMsWtcXAtomP6ai7p1a2flTqSx4xgcb+mHjB40EAr
	GaocbDv9ludyVfoGkfSk/PYKOAmIlYjpdL5qlL/zFQPkMwfN4iayLfkE1UlMtnpShPclUau4VR37W
	PGWDyLNEBawkqXw/QZ1KEyda6SrZl1ej7AT9TozGtdyAhCNoaLsewtX2mnEaSR6umxLTzZfxoFZ76
	PkGUkRMz5qwqndtjLTcLr2EPyMGnW18cS1wndmns+zNtJtZVN+6GY/oIfl0IelK7JBvdmUcktAwJu
	iLhZrgZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px65g-008pKp-1e;
	Thu, 11 May 2023 13:12:16 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px65c-008pIl-1O;
	Thu, 11 May 2023 13:12:14 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73A6621C6F;
	Thu, 11 May 2023 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683810727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ohHx0dB5stZHxx1QwNPGIYWhm6cQbAfXveuQMp0Xhok=;
	b=Ab7WVuywszEo8kd4WGaZFjxb5VfJAu+Wm5pjJ9tFqnmLgyO3tRAFFzZCTZ1NG0NMo++9rZ
	twcnx/lHKLyzEf9Sli3EIkwn4BLWo8Zs+w/4CdT7BnN4+/curF3+QARGk1UnkC5Xs9izLu
	nMY8ZBUbUJyfjosb4kcuZTavVJ2/GSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683810727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ohHx0dB5stZHxx1QwNPGIYWhm6cQbAfXveuQMp0Xhok=;
	b=Eufw4Qi7idm6pzo+V0V5fVyhSYo8QqX3kj50NGgnzQa1YVEyo2+GLC5czjqkbtS04rdD4d
	VTvOaH9dbWSUzCCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAE3F138FA;
	Thu, 11 May 2023 13:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id z6fnN6bpXGR8HQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 11 May 2023 13:12:06 +0000
Message-ID: <cee24e80-cc41-00bc-06a2-37f1e2cad8ef@suse.de>
Date: Thu, 11 May 2023 15:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into
 <asm/fb.h>
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vineet Gupta <vgupta@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 "David S . Miller" <davem@davemloft.net>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Sam Ravnborg <sam@ravnborg.org>, suijingfeng@loongson.cn
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230510110557.14343-6-tzimmermann@suse.de>
 <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com>
 <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_061212_644151_CE5B15BA 
X-CRM114-Status: GOOD (  25.03  )
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
Content-Type: multipart/mixed; boundary="===============3015040291637596190=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3015040291637596190==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------csNkQJKshpNqf00r4DiJQ5jr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------csNkQJKshpNqf00r4DiJQ5jr
Content-Type: multipart/mixed; boundary="------------fYR0XvuIElrjcrLGf1ubCpxL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vineet Gupta <vgupta@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 "David S . Miller" <davem@davemloft.net>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Sam Ravnborg <sam@ravnborg.org>, suijingfeng@loongson.cn
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Message-ID: <cee24e80-cc41-00bc-06a2-37f1e2cad8ef@suse.de>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into
 <asm/fb.h>
References: <20230510110557.14343-6-tzimmermann@suse.de>
 <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com>
 <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
In-Reply-To: <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>

--------------fYR0XvuIElrjcrLGf1ubCpxL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDUuMjMgdW0gMTc6NTQgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBP
biBXZWQsIE1heSAxMCwgMjAyMywgYXQgMTY6MjcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gQW0gMTAuMDUuMjMgdW0gMTY6MTUgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPj4+
IE9uIFdlZCwgTWF5IDEwLCAyMDIzLCBhdCAxNjowMywga2VybmVsIHRlc3Qgcm9ib3Qgd3Jv
dGU6DQo+ICAgDQo+Pj4gSSB0aGluayB0aGF0J3MgYSBwcmVleGlzdGluZyBidWcgYW5kIEkg
aGF2ZSBubyBpZGVhIHdoYXQgdGhlDQo+Pj4gY29ycmVjdCBzb2x1dGlvbiBpcy4gTG9va2lu
ZyBmb3IgSEQ2NDQ2MSBzaG93cyBpdCBiZWluZyB1c2VkDQo+Pj4gYm90aCB3aXRoIGludy9v
dXR3IGFuZCByZWFkdy93cml0ZXcsIHNvIHRoZXJlIGlzIG5vIHdheSB0byBoYXZlDQo+Pj4g
dGhlIGNvcnJlY3QgdHlwZS4gVGhlIHNoIF9fcmF3X3JlYWR3KCkgZGVmaW5pdGlvbiBoaWRl
cyB0aGlzIGJ1ZywNCj4+PiBidXQgdGhhdCBpcyBhIHByb2JsZW0gd2l0aCBhcmNoL3NoIGFu
ZCBpdCBwcm9iYWJseSBoaWRlcyBvdGhlcnMNCj4+PiBhcyB3ZWxsLg0KPj4NCj4+IFRoZSBj
b25zdGFudCBIRDY0NDYxX0lPQkFTRSBpcyBkZWZpbmVkIGFzIGludGVnZXIgYXQNCj4+DQo+
Pg0KPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9h
cmNoL3NoL2luY2x1ZGUvYXNtL2hkNjQ0NjEuaCNMMTcNCj4+DQo+PiBidXQgZmJfcmVhZHco
KSBleHBlY3RzIGEgdm9sYXRpbGUtdm9pZCBwb2ludGVyLiBJIGd1ZXNzIHdlIGNvdWxkIGFk
ZCBhDQo+PiBjYXN0IHNvbWV3aGVyZSB0byBzaWxlbmNlIHRoZSBwcm9ibGVtLiBJbiB0aGUg
Y3VycmVudCB1cHN0cmVhbSBjb2RlLA0KPj4gdGhhdCBhcHBlYXJzIHRvIGJlIGRvbmUgYnkg
c2gncyBfX3Jhd19yZWFkdygpIGludGVybmFsbHk6DQo+Pg0KPj4NCj4+IGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9zaC9pbmNsdWRlL2Fz
bS9pby5oI0wzNQ0KPiANCj4gU3VyZSwgdGhhdCB3b3VsZCBtYWtlIGl0IGJ1aWxkIGFnYWlu
LCBidXQgdGhhdCBzdGlsbCBkb2Vzbid0IG1ha2UgdGhlDQo+IGNvZGUgY29ycmVjdCwgc2lu
Y2UgaXQncyBjb21wbGV0ZWx5IHVuY2xlYXIgd2hhdCBiYXNlIGFkZHJlc3MgdGhlDQo+IEhE
NjQ0NjFfSU9CQVNFIGlzIHJlbGF0aXZlIHRvLiBUaGUgaHA2eHggcGxhdGZvcm0gY29kZSBv
bmx5IHBhc3NlcyBpdA0KPiB0aHJvdWdoIGludygpL291dHcoKSwgd2hpY2ggdGFrZSBhbiBv
ZmZzZXQgcmVsYXRpdmUgdG8gc2hfaW9fcG9ydF9iYXNlLA0KPiBidXQgdGhhdCBpcyBub3Qg
aW5pdGlhbGl6ZWQgb24gaHA2eHguIEkgdHJpZWQgdG8gZmluZCBpbiB0aGUgaGlzdG9yeQ0K
PiB3aGVuIGl0IGJyb2tlLCBhcHBhcmVudGx5IHRoYXQgd2FzIGluIDIwMDcgY29tbWl0IDM0
YTc4MGEwYWZlYiAoInNoOg0KPiBocDZ4eCBwYXRhX3BsYXRmb3JtIHN1cHBvcnQuIiksIHdo
aWNoIHJlbW92ZWQgdGhlIGN1c3RvbSBpbncvb3V0dw0KPiBpbXBsZW1lbnRhdGlvbnMuDQoN
Ckl0IGp1c3Qgb2NjdXJlZCB0byBtZSB0aGF0IHRoZXNlIGZiX3JlYWQgYW5kIGZiX3dyaXRl
IGNhbGxzIGFyZSBwcm9iYWJseSANCmFsbCB3cm9uZy4gVGhlIGZiXyBpbnRlcmZhY2VzIGFy
ZSBmb3IgZnJhbWVidWZmZXIgSS9PIG1lbW9yeS4gVGhlIGRyaXZlciANCnVzZXMgdGhlbSB0
byBhY2Nlc3MgdGhlIHJlZ3VsYXIgc3RhdGUgcmVnaXN0ZXJzLiBUaGUgd3JpdGV3KCkgb24g
c2ggaXMgDQpkZWZpbml0ZWx5IGRpZmZlcmVudC4gWzFdDQoNCkkgYXNzdW1lIHRoYXQgaXQg
b25seSB3b3JrcyBiZWNhdXNlIENPTkZJR19TV0FQX0lPX1NQQUNFIFsyXSBpcyBub3Qgc2V0
IA0KaW4gaHA2eHhfZGVmY29uZmlnLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0g
DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gv
c2gvaW5jbHVkZS9hc20vaW8uaCNMNTUNClsyXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9zaC9pbmNsdWRlL21hY2gtY29tbW9uL21h
Y2gvbWFuZ2xlLXBvcnQuaCNMMjINCg0KPiANCj4gICAgICAgIEFybmQNCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51
ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcg
TWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=


--------------fYR0XvuIElrjcrLGf1ubCpxL--

--------------csNkQJKshpNqf00r4DiJQ5jr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRc6aYFAwAAAAAACgkQlh/E3EQov+Ag
uw//fVmGD3oa58g/+yOsfKrcscQpscH8H8HRvjfJLYMo1MNUxYFCVGF+MD0cfXp9q2mAGFgoT/0C
aOd66yxyWdJTps9gvIlIoBpZn5mFh9K+DnHQddH4K0ARbwumRFLBo1GyLS39hh4MITD2ekJvbH2Z
mdxsGu9YydDbcFosLyBPc9iPJa9kBLST+x36w8OF2+Sf9ca13zB4D2INGJAWwr5DDr76qY4EBsHw
GVLP/XQ0laeDmfS+x86TydjDgCE+tZkOsrLGvRJecERjlR+Oba2rERyXKtFlGDS3X9fkVuE2MEfF
+dexHckNzfvDsWupYZZG3yOpEFBS//c001IxHevFQtEbViBEZRPvnUIUEdRQaZQg+UaFwNmp6qS3
6fzR84hU1xviP3PMr4Obm/VgvU9GraY3pD/JhIelEsUVSBIHWUS/uGVWBf2uMFXfXImswNHZoSFc
d+3orJO9EVQj5U8deI13WhU/1R+obpZJeYETPKSPsg0MUHSYydmvMjNIKAoYlXewpezQRFdxrmti
qtuR4dNYl5vq5y/B6vtYMuydBtII0LQN5jRD/yKjM0hdo+ga7+FEtBqumqSONljzXqSrVuC4ryKj
pNJQJgFM0aHZq0FVVy4PC4+pBDGPt8hoPxfvAlsKpwz4BZUGSg3WxGZwPu1ZAe9bvl4GH00DZ1r1
nUo=
=e+Ht
-----END PGP SIGNATURE-----

--------------csNkQJKshpNqf00r4DiJQ5jr--


--===============3015040291637596190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3015040291637596190==--

