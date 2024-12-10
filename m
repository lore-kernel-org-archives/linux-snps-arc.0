Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB95E77181
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 03:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsfdetcjNrN58b6trK94hSSy6vOjRl8tSGjz81JeSxo=; b=0zVDHPFdj6QA9b
	cmsadQxKIj5nJL44sesfgAO+u+zgiiQkztbc1rU350Vh396zQFkHY1rFP5vZS6S26gaVxjM/2SwUe
	LCT715+GX0SXI68miVF0RHBZvN5OBJ82J0KKzubxLGvcwXUPIFkdAotDKlMWix5xto4GHvOHARS2l
	D4LPOH3LF5UbjJDv/Y6zLleWdfQGUNLmyloZVB5Rzoy3x4O421+rqzetkfXZ6DQsklCHxpVr/Wt0h
	J8bPn+tMuAJO1hlea84BrfBR0EEqzUbJ2HLinl1vOUSL8+wv+SyDSBAGA7g+5UY4h/9lYvXGUq02y
	1odmsD6Yk5oacyi2AQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqu9-0000000A6Oy-06Ip;
	Tue, 10 Dec 2024 03:27:21 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqu6-0000000A6O0-1BW5;
	Tue, 10 Dec 2024 03:27:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so5584593a12.3;
        Mon, 09 Dec 2024 19:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801236; x=1734406036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=QiBoNjmmXB+8Wgaet8gybyKTeGDem1sSdsrt7S92O8XaRnR6rSNEQJgGREyT3lDEXi
         xdxFI6YmeloZEZifSuSs0b15GGMBwdvnrYjbUDGXV1iVro7MO3m5HYR5xnZMV/Wm6toa
         om949/tdSJcb2NA2+5m+FDxcpjhY7CrOuWrSNeezQZv1AQ9jvuzVSpfrKV7Q4H/YiidX
         5aOImUJ7hasFyUE+oLpI3y/857MWM+tDAnvOVHFUhEyx3gmMBtonUZqL2ts0Vwg/ymVG
         hkGCRPsei8TmiTl8KmzP1i5BtkL9MHjNi6ul2oRt8Op4idX/iZeGV7255RCCio9AUXxV
         +zDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801236; x=1734406036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=GQCR2PW3mDxQ24qtKSXIf/0e/uzx9bvmu+FdzCHdryS2DSoylpDXsfOX4kzlvib1zN
         lVKI9vGWq2sV2nKDUNQUBNBlEokM18gT9BkHEZ48OQhTLnxlXaa5pLqtNIMAq/hiEN19
         mAWE0q8Eg7E7cJ3zQONkKSFDfAPT4ejmjWGOq/02TtDoVxefz7a1AKoWXLvskeZW/3Us
         pcKgdOOY45ZV+e+qXDHLXHSgl2ZoVbL12CtIXYyHh582iINsvEvxlwUbQvuwnm1yQeT1
         64Zptw9f0OpVdGQ18mhtGGZMUgogo36UpV7qXZjsBfmTNkxBPkAFnSoQHeVvBxUygyQu
         sH+g==
X-Forwarded-Encrypted: i=1; AJvYcCU4eeUmn+k/ILWvRmWZv0j3BgZHfpamG51L1lmoo4UcaDVfyS92trlNm79JkBSEwtEH5g1EbGV+UGd/c+M7UN0=@lists.infradead.org, AJvYcCUYacMT3je/nq2HFL0nfak3CStBP6Us/8cbhMjAhniWBTF+1DdGth65reAJxqrnEWeKj/7hZRnqiEHKCVuDa30C@lists.infradead.org
X-Gm-Message-State: AOJu0YzQxXonWJJMhfVIDYPgFPvenGqrk/eZDPwl7eSesMij7j9XP1AD
	524KimA7/DhywCXKY9d61H+guK4GZUwDXrHmLajEDSaWnUAPx0SSICQfMnXe66Dyw+XxfWKaMat
	Sdq0Jc1KoXEbtjBeIVrZbWo1vS6o=
X-Gm-Gg: ASbGncvKEtixW7Tf1VCAdn1bfNbV0FygS86OXScZTbWDw8aehLHL7CDbD/PPCm4RuZZ
	b/yq5ZE35ucmMpdEjSmwviR04tYSkaLLRJNxiiQ==
X-Google-Smtp-Source: AGHT+IHf2Fi/42HQsEiQo6WzNdGmDcvEV4I1TbpQP4oAJiq1u3pQn+R3NnSbM/I4gmKvXuY9eOlF5eGp3h/ZPgrcEvo=
X-Received: by 2002:a05:6402:278f:b0:5d0:fc80:c4d1 with SMTP id
 4fb4d7f45d1cf-5d41852f140mr3377986a12.14.1733801235781; Mon, 09 Dec 2024
 19:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-2-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:27:04 -0800
Message-ID: <CAHbLzkpCRGF+-WXkHVEutkEGHSWydmpb1CwkvHZRTH-f773J-w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 01/17] mm: Introduce generic_mmap_hint()
To: Kalesh Singh <kaleshsingh@google.com>
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
X-CRM114-CacheID: sfid-20241209_192718_326206_52F06EBD 
X-CRM114-Status: GOOD (  17.34  )
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

