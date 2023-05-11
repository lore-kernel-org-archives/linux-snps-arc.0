Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B654FC7EE22
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fJss1BUmzNgekJo7pITbPe2G8w3BLGn+3b8hAvzUuY=; b=hdKvb0264JrUhIPE6IuhUVnnz9
	xtKB474DE9k9bahhBdpKpB2mWBtENf503B9nyufp1XS5PGPgm4LvMWp2hTqqAaDmWQYYmY8WszqIZ
	y01k7dNp+uVzIkL9kixk8LA32E1GQ9e0CS2BAMGtnyOBwi3BF3oIAN/1eRjUPpuVxa6AjbcZXSDK9
	g/kj3kWriGgb86RGpL32Y2dJMNYaOIMWoV+P2Pk8MefmbBVGlqDaPSXfMKcMRUOcVayNvDAit5lkf
	xd3/VgzPojrY4zdipN5o3bUteqj8yfxOGQ63s/W2z6QmjVU3o2LdPgj1m93cGzbYkrVb3em0ru9aO
	mvtG40OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6Fc-008rFL-1r;
	Thu, 11 May 2023 13:22:32 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6FY-008rEd-1f;
	Thu, 11 May 2023 13:22:30 +0000
Received: (Authenticated sender: contact@artur-rojek.eu)
	by mail.gandi.net (Postfix) with ESMTPA id AC3D220007;
	Thu, 11 May 2023 13:22:13 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 11 May 2023 15:22:13 +0200
From: Artur Rojek <contact@artur-rojek.eu>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>, Javier
 Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vineet Gupta <vgupta@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, "David S . Miller" <davem@davemloft.net>, "James
 E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Sam Ravnborg
 <sam@ravnborg.org>, suijingfeng@loongson.cn, oe-kbuild-all@lists.linux.dev,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into
 <asm/fb.h>
In-Reply-To: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
References: <20230510110557.14343-6-tzimmermann@suse.de>
 <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com>
 <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
 <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Message-ID: <9c4be198444e9987c826c87b592e9dc6@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_062228_882749_73E2C97B 
X-CRM114-Status: GOOD (  26.01  )
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

