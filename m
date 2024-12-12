Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343B8E7717F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Dec 2024 20:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2ogDLz9PaIXzP4115o3oMEPFXGbzZYUubqJNu2AUc4=; b=Iu8rrL6v5e3+WZ
	AvNdWgAH9W9XdSoAViveCX7krRM6dvs95+fjyUQGiCHM1DUkmOIBnGue6CPiaVh58R+sjOG6aEKlb
	GcWFUjCs9egr+wgk/lBN9iOM6N+F8tBT4EknWFRekYluNuDXXmDe35nDDyJIDDCirKNCpBgq4zAwi
	h95M/LaK3/+k6475Zzh8/Nhj+el3pb//vsQ3Zh6SXxzTVcSnjEcnguVPPtPeNfZhB3EZ+NiZyL9hi
	zHcNJ9YZuRaHzA78tu45S6mxAUED91chsSdISUH4dsSqLsdWkPeYI4DEFMQCDL+egEAoXDW2flTYB
	aTssSgsqyKA8379lQK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpaE-00000001lub-437v;
	Thu, 12 Dec 2024 20:14:50 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpXZ-00000001lPm-17yo;
	Thu, 12 Dec 2024 20:12:06 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9ec267b879so86243366b.2;
        Thu, 12 Dec 2024 12:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034324; x=1734639124; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=GSoBkCILe6IhSXn+dxyy4N1n8CG0WuLKYKCnMT/TNXzMxtg0CUJ4a2esF0BFOE+fOa
         dy0ZO3/tyha+ppVjlhFF3+VcwZgYB65bz0Ba7f34atHkU0tK9YasTZy/1cbcd1eHCxTi
         NxUcvS+Ns0fMx9Yr0+VzLOTKEol1+5h2YwrkqeObWufdE+BFMvGgKZ2tor2LcIoZtjeW
         0C0bz1DMv8OtFhRgBywHgMdTjePwTCtrmHr2ymdhJepfhnv+1/n67J/tLxGpzPIZwfWz
         JtMDjyT6BuwF85vVteeLaW3ycI97nsaVagWrncbwf09HmcWpxeLazYypGZ94aWmQ7Arm
         B/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034324; x=1734639124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=aZ82um8WfmCYNsye3wj2tqdAriJNEJ/BVsTA3ZpNc5Zo4pV5ET3W/+3IVpla4s2HG0
         Z9VSQEAO7KnK55NzcYwNyTPHTgAvPRQhQw08D+GLo5BTWTAPKb3J10nY7pZXYfhpO+Wt
         NbUqh1uezGij7W9yzGnmaRoEp8GkxXVE8fvPYKieozZgGFPB01NbthtpoT9kfmqm1BA6
         y7qmIgwkqGVJQj1C5DFz7Km3hU+JgKe87JkpdSISgsVQHuWkhKL3PIIkFzgSzKaI/VOY
         rMaGWHTBoPP/gOWMt0zSFVo/CTFU1HUU8CKrRANwGZEVgm4DgEWxPD4tD+E9W8avrKkn
         37Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUhs/tDIWVXBmXNKogrkRXpHz4cQ6jyKnhw5t2BR3oo1fMmg+GxEZz8GA1y9Rj1rSjfa1Owsm3igSSpYKotTwA=@lists.infradead.org, AJvYcCVj7HGK2TG2JP7BJkY+Thxiz8L2v8cGaRTEbqd9rqPlBzg5OaFdB+k7H46ZRu4GUcDXSpyr5ADeHbxZKFhXAiey@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm3dR7Df3C8MbnpOuChz58Zk3eGCd4xuo3TRxpVe/oaq9YMM3Y
	fYll8Zmo3ZXIuR4zTgEECFT2J8V3JDUFjniLcEisOd0ref1iMWquj5UsPsuDS+rIj1uIweAOW9w
	KjNZhW2VvdNd/3foHFAkMkXNSgTE=
X-Gm-Gg: ASbGnct/0+ZOyrBJsD/x5T5WWtHBMVKiRLh2YkSJoDhjq0wzNqGksByxNikIeIgqHfG
	bY8sJMs1ka6RN1wOSfwzwdYbG/5212Q8pCB6rI7Ne
X-Google-Smtp-Source: AGHT+IF7qx5Z1/fQb+D9Nv/8CkFXoKyEEzLktdUfd+sTUwFi+n5jfhaKRcSctFjQDfGrQzxwJV8DWyyLGWYjEOqOZ4M=
X-Received: by 2002:a17:906:7304:b0:aa6:94c0:f755 with SMTP id
 a640c23a62f3a-aab778c1eaemr4266066b.1.1734034323514; Thu, 12 Dec 2024
 12:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-17-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-17-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:11:51 -0800
