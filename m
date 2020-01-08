Return-Path: <SRS0=NSlt=25=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CDFC33CA2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 08:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27CD0206DA
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 08:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jWnr+dkx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27CD0206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKd2NSJkzzhOV7bttK+zq3+64yrDI3ZzuRfd9dphXXE=; b=jWnr+dkxDpvYAT
	GETji5bwRjyHjHm0aEAMD93bhkgGq1U148P4JKZJyot1e7ElbgZ1KNWIMYXi1RTrThf21l3lGMQpB
	F90JytIGktSetRyXWnkSGDy9+jS6tUXm7NsIfja6CWMhysmeawgQ2RGxa9bP2brGj58/9pMr/W5xL
	KGzh7bl0s7kLAf7LDScsdlHlfqYl5IMsgWiDPmBpQQBUmya+b7ZLAuDCT3mWk/zjQkLoR1JtjznQl
	Y/8xedfph+xUhZ1y2LSg0rsQTp09XoSlB6fWgr4/hvI65/OxmlG6XJ8m6+XieHB6fq7wtOAIglGye
	Org+O6Lz+rQ2m2T3+rkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip6vu-0005Nu-60; Wed, 08 Jan 2020 08:43:18 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip6vs-0005My-4y
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jan 2020 08:43:17 +0000
Received: by mail-ot1-f65.google.com with SMTP id p8so2807461oth.10
 for <linux-snps-arc@lists.infradead.org>; Wed, 08 Jan 2020 00:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7cWBGOss6IZmXIImkX09JkN+lqirutcjNONiaHMIXk4=;
 b=AXaDiEI+xDTbSpXld5VqjzY1WaOl0jjRzzeUGmt3KcVwyJ0rKv/oGS34+QiJ2do/rj
 S0xJZ8sVwlQyxWzGd0VJS99CEfSr7YVoqqQp7CeoSBFS9eXjZTB92V5XI9IlXdJrLf2U
 CboCDfHevwCWkD/RpdwVkqKLV7DU2oveykWpb6QKPe//0/SstTNZKkFkQYHOjsHX3N+2
 fzJQXAO3k2ZZLXb+zPZIvkW+hp2SaY7/raAwc9kTivcBxsCDWrll0FAjhjqUbMyfHzme
 ncvrZaG9rOLA9fpjOQ9yINDs0FXMSSfDRvyBkc9I2KXnTjZv2svc6DrctYtkCLjmcfSV
 BjhA==
X-Gm-Message-State: APjAAAVak5xnJwwhwFcylcq7kKxdf5smqjImx1sl2A+NtLSC/oFEHQ4g
 iahSY5XqzYtzwaPrGTm7l085Ndt+83pomabFvKw=
X-Google-Smtp-Source: APXvYqyLwchytFfBRcGzmYLq5q4p5hvwH1AjnwV9nNk5cX7+q/Njb59ahRoMRaX1Y0RAyipVtDWx7V8ZzLixl6z6dho=
X-Received: by 2002:a9d:6a84:: with SMTP id l4mr3302303otq.145.1578472995351; 
 Wed, 08 Jan 2020 00:43:15 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
In-Reply-To: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:43:04 +0100
Message-ID: <CAMuHMdV=-m-eN4rOa=XQhk2oBDZZwgXXMU6RMVQRVsc6ALyeoA@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_004316_189720_DDE06C16 
X-CRM114-Status: GOOD (  15.34  )
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
 nouveau@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Mason <jdmason@kudzu.us>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
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

