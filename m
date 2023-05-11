Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5455DC77B7C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxBByk2fZDGFq7eoAbbWRmxCGBoo0Al+neCpTIPhqb4=; b=FH0sxqj4OyOuJa
	epwcNQI8oPzQ/VpTHTieeItkkH/KOUk36vQ1CeYDP5osXIU/nqSUFcwNJ3Qqx+RJABgiyCl2+Dhar
	hGA0eGm1rkPJN2bqMFIVvvTxBIL6npTiooa6kObxNhVWPy3eRcV1cbcC+NWm45w0SwlWjsoOycNN2
	0nlnGTPHKdYRucN0wwmJEQQUyUTNiMcC6I4yRZL9bWB3Q7MoRmWVuwnX4ckrNUZR/yVFtPzHt6KO4
	EaD88PVC6RmzywCaJ3PuMa+1iVywssrXn9gJctaVbEFcoqKh8TrFITdNfRP8TnM163z1h5rmh0DXd
	leG/f300myPxLryHlk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px95g-009LjN-1M;
	Thu, 11 May 2023 16:24:28 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px95c-009Lga-0G;
	Thu, 11 May 2023 16:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1683822227; i=deller@gmx.de;
	bh=+1RFIFdc+C/sb8btmAfnn4ecF6JeppQ7CGFV7/Ay2bo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fE4EWlNpT+ffSVec/R0JBr0E35YQQCr+5MrexDeEuUi4zEG00TTEyNNIu9S1+fYZG
	 x+3wQYYS5GZL4f7lOylNuxYkgeEToeU7kHttMI+lrzAe0uIQ0S8EeapZz/UBTPSKKq
	 ZJwj83/GtkJe7x5RQJRp9hmY8hHZj8Wl4KP+YLRBX/BevRH188AjN0kSmwGnT6UveV
	 rZ8SQKT4OAX7pwlRgCz/XkzUrnPGOvMtQp4o90s7eFRlRSf12cpSW7VU5BDZSS0DmM
	 p35c0DsFv6IOr/ikF0TnCNQrgAhEv4xF+0Ej+x4eAgo7+Bf8gRgD+ZNG6vylepESqi
	 W0COL/VAhsGyw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.253]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFvp-1q4bLD3YJR-00ABLJ; Thu, 11
 May 2023 18:23:46 +0200
Message-ID: <89099ac6-21f7-3538-8830-57baba256684@gmx.de>
Date: Thu, 11 May 2023 18:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 1/6] fbdev/matrox: Remove trailing whitespaces
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sui Jingfeng
 <15330273260@189.cn>, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, arnd@arndb.de, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org
References: <20230510110557.14343-1-tzimmermann@suse.de>
 <20230510110557.14343-2-tzimmermann@suse.de>
 <0e13efbf-9a48-6e70-fdf3-8290f28c6dc7@189.cn>
 <a2315b9a-0747-1f0f-1f0a-1c6773931db4@suse.de>
 <15fe1489-f0fa-bbf6-ec08-a270bd4f1559@gmx.de>
 <CAMuHMdX8piLhEbV+pcWvdn1OEGH9N5FwDOQcqNcEjBx3=ThjXA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdX8piLhEbV+pcWvdn1OEGH9N5FwDOQcqNcEjBx3=ThjXA@mail.gmail.com>
X-Provags-ID: V03:K1:Foe+rnRUWx1zv0MsG5wa8oCmb8hm03NsqOLRkbJVE8zj+/xiq0n
 b8NpDWKOWKr9xolj9cXeyt/T+2KXVc+HBhP9wcESOcxgTnp++n2tJaucjr7D+/zoK7VMQti
 KgeWtm2+Tyy+WBdpRQUwT+L76AN1GzxRgmvzGt5+Gou4Kc1On99MIFqlFqvuu2oSD/7mW4c
 P96Km7cNwRsSxhlrlQlPw==
UI-OutboundReport: notjunk:1;M01:P0:tRn2ltmsACE=;nl+rb0eZLjTlsBi8ry+FawmYWr4
 Ba0MjNp33t95BTJ76lIn3rM5Kg3q/0x6zrbrMvOMegKnxQSsu1sgwN/vdv27yHDuJUELb5pug
 MJu72pXO7s22JdtaHCIWzasuYXuCYNcJBFH66c/jUBJHrXB5VNEG7TjcBE6azIQWviyRNT8t+
 ZCCyS9CdugrTXvTUW5AExeXyRtZUqcZU7jOaxdUwueZGlFBGmHl72zRBQ3p/J28tU4mcJOr4O
 N7MpSHY8mrzhlgBNig8FMlAEB00JzY4r14I29xksd7QkyB6S/xxiFGBVEm8+XvE37ZJ4us4Dz
 jPMZo28GQR77BwNisX0d+C+zqt24+KbMZouWbmTwH7F941TB95mO8NdWt2oqFCl0uBiDXS5al
 HUZ62VBwQDFzd9SA1l9IUuZCEAgtADr/rgCvMGaQ6OHhS8IwyHcSIgYBuV3BFULyeocIp68mj
 UelAQzpsTVpy6bSrQUFdFL0EfxGxePbi9zAxuAhP+ThrwlZnCdf4+3vsm2LQ7ZDc+OpLX9t1O
 6Hs+B1Ky8MfwsTH1E9WlXc7HudPh1PK0az73mKVUNc+mb5MDI4kWWQO2oiXMpF5U2h5z3K35f
 RgtVTiLSaiWwlI0YupqlfTVnqg48qpHm8VE2gY0wr/DXJIIXNVdgva/fKoQMLlxiJhTkAf4aE
 ifOCYRFAp0U82332QQea44OgHIKN0yYvCGJ9omilyJYOGm8RMQDdtsd81cZ6Lk66FC87c/kVu
 xwNRKIgSqx1Uuhqww/OMPuIew86pIFTJ6cUteHtf22IPFsmpMj/IPb+JcNcVsPC7lhijAPCO3
 VRFT3fzCegDlqDFfyJdeJyNW3mQHBkstK0RP0TiWt3jAxBnFO1bS64WYtJFqxsomnTaiwnpvB
 Ct21SREXi+2+KHqH2ZbMUiHNt/aVwy0WLa+p4cWihWh8+y2ydMRbGHrerl1Vn6278Ex9QZQrL
 hxk5vQuzgTF7FoByk3utstkJDUw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_092424_408110_8B8680BC 
