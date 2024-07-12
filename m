Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6285FC3DA4A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 Jul 2024 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wbd+UfW8VJLPPA51lZX2Khk0fhfNB/wEtp/Zcap+tVU=; b=dQVTVhn6UWyo1H
	5/V5F3oWUVru4j7XOCMkO8lO9/n2lTegDtCpuVyxCtjbvmQF3pJiNLBpCAq+UzMjoJDxwT0wAMCJT
	gQWW5D584ixbUY9DAG9x5FIz/K1U7QiW8B2WQcQArJ9bF4I9yH0YycNM9Nv+EQiEWTMSn3gOpRqnD
	k+vDkRpwiEQ0DCpdO+71/tTbixB0MZXMecf3qouZGDwOmCBW0bWx+XyMiCAIwA+NrnIoQhhvy71PN
	AdXw/38IjvUTNA1Oglehx5RIFId2Qwf57bIfQtUXQwXTyoVKOGMbq5MeHXcZruCZ1cyRgJuWPEawu
	kpmx+rajVkAvoLAAp+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBnP-0000000GvQ8-0HoF;
	Fri, 12 Jul 2024 08:38:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBn5-0000000GvK9-05El;
	Fri, 12 Jul 2024 08:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5EF6DCE1318;
	Fri, 12 Jul 2024 08:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F13C4AF07;
	Fri, 12 Jul 2024 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720773484;
	bh=X4sxkxfa0puHMD2lnMvIKYZ5jErEYw2uVCAwMxYRmSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NeuMLK5BqZhyYqbUqCIhCYiuR1Fg4SN7BFy8Akyzo5Pg9sZWlMzvJ8OOucNGvv+92
	 xGozI39ExmRKrL3F/ZTC/B04hFUq/GO3hTSt5RyXnaVb8ImoIXNHOT6pQfqwS6IfC/
	 K/2XpVWEUeOadxiZ7F1uRun+NSZsiYE55vTGtJ4aa9hJmaGsl6+f3woxXY1hVCKVQn
	 T1YqwtiEvHjnJqC3Fi6SMhFaQCXeexCLjoASMBFEjvZuTKmYEo9wBQtyrk5RcF9HzA
	 9/0OMdjPyTTvbRSMopQD/W+K07o/MkwUQDrLTkVHXaQbAIQwJZV273OUlm8Xh8IBTB
	 7stqWX6zwD3QA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ee90f56e02so18763911fa.2;
        Fri, 12 Jul 2024 01:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcXyW/mM5OtlSBzzBrp3EN9vqCXQTsm7dNe4YRF9Ligm2ZAOZsz5NUKr5dm1g6yuT+mW2LTisGlSjSGD6ZdsA90Pot21G37U03oGGts27fesZhycUdFGTFwaBu/7PbMq/lkcJ2Fq1H2NWGIGGVNgrM13xLF/BU/xNIKzfwx0MVzd5DXDyBCQwbwO0MZrhwAW14rlqReekE6WE=
X-Gm-Message-State: AOJu0YxTG6zOwN8t56PC6BtIi42dqwl02gNnUYDnt87+tP4bMocyfyV5
	jqZN8yIVBrukpGaB6B1EAtWEvBNysKjCNHEScYjwH8ns6RsNYmSgd+mLSzzV0xOWS6enZ7EVyTZ
	6x865D2Ftn2+qWvDfc3N+BdkigJo=
X-Google-Smtp-Source: AGHT+IFfkbTH0GPwVyglXJ2Er1yvq7AU75kSwOPof9lxDJA6WZS/bfYrYyjHckbhe1dyXepshm4Uwstcj4sDcu5PIlo=
X-Received: by 2002:a2e:95c6:0:b0:2ee:97b4:8028 with SMTP id
 38308e7fff4ca-2eeb30fd369mr67338551fa.31.1720773483308; Fri, 12 Jul 2024
 01:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-4-arnd@kernel.org>
In-Reply-To: <20240704143611.2979589-4-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 12 Jul 2024 17:37:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=h6dML-06ox1dje_bxF2+R-Gq7Yw-s73Vi-FW39L9eg@mail.gmail.com>
Message-ID: <CAK7LNAS=h6dML-06ox1dje_bxF2+R-Gq7Yw-s73Vi-FW39L9eg@mail.gmail.com>
Subject: Re: [PATCH 03/17] um: don't generate asm/bpf_perf_event.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Christian Brauner <brauner@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_013807_508729_58DD3A10 
X-CRM114-Status: GOOD (  21.68  )
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

