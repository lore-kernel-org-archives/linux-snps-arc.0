Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E60C7EE26
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 May 2023 14:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zA4ypoU7KPlVFuOzSyiAXI1Iy8F5NIP1xMe9dQNlnX4=; b=SI2zb2EieN6EeD
	KZWi101v8XBVHLRI5uMdMfF6KUTCODIPl2pu0Zf0USnzXGoJo0UpoSGgyKqVl1uQ5OyCMjYkYJwkO
	5W9dqzVFpnLcWNvchamzI86WjxXQTne9aZJBlrMsb17dNhFdUvrxGxDcQhReUfLNscvcLwIp0KzGi
	hTybU9x1xnpk/qvh+gRUCE/hZVH7s7QtFBQ5OhRRevRblE0Lcrtx0S41tTri+I4DdglRfTo53JSPw
	+/j16MfYaH6IXAQegZzKR+BPc7OJpkg8ZsTaRQyt1Wg4kW4RgLSrhay2QTY9LBXuI+xpdGCriWGZU
	Oi1S6qwVupU3LGIkcOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwku8-006NGp-1t;
	Wed, 10 May 2023 14:34:56 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwku3-006NEV-31;
	Wed, 10 May 2023 14:34:54 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-559e2051d05so105741957b3.3;
        Wed, 10 May 2023 07:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683729288; x=1686321288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozQA/cDvPs2H88bJoE4ZEXy4NN+hc65oP+0zn7oNwKg=;
        b=jD9asXTEXotzUqHwJ7Z8MyCBFFhN32DmSYYyQDOz7JnNfdQhyn46fNHpQALmatY6Jt
         j2N40J9i9qBxMR0s6Repr3Jka28cZZwOOiNQcg8IPx91tLwcoTMuW3S9RXCt6IiaF8Rf
         t0LJZ/BPAp2UqTnh3o3f4verk3psqKePZ95xqjfp2PYtSumuUvYGAsy2V2T8C9+s8iXH
         euLF6bPwaiTLa4sghx5RHXsUs6KIydy7s8MX6gmFcdojKNWbyqeK2oidYDWvr3FNgqYc
         XNCH503JFIV/9ciLFOokKm/Ffpg6NSzBb/S6vRxxKsZNMEl02GDCiucs7X6lScKSW3Ly
         6syg==
X-Gm-Message-State: AC+VfDyylk/J0GcVJwbKBYu1RhoaxpmWl1Uo4tsLb+Jw40jt0wXWS1Qt
	edHUEcJhV03007w9KOrgeQfYgmF/oTfBBw==
X-Google-Smtp-Source: ACHHUZ7uwf0O1EdNSB+mu5LhWKZx9kFBEFW4PuGaZ6zPbApqVH3caJOWUnbiw8O0no/2QPnwjxKfgw==
X-Received: by 2002:a0d:cad2:0:b0:55a:6430:e8fb with SMTP id m201-20020a0dcad2000000b0055a6430e8fbmr19903615ywd.8.1683729288023;
        Wed, 10 May 2023 07:34:48 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id d202-20020a814fd3000000b00545a08184bbsm4115938ywb.75.2023.05.10.07.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:34:47 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b983027d0faso9323112276.0;
        Wed, 10 May 2023 07:34:46 -0700 (PDT)
X-Received: by 2002:a05:6902:18c6:b0:b99:5707:4e6f with SMTP id
 ck6-20020a05690218c600b00b9957074e6fmr23871358ybb.32.1683729286388; Wed, 10
 May 2023 07:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de> <20230510110557.14343-6-tzimmermann@suse.de>
 <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com> <487ff03b-d753-972f-7a06-a1d5efda917d@suse.de>
In-Reply-To: <487ff03b-d753-972f-7a06-a1d5efda917d@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2023 16:34:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQLF6QZi4j5Yg3oiy8dMbuApk+r=5c2tSLvYxvAaudMA@mail.gmail.com>
Message-ID: <CAMuHMdWQLF6QZi4j5Yg3oiy8dMbuApk+r=5c2tSLvYxvAaudMA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, daniel@ffwll.ch, vgupta@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, davem@davemloft.net, 
	James.Bottomley@hansenpartnership.com, arnd@arndb.de, sam@ravnborg.org, 
	suijingfeng@loongson.cn, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_073451_999134_429595DD 
X-CRM114-Status: GOOD (  32.44  )
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

