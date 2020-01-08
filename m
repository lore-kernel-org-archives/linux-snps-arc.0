Return-Path: <SRS0=NSlt=25=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DB9C33CA2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 08:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD702070E
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 08:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XZbPKyYw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD702070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MV5j/u0FOGND7PdqO1I7DIi56mlJ8G45hMXgQUrYt6g=; b=XZbPKyYwdB5yJF
	7/Gq0/qL5mN9vyE2lxWxJxmpRep4TdZjroyROk0iY+b/PfCZjtTP3JprOgfnK97PsFblexXoVBSpw
	xIAsvkj2p2Z5NP5B4FS/12YsYibPSozwOSNlP8dS2bXnjGwKIxJ8cdmbV2Jjs02oUnGTq/pijA12+
	KYXTIGyK/+HHRztQUvgiu0vjZ34RQLytdGiJzy9AfEENxWkGEp0W58MzQosKDFrIaSsXqVnTVpLo1
	LCZxp/baq1fVup4sCo5c9HaGxu1yZ4MLbS4bksqlUqWV+5sobaEXnN9jfvzSkVFvi0akdXf5OuQBQ
	J8UZrqRYhGrdIeScaktA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip6xY-0005V6-FE; Wed, 08 Jan 2020 08:45:00 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip6xV-0005Ua-Ji
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jan 2020 08:44:59 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MSLEm-1jHozu1jui-00Sfmr for <linux-snps-arc@lists.infradead.org>; Wed, 08
 Jan 2020 09:44:54 +0100
Received: by mail-qk1-f177.google.com with SMTP id x1so1896559qkl.12
 for <linux-snps-arc@lists.infradead.org>; Wed, 08 Jan 2020 00:44:54 -0800 (PST)
X-Gm-Message-State: APjAAAXze5GIhqJV5AfgFuegp0OYqXgK0lmDga3Vy31aYeRDHlD5QMVZ
 3YD62TNuP4AZm5TPeLNl6BsCfSSQRfflzGLp/xM=
X-Google-Smtp-Source: APXvYqwBkJ8QmnIL+nEzdyW4cVb2dCgT1+bxTVHrv/QXRUdjO9mWLnIecKxCrEVE9XkgL278ZPmA2bqFRRwBDXNH4F8=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr3333439qka.286.1578473093254; 
 Wed, 08 Jan 2020 00:44:53 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
In-Reply-To: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 09:44:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
Message-ID: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-Provags-ID: V03:K1:ajygSceM5iLzZPwXK/Hn3RoXDhhet25Z1urQX/S2kI3ZB6Zt0jW
 RM8QVllS94GKQbFtDD0qTwQ8MU2BwwRdrCFKLrtG2fKkc8yETx/dFuUPmRTnMLONJPWbxBO
 Ulw7ah+HTkGQpvZ4j5j404TevAIAkAeHoGi5zNR1MTQ+f+KeS66Ji9xAJSgLc63ItWSw9W2
 xOtEwJaECHVHIRgCQSKBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QeqjLzN5Juw=:mofBEgnIBxn0ytwitCwWCI
 Sa5HaDLjEsAdwABkQATzW5u5icr1QsLpmo0YjXgRHtFNoShVzkvOLm6Yh4j30vxohCROstBoe
 9KGrH52wLBOKR+a5JC3gFH+RqIZCpzA5p3PadpI8UKR/FDQirJPw66g3sMa9CpijGpLbatPpc
 A1nFUlEP5f8ZxvplaFvxz6Fjr1TlSfLcXxDXKtX8VsLnY1lEIq7qcLBW5wbBeS1XPey2xRr6t
 Gqd7kSN4hyJZoMvXpy5Nf71AgVBmlAR5rOuMOE80fhUv0zC8B/4gr3Vl0irkcQF2xAwCE0ehG
 mm1HqdHS7X/ldWLCsnWNV+MndOKYFZIh2dX5Oe4ZRs4iwA8VBa7/rg72lCvZkQD1TH07MoUJo
 94qW/DyLV8bDx0wjWoaN126vZqjZ0K9MsQ8v4Wq7KgiayneGP2GumrXWGWCmER8TJeAFsqZki
 1Gx8ZvtRLU8CLYjcYDzsOS476Apgp00hq7h2/Ud9Ic21dPq5aazQu2jcCtVEgi0OddzBfVaiR
 wtSrIl1dL2C5H2IQNYsdo0Kuf3eW5a0wb26LhEP15H+6Fmt2GUpC5QLpPOP+cV7EtFMhJxk3d
 AyoEobBET/rnJqvafN9spAcee0h6QYtS7bIjIb+ws4vxscLQEVPl03g5QVmReNykfSYmKyJ5J
 Ds1M5oihcLXdquMMTNmlDlEOFinRWFTKXhxZF2+Pi35jBYz+ja2qs1cRJ9pTB+7V5DflFje5/
 3HpmrlGDXFMXxoNDw1wMohGFRwH0IIzQddoarNVmN2Niy0yppHCmpUM3IRTETLH7mjAM9Dh6M
 AVQwp346fQItrSd5q1wa84o4CVCv/nsgJfdVwHqYp009WLfcyIUO5bhORrh/SWIF6uVW9179Z
 IC0YYuk8b54chhGEElEg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_004457_971288_4303402D 