X-CRM114-Status: GOOD (  15.48  )
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

T24gNS8xMS8yMyAxNToxMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEhlbGdlLAo+
Cj4gT24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMzowNeKAr1BNIEhlbGdlIERlbGxlciA8ZGVsbGVy
QGdteC5kZT4gd3JvdGU6Cj4+IE9uIDUvMTEvMjMgMDk6NTUsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOgo+Pj4gQnV0IHRoZSB3b3JrIEkgZG8gd2l0aGluIGZiZGV2IGlzIG1vc3RseSBmb3IgaW1w
cm92aW5nIERSTS4KPj4KPj4gU3VyZS4KPj4KPj4+IEZvciB0aGUKPj4+IG90aGVyIGlzc3VlcyBp
biB0aGlzIGZpbGUsIEkgZG9uJ3QgdGhpbmsgdGhhdCBtYXRyb3hmYiBzaG91bGQgZXZlbiBiZQo+
Pj4gYXJvdW5kIGFueSBsb25nZXIuIEZiZGV2IGhhcyBiZWVuIGRlcHJlY2F0ZWQgZm9yIGEgbG9u
ZyB0aW1lLiBCdXQgYQo+Pj4gc21hbGwgbnVtYmVyIG9mIGRyaXZlcnMgYXJlIHN0aWxsIGluIHVz
ZSBhbmQgd2Ugc3RpbGwgbmVlZCBpdHMKPj4+IGZyYW1lYnVmZmVyIGNvbnNvbGUuIFNvIHNvbWVv
bmUgc2hvdWxkIGVpdGhlciBwdXQgc2lnbmlmaWNhbnQgZWZmb3J0Cj4+PiBpbnRvIG1haW50YWlu
aW5nIGZiZGV2LCBvciBpdCBzaG91bGQgYmUgcGhhc2VkIG91dC4gQnV0IG5laXRoZXIgaXMKPj4+
IGhhcHBlbmluZy4KPj4KPj4gWW91J3JlIHdyb25nLgo+Pgo+PiBZb3UgZG9uJ3QgbWVudGlvbiB0
aGF0IGZvciBtb3N0IG9sZGVyIG1hY2hpbmVzIERSTSBpc24ndCBhbiBhY2NlcHRhYmxlCj4+IHdh
eSB0byBnbyBkdWUgdG8gaXQncyBsaW1pdGF0aW9ucywgZS5nLiBpdCdzIGxvdy1zcGVlZCBkdWUg
dG8gbWlzc2luZwo+PiAyRC1hY2NlbGVyYXRpb24gZm9yIG9sZGVyIGNhcmRzIGFuZCBhbmQgaXQn
cyBpbmNhcGFiaWxpdHkgdG8gY2hhbmdlIHNjcmVlbgo+PiByZXNvbHV0aW9uIGF0IHJ1bnRpbWUg
KGp1c3QgdG8gbmFtZSB0d28gb2YgdGhlIGJpZ2dlciBsaW1pdGF0aW9ucyBoZXJlKS4KPj4gU28s
IHVubGVzcyB3ZSBzb21laG93IGZpbmQgYSBnb29kIHdheSB0byBtb3ZlIHN1Y2ggZHJpdmVycyBv
dmVyIHRvIERSTQo+PiAod2l0aCBhIHNldCBvZiBtaW5pbWFsIDJEIGFjY2VsZXJhdGlvbiksIHRo
ZXkgYXJlIHN0aWxsIGltcG9ydGFudC4KPgo+IERSTSBjYW4gY2hhbmdlIHJlc29sdXRpb24gYXQg
cnVudGltZSwKClJpZ2h0LCBzdXJlLgoKPiBqdXN0IG5vdCB0aHJvdWdoIHRoZSBmYmRldiBBUEku
CgouLi4gYW5kIHNhZGx5IHRoZSBzaW1wbGVkcm0tYmFzZWQgZHJpdmVycyBuZWl0aGVyLgoKPiBP
ciBkbyB5b3UgbWVhbiB0aGUgcmVzb2x1dGlvbiBvZiB0aGUgdGV4dCBjb25zb2xlLCBha2luIHRv
Cj4gImZic2V0IDxtb2RlPiI/Cgp5ZXMuCgo+IEkgaGF2ZSB0byBhZG1pdCBJIGRvIG5vdCBrbm93
IGlmIHRoZXJlIGlzIGEgY29tbWFuZAo+IGxpbmUgdG9vbCB0byBkbyB0aGF0Li4uCgpIZWxnZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25w
cy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
