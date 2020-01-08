Return-Path: <SRS0=NSlt=25=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FB5C00523
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 09:15:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC21A20643
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 09:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYeI3j/1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC21A20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGFrikrJ7OSOiILG8U2fhyckseZiYL+acy8/zWSjBOQ=; b=SYeI3j/1tJo2yN
	J/spK9+EHPlpg2J63Peg3F8COE74a7AgJy1cZ1RpQK0v+uKs04fAY++lh0/GBRaLNtyAZAc6tRJuq
	3CAZ92iO4d8CkWc4hxiNmULtpOXVGHoTjRJGKlr9tdFNAqac7RaUyOaggsPbDOXCZM4j/Ievpsmaf
	aQhbnjzW6BYnf6Zz35DjM1f0jWht2/p4jM8wiS1t7tVI+uZWGzb01kLnpa9XDfkizyaXF1T03PBh5
	C8jlIeZKP0HfanlATsHpOFCNYICwyFTJ+hJKLbGuuaz5K73rujD5ndMRh7FQPPRbPZFCCNnOuZRhU
	eYbK4q8kQbXZVSjkwdaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip7RW-0001Gj-Re; Wed, 08 Jan 2020 09:15:58 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip7RU-0001GJ-1R
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jan 2020 09:15:57 +0000
Received: by mail-ed1-f67.google.com with SMTP id bx28so1931408edb.11
 for <linux-snps-arc@lists.infradead.org>; Wed, 08 Jan 2020 01:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vfyps/IUL6/PJnjolCWEAdH26MAmNPDn2opwbDbnepg=;
 b=IRSYhekOZeuO+utUuksNHvI3zjWpruizX5+7/n39U8+dlqTw62Pu/2QcdEzklg08y0
 eMYERTNeP6TbExz4Wma7A78e6gp8PZXUnQClq8KfhEfY/oLAaPpezUrPrilD3/doUQQ/
 K0goP7w87vap8Ds82liywxmJFnwFy1d5A4Kg3+PmyJGQgG++mTp0Z48GD14CuzJuQXS1
 J53OwsiZHPj7ICL3Za3O8InIrrapoSKEojvUY4XqmofwOsXhl4UxM/H/7GokHW7S2aO3
 bNZQZCxcR+W8RwJMJNaV3uk054vHTawcQbkT/nGMJm/65lHvlvmo03FAS6jCRXiL79cj
 vsEQ==
X-Gm-Message-State: APjAAAVJeZkjXmBC6DShwUpZWMTLvppLXcaaLaKpOAN/ilCqNqyPwasB
 zxl2r+jiCCjCxWWH6JTqUgY=
X-Google-Smtp-Source: APXvYqwWgb4dfQDzLCQ3ihOQo6HGElfX4FRxgQVj5VsuPKdEU0cfakNWGRh627mzzt3wCzM621IKeg==
X-Received: by 2002:aa7:c4c8:: with SMTP id p8mr4353856edr.72.1578474953961;
 Wed, 08 Jan 2020 01:15:53 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id y4sm54018edl.11.2020.01.08.01.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 01:15:53 -0800 (PST)
Date: Wed, 8 Jan 2020 10:15:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
Message-ID: <20200108091549.GB10145@pi3>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
 <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_011556_083143_AA619DB5 
