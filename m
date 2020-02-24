Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86A6C11D2F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 14:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF9A220714
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 14:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XSfBZeni"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF9A220714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5eMMhe6caMsiUUM3MalZ5b/l2NTYnVw/cjaG4kR3IA=; b=XSfBZeniX0TQTS
	eUg3tkrlz6xl40WAyo/E2kCCh3xQTR4/bf0NOpu+qhwB9sWomf4/6s+v/tY0qs6uh9rFLqAilX0Pc
	ehYhji0y1mj+y/QJzd0MCQUzS7NI1CwngHwzyYX95Usp2wUMXXyf4q+WgWNPZTGO/cBFwqc3EskQF
	X/OLwkaXP6r/foKGFVjvpEkKrfDCWH8u89JFSNyCBlp9MyJ9mazysG0C02n2ik5uWzi9FN9B688Iw
	ue1GAvXYmTnxjB3OpRVNlGj8ej2rnlzJiMQVT/e7pahIq8ttjQimGLx/42YXS8nV6rPOpSXQvPDwv
	HWSbf3sWLEcuRPhNDRlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Ezz-00080j-GH; Mon, 24 Feb 2020 14:46:19 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Ey4-0004yj-ST
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 14:44:22 +0000
Received: by mail-ed1-f65.google.com with SMTP id c7so12160278edu.2
 for <linux-snps-arc@lists.infradead.org>; Mon, 24 Feb 2020 06:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9BiQIzqw1g4Lc7fCMo41b2Sms1ZkrHji7czRtN4yRpY=;
 b=SMcFtpDmLkKGYyrD9CJq/fvXq6QWfgsq0RCwb/TMgjGX9FxeJkTpfF1H5hDddTCrFF
 XOvL1zZ3o+ViyFSSaK8agbc1BTogHxUjNrobEPQNYH7B2r2fqhifFc1/0IMnadtDnc09
 kQInSoxxZteDf7HOBteGijRq9FUJIxSq77rAh4T4/tVnVQwphVt6teZ+2nk6uhgkEN2Z
 wsRbPk0o76ztFGEocVuW2n5GJViSDXqTUNYDHkCeoN/XJTw4LxUdy/m9eoA2fA3C1/E6
 WaVl/NpMiJDJUyiM62yB7N7hWi/S+65dYXpmHqvGgDvF8OqwAYcGFSUYebhpkhYXGku6
 F57A==
X-Gm-Message-State: APjAAAWawFT/VEamfkrvik9yDqXC8WWYk5N0j5IJMr6KZ5AuAJu/W61q
 QbgRaewoGRTEBCZ57WMhQik=
X-Google-Smtp-Source: APXvYqzwji2Ykgei/T3ukpc15pByx2S09B2SSkaAFB5FVLPyRnARm/VtcP3TWvca57zCxPIFcvsdrw==
X-Received: by 2002:a17:906:5604:: with SMTP id
 f4mr47998768ejq.255.1582555459077; 
 Mon, 24 Feb 2020 06:44:19 -0800 (PST)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id a10sm961255edt.50.2020.02.24.06.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:44:17 -0800 (PST)
Date: Mon, 24 Feb 2020 15:44:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Message-ID: <20200224144413.GA2054@pi3>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
 <20200224124744.GA1949@pi3>
 <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVev0PLF=8bD3nHrhcU9UgM-DAgdQpXi09PgvAxdbt24A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_064420_928479_42E8AF59 
