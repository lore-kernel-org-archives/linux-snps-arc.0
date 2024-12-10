Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B515E77180
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caYHCdgzgCPEwrspgHKcoljC3LHO4frIUDoSqz4l5Ls=; b=xYx6Iz9u1jltqE
	g7sagSSsOc7Qkm02t41K3Z49E56/N8elLvt9e3X7DEDdUTux1XQNqZsYEgwkEiCU4VjbxktQ+yArf
	eBGQooLrii2oR3chw4QbyjtorRny7jxVaKlmKy5GVg8IsGHebUvjMGaYtMmVoyLGOj05rE6yYxogQ
	CqJEGUJPj6EdD2vrJsEOk97PU/PeLvlcS9ru5fLASE+sf6quJAW6r7UVR7XFCjwwHTCjyW8rljkpa
	7FlOy84x1YJ+aOw9pDT6SOpAPUYNiB9Zd1q6tLTlwjiUf92x+orP9T2rvfJTsgh6yib3ITN78jbNC
	im/G7o7TThdqYYKIHoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4SV-0000000CLCw-0hJ7;
	Tue, 10 Dec 2024 17:55:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4SS-0000000CLBe-0Kuf
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Dec 2024 17:55:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2163affd184so2015ad.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 10 Dec 2024 09:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733853339; x=1734458139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0WaAW3kh+VqyYkynbg5Bnnaq2ujjkmV+I+q8jKp9mU=;
        b=ZHO75eqreMUSO/VUBhNes4eb2CPRCQT17kTZPXMdy3dsPGVUtCZqUVuV66jr1J5x23
         43UNpAFmkV1ZKsz0Bo61HNLR1s3+qKMxSs4leGe0Hj5zslttrUDWkOm6vTePXvXtc8YB
         N8NPAtPUo/DTNoLriXfu86ZNR7iA/RPhY5bOsD0nVard8OyjkYTJ9k2Tm4W1N+/2MlaM
         l6Vm+Hz72/hVc7t+RElxmSlXL7OKXdYaSz5WaGRVJSEDrIb51XkOJ4I/8CuB8PWjdOIT
         n9DLnkbHCz/W+6wVTBO4mgnPAdpmlbjHRuXq9M03mS47Uliu/dPKQmBiY1jtKZIevQ0E
         9tXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733853339; x=1734458139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0WaAW3kh+VqyYkynbg5Bnnaq2ujjkmV+I+q8jKp9mU=;
        b=vurHV1rXje+taDGMLup73aBDDHFE0/WwtSf7y9kF+mHJYBSjGAu3C1d7cBURFRs0hI
         LOOYvLDGmmiYq6tPeqx9J1zLPwfQQuW7n5UWsFr2uSIQ05wYZQJuYOaY1XYYWX7upkXS
         Qp9cq/D2Z9NPeSBcyicisy6o8iAAsMLTXRGcntpq4X1Abx0eqOrgZnhLnKJwg2UPu7Ej
         kqspohgBJKv7hSmhUUL0D+GGg6Usl8w9xuZnkeIPeBkvnHMIyJRTWQc/mjnVV3ZDgFnh
         RYP2hAYddpkoN+3owUBw/xBkeeMGHOhM6p8DGZiEG53iIPPC5Op8a0ZxzsRLvJW2EmJX
         24sA==
X-Forwarded-Encrypted: i=1; AJvYcCWZpwM/9GkfzGl/PNkgrL6TqpWhzZ2W7j2Uz2znBNj3YbBeQYOAYeil0t0uECe3ieA76dDgn7MByOorFymQOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNZihK5RaIqRmHVqbjCgaujTM/Ote9XfW73M0JyKnxeEdcPCM3
	b2VvKQqMv/ry8HC/Lvm9/PuPfzMDhexgjYyiu1qU75LSSNe+sbblgGoLTFmqo9W6vsRxG8obu7H
	HMkwqr6YuoIRfhS7BGnRfEz63wh16PCi6jo4z
X-Gm-Gg: ASbGncvqA8nq3tVQZ2DTRLpSKDHwyOKQ3Y/6w0ecdC3KG3ZJ2bCGO79yrF7FiJyADyh
	3M5WIdKWeFVtH/UtaM6U98RUNn6StCDECLpg0m0Z2frGLreP7s3iIJ2SVA3PTFZh4
