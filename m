Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C388CC7619A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  5 Apr 2023 18:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1NWq3bw6JW4xgKFL8XBsW1pWfXhzyHzt1HHbybHkP4=; b=yV3cyxs4nG73AZvnWwFsPDc0wp
	oWjtxuqK6o8TIiAsf4OsahI8SziuaSlc5VuBBh8/TK0TdKZ6/bju72ft9Y00I+PviaQRDt9ZoDroc
	G3L76BNLiY7a8zfLUe3NiIYVzCK5VGbwE1ubrPSK7Eis2M+7fgFGS0uLrGx+QUA2AQ4GfpnrHy93F
	ISgU22C410PiAPGJX9I2nUJblR2MSypwrJ2W51b8jnV8pTCa5ee885d+2BnZQIHuKlGPSmNYgAgdy
	/yiJpkuzEpXUsEYrKe52VSUp0q9MpHL+LVL+mLr8uN3KLCRvHc0OdTnCFFHevI9YpzGTMnpGV5Ft5
	uDzjSIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk7xK-005PIu-17;
	Wed, 05 Apr 2023 18:34:02 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk7xE-005PGh-09;
	Wed, 05 Apr 2023 18:33:59 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 274AC22388;
	Wed,  5 Apr 2023 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680719631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aKm+2KnGcfadUGufvWlUYTOWO8wYUF/m6w9EgTd+Yxg=;
	b=AY9ehin0RCIs0Z/tUz5CKDnk5hMcYELqfYZsQf6JezYbYgl6N+MUriBP2y4z/HS/u2p4uV
	vUpEjY29QAk2ubCGTL9muUVgDVI9nLeBUNgGl3cXLFVPYaIg+72dyNHTO+LDRdjUlU8VdL
	nd1HL6uwb/bGPH2YvPQKvg4RXUfpPNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680719631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aKm+2KnGcfadUGufvWlUYTOWO8wYUF/m6w9EgTd+Yxg=;
	b=UfgF0YRnUz9dpmsQ4gm6okcJLQEX7z9ep+Kr7HyJzwDq82jBBbfBGRO9qN7DSGXIQELO1T
	DjJ7TAxa27NsccAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD06F13A31;
	Wed,  5 Apr 2023 18:33:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6kDPLA6/LWSPBwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 18:33:50 +0000
Message-ID: <769a46bd-0c35-f61f-6d68-b982fc25cb55@suse.de>
Date: Wed, 5 Apr 2023 20:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/18] fbdev: Prepare generic architecture helpers
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
References: <20230405150554.30540-1-tzimmermann@suse.de>
 <20230405150554.30540-2-tzimmermann@suse.de>
 <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_113356_232420_2422EEA3 
X-CRM114-Status: GOOD (  26.09  )
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
Content-Type: multipart/mixed; boundary="===============8680811450292790211=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8680811450292790211==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PH6RE0bdaBjJFU6C368NRApK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PH6RE0bdaBjJFU6C368NRApK
Content-Type: multipart/mixed; boundary="------------PnZlrreMxn0zLzAk4t4Das5u";
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
Message-ID: <769a46bd-0c35-f61f-6d68-b982fc25cb55@suse.de>
Subject: Re: [PATCH 01/18] fbdev: Prepare generic architecture helpers
References: <20230405150554.30540-1-tzimmermann@suse.de>
 <20230405150554.30540-2-tzimmermann@suse.de>
 <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>
In-Reply-To: <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>

