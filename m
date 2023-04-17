Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DAC77B70
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 09:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykfbr8OnazEuDaZc770NN1fGOKLi43dBXlhri27kOZM=; b=ciXLBiYfS+QXJokan/QoGVHPhO
	z3DCI4uwl6kV6Z8PWYDrGBfd+xbl1cdTf4igVc+re6dGtOHVzsQJuum72iJIVKymHsKIyCf4ZjD6U
	SY1/7BAsgGDkkFWZUzuh+m5o5KyV1vOC6fMqjsc5QoY4L/hMVQAIPkbvuPF+stWxRBtz++VynHkHA
	yqtKrP9VFmgSDOlp19ZYWQa7Dh8kEGdwg3laLN7dknqcCV6i7EQnw2XkxeYFXS9s4thc/1np+lOcW
	vCere8PZx9rh0uglC9VydBAeRCi4VEHCc8ZvAdBv+QbHOymNAMtMn0dzgZLefD3c+Ia82YDJrX/gw
	nwMiV1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poKn0-00FSc6-1Y;
	Mon, 17 Apr 2023 09:04:46 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poKmv-00FSZQ-2Q;
	Mon, 17 Apr 2023 09:04:43 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 55A821F381;
	Mon, 17 Apr 2023 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681722280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6sKemqSNeqSuzvlbtysiTKcK5tWpdbhBfOYMbe1xpA=;
	b=lEbyRvZ0mhA+HTDSg/bXcfjaxsomSGRcRcjAVr8tOXKoCIe65JHXtQwHv+wj7v7Ke+mxUp
	bIvywh/2mTvYmeDpIakryjRc6GWveByKR+d8zJyovqzoed8ILUJDIM9PJ1iTG2s35Y4y2b
	/H4VpktNgiA/80+JLQ6zI2hzIjIGiiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681722280;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6sKemqSNeqSuzvlbtysiTKcK5tWpdbhBfOYMbe1xpA=;
	b=EFaog30zlwFDQPmFwOt7LFAWdUfZI1apM55oIu7KK0oVl8+PIBxm8zHlg/ELchgxNZjEUD
	aIQOnTvp5Q6hvbAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA51213319;
	Mon, 17 Apr 2023 09:04:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EEoeNKcLPWRGVwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 09:04:39 +0000
Message-ID: <4450d4bf-a6e0-764e-d1c4-efba272f0529@suse.de>
Date: Mon, 17 Apr 2023 11:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/19] arch/arc: Implement <asm/fb.h> with generic
 helpers
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
 Vineet Gupta <vgupta@kernel.org>
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-3-tzimmermann@suse.de>
 <27c1210f-4e40-4bbc-905b-155427465e00@app.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <27c1210f-4e40-4bbc-905b-155427465e00@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_020441_933026_6F60DA59 
X-CRM114-Status: GOOD (  16.27  )
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
Content-Type: multipart/mixed; boundary="===============0294184841808011670=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0294184841808011670==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iPEL9xuP1J0A8seUIdWajJMz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iPEL9xuP1J0A8seUIdWajJMz
Content-Type: multipart/mixed; boundary="------------ITCxEOG7I6GWaznxs8pYlTkW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
 Vineet Gupta <vgupta@kernel.org>
Message-ID: <4450d4bf-a6e0-764e-d1c4-efba272f0529@suse.de>
Subject: Re: [PATCH v2 02/19] arch/arc: Implement <asm/fb.h> with generic
 helpers
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-3-tzimmermann@suse.de>
 <27c1210f-4e40-4bbc-905b-155427465e00@app.fastmail.com>
In-Reply-To: <27c1210f-4e40-4bbc-905b-155427465e00@app.fastmail.com>

