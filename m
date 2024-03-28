Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E17C54E64
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 14:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pmb9bf+pf3T7eTf1J1I187KYHXCHymswJaSPXWpn3Fw=; b=FS58KhPXstRI0W
	v9377g/Ea1Uavycf2XJJXTiKedxW6U3Irpy4D6l1Ndo5Qrg/ch7kZPr1F2KP2lQptgcMMiyZbn2aw
	xIxf9dlPm7ZsEzGompgHweYqqcTc+Kp1F+27swzXVt7Jt39r5UYVSluv/xK5xH8zy0Pcq1Y8pYoSr
	f5rHAzZsbhcFZZPeHCkO5GrU0NOEX/VEwuuSFMoamvQ3hwVzUIVvYaLx2rTRvY1Q4nYMGXgvJJ18I
	XapKc7RgMbbTV7CZsNTVUIrWVM/9iQiCHDKzZcCvjZnbpVb31MU+nzdn6kFjrViKXUnUOPFWlqXc1
	t0WMfSK/++kB3CthJPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqp5-0000000EL0j-2NVj;
	Thu, 28 Mar 2024 14:33:43 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpphf-0000000E5Wo-1hrF;
	Thu, 28 Mar 2024 13:22:04 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CBED233F29;
	Thu, 28 Mar 2024 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711632115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nBV9RrkyQba5NE+tY7TfavXdtDbJlQ91iAXymXIDHBE=;
	b=NGpA6mvg7SFLaMcdkaGNHlk4p5WZfQLCmZYijHyXug8BWvcnMg4XRWGmMu1m+NnOdC6/oC
	jUDkV7nKO3ld0CJ6vYYPtZG6zQsO0ghndq5hj7VZO5H9ndGSF+6C+Jv4zy5f1GP2XU7Iw5
	u0CBN7YO30G0WhadnZ9sTV5sfaFbfRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711632115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nBV9RrkyQba5NE+tY7TfavXdtDbJlQ91iAXymXIDHBE=;
	b=qbyHkPq/SEgcwQyQHpo6vxF0xg5dHYOQjze+ICf8/63zx8Mn9W7pDDngyKiNTe8VHCVPUo
	9PaUNAeWEGZ03PCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711632113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nBV9RrkyQba5NE+tY7TfavXdtDbJlQ91iAXymXIDHBE=;
	b=NY+qt2VhonCWz3P20U2cBtC00PDuVJUkY1lU9QraJMicGNmHTYKZDAep6Ak0qejrElOJmw
	ljjsKl4gZ/2aPeG9JR3jsAaJgN6AGg8ImUaFNSjipl1Sggupx+9Zx+dXGr0aFH3B0gIIC0
	28Xkvoj58+cjVxxwLR8+1wfXV43tRm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711632113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nBV9RrkyQba5NE+tY7TfavXdtDbJlQ91iAXymXIDHBE=;
	b=N4AgHX/br0WdmOd7rgZKyvHTXJi2A3IlhcmW3nOdAH5hh+27AJDHqSmhyc4owM/9a5dw0r
	fcfmhq4WiuAmQ/CA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id CB06813AB3;
	Thu, 28 Mar 2024 13:21:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 3Tx/L/BuBWboPAAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Thu, 28 Mar 2024 13:21:52 +0000
Message-ID: <c114a614-8e65-42a2-8df6-5a3015e79c29@suse.de>
Date: Thu, 28 Mar 2024 14:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arch: Select fbdev helpers with CONFIG_VIDEO
To: Helge Deller <deller@gmx.de>, arnd@arndb.de, javierm@redhat.com,
 sui.jingfeng@linux.dev
Cc: linux-arch@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-2-tzimmermann@suse.de>
 <70aefe08-b4c4-4738-a223-e4b04562cd56@gmx.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <70aefe08-b4c4-4738-a223-e4b04562cd56@gmx.de>
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NY+qt2Vh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="N4AgHX/b"
X-Rspamd-Queue-Id: CBED233F29
X-Spamd-Result: default: False [-5.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmx.de,arndb.de,redhat.com,linux.dev];
	URIBL_BLOCKED(0.00)[imap2.dmz-prg2.suse.org:rdns,imap2.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim,intel.com:email,davemloft.net:email,gmx.de:email,zytor.com:email,hansenpartnership.com:email,linutronix.de:email,gaisler.com:email,alien8.de:email];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_062159_779282_87E24594 
