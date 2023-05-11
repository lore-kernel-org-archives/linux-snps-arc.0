Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B01C77B7F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 10:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNY65tuvz7slsa+J0+T/n8Syjv8ye1XXPqEK/e15WNo=; b=IbDdC0Z/4yrPPCYsa2hNeXa9T4
	k8IRgZJyK48a9MIl8pAq0Qz07SvKRhqB4ST4tXXDyDnvLumIL1tOTYlpmz3NQNI3RjurEzVmUj47D
	r3ypm10HVqfFWWz1RFmsOgMlXh7SKlO0E81UY36yK0mjAd7IUXVOO7hgAIUXUhmEdXohFBNC/gyfs
	1tzDYRcAo7MAlhxGn0Fbb5vSfNPVkp2HE04MCif86TCZNbJvkG5PlqIt22cc5ZX098af9QgGSLcJh
	7ZQTRaQIYOmx8cGsBEGBA5e2289yOaqNOPxHsPlSQCRV7IDRBhy2SglLlyJ86FmhUS84TIh2cyQuY
	3oxD1DEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px3vk-008aN8-38;
	Thu, 11 May 2023 10:53:52 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px3vh-008aHw-0n;
	Thu, 11 May 2023 10:53:50 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E88321AFD;
	Thu, 11 May 2023 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683802424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3LZh1EONWVfbVG0uAzUZHlDL1AqBEqEdp5FLcPsG/o=;
	b=1rEaE59C9gOZq3Rqzwx4QdPoKmD4WuNDAASNX31ocsmQi8d5/p37GxDurM9BEEhYFiqmy/
	tye/mqN1hmtTER34vyNYUsygW69lryFpgJLLqDz4QttwnRSIIxDwtCd6z14QHDeSOS/XlI
	nw7SoPPEfNEldI0B04FdyAaSVeGpXyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683802424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3LZh1EONWVfbVG0uAzUZHlDL1AqBEqEdp5FLcPsG/o=;
	b=GDBxgFVn5ravCTx6nanSkuobRAkYarnG3E6goiquTOZ3PTnOiuyNJ2qycP1zO/iVeYGuba
	A/diddMfOKYoJVCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF1B7138FA;
	Thu, 11 May 2023 10:53:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GFOmNTfJXGTFTAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 11 May 2023 10:53:43 +0000
Message-ID: <9ea087ab-95f3-3274-b464-ef13718562b1@suse.de>
Date: Thu, 11 May 2023 12:53:43 +0200
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
X-CRM114-CacheID: sfid-20230511_035349_455940_C0F796A7 
X-CRM114-Status: GOOD (  25.19  )
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
Content-Type: multipart/mixed; boundary="===============0595040888693980662=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0595040888693980662==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gOpI1L9pL7Bq8Fb2HvhAlzDV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gOpI1L9pL7Bq8Fb2HvhAlzDV
Content-Type: multipart/mixed; boundary="------------IBuMtqzq4nm9A3mKPOZXAzct";
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
Message-ID: <9ea087ab-95f3-3274-b464-ef13718562b1@suse.de>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into
 <asm/fb.h>
References: <20230510110557.14343-6-tzimmermann@suse.de>
 <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com>
 <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
In-Reply-To: <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>