--------------ITCxEOG7I6GWaznxs8pYlTkW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA2LjA0LjIzIHVtIDE2OjQzIHNjaHJpZWIgQXJuZCBCZXJnbWFubjoNCj4gT24g
VGh1LCBBcHIgNiwgMjAyMywgYXQgMTY6MzAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gKw0KPj4gICBzdGF0aWMgaW5saW5lIHZvaWQgZmJfcGdwcm90ZWN0KHN0cnVjdCBmaWxl
ICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4+ICAgCQkJCXVuc2lnbmVk
IGxvbmcgb2ZmKQ0KPj4gICB7DQo+PiAgIAl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF9u
b25jYWNoZWQodm1hLT52bV9wYWdlX3Byb3QpOw0KPj4gICB9DQo+PiArI2RlZmluZSBmYl9w
Z3Byb3RlY3QgZmJfcGdwcm90ZWN0DQo+IA0KPiBJIHN0aWxsIGZlZWwgdGhhdCBmb3IgYXJj
aGl0ZWN0dXJlcyBsaWtlIGFyYyB0aGF0IGRvbid0IGhhdmUNCj4gcGdwcm90X3dyaXRlY29t
YmluZSgpLCBpdCB3b3VsZCBiIGJlc3QgdG8gZ28gd2l0aCB0aGUNCj4gZ2VuZXJpYyBpbXBs
ZW1lbnRhdGlvbiB0aGF0IGN1cnJlbnRseSBiZWhhdmVzIHRoZSBleGFjdA0KPiBzYW1lIHdh
eS4gSWYgcGdwcm90X3dyaXRlY29tYmluZSgpIGdldHMgYWRkZWQgaW4gdGhlIGZ1dHVyZSwN
Cj4gaXQgd291bGQgY2F1c2UgdGhlIGFyY2hpdGVjdHVyZSB0byBiZWhhdmUgYXMgZXhwZWN0
ZWQgcmF0aGVyDQo+IHRoYW4gaW50cm9kdWNpbmcgdGhlIHNhbWUgYnVnIHRoYXQgbWlwcyBo
YXMuDQoNCk9LLCBJJ2xsIGNoYW5nZSBpdC4NCg0KPiANCj4gICAgICAgIEFybmQNCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------ITCxEOG7I6GWaznxs8pYlTkW--

--------------iPEL9xuP1J0A8seUIdWajJMz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ9C6cFAwAAAAAACgkQlh/E3EQov+Ac
QBAAsfmjop5GpI2/M6n6MvSHBTqHHtmA95cabDcKwQFUOYGC55wDQtKCk1YbTbOeOOp4DHs0Rob4
xWSoykdeIUiYGbc8U+MPXGhCdo2C2sKIZkY1wgmuti3n3EkfC6k6Cx9aCz+tiJ+jd9E45wBaOnaE
56XOzZWvxMz+zYzMPsC0pDMXkpZW1XtmvqXrjF6Ohri8O/In5if4HwkiXyJhY0aEXDHB5qLJU+SI
b+YsRcUJLtzaBG/4xUkrhyP1kpTB/tNLYF4Z9fw7YtOUj+DXACQArqlHD8tVe+Z8HfxPmhRId6bp
XouIgS+7VDb0Utb5Nd22dACIzY1DC6CXiz04MI8o++SCFEAK/FZedYlrXtkriEEYX2pcvlUbU+1p
1RB16i/tjmLBhntUmgiUCOQZxk1IIcpOn13HiEGxkin8oFdsKztsrpK15yCcuTY0/1vlx/bahdFv
Mtsy0ss6D9F1XmgpgRJjQkxR1KNV6LNvXzC56bQdk1qiPg6hRRIh5V65ygR1nowW8PHA3kZw5aS0
tGeYxjnvqz41zAoXzDM3bDKjPcdgFfuzm25s3Z3nwqLsD8nKpoSR6Jr+IpXKNxikB8yx3b9GCTbe
C/MTua22YAkNdKZ2MS00YzB8dMZ0u2ZCINsYOTcIYIN+s8mpb7LPO7Zj36RDWZCJMILkijh/NUmM
Xe0=
=9BHz
-----END PGP SIGNATURE-----

--------------iPEL9xuP1J0A8seUIdWajJMz--


--===============0294184841808011670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============0294184841808011670==--

