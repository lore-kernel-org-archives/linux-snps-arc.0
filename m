Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F4CC77B60
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIhR5j33WBphtJ7Ipaz2ovUEpOoSUI3jSVcs9edqd/U=; b=lGUtiBUK/hdA0jCeilFpaN7F79
	mnghWWC043+Z6jPyuLUbMo583i9y4skfN1TviqIXo/pR7aUEx7XN6D5uIPq3Rry80d1yn/r7GHeS8
	HgEeV3fodaZk346QR7QARVWbc19pWPr6jAUugMAlLAgWnlyu37DfMyuTSZwQcgTN4ssBl279Lbk3K
	mtxTGpo9Qg3wF78uDV0E1XKimD6nHU7xK5llrWnNNjcOiVq++U22EYGrIY5sE9Z1OsU45+td4yvCy
	CevLrWgpbofzNjIPmsCUM1dRRVzPVlN6eIeRplWrWahxGzHHvFs/QGIvOjF6By7TpIRMdQBfcFdI5
	Qe0fnT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psOvv-00AtRO-31;
	Fri, 28 Apr 2023 14:18:47 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psOvs-00AtLr-0E;
	Fri, 28 Apr 2023 14:18:45 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ADA71200BD;
	Fri, 28 Apr 2023 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682691519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bHwqI9LusReiqtzsVrh14x6d8mBbcXqTxS97UaAPiJc=;
	b=w05GEg59ITc0jlfwD4MCtuN0X72pz6Dk79yupOH8T8y0GjYzKjf4ilyl4+c4bi2EFISZQ5
	JnCP5A+fTZuLpKwrFZ+mB3ypDk4/RdMbY5fKYsvUQmf9MzviVugGveRNn50bUaBa6UAzb7
	CxycaLnOid56K6kuD3pQ2q58UTiCr/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682691519;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bHwqI9LusReiqtzsVrh14x6d8mBbcXqTxS97UaAPiJc=;
	b=LLqe0uZG2Qvr6GOce5R8FBohJvmwxtL6Iyv9cM0nb0Y30o/x/QZL8Repm+uPk0JnFqKETT
	6ZDEdP0fwM6gfaAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3ADFB1390E;
	Fri, 28 Apr 2023 14:18:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2ldADb/VS2QLOQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 14:18:39 +0000
Message-ID: <900eaf1c-4d29-2c26-c220-6b4e089d9b94@suse.de>
Date: Fri, 28 Apr 2023 16:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
Content-Language: en-US
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
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <20230428131221.GE3995435@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230428131221.GE3995435@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_071844_251780_E7E05E77 
X-CRM114-Status: GOOD (  24.85  )
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
Content-Type: multipart/mixed; boundary="===============3264800234299332747=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3264800234299332747==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c0F146zPaNsO7viNjr1zOXUQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c0F146zPaNsO7viNjr1zOXUQ
Content-Type: multipart/mixed; boundary="------------Zz5vCKFZk2N0vxBo31k95sox";
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
Message-ID: <900eaf1c-4d29-2c26-c220-6b4e089d9b94@suse.de>
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <20230428131221.GE3995435@ravnborg.org>
In-Reply-To: <20230428131221.GE3995435@ravnborg.org>