SGkgVGhvbWFzLAoKT24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgNDoyMOKAr1BNIFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToKPiBBbSAxMC4wNS4yMyB1bSAxNDoz
NCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoKPiA+IE9uIFdlZCwgTWF5IDEwLCAyMDIzIGF0
IDE6MDbigK9QTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6
Cj4gPj4gSW1wbGVtZW50IGZyYW1lYnVmZmVyIEkvTyBoZWxwZXJzLCBzdWNoIGFzIGZiX3JlYWQq
KCkgYW5kIGZiX3dyaXRlKigpLAo+ID4+IGluIHRoZSBhcmNoaXRlY3R1cmUncyA8YXNtL2ZiLmg+
IGhlYWRlciBmaWxlIG9yIHRoZSBnZW5lcmljIG9uZS4KPiA+Pgo+ID4+IFRoZSBjb21tb24gY2Fz
ZSBoYXMgYmVlbiB0aGUgdXNlIG9mIHJlZ3VsYXIgSS9PIGZ1bmN0aW9ucywgc3VjaCBhcwo+ID4+
IF9fcmF3X3JlYWRiKCkgb3IgbWVtc2V0X2lvKCkuIEEgZmV3IGFyY2hpdGVjdHVyZXMgdXNlZCBw
bGFpbiBzeXN0ZW0tCj4gPj4gbWVtb3J5IHJlYWRzIGFuZCB3cml0ZXMuIFNwYXJjIHVzZWQgaGVs
cGVycyBmb3IgaXRzIFNCdXMuCj4gPj4KPiA+PiBUaGUgYXJjaGl0ZWN0dXJlcyB0aGF0IHVzZWQg
c3BlY2lhbCBjYXNlcyBwcm92aWRlIHRoZSBzYW1lIGNvZGUgaW4KPiA+PiB0aGVpciBfX3Jhd18q
KCkgSS9PIGhlbHBlcnMuIFNvIHRoZSBwYXRjaCByZXBsYWNlcyB0aGlzIGNvZGUgd2l0aCB0aGUK
PiA+PiBfX3Jhd18qKCkgZnVuY3Rpb25zIGFuZCBtb3ZlcyBpdCB0byA8YXNtLWdlbmVyaWMvZmIu
aD4gZm9yIGFsbAo+ID4+IGFyY2hpdGVjdHVyZXMuCj4gPj4KPiA+PiB2NjoKPiA+PiAgICAgICAg
ICAqIGZpeCBmYl9yZWFkcSgpL2ZiX3dyaXRlcSgpIG9uIDY0LWJpdCBtaXBzIChrZXJuZWwgdGVz
dCByb2JvdCkKPiA+PiB2NToKPiA+PiAgICAgICAgICAqIGluY2x1ZGUgPGxpbnV4L2lvLmg+IGlu
IDxhc20tZ2VuZXJpYy9mYj47IGZpeCBzMzkwIGJ1aWxkCj4gPj4gdjQ6Cj4gPj4gICAgICAgICAg
KiBpYTY0LCBsb29uZ2FyY2gsIHNwYXJjNjQ6IGFkZCBmYl9tZW0qKCkgdG8gYXJjaCBoZWFkZXJz
Cj4gPj4gICAgICAgICAgICB0byBrZWVwIGN1cnJlbnQgc2VtYW50aWNzIChBcm5kKQo+ID4+IHYz
Ogo+ID4+ICAgICAgICAgICogaW1wbGVtZW50IGFsbCBhcmNoaXRlY3R1cmVzIHdpdGggZ2VuZXJp
YyBoZWxwZXJzCj4gPj4gICAgICAgICAgKiBzdXBwb3J0IHJlb3JkZXJpbmcgYW5kIG5hdGl2ZSBi
eXRlIG9yZGVyIChHZWVydCwgQXJuZCkKPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4+IFRlc3RlZC1ieTogU3VpIEppbmdm
ZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4KPiA+PiBSZXZpZXdlZC1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KCj4gPj4gLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2Zi
LmgKPiA+PiArKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vZmIuaAo+ID4+IEBAIC0xMiw2ICsx
MiwyOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZmJfcGdwcm90ZWN0KHN0cnVjdCBmaWxlICpmaWxl
LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiA+PiAgIH0KPiA+PiAgICNkZWZpbmUgZmJf
cGdwcm90ZWN0IGZiX3BncHJvdGVjdAo+ID4+Cj4gPj4gKy8qCj4gPj4gKyAqIE1JUFMgZG9lc24n
dCBkZWZpbmUgX19yYXdfIEkvTyBtYWNyb3MsIHNvIHRoZSBoZWxwZXJzCj4gPj4gKyAqIGluIDxh
c20tZ2VuZXJpYy9mYi5oPiBkb24ndCBnZW5lcmF0ZSBmYl9yZWFkcSgpIGFuZAo+ID4+ICsgKiBm
Yl93cml0ZSgpLiBXZSBoYXZlIHRvIHByb3ZpZGUgdGhlbSBoZXJlLgo+ID4KPiA+IE1JUFMgZG9l
cyBub3QgaW5jbHVkZSA8YXNtLWdlbmVyaWMvaW8uaD4sICBub3IgZGVmaW5lIGl0cyBvd24KPgo+
IEkga25vdywgdGhhdCdzIHdoeSB0aGUgVE9ETyBzYXlzIHRvIGNvbnZlcnQgaXQgdG8gZ2VuZXJp
YyBJL08uCj4KPiA+IF9fcmF3X3JlYWRxKCkgYW5kIF9fcmF3X3dyaXRlcSgpLi4uCj4KPiBJdCBk
b2Vzbid0IGRlZmluZSB0aG9zZSBtYWNyb3MsIGJ1dCBpdCBnZW5lcmF0ZXMgZnVuY3Rpb24gY2Fs
bHMgb2YgdGhlCj4gc2FtZSBuYW1lcy4gRm9sbG93IHRoZSBtYWNyb3MgYXQKPgo+Cj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL21pcHMvaW5jbHVk
ZS9hc20vaW8uaCNMMzU3Cj4KPiBJdCBleHBhbmRzIHRvIGEgdmFyaWV0eSBvZiBoZWxwZXJzLCBp
bmNsdWRpbmcgX19yYXdfKigpLgoKVGhhbmtzLCBJIGZvcmdvdCBNSVBTIGlzIHVzaW5nIHRoZXNl
IGdyZXAtdW5mcmllbmRseSBmYWN0b3JpZXMuLi4KCj4gPj4gKyAqCj4gPj4gKyAqIFRPRE86IENv
bnZlcnQgTUlQUyB0byBnZW5lcmljIEkvTy4gVGhlIGhlbHBlcnMgYmVsb3cgY2FuCj4gPj4gKyAq
ICAgICAgIHRoZW4gYmUgcmVtb3ZlZC4KPiA+PiArICovCj4gPj4gKyNpZmRlZiBDT05GSUdfNjRC
SVQKPiA+PiArc3RhdGljIGlubGluZSB1NjQgZmJfcmVhZHEoY29uc3Qgdm9sYXRpbGUgdm9pZCBf
X2lvbWVtICphZGRyKQo+ID4+ICt7Cj4gPj4gKyAgICAgICByZXR1cm4gX19yYXdfcmVhZHEoYWRk
cik7Cj4gPgo+ID4gLi4uIHNvIGhvdyBjYW4gdGhpcyBjYWxsIHdvcms/Cj4KPiBPbiA2NC1iaXQg
YnVpbGRzLCB0aGVyZSdzIF9fcmF3X3JlYWRxKCkgYW5kIF9fcmF3X3dyaXRlcSgpLgo+Cj4gQXQg
Zmlyc3QsIEkgdHJpZWQgdG8gZG8gdGhlIHJpZ2h0IHRoaW5nIGFuZCBjb252ZXJ0IE1JUFMgdG8g
d29yayB3aXRoCj4gPGFzbS1nZW5lcmljL2lvLmg+LiBCdXQgdGhhdCBjcmVhdGVkIGEgdG9uIG9m
IGZvbGxvdy11cCBlcnJvcnMgaW4gb3RoZXIKPiBoZWFkZXJzLiBTbyBmb3Igbm93LCBpdCdzIGJl
dHRlciB0byBoYW5kbGUgdGhpcyBwcm9ibGVtIGluIGFzbS9mYi5oLgoKU28gaXNuJ3QganVzdCBh
ZGRpbmcKCiAgICAjZGVmaW5lIF9fcmF3X3JlYWRxIF9fcmF3X3JlYWRxCiAgICAjZGVmaW5lIF9f
cmF3X3dyaXRlcSBfX3Jhd193cml0ZXEKCnRvIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9pby5oIHN1
ZmZpY2llbnQgdG8gbWFrZSA8YXNtLWdlbmVyaWMvZmIuaD4KZG8gdGhlIHJpZ2h0IHRoaW5nPwoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1z
bnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj
Cg==
