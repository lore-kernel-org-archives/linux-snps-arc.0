Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF6BC35671
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 14:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E23120836
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 14:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rO1CsBFm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E23120836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=orNecesZ6gi+8wpqPzhAGyD74t1Qtu/rr5lAN1E4hcY=; b=rO1CsBFmboTG0J
	agT5v5l2wzehY/HI6CWlL3uWZomeli0wwZcxmR2/QtQvRzioffjX1aJjVgyXclOeMB2bVzuIRiUW+
	OxaHe/nOq5rTCxTa52NEWP3VHqD7jaWp9WSyv0uubzBK5t1x2Vu85C+nm46rO2b6rR3i9GSbGrcdt
	qYbup5KktDC7bQS13Nt60pgzh4R/JbTT4yeAa9lAifdDlUdCZ53lFHmYSm9zUGbqeOwZ8RV/Qy1y5
	hQiiAfASPrloR6U/axmw1lpzssPz8FKw/nzBZkgQIBp184ReKlo3IGIOhHCYE/tD9mwvdIKgcKxy9
	+75rpfLq98ax3Mcvzkyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6EHX-0001UD-Vz; Mon, 24 Feb 2020 14:00:23 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6EHU-0001T4-Kz
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 14:00:22 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-190-X-jO3NgOPBOoEBZfQglW1g-1; Mon, 24 Feb 2020 14:00:07 +0000
X-MC-Unique: X-jO3NgOPBOoEBZfQglW1g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 24 Feb 2020 14:00:06 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 24 Feb 2020 14:00:06 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Geert Uytterhoeven' <geert@linux-m68k.org>, Krzysztof Kozlowski
 <krzk@kernel.org>
Subject: RE: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Thread-Topic: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Thread-Index: AQHV6xHi6Is+qzzWUUeYTT3fGXH4hqgqXtwg
Date: Mon, 24 Feb 2020 14:00:06 +0000
Message-ID: <ef12bfd658504d928996681f8a9ee96f@AcuMS.aculab.com>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com> <20200224124744.GA1949@pi3>
 <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
In-Reply-To: <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_060020_973129_2FB8F399 
X-CRM114-Status: GOOD (  17.10  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben
 Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>, Matt
 Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Mason <jdmason@kudzu.us>, Ivan
 Kokshaysky <ink@jurassic.park.msu.ru>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuDQo+IFNlbnQ6IDI0IEZlYnJ1YXJ5IDIwMjAgMTI6NTQN
Cj4gVG86IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCi4uLg0KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jIGIvZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jDQo+ID4gPiA+IGluZGV4IDJjOWNlYzhi
NTNkOS4uOGJkMDFkZjM2OWZiIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoNWsvYWhiLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDVrL2FoYi5jDQo+ID4gPiA+IEBAIC0xMzgsMTggKzEzOCwxOCBAQCBzdGF0aWMgaW50
IGF0aF9haGJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ID4NCj4g
PiA+ID4gICAgIGlmIChiY2ZnLT5kZXZpZCA+PSBBUjVLX1NSRVZfQVIyMzE1X1I2KSB7DQo+ID4g
PiA+ICAgICAgICAgICAgIC8qIEVuYWJsZSBXTUFDIEFIQiBhcmJpdHJhdGlvbiAqLw0KPiA+ID4g
PiAtICAgICAgICAgICByZWcgPSBpb3JlYWQzMigodm9pZCBfX2lvbWVtICopIEFSNUtfQVIyMzE1
X0FIQl9BUkJfQ1RMKTsNCj4gPiA+ID4gKyAgICAgICAgICAgcmVnID0gaW9yZWFkMzIoKGNvbnN0
IHZvaWQgX19pb21lbSAqKSBBUjVLX0FSMjMxNV9BSEJfQVJCX0NUTCk7DQo+ID4gPg0KPiA+ID4g
V2hpbGUgSSB1bmRlcnN0YW5kIHdoeSB0aGUgcGFyYW1ldGVyIG9mIGlvcmVhZDMyIHNob3VsZCBi
ZSBjb25zdCwgSQ0KPiA+ID4gZG9uJ3Qgc2VlIGEgcmVhc29uIGZvciB0aGVzZSBjYXN0cyBvbiB0
aGUgdXNlcnMnIHNpZGUuIFdoYXQgZG9lcyBpdA0KPiA+ID4gYnJpbmcgZXhjZXB0IGxvbmdlciBj
b2RlIHRvIHJlYWQ/DQo+ID4NCj4gPiBCZWNhdXNlIHRoZSBhcmd1bWVudCBpcyBhbiBpbnQ6DQo+
ID4NCj4gPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmM6IEluIGZ1bmN0aW9u
IOKAmGF0aF9haGJfcHJvYmXigJk6DQo+ID4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVr
L2FoYi5jOjE0MToxODogd2FybmluZzogcGFzc2luZyBhcmd1bWVudCAxIG9mIOKAmGlvcmVhZDMy
4oCZIG1ha2VzIHBvaW50ZXINCj4gZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2ludC1j
b252ZXJzaW9uXQ0KPiA+ICAgIHJlZyA9IGlvcmVhZDMyKEFSNUtfQVIyMzE1X0FIQl9BUkJfQ1RM
KTsNCj4gDQo+IFRoYXQncyBhbiBhcmd1bWVudCBmb3Iga2VlcGluZyB0aGUgY2FzdCB0byAidm9p
ZCBfX2lvbWVtICoiLCBub3QgZm9yDQo+IGFkZGluZyB0aGUgImNvbnN0IiwgcmlnaHQ/DQoNCk9y
IG1vcmUgbGlrZWx5IGNoYW5nZSB0aGUgZGVmaW5pdGlvbnMgdG8gdXNlIGEgc3RydWN0IGZvciB0
aGUgbGF5b3V0Lg0KVGhhdCBhbHNvIHN0b3BzIHRoZSBjb25zdGFudHMgYmVpbmcgdXNlZCBpbiB0
aGUgd3JvbmcgcGxhY2UuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNp
ZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsN
ClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
