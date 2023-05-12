Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE684C77B7F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 May 2023 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3uqFHme2n9oBO7/0izbkccriQPs6tlFGHifIOVS/1M=; b=KKracGBO1lw/ZlmHRaDZLu9RjG
	UXutndC0KBG/mdAiOsUuqeB4JQQSxhkaT8jW/0CAT7L23SQxyrlbBfxmkHMS34/Mh/n98SAekOWB8
	XvQnmrVnZOajZbawCm9z8DC9+AJzp2gDDV+hIkuPab0eVk2qI/P6nxqjZtpaSLsQdQs9SWB/1jD5H
	g/SfaiYEjhIeLxLZeynNTN0+JXB60nRpZ7UqVpYBR6l58wWWCCZ5aBmFqRWAvuDhI0hUaAx+r6avj
	3Mu6wL/45tmwgvQZ/XTHpNJ+IkroqCVrWBKDfOAEwiIlBrmcEu7LBrXGNDw04ODSY4T4wUY1K9So8
	drC26leQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxRDF-00Bqza-2R;
	Fri, 12 May 2023 11:45:29 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxRDD-00Bqy0-05;
	Fri, 12 May 2023 11:45:28 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 79447221A9;
	Fri, 12 May 2023 11:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683891923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tXKUOtR/PIk89HqE7MgG8GxQHnfyvtKDvaIsJ4SR4K4=;
	b=waIBtqdaFPdJRAOeODnnJqOGhRE4T811/kUYD0x0fR7PbJ7Y+7Iy9KhCcvOFra39frB0Xe
	gCK2KglZlA3kvVbdSXoxpQtjYMnh/hMD3eln7r4iQ4kSgT64lEl/mLlCcGMOL6DCQhOO9o
	QGvaCxBQzGe3H8g4l6QGPVM7UPooUew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683891923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tXKUOtR/PIk89HqE7MgG8GxQHnfyvtKDvaIsJ4SR4K4=;
	b=YOfvR57P0MXGkU7butoyJCOSKO/XEs4hWBDCAffYPCrU5aQIYFSjZ5GKbxdp4bnQmKKiIS
	bhcl2rT9h6O/G1BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F297E13499;
	Fri, 12 May 2023 11:45:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dyNVOtImXmRkCQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 11:45:22 +0000
Message-ID: <ab63aa0b-0db8-dfa0-cb63-2f16a66fe2f2@suse.de>
Date: Fri, 12 May 2023 13:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 1/7] fbdev/hitfb: Cast I/O offset to address
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>, "deller@gmx.de" <deller@gmx.de>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "javierm@redhat.com" <javierm@redhat.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "vgupta@kernel.org" <vgupta@kernel.org>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "kernel@xen0n.name" <kernel@xen0n.name>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 kernel test robot <lkp@intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Artur Rojek <contact@artur-rojek.eu>
References: <20230512102444.5438-1-tzimmermann@suse.de>
 <20230512102444.5438-2-tzimmermann@suse.de>
 <c25758dd7b4a4563b0d33c751da8cf6d@AcuMS.aculab.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c25758dd7b4a4563b0d33c751da8cf6d@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_044527_216573_C99AA7A3 
X-CRM114-Status: GOOD (  20.58  )
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
Content-Type: multipart/mixed; boundary="===============3621088883117031222=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3621088883117031222==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JM5nB8sgx4nqVg9dYq6bHUNg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JM5nB8sgx4nqVg9dYq6bHUNg
Content-Type: multipart/mixed; boundary="------------W0dMN7bLCE0vgvZ6rIE6p3Tq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: David Laight <David.Laight@ACULAB.COM>, "deller@gmx.de" <deller@gmx.de>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "javierm@redhat.com" <javierm@redhat.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "vgupta@kernel.org" <vgupta@kernel.org>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "kernel@xen0n.name" <kernel@xen0n.name>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 kernel test robot <lkp@intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Artur Rojek <contact@artur-rojek.eu>
Message-ID: <ab63aa0b-0db8-dfa0-cb63-2f16a66fe2f2@suse.de>
Subject: Re: [PATCH v7 1/7] fbdev/hitfb: Cast I/O offset to address
References: <20230512102444.5438-1-tzimmermann@suse.de>
 <20230512102444.5438-2-tzimmermann@suse.de>
 <c25758dd7b4a4563b0d33c751da8cf6d@AcuMS.aculab.com>
