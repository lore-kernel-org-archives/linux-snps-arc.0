Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B58E7718B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLHHpZ3ex+VOsEuFnMtkMU9n2C1HCdDMW3QLdfbtulM=; b=hgKBwEQWpV7m72
	rxbzv/qFJieqAaDF22RwXuWgdu4IEQcjmXClF522BoCI3cqOVq3ZAxfx8YIJxHdK74TlVGJjrS8n4
	Qx8aAyKqQUbGsCQZb6zwvwseRglVqXTE5lkwY/AykbcjE3zLczklc12zNZA4lh+rvoQg3tm1tuD3v
	b3OP+BSpnFj4GADmK1PN9QD3xgtKPHYrROxtX5wAJ17W0pV/EqDTHMwTbvI4tdBR6b7dPWTfprT8b
	jL6FD1nNEBKXj2iL/B/VpAcf+w4G4TyXebrMz+fwBcSfH21Yf0oK+hWBnCgI8SfELR+wz1DJLtGWX
	H/5Lz9o3ycwRO2mQibcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdoJ-000000057OV-0r9m;
	Fri, 20 Dec 2024 14:16:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdnv-000000057IU-0Ysc
	for linux-snps-arc@lists.infradead.org;
	Fri, 20 Dec 2024 14:16:37 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2156e078563so18008705ad.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 20 Dec 2024 06:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734704194; x=1735308994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7iBLKI/TaFFZvOKdERySTto1DEdoOqdcbn/lUOJJc0=;
        b=XjYKBji+3IPrhsWD/ViClkPtQceu5eSMI3svx/Fn0ropa8Y6emzz5sDm9sTBW6oZi6
         UorgrtMSTtfdDqOZKNtkLSNpKZB3AVEWF4cG2dlNUheyWPa7a8aZH79oXYqpKbNYNF4r
         89iioUa9IXRHjCg2RRe3hMD+/26y8CoOoo3MMRy+Er2eddW8xU2G7/4iY4xN/kg4abXs
         rQCaflyhaPFdxXPO0Q7Y85ZDB8VXGa7tAoRDsv8NgtJfXE8tkRxDlE0EM9Fks3gTdGnV
         6uoPzUEKXzwkPT8ut6jWvgoFmlCIOKXxhXFukdAvt8CvayKMnXo2iDD8j+Rjl1pKAN0u
         xPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734704194; x=1735308994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7iBLKI/TaFFZvOKdERySTto1DEdoOqdcbn/lUOJJc0=;
        b=Gj3ym+AjfFH+RmwU1ft1/KNvFIYPtWu1XgNI6F90TPCwy+zDTyyQZJNjZF+WhKrJaE
         5+GhVQ2zulCMUUwxLyE2GDdONJ//Po93tLv0LzAwNGn/T9jwWkkTfgYz8zZgE20XY0Jn
         rEcjd6aPAF8xxRT0r7OkeZaJKSQa6GRCg8LlLRE0R2s+DjscXBULinGpHtdmJB4X28OZ
         GCSggEYtWRI64h1ZNNo0hx9h9X5Hex6dkcpeQR6b5PCsp/9p2yVUb+na4SxX315estea
         N0E7SUC0sb8ncO0aldg+plqqWRwlByvoyzju/Wkql7bTel/5qd6ryqUjId6jkSu1Rs3x
         /xdg==
X-Forwarded-Encrypted: i=1; AJvYcCUws2XixV6LOvkKnnucWBD6vC3vFbk+2ozwqwc1Mxx6cmf3weFRsY3I1Qbj2JCM2PFApj/xtPr4xCjaA3t6nQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Ns7jvfQuICWm+wiZQNFjifcWXivdDjFdtopNoXuhOBz4xC6i
	LY3nH4OakYiTRabLqnXPLstkArA0zXU5D8W2dKOrSGkMG0SjlF0U4QAducniF0Q=
X-Gm-Gg: ASbGncte6dh5LuP/bCvwbcE/T3sE3vlCVErTlXvbAJa0UPfDKWEtkj509MXyZ/0PxFA
	GgRMNCaq6jrCAljSME9HKG4//ozUjhzc0aXlzC9jO6SjnLBhNW+rlBfpbGmyMrau0sSw7M46M+5
	mZ8pYfOT2aqYbHdH66AfuMUuO0xB/7eYF2ACHzcfzPlQ3DBjMnhW5T3AxNjyTiMm/Xpf9nWHwJM
	mbd4fAInaSO3kvk/tKB5oMbWDrNDri0aXwUwIHbCad5ODBqa4PFOtN3zrUyjhHoqk3d06POE7PU
	xJa/cYVcuc0JUPfwPlxFNbxB+ZGLQ5oDGYhqkGPa81af2j1hQQNy2/4=
