Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11DEC77B73
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Apr 2023 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UalvyNec7JuarNdh3e3hTBe3KEsZv0ECzs5vYIvvg2s=; b=xqVUPWgNWggpV+74SZiMYwr18N
	F6ZuFxzs19f0xoVCDQpQmXUbVSSMYHVffYa+kG0P5UUg8eza7DJUxvVs0ypS7ZwVAQhP14pNc9WeB
	XSfLV+9aP6Y6HEn3v3nMGNmDlTTZhFA5p7cn9Ickelqzfeks5Ly54VcXjHJD7FhgnVt5sZ0GyXw4o
	+m0Z5un+n5Fcgh0AhCtdO9odQYYr3CsZLlrbfAvOcRW+wlGinfhMIZznmE6ehY2TAWTPxBJ1aJkD9
	HMDSWe8Z+1mi41A7lFoVtIRo1TrROXvWrXoxUQI6zhgkoUQZ1kdaOcA8zIp2Gmm3/HtE+tKsDBur8
	aFAPsbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prvxx-005eix-04;
	Thu, 27 Apr 2023 07:22:57 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prvxs-005egv-2n;
	Thu, 27 Apr 2023 07:22:54 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D50261FDF6;
	Thu, 27 Apr 2023 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682580168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mwjDvnTTpUQQAU0S0NYQu7NztQ86BE/cY3YTj2NNeVM=;
	b=Un7Gx01PokhNQiVoDb02P2s+kOPGU770pEPzJrxxIAFVFRAXtAUqKAYpk5HGhcEcjn2qx3
	2C9Ze5cftpcNs/R+ie2ctuvNWHI8ZUZH2qu4rexmtorhKnrzH9Uite0TY3cAwazKzLSnM9
	bSgsC8Qen6ZvcZ9aCUO46+tQxItvtIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682580168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mwjDvnTTpUQQAU0S0NYQu7NztQ86BE/cY3YTj2NNeVM=;
	b=MVwyD8XGPiCuNb0tm4gyVIuhyn9YeI8pxDwrB2nQC/aLSapjlluwmmOAV+r89rHGjJ5Ohb
	IWkBOldoEBcgo0BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 628F613910;
	Thu, 27 Apr 2023 07:22:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SCQXF8giSmT2JQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 27 Apr 2023 07:22:48 +0000
Message-ID: <3e33ab1d-b478-fdf5-6fbe-6580000182d1@suse.de>
Date: Thu, 27 Apr 2023 09:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/5] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@hansenpartnership.com, arnd@arndb.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org
References: <20230426130420.19942-1-tzimmermann@suse.de>
 <20230426192110.GA3791243@ravnborg.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230426192110.GA3791243@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_002253_054678_0C83EC1F 
X-CRM114-Status: GOOD (  19.83  )
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
Content-Type: multipart/mixed; boundary="===============5054182030855395211=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5054182030855395211==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7Tnoo09B1y1bqPUqHSpN4Mqn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7Tnoo09B1y1bqPUqHSpN4Mqn
Content-Type: multipart/mixed; boundary="------------0BnAEdd7ws0JRInwI0tlF7W0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@hansenpartnership.com, arnd@arndb.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org
Message-ID: <3e33ab1d-b478-fdf5-6fbe-6580000182d1@suse.de>
Subject: Re: [PATCH 0/5] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
References: <20230426130420.19942-1-tzimmermann@suse.de>
 <20230426192110.GA3791243@ravnborg.org>
In-Reply-To: <20230426192110.GA3791243@ravnborg.org>

