Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B38C77B7D
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 May 2023 07:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1M/GnF/qu8skv9R9ZIPqb65HFNc+F5aruuEr5OaI4M=; b=dJMHyIXv+5t/VUAolLwezKTFr0
	xq/gWIF+e0uncOEtJ9cmcfmbF7fP8RJKT4/VCSUMc18gOf3LZS75s/SN3bE70F25ee1X1Z3luq21H
	V7etyyull+AuCznUgExXr4E3sl8Y3vUnvcUf+pKP2b4Re76bz07A/fceFXBBeiLcr59dBPShNfhsC
	PYzH1+L1aJ9fyOrjNYP4fpopbODBqGQsj56i5vsSWfQsiiaS0OMg3Sur0IZu7LScc48mpj5gZgzwv
	KqMiT/kOZMB599qnAGwyKcKpbVwUjzUZi7do4KNgJMvMRGtzr5bE9nhIfyGbXbuvzs7c8X42/Sc6J
	60YSR9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pupT2-009sjv-0R;
	Fri, 05 May 2023 07:03:00 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pupSw-009shS-1r;
	Fri, 05 May 2023 07:02:57 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC6F81F8C1;
	Fri,  5 May 2023 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683270171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOrOGx3lMD1w9ofRRYAf49PbmfCwS48eXyJm0E0pD1c=;
	b=Ecrw1DAzmwxX/uqKs8Vom1VVBmDqZPvG3WS4lCSmKveqOyfAXCIDHtn8iL3hofoxL0EqGf
	cXoxqEv30OrnapC3xS3MDFjm6hFLaH6e7p0lWeBwQfo+h+QpXqxXpUhFKNqVeqL8pHT2+S
	6MC0uW83/f+o1bFy1PNxCrG3usE/lYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683270171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOrOGx3lMD1w9ofRRYAf49PbmfCwS48eXyJm0E0pD1c=;
	b=GstDDcCGpClaxlkDLaX8l2KxRaTEym4X010TtMsx+1N5klHo2Oq/RL4t4d3F4uBZA+A4YJ
	0IiOapld3hUTMpDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F193113488;
	Fri,  5 May 2023 07:02:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nevqORqqVGQUEgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 05 May 2023 07:02:50 +0000
Message-ID: <54679884-9307-f828-dca4-34cb781dc463@suse.de>
Date: Fri, 5 May 2023 09:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 4/6] fbdev: Include <linux/fb.h> instead of <asm/fb.h>
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
References: <20230504074539.8181-1-tzimmermann@suse.de>
 <20230504074539.8181-5-tzimmermann@suse.de>
 <20230504153710.GA518522@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230504153710.GA518522@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_000254_754266_4A17E4B2 
X-CRM114-Status: GOOD (  13.99  )
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
Content-Type: multipart/mixed; boundary="===============5446343503613965486=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5446343503613965486==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OVNAYynKUsk0MtSxKZ0ZybeJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OVNAYynKUsk0MtSxKZ0ZybeJ
Content-Type: multipart/mixed; boundary="------------w56d0we4Beh0uPurMRS337ha";
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
Message-ID: <54679884-9307-f828-dca4-34cb781dc463@suse.de>
Subject: Re: [PATCH v4 4/6] fbdev: Include <linux/fb.h> instead of <asm/fb.h>
References: <20230504074539.8181-1-tzimmermann@suse.de>
 <20230504074539.8181-5-tzimmermann@suse.de>
 <20230504153710.GA518522@ravnborg.org>
In-Reply-To: <20230504153710.GA518522@ravnborg.org>

--------------w56d0we4Beh0uPurMRS337ha
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDUuMjMgdW0gMTc6Mzcgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIFRodSwgTWF5IDA0LCAyMDIzIGF0IDA5OjQ1OjM3QU0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gUmVwbGFjZSBpbmNsdWRlIHN0YXRl
bWVudHMgZm9yIDxhc20vZmIuaD4gd2l0aCA8bGludXgvZmIuaD4uIEZpeGVzDQo+PiB0aGUg
Y29kaW5nIHN0eWxlOiBpZiBhIGhlYWRlciBpcyBhdmFpbGFibGUgaW4gYXNtLyBhbmQgbGlu
dXgvLCBpdA0KPj4gaXMgcHJlZmVyYWJsZSB0byBpbmNsdWRlIHRoZSBoZWFkZXIgZnJvbSBs
aW51eC8uIFRoaXMgb25seSBhZmZlY3RzDQo+PiBhIGZldyBzb3VyY2UgZmlsZXMsIG1vc3Qg
b2Ygd2hpY2ggYWxyZWFkeSBpbmNsdWRlIDxsaW51eC9mYi5oPi4NCj4+DQo+PiBTdWdnZXN0
ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiANCj4gVGhh
bmtzLA0KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0K
DQpUaGFua3MgZm9yIHJldmlld2luZy4gSSBpbnRlbnQgdG8gbWVyZ2UgdGhpcyBlYXJseSBu
ZXh0IHdlZWsgYWZ0ZXIgdGhlIA0KdXBjb21pbmcgLXJjMSBoYXMgbGFuZGVkIGluIHRoZSBE
Uk0gbWlzYyB0cmVlcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJu
YmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNE
b25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------w56d0we4Beh0uPurMRS337ha--

--------------OVNAYynKUsk0MtSxKZ0ZybeJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRUqhoFAwAAAAAACgkQlh/E3EQov+BS
ExAAk6joIh9cdDj+QXWNzSZK8ZvX7kdroXQJShSXL0qeH/0/Enm5utlSP6lnNpxO8utZSygCPx49
5is8IZ12TOOMwPuoe7jmbepPlRg9oI33B/ch5GRPT6JBRu4YkQgnMrI2xD8m/ENCIRkDcQsXl5b8
xzdrSxUySEZxtFHABCXVVNffMqzDpeC7FdfplfsCtPKk2DS3XxAOEw6hvG9f6zdasELsMFGL+5wO
yYdOKyV7FPkZoHmMXxLdAgUjDd0oLshyzmDnPcPSQbrdsdh9Sj/jJpUAPHtohndBXzCHd+69zNIV
s0Z5ScYl03jlO1Tue7ggA9GDMb6vTEG7mmc70m1bROeLrzxjChbzEJFqDZKxPKPrCRtIeRTWgIcM
HdEX9R75aaLlikt+eAyc2eL4LRUPKOMDmJqiPp7r/RzLbFbxcDLjeTkzBvWOBM4OWfI+5K9ad/xL
L7/vFBoXsfGl96dULvEzu5wPX9KESYeEu4u5hby2jwtN5FpUH5JewvTkdZNjk35Ad0awpDC2qt4h
aZtYGMplwRguhc06s7GEAehycRuhld/IQdlOEQgOEoM8OT8qSnVKj+uBEG6Hkzda0eEGY+xlzUTA
Dh7H8V6PqhvFIj1FA+DRzw/XE9xWO0uBFv/mLu5DWE7hRph1xfBkDPExqayoPjQqBXRVoFAx+ZSe
QdM=
=z1Er
-----END PGP SIGNATURE-----

--------------OVNAYynKUsk0MtSxKZ0ZybeJ--


--===============5446343503613965486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============5446343503613965486==--