--------------Zz5vCKFZk2N0vxBo31k95sox
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDQuMjMgdW0gMTU6MTIgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIEZyaSwgQXByIDI4LCAyMDIzIGF0IDExOjI3OjExQU0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSW1wbGVtZW50IGZyYW1lYnVmZmVy
IEkvTyBoZWxwZXJzLCBzdWNoIGFzIGZiX3JlYWQqKCkgYW5kIGZiX3dyaXRlKigpDQo+PiB3
aXRoIExpbnV4JyByZWd1bGFyIEkvTyBmdW5jdGlvbnMuIFJlbW92ZSBhbGwgaWZkZWYgY2Fz
ZXMgZm9yIHRoZQ0KPj4gdmFyaW91cyBhcmNoaXRlY3R1cmVzLg0KPj4NCj4+IE1vc3Qgb2Yg
dGhlIHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzIHVzZSBfX3Jhd18oKSBJL08gZnVuY3Rpb25z
IG9yIHRyZWF0DQo+PiBmcmFtZWJ1ZmZlciBtZW1vcnkgbGlrZSByZWd1bGFyIG1lbW9yeS4g
VGhpcyBpcyBhbHNvIGltcGxlbWVudGVkIGJ5IHRoZQ0KPj4gYXJjaGl0ZWN0dXJlcycgSS9P
IGZ1bmN0aW9uLCBzbyB3ZSBjYW4gdXNlIHRoZW0gaW5zdGVhZC4NCj4+DQo+PiBTcGFyYyB1
c2VzIFNCdXMgdG8gY29ubmVjdCB0byBmcmFtZWJ1ZmZlciBkZXZpY2VzLiBJdCBwcm92aWRl
cyByZXNwZWN0aXZlDQo+PiBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIGZyYW1lYnVmZmVyIEkv
TyBoZWxwZXJzLiBUaGUgaW52b2x2ZWQgc2J1c18oKQ0KPj4gSS9PIGhlbHBlcnMgbWFwIHRv
IHRoZSBzYW1lIGNvZGUgYXMgU3BhcmMncyByZWd1bGFyIEkvTyBmdW5jdGlvbnMuIEFzDQo+
PiB3aXRoIG90aGVyIHBsYXRmb3Jtcywgd2UgY2FuIHVzZSB0aG9zZSBpbnN0ZWFkLg0KPj4N
Cj4+IFdlIGxlYXZlIGEgVE9ETyBpdGVtIHRvIHJlcGxhY2UgYWxsIGZiXygpIGZ1bmN0aW9u
cyB3aXRoIHRoZWlyIHJlZ3VsYXINCj4+IEkvTyBjb3VudGVycGFydHMgdGhyb3VnaG91dCB0
aGUgZmJkZXYgZHJpdmVycy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPj4gICBpbmNsdWRlL2xpbnV4
L2ZiLmggfCA2MyArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mYi5oIGIvaW5jbHVk
ZS9saW51eC9mYi5oDQo+PiBpbmRleCAwOGNiNDdkYTcxZjguLjRhYTllOTBlZGQxNyAxMDA2
NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZmIuaA0KPj4gKysrIGIvaW5jbHVkZS9saW51
eC9mYi5oDQo+PiBAQCAtMTUsNyArMTUsNiBAQA0KPj4gICAjaW5jbHVkZSA8bGludXgvbGlz
dC5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+DQo+PiAgICNpbmNsdWRl
IDxsaW51eC9zbGFiLmg+DQo+PiAtI2luY2x1ZGUgPGFzbS9pby5oPg0KPj4gICANCj4+ICAg
c3RydWN0IHZtX2FyZWFfc3RydWN0Ow0KPj4gICBzdHJ1Y3QgZmJfaW5mbzsNCj4+IEBAIC01
MTEsNTggKzUxMCwyNiBAQCBzdHJ1Y3QgZmJfaW5mbyB7DQo+PiAgICAqLw0KPj4gICAjZGVm
aW5lIFNUVVBJRF9BQ0NFTEZfVEVYVF9TSElUDQo+PiAgIA0KPj4gLS8vIFRoaXMgd2lsbCBn
byBhd2F5DQo+PiAtI2lmIGRlZmluZWQoX19zcGFyY19fKQ0KPj4gLQ0KPj4gLS8qIFdlIG1h
cCBhbGwgb2Ygb3VyIGZyYW1lYnVmZmVycyBzdWNoIHRoYXQgYmlnLWVuZGlhbiBhY2Nlc3Nl
cw0KPj4gLSAqIGFyZSB3aGF0IHdlIHdhbnQsIHNvIHRoZSBmb2xsb3dpbmcgaXMgc3VmZmlj
aWVudC4NCj4+ICsvKg0KPj4gKyAqIFRPRE86IFVwZGF0ZSBmYmRldiBkcml2ZXJzIHRvIGNh
bGwgdGhlIEkvTyBoZWxwZXJzIGRpcmVjdGx5IGFuZA0KPj4gKyAqICAgICAgIHJlbW92ZSB0
aGUgZmJfKCkgdG9rZW5zLg0KPj4gICAgKi8NCj4gV2hlbiB0aGUgX19yYXdfKiB2YXJpYW50
cyBhcmUgdXNlZCwgYXMgR2VlcnQgcG9pbnRzIG91dCwgdGhlbiBJIHRoaW5rDQo+IHRoZSBt
ZW1jcHkgLyBtZW1zZXQgY2FuIGJlIHJlcGxhY2VkLCBidXQgdGhlIHJlc3Qgc2VlbXMgZmlu
ZSB0byBrZWVwLg0KDQpJJ2QgZWl0aGVyIHdhbnQgdGhlIHJlZ3VsYXIgSS9PIGZ1bmN0aW9u
cyBvciB0aGUgZmJfKCkgd3JhcHBlcnMsIGJ1dCBub3QgDQp0aGUgX19yYXdfKCkgZnVuY3Rp
b24uIEknZCBhbHNvIHByZWZlciB0byBrZWVwIGZiXyBpbiBmcm9udCBvZiBtZW1zZXQgDQph
bmQgbWVtY3B5LiAgSSdkIGJlIGhhcHB5IHRvIGhhdmUgZmJfKCkgd3JhcHBlcnMgdGhhdCBh
cmUgSS9PIGhlbHBlcnMgDQp3aXRob3V0IG9yZGVyaW5nIGd1YXJhbnRlZXMuIEknZCBqdXN0
IHdvdWxkbid0IHdhbnQgdGhlbSBpbiA8bGludXgvZmIuaD4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gTXkgcGVyc29uYWwgb3BpbmlvbiBpcyB0aGF0IF9fcmF3XyogaXMg
Zm9yIG1hY3JvIHVzZSBldGMsIGFuZCBub3QNCj4gc29tZXRoaW5nIHRvIHVzZSBldmVyeXdo
ZXJlLiBTbyBJIGxpa2UgdGhlIGZiX3JlYWQvZmJfd3JpdGUgbWFjcm9zLg0KPiBCdXQgdGhh
dCBpcyBqdXN0IG15IGNvbG9yIG9mIHRoZSBiaWtlc2hlZC4NCj4gDQo+IAlTYW0NCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkw
NDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBB
bmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJl
cmcpDQo=