X-CRM114-Status: GOOD (  26.31  )
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

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDE6NTQ6MDBQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIEtyenlzenRvZiwKPiAKPiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAx
OjQ3IFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBP
biBUaHUsIEZlYiAyMCwgMjAyMCBhdCAxMDo0ODozM0FNICswMTAwLCBKaXJpIFNsYWJ5IHdyb3Rl
Ogo+ID4gPiBPbiAxOS4gMDIuIDIwLCAxODo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToK
PiA+ID4gPiBUaGUgaW9yZWFkWCgpIGhlbHBlcnMgaGF2ZSBpbmNvbnNpc3RlbnQgaW50ZXJmYWNl
LiAgT24gc29tZSBhcmNoaXRlY3R1cmVzCj4gPiA+ID4gdm9pZCAqX19pb21lbSBhZGRyZXNzIGFy
Z3VtZW50IGlzIGEgcG9pbnRlciB0byBjb25zdCwgb24gc29tZSBub3QuCj4gPiA+ID4KPiA+ID4g
PiBJbXBsZW1lbnRhdGlvbnMgb2YgaW9yZWFkWCgpIGRvIG5vdCBtb2RpZnkgdGhlIG1lbW9yeSB1
bmRlciB0aGUgYWRkcmVzcwo+ID4gPiA+IHNvIHRoZXkgY2FuIGJlIGNvbnZlcnRlZCB0byBhICJj
b25zdCIgdmVyc2lvbiBmb3IgY29uc3Qtc2FmZXR5IGFuZAo+ID4gPiA+IGNvbnNpc3RlbmN5IGFt
b25nIGFyY2hpdGVjdHVyZXMuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gPiA+ID4gQWNrZWQtYnk6IEthbGxlIFZh
bG8gPGt2YWxvQGNvZGVhdXJvcmEub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmMgfCAxMCArKysrKy0tLS0tCj4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jIGIvZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jCj4gPiA+ID4gaW5kZXggMmM5Y2VjOGI1
M2Q5Li44YmQwMWRmMzY5ZmIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDVrL2FoYi5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDVrL2FoYi5jCj4gPiA+ID4gQEAgLTEzOCwxOCArMTM4LDE4IEBAIHN0YXRpYyBpbnQgYXRo
X2FoYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiA+Cj4gPiA+ID4g
ICAgIGlmIChiY2ZnLT5kZXZpZCA+PSBBUjVLX1NSRVZfQVIyMzE1X1I2KSB7Cj4gPiA+ID4gICAg
ICAgICAgICAgLyogRW5hYmxlIFdNQUMgQUhCIGFyYml0cmF0aW9uICovCj4gPiA+ID4gLSAgICAg
ICAgICAgcmVnID0gaW9yZWFkMzIoKHZvaWQgX19pb21lbSAqKSBBUjVLX0FSMjMxNV9BSEJfQVJC
X0NUTCk7Cj4gPiA+ID4gKyAgICAgICAgICAgcmVnID0gaW9yZWFkMzIoKGNvbnN0IHZvaWQgX19p
b21lbSAqKSBBUjVLX0FSMjMxNV9BSEJfQVJCX0NUTCk7Cj4gPiA+Cj4gPiA+IFdoaWxlIEkgdW5k
ZXJzdGFuZCB3aHkgdGhlIHBhcmFtZXRlciBvZiBpb3JlYWQzMiBzaG91bGQgYmUgY29uc3QsIEkK
PiA+ID4gZG9uJ3Qgc2VlIGEgcmVhc29uIGZvciB0aGVzZSBjYXN0cyBvbiB0aGUgdXNlcnMnIHNp
ZGUuIFdoYXQgZG9lcyBpdAo+ID4gPiBicmluZyBleGNlcHQgbG9uZ2VyIGNvZGUgdG8gcmVhZD8K
PiA+Cj4gPiBCZWNhdXNlIHRoZSBhcmd1bWVudCBpcyBhbiBpbnQ6Cj4gPgo+ID4gZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jOiBJbiBmdW5jdGlvbiDigJhhdGhfYWhiX3Byb2Jl
4oCZOgo+ID4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL2FoYi5jOjE0MToxODogd2Fy
bmluZzogcGFzc2luZyBhcmd1bWVudCAxIG9mIOKAmGlvcmVhZDMy4oCZIG1ha2VzIHBvaW50ZXIg
ZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2ludC1jb252ZXJzaW9uXQo+ID4gICAgcmVn
ID0gaW9yZWFkMzIoQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwo+IAo+IFRoYXQncyBhbiBhcmd1
bWVudCBmb3Iga2VlcGluZyB0aGUgY2FzdCB0byAidm9pZCBfX2lvbWVtICoiLCBub3QgZm9yCj4g
YWRkaW5nIHRoZSAiY29uc3QiLCByaWdodD8KClllcywgY29ycmVjdC4gTWF5YmUgSSBtaXN1bmRl
cnN0b29kIHRoZSBxdWVzdGlvbi4uLiBUaGUgY29uc3Qgb24gdGhlCm90aGVyIGhhbmQgZG9lcyBu
b3QgaGF2ZSB0byBiZSBpbiB0aGUgY2FzdC4gSXQgaXMgbWVyZWx5IGZvciBtYWtpbmcgaXQKY29u
c2lzdGVudCB3aXRoIGludGVyZmFjZS4gSXQgaXMgbm90IHJlcXVpcmVkLiBJIGFsc28gbWVudGlv
bmVkIGl0IGluCnRoZSBjb3ZlciBsZXR0ZXI6CiJQQXRjaGVzIDUtOSBhcmUgb3B0aW9uYWwgY2xl
YW51cCwgd2l0aG91dCBhY3R1YWwgaW1wYWN0IgoKRmVlbCBmcmVlIHRvIGlnbm9yZSB0aGlzIG9u
ZSBpZiBpdCBpcyBub3Qgd29ydGggdGhlIGVmZm9ydC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
