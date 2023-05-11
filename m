Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3C2C7EE22
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1vWc1jt1KRLZkvy57flCM3M6aOyZmIkyO8uF2fv0Gg=; b=aiucjZrA13paqZ
	LoeQHGP4cQTuyMBO2dzr3ctDOuGhPZpeppMm3PX9gQrSaAGqLPWHxR0WQ2St1RCTp2fRfIyWqPZfX
	/jnvaYuu7rmFBvIJ+BG0l59zqyW6ViudHg5dz5nQ446ChaCzgr3gft7pqDvYzbL9dN9a/iTt00Asm
	SZOOP65LVmXuLKvO6unx21QhwgSTY/0ScVXKSHQAYslkUTGLn3m8kbWI8qvtNW+irWHBItqQfqqqv
	JM5dWZCi9lNk7gEntn4+qrBn31GLQJtE3G5i/tZ8j2v4hBAzhQv/s8DJPqgE6e9Bvb8zcT6R1ZnJJ
	9Wd6BDNLdqogXmXJrhqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px64V-008p9p-0C;
	Thu, 11 May 2023 13:11:03 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px64R-008p9F-1z;
	Thu, 11 May 2023 13:11:00 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-55a00da4e53so153651137b3.0;
        Thu, 11 May 2023 06:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683810656; x=1686402656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFpq6TfFDkhgvBTK4lDV32kTv2wLv5jHDb1iGqYi2iA=;
        b=HoDGXGOVtd9yk4rkPGlDwSaGWVtfxghoCiahJXRjuMaD1yO1tgUk+UVuckkrq5Ir7w
         2X6Pf4T0zyRu7eIfRgCV9RKGEJ37r2GpGWVgzfiSNkfBl9a3ssWJhXv/t3gRRzAI0cVd
         /3/c4iYQsHLsvhS3oeEakkuEXNHrs6TUD3VrzCsVZ2x6hmFlmFJaHuAn1Qbv6Col7aq9
         acRNladz91hdbrH8jXhKtqAqUwJuZgOvZ1L1qz/Oy6ZBsU6hXAaaGz3aH2wAJwg4akQX
         JLuOIWD3KcIZYT5JgHdQp3eqSoQ979C64SsNbF8pWD4+tTppFvn+b49pzZ1pHannk+mP
         Rgqg==
X-Gm-Message-State: AC+VfDx6nbnoIjnp6Rtto/4uEDdPlMwcVL0ot33BjQlr+oQ4dZC6uQnL
	boTr0Zy7y3MM11FX85Wks8oJQG2EBl2CaA==
X-Google-Smtp-Source: ACHHUZ5HyLBPC344xyxUxwZiL5MuyT8KG0RrYJGH5Hnt4JzyzfJV9XMVjw0A9YFTvuTb/P/ogFxvSw==
X-Received: by 2002:a0d:d593:0:b0:556:c776:96a2 with SMTP id x141-20020a0dd593000000b00556c77696a2mr22721457ywd.44.1683810656231;
        Thu, 11 May 2023 06:10:56 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id d185-20020a814fc2000000b00545cb6adc16sm4875166ywb.6.2023.05.11.06.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 06:10:54 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-55a14807e4cso153671047b3.1;
        Thu, 11 May 2023 06:10:54 -0700 (PDT)
X-Received: by 2002:a25:3792:0:b0:ba1:e7bb:a3a6 with SMTP id
 e140-20020a253792000000b00ba1e7bba3a6mr17227303yba.18.1683810654067; Thu, 11
 May 2023 06:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de> <20230510110557.14343-2-tzimmermann@suse.de>
 <0e13efbf-9a48-6e70-fdf3-8290f28c6dc7@189.cn> <a2315b9a-0747-1f0f-1f0a-1c6773931db4@suse.de>
 <15fe1489-f0fa-bbf6-ec08-a270bd4f1559@gmx.de>
In-Reply-To: <15fe1489-f0fa-bbf6-ec08-a270bd4f1559@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 15:10:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8piLhEbV+pcWvdn1OEGH9N5FwDOQcqNcEjBx3=ThjXA@mail.gmail.com>
Message-ID: <CAMuHMdX8piLhEbV+pcWvdn1OEGH9N5FwDOQcqNcEjBx3=ThjXA@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] fbdev/matrox: Remove trailing whitespaces
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sui Jingfeng <15330273260@189.cn>, javierm@redhat.com, 
	daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	davem@davemloft.net, arnd@arndb.de, sam@ravnborg.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-parisc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_061059_653078_8808D713 