--------------IBuMtqzq4nm9A3mKPOZXAzct
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
Y2UgaXQncyBjb21wbGV0ZWx5IHVuY2xlYXIgd2hhdCBiYXNlIGFkZHJlc3MgdGhlDQoNCk9o
LCBPSy4gSSB0aG91Z2h0IGl0J3MgbGlrZSB2Z2FmYiwgd2hpY2ggZ3JhYnMgdGhlIGZpeGVk
IFZHQSBmcmFtZWJ1ZmZlciANCnJhbmdlLg0KDQo+IEhENjQ0NjFfSU9CQVNFIGlzIHJlbGF0
aXZlIHRvLiBUaGUgaHA2eHggcGxhdGZvcm0gY29kZSBvbmx5IHBhc3NlcyBpdA0KPiB0aHJv
dWdoIGludygpL291dHcoKSwgd2hpY2ggdGFrZSBhbiBvZmZzZXQgcmVsYXRpdmUgdG8gc2hf
aW9fcG9ydF9iYXNlLA0KPiBidXQgdGhhdCBpcyBub3QgaW5pdGlhbGl6ZWQgb24gaHA2eHgu
IEkgdHJpZWQgdG8gZmluZCBpbiB0aGUgaGlzdG9yeQ0KPiB3aGVuIGl0IGJyb2tlLCBhcHBh
cmVudGx5IHRoYXQgd2FzIGluIDIwMDcgY29tbWl0IDM0YTc4MGEwYWZlYiAoInNoOg0KPiBo
cDZ4eCBwYXRhX3BsYXRmb3JtIHN1cHBvcnQuIiksIHdoaWNoIHJlbW92ZWQgdGhlIGN1c3Rv
bSBpbncvb3V0dw0KPiBpbXBsZW1lbnRhdGlvbnMuDQoNClRoYW5rcyBmb3IgbG9va2luZyB0
aGlzIHVwLiBJZiB0aGlzIGRyaXZlciBoYXMgYmVlbiBicm9rZW4gZm9yIDE1IHllYXJzLCAN
CnRoZSBjb3JyZWN0IGZpeCBpcyB0byBkZWxldGUgaXQuIEkndmUgbWVhbndoaWxlIHByZXBh
cmVkIHRoZSBzZWNvbmQtYmVzdCANCmZpeCwgd2hpY2ggaXMgdGhlIHR5cGUgY2FzdGluZy4g
SXQnbGwgYmUgaW4gdGhlIG5leHQgcGF0Y2hzZXQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+ICAgICAgICBBcm5kDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdG
OiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1v
ZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------IBuMtqzq4nm9A3mKPOZXAzct--

--------------gOpI1L9pL7Bq8Fb2HvhAlzDV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRcyTcFAwAAAAAACgkQlh/E3EQov+CN
DA//eC7/2pGbq9WXlm5DpkCSr+KA3eCi9FiYTm4qjDyGoj8p6KJe1IBhFymP11n1J1TKH2y5rfrV
mGwY3w0ZCSVoA6lE/ky+YMtk9FfixMVMoWAnbuhy9mgOvKapLtJLsHCwmJvFzPe/hCMMpH2WFbet
g0xbVgFrew0BFVACsE8Z5Zdu72OjSHZ1UeKw5pJDnZhP8Ve6Ax5biBjzk3rCO5RZcNGUOLOvlW98
CogUbVr9ZPPEE2N1h49QKdgLR14uy27dDmIa4gwBShKLSsH4/REu/t8WBxbMut/lyC07gtUbFk0B
ORC/RTJEBh/PqVSXAfQCq4nZwCYdo7c2JjDctUbNb/zmqeNmPiMcw/s1xRiD1stwWgHQwP/cBSJ8
tmZbMWlLzwPenhKgvMhT6arUL3TLGrvIRXXFinEqhsdIYlaS6tFBUKU+LF1+2cytN0nexk2giAI1
ZxV+aCzgSfC1PjKXNKeraGOWLR9thPzHBGmGjZv/l1ht8SttKkq1P+4HxfIqm6AO4amRLLymWP3t
MishZo5Om5N3W6USdA/dtQbKSbn7IgaUGXYx56S+Cjd24ZuF5qUjssZ8mH8NWPB3nlPZBvvi8eWC
1iW6v8QeIUpftFEtpyumNrmi4lanoL/KbsyHJGapGD5jWcklAeH4eLOUTmCNURjZGd1JBtvEA/ep
dyQ=
=bKPx
-----END PGP SIGNATURE-----

--------------gOpI1L9pL7Bq8Fb2HvhAlzDV--


--===============0595040888693980662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============0595040888693980662==--

