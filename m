Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E54CC35671
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 12:47:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 051EB2072D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 12:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uX1ktX68"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 051EB2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h13MhI2CY/vEBDzCK7fLp3SK9Kss+43FJ83qMzU6fEI=; b=uX1ktX68Mrbsf0
	EuSXoVBLZWElIxGs+Jdsj+PSsseeh/Snj4MrbhQELZL2icZh3eyW97JS3NivoSyma48+MdOTB8MXs
	5RnVHWBInpO+twV09gJNXfTJXa0Wsb9Opz/2fksxc2I8ZL+hxsliD+o9N7pq+N1b4dz1eKXrsCFs+
	BdjMFnVmnNKdACOqIhyQFzjaW+JRLqC8vMsfJNukylHEinYWVOnW5SVdyfldB7SCS/8DlrcGeaVty
	DU7eSY3Ffm2JOmQCXRLu+F03zH8+px1yqVgdxTZ8KiQWzGmeh2wVgCQubHXDZpBd3jSP4bWLj1nV5
	hy2QpNBmuYk4O4xaL3Lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6D9N-0005EI-OA; Mon, 24 Feb 2020 12:47:53 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6D9L-0005Dz-Hg
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 12:47:52 +0000
Received: by mail-ed1-f68.google.com with SMTP id v28so11705551edw.12
 for <linux-snps-arc@lists.infradead.org>; Mon, 24 Feb 2020 04:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6p1Rm/cgq3FqTcHGA+7QXUNsBMb6waSsaCWakkpOhMI=;
 b=o+fzU7ScSNWmDD/rvzUXByxiLzP57T4wLp+6lufEb+8ZiuTh8ILgMWwoGyhZVuGVCX
 LLTsy2iOQejlTqjxxY9JboCdbgpomxXIEybJyt+uS45oFgpmk6nMrleMOXUj+8C9diz3
 cyHq8XfXPXqXcbrvsFNktPyofiQ59Ni/eEvsNJDkMkSbtVHywBhu/ZXaK+YQKRRqZbJ3
 MzZQeGU9q4RiJYHLTYIH5OUOlIk6YRPS+5qjkJ/4Xblh1sUvhQe/8IN/AXXa7mYvC0de
 VGxZxGRkiTR2GgAb2SZ6Agcigk8YSIuGUhimHwSOZFclxSCQut3XAwmXt5kEoerIZY7q
 XCCA==
X-Gm-Message-State: APjAAAWuFT8w+ijd9cT7hI8d64masSgRcXR34DaZnNVnckOhibr03wZ+
 fLf9/AYFfslJ96fti8J+r8U=
X-Google-Smtp-Source: APXvYqxOCnjuqHzZ8w9dppB5X8CKpWu3LAO4qx3F7JuCo/1tjWWY0qRzHXx7PYmPGsjZ1wOThemeng==
X-Received: by 2002:a17:906:7fd0:: with SMTP id
 r16mr45290488ejs.319.1582548468870; 
 Mon, 24 Feb 2020 04:47:48 -0800 (PST)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id n19sm944550edy.9.2020.02.24.04.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 04:47:48 -0800 (PST)
Date: Mon, 24 Feb 2020 13:47:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Message-ID: <20200224124744.GA1949@pi3>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
 <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_044751_587331_4B4592B2 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: Rich Felker <dalias@libc.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMTA6NDg6MzNBTSArMDEwMCwgSmlyaSBTbGFieSB3cm90
ZToKPiBPbiAxOS4gMDIuIDIwLCAxODo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+
IFRoZSBpb3JlYWRYKCkgaGVscGVycyBoYXZlIGluY29uc2lzdGVudCBpbnRlcmZhY2UuICBPbiBz
b21lIGFyY2hpdGVjdHVyZXMKPiA+IHZvaWQgKl9faW9tZW0gYWRkcmVzcyBhcmd1bWVudCBpcyBh
IHBvaW50ZXIgdG8gY29uc3QsIG9uIHNvbWUgbm90Lgo+ID4gCj4gPiBJbXBsZW1lbnRhdGlvbnMg
b2YgaW9yZWFkWCgpIGRvIG5vdCBtb2RpZnkgdGhlIG1lbW9yeSB1bmRlciB0aGUgYWRkcmVzcwo+
ID4gc28gdGhleSBjYW4gYmUgY29udmVydGVkIHRvIGEgImNvbnN0IiB2ZXJzaW9uIGZvciBjb25z
dC1zYWZldHkgYW5kCj4gPiBjb25zaXN0ZW5jeSBhbW9uZyBhcmNoaXRlY3R1cmVzLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4g
PiBBY2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmMgfCAxMCArKysrKy0tLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYyBiL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYwo+ID4gaW5kZXggMmM5Y2VjOGI1M2Q5
Li44YmQwMWRmMzY5ZmIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoNWsvYWhiLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIu
Ywo+ID4gQEAgLTEzOCwxOCArMTM4LDE4IEBAIHN0YXRpYyBpbnQgYXRoX2FoYl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIAo+ID4gIAlpZiAoYmNmZy0+ZGV2aWQgPj0g
QVI1S19TUkVWX0FSMjMxNV9SNikgewo+ID4gIAkJLyogRW5hYmxlIFdNQUMgQUhCIGFyYml0cmF0
aW9uICovCj4gPiAtCQlyZWcgPSBpb3JlYWQzMigodm9pZCBfX2lvbWVtICopIEFSNUtfQVIyMzE1
X0FIQl9BUkJfQ1RMKTsKPiA+ICsJCXJlZyA9IGlvcmVhZDMyKChjb25zdCB2b2lkIF9faW9tZW0g
KikgQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwo+IAo+IFdoaWxlIEkgdW5kZXJzdGFuZCB3aHkg
dGhlIHBhcmFtZXRlciBvZiBpb3JlYWQzMiBzaG91bGQgYmUgY29uc3QsIEkKPiBkb24ndCBzZWUg
YSByZWFzb24gZm9yIHRoZXNlIGNhc3RzIG9uIHRoZSB1c2Vycycgc2lkZS4gV2hhdCBkb2VzIGl0
Cj4gYnJpbmcgZXhjZXB0IGxvbmdlciBjb2RlIHRvIHJlYWQ/CgpCZWNhdXNlIHRoZSBhcmd1bWVu
dCBpcyBhbiBpbnQ6Cgpkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoNWsvYWhiLmM6IEluIGZ1
bmN0aW9uIOKAmGF0aF9haGJfcHJvYmXigJk6CmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1
ay9haGIuYzoxNDE6MTg6IHdhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhpb3JlYWQz
MuKAmSBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29u
dmVyc2lvbl0KICAgcmVnID0gaW9yZWFkMzIoQVI1S19BUjIzMTVfQUhCX0FSQl9DVEwpOwoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
