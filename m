Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A849E7717F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Dec 2024 20:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGWv4uaqBTF5x3S2ZqLX9dl7QHhlMP90xblC4Ooll2A=; b=dprcfjzmeH/AfI
	257lEACFVXuYRTHFdRzHV6vLmGS42pWT/6dZf8aqBcMjQ+JYADbmBvIbqErD284aw7o42SR/Up1fb
	I8/dN7o4WK63OtYK+BwRytrKdWrVYz7HhGFNEJGb+1L/DdoOcWVOmLOX3yhImQdgc6loMu/TXQSZr
	y6jAlpxsJAWzWAWUUDjJwBMMnp2Ejy6OImBVs9YnGGfuED+xtktXmOl0dubQfDUePQhKRMOOxzP1o
	mGuNZ+E6jH3bCg+HOLUQpT+BDLvg4Ekx5QfPoxkYrJ2yufiCoxVZhuPpOnZB5/vRM6r7SC3xPBHSz
	p99XUa/+9dqJUhxFWa+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpZC-00000001lkZ-0nLS;
	Thu, 12 Dec 2024 20:13:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpUS-00000001kmB-2Q0q;
	Thu, 12 Dec 2024 20:08:53 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa66ead88b3so185780966b.0;
        Thu, 12 Dec 2024 12:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034127; x=1734638927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=Stz6Acp68seXJZldlsgODOmquadyq6yyAhwanUDouqcR5kmytSyctegwsk4iKjCUFg
         Rp9vgNRPCq058QQAeClu/A7eTN8IyOa+MurnP3KHfItykSNQJlUEA+nuYzO1IvWTdc7X
         iesGOrLGx4rtkZWJNowebhDR3OLrRke5ste5sl8AYnkDdHRVYwP+pCrHxtDr3QwCUMF4
         Nzw/LLiWB13BVL5raJwZY6jxHG1rmtDu/Ul61b8r1opMM/M2t34JXpUfSYzSCCIYbhWz
         WWXRrN7vFK4Jn2bbyvW2kJeUJX0JMftAw+8zfCtCfmCwxwTUDKheFGMjrhFcfsvlaM0d
         xHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034127; x=1734638927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=qwykOclAt/dv3h2ZpNhEfRzyF/sstBgUXkwwKtWOQ1sm/aTDvZ55LJ/dr78+1YVfAD
         XaHo//X4q31KEnE4LSxkAMUni8qBmaMOsLSauYtOctvG7RIrEEsg+7eOtRnOrry2saUs
         Y8Quch2YqkDY75CIpvgG1oLlLjHDvvBkpxFvsm938vl8/3nsW3qpGzd7/f0Sh3ifrbvf
         db9qoMn+UB2rH0tAoos01HPcS9umAFhMriI4Bn7bFl77WmOmkYCVBWq3LblIZ6hN6Sjk
         pReZ7hkLCOyylPYifL3PLfIJNxqP7SS9poLug5npsYjKF0suY+B4PRbJqZEVETisCud4
         Gagg==
X-Forwarded-Encrypted: i=1; AJvYcCUzJdRF6t2MwGaigLett9lJNbySfwzvbvxCqnmPGp9x0ETDZO1Gq41kY/aCg/yytCNJ3mowcjiV4M7wUtLT0/k=@lists.infradead.org, AJvYcCWKnTxT56IX6Bn2Sw9EN9XkEPOiAALZ9tusSYJTOCugA3ZD0YlM+8ldTp9DCozUWoF0J4eYNhXRIeQgJoNmWIdY@lists.infradead.org
X-Gm-Message-State: AOJu0Yym7KLB3LV7wokXusRke6Vzbt25KihPWOdOpplIZt3JHDOm6ruG
	dho0BOZWD11COeaVJLPjugcOhqviC04oPgjCraudO+xep4nwFQIiZtwsy6QbMXbGchPnbWIy/DW
	t0yNX1BX6i17SPeO/k5qxHujhEN4=
X-Gm-Gg: ASbGnctIGiMPLf/ADfMtGcPS1FQA1AsyisD0VdgvOe5AVs/Xs9ujVPlu1j7gowaIBk6
	7sshcFr0edNA3fM38ReD2pRG/e2xVnKARgvFN+NRe