T24gVGh1LCBKdWwgNCwgMjAyNCBhdCAxMTozN+KAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4gSWYgd2Ugc3RhcnQgdmFsaWRhdGluZyB0aGUgZXhpc3RlbmNlIG9mIHRoZSBhc20tZ2VuZXJp
YyBzaWRlIG9mCj4gZ2VuZXJhdGVkIGhlYWRlcnMsIHRoaXMgb25lIGNhdXNlcyBhIHdhcm5pbmc6
Cj4KPiBtYWtlWzNdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnYXJjaC91bS9pbmNsdWRl
L2dlbmVyYXRlZC9hc20vYnBmX3BlcmZfZXZlbnQuaCcsIG5lZWRlZCBieSAnYWxsJy4gIFN0b3Au
Cj4KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBhc20tZ2VuZXJpYyBoZWFkZXIgb25seSBleGlz
dHMgZm9yIHRoZSB1YXBpCj4gdmFyaWFudCwgYnV0IGFyY2gvdW0gaGFzIG5vIHVhcGkgaGVhZGVy
cyBhbmQgaW5zdGVhZCB1c2VzIHRoZSB4ODYKPiB1c2Vyc3BhY2UgQVBJLgo+Cj4gQWRkIGEgY3Vz
dG9tIGZpbGUgd2l0aCBhbiBleHBsaWNpdCByZWRpcmVjdCB0byBhdm9pZCB0aGlzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgYXJjaC91
bS9pbmNsdWRlL2FzbS9LYnVpbGQgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvdW0vaW5jbHVkZS9h
c20vYnBmX3BlcmZfZXZlbnQuaCB8IDMgKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3VtL2luY2x1
ZGUvYXNtL2JwZl9wZXJmX2V2ZW50LmgKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3VtL2luY2x1ZGUv
YXNtL0tidWlsZCBiL2FyY2gvdW0vaW5jbHVkZS9hc20vS2J1aWxkCj4gaW5kZXggNmZlMzQ3Nzky
OTFhLi42YzU4MzA0MDUzN2MgMTAwNjQ0Cj4gLS0tIGEvYXJjaC91bS9pbmNsdWRlL2FzbS9LYnVp
bGQKPiArKysgYi9hcmNoL3VtL2luY2x1ZGUvYXNtL0tidWlsZAo+IEBAIC0xLDUgKzEsNCBAQAo+
ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gLWdlbmVyaWMteSArPSBicGZf
cGVyZl9ldmVudC5oCj4gIGdlbmVyaWMteSArPSBidWcuaAo+ICBnZW5lcmljLXkgKz0gY29tcGF0
LmgKPiAgZ2VuZXJpYy15ICs9IGN1cnJlbnQuaAo+IGRpZmYgLS1naXQgYS9hcmNoL3VtL2luY2x1
ZGUvYXNtL2JwZl9wZXJmX2V2ZW50LmggYi9hcmNoL3VtL2luY2x1ZGUvYXNtL2JwZl9wZXJmX2V2
ZW50LmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGEzMDQy
MGM4M2RlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvdW0vaW5jbHVkZS9hc20vYnBmX3Bl
cmZfZXZlbnQuaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCAqLwo+ICsKPiArI2luY2x1ZGUgPGFzbS1nZW5lcmljL2JwZl9wZXJmX2V2ZW50
Lmg+Cj4gLS0KPiAyLjM5LjIKPgoKCkkgZ3Vlc3MgdGhpcyBpcyBhIHN0ZXAgYmFja3dhcmQuCgpU
ZWNobmljYWxseSwga2VybmVsLXNwYWNlIGFzbS8qLmggZmlsZXMgYXJlIGFsbG93ZWQgdG8Kd3Jh
cCBVQVBJIDxhc20tZ2VuZXJpYy8qLmg+LgpUaGVyZSBpcyBubyByZWFzb24gd2h5IHdlIGJhbiBn
ZW5lcmljLXkgZm9yIGRvaW5nIHRoaXMsCndoZXJlYXMgY2hlY2staW4gc291cmNlIGlzIGFsbG93
ZWQuCgoKCgotLQpCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
