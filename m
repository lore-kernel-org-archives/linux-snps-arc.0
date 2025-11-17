Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2931CEACEF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Nov 2025 06:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSIzJ4Zgk6IpzKEY8vUZFrqJwmKlWwyxLfZHC26at98=; b=1Mf0SKu3o+naba
	p79WG8gMYvuni7pQPLhVqd0UkNiyKoV2fqSme7TziWcztypZwfFdmawxBPZ4JT2Q10OoLRCeb+13i
	dg7GfROv8ZhxcxPY3YCcGKAepjrNaj2GZ7Bjsx9Ip7Lc7IEWyGZuyVrwoCoRLzwFD77ifxdXklVhi
	T9TagX6NHvXEpZLpdHL+6F/MQvtgu8mdapEWm7DtBb7sKWlzeBBnbGOemkgS5JGbSBY/blZmwMFuw
	Hs3EdeplwOJbIvxqMzZrwofsRJ+rOucOVpyPOzX8BiZLknImXgHx0iNUwXqvZ9IJWC5/xpjr7+o2J
	j7Ve20ikGiadmFWyzt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtBQ-0000000FYVo-2Xsu;
	Mon, 17 Nov 2025 06:57:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtBO-0000000FYUr-27dv
	for linux-snps-arc@lists.infradead.org;
	Mon, 17 Nov 2025 06:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA2A843E80
	for <linux-snps-arc@lists.infradead.org>; Mon, 17 Nov 2025 06:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A830FC4CEF5
	for <linux-snps-arc@lists.infradead.org>; Mon, 17 Nov 2025 06:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763362669;
	bh=QFHJjbWXgZ5FLJu59KKPwWK2r2/tZ86nN8Ql1jm9c1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TgEn9zesgIRCkrmyUN3w5JmDr4gYs1GGuRuGQO48gd4V4EjRN6C5Msq0MIsDUo6Rq
	 2T0q2HNtfFmfieLN040ZdcCSB4+kjAMkf3BfT7kLJM0ij0ZRLTTd0t2LhfRgXhvOTX
	 wUcRiqerY+vy9iUWThAl5jGFg4WLdGNLtkeJfhPgcrg7QanuH9wVDDqgpx+sPiuM4B
	 NP1xZcNj6i/hm/oI70m2A8SVfKRtW2hkYh24UkzuvtIqPyIGW1tt5nLb1JnJbnurn2
	 r3gVqYVpX/Xkq0ye5fGg+mH7BgewPI9K2xfGVaCysRYj+fSoLu6K1b2/YWeOqGRcAp
	 b4D8ocqGafeBw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b739ef3f739so92168966b.1
        for <linux-snps-arc@lists.infradead.org>; Sun, 16 Nov 2025 22:57:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmy+e3Oixekw+KkjcPxRsVI5T6Lb3irWnSDe3fV5DDMGClwufvMDjbxlxFoQ8UZbpX9aQx2K5cGoCBOKOOHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmrRRUk926oJ+39uOLpivNGonXHCTbTSBMktvlxvyAmW4YqrX3
	0ThdVXN4/6+SNjZrZ27fdM73IpK0/jd57w5l4Iu5o0dcwp12/uATkg0IzhPqCeJfAYPdHvthfpS
	zp4V/4Psjjf6tQflZtamiFYi5rqyhWGU=
X-Google-Smtp-Source: AGHT+IGu0YWlJyZo9sBFqmWx/8Hh3O0yFNJjWzg2iDkfq3nhyb14i7bYZtnnHW6QkMeJqt8H8KA79+YcCaKiwhmN4Fo=
X-Received: by 2002:a17:906:6a08:b0:b72:599:5385 with SMTP id
 a640c23a62f3a-b7367bab9e7mr1170101566b.61.1763362668048; Sun, 16 Nov 2025
 22:57:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <146b5a0207052b38d04caac6b20756a61c2189b3.1763117269.git.zhengqi.arch@bytedance.com>
 <CAAhV-H6HL+mXeuLqgo5BOVBB0_GHTUmn7_7NTzdUpLX7NbuQ5w@mail.gmail.com> <8fbeb3e8-7c30-46f6-a0a4-289efbf45ac0@linux.dev>
In-Reply-To: <8fbeb3e8-7c30-46f6-a0a4-289efbf45ac0@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 17 Nov 2025 14:57:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H73vNhjZqsDq0KGJD_PC2LtM39XAG-aZtvE=tphrQ8dJA@mail.gmail.com>
X-Gm-Features: AWmQ_bmXPoa2u3pjJaGT_1E1BSy8DLhNHegRD0EaZ-4w9eHZIwpki4fOuwGYKs4
Message-ID: <CAAhV-H73vNhjZqsDq0KGJD_PC2LtM39XAG-aZtvE=tphrQ8dJA@mail.gmail.com>
Subject: Re: [PATCH 3/7] loongarch: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, 
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org, 
	david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	WANG Xuerui <kernel@xen0n.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_225750_569393_A62D8D06 
X-CRM114-Status: GOOD (  11.07  )
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

T24gTW9uLCBOb3YgMTcsIDIwMjUgYXQgMjo0MuKAr1BNIFFpIFpoZW5nIDxxaS56aGVuZ0BsaW51
eC5kZXY+IHdyb3RlOgo+Cj4gSGkgSHVhY2FpLAo+Cj4gT24gMTEvMTQvMjUgMTA6MTcgUE0sIEh1
YWNhaSBDaGVuIHdyb3RlOgo+ID4gSGksIFFpIFpoZW5nLAo+Cj4gWy4uLl0KPgo+ID4+Cj4gPj4g
LSNkZWZpbmUgX19wbWRfZnJlZV90bGIodGxiLCB4LCBhZGRyKSAgIHBtZF9mcmVlKCh0bGIpLT5t
bSwgeCkKPiA+PiArI2RlZmluZSBfX3BtZF9mcmVlX3RsYih0bGIsIHgsIGFkZHIpICAgXAo+ID4+
ICsgICAgICAgdGxiX3JlbW92ZV9wdGRlc2MoKHRsYiksIHZpcnRfdG9fcHRkZXNjKHgpKQo+ID4g
SSB0aGluayB3ZSBjYW4gZGVmaW5lIGl0IGluIG9uZSBsaW5lLgo+Cj4gRG8gd2UgbmVlZCB0byBj
aGFuZ2UgX19wdGVfZnJlZV90bGIoKSB0byBhIHNpbmdsZS1saW5lIGZvcm1hdAo+IGFzIHdlbGw/
ClllcywgdGhlcmUgaXMgbm8gODAgY29sdW1ucyBsaW1pdCBub3cuCgpIdWFjYWkKCj4KPiBUaGFu
a3MsCj4gUWkKPgo+Cj4gPj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