In-Reply-To: <c25758dd7b4a4563b0d33c751da8cf6d@AcuMS.aculab.com>

--------------W0dMN7bLCE0vgvZ6rIE6p3Tq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDUuMjMgdW0gMTM6MTYgc2NocmllYiBEYXZpZCBMYWlnaHQ6DQo+IEZy
b206IFRob21hcyBaaW1tZXJtYW5uDQo+PiBTZW50OiAxMiBNYXkgMjAyMyAxMToyNQ0KPj4N
Cj4+IENhc3QgSS9PIG9mZnNldHMgdG8gcG9pbnRlcnMgdG8gdXNlIHRoZW0gd2l0aCBJL08g
ZnVuY3Rpb25zLiBUaGUgSS9PDQo+PiBmdW5jdGlvbnMgZXhwZWN0IHBvaW50ZXJzIG9mIHR5
cGUgJ3ZvbGF0aWxlIHZvaWQgX19pb21lbSAqJywgYnV0IHRoZQ0KPj4gb2Zmc2V0cyBhcmUg
cGxhaW4gaW50ZWdlcnMuIEJ1aWxkIHdhcm5pbmdzIGFyZQ0KPj4NCj4+ICAgIC4uL2RyaXZl
cnMvdmlkZW8vZmJkZXYvaGl0ZmIuYzogSW4gZnVuY3Rpb24gJ2hpdGZiX2FjY2VsX3dhaXQn
Og0KPj4gICAgLi4vYXJjaC94ODYvaW5jbHVkZS9hc20vaGQ2NDQ2MS5oOjE4OjMzOiB3YXJu
aW5nOiBwYXNzaW5nIGFyZ3VtZW50IDEgb2YgJ2ZiX3JlYWR3JyBtYWtlcyBwb2ludGVyDQo+
PiBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25dDQo+PiAg
ICAgMTggfCAjZGVmaW5lIEhENjQ0NjFfSU9fT0ZGU0VUKHgpICAgIChIRDY0NDYxX0lPQkFT
RSArICh4KSkNCj4+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiAuLi4NCj4+ICAgICA1MiB8IHN0YXRpYyBpbmxp
bmUgdTE2IGZiX3JlYWR3KGNvbnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcikNCj4+
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Xn5+fg0KPj4NCj4+IFRoaXMgcGF0Y2ggb25seSBmaXhlcyB0aGUgYnVp
bGQgd2FybmluZ3MuIEl0J3Mgbm90IGNsZWFyIGlmIHRoZSBJL08NCj4+IG9mZnNldHMgY2Fu
IGxlZ2FsbHkgYmUgcGFzc2VkIHRvIHRoZSBJL08gaGVscGVycy4gSXQgd2FzIGFwcGFyZW50
bHkNCj4+IGJyb2tlbiBpbiAyMDA3IHdoZW4gY3VzdG9tIGludygpL291dHcoKSBoZWxwZXJz
IGdvdCByZW1vdmVkIGJ5DQo+PiBjb21taXQgMzRhNzgwYTBhZmViICgic2g6IGhwNnh4IHBh
dGFfcGxhdGZvcm0gc3VwcG9ydC4iKS4gRml4aW5nIHRoZQ0KPj4gZHJpdmVyIHdvdWxkIHJl
cXVpcmUgc2V0dGluZyB0aGUgSS9PIGJhc2UgYWRkcmVzcy4NCj4gDQo+IERpZCB5b3UgdHJ5
IGNoYW5naW5nIHRoZSBkZWZpbml0aW9uIG9mIEhENjQ0NjFfSU9CQVNFIHRvIGluY2x1ZGUN
Cj4gYSAodm9sYXRpbGUgdm9pZCBfX2lvbWVtICopIGNhc3Q/DQoNCkkgdGhvdWdodCBhYm91
dCBpdCwgYnV0IGRpZG4ndCB0cnkgaXQuIEkgZGlkbid0IHdhbnQgYmVuZCB0aGUgbWVhbmlu
ZyBvZiANCk9GRlNFVCBhbmQgSU9CQVNFIHRvbyBtdWNoLiBUaGV5IHNvdW5kIGxpa2UgaW50
ZWdlciBjb25zdGFudHMgdG8gbWUuDQoNCj4gQSBsb3QgbGVzcyBjaHVybi4uLg0KPiANCj4g
SSdtIGd1ZXNzaW5nIHRoYXQgJ3NoJyBkZW9zbid0IGhhdmUgaW4vb3V0IGluc3RydWN0aW9u
cyBzbyB0aGlzDQo+IGlzIHNvbWV0aGluZyB0aGF0IGlzIGFsd2F5cyBtYXBwZWQgYXQgYSBm
aXhlZCBrZXJuZWwgdmlydHVhbCBhZGRyZXNzPw0KDQpObyBpZGVhLiBJIGNhbm5vdCB0cnkg
dGhlIGRyaXZlciBhbmQgd2FzIG9ubHkgYWJsZSB0byBidWlsZCBpdCBieSANCmhhY2tpbmcg
dXAgc29tZXRoaW5nIHRoYXQgbWFrZXMgQ09NUElMRV9URVNUIHdvcmsuDQoNClRoZSBjdXJy
ZW50IHBhdGNoIHNlZW1lZCBsaWtlIHRoZSBzYWZlc3QgYmV0LCBldmVuIHdpdGggdGhlIGNo
dXJuLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAJRGF2aWQNCj4gDQo+IC0N
Cj4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZh
cm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQo+IFJlZ2lzdHJhdGlvbiBObzogMTM5
NzM4NiAoV2FsZXMpDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
CkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZv
IFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFu
DQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------W0dMN7bLCE0vgvZ6rIE6p3Tq--