--------------PnZlrreMxn0zLzAk4t4Das5u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDQuMjMgdW0gMTc6NTMgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBP
biBXZWQsIEFwciA1LCAyMDIzLCBhdCAxNzowNSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
DQo+PiBHZW5lcmljIGltcGxlbWVudGF0aW9ucyBvZiBmYl9wZ3Byb3RlY3QoKSBhbmQgZmJf
aXNfcHJpbWFyeV9kZXZpY2UoKQ0KPj4gaGF2ZSBiZWVuIGluIHRoZSBzb3VyY2UgY29kZSBm
b3IgYSBsb25nIHRpbWUuIFByZXBhcmUgdGhlIGhlYWRlciBmaWxlDQo+PiB0byBtYWtlIHVz
ZSBvZiB0aGVtLg0KPj4NCj4+IEltcHJvdmUgdGhlIGNvZGUgYnkgdXNpbmcgYW4gaW5saW5l
IGZ1bmN0aW9uIGZvciBmYl9wZ3Byb3RlY3QoKSBhbmQNCj4+IGJ5IHJlbW92aW5nIGluY2x1
ZGUgc3RhdGVtZW50cy4NCj4+DQo+PiBTeW1ib2xzIGFyZSBwcm90ZWN0ZWQgYnkgcHJlcHJv
Y2Vzc29yIGd1YXJkcy4gQXJjaGl0ZWN0dXJlcyB0aGF0DQo+PiBwcm92aWRlIGEgc3ltYm9s
IG5lZWQgdG8gZGVmaW5lIGEgcHJlcHJvY2Vzc29yIHRva2VuIG9mIHRoZSBzYW1lDQo+PiBu
YW1lIGFuZCB2YWx1ZS4gT3RoZXJ3aXNlIHRoZSBoZWFkZXIgZmlsZSB3aWxsIHByb3ZpZGUg
YSBnZW5lcmljDQo+PiBpbXBsZW1lbnRhdGlvbi4gVGhpcyBwYXR0ZXJuIGhhcyBiZWVuIHRh
a2VuIGZyb20gPGFzbS9pby5oPi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gDQo+IE1vdmluZyB0aGlzIGludG8g
Z2VuZXJpYyBjb2RlIGlzIGdvb2QsIGJ1dCBJJ20gbm90IHN1cmUNCj4gYWJvdXQgdGhlIGRl
ZmF1bHQgZm9yIGZiX3BncHJvdGVjdCgpOg0KPiANCj4+ICsNCj4+ICsjaWZuZGVmIGZiX3Bn
cHJvdGVjdA0KPj4gKyNkZWZpbmUgZmJfcGdwcm90ZWN0IGZiX3BncHJvdGVjdA0KPj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBmYl9wZ3Byb3RlY3Qoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPj4gKwkJCQl1bnNpZ25lZCBsb25nIG9mZikNCj4+
ICt7IH0NCj4+ICsjZW5kaWYNCj4gDQo+IEkgdGhpbmsgbW9zdCBhcmNoaXRlY3R1cmVzIHdp
bGwgd2FudCB0aGUgdmVyc2lvbiB3ZSBoYXZlIG9uDQo+IGFyYywgYXJtLCBhcm02NCwgbG9v
bmdhcmNoLCBhbmQgc2ggYWxyZWFkeToNCj4gDQo+IHN0YXRpYyBpbmxpbmUgdm9pZCBmYl9w
Z3Byb3RlY3Qoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG9m
ZikNCj4gew0KPiAgICAgICAgIHZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X3dyaXRlY29t
YmluZSh2bWEtPnZtX3BhZ2VfcHJvdCk7DQo+IH0NCj4gDQo+IHNvIEknZCBzdWdnZXN0IG1h
a2luZyB0aGF0IHZlcnNpb24gdGhlIGRlZmF1bHQsIGFuZCB0cmVhdGluZyB0aGUNCj4gZW1w
dHkgb25lcyAobTY4a25vbW11LCBzcGFyYzMyKSBhcyBhcmNoaXRlY3R1cmUgc3BlY2lmaWMN
Cj4gd29ya2Fyb3VuZHMuDQoNCk1ha2Ugc2Vuc2UsIHRoYW5rcyBmb3IgdGhlIGZlZWRiYWNr
LiBJJ2xsIHNlbmQgb3V0IGFuIHVwZGF0ZSBzb29uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiBJIHNlZSB0aGF0IHNwYXJjNjQgYW5kIHBhcmlzYyB1c2UgcGdwcm90X3Vu
Y2FjaGVkIGhlcmUsIGJ1dCBhcw0KPiB0aGV5IGRvbid0IGRlZmluZSBhIGN1c3RvbSBwZ3By
b3Rfd3JpdGVjb21iaW5lLCB0aGlzIGVuZHMgdXAgYmVpbmcNCj4gdGhlIHNhbWUsIGFuZCB0
aGV5IGNhbiB1c2UgdGhlIGFib3ZlIGRlZmluaXRpb24gYXMgd2VsbC4NCj4gDQo+IG1pcHMg
ZGVmaW5lcyBwZ3Byb3Rfd3JpdGVjb21iaW5lIGJ1dCB1c2VzIHBncHJvdF9ub25jYWNoZWQN
Cj4gaW4gZmJfcGdwcm90ZWN0KCksIHdoaWNoIGlzIHByb2JhYmx5IGEgbWlzdGFrZSBhbmQg
c2hvdWxkIGhhdmUNCj4gYmVlbiB1cGRhdGVkIGFzIHBhcnQgb2YgY29tbWl0IDRiMDUwYmE3
YTY2YyAoIk1JUFM6IHBndGFibGUuaDoNCj4gSW1wbGVtZW50IHRoZSBwZ3Byb3Rfd3JpdGVj
b21iaW5lIGZ1bmN0aW9uIGZvciBNSVBTIikuDQo+IA0KPiAgICAgIEFybmQNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------PnZlrreMxn0zLzAk4t4Das5u--

--------------PH6RE0bdaBjJFU6C368NRApK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQtvw4FAwAAAAAACgkQlh/E3EQov+B8
SA//S9QvzhCGuS3p6cljiL3iXZKRa6QAzsmTs3qxsBZJVBbAx2oX35juNiYn+llSA4KM2AWgFRYq
Chdjg/0Vxe5/Nl4HGfHpvKLVmZIg1kHtRRwixJ04p4ws8EPfiZN87MeLecWlQo5x9ewt0yCmBeoA
j0eLKDz3kN88NbEuFuTqP3y/H5VaDJUZeqCX2OXBVFPCttZjWgkJ77r5CFvMexzh6fMQ+QP/EKbh
EDDsfHUqq0YKCQobH2KcnEEX+CKJeVR+45+SwdaolfgGzBQ9TFKWnagaJahppLWfzFtg1Tj12NAE
A+Lcrd395eNy1L4TVf3rVDNiWaUGudPY/iAhQ4ivmvj1Rb3esoRkjN4zmSek590XUZ8jZShkgTig
dSgkdgKIWTi/lDCB5NgCZgPpsk6TDcc6Kyj99h6UqYzZiYN3GAaXfP1qgPCPI5el9PphHxaXhOH0
e6PhctJWfsuRVWseHjFXi5M+svclBMYk6bOBvo5K9DYF8PTb5pCSRjk3+P9xqW2DeJfoBQClb5HF
JBrMpw8SyQYttizA3bYrXaib4c+t6gvbtaV1bbSzpzZx8vueBtvFY9RB7V5k9sThNULfdsnNc4Ke
CERFDV8vqaQmPTxLxiFvMGuxGysMG8sljev95fD3tcAQIuWY/QA8bnPq3b1pueBR7t7lp+IQ/e26
RHI=
=NHDz
-----END PGP SIGNATURE-----

--------------PH6RE0bdaBjJFU6C368NRApK--


--===============8680811450292790211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============8680811450292790211==--

