Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A78E77181
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 03:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0jhw4ePPi7A3U8qstp7wvhLKKBV8NmH2LOjJU2sOio=; b=n5f0J/ZimImRJF
	oRR3mlBnvGp8pZn8AopXVR6GFZTSwYuRl1O35G/PQTzW6BBm5hV+U6+nZ8wTGxzoA5LLirPslZ2nU
	ganCU8zuEMtlO5WN5Sq4+as0m2xOeunnobAGxu6LXOdtc0HBUXGQSF8c/J9geMfo/DLyftwk9ItU/
	rLPCUxjxKAQXg7L7PVEDHb4XXL5m8NCrcqf8JrG/7Yl5XyYZmXfB/TFfTzshpvSY5Jqi/ix+rOfzr
	qViid+Nz7yNVBsqZ+Ux2imfC23qBAuhPtlaIzsu1AtcC7M36zTtO9IFm+RBDxj5lz1OBDDW7IP0Kr
	RCsi71DRFbcEYTZe1Ppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKr4B-0000000A7c5-425f;
	Tue, 10 Dec 2024 03:37:43 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKr48-0000000A7aQ-44Eq;
	Tue, 10 Dec 2024 03:37:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso1666860a12.0;
        Mon, 09 Dec 2024 19:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801859; x=1734406659; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=gPJIc32ditd6ISBJjcoU1wmzn+EwzBht2a09C4O7Q0+wmfurablqPbnYw8PEmYz7Ph
         EJTTdULP2Llvsf1Bn+rlOKQ39O92qn0xHg+Ioz3Zb+Egq+tXxtWzCOZUeZMgMIm+njYW
         OxKR0jKZF0lQzFamH2pBTCuPfFCZdSjM+Ikj2Rbe5PjgkeBizcScK7/o55mFFypoM5VN
         amsGWfm6I5TVlyaSf3prGhw1WGFByM7wzekmWzBw4YlxAN+3064fK6wh0811DBC2l1Ay
         YIrLtqx992WXCId6y1y16aQ+31tQNwCrzO5pu9i6yd8y7bfLqsb9bY1/40ioNFp8CeT1
         O7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801859; x=1734406659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=bdeTdO4a6A7Gd3bV4kHYTw3KdtARptOh+V8ugy7iRb+MDtwLYZ1h0fBaPGqvIU7WVh
         9yOlvJYqEzJ3+nBPqQOAbHuB5t5Btrdj42KbI+KHiR12GKUGdDUumv4U8/lfeP78XB0A
         ykpv5nIpsFkIq2KiXBzGnCrWmrL857oxBkdZ6R4Vfck5n3DGTw7sV7YnAnPsP1HMqd3W
         K2HMVofFsTC9sYAtPZuSUXzRDEIDJ1HDBza9zrVV9WP/mjTTUayYgCMmAhMl+pF/5ASM
         cEXnbaw4l7/UtlHD7FyscqgWNfMISrf61fqbBcqX9EQX1vE6jXx0VpgXbkKhKZisU4he
         wd+w==
X-Forwarded-Encrypted: i=1; AJvYcCW0vgZNL4fb7MSUIAJO/tockffWHLJBhJA6H6KaWKjBsaRCI1ND5zbsyd7ydSE+HpYi46gN9SgIr9Rp9egMzhRQ@lists.infradead.org, AJvYcCWlQ2CA+JyefuoEz+18mO3B0SufpsVztMb/+Bxx4Ql+zG2CRrUBDMWsd1xJdu86Mvy1jYPlHQE0J/imfs8HztU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyyXjz0nciL3GsKfy1lU75Hy5mAkKFslLKVaMedQgayTof/3mW
	39nNhdE+l5zMQy9mw/mpWHj93Y3GErBtGvEruTb/XsBKF/k62RVGUe7qwVtg+cgMSFDNiFny9ie
	TGWCzqxWIOezEqZNtc6F1YG3Hp5k=
X-Gm-Gg: ASbGncuOceBtf+QmMwGhA/Kz7h/6vmYJXu6V7ysIwTkYirU4IC/TgETLZ+vpB62DhX1
	vMNBGFtS9JXBJoBMVCWM6gyylwqOYu+3qP/DJ1w==
X-Google-Smtp-Source: AGHT+IElXjz+7x/lQGuFmHk7BJtRPsIF5Xkbrc+PaOE9soOWoyJSq8aIO8IH6O/j+TzaKqiG91uZtuFho2g8MHXawAQ=
X-Received: by 2002:a05:6402:3229:b0:5d0:f6ed:4cd1 with SMTP id
 4fb4d7f45d1cf-5d41e2b4c34mr1849541a12.10.1733801858975; Mon, 09 Dec 2024
 19:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-18-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-18-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:37:27 -0800
Message-ID: <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
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
X-CRM114-CacheID: sfid-20241209_193741_005553_6882C0D4 
X-CRM114-Status: GOOD (  27.20  )
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