--------------JM5nB8sgx4nqVg9dYq6bHUNg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmReJtIFAwAAAAAACgkQlh/E3EQov+Cg
KBAAwMnnYbZmaroQcFpzQ9rorvEdj50+6Ae0gk1HnRN5cp8HoaN/apdvOmnvlN50RTGFEBUG8lV2
SAPnVNx5ud8av/a5pRKfuX4zBDpOW2v+oQAL7ZQBf6BzWv6Sv0twB9aCMEUSW1X9Zvua3y+Buod/
DPVplFTrGvCp8qHEc0zMrgOfNSYtTHOv1Cjwl81wW0pzx2r+1lPxyVXddQGZKpZgsZeAif/a4/ia
4qo5OuosEL9coiQ3BQ8fmYvguybgZJQ1ZRqLRaXNmi7kw6Ydt4v4j0u1LTJWuTY5Z5U+Rhd5/knX
654E+P6fZb89OC1VUopjqk2+NpT13xlZArniWG/JwApwQcj3Y42YABUMAGfVkRdb90zWvkwreZgZ
OX6kkOaLP+AnL8TSBvy9G0oOQaKcafQZI+WiwDqdXCwZ25J+i9bFOvNwaydt+VvEY0deCJs3HCmH
IVSrhELOuxDrXcMXWKNO/NUNW94LUiXEZpUwxeczy/StApXcge4KvmJAM8fdihHFOIY0QXKnKPlu
St4p/ajQMo3gmt0dKAh4hfV6f0WZ0T+IB6JCI7HgSawxGOngg4Vl0mvW1jRE4Ry3LitYJydtTH37
eYXAqIPqBAMiD4CfOUdGSSGuISnTR5jET1pNgHogc24rooXpOnGN/fy27iYNIbxbbnLnS/P5p0h0
yYA=
=F4EL
-----END PGP SIGNATURE-----

--------------JM5nB8sgx4nqVg9dYq6bHUNg--


--===============3621088883117031222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3621088883117031222==--

