Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF4BC35671
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 12:54:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7233F2080D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 12:54:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uBW072h1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7233F2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=de2SBOMcSQlz8Bg/uH55YbBtOX0+STc/s+fLS3U1EqQ=; b=uBW072h1KKOVUM
	bx/JnTRlbktNYzPh64HEoEvWlR/fktZVUWwofi7uuE5eRm+/CIdhT7Wsm4/pa1BVTZ48RXyzDO90f
	8L9r390KBDBM48JSPNbhwXjGFh1gA7MAOYG6QI0Bdmz6O91BgWRTF3IQU7UlJvSQuCKSIX3NYv4X2
	bPfGSf9nYoMtdx0n9sSIlnHtIaIAQ8Cbgz2Bzovt615BA+TESFznp7LUCcDaZvhPU6usWZXcT4uvk
	CXpaUyhOveM8dT0n/SxjRXHg+CYd6CTNhJrVjpETDYQGSGLpNalsKsGX1nFthUL5o2IoL1hVVIr1n
	t5fd7yOSlOREUgsOwKMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6DFX-0006x5-IV; Mon, 24 Feb 2020 12:54:15 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6DFU-0006wf-GC
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 12:54:13 +0000
Received: by mail-ot1-f67.google.com with SMTP id p8so8539492oth.10
 for <linux-snps-arc@lists.infradead.org>; Mon, 24 Feb 2020 04:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KuIMkn3CNjUmXT9na5O6u952ZSxUT8pEly8T96UQHaU=;
 b=FCj80L29iLI3T1WYgvezRWF9Nb+4pSYqtZIsrQDk62kC1v0rbLuYlmKGhtOxeJe2jV
 kI88OhgcdWUfxUGi3tifz0jaEEBh8HjS6+guIElBqIjThUzA7Xh1rGYJmpyhLuK3OVbT
 rxkEUsDiouBOs451Qob6IkgAlwo6Tx5+FMyVP51LLeNYJSPqtEmHZK2SdKmm6duJWNwj
 F16pPNZ0hMczoMeEICfj6JbfXwphcaQ+6HYZM9vAECNKzXHG4Af+7CJT1nLv3vLmYk3X
 vIvMiGGavW2v2BkSV+7tZ7x8qYnSqW4aY42dtQqCVK36/8HF0Zggf7IL9geQDmglaz5x
 aEGw==
X-Gm-Message-State: APjAAAWcrG8B7vRmCyiRUUOnSnniyOinq76Ol4+9taeanNAahFOUG4Pi
 2Bxh815XaRalRLta1y4lvNDckAaJqi76REZzhrc=
X-Google-Smtp-Source: APXvYqwtZk2+zO66egcnUYHRtozVqcTMGUrrNpS9RZJQahGOv8qXCcCp9UcRypG9zsmrMsbFU1zCpBady1p1pO44v4k=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr40460889otm.297.1582548851139; 
 Mon, 24 Feb 2020 04:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com> <20200224124744.GA1949@pi3>
In-Reply-To: <20200224124744.GA1949@pi3>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2020 13:54:00 +0100
Message-ID: <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_045412_541512_B0BEEB2A 
X-CRM114-Status: GOOD (  22.28  )
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mLAoKT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTo0NyBQTSBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgRmViIDIwLCAyMDIw
IGF0IDEwOjQ4OjMzQU0gKzAxMDAsIEppcmkgU2xhYnkgd3JvdGU6Cj4gPiBPbiAxOS4gMDIuIDIw
LCAxODo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+ID4gVGhlIGlvcmVhZFgoKSBo
ZWxwZXJzIGhhdmUgaW5jb25zaXN0ZW50IGludGVyZmFjZS4gIE9uIHNvbWUgYXJjaGl0ZWN0dXJl
cwo+ID4gPiB2b2lkICpfX2lvbWVtIGFkZHJlc3MgYXJndW1lbnQgaXMgYSBwb2ludGVyIHRvIGNv
bnN0LCBvbiBzb21lIG5vdC4KPiA+ID4KPiA+ID4gSW1wbGVtZW50YXRpb25zIG9mIGlvcmVhZFgo
KSBkbyBub3QgbW9kaWZ5IHRoZSBtZW1vcnkgdW5kZXIgdGhlIGFkZHJlc3MKPiA+ID4gc28gdGhl
eSBjYW4gYmUgY29udmVydGVkIHRvIGEgImNvbnN0IiB2ZXJzaW9uIGZvciBjb25zdC1zYWZldHkg
YW5kCj4gPiA+IGNvbnNpc3RlbmN5IGFtb25nIGFyY2hpdGVjdHVyZXMuCj4gPiA+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiA+ID4g
QWNrZWQtYnk6IEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYyB8IDEwICsrKysrLS0tLS0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhi
LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmMKPiA+ID4gaW5kZXggMmM5
Y2VjOGI1M2Q5Li44YmQwMWRmMzY5ZmIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGg1ay9haGIuYwo+ID4gPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoNWsvYWhiLmMKPiA+ID4gQEAgLTEzOCwxOCArMTM4LDE4IEBAIHN0YXRpYyBpbnQgYXRo
X2FoYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPgo+ID4gPiAgICAg
aWYgKGJjZmctPmRldmlkID49IEFSNUtfU1JFVl9BUjIzMTVfUjYpIHsKPiA+ID4gICAgICAgICAg
ICAgLyogRW5hYmxlIFdNQUMgQUhCIGFyYml0cmF0aW9uICovCj4gPiA+IC0gICAgICAgICAgIHJl
ZyA9IGlvcmVhZDMyKCh2b2lkIF9faW9tZW0gKikgQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwo+
ID4gPiArICAgICAgICAgICByZWcgPSBpb3JlYWQzMigoY29uc3Qgdm9pZCBfX2lvbWVtICopIEFS
NUtfQVIyMzE1X0FIQl9BUkJfQ1RMKTsKPiA+Cj4gPiBXaGlsZSBJIHVuZGVyc3RhbmQgd2h5IHRo
ZSBwYXJhbWV0ZXIgb2YgaW9yZWFkMzIgc2hvdWxkIGJlIGNvbnN0LCBJCj4gPiBkb24ndCBzZWUg
YSByZWFzb24gZm9yIHRoZXNlIGNhc3RzIG9uIHRoZSB1c2Vycycgc2lkZS4gV2hhdCBkb2VzIGl0
Cj4gPiBicmluZyBleGNlcHQgbG9uZ2VyIGNvZGUgdG8gcmVhZD8KPgo+IEJlY2F1c2UgdGhlIGFy
Z3VtZW50IGlzIGFuIGludDoKPgo+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIu
YzogSW4gZnVuY3Rpb24g4oCYYXRoX2FoYl9wcm9iZeKAmToKPiBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoNWsvYWhiLmM6MTQxOjE4OiB3YXJuaW5nOiBwYXNzaW5nIGFyZ3VtZW50IDEgb2Yg
4oCYaW9yZWFkMzLigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3Qg
Wy1XaW50LWNvbnZlcnNpb25dCj4gICAgcmVnID0gaW9yZWFkMzIoQVI1S19BUjIzMTVfQUhCX0FS
Ql9DVEwpOwoKVGhhdCdzIGFuIGFyZ3VtZW50IGZvciBrZWVwaW5nIHRoZSBjYXN0IHRvICJ2b2lk
IF9faW9tZW0gKiIsIG5vdCBmb3IKYWRkaW5nIHRoZSAiY29uc3QiLCByaWdodD8KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