X-CRM114-Status: GOOD (  19.99  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkKCkFtIDI4LjAzLjI0IHVtIDEzOjM5IHNjaHJpZWIgSGVsZ2UgRGVsbGVyOgo+IE9uIDMvMjcv
MjQgMjE6NDEsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+PiBWYXJpb3VzIEtjb25maWcgb3B0
aW9ucyBzZWxlY3RlZCB0aGUgcGVyLWFyY2hpdGVjdHVyZSBoZWxwZXJzIGZvcgo+PiBmYmRldi4g
QnV0IG5vbmUgb2YgdGhlIGNvbnRhaW5lZCBjb2RlIGRlcGVuZHMgb24gZmJkZXYuIFN0YW5kYXJk
aXplCj4+IG9uIENPTkZJR19WSURFTywgd2hpY2ggd2lsbCBhbGxvdyB0byBhZGQgbW9yZSBnZW5l
cmFsIGhlbHBlcnMgZm9yCj4+IHZpZGVvIGZ1bmN0aW9uYWxpdHkuCj4+Cj4+IENPTkZJR19WSURF
TyBwcm90ZWN0cyBlYWNoIGFyY2hpdGVjdHVyZSdzIHZpZGVvLyBkaXJlY3RvcnkuCj4KPiBZb3Vy
IHBhdGNoIGluIGdlbmVyYWwgbG9va3MgZ29vZC4KPiBCdXQgaXMgcmVuYW1pbmcgdGhlIGNvbmZp
ZyBvcHRpb24gZnJvbSBDT05GSUdfRkJfQ09SRSB0byBDT05GSUdfVklERU8KPiB0aGUgYmVzdCBj
aG9pY2U/Cj4gQ09ORklHX1ZJREVPIG1pZ2h0IGJlIG1peGVkIHVwIHdpdGggbXVsdGltZWRpYS92
aWRlby1zdHJlYW1pbmcuCj4KPiBXaHkgbm90IGUuZy4gQ09ORklHX0dSQVBISUNTX0NPUkU/Cj4g
SSdtIGZpbmUgd2l0aCBDT05GSUdfVklERU8gYXMgd2VsbCwgYnV0IGlmIHNvbWVvbmUgaGFzIGEg
YmV0dGVyIGlkZWEKPiB3ZSBtYXliZSBzaG91bGQgZ28gd2l0aCB0aGF0IGluc3RlYWQgbm93PwoK
V2UgYWxyZWFkeSBoYXZlIENPTkZJR19WSURFTyBpbiBkcml2ZXJzL3ZpZGVvL0tjb25maWcgc3Bl
Y2lmaWNhbGx5IGZvciAKc3VjaCBsb3ctbGV2ZWwgZ3JhcGhpY3MgY29kZS4gRm9yIGdlbmVyaWMg
bXVsdGltZWRpYSwgd2UgY291bGQgaGF2ZSAKQ09ORklHX01FRElBLCBDT05GSUdfU1RSRUFNSU5H
LCBldGMuIHJhdGhlciB0aGFuIHJlbmFtaW5nIGFuIGVzdGFibGlzaGVkIApLY29uZmlnIHN5bWJv
bC4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKCj4KPiBIZWxnZQo+Cj4+IFRoaXMKPj4gYWxsb3dzIGZv
ciB0aGUgdXNlIG9mIG1vcmUgZmluZS1ncmFpbmVkIGNvbnRyb2wgZm9yIGVhY2ggZGlyZWN0b3J5
J3MKPj4gZmlsZXMsIHN1Y2ggYXMgdGhlIHVzZSBvZiBDT05GSUdfU1RJX0NPUkUgb24gcGFyaXNj
Lgo+Pgo+PiB2MjoKPj4gLSBzcGFyYzogcmViYXNlZCBvbnRvIE1ha2VmaWxlIGNoYW5nZXMKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Cj4+IENjOiAiSmFtZXMgRS5KLiBCb3R0b21sZXkiIDxKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFy
dG5lcnNoaXAuY29tPgo+PiBDYzogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPgo+PiBDYzog
IkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4+IENjOiBBbmRyZWFzIExh
cnNzb24gPGFuZHJlYXNAZ2Fpc2xlci5jb20+Cj4+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4KPj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+PiBD
YzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+Cj4+IENjOiBEYXZlIEhhbnNlbiA8ZGF2
ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgo+PiBDYzogeDg2QGtlcm5lbC5vcmcKPj4gQ2M6ICJI
LiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL3BhcmlzYy9N
YWtlZmlsZcKgwqDCoMKgwqAgfCAyICstCj4+IMKgIGFyY2gvc3BhcmMvTWFrZWZpbGXCoMKgwqDC
oMKgwqAgfCA0ICsrLS0KPj4gwqAgYXJjaC9zcGFyYy92aWRlby9NYWtlZmlsZSB8IDIgKy0KPj4g
wqAgYXJjaC94ODYvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQo+PiDCoCBhcmNoL3g4
Ni92aWRlby9NYWtlZmlsZcKgwqAgfCAzICsrLQo+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNj
L01ha2VmaWxlIGIvYXJjaC9wYXJpc2MvTWFrZWZpbGUKPj4gaW5kZXggMzE2Zjg0ZjFkMTVjOC4u
MjFiODE2NmE2ODgzOSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9wYXJpc2MvTWFrZWZpbGUKPj4gKysr
IGIvYXJjaC9wYXJpc2MvTWFrZWZpbGUKPj4gQEAgLTExOSw3ICsxMTksNyBAQCBleHBvcnQgTElC
R0NDCj4+Cj4+IMKgIGxpYnMtecKgwqDCoCArPSBhcmNoL3BhcmlzYy9saWIvICQoTElCR0NDKQo+
Pgo+PiAtZHJpdmVycy15ICs9IGFyY2gvcGFyaXNjL3ZpZGVvLwo+PiArZHJpdmVycy0kKENPTkZJ
R19WSURFTykgKz0gYXJjaC9wYXJpc2MvdmlkZW8vCj4+Cj4+IMKgIGJvb3TCoMKgwqAgOj0gYXJj
aC9wYXJpc2MvYm9vdAo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9NYWtlZmlsZSBiL2Fy
Y2gvc3BhcmMvTWFrZWZpbGUKPj4gaW5kZXggMmEwM2RhYTY4ZjI4NS4uNzU3NDUxYzNlYTFkZiAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9zcGFyYy9NYWtlZmlsZQo+PiArKysgYi9hcmNoL3NwYXJjL01h
a2VmaWxlCj4+IEBAIC01OSw4ICs1OSw4IEBAIGVuZGlmCj4+IMKgIGxpYnMtecKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IGFyY2gvc3BhcmMvcHJvbS8KPj4gwqAgbGlicy15wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0gYXJjaC9zcGFyYy9saWIvCj4+Cj4+IC1k
cml2ZXJzLSQoQ09ORklHX1BNKSArPSBhcmNoL3NwYXJjL3Bvd2VyLwo+PiAtZHJpdmVycy0kKENP
TkZJR19GQl9DT1JFKSArPSBhcmNoL3NwYXJjL3ZpZGVvLwo+PiArZHJpdmVycy0kKENPTkZJR19Q
TSnCoMKgwqAgKz0gYXJjaC9zcGFyYy9wb3dlci8KPj4gK2RyaXZlcnMtJChDT05GSUdfVklERU8p
ICs9IGFyY2gvc3BhcmMvdmlkZW8vCj4+Cj4+IMKgIGJvb3QgOj0gYXJjaC9zcGFyYy9ib290Cj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL3ZpZGVvL01ha2VmaWxlIGIvYXJjaC9zcGFyYy92
aWRlby9NYWtlZmlsZQo+PiBpbmRleCBkNGQ4M2YxNzAyYzYxLi45ZGQ4Mjg4MGEwMjdhIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL3NwYXJjL3ZpZGVvL01ha2VmaWxlCj4+ICsrKyBiL2FyY2gvc3BhcmMv
dmlkZW8vTWFrZWZpbGUKPj4gQEAgLTEsMyArMSwzIEBACj4+IMKgICMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seQo+Pgo+PiAtb2JqLSQoQ09ORklHX0ZCX0NPUkUpICs9IGZi
ZGV2Lm8KPj4gK29iai15wqDCoMKgICs9IGZiZGV2Lm8KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L01ha2VmaWxlIGIvYXJjaC94ODYvTWFrZWZpbGUKPj4gaW5kZXggMTVhNWY0ZjJmZjBhYS4uYzBl
YTYxMmM2MmViZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYvTWFrZWZpbGUKPj4gKysrIGIvYXJj
aC94ODYvTWFrZWZpbGUKPj4gQEAgLTI2NSw3ICsyNjUsNyBAQCBkcml2ZXJzLSQoQ09ORklHX1BD
SSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IGFyY2gveDg2L3BjaS8KPj4gwqAgIyBzdXNwZW5k
IGFuZCBoaWJlcm5hdGlvbiBzdXBwb3J0Cj4+IMKgIGRyaXZlcnMtJChDT05GSUdfUE0pICs9IGFy
Y2gveDg2L3Bvd2VyLwo+Pgo+PiAtZHJpdmVycy0kKENPTkZJR19GQl9DT1JFKSArPSBhcmNoL3g4
Ni92aWRlby8KPj4gK2RyaXZlcnMtJChDT05GSUdfVklERU8pICs9IGFyY2gveDg2L3ZpZGVvLwo+
Pgo+PiDCoCAjIyMjCj4+IMKgICMgYm9vdCBsb2FkZXIgc3VwcG9ydC4gU2V2ZXJhbCB0YXJnZXRz
IGFyZSBrZXB0IGZvciBsZWdhY3kgcHVycG9zZXMKPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3Zp
ZGVvL01ha2VmaWxlIGIvYXJjaC94ODYvdmlkZW8vTWFrZWZpbGUKPj4gaW5kZXggNWViZTQ4NzUy
ZmZjNC4uOWRkODI4ODBhMDI3YSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYvdmlkZW8vTWFrZWZp
bGUKPj4gKysrIGIvYXJjaC94ODYvdmlkZW8vTWFrZWZpbGUKPj4gQEAgLTEsMiArMSwzIEBACj4+
IMKgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+PiAtb2JqLSQoQ09O
RklHX0ZCX0NPUkUpwqDCoMKgwqDCoMKgwqAgKz0gZmJkZXYubwo+PiArCj4+ICtvYmotecKgwqDC
oCArPSBmYmRldi5vCj4KCi0tIAotLQpUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApGcmFua2Vuc3Ry
YXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQpHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuCkhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