T24gTW9uLCBEZWMgOSwgMjAyNCBhdCA2OjQ14oCvUE0gS2FsZXNoIFNpbmdoIDxrYWxlc2hzaW5n
aEBnb29nbGUuY29tPiB3cm90ZToKPgo+IENvbW1pdCAyNDk2MDhlZTQ3MTMgKCJtbTogcmVzcGVj
dCBtbWFwIGhpbnQgYWRkcmVzcyB3aGVuIGFsaWduaW5nIGZvciBUSFAiKQo+IGZhbGxzYmFjayB0
byBQQUdFX1NJWkUgYWxpZ25tZW50IGluc3RlYWQgb2YgVEhQIGFsaWdubWVudAo+IGZvciBhbm9u
eW1vdXMgbWFwcGluZyBhcyBsb25nIGFzIGEgaGludCBhZGRyZXNzIGlzIHByb3ZpZGVkIGJ5IHRo
ZSB1c2VyCj4gLS0gZXZlbiBpZiB3ZSB3ZXJlbid0IGFibGUgdG8gYWxsb2NhdGUgdGhlIHVubWFw
cGVkIGFyZWEgYXQgdGhlIGhpbnQKPiBhZGRyZXNzIGluIHRoZSBlbmQuCj4KPiBUaGlzIHdhcyBk
b25lIHRvIGFkZHJlc3MgdGhlIGltbWVkaWF0ZSByZWdyZXNzaW9uIGluIGFub255bW91cyBtYXBw
aW5ncwo+IHdoZXJlIHRoZSBoaW50IGFkZHJlc3Mgd2VyZSBiZWluZyBpZ25vcmVkIGluIHNvbWUg
Y2FzZXM7IGR1ZSB0byBjb21taXQKPiBlZmE3ZGYzZTNiYjUgKCJtbTogYWxpZ24gbGFyZ2VyIGFu
b255bW91cyBtYXBwaW5ncyBvbiBUSFAgYm91bmRhcmllcyIpLgo+Cj4gSXQgd2FzIGxhdGVyIHBv
aW50ZWQgb3V0IHRoYXQgdGhpcyBpc3N1ZSBhbHNvIGV4aXN0ZWQgZm9yIGZpbGUtYmFja2VkCj4g
bWFwcGluZ3MgZnJvbSBmaWxlIHN5c3RlbXMgdGhhdCB1c2UgdGhwX2dldF91bm1hcHBlZF9hcmVh
KCkgZm9yIHRoZWlyCj4gLmdldF91bm1hcHBlZF9hcmVhKCkgZmlsZSBvcGVyYXRpb24uCj4KPiBU
aGUgc2FtZSBmaXggd2FzIG5vdCBhcHBsaWVkIGZvciBmaWxlLWJhY2tlZCBtYXBwaW5ncyBzaW5j
ZSBpdCB3b3VsZAo+IG1lYW4gYW55IG1tYXAgcmVxdWVzdHMgdGhhdCBwcm92aWRlIGEgaGludCBh
ZGRyZXNzIHdvdWxkIGJlIG9ubHkKPiBQQUdFX1NJWkUtYWxpZ25lZCByZWdhcmRsZXNzIG9mIHdo
ZXRoZXIgYWxsb2NhdGlvbiB3YXMgc3VjY2Vzc2Z1bCBhdAo+IHRoZSBoaW50IGFkZHJlc3Mgb3Ig
bm90Lgo+Cj4gSW5zdGVhZCwgdXNlIGFyY2hfbW1hcF9oaW50KCkgdG8gZmlyc3QgYXR0ZW1wdCBh
bGxvY2F0aW9uIGF0IHRoZSBoaW50Cj4gYWRkcmVzcyBhbmQgZmFsbGJhY2sgdG8gVEhQIGFsaWdu
bWVudCBpZiB0aGF0IGZhaWxzLgoKVGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byB0cnkgdG8gZml4
IHRoaXMuCgo+Cj4gU2lnbmVkLW9mZi1ieTogS2FsZXNoIFNpbmdoIDxrYWxlc2hzaW5naEBnb29n
bGUuY29tPgo+IC0tLQo+ICBtbS9odWdlX21lbW9yeS5jIHwgMTUgKysrKysrKystLS0tLS0tCj4g
IG1tL21tYXAuYyAgICAgICAgfCAgMSAtCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL21tL2h1Z2VfbWVtb3J5LmMgYi9t
bS9odWdlX21lbW9yeS5jCj4gaW5kZXggMTM3YWJlZGE4NjAyLi5mMDcwYzg5ZGFmYzkgMTAwNjQ0
Cj4gLS0tIGEvbW0vaHVnZV9tZW1vcnkuYwo+ICsrKyBiL21tL2h1Z2VfbWVtb3J5LmMKPiBAQCAt
MTA5Nyw2ICsxMDk3LDE0IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIF9fdGhwX2dldF91bm1hcHBl
ZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxwLAo+ICAgICAgICAgbG9mZl90IG9mZl9hbGlnbiA9IHJv
dW5kX3VwKG9mZiwgc2l6ZSk7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGxlbl9wYWQsIHJldCwg
b2ZmX3N1YjsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIElmIGFsbG9jYXRpb24gYXQgdGhl
IGFkZHJlc3MgaGludCBzdWNjZWVkczsgcmVzcGVjdCB0aGUgaGludCBhbmQKPiArICAgICAgICAq
IGRvbid0IHRyeSB0byBhbGlnbiB0byBUSFAgYm91bmRhcnkuCj4gKyAgICAgICAgKi8KPiArICAg
ICAgIGFkZHIgPSBhcmNoX21tYXBfaGludChmaWxwLCBhZGRyLCBsZW4sIG9mZiwgZmxhZ3MpOwo+
ICsgICAgICAgaWYgKGFkZHIpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBhZGRyOwo+ICsKCklJ
VUMsIGFyY2hfbW1hcF9oaW50KCkgd2lsbCBiZSBjYWxsZWQgaW4gYXJjaF9nZXRfdW5tYXBwZWRf
YXJlYSgpIGFuZAphcmNoX2dldF91bm1hcHBlZF9hcmVhX3RvcGRvd24oKSBhZ2Fpbi4gU28gd2Ug
d2lsbCBhY3R1YWxseSBsb29rIHVwCm1hcGxlIHRyZWUgdHdpY2UuIEl0IHNvdW5kcyBsaWtlIHRo
ZSBzZWNvbmQgaGludCBhZGRyZXNzIHNlYXJjaCBpcwpwb2ludGxlc3MuIFlvdSBzaG91bGQgYmUg
YWJsZSB0byBzZXQgYWRkciB0byAwIGJlZm9yZSBjYWxsaW5nCm1tX2dldF91bm1hcHBlZF9hcmVh
X3ZtZmxhZ3MoKSBpbiBvcmRlciB0byBza2lwIHRoZSBzZWNvbmQgaGludAphZGRyZXNzIHNlYXJj
aC4KCj4gICAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHXzY0QklUKSB8fCBpbl9jb21wYXRf
c3lzY2FsbCgpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+IEBAIC0xMTE3LDEzICsx
MTI1LDYgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX190aHBfZ2V0X3VubWFwcGVkX2FyZWEoc3Ry
dWN0IGZpbGUgKmZpbHAsCj4gICAgICAgICBpZiAoSVNfRVJSX1ZBTFVFKHJldCkpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+Cj4gLSAgICAgICAvKgo+IC0gICAgICAgICogRG8gbm90IHRy
eSB0byBhbGlnbiB0byBUSFAgYm91bmRhcnkgaWYgYWxsb2NhdGlvbiBhdCB0aGUgYWRkcmVzcwo+
IC0gICAgICAgICogaGludCBzdWNjZWVkcy4KPiAtICAgICAgICAqLwo+IC0gICAgICAgaWYgKHJl
dCA9PSBhZGRyKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gYWRkcjsKPiAtCj4gICAgICAgICBv
ZmZfc3ViID0gKG9mZiAtIHJldCkgJiAoc2l6ZSAtIDEpOwo+Cj4gICAgICAgICBpZiAodGVzdF9i
aXQoTU1GX1RPUERPV04sICZjdXJyZW50LT5tbS0+ZmxhZ3MpICYmICFvZmZfc3ViKQo+IGRpZmYg
LS1naXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMKPiBpbmRleCA1OWJmN2QxMjdhYTEuLjZiZmVl
YzgwMTUyYSAxMDA2NDQKPiAtLS0gYS9tbS9tbWFwLmMKPiArKysgYi9tbS9tbWFwLmMKPiBAQCAt
ODA3LDcgKzgwNyw2IEBAIF9fZ2V0X3VubWFwcGVkX2FyZWEoc3RydWN0IGZpbGUgKmZpbGUsIHVu
c2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBsZW4sCj4gICAgICAgICBpZiAoZ2V0X2Fy
ZWEpIHsKPiAgICAgICAgICAgICAgICAgYWRkciA9IGdldF9hcmVhKGZpbGUsIGFkZHIsIGxlbiwg
cGdvZmYsIGZsYWdzKTsKPiAgICAgICAgIH0gZWxzZSBpZiAoSVNfRU5BQkxFRChDT05GSUdfVFJB
TlNQQVJFTlRfSFVHRVBBR0UpICYmICFmaWxlCj4gLSAgICAgICAgICAgICAgICAgICYmICFhZGRy
IC8qIG5vIGhpbnQgKi8KPiAgICAgICAgICAgICAgICAgICAgJiYgSVNfQUxJR05FRChsZW4sIFBN
RF9TSVpFKSkgewo+ICAgICAgICAgICAgICAgICAvKiBFbnN1cmVzIHRoYXQgbGFyZ2VyIGFub255
bW91cyBtYXBwaW5ncyBhcmUgVEhQIGFsaWduZWQuICovCj4gICAgICAgICAgICAgICAgIGFkZHIg
PSB0aHBfZ2V0X3VubWFwcGVkX2FyZWFfdm1mbGFncyhmaWxlLCBhZGRyLCBsZW4sCj4gLS0KPiAy
LjQ3LjAuMzM4Lmc2MGNjYTE1ODE5LWdvb2cKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