X-CRM114-Status: GOOD (  23.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgSGVsZ2UsCgpPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCAzOjA14oCvUE0gSGVsZ2UgRGVsbGVy
IDxkZWxsZXJAZ214LmRlPiB3cm90ZToKPiBPbiA1LzExLzIzIDA5OjU1LCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToKPiA+IEJ1dCB0aGUgd29yayBJIGRvIHdpdGhpbiBmYmRldiBpcyBtb3N0bHkg
Zm9yIGltcHJvdmluZyBEUk0uCj4KPiBTdXJlLgo+Cj4gPiBGb3IgdGhlCj4gPiBvdGhlciBpc3N1
ZXMgaW4gdGhpcyBmaWxlLCBJIGRvbid0IHRoaW5rIHRoYXQgbWF0cm94ZmIgc2hvdWxkIGV2ZW4g
YmUKPiA+IGFyb3VuZCBhbnkgbG9uZ2VyLiBGYmRldiBoYXMgYmVlbiBkZXByZWNhdGVkIGZvciBh
IGxvbmcgdGltZS4gQnV0IGEKPiA+IHNtYWxsIG51bWJlciBvZiBkcml2ZXJzIGFyZSBzdGlsbCBp
biB1c2UgYW5kIHdlIHN0aWxsIG5lZWQgaXRzCj4gPiBmcmFtZWJ1ZmZlciBjb25zb2xlLiBTbyBz
b21lb25lIHNob3VsZCBlaXRoZXIgcHV0IHNpZ25pZmljYW50IGVmZm9ydAo+ID4gaW50byBtYWlu
dGFpbmluZyBmYmRldiwgb3IgaXQgc2hvdWxkIGJlIHBoYXNlZCBvdXQuIEJ1dCBuZWl0aGVyIGlz
Cj4gPiBoYXBwZW5pbmcuCj4KPiBZb3UncmUgd3JvbmcuCj4KPiBZb3UgZG9uJ3QgbWVudGlvbiB0
aGF0IGZvciBtb3N0IG9sZGVyIG1hY2hpbmVzIERSTSBpc24ndCBhbiBhY2NlcHRhYmxlCj4gd2F5
IHRvIGdvIGR1ZSB0byBpdCdzIGxpbWl0YXRpb25zLCBlLmcuIGl0J3MgbG93LXNwZWVkIGR1ZSB0
byBtaXNzaW5nCj4gMkQtYWNjZWxlcmF0aW9uIGZvciBvbGRlciBjYXJkcyBhbmQgYW5kIGl0J3Mg
aW5jYXBhYmlsaXR5IHRvIGNoYW5nZSBzY3JlZW4KPiByZXNvbHV0aW9uIGF0IHJ1bnRpbWUgKGp1
c3QgdG8gbmFtZSB0d28gb2YgdGhlIGJpZ2dlciBsaW1pdGF0aW9ucyBoZXJlKS4KPiBTbywgdW5s
ZXNzIHdlIHNvbWVob3cgZmluZCBhIGdvb2Qgd2F5IHRvIG1vdmUgc3VjaCBkcml2ZXJzIG92ZXIg
dG8gRFJNCj4gKHdpdGggYSBzZXQgb2YgbWluaW1hbCAyRCBhY2NlbGVyYXRpb24pLCB0aGV5IGFy
ZSBzdGlsbCBpbXBvcnRhbnQuCgpEUk0gY2FuIGNoYW5nZSByZXNvbHV0aW9uIGF0IHJ1bnRpbWUs
IGp1c3Qgbm90IHRocm91Z2ggdGhlIGZiZGV2IEFQSS4KCk9yIGRvIHlvdSBtZWFuIHRoZSByZXNv
bHV0aW9uIG9mIHRoZSB0ZXh0IGNvbnNvbGUsIGFraW4gdG8KImZic2V0IDxtb2RlPiI/IEkgaGF2
ZSB0byBhZG1pdCBJIGRvIG5vdCBrbm93IGlmIHRoZXJlIGlzIGEgY29tbWFuZApsaW5lIHRvb2wg
dG8gZG8gdGhhdC4uLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