X-Google-Smtp-Source: AGHT+IGLvX826EUtDFzCMbe4Z82/rCvZNBH+2oBWnGrvdZr1UuD+ncWShG6UN2y8G42XtPREcypqHTRZ438FncSXyng=
X-Received: by 2002:a17:903:144b:b0:215:79b5:aa7e with SMTP id
 d9443c01a7336-21674d58706mr2897555ad.13.1733853339077; Tue, 10 Dec 2024
 09:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
 <20241210024119.2488608-2-kaleshsingh@google.com> <CAHbLzkpCRGF+-WXkHVEutkEGHSWydmpb1CwkvHZRTH-f773J-w@mail.gmail.com>
In-Reply-To: <CAHbLzkpCRGF+-WXkHVEutkEGHSWydmpb1CwkvHZRTH-f773J-w@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 10 Dec 2024 09:55:27 -0800
Message-ID: <CAC_TJvc5SU_khaBf7NS1VvD+d5PJ4X1DwKWbO92j-dZ+rEuc9A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 01/17] mm: Introduce generic_mmap_hint()
To: Yang Shi <shy828301@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_095540_121328_73FA8382 
X-CRM114-Status: GOOD (  19.80  )
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

T24gTW9uLCBEZWMgOSwgMjAyNCBhdCA3OjI34oCvUE0gWWFuZyBTaGkgPHNoeTgyODMwMUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBEZWMgOSwgMjAyNCBhdCA2OjQx4oCvUE0gS2FsZXNo
IFNpbmdoIDxrYWxlc2hzaW5naEBnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBDb25zb2xpZGF0
ZSB0aGUgaGludCBzZWFyY2hlcyBmcm9tIGJvdGggZGlyZWNpdG9ucyAodG9wZG93biBhbmQKPiA+
IGJvdHRvbXVwKSBpbnRvIGdlbmVyaWNfbW1hcF9oaW50KCkuCj4gPgo+ID4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UgaXMgaW50cm9kdWNlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLYWxlc2ggU2lu
Z2ggPGthbGVzaHNpbmdoQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L3Nj
aGVkL21tLmggfCAgNCArKysrCj4gPiAgbW0vbW1hcC5jICAgICAgICAgICAgICAgIHwgNDUgKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvc2NoZWQvbW0uaCBiL2luY2x1ZGUvbGludXgvc2NoZWQvbW0uaAo+ID4g
aW5kZXggOTI4YTYyNjcyNWU2Li5lZGVlYzE5ZDE3MDggMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L3NjaGVkL21tLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc2NoZWQvbW0uaAo+ID4g
QEAgLTIwMSw2ICsyMDEsMTAgQEAgdW5zaWduZWQgbG9uZyBtbV9nZXRfdW5tYXBwZWRfYXJlYV92
bWZsYWdzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1fZmxhZ3NfdCB2bV9mbGFncyk7Cj4gPgo+
ID4gK3Vuc2lnbmVkIGxvbmcgZ2VuZXJpY19tbWFwX2hpbnQoc3RydWN0IGZpbGUgKmZpbHAsIHVu
c2lnbmVkIGxvbmcgYWRkciwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBsZW4sIHVuc2lnbmVkIGxvbmcgcGdvZmYsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MpOwo+ID4gKwo+ID4gIHVuc2lnbmVk
IGxvbmcKPiA+ICBnZW5lcmljX2dldF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxwLCB1
bnNpZ25lZCBsb25nIGFkZHIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgbGVuLCB1bnNpZ25lZCBsb25nIHBnb2ZmLAo+ID4gZGlmZiAtLWdpdCBhL21tL21tYXAu
YyBiL21tL21tYXAuYwo+ID4gaW5kZXggZGY5MTU0YjE1ZWY5Li5lOTdlYjhiZjQ4ODkgMTAwNjQ0
Cj4gPiAtLS0gYS9tbS9tbWFwLmMKPiA+ICsrKyBiL21tL21tYXAuYwo+ID4gQEAgLTYyMCw2ICs2
MjAsMjcgQEAgdW5zaWduZWQgbG9uZyB2bV91bm1hcHBlZF9hcmVhKHN0cnVjdCB2bV91bm1hcHBl
ZF9hcmVhX2luZm8gKmluZm8pCj4gPiAgICAgICAgIHJldHVybiBhZGRyOwo+ID4gIH0KPiA+Cj4g
PiArdW5zaWduZWQgbG9uZyBnZW5lcmljX21tYXBfaGludChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5z
aWduZWQgbG9uZyBhZGRyLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIGxlbiwgdW5zaWduZWQgbG9uZyBwZ29mZiwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFncykKPiA+ICt7Cj4gPiArICAgICAgIHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4gPiArICAgICAgIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCAqcHJldjsKPiA+ICsgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyBt
bWFwX2VuZCA9IGFyY2hfZ2V0X21tYXBfZW5kKGFkZHIsIGxlbiwgZmxhZ3MpOwo+ID4gKwo+ID4g
KyAgICAgICBpZiAoIWFkZHIpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArCj4g
PiArICAgICAgIGFkZHIgPSBQQUdFX0FMSUdOKGFkZHIpOwo+ID4gKyAgICAgICB2bWEgPSBmaW5k
X3ZtYV9wcmV2KG1tLCBhZGRyLCAmcHJldik7Cj4gPiArICAgICAgIGlmIChtbWFwX2VuZCAtIGxl
biA+PSBhZGRyICYmIGFkZHIgPj0gbW1hcF9taW5fYWRkciAmJgo+ID4gKyAgICAgICAgICAgKCF2
bWEgfHwgYWRkciArIGxlbiA8PSB2bV9zdGFydF9nYXAodm1hKSkgJiYKPiA+ICsgICAgICAgICAg
ICghcHJldiB8fCBhZGRyID49IHZtX2VuZF9nYXAocHJldikpKQo+ID4gKyAgICAgICAgICAgICAg
IHJldHVybiBhZGRyOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4g
PiAgLyogR2V0IGFuIGFkZHJlc3MgcmFuZ2Ugd2hpY2ggaXMgY3VycmVudGx5IHVubWFwcGVkLgo+
ID4gICAqIEZvciBzaG1hdCgpIHdpdGggYWRkcj0wLgo+ID4gICAqCj4gPiBAQCAtNjM3LDcgKzY1
OCw2IEBAIGdlbmVyaWNfZ2V0X3VubWFwcGVkX2FyZWEoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2ln
bmVkIGxvbmcgYWRkciwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBmbGFncywgdm1fZmxhZ3NfdCB2bV9mbGFncykKPiA+ICB7Cj4gPiAgICAgICAgIHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4gPiAtICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLCAqcHJldjsKPiA+ICAgICAgICAgc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5m
byBpbmZvID0ge307Cj4gPiAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgbW1hcF9lbmQgPSBh
cmNoX2dldF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKTsKPiA+Cj4gPiBAQCAtNjQ3LDE0ICs2
NjcsOSBAQCBnZW5lcmljX2dldF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNp
Z25lZCBsb25nIGFkZHIsCj4gPiAgICAgICAgIGlmIChmbGFncyAmIE1BUF9GSVhFRCkKPiA+ICAg
ICAgICAgICAgICAgICByZXR1cm4gYWRkcjsKPgo+IEl0IHNlZW1zIHlvdSBhbHNvIGNhbiBtb3Zl
IHRoZSBNQVBfRklYRUQgY2FzZSBpbnRvIGdlbmVyaWNfbW1hcF9oaW50KCksIHJpZ2h0PwoKSSB0
aGluayB0aGF0IGNvdWxkIGJlIGRvbmUgdG9vLiB3ZSdsbCBuZWVkIGEgbmV3IG5hbWUgOikgTGV0
IG1lIHRha2UgYQpsb29rIGF0IGl0IC4uLgoKLS0gS2FsZXNoCgo+Cj4gPgo+ID4gLSAgICAgICBp
ZiAoYWRkcikgewo+ID4gLSAgICAgICAgICAgICAgIGFkZHIgPSBQQUdFX0FMSUdOKGFkZHIpOwo+
ID4gLSAgICAgICAgICAgICAgIHZtYSA9IGZpbmRfdm1hX3ByZXYobW0sIGFkZHIsICZwcmV2KTsK
PiA+IC0gICAgICAgICAgICAgICBpZiAobW1hcF9lbmQgLSBsZW4gPj0gYWRkciAmJiBhZGRyID49
IG1tYXBfbWluX2FkZHIgJiYKPiA+IC0gICAgICAgICAgICAgICAgICAgKCF2bWEgfHwgYWRkciAr
IGxlbiA8PSB2bV9zdGFydF9nYXAodm1hKSkgJiYKPiA+IC0gICAgICAgICAgICAgICAgICAgKCFw
cmV2IHx8IGFkZHIgPj0gdm1fZW5kX2dhcChwcmV2KSkpCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gYWRkcjsKPiA+IC0gICAgICAgfQo+ID4gKyAgICAgICBhZGRyID0gZ2VuZXJp
Y19tbWFwX2hpbnQoZmlscCwgYWRkciwgbGVuLCBwZ29mZiwgZmxhZ3MpOwo+ID4gKyAgICAgICBp
ZiAoYWRkcikKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gYWRkcjsKPiA+Cj4gPiAgICAgICAg
IGluZm8ubGVuZ3RoID0gbGVuOwo+ID4gICAgICAgICBpbmZvLmxvd19saW1pdCA9IG1tLT5tbWFw
X2Jhc2U7Cj4gPiBAQCAtNjg1LDcgKzcwMCw2IEBAIGdlbmVyaWNfZ2V0X3VubWFwcGVkX2FyZWFf
dG9wZG93bihzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuLCB1bnNpZ25lZCBs
b25nIHBnb2ZmLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgZmxhZ3MsIHZtX2ZsYWdzX3Qgdm1fZmxhZ3MpCj4gPiAgewo+ID4gLSAgICAgICBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgKnByZXY7Cj4gPiAgICAgICAgIHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tID0gY3VycmVudC0+bW07Cj4gPiAgICAgICAgIHN0cnVjdCB2bV91bm1hcHBlZF9hcmVh
X2luZm8gaW5mbyA9IHt9Owo+ID4gICAgICAgICBjb25zdCB1bnNpZ25lZCBsb25nIG1tYXBfZW5k
ID0gYXJjaF9nZXRfbW1hcF9lbmQoYWRkciwgbGVuLCBmbGFncyk7Cj4gPiBAQCAtNjk4LDE0ICs3
MTIsOSBAQCBnZW5lcmljX2dldF91bm1hcHBlZF9hcmVhX3RvcGRvd24oc3RydWN0IGZpbGUgKmZp
bHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gYWRkcjsK
PiA+Cj4gPiAgICAgICAgIC8qIHJlcXVlc3RpbmcgYSBzcGVjaWZpYyBhZGRyZXNzICovCj4gPiAt
ICAgICAgIGlmIChhZGRyKSB7Cj4gPiAtICAgICAgICAgICAgICAgYWRkciA9IFBBR0VfQUxJR04o
YWRkcik7Cj4gPiAtICAgICAgICAgICAgICAgdm1hID0gZmluZF92bWFfcHJldihtbSwgYWRkciwg
JnByZXYpOwo+ID4gLSAgICAgICAgICAgICAgIGlmIChtbWFwX2VuZCAtIGxlbiA+PSBhZGRyICYm
IGFkZHIgPj0gbW1hcF9taW5fYWRkciAmJgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAoIXZtYSB8fCBhZGRyICsgbGVuIDw9IHZtX3N0YXJ0X2dhcCh2bWEpKSAmJgo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoIXByZXYgfHwgYWRkciA+PSB2bV9lbmRfZ2Fw
KHByZXYpKSkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBhZGRyOwo+ID4gLSAg
ICAgICB9Cj4gPiArICAgICAgIGFkZHIgPSBnZW5lcmljX21tYXBfaGludChmaWxwLCBhZGRyLCBs
ZW4sIHBnb2ZmLCBmbGFncyk7Cj4gPiArICAgICAgIGlmIChhZGRyKQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBhZGRyOwo+ID4KPiA+ICAgICAgICAgaW5mby5mbGFncyA9IFZNX1VOTUFQUEVE
X0FSRUFfVE9QRE9XTjsKPiA+ICAgICAgICAgaW5mby5sZW5ndGggPSBsZW47Cj4gPiAtLQo+ID4g
Mi40Ny4wLjMzOC5nNjBjY2ExNTgxOS1nb29nCj4gPgo+ID4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