X-Google-Smtp-Source: AGHT+IFBjZrg88OqeWBDO1jTyqFkrRhdvj/sM97FkFYUxtUn8pc+yCVr/hdiAj5KO+SOUnoKUqWUM88SK7LqY4tEHG8=
X-Received: by 2002:a17:907:3e9f:b0:aa6:64be:ff2d with SMTP id
 a640c23a62f3a-aab778c168emr3388966b.4.1734034126714; Thu, 12 Dec 2024
 12:08:46 -0800 (PST)
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-2-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:08:35 -0800
Message-ID: <CAHbLzkovqMsjti1g_G4dFj2mb4hneBPtR2eGTxTZmC717455-A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 01/16] mm: Introduce generic_mmap_hint()
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com, 
	linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
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
X-CRM114-CacheID: sfid-20241212_120852_616700_A3698FAA 
X-CRM114-Status: GOOD (  24.01  )
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

T24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMzoyOOKAr1BNIEthbGVzaCBTaW5naCA8a2FsZXNoc2lu
Z2hAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBDb25zb2xpZGF0ZSB0aGUgaGludCBzZWFyY2hlcyBm
cm9tIGJvdGggZGlyZWN0aW9ucyAodG9wZG93biBhbmQKPiBib3R0b211cCkgaW50byBnZW5lcmlj
X21tYXBfaGludCgpLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaXMgaW50cm9kdWNlZC4KPgo+
IFNpZ25lZC1vZmYtYnk6IEthbGVzaCBTaW5naCA8a2FsZXNoc2luZ2hAZ29vZ2xlLmNvbT4KPiAt
LS0KPgo+IENoYW5nZXMgaW4gdjI6Cj4gICAtIE1BUF9GSVhFRCBjYXNlIGlzIGFsc28gaGFuZGxl
ZCBpbiBhcmNoX21tYXBfaGludCgpIHNpbmNlIHRoaXMgaXMganVzdCBhCj4gICAgIHNwZWNpYWwg
Y2FzZSBvZiB0aGUgaGludCBhZGRyIGJlaW5nICJlbmZvcmNlZCIsIHBlciBZYW5nIFNoaS4KPiAg
IC0gQ29uc29saWRhdGUgZXJyb3IgaGFuZGxpbmcgaW4gYXJjaF9tbWFwX2hpbnQoKS4KClJldmll
d2VkLWJ5OiBZYW5nIFNoaSA8c2h5ODI4MzAxQGdtYWlsLmNvbT4KCj4KPiAgaW5jbHVkZS9saW51
eC9zY2hlZC9tbS5oIHwgIDQgKysrCj4gIG1tL21tYXAuYyAgICAgICAgICAgICAgICB8IDc2ICsr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA1MCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L3NjaGVkL21tLmggYi9pbmNsdWRlL2xpbnV4L3NjaGVkL21tLmgKPiBpbmRleCA5
MjhhNjI2NzI1ZTYuLmVkZWVjMTlkMTcwOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3Nj
aGVkL21tLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NjaGVkL21tLmgKPiBAQCAtMjAxLDYgKzIw
MSwxMCBAQCB1bnNpZ25lZCBsb25nIG1tX2dldF91bm1hcHBlZF9hcmVhX3ZtZmxhZ3Moc3RydWN0
IG1tX3N0cnVjdCAqbW0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHZtX2ZsYWdzX3Qgdm1fZmxhZ3MpOwo+Cj4gK3Vuc2lnbmVkIGxvbmcgZ2Vu
ZXJpY19tbWFwX2hpbnQoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuLCB1bnNpZ25l
ZCBsb25nIHBnb2ZmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBmbGFncyk7Cj4gKwo+ICB1bnNpZ25lZCBsb25nCj4gIGdlbmVyaWNfZ2V0X3VubWFwcGVk
X2FyZWEoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuLCB1bnNpZ25lZCBsb25nIHBnb2ZmLAo+
IGRpZmYgLS1naXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMKPiBpbmRleCBkZjkxNTRiMTVlZjku
LjM4MmI0ZWFjNTQwNiAxMDA2NDQKPiAtLS0gYS9tbS9tbWFwLmMKPiArKysgYi9tbS9tbWFwLmMK
PiBAQCAtNjIwLDYgKzYyMCw0NyBAQCB1bnNpZ25lZCBsb25nIHZtX3VubWFwcGVkX2FyZWEoc3Ry
dWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyAqaW5mbykKPiAgICAgICAgIHJldHVybiBhZGRyOwo+
ICB9Cj4KPiArLyoKPiArICogTG9vayB1cCB1bm1hcHBlZCBhcmVhIGF0IHRoZSByZXF1ZXN0ZWQg
aGludCBhZGRyCj4gKyAqCj4gKyAqIE5PVEU6IE1BUF9GSVhFRCBpcyBhbHNvIGhhbmRsZWQgaGVy
ZSBzaW5jZSBpdCdzIGEgc3BlY2lhbCBjYXNlIG9mCj4gKyAqIGVuZm9yY2luZyB0aGUgaGludCBh
ZGRyZXNzLgo+ICsgKgo+ICsgKiBSZXR1cm5zOgo+ICsgKiAgICBFUlJfVkFMVUU6IElmIHRoZSBy
ZXF1ZXN0ZWQgbWFwcGluZyBpcyBub3QgdmFsaWQKPiArICogICAgMDogSWYgdGhlcmUgaXNuJ3Qg
YSBzdWZmaWNpZW50bHkgbGFyZ2UgaG9sZSBhdCB0aGUgaGludCBhZGRyLgo+ICsgKiAgICBhZGRy
OiBJZiBzdWZmaWNpZW50IFZBIHNwYWNlIGlzIGF2YWlsYWJsZSBhdCB0aGUgaGludCBhZGRyZXNz
Owo+ICsgKiAgICAgICAgICBvciBNQVBfRklYRUQgd2FzIHNwZWNpZmllZC4KPiArICovCj4gK3Vu
c2lnbmVkIGxvbmcgZ2VuZXJpY19tbWFwX2hpbnQoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVk
IGxvbmcgYWRkciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgbGVuLCB1bnNpZ25lZCBsb25nIHBnb2ZmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBmbGFncykKPiArewo+ICsgICAgICAgc3RydWN0IG1tX3N0cnVj
dCAqbW0gPSBjdXJyZW50LT5tbTsKPiArICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LCAqcHJldjsKPiArICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgbW1hcF9lbmQgPSBhcmNoX2dl
dF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKTsKPiArCj4gKyAgICAgICAvKiByZXF1ZXN0ZWQg
bGVuZ3RoIHRvbyBiaWcgZm9yIGVudGlyZSBhZGRyZXNzIHNwYWNlICovCj4gKyAgICAgICBpZiAo
bGVuID4gbW1hcF9lbmQgLSBtbWFwX21pbl9hZGRyKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsKPiArCj4gKyAgICAgICBpZiAoZmxhZ3MgJiBNQVBfRklYRUQpCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBhZGRyOwo+ICsKPiArICAgICAgIGlmICghYWRkcikKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgYWRkciA9IFBBR0VfQUxJR04oYWRkcik7Cj4g
KyAgICAgICB2bWEgPSBmaW5kX3ZtYV9wcmV2KG1tLCBhZGRyLCAmcHJldik7Cj4gKyAgICAgICBp
ZiAobW1hcF9lbmQgLSBsZW4gPj0gYWRkciAmJiBhZGRyID49IG1tYXBfbWluX2FkZHIgJiYKPiAr
ICAgICAgICAgICAoIXZtYSB8fCBhZGRyICsgbGVuIDw9IHZtX3N0YXJ0X2dhcCh2bWEpKSAmJgo+
ICsgICAgICAgICAgICghcHJldiB8fCBhZGRyID49IHZtX2VuZF9nYXAocHJldikpKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gYWRkcjsKPiArCj4gKyAgICAgICAvKiBGYWxsYmFjayB0byBWQSBz
cGFjZSBzZWFyY2ggKi8KPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICAvKiBHZXQgYW4g
YWRkcmVzcyByYW5nZSB3aGljaCBpcyBjdXJyZW50bHkgdW5tYXBwZWQuCj4gICAqIEZvciBzaG1h
dCgpIHdpdGggYWRkcj0wLgo+ICAgKgo+IEBAIC02MzcsMjUgKzY3OCwxMyBAQCBnZW5lcmljX2dl
dF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCB2bV9mbGFnc190
IHZtX2ZsYWdzKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQt
Pm1tOwo+IC0gICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsICpwcmV2Owo+ICAgICAg
ICAgc3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvID0ge307Cj4gICAgICAgICBjb25z
dCB1bnNpZ25lZCBsb25nIG1tYXBfZW5kID0gYXJjaF9nZXRfbW1hcF9lbmQoYWRkciwgbGVuLCBm
bGFncyk7Cj4KPiAtICAgICAgIGlmIChsZW4gPiBtbWFwX2VuZCAtIG1tYXBfbWluX2FkZHIpCj4g
LSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+IC0KPiAtICAgICAgIGlmIChmbGFncyAm
IE1BUF9GSVhFRCkKPiArICAgICAgIGFkZHIgPSBnZW5lcmljX21tYXBfaGludChmaWxwLCBhZGRy
LCBsZW4sIHBnb2ZmLCBmbGFncyk7Cj4gKyAgICAgICBpZiAoYWRkcikKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIGFkZHI7Cj4KPiAtICAgICAgIGlmIChhZGRyKSB7Cj4gLSAgICAgICAgICAgICAg
IGFkZHIgPSBQQUdFX0FMSUdOKGFkZHIpOwo+IC0gICAgICAgICAgICAgICB2bWEgPSBmaW5kX3Zt
YV9wcmV2KG1tLCBhZGRyLCAmcHJldik7Cj4gLSAgICAgICAgICAgICAgIGlmIChtbWFwX2VuZCAt
IGxlbiA+PSBhZGRyICYmIGFkZHIgPj0gbW1hcF9taW5fYWRkciAmJgo+IC0gICAgICAgICAgICAg
ICAgICAgKCF2bWEgfHwgYWRkciArIGxlbiA8PSB2bV9zdGFydF9nYXAodm1hKSkgJiYKPiAtICAg
ICAgICAgICAgICAgICAgICghcHJldiB8fCBhZGRyID49IHZtX2VuZF9nYXAocHJldikpKQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBhZGRyOwo+IC0gICAgICAgfQo+IC0KPiAgICAg
ICAgIGluZm8ubGVuZ3RoID0gbGVuOwo+ICAgICAgICAgaW5mby5sb3dfbGltaXQgPSBtbS0+bW1h
cF9iYXNlOwo+ICAgICAgICAgaW5mby5oaWdoX2xpbWl0ID0gbW1hcF9lbmQ7Cj4gQEAgLTY4NSwy
NyArNzE0LDE0IEBAIGdlbmVyaWNfZ2V0X3VubWFwcGVkX2FyZWFfdG9wZG93bihzdHJ1Y3QgZmls
ZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGxlbiwgdW5zaWduZWQgbG9uZyBwZ29mZiwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFncywgdm1fZmxhZ3Nf
dCB2bV9mbGFncykKPiAgewo+IC0gICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsICpw
cmV2Owo+ICAgICAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJyZW50LT5tbTsKPiAgICAg
ICAgIHN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8gaW5mbyA9IHt9Owo+ICAgICAgICAgY29u
c3QgdW5zaWduZWQgbG9uZyBtbWFwX2VuZCA9IGFyY2hfZ2V0X21tYXBfZW5kKGFkZHIsIGxlbiwg
ZmxhZ3MpOwo+Cj4gLSAgICAgICAvKiByZXF1ZXN0ZWQgbGVuZ3RoIHRvbyBiaWcgZm9yIGVudGly
ZSBhZGRyZXNzIHNwYWNlICovCj4gLSAgICAgICBpZiAobGVuID4gbW1hcF9lbmQgLSBtbWFwX21p
bl9hZGRyKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiAtCj4gLSAgICAgICBp
ZiAoZmxhZ3MgJiBNQVBfRklYRUQpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBhZGRyOwo+IC0K
PiAgICAgICAgIC8qIHJlcXVlc3RpbmcgYSBzcGVjaWZpYyBhZGRyZXNzICovCj4gLSAgICAgICBp
ZiAoYWRkcikgewo+IC0gICAgICAgICAgICAgICBhZGRyID0gUEFHRV9BTElHTihhZGRyKTsKPiAt
ICAgICAgICAgICAgICAgdm1hID0gZmluZF92bWFfcHJldihtbSwgYWRkciwgJnByZXYpOwo+IC0g
ICAgICAgICAgICAgICBpZiAobW1hcF9lbmQgLSBsZW4gPj0gYWRkciAmJiBhZGRyID49IG1tYXBf
bWluX2FkZHIgJiYKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICghdm1hIHx8IGFk
ZHIgKyBsZW4gPD0gdm1fc3RhcnRfZ2FwKHZtYSkpICYmCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoIXByZXYgfHwgYWRkciA+PSB2bV9lbmRfZ2FwKHByZXYpKSkKPiAtICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gYWRkcjsKPiAtICAgICAgIH0KPiArICAgICAgIGFkZHIg
PSBnZW5lcmljX21tYXBfaGludChmaWxwLCBhZGRyLCBsZW4sIHBnb2ZmLCBmbGFncyk7Cj4gKyAg
ICAgICBpZiAoYWRkcikKPiArICAgICAgICAgICAgICAgcmV0dXJuIGFkZHI7Cj4KPiAgICAgICAg
IGluZm8uZmxhZ3MgPSBWTV9VTk1BUFBFRF9BUkVBX1RPUERPV047Cj4gICAgICAgICBpbmZvLmxl
bmd0aCA9IGxlbjsKPiAtLQo+IDIuNDcuMC4zMzguZzYwY2NhMTU4MTktZ29vZwo+Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJj
IG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