X-CRM114-Status: GOOD (  20.33  )
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
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

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDk6NDQ6MzZBTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBXZWQsIEphbiA4LCAyMDIwIGF0IDk6MzYgQU0gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+IHdyb3RlOgo+ID4gTGUgMDgvMDEvMjAyMCDDoCAwOTox
OCwgS3J6eXN6dG9mIEtvemxvd3NraSBhIMOpY3JpdCA6Cj4gPiA+IE9uIFdlZCwgOCBKYW4gMjAy
MCBhdCAwOToxMywgR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3Jv
dGU6Cj4gPiA+IEknbGwgYWRkIHRvIHRoaXMgb25lIGFsc28gY2hhbmdlcyB0byBpb3JlYWRYX3Jl
cCgpIGFuZCBhZGQgYW5vdGhlcgo+ID4gPiBwYXRjaCBmb3Igdm9sYXRpbGUgZm9yIHJlYWRzIGFu
ZCB3cml0ZXMuIEkgZ3Vlc3MgeW91ciByZXZpZXcgd2lsbCBiZQo+ID4gPiBhcHByZWNpYXRlZCBv
bmNlIG1vcmUgYmVjYXVzZSBvZiBpb3JlYWRYX3JlcCgpCj4gPiA+Cj4gPgo+ID4gdm9sYXRpbGUg
c2hvdWxkIHJlYWxseSBvbmx5IGJlIHVzZWQgd2hlcmUgZGVlbWVkIG5lY2Vzc2FyeToKPiA+Cj4g
PiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3ZvbGF0aWxl
LWNvbnNpZGVyZWQtaGFybWZ1bC5odG1sCj4gPgo+ID4gSXQgaXMgc2FpZDogIiAuLi4gIGFjY2Vz
c29yIGZ1bmN0aW9ucyBtaWdodCB1c2Ugdm9sYXRpbGUgb24KPiA+IGFyY2hpdGVjdHVyZXMgd2hl
cmUgZGlyZWN0IEkvTyBtZW1vcnkgYWNjZXNzIGRvZXMgd29yay4gRXNzZW50aWFsbHksCj4gPiBl
YWNoIGFjY2Vzc29yIGNhbGwgYmVjb21lcyBhIGxpdHRsZSBjcml0aWNhbCBzZWN0aW9uIG9uIGl0
cyBvd24gYW5kCj4gPiBlbnN1cmVzIHRoYXQgdGhlIGFjY2VzcyBoYXBwZW5zIGFzIGV4cGVjdGVk
IGJ5IHRoZSBwcm9ncmFtbWVyLiIKPiAKPiBUaGUgSS9PIGFjY2Vzc29ycyBhcmUgb25lIG9mIHRo
ZSBmZXcgcGxhY2VzIGluIHdoaWNoICd2b2xhdGlsZScgZ2VuZXJhbGx5Cj4gbWFrZXMgc2Vuc2Us
IGF0IGxlYXN0IGZvciB0aGUgaW1wbGVtZW50YXRpb25zIHRoYXQgZG8gYSBwbGFpbiBwb2ludGVy
Cj4gZGVyZWZlcmVuY2UgKHByb2JhYmx5IG5vbmUgb2YgdGhlIG9uZXMgaW4gcXVlc3Rpb24gaGVy
ZSkuCj4gCj4gSW4gY2FzZSBvZiByZWFkbC93cml0ZWwsIHRoaXMgaXMgd2hhdCB3ZSBkbyBpbiBh
c20tZ2VuZXJpYzoKPiAKPiBzdGF0aWMgaW5saW5lIHUzMiBfX3Jhd19yZWFkbChjb25zdCB2b2xh
dGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCj4gewo+ICAgICAgICAgcmV0dXJuICooY29uc3Qgdm9s
YXRpbGUgdTMyIF9fZm9yY2UgKilhZGRyOwo+IH0KClN1cGVySCBpcyBhbm90aGVyIGV4YW1wbGU6
CjEuIGlvcmVhZDhfcmVwKHZvaWQgX19pb21lbSAqYWRkciwgdm9pZCAqZHN0LCB1bnNpZ25lZCBs
b25nIGNvdW50KQogICBjYWxscyBtbWlvX2luc2IoKQoKMi4gc3RhdGljIGlubGluZSB2b2lkIG1t
aW9faW5zYih2b2lkIF9faW9tZW0gKmFkZHIsIHU4ICpkc3QsIGludCBjb3VudCkKICAgY2FsbHMg
X19yYXdfcmVhZGIoKQoKMy4gI2RlZmluZSBfX3Jhd19yZWFkYihhKSAgICAgICAgICAoX19jaGtf
aW9fcHRyKGEpLCAqKHZvbGF0aWxlIHU4ICBfX2ZvcmNlICopKGEpKQoKRXZlbiBpZiBpbnRlcmZh
Y2Ugd2FzIG5vdCBtYXJrZWQgYXMgdm9sYXRpbGUsIGluIGZhY3QgaXRzIGltcGxlbWVudGF0aW9u
CndhcyBjYXN0aW5nIHRvIHZvbGF0aWxlLgoKPiBUaGUgX19mb3JjZS1jYXN0IHRoYXQgcmVtb3Zl
cyB0aGUgX19pb21lbSBoZXJlIGFsc28gbWVhbnMgdGhhdAo+IHRoZSAndm9sYXRpbGUnIGtleXdv
cmQgY291bGQgYmUgZHJvcHBlZCBmcm9tIHRoZSBhcmd1bWVudCBsaXN0LAo+IGFzIGl0IGhhcyBu
byByZWFsIGVmZmVjdCBhbnkgbW9yZSwgYnV0IHRoZW4gdGhlcmUgYXJlIGEgZmV3IGRyaXZlcnMK
PiB0aGF0IG1hcmsgdGhlaXIgaW9tZW0gcG9pbnRlcnMgYXMgZWl0aGVyICd2b2xhdGlsZSB2b2lk
IF9faW9tZW0qJyBvcgo+ICh3b3JzZSkgJ3ZvbGF0aWxlIHZvaWQgKicsIHNvIHdlIGtlZXAgaXQg
aW4gdGhlIGFyZ3VtZW50IGxpc3QgdG8gbm90Cj4gYWRkIHdhcm5pbmdzIGZvciB0aG9zZSBkcml2
ZXJzLgo+IAo+IEl0IG1heSBiZSB0aW1lIHRvIGNoYW5nZSB0aGVzZSBkcml2ZXJzIHRvIG5vdCB1
c2Ugdm9sYXRpbGUgZm9yIF9faW9tZW0KPiBwb2ludGVycywgYnV0IHRoYXQgc2VlbXMgb3V0IG9m
IHNjb3BlIGZvciB3aGF0IEtyenlzenRvZiBpcyB0cnlpbmcKPiB0byBkby4gSWRlYWxseSB3ZSB3
b3VsZCBiZSBjb25zaXN0ZW50IGhlcmUgdGhvdWdoLCBlaXRoZXIgdXNpbmcgdm9sYXRpbGUKPiBh
bGwgdGhlIHRpbWUgb3IgbmV2ZXIuCgpJbmRlZWQuIEkgZ3Vlc3MgdGhlcmUgYXJlIG5vIG9iamVj
dGlvbnMgYXJvdW5kIGNvbnN0IHNvIGxldCBtZSBzZW5kIHYyCmZvciBjb25zdCBvbmx5LgoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