T24gMjAyMy0wNS0xMSAxNDozNSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEFybmQs
Cj4gCj4gQ0MgQXJ0dXIsIHdobydzIHdvcmtpbmcgb24gSFAgSm9ybmFkYSA2ODAuClRoYW5rcyBm
b3IgQ0MnaW5nIG1lIC0gSSBmYWNlZCB0aGlzIGV4YWN0IGlzc3VlIHdoaWxlIHdvcmtpbmcgb24g
bXkKKHN0aWxsIG5vdCB1cHN0cmVhbWVkKSBoZDY0NDZ4IFBDTUNJQSBjb250cm9sbGVyIGRyaXZl
ci4gVGhlIFBDTUNJQQpzdWJzeXN0ZW0gdXNlcyBgaW5iL291dGJgLCB3aGljaCBleHBlY3QgdGhl
IGBzaF9pb19wb3J0X2Jhc2VgIHRvIGJlIHNldAp0byBzb21ldGhpbmcgZWxzZSB0aGFuIHRoZSBk
ZWZhdWx0IGAtMWAuIEF0IGZpcnN0IEkgdHJpZWQgdG8gc2V0IGl0IHRvCmAweGEwMDAwMDAwYCwg
c28gdGhhdCBhbGwgSS9PIGdvZXMgdGhyb3VnaCB0aGUgZml4ZWQsIG5vbi1jYWNoZWFibGUgUDIK
YXJlYS4gVGhhdCBob3dldmVyIGJyb2tlIHNvbWUgb3RoZXIgZHJpdmVyIGNvZGUgKEkgaGFkIG5v
IHRpbWUgdG8gZGVidWcKd2hpY2ggb25lKS4gRXZlbnR1YWxseSBJIGVuZGVkIHVwIHRha2luZyBh
IHN1Z2dlc3Rpb24gZnJvbSBhIE1JUFMgUENNQ0lBCmRyaXZlciBbMV0gYW5kIHNpbXBseSBzdWJz
dHJhY3QgdGhlIGJyb2tlbiBgc2hfaW9fcG9ydF9iYXNlYCBhZGRyZXNzCmZyb20gYEhENjQ0NjFf
SU9CQVNFYCwgYXMgdGhlIGJhc2UgZm9yIGBzb2NrZXQuaW9fb2Zmc2V0YC4gVGhpcyB3YXkgYWxs
CnRoZSBQQ01DSUEgYGluYi9vdXRiYCBhY2Nlc3NlcyBhcmUgYWJzb2x1dGUsIG5vIG1hdHRlciB3
aGF0IHRoZQpgc2hfaW9fcG9ydF9iYXNlYCBpcyBzZXQgdG8uIFRoaXMgb2YgY291cnNlIGlzIGEg
dmVyeSB1Z2x5IHNvbHV0aW9uIGFuZAp3ZSBzaG91bGQgaW5zdGVhZCBmaXggdGhlIHJvb3QgY2F1
c2Ugb2YgdGhpcyBtZXNzLiBJIHdpbGwgaGF2ZSBhIGJldHRlcgpsb29rIGF0IHRoaXMgcGF0Y2gg
c2V0IGFuZCB0aGUgcHJvYmxlbSBhdCBoYW5kIGF0IGEgbGF0ZXIgZGF0ZS4KCkNoZWVycywKQXJ0
dXIKClsxXSAKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9wY21jaWEvZGIxeHh4X3NzLmM/aD12Ni40
LXJjMSNuNTI3Cgo+IAo+IE9uIFdlZCwgTWF5IDEwLCAyMDIzIGF0IDU6NTXigK9QTSBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPj4gT24gV2VkLCBNYXkgMTAsIDIwMjMsIGF0
IDE2OjI3LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4gPiBBbSAxMC4wNS4yMyB1bSAxNjox
NSBzY2hyaWViIEFybmQgQmVyZ21hbm46Cj4+ID4+IE9uIFdlZCwgTWF5IDEwLCAyMDIzLCBhdCAx
NjowMywga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6Cj4+IAo+PiA+PiBJIHRoaW5rIHRoYXQncyBh
IHByZWV4aXN0aW5nIGJ1ZyBhbmQgSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGUKPj4gPj4gY29ycmVj
dCBzb2x1dGlvbiBpcy4gTG9va2luZyBmb3IgSEQ2NDQ2MSBzaG93cyBpdCBiZWluZyB1c2VkCj4+
ID4+IGJvdGggd2l0aCBpbncvb3V0dyBhbmQgcmVhZHcvd3JpdGV3LCBzbyB0aGVyZSBpcyBubyB3
YXkgdG8gaGF2ZQo+PiA+PiB0aGUgY29ycmVjdCB0eXBlLiBUaGUgc2ggX19yYXdfcmVhZHcoKSBk
ZWZpbml0aW9uIGhpZGVzIHRoaXMgYnVnLAo+PiA+PiBidXQgdGhhdCBpcyBhIHByb2JsZW0gd2l0
aCBhcmNoL3NoIGFuZCBpdCBwcm9iYWJseSBoaWRlcyBvdGhlcnMKPj4gPj4gYXMgd2VsbC4KPj4g
Pgo+PiA+IFRoZSBjb25zdGFudCBIRDY0NDYxX0lPQkFTRSBpcyBkZWZpbmVkIGFzIGludGVnZXIg
YXQKPj4gPgo+PiA+Cj4+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0
L3NvdXJjZS9hcmNoL3NoL2luY2x1ZGUvYXNtL2hkNjQ0NjEuaCNMMTcKPj4gPgo+PiA+IGJ1dCBm
Yl9yZWFkdygpIGV4cGVjdHMgYSB2b2xhdGlsZS12b2lkIHBvaW50ZXIuIEkgZ3Vlc3Mgd2UgY291
bGQgYWRkIGEKPj4gPiBjYXN0IHNvbWV3aGVyZSB0byBzaWxlbmNlIHRoZSBwcm9ibGVtLiBJbiB0
aGUgY3VycmVudCB1cHN0cmVhbSBjb2RlLAo+PiA+IHRoYXQgYXBwZWFycyB0byBiZSBkb25lIGJ5
IHNoJ3MgX19yYXdfcmVhZHcoKSBpbnRlcm5hbGx5Ogo+PiA+Cj4+ID4KPj4gPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gvc2gvaW5jbHVkZS9hc20v
aW8uaCNMMzUKPj4gCj4+IFN1cmUsIHRoYXQgd291bGQgbWFrZSBpdCBidWlsZCBhZ2FpbiwgYnV0
IHRoYXQgc3RpbGwgZG9lc24ndCBtYWtlIHRoZQo+PiBjb2RlIGNvcnJlY3QsIHNpbmNlIGl0J3Mg
Y29tcGxldGVseSB1bmNsZWFyIHdoYXQgYmFzZSBhZGRyZXNzIHRoZQo+PiBIRDY0NDYxX0lPQkFT
RSBpcyByZWxhdGl2ZSB0by4gVGhlIGhwNnh4IHBsYXRmb3JtIGNvZGUgb25seSBwYXNzZXMgaXQK
Pj4gdGhyb3VnaCBpbncoKS9vdXR3KCksIHdoaWNoIHRha2UgYW4gb2Zmc2V0IHJlbGF0aXZlIHRv
IAo+PiBzaF9pb19wb3J0X2Jhc2UsCj4+IGJ1dCB0aGF0IGlzIG5vdCBpbml0aWFsaXplZCBvbiBo
cDZ4eC4gSSB0cmllZCB0byBmaW5kIGluIHRoZSBoaXN0b3J5Cj4+IHdoZW4gaXQgYnJva2UsIGFw
cGFyZW50bHkgdGhhdCB3YXMgaW4gMjAwNyBjb21taXQgMzRhNzgwYTBhZmViICgic2g6Cj4+IGhw
Nnh4IHBhdGFfcGxhdGZvcm0gc3VwcG9ydC4iKSwgd2hpY2ggcmVtb3ZlZCB0aGUgY3VzdG9tIGlu
dy9vdXR3Cj4+IGltcGxlbWVudGF0aW9ucy4KPiAKPiBTZWUgYWxzbyBjb21taXQgNGFhZmFlMjdk
MGNlNzNmOCAoInNoOiBoZDY0NDYxIHRpZHlpbmcuIiksIHdoaWNoCj4gY2xhaW1zIHRoZXkgYXJl
IG5vIGxvbmdlciBuZWVkZWQuCj4gCj4gRG9uJ3QgdGhlIEkvTyBwb3J0IG1hY3JvcyBqdXN0IHRy
ZWF0IHRoZSBwb3J0IGFzIGFuIGFic29sdXRlIGJhc2UgCj4gYWRkcmVzcwo+IHdoZW4gc2hfaW9f
cG9ydF9iYXNlIGlzbid0IHNldD8KPiAKPiBHcntvZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