--------------0BnAEdd7ws0JRInwI0tlF7W0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDI2LjA0LjIzIHVtIDIxOjIxIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMuDQo+IA0KPiBPbiBXZWQsIEFwciAyNiwgMjAyMyBhdCAwMzowNDoxNVBN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEZiZGV2IHByb3ZpZGVzIGhl
bHBlcnMgZm9yIGZyYW1lYnVmZmVyIEkvTywgc3VjaCBhcyBmYl9yZWFkbCgpLA0KPj4gZmJf
d3JpdGVsKCkgb3IgZmJfbWVtY3B5X3RvX2ZiKCkuIFRoZSBpbXBsZW1lbnRhdGlvbiBvZiBl
YWNoIGhlbHBlcg0KPj4gZGVwZW5kcyBvbiB0aGUgYXJjaGl0ZWN0dXJlLiBJdCdzIHN0aWxs
IGFsbCBsb2NhdGVkIGluIGZiZGV2J3MgbWFpbg0KPj4gaGVhZGVyIGZpbGUgPGxpbnV4L2Zi
Lmg+LiBNb3ZlIGFsbCBvZiBpdCBpbnRvIGVhY2ggYXJjaHRlY3R1cmUncw0KPj4gPGFzbS9m
Yi5oPiwgd2l0aCBzaGFyZWQgY29kZSBpbiA8YXNtLWdlbmVyaWMvZmIuaD4uDQo+IA0KPiBG
b3Igb25jZSBJIHRoaW5rIHRoaXMgY2xlYW51cCBpcyBtb3ZpbmcgdGhpbmdzIGluIHRoZSB3
cm9uZyBkaXJlY3Rpb24uDQo+IA0KPiBUaGUgZmJfKiBoZWxwZXJzIHByZWRhdGVzIHRoZSBn
ZW5lcmljIGlvLmggc3VwcG9ydCBhbmQgdHJ5IHRvDQo+IGFkZCBhIGdlbmVyaWMgbGF5ZXIg
Zm9yIHJlYWQgcmVhZCAvIHdyaXRlIG9wZXJhdGlvbnMuDQo+IA0KPiBUaGUgcmlnaHQgZml4
IHdvdWxkIGJlIHRvIG1pZ3JhdGUgZmJfKiB0byB1c2UgdGhlIGlvIGhlbHBlcnMNCj4gd2Ug
aGF2ZSB0b2RheSAtIHNvIHdlIHVzZSB0aGUgZXhpc3Rpbmcgd2F5IHRvIGhhbmRsZSB0aGUg
YXJjaGl0ZWN0dXJlDQo+IHNwZWNpZmljIGRldGFpbHMuDQoNCkkgbG9va2VkIHRocm91Z2gg
dGhlIGV4aXN0aW5nIHZlcnNpb25zIG9mIHRoZSBmYl8oKSBJL08gaGVscGVycy4gVGhleSAN
CmNhbiBhcHBhcmVudGx5IGJlIGltcGxlbWVudGVkIHdpdGggdGhlIHJlZ3VsYXIgaGVscGVy
cyBvZiBzaW1pbGFyIG5hbWVzLg0KDQpJJ20gbm90IHN1cmUsIGJ1dCBldmVuIFNwYXJjIGxv
b2tzIGNvbXBhdGlibGUuIEF0IGxlYXN0IHRoZXNlIHNidXNfIA0KZnVuY3Rpb25zIHNlZW0g
dG8gYmUgZXF1aXZhbGVudCB0byB0aGUgX19yYXdfKCkgSS9PIGhlbHBlcnMgb2Ygc2ltaWxh
ciANCm5hbWVzLiBEbyB5b3Ugc3RpbGwgaGF2ZSB0aGF0IFNwYXJjIGVtdWxhdG9yPw0KDQo+
IA0KPiAgRnJvbSBhIHF1aWNrIGxvb2sgdGhlcmUgc2VlbXMgdG8gYmUgc29tZSBjaGFsbGVu
Z2VzIGJ1dCB0aGUgY3VycmVudA0KPiBoZWxwZXJzIHRoYXQgcmUtZG8gcGFydCBvZiBpby5o
IGlzIG5vdCB0aGUgd2F5IGZvcndhcmQgYW5kIGhpZGluZyB0aGVtDQo+IGluIGFyY2gvaW5j
bHVkZS9hc20vZmIuaCBzZWVtcyBjb3VudGVyIHByb2R1Y3RpdmUuDQoNCldoaWNoIGNoYWxs
ZW5nZXMgZGlkIHlvdSBzZWU/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IAlT
YW0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNz
ZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3
IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChB
RyBOdWVybmJlcmcpDQo=

--------------0BnAEdd7ws0JRInwI0tlF7W0--

--------------7Tnoo09B1y1bqPUqHSpN4Mqn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRKIscFAwAAAAAACgkQlh/E3EQov+CT
oBAA0joPCJExKZHc0py1Nmn46HLD2xkGXPqvlDNyOfv9K2WAzSvDzx5KShE1DzyUEcLTvhQfPm/D
5nQOnQrSn7HQkCIR4umRPp+nXP2coyxCHOnBIowCq2R5+j9pCCLIke3VDkTBCjo1S2FXNaWQ7akF
bWxfDg2rsatU/OkSba1nBa3LGj5JxZRa7DPQm4/HBXeL3WIuFiFEvklKelWui99NyANYaoXx7yoW
enEpmf+18GQR9FDziRZjTgETxW+/HXBqLC8vF6nuig1uqQ5TuuiT6/UomLXEdARPKkDKwq4Qg7Cq
CkIq8jsFYW3Caq7xfMmVfaz1zjSHoZ9Mc2hWnqzjSEbOgRRUpiwVVp0YmcHvr5ZkRma96jeAqXZx
YLGHYr6u7/jyNAKDs7rqsVHSwLHrrqNvIStQ0pZTt0yVI5f52dk2FhPeKqC3n3gjEVf5BwAk1gRx
lLlMhkoWTQBfkYZFtor/haDOuPrjOfKSgtU+mYD+SZVeRocMYVVqkRfvUyrZEH1yvOTYFZoK64aJ
aiKd4shbSRUdRhYx6kmwsKR35X4Ww+uXrVqOtdjMhMx0uZ7rzQCEVQ312EYW1a15koHLyAWNon2n
+UfEZE1yEvYWAqdUTcveIJ2B9Hv6jVjx1YO+vppl2GNVWBf8+ms8MW6DrPtR4AYx95gK46rcTnGM
IJY=
=bpnU
-----END PGP SIGNATURE-----

--------------7Tnoo09B1y1bqPUqHSpN4Mqn--


--===============5054182030855395211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============5054182030855395211==--