T24gTW9uLCBEZWMgOSwgMjAyNCBhdCA2OjQx4oCvUE0gS2FsZXNoIFNpbmdoIDxrYWxlc2hzaW5n
aEBnb29nbGUuY29tPiB3cm90ZToKPgo+IENvbnNvbGlkYXRlIHRoZSBoaW50IHNlYXJjaGVzIGZy
b20gYm90aCBkaXJlY2l0b25zICh0b3Bkb3duIGFuZAo+IGJvdHRvbXVwKSBpbnRvIGdlbmVyaWNf
bW1hcF9oaW50KCkuCj4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpcyBpbnRyb2R1Y2VkLgo+Cj4g
U2lnbmVkLW9mZi1ieTogS2FsZXNoIFNpbmdoIDxrYWxlc2hzaW5naEBnb29nbGUuY29tPgo+IC0t
LQo+ICBpbmNsdWRlL2xpbnV4L3NjaGVkL21tLmggfCAgNCArKysrCj4gIG1tL21tYXAuYyAgICAg
ICAgICAgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NjaGVkL21tLmggYi9pbmNsdWRlL2xpbnV4L3Nj
aGVkL21tLmgKPiBpbmRleCA5MjhhNjI2NzI1ZTYuLmVkZWVjMTlkMTcwOCAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L3NjaGVkL21tLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NjaGVkL21t
LmgKPiBAQCAtMjAxLDYgKzIwMSwxMCBAQCB1bnNpZ25lZCBsb25nIG1tX2dldF91bm1hcHBlZF9h
cmVhX3ZtZmxhZ3Moc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtX2ZsYWdzX3Qgdm1fZmxhZ3MpOwo+Cj4g
K3Vuc2lnbmVkIGxvbmcgZ2VuZXJpY19tbWFwX2hpbnQoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2ln
bmVkIGxvbmcgYWRkciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgbGVuLCB1bnNpZ25lZCBsb25nIHBnb2ZmLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFncyk7Cj4gKwo+ICB1bnNpZ25lZCBsb25nCj4gIGdl
bmVyaWNfZ2V0X3VubWFwcGVkX2FyZWEoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcg
YWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuLCB1bnNp
Z25lZCBsb25nIHBnb2ZmLAo+IGRpZmYgLS1naXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMKPiBp
bmRleCBkZjkxNTRiMTVlZjkuLmU5N2ViOGJmNDg4OSAxMDA2NDQKPiAtLS0gYS9tbS9tbWFwLmMK
PiArKysgYi9tbS9tbWFwLmMKPiBAQCAtNjIwLDYgKzYyMCwyNyBAQCB1bnNpZ25lZCBsb25nIHZt
X3VubWFwcGVkX2FyZWEoc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyAqaW5mbykKPiAgICAg
ICAgIHJldHVybiBhZGRyOwo+ICB9Cj4KPiArdW5zaWduZWQgbG9uZyBnZW5lcmljX21tYXBfaGlu
dChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBsZW4sIHVuc2lnbmVkIGxvbmcgcGdvZmYs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzKQo+
ICt7Cj4gKyAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwo+ICsgICAg
ICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsICpwcmV2Owo+ICsgICAgICAgY29uc3QgdW5z
aWduZWQgbG9uZyBtbWFwX2VuZCA9IGFyY2hfZ2V0X21tYXBfZW5kKGFkZHIsIGxlbiwgZmxhZ3Mp
Owo+ICsKPiArICAgICAgIGlmICghYWRkcikKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
Kwo+ICsgICAgICAgYWRkciA9IFBBR0VfQUxJR04oYWRkcik7Cj4gKyAgICAgICB2bWEgPSBmaW5k
X3ZtYV9wcmV2KG1tLCBhZGRyLCAmcHJldik7Cj4gKyAgICAgICBpZiAobW1hcF9lbmQgLSBsZW4g
Pj0gYWRkciAmJiBhZGRyID49IG1tYXBfbWluX2FkZHIgJiYKPiArICAgICAgICAgICAoIXZtYSB8
fCBhZGRyICsgbGVuIDw9IHZtX3N0YXJ0X2dhcCh2bWEpKSAmJgo+ICsgICAgICAgICAgICghcHJl
diB8fCBhZGRyID49IHZtX2VuZF9nYXAocHJldikpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
YWRkcjsKPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgLyogR2V0IGFuIGFkZHJl
c3MgcmFuZ2Ugd2hpY2ggaXMgY3VycmVudGx5IHVubWFwcGVkLgo+ICAgKiBGb3Igc2htYXQoKSB3
aXRoIGFkZHI9MC4KPiAgICoKPiBAQCAtNjM3LDcgKzY1OCw2IEBAIGdlbmVyaWNfZ2V0X3VubWFw
cGVkX2FyZWEoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIHZtX2ZsYWdzX3Qgdm1fZmxh
Z3MpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4g
LSAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgKnByZXY7Cj4gICAgICAgICBzdHJ1
Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm8gPSB7fTsKPiAgICAgICAgIGNvbnN0IHVuc2ln
bmVkIGxvbmcgbW1hcF9lbmQgPSBhcmNoX2dldF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKTsK
Pgo+IEBAIC02NDcsMTQgKzY2Nyw5IEBAIGdlbmVyaWNfZ2V0X3VubWFwcGVkX2FyZWEoc3RydWN0
IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgIGlmIChmbGFncyAmIE1B
UF9GSVhFRCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGFkZHI7CgpJdCBzZWVtcyB5b3UgYWxz
byBjYW4gbW92ZSB0aGUgTUFQX0ZJWEVEIGNhc2UgaW50byBnZW5lcmljX21tYXBfaGludCgpLCBy
aWdodD8KCj4KPiAtICAgICAgIGlmIChhZGRyKSB7Cj4gLSAgICAgICAgICAgICAgIGFkZHIgPSBQ
QUdFX0FMSUdOKGFkZHIpOwo+IC0gICAgICAgICAgICAgICB2bWEgPSBmaW5kX3ZtYV9wcmV2KG1t
LCBhZGRyLCAmcHJldik7Cj4gLSAgICAgICAgICAgICAgIGlmIChtbWFwX2VuZCAtIGxlbiA+PSBh
ZGRyICYmIGFkZHIgPj0gbW1hcF9taW5fYWRkciAmJgo+IC0gICAgICAgICAgICAgICAgICAgKCF2
bWEgfHwgYWRkciArIGxlbiA8PSB2bV9zdGFydF9nYXAodm1hKSkgJiYKPiAtICAgICAgICAgICAg
ICAgICAgICghcHJldiB8fCBhZGRyID49IHZtX2VuZF9nYXAocHJldikpKQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBhZGRyOwo+IC0gICAgICAgfQo+ICsgICAgICAgYWRkciA9IGdl
bmVyaWNfbW1hcF9oaW50KGZpbHAsIGFkZHIsIGxlbiwgcGdvZmYsIGZsYWdzKTsKPiArICAgICAg
IGlmIChhZGRyKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gYWRkcjsKPgo+ICAgICAgICAgaW5m
by5sZW5ndGggPSBsZW47Cj4gICAgICAgICBpbmZvLmxvd19saW1pdCA9IG1tLT5tbWFwX2Jhc2U7
Cj4gQEAgLTY4NSw3ICs3MDAsNiBAQCBnZW5lcmljX2dldF91bm1hcHBlZF9hcmVhX3RvcGRvd24o
c3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBsZW4sIHVuc2lnbmVkIGxvbmcgcGdvZmYs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3Ms
IHZtX2ZsYWdzX3Qgdm1fZmxhZ3MpCj4gIHsKPiAtICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLCAqcHJldjsKPiAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+
bW07Cj4gICAgICAgICBzdHJ1Y3Qgdm1fdW5tYXBwZWRfYXJlYV9pbmZvIGluZm8gPSB7fTsKPiAg
ICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgbW1hcF9lbmQgPSBhcmNoX2dldF9tbWFwX2VuZChh
ZGRyLCBsZW4sIGZsYWdzKTsKPiBAQCAtNjk4LDE0ICs3MTIsOSBAQCBnZW5lcmljX2dldF91bm1h
cHBlZF9hcmVhX3RvcGRvd24oc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYWRkciwK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGFkZHI7Cj4KPiAgICAgICAgIC8qIHJlcXVlc3Rpbmcg
YSBzcGVjaWZpYyBhZGRyZXNzICovCj4gLSAgICAgICBpZiAoYWRkcikgewo+IC0gICAgICAgICAg
ICAgICBhZGRyID0gUEFHRV9BTElHTihhZGRyKTsKPiAtICAgICAgICAgICAgICAgdm1hID0gZmlu
ZF92bWFfcHJldihtbSwgYWRkciwgJnByZXYpOwo+IC0gICAgICAgICAgICAgICBpZiAobW1hcF9l
bmQgLSBsZW4gPj0gYWRkciAmJiBhZGRyID49IG1tYXBfbWluX2FkZHIgJiYKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICghdm1hIHx8IGFkZHIgKyBsZW4gPD0gdm1fc3RhcnRfZ2Fw
KHZtYSkpICYmCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoIXByZXYgfHwgYWRk
ciA+PSB2bV9lbmRfZ2FwKHByZXYpKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
YWRkcjsKPiAtICAgICAgIH0KPiArICAgICAgIGFkZHIgPSBnZW5lcmljX21tYXBfaGludChmaWxw
LCBhZGRyLCBsZW4sIHBnb2ZmLCBmbGFncyk7Cj4gKyAgICAgICBpZiAoYWRkcikKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIGFkZHI7Cj4KPiAgICAgICAgIGluZm8uZmxhZ3MgPSBWTV9VTk1BUFBF
RF9BUkVBX1RPUERPV047Cj4gICAgICAgICBpbmZvLmxlbmd0aCA9IGxlbjsKPiAtLQo+IDIuNDcu
MC4zMzguZzYwY2NhMTU4MTktZ29vZwo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBz
LWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