X-CRM114-Status: GOOD (  15.74  )
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCA5OjM2IEFNIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAYy1zLmZyPiB3cm90ZToKPiBMZSAwOC8wMS8yMDIwIMOgIDA5OjE4LCBLcnp5c3p0
b2YgS296bG93c2tpIGEgw6ljcml0IDoKPiA+IE9uIFdlZCwgOCBKYW4gMjAyMCBhdCAwOToxMywg
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiBJJ2xs
IGFkZCB0byB0aGlzIG9uZSBhbHNvIGNoYW5nZXMgdG8gaW9yZWFkWF9yZXAoKSBhbmQgYWRkIGFu
b3RoZXIKPiA+IHBhdGNoIGZvciB2b2xhdGlsZSBmb3IgcmVhZHMgYW5kIHdyaXRlcy4gSSBndWVz
cyB5b3VyIHJldmlldyB3aWxsIGJlCj4gPiBhcHByZWNpYXRlZCBvbmNlIG1vcmUgYmVjYXVzZSBv
ZiBpb3JlYWRYX3JlcCgpCj4gPgo+Cj4gdm9sYXRpbGUgc2hvdWxkIHJlYWxseSBvbmx5IGJlIHVz
ZWQgd2hlcmUgZGVlbWVkIG5lY2Vzc2FyeToKPgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvdm9sYXRpbGUtY29uc2lkZXJlZC1oYXJtZnVsLmh0bWwKPgo+
IEl0IGlzIHNhaWQ6ICIgLi4uICBhY2Nlc3NvciBmdW5jdGlvbnMgbWlnaHQgdXNlIHZvbGF0aWxl
IG9uCj4gYXJjaGl0ZWN0dXJlcyB3aGVyZSBkaXJlY3QgSS9PIG1lbW9yeSBhY2Nlc3MgZG9lcyB3
b3JrLiBFc3NlbnRpYWxseSwKPiBlYWNoIGFjY2Vzc29yIGNhbGwgYmVjb21lcyBhIGxpdHRsZSBj
cml0aWNhbCBzZWN0aW9uIG9uIGl0cyBvd24gYW5kCj4gZW5zdXJlcyB0aGF0IHRoZSBhY2Nlc3Mg
aGFwcGVucyBhcyBleHBlY3RlZCBieSB0aGUgcHJvZ3JhbW1lci4iCgpUaGUgSS9PIGFjY2Vzc29y
cyBhcmUgb25lIG9mIHRoZSBmZXcgcGxhY2VzIGluIHdoaWNoICd2b2xhdGlsZScgZ2VuZXJhbGx5
Cm1ha2VzIHNlbnNlLCBhdCBsZWFzdCBmb3IgdGhlIGltcGxlbWVudGF0aW9ucyB0aGF0IGRvIGEg
cGxhaW4gcG9pbnRlcgpkZXJlZmVyZW5jZSAocHJvYmFibHkgbm9uZSBvZiB0aGUgb25lcyBpbiBx
dWVzdGlvbiBoZXJlKS4KCkluIGNhc2Ugb2YgcmVhZGwvd3JpdGVsLCB0aGlzIGlzIHdoYXQgd2Ug
ZG8gaW4gYXNtLWdlbmVyaWM6CgpzdGF0aWMgaW5saW5lIHUzMiBfX3Jhd19yZWFkbChjb25zdCB2
b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCnsKICAgICAgICByZXR1cm4gKihjb25zdCB2b2xh
dGlsZSB1MzIgX19mb3JjZSAqKWFkZHI7Cn0KClRoZSBfX2ZvcmNlLWNhc3QgdGhhdCByZW1vdmVz
IHRoZSBfX2lvbWVtIGhlcmUgYWxzbyBtZWFucyB0aGF0CnRoZSAndm9sYXRpbGUnIGtleXdvcmQg
Y291bGQgYmUgZHJvcHBlZCBmcm9tIHRoZSBhcmd1bWVudCBsaXN0LAphcyBpdCBoYXMgbm8gcmVh
bCBlZmZlY3QgYW55IG1vcmUsIGJ1dCB0aGVuIHRoZXJlIGFyZSBhIGZldyBkcml2ZXJzCnRoYXQg
bWFyayB0aGVpciBpb21lbSBwb2ludGVycyBhcyBlaXRoZXIgJ3ZvbGF0aWxlIHZvaWQgX19pb21l
bSonIG9yCih3b3JzZSkgJ3ZvbGF0aWxlIHZvaWQgKicsIHNvIHdlIGtlZXAgaXQgaW4gdGhlIGFy
Z3VtZW50IGxpc3QgdG8gbm90CmFkZCB3YXJuaW5ncyBmb3IgdGhvc2UgZHJpdmVycy4KCkl0IG1h
eSBiZSB0aW1lIHRvIGNoYW5nZSB0aGVzZSBkcml2ZXJzIHRvIG5vdCB1c2Ugdm9sYXRpbGUgZm9y
IF9faW9tZW0KcG9pbnRlcnMsIGJ1dCB0aGF0IHNlZW1zIG91dCBvZiBzY29wZSBmb3Igd2hhdCBL
cnp5c3p0b2YgaXMgdHJ5aW5nCnRvIGRvLiBJZGVhbGx5IHdlIHdvdWxkIGJlIGNvbnNpc3RlbnQg
aGVyZSB0aG91Z2gsIGVpdGhlciB1c2luZyB2b2xhdGlsZQphbGwgdGhlIHRpbWUgb3IgbmV2ZXIu
CgogICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