--------------Zz5vCKFZk2N0vxBo31k95sox--

--------------c0F146zPaNsO7viNjr1zOXUQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRL1b4FAwAAAAAACgkQlh/E3EQov+Ds
HA/9FboYwhheuV2afpQ/SaP1wYDQp07GWmCD6BrWFr+zcYG0SXAkFjvnnZwIE5sxgx63yJaTIS2k
HClkJ6q89fGY/8XISiOhMZDZMO01vbT54iMD9/d/ARiq3sbP6le7jGjhQNf4qQxwChm75nPiRNuk
3DrW9Rd5y5V7zBu5S66Qc+Qa5froBkkkdK6SxeCWHI7IN7uQ/SaA7+MIhoWf6nsShyJIgfXr6Ari
pUx/2n169Cxc34R3ftRVWrInl5pACavFjtXeW9uWHV7HNVWCPby74kN8FYS4SX2V0jDpwiCCMZmd
i2dSuHltV+jyQxEnMhwLRUstXz7n+hnpsIt1qffv8sW5hS2Vz7FIJV1Uf5OQ6Kj+J3iqI6mmb3eW
EtaFwAfj4LB2EaD3pKcZ9M3WjfiXC6+cVQR+cf6jJDJWoJGfbr3KpDFIEa1mMjWrPBM8QGGIGtqv
IfD1TrCQNzo0rb14BPTt0S7UVt8VSCGbLeyZpmiAczti8t6t0rkFS5eCHCfW1rBcRdg0Tn1BsQqm
aE+xNNstqNLpPRpGSvL7AFAbTbpzLJQAeeg58YkytjUB+xq7gQl4Ssff+c99NZZSCKKQM+wRrCpz
nlUyb+lA/nVwARQwrCNXHhxtG9aKcmQ5UcwCWDLGzrPcdLtptct1CdM0YwJqKl6++eigX63ysIgT
+1c=
=t+WE
-----END PGP SIGNATURE-----

--------------c0F146zPaNsO7viNjr1zOXUQ--


--===============3264800234299332747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============3264800234299332747==--