Message-ID: <CAHbLzko2Z0-QReXo54H=sd1asXsPKEHf9N4Nmv0=Ry7SM=XX+g@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 16/16] mm: Respect mmap hint before THP
 alignment if allocation is possible
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
X-CRM114-CacheID: sfid-20241212_121205_305304_BAA19039 
X-CRM114-Status: GOOD (  26.97  )
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

T24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMzozMeKAr1BNIEthbGVzaCBTaW5naCA8a2FsZXNoc2lu
Z2hAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBDb21taXQgMjQ5NjA4ZWU0NzEzICgibW06IHJlc3Bl
Y3QgbW1hcCBoaW50IGFkZHJlc3Mgd2hlbiBhbGlnbmluZyBmb3IgVEhQIikKPiBmYWxsc2JhY2sg
dG8gUEFHRV9TSVpFIGFsaWdubWVudCBpbnN0ZWFkIG9mIFRIUCBhbGlnbm1lbnQKPiBmb3IgYW5v
bnltb3VzIG1hcHBpbmcgYXMgbG9uZyBhcyBhIGhpbnQgYWRkcmVzcyBpcyBwcm92aWRlZCBieSB0
aGUgdXNlcgo+IC0tIGV2ZW4gaWYgd2Ugd2VyZW4ndCBhYmxlIHRvIGFsbG9jYXRlIHRoZSB1bm1h
cHBlZCBhcmVhIGF0IHRoZSBoaW50Cj4gYWRkcmVzcyBpbiB0aGUgZW5kLgo+Cj4gVGhpcyB3YXMg
ZG9uZSB0byBhZGRyZXNzIHRoZSBpbW1lZGlhdGUgcmVncmVzc2lvbiBpbiBhbm9ueW1vdXMgbWFw
cGluZ3MKPiB3aGVyZSB0aGUgaGludCBhZGRyZXNzIHdlcmUgYmVpbmcgaWdub3JlZCBpbiBzb21l
IGNhc2VzOyBkdWUgdG8gY29tbWl0Cj4gZWZhN2RmM2UzYmI1ICgibW06IGFsaWduIGxhcmdlciBh
bm9ueW1vdXMgbWFwcGluZ3Mgb24gVEhQIGJvdW5kYXJpZXMiKS4KPgo+IEl0IHdhcyBsYXRlciBw
b2ludGVkIG91dCB0aGF0IHRoaXMgaXNzdWUgYWxzbyBleGlzdGVkIGZvciBmaWxlLWJhY2tlZAo+
IG1hcHBpbmdzIGZyb20gZmlsZSBzeXN0ZW1zIHRoYXQgdXNlIHRocF9nZXRfdW5tYXBwZWRfYXJl
YSgpIGZvciB0aGVpcgo+IC5nZXRfdW5tYXBwZWRfYXJlYSgpIGZpbGUgb3BlcmF0aW9uLgo+Cj4g
VGhlIHNhbWUgZml4IHdhcyBub3QgYXBwbGllZCBmb3IgZmlsZS1iYWNrZWQgbWFwcGluZ3Mgc2lu
Y2UgaXQgd291bGQKPiBtZWFuIGFueSBtbWFwIHJlcXVlc3RzIHRoYXQgcHJvdmlkZSBhIGhpbnQg
YWRkcmVzcyB3b3VsZCBiZSBvbmx5Cj4gUEFHRV9TSVpFLWFsaWduZWQgcmVnYXJkbGVzcyBvZiB3
aGV0aGVyIGFsbG9jYXRpb24gd2FzIHN1Y2Nlc3NmdWwgYXQKPiB0aGUgaGludCBhZGRyZXNzIG9y
IG5vdC4KPgo+IEluc3RlYWQsIHVzZSBhcmNoX21tYXBfaGludCgpIHRvIGZpcnN0IGF0dGVtcHQg
YWxsb2NhdGlvbiBhdCB0aGUgaGludAo+IGFkZHJlc3MgYW5kIGZhbGxiYWNrIHRvIFRIUCBhbGln
bm1lbnQgaWYgdGhlcmUgaXNuJ3Qgc3VmZmljaWVudCBWQSBzcGFjZQo+IHRvIHNhdGlzZnkgdGhl
IGFsbG9jYXRpb24gYXQgdGhlIGhpbnQgYWRkcmVzcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEthbGVz
aCBTaW5naCA8a2FsZXNoc2luZ2hAZ29vZ2xlLmNvbT4KClJldmlld2VkLWJ5OiBZYW5nIFNoaSA8
c2h5ODI4MzAxQGdtYWlsLmNvbT4KCj4gLS0tCj4gIG1tL2h1Z2VfbWVtb3J5LmMgfCAxNyArKysr
KysrKysrLS0tLS0tLQo+ICBtbS9tbWFwLmMgICAgICAgIHwgIDEgLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbW0v
aHVnZV9tZW1vcnkuYyBiL21tL2h1Z2VfbWVtb3J5LmMKPiBpbmRleCAyZGE1NTIwYmZlMjQuLjQy
Njc2MWEzMGFmZiAxMDA2NDQKPiAtLS0gYS9tbS9odWdlX21lbW9yeS5jCj4gKysrIGIvbW0vaHVn
ZV9tZW1vcnkuYwo+IEBAIC0xMDk3LDYgKzEwOTcsMTYgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
X190aHBfZ2V0X3VubWFwcGVkX2FyZWEoc3RydWN0IGZpbGUgKmZpbHAsCj4gICAgICAgICBsb2Zm
X3Qgb2ZmX2FsaWduID0gcm91bmRfdXAob2ZmLCBzaXplKTsKPiAgICAgICAgIHVuc2lnbmVkIGxv
bmcgbGVuX3BhZCwgcmV0LCBvZmZfc3ViOwo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogSWYg
YWxsb2NhdGlvbiBhdCB0aGUgYWRkcmVzcyBoaW50IHN1Y2NlZWRzOyByZXNwZWN0IHRoZSBoaW50
IGFuZAo+ICsgICAgICAgICogZG9uJ3QgdHJ5IHRvIGFsaWduIHRvIFRIUCBib3VuZGFyeTsKPiAr
ICAgICAgICAqCj4gKyAgICAgICAgKiBPciBpZiBhbiB0aGUgcmVxdWVzdGVkIGV4dGVudCBpcyBp
bnZhbGlkIHJldHVybiB0aGUgZXJyb3IgaW1tZWRpYXRlbHkuCj4gKyAgICAgICAgKi8KPiArICAg
ICAgIGFkZHIgPSBhcmNoX21tYXBfaGludChmaWxwLCBhZGRyLCBsZW4sIG9mZiwgZmxhZ3MpOwo+
ICsgICAgICAgaWYgKGFkZHIpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBhZGRyOwo+ICsKPiAg
ICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpIHx8IGluX2NvbXBhdF9zeXNjYWxs
KCkpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gQEAgLTExMTcsMTMgKzExMjcsNiBA
QCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX3RocF9nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmls
ZSAqZmlscCwKPiAgICAgICAgIGlmIChJU19FUlJfVkFMVUUocmV0KSkKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBEbyBub3QgdHJ5IHRvIGFs
aWduIHRvIFRIUCBib3VuZGFyeSBpZiBhbGxvY2F0aW9uIGF0IHRoZSBhZGRyZXNzCj4gLSAgICAg
ICAgKiBoaW50IHN1Y2NlZWRzLgo+IC0gICAgICAgICovCj4gLSAgICAgICBpZiAocmV0ID09IGFk
ZHIpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBhZGRyOwo+IC0KPiAgICAgICAgIG9mZl9zdWIg
PSAob2ZmIC0gcmV0KSAmIChzaXplIC0gMSk7Cj4KPiAgICAgICAgIGlmICh0ZXN0X2JpdChNTUZf
VE9QRE9XTiwgJmN1cnJlbnQtPm1tLT5mbGFncykgJiYgIW9mZl9zdWIpCj4gZGlmZiAtLWdpdCBh
L21tL21tYXAuYyBiL21tL21tYXAuYwo+IGluZGV4IDc2ZGQ2YWNkZjA1MS4uMzI4NmZkZmYyNmYy
IDEwMDY0NAo+IC0tLSBhL21tL21tYXAuYwo+ICsrKyBiL21tL21tYXAuYwo+IEBAIC04MTQsNyAr
ODE0LDYgQEAgX19nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQg
bG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGxlbiwKPiAgICAgICAgIGlmIChnZXRfYXJlYSkgewo+
ICAgICAgICAgICAgICAgICBhZGRyID0gZ2V0X2FyZWEoZmlsZSwgYWRkciwgbGVuLCBwZ29mZiwg
ZmxhZ3MpOwo+ICAgICAgICAgfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19UUkFOU1BBUkVO
VF9IVUdFUEFHRSkgJiYgIWZpbGUKPiAtICAgICAgICAgICAgICAgICAgJiYgIWFkZHIgLyogbm8g
aGludCAqLwo+ICAgICAgICAgICAgICAgICAgICAmJiBJU19BTElHTkVEKGxlbiwgUE1EX1NJWkUp
KSB7Cj4gICAgICAgICAgICAgICAgIC8qIEVuc3VyZXMgdGhhdCBsYXJnZXIgYW5vbnltb3VzIG1h
cHBpbmdzIGFyZSBUSFAgYWxpZ25lZC4gKi8KPiAgICAgICAgICAgICAgICAgYWRkciA9IHRocF9n
ZXRfdW5tYXBwZWRfYXJlYV92bWZsYWdzKGZpbGUsIGFkZHIsIGxlbiwKPiAtLQo+IDIuNDcuMC4z
MzguZzYwY2NhMTU4MTktZ29vZwo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