X-Google-Smtp-Source: AGHT+IEEYygST4Gz03iGTM9RRiblbKn1x180pLztYOSIYhLMIpPKwcn4PYi8F34LVLcH4FrG3CDhdg==
X-Received: by 2002:a17:902:d481:b0:216:770e:f46 with SMTP id d9443c01a7336-219e6f26692mr39017935ad.54.1734704193630;
        Fri, 20 Dec 2024 06:16:33 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:dc48:fb1b:dd06:cba7? ([2409:8a28:f44:3764:dc48:fb1b:dd06:cba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc972734sm29423545ad.88.2024.12.20.06.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:16:33 -0800 (PST)
Message-ID: <33ce9b58-4787-49cd-a7f2-34272cb3ecf7@bytedance.com>
Date: Fri, 20 Dec 2024 22:16:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
 <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
 <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <2f65f93e-9d44-4acc-b63c-8f5a35f59699@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_061635_205744_762E475B 
X-CRM114-Status: GOOD (  19.28  )
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

CgpPbiAyMDI0LzEyLzIwIDIxOjUwLCBLZXZpbiBCcm9kc2t5IHdyb3RlOgo+IE9uIDIwLzEyLzIw
MjQgMTI6NDYsIFFpIFpoZW5nIHdyb3RlOgo+PiBIaSBLZXZpbiwKPj4KPj4gT24gMjAyNC8xMi8y
MCAxODo0OSwgS2V2aW4gQnJvZHNreSB3cm90ZToKPj4+IFsuLi5dCj4+Pgo+Pj4gUWksIHNoYWxs
IHdlIGNvbGxhYm9yYXRlIHRvIG1ha2Ugb3VyIHNlcmllcyBjb21wbGVtZW50YXJ5PyBJIGJlbGll
dmUgbXkKPj4+IHNlcmllcyBjb3ZlcnMgcGF0Y2ggMiBhbmQgNCBvZiB5b3VyIHNlcmllcywgYnV0
IGl0IGdvZXMgZnVydGhlciBieQo+Pj4gY292ZXJpbmcgYWxsIGxldmVscyBhbmQgYWxsIGFyY2hp
dGVjdHVyZXMsIGFuZCBwYXRjaGVzIGludHJvZHVjaW5nCj4+PiBjdG9yL2R0b3IgYXJlIGFscmVh
ZHkgc3BsaXQgYXMgQWxleGFuZGVyIHN1Z2dlc3RlZCBvbiB5b3VyIHNlcmllcy4gU28gbXkKPj4+
IHN1Z2dlc3Rpb24gd291bGQgYmU6Cj4+Pgo+Pj4gKiBSZW1vdmUgcGF0Y2ggMSBpbiBteSBzZXJp
ZXMgLSBJJ2QganVzdCBpbnRyb2R1Y2UKPj4+IHBhZ2V0YWJsZV97cDRkLHBnZH1fW2NkXXRvciB3
aXRoIHRoZSBzYW1lIGltcGxlbWVudGF0aW9uIGFzCj4+PiBwYWdldGFibGVfcHVkX1tjZF10b3Iu
Cj4+PiAqIFJlbW92ZSBwYXRjaCAyIGFuZCA0IGZyb20geW91ciBzZXJpZXMgYW5kIHJlYmFzZSBp
dCBvbiBtaW5lLgo+Pgo+PiBJIHF1aWNrbHkgd2VudCB0aHJvdWdoIHlvdXIgcGF0Y2ggc2VyaWVz
LiBJdCBsb29rcyBsaWtlIG15IHBhdGNoIDIgYW5kCj4+IHlvdXIgcGF0Y2ggNiBhcmUgZHVwbGlj
YXRlZCwgc28geW91IHdhbnQgbWUgdG8gcmVtb3ZlIG15IHBhdGNoIDIuCj4+Cj4+IEJ1dCBJIHRo
aW5rIHlvdSBtYXkgbm90IGJlIGFibGUgdG8gc2ltcGxlIGxldCBhcm02NCwgcmlzY3YgYW5kIHg4
NiB0bwo+PiB1c2UgZ2VuZXJpYyBwNGRfe2FsbG9jX29uZSxmcmVlfSgpLiBCZWNhdXNlIGV2ZW4g
aWYKPj4gQ09ORklHX1BHVEFCTEVfTEVWRUxTID4gNCwgdGhlIHBndGFibGVfbDVfZW5hYmxlZCgp
IG1heSBub3QgYmUgdHJ1ZS4KPj4KPj4gRm9yIGV4YW1wbGUsIGluIGFybTY0Ogo+Pgo+PiAjaWYg
Q09ORklHX1BHVEFCTEVfTEVWRUxTID4gNAo+Pgo+PiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJv
b2wgcGd0YWJsZV9sNV9lbmFibGVkKHZvaWQpCj4+IHsKPj4gIMKgwqDCoMKgaWYgKCFhbHRlcm5h
dGl2ZV9oYXNfY2FwX2xpa2VseShBUk02NF9BTFdBWVNfQk9PVCkpCj4+ICDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gdmFiaXRzX2FjdHVhbCA9PSBWQV9CSVRTOwo+PiAgwqDCoMKgwqByZXR1cm4gYWx0
ZXJuYXRpdmVfaGFzX2NhcF91bmxpa2VseShBUk02NF9IQVNfVkE1Mik7Cj4+IH0KPiAKPiBDb3Jy
ZWN0LiBUaGF0J3Mgd2h5IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBwNGRfZnJlZSgpIEkgaW50cm9k
dWNlIGluCj4gcGF0Y2ggNiBjaGVja3MgbW1fcDRkX2ZvbGRlZCgpLCB3aGljaCBpcyBpbXBsZW1l
bnRlZCBhcwo+ICFwZ3RhYmxlX2w1X2VuYWJsZWQoKSBvbiB0aG9zZSBhcmNoaXRlY3R1cmVzIChz
ZWUgbGFzdCBwYXJhZ3JhcGggaW4KPiBjb21taXQgbWVzc2FnZSkuIEluIGZhY3QgaXQgdHVybnMg
b3V0IEFsZXhhbmRlciBzdWdnZXN0ZWQgZXhhY3RseSB0aGlzCj4gYXBwcm9hY2ggWzJdLgoKT0ss
IEkgc2VlLgoKPiAKPj4KPj4gRGlkIEkgbWlzcyBzb21ldGhpbmc/Cj4+Cj4+IE15IHBhdGNoIHNl
cmllcyBpcyBub3Qgb25seSBmb3IgY2xlYW51cCwgYnV0IGFsc28gZm9yIGZpeGVzIG9mCj4+IFVB
RiBpc3N1ZSBbMV0sIHNvIGlzIGl0IHBvc3NpYmxlIHRvIHJlYmFzZSB5b3VyIHBhdGNoIHNlcmll
cyBvbnRvCj4+IG1pbmU/IEkgY2FuIHBvc3QgdjMgQVNBUC4KPiAKPiBJIHNlZSwgeW91cnMgc2hv
dWxkIGJlIG1lcmdlZCBmaXJzdCB0aGVuLiBUaGUgaXNzdWUgaXMgdGhhdCB5b3VycyB3b3VsZAo+
IGRlcGVuZCBvbiBzb21lIG9mIHRoZSBwYXRjaGVzIGluIG1pbmUsIG5vdCB0aGUgb3RoZXIgd2F5
IHJvdW5kLgo+IAo+IE15IHN1Z2dlc3Rpb24gd291bGQgdGhlbiBiZSBmb3IgeW91IHRvIHRha2Ug
cGF0Y2ggNSwgNiBhbmQgNyBmcm9tIG15Cj4gc2VyaWVzLCBhcyB0aGV5IG1hdGNoIEFsZXhhbmRl
cidzIHN1Z2dlc3Rpb25zIChhbmQgcGF0Y2ggNSBpcyBJIHRoaW5rIGEKPiB1c2VmdWwgc2ltcGxp
ZmljYXRpb24pLCBhbmQgcmVwbGFjZSBwYXRjaCAyIGluIHlvdXIgc2VyaWVzIHdpdGggdGhvc2Uu
IEkKPiB3b3VsZCB0aGVuIHJlYmFzZSBteSBzZXJpZXMgb24gdG9wIGFuZCBhZGFwdCBpdCBhY2Nv
cmRpbmdseS4gRG9lcyB0aGF0Cj4gc291bmQgcmVhc29uYWJsZT8KClNvdW5kcyBnb29kLiBCdXQg
bWF5YmUganVzdCBwYXRjaCA1IGFuZCA2LiBCZWNhdXNlIEkgYWN0dWFsbHkgZGlkCnRoZSB3b3Jr
IG9mIHlvdXIgcGF0Y2ggNyBpbiBteSBwYXRjaCAyIGFuZCA0LgoKU28sIGlzIGl0IG9rYXkgdG8g
ZG8gc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZz8KCjEuIEkgc2VwYXJhdGUgdGhlIGN0b3Io
KS9kdG9yKCkgcGFydCBmcm9tIG15IHBhdGNoIDIsIGFuZCB0aGVuIHJlcGxhY2UKICAgIHRoZSBy
ZXN0IHdpdGggeW91ciBwYXRjaCA2LgoyLiB0YWtlIHlvdXIgcGF0Y2ggNSBmb3JtIHlvdXIgc2Vy
aWVzCgpJZiBpdCdzIG9rLCBJIHdpbGwgcG9zdCB0aGUgdjMgbmV4dCBNb25kYXkuIDspCgpUaGFu
a3MhCgo+IAo+IC0gS2V2aW4KPiAKPiBbMl0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
WjJSS3BkdjdwTDM0TUlFdEB0dXhtYWtlci5ib2VibGluZ2VuLmRlLmlibS5jb20vCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFy
YyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