SGkgQ2hyaXN0b3BoZSwKCk9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgOTozNSBBTSBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4gd3JvdGU6Cj4gTGUgMDgvMDEvMjAyMCDD
oCAwOToxOCwgS3J6eXN6dG9mIEtvemxvd3NraSBhIMOpY3JpdCA6Cj4gPiBPbiBXZWQsIDggSmFu
IDIwMjAgYXQgMDk6MTMsIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+ID4+IE9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgOTowNyBBTSBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+Pj4gT24gVHVlLCBKYW4gNywg
MjAyMCBhdCA1OjUzIFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPj4+PiBUaGUgaW9yZWFkOC8xNi8zMigpIGFuZCBvdGhlcnMgaGF2ZSBpbmNvbnNpc3Rl
bnQgaW50ZXJmYWNlIGFtb25nIHRoZQo+ID4+Pj4gYXJjaGl0ZWN0dXJlczogc29tZSB0YWtpbmcg
YWRkcmVzcyBhcyBjb25zdCwgc29tZSBub3QuCj4gPj4+Pgo+ID4+Pj4gSXQgc2VlbXMgdGhlcmUg
aXMgbm90aGluZyByZWFsbHkgc3RvcHBpbmcgYWxsIG9mIHRoZW0gdG8gdGFrZQo+ID4+Pj4gcG9p
bnRlciB0byBjb25zdC4KPiA+Pj4KPiA+Pj4gU2hvdWxkbid0IGFsbCBvZiB0aGVtIHRha2UgY29u
c3Qgdm9sYXRpbGUgX19pb21lbSBwb2ludGVycz8KPiA+Pj4gSXQgc2VlbXMgdGhlICJ2b2xhdGls
ZSIgaXMgbWlzc2luZyBmcm9tIGFsbCBidXQgdGhlIGltcGxlbWVudGF0aW9ucyBpbgo+ID4+PiBp
bmNsdWRlL2FzbS1nZW5lcmljL2lvLmguCj4gPj4KPiA+PiBBcyBteSAidm9sYXRpbGUiIGNvbW1l
bnQgYXBwbGllcyB0byBpb3dyaXRlKigpLCB0b28sIHByb2JhYmx5IHRoYXQgc2hvdWxkIGJlCj4g
Pj4gZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoLgo+ID4+Cj4gPj4gSGVuY2Ugd2l0aCBwYXRjaGVz
IDEtNSBzcXVhc2hlZCwgYW5kIGZvciBwYXRjaGVzIDExLTEzOgo+ID4+IFJldmlld2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4KPiA+IEknbGwg
YWRkIHRvIHRoaXMgb25lIGFsc28gY2hhbmdlcyB0byBpb3JlYWRYX3JlcCgpIGFuZCBhZGQgYW5v
dGhlcgo+ID4gcGF0Y2ggZm9yIHZvbGF0aWxlIGZvciByZWFkcyBhbmQgd3JpdGVzLiBJIGd1ZXNz
IHlvdXIgcmV2aWV3IHdpbGwgYmUKPiA+IGFwcHJlY2lhdGVkIG9uY2UgbW9yZSBiZWNhdXNlIG9m
IGlvcmVhZFhfcmVwKCkKPgo+IHZvbGF0aWxlIHNob3VsZCByZWFsbHkgb25seSBiZSB1c2VkIHdo
ZXJlIGRlZW1lZCBuZWNlc3Nhcnk6Cj4KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1s
L2xhdGVzdC9wcm9jZXNzL3ZvbGF0aWxlLWNvbnNpZGVyZWQtaGFybWZ1bC5odG1sCj4KPiBJdCBp
cyBzYWlkOiAiIC4uLiAgYWNjZXNzb3IgZnVuY3Rpb25zIG1pZ2h0IHVzZSB2b2xhdGlsZSBvbgo+
IGFyY2hpdGVjdHVyZXMgd2hlcmUgZGlyZWN0IEkvTyBtZW1vcnkgYWNjZXNzIGRvZXMgd29yay4g
RXNzZW50aWFsbHksCj4gZWFjaCBhY2Nlc3NvciBjYWxsIGJlY29tZXMgYSBsaXR0bGUgY3JpdGlj
YWwgc2VjdGlvbiBvbiBpdHMgb3duIGFuZAo+IGVuc3VyZXMgdGhhdCB0aGUgYWNjZXNzIGhhcHBl
bnMgYXMgZXhwZWN0ZWQgYnkgdGhlIHByb2dyYW1tZXIuIgoKVGhhdCBpcyBleGFjdGx5IHRoZSB1
c2UgY2FzZSBoZXJlOiBhbGwgYWJvdmUgYXJlIGFjY2Vzc29yIGZ1bmN0aW9ucy4KCldoeSB3b3Vs
ZCBpb3JlYWRYKCkgbm90IG5lZWQgdm9sYXRpbGUsIHdoaWxlIHJlYWRZKCkgZG9lcz8KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1h
cmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
