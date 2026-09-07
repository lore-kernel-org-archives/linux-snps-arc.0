Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76AAC79F9E
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2026 21:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Yyknk4gwvj3U6MX40fwdSqsLKL1Y4DkETCZ6lhlcGs=; b=d7OOIN0oIqU42V
	EeKu7zS89DX+0OTed9sJsTIdLbeRXSNXRbHbHO5d3P2xfnHalAIDlFuD4HhEydrAXwXcoNn5rPUba
	bgj3teehaPLNM8ntlDCVwme7b20azFTr0e6sOb4yyhEd1ib7cevZIjDTVYn8x1ruBOzBZaOQ4TXho
	57ZugjgnMC5VB4HlxZA6YG6peXI9QmNOgcBo3mypQUpHAF5upe2Xz4rozNiRqy4aljodtzjP6q0Tj
	F8j5XVe/fwuXTZsfrkaNfkMkIXsRQNHdJ27VECvmRnS1/w2Na4kzkLFb6ru+3pwErco/SYxmURoqh
	nkvKAi8RnRGhmmPmYayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gZG-00000007k8J-1EZf;
	Mon, 07 Sep 2026 21:07:54 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gZD-00000007k7T-1Pww
	for linux-snps-arc@lists.infradead.org;
	Mon, 07 Sep 2026 21:07:52 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-5306706e89dso455601cf.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 07 Sep 2026 14:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788815270; cv=none;
        d=google.com; s=arc-20260327;
        b=TiB9Jp3N8nxLv6x6XgEu341zWHuz2ndZFWNX2viK81WIehs0FDnBFx5yPgFL0nEuDZ
         rcZAjKl22mvUARadt5BrS3FO7iOxpzzDsaSNVsguimC/yDIOCJ86CPxPiM/hFH/AystI
         jHKphvGrRQMPHDD8C6FLpPsr3XHBhvJOGC2JX8yzxMJAZObgQC8oJve2bHJ905B4ztzc
         Y+N//+wgaQaSm6rFSFLcKAGzJsYS/sRUBxElm38XbiKktzoHEd0uB/BjG7x+TevY3N0z
         f1kWUoWIim599ngZ++bHncYACZPp5qYr2rjcGgT+ZmmUdJgoTeutXR+94xEIyJs29qRM
         fPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j33dWXa87ubHe2rcHlgmZCfdvDttwcXovkMGxt/Pcfc=;
        fh=5wDonNwAuf/U6zL8Qt0ZVlyP2I2Jy4XzjPfiEM9MoKc=;
        b=WrsjUT9r+hRgP3REn7gVFutT6+x7A0Lj7G8WGLKW9T8XwNx6k1kSjYg/msnVlbB59m
         VRYpIAsRKxxMGu83LPsTm0gqAQq2qh2zU484mlRZv9wICqoIIAWYZtPNwI8G8jGg/g6Y
         kT1WbNPrRlFyLfiVLKgyMqXXw1OBEp3OBdDgTBbFgEc4GIkS2U3HR7H+Q3fj0+QS951b
         5LXIhWT163cNgdwGQ1USPReJ06NpB1H3N+y19F5sooBudKCV88JJxax62S1aFX6fP/6Y
         Eihgj/H/0hUezAEcI13JGGZiXDxvXjnyYJ5lATwFaatUM/8wDzqIRpR/WoufTVPlGWM5
         lDBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788815270; x=1789420070; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j33dWXa87ubHe2rcHlgmZCfdvDttwcXovkMGxt/Pcfc=;
        b=cmWmmrKa2bvxTCU6WuncUXulYkKA9y79FlS/zBt9voG8tqwuBfoCx9Dimp9gje1zP5
         TnTtrTGeGRKoDpSCi3GvESNPOGucARiaREXyAWGPxTriFSfXHGTpYVBAzEaBsCLIwNZd
         4ZxShZV2kxD7hin3nkg2uM+VNSGHMT5RFQ1FW/abINzehMAIuqZN+KY0n6IayXC+L2VU
         a1KuPj3Zmh1cjvdx+O3X+3AtlpafgoO3F+VIAj6LowTxX+YE9m1/ZAIuGyzQGzmWWffk
         ZwYa+3TdDnTMoXvYFUFJ6BzjOLkMBiCgPFjRPSacDoKmCoj12Dc3jnHNrH+0cf9XpVFr
         RIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788815270; x=1789420070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j33dWXa87ubHe2rcHlgmZCfdvDttwcXovkMGxt/Pcfc=;
        b=VzK/zwqVmBj10b44HNSYQoubCNsw3eQ5Zoz0QrF2Fx/6Nak8AVf2PfisTD3j6rl8ua
         Sqb7MZ+Ke41UPs7uRtKt7506z1TSHCb5gj8ahmTl6ZCZ9KRxCrt2VGyWAFbVyxtE3UPo
         xTEsSs0Eg6L5D6WwR/HI7rfJ+0wPzmm7FGWVZF8QyBjPr3QYmE4/n1TE9I1lG88gQ/+Q
         pZQmVyVWG4ygjvCQcryu+LQk9dOrFrlnsxLrjossVLdgCxX2qRYHofCVjbTgvk0VKq8a
         HxQn1ySiO4kEd/uhmIxRa7qaEVC0vVgYeXdpNTebtAVPGytgQ7QQUtjb8lNdAm322t/i
         wxwg==
X-Forwarded-Encrypted: i=1; AKwUvBzkbQh/MJysEj7Lz55mtL4F0cAqvSwbtB5Q3REh6ZuDCzBSmawuLRHqEQ4UBQzWD5SNUrYtUS6CJixoRQTYMw==@lists.infradead.org
X-Gm-Message-State: AFuF++ldW2+1yMzZgxm1IuVTlUq6bHvSnUEwhGejGaGPIUpTdUcGgU3c
	xq6zz1o1RjblOJ9y7XFN1D5eslM5hC6P3l/H2OrbU1pbSPsCQzs1m4BAy108MsWIyqBhi9Saxmk
	FPkQQd3eFvVUFSezzGQJ8ce/4kDmkgNzEsZ9ypjwG
X-Gm-Gg: AYBFou2RoIqoeeVdZzcXs30jEcpVq1iTGic5YS6tvEH8qBW8DoeE1J5klzeEbcIJJ4e
	HfFlH9jHV9K2akJnzP83LvJ6JOouUprgNBYTEwUdyU9P3uy3z8EJiFuT2l3gADhCkWWEkbbDrmo
	5qrHoo7E3omX7QafI3ZnHF5aDmxcSWskFUBfoiz3ag6tyys/xXxY+WouZndZeiXfCH9ZTFN3UCl
	cROGKAStaruHJTqVSLZ4daaizUAYnDkclsZY3VBlVhev/Lom7Qi5Q+qB4UWJ1HbrI4rk9DEzIg2
	sSPjWUz/OpNInICl17lr80RvRMAWtSmmw+hqB0ugEuk=
X-Received: by 2002:a05:622a:2589:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-53065d7943emr35669061cf.4.1788815269129; Mon, 07 Sep 2026
 14:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org> <20260901-rcu-pagetable-freeing-v1-5-5456a81c8212@kernel.org>
In-Reply-To: <20260901-rcu-pagetable-freeing-v1-5-5456a81c8212@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 7 Sep 2026 14:07:37 -0700
X-Gm-Features: AcwNN1U8TkUrFVP6EqWbmqC7u-eOkQZui9u0urXe4uY9QHhCrt9ILjWVeJ-SJWo
Message-ID: <CAJuCfpESe_BXihJh-8FhjQVKzsSpnS4zdMgg3e59byJTc8QViA@mail.gmail.com>
Subject: Re: [PATCH 05/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for arc,
 microblaze, xtensa
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_140751_406520_0215BC0E 
X-CRM114-Status: GOOD (  26.33  )
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

T24gVHVlLCBTZXAgMSwgMjAyNiBhdCA0OjA24oCvQU0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBFYWNoIG9mIHRoZXNlIGFyY2hpdGVjdHVyZXMgZGly
ZWN0bHkgZnJlZSBwYWdlIHRhYmxlcyB3aXRob3V0IHJvdXRpbmcgdGhlc2UKPiBjaGFuZ2VzIHRo
cm91Z2ggdGxiX3JlbW92ZV9wdGRlc2MoKS4KPgo+IFRoZSB1c2Ugb2YgdGxiX3JlbW92ZV9wdGRl
c2MoKSBpcyByZXF1aXJlZCBmb3IKPiBDT05GSUdfTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSB0
byBjb3JyZWN0bHkgZnJlZSBwYWdlIHRhYmxlcyB1bmRlciBSQ1UsCj4gc28gc2ltcGx5IHVwZGF0
ZSB0aGVzZSBhcmNoaXRlY3R1cmVzIHRvIHVzZSB0aGVzZSBmdW5jdGlvbnMuCj4KPiBTaW5jZSBu
b25lIG9mIHRoZSBhcmNoaXRlY3R1cmVzIHNoYXJlIHBhZ2UgdGFibGVzIG9yIGRvIGFueXRoaW5n
IHVudXN1YWwsCj4gbm90aGluZyBjb21wbGljYXRlZCBpcyByZXF1aXJlZCBoZXJlLgo+Cj4gVGhl
cmVmb3JlIHRoaXMgaXMgc2ltcGx5IGEgbWVjaGFuaWNhbCBjaGFuZ2UgLSBjb252ZXJ0IF9fcHVk
X2ZyZWVfdGxiKCksCj4gX19wbWRfZnJlZV90bGIoKSBhbmQgX19wdGVfZnJlZV90bGIoKSB0byB1
c2UgdGxiX3JlbW92ZV9wdGRlc2MoKSBhcwo+IHJlcXVpcmVkLgo+Cj4gQXQgdGhlIHBvaW50IHRo
aXMgaXMgaW4gcGxhY2UsIGFsbCBtbXVfZ2F0aGVyIHBhZ2UgdGFibGUgZnJlZWluZyBpcwo+IHBl
cmZvcm1lZCB1bmRlciBSQ1UsIGFuZCB0aHVzIE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgaXMg
c2VsZWN0ZWQgZm9yCj4gZWFjaCBhcmNoaXRlY3R1cmUuCj4KPiBUaGlzIGZvcm1zIHBhcnQgb2Yg
YW4gb3ZlcmFsbCBlZmZvcnQgdG8gc3dpdGNoIGV2ZXJ5IGFyY2hpdGVjdHVyZSB0byB0aGlzCj4g
bW9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5l
bC5vcmc+Cj4gLS0tCj4gIGFyY2gvYXJjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAx
ICsKPiAgYXJjaC9hcmMvaW5jbHVkZS9hc20vcGdhbGxvYy5oICAgICAgICB8IDYgKysrLS0tCj4g
IGFyY2gvbWljcm9ibGF6ZS9LY29uZmlnICAgICAgICAgICAgICAgfCAxICsKPiAgYXJjaC9taWNy
b2JsYXplL2luY2x1ZGUvYXNtL3BnYWxsb2MuaCB8IDIgKy0KPiAgYXJjaC94dGVuc2EvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS90bGIu
aCAgICAgICAgIHwgMiArLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FyYy9LY29uZmlnIGIvYXJjaC9hcmMv
S2NvbmZpZwo+IGluZGV4IDJlZDcxODZjODFjNS4uN2E3NTQyYjYxODIzIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJjL0tjb25maWcKPiArKysgYi9hcmNoL2FyYy9LY29uZmlnCj4gQEAgLTQ3LDYgKzQ3
LDcgQEAgY29uZmlnIEFSQwo+ICAgICAgICAgc2VsZWN0IEhBVkVfU1lTQ0FMTF9UUkFDRVBPSU5U
Uwo+ICAgICAgICAgc2VsZWN0IElSUV9ET01BSU4KPiAgICAgICAgIHNlbGVjdCBMT0NLX01NX0FO
RF9GSU5EX1ZNQQo+ICsgICAgICAgc2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUKPiAg
ICAgICAgIHNlbGVjdCBNT0RVTEVTX1VTRV9FTEZfUkVMQQo+ICAgICAgICAgc2VsZWN0IE9GCj4g
ICAgICAgICBzZWxlY3QgT0ZfRUFSTFlfRkxBVFRSRUUKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmMv
aW5jbHVkZS9hc20vcGdhbGxvYy5oIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4g
aW5kZXggZGZhZTA3MGZlOGQ1Li45YjZjMzdmOTJlOTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcmMv
aW5jbHVkZS9hc20vcGdhbGxvYy5oCj4gKysrIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vcGdhbGxv
Yy5oCj4gQEAgLTcyLDcgKzcyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHA0ZF9wb3B1bGF0ZShz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgcDRkX3QgKnA0ZHAsIHB1ZF90ICpwdWRwKQo+ICAgICAgICAg
c2V0X3A0ZChwNGRwLCBfX3A0ZCgodW5zaWduZWQgbG9uZylwdWRwKSk7Cj4gIH0KPgo+IC0jZGVm
aW5lIF9fcHVkX2ZyZWVfdGxiKHRsYiwgcG1kLCBhZGRyKSAgcHVkX2ZyZWUoKHRsYiktPm1tLCBw
bWQpCj4gKyNkZWZpbmUgX19wdWRfZnJlZV90bGIodGxiLCBwbWQsIGFkZHIpICB0bGJfcmVtb3Zl
X3B0ZGVzYygodGxiKSwgdmlydF90b19wdGRlc2MocG1kKSkKPgo+ICAjZW5kaWYKPgo+IEBAIC04
MywxMCArODMsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHB1ZF9wb3B1bGF0ZShzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgcHVkX3QgKnB1ZHAsIHBtZF90ICpwbWRwKQo+ICAgICAgICAgc2V0X3B1ZChw
dWRwLCBfX3B1ZCgodW5zaWduZWQgbG9uZylwbWRwKSk7Cj4gIH0KPgo+IC0jZGVmaW5lIF9fcG1k
X2ZyZWVfdGxiKHRsYiwgcG1kLCBhZGRyKSAgcG1kX2ZyZWUoKHRsYiktPm1tLCBwbWQpCj4gKyNk
ZWZpbmUgX19wbWRfZnJlZV90bGIodGxiLCBwbWQsIGFkZHIpICB0bGJfcmVtb3ZlX3B0ZGVzYygo
dGxiKSwgdmlydF90b19wdGRlc2MocG1kKSkKPgo+ICAjZW5kaWYKPgo+IC0jZGVmaW5lIF9fcHRl
X2ZyZWVfdGxiKHRsYiwgcHRlLCBhZGRyKSAgcHRlX2ZyZWUoKHRsYiktPm1tLCBwdGUpCj4gKyNk
ZWZpbmUgX19wdGVfZnJlZV90bGIodGxiLCBwdGUsIGFkZHIpICB0bGJfcmVtb3ZlX3B0ZGVzYygo
dGxiKSwgcGFnZV9wdGRlc2MocHRlKSkKPgo+ICAjZW5kaWYgLyogX0FTTV9BUkNfUEdBTExPQ19I
ICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWljcm9ibGF6ZS9LY29uZmlnIGIvYXJjaC9taWNyb2Js
YXplL0tjb25maWcKPiBpbmRleCA0ODRlYmIzYmFlZGYuLmFmN2U4MjFlOTZjMSAxMDA2NDQKPiAt
LS0gYS9hcmNoL21pY3JvYmxhemUvS2NvbmZpZwo+ICsrKyBiL2FyY2gvbWljcm9ibGF6ZS9LY29u
ZmlnCj4gQEAgLTQxLDYgKzQxLDcgQEAgY29uZmlnIE1JQ1JPQkxBWkUKPiAgICAgICAgIHNlbGVj
dCBQQ0lfU1lTQ0FMTCBpZiBQQ0kKPiAgICAgICAgIHNlbGVjdCBDUFVfTk9fRUZGSUNJRU5UX0ZG
Uwo+ICAgICAgICAgc2VsZWN0IE1NVV9HQVRIRVJfTk9fUkFOR0UKPiArICAgICAgIHNlbGVjdCBN
TVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFCj4gICAgICAgICBzZWxlY3QgU1BBUlNFX0lSUQo+ICAg
ICAgICAgc2VsZWN0IFpPTkVfRE1BCj4gICAgICAgICBzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQ
UE9SVAo+IGRpZmYgLS1naXQgYS9hcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vcGdhbGxvYy5o
IGIvYXJjaC9taWNyb2JsYXplL2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+IGluZGV4IDA4NGE4YTBk
YzIzOS4uZmZlZTZhMDA5MjE5IDEwMDY0NAo+IC0tLSBhL2FyY2gvbWljcm9ibGF6ZS9pbmNsdWRl
L2FzbS9wZ2FsbG9jLmgKPiArKysgYi9hcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vcGdhbGxv
Yy5oCj4gQEAgLTI1LDcgKzI1LDcgQEAgZXh0ZXJuIHZvaWQgX19iYWRfcHRlKHBtZF90ICpwbWQp
Owo+Cj4gIGV4dGVybiBwdGVfdCAqcHRlX2FsbG9jX29uZV9rZXJuZWwoc3RydWN0IG1tX3N0cnVj
dCAqbW0pOwo+Cj4gLSNkZWZpbmUgX19wdGVfZnJlZV90bGIodGxiLCBwdGUsIGFkZHIpIHB0ZV9m
cmVlKCh0bGIpLT5tbSwgKHB0ZSkpCj4gKyNkZWZpbmUgX19wdGVfZnJlZV90bGIodGxiLCBwdGUs
IGFkZHIpIHRsYl9yZW1vdmVfcHRkZXNjKCh0bGIpLCBwYWdlX3B0ZGVzYyhwdGUpKQo+Cj4gICNk
ZWZpbmUgcG1kX3BvcHVsYXRlKG1tLCBwbWQsIHB0ZSkgXAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIChwbWRfdmFsKCoocG1kKSkgPSAodW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3MocHRlKSkK
PiBkaWZmIC0tZ2l0IGEvYXJjaC94dGVuc2EvS2NvbmZpZyBiL2FyY2gveHRlbnNhL0tjb25maWcK
PiBpbmRleCBmMmY5Y2Q5Y2RlNTAuLjMzYzRjYWVlMzBlMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3h0
ZW5zYS9LY29uZmlnCj4gKysrIGIvYXJjaC94dGVuc2EvS2NvbmZpZwo+IEBAIC01NSw2ICs1NSw3
IEBAIGNvbmZpZyBYVEVOU0EKPiAgICAgICAgIHNlbGVjdCBIQVZFX1ZJUlRfQ1BVX0FDQ09VTlRJ
TkdfR0VOCj4gICAgICAgICBzZWxlY3QgSVJRX0RPTUFJTgo+ICAgICAgICAgc2VsZWN0IExPQ0tf
TU1fQU5EX0ZJTkRfVk1BCj4gKyAgICAgICBzZWxlY3QgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJF
RSBpZiBNTVUKCkFuZCBNTVUgaXMgcmVxdWlyZWQgYmVjYXVzZSBOT01NVSBkb2VzIG5vdCBwZXJm
b3JtIG1tdV9nYXRoZXIKb3BlcmF0aW9ucywgc2FtZSBhcyBpbiB0aGUgcHJldmlvdXMgcGF0Y2g/
IElmIHNvLCBtYXliZSBtYWtlIGEgbm90ZSBvZgppdCBpbiB0aGUgY2hhbmdlbG9nPwoKPiAgICAg
ICAgIHNlbGVjdCBNT0RVTEVTX1VTRV9FTEZfUkVMQQo+ICAgICAgICAgc2VsZWN0IFBFUkZfVVNF
X1ZNQUxMT0MKPiAgICAgICAgIHNlbGVjdCBUUkFDRV9JUlFGTEFHU19TVVBQT1JUCj4gZGlmZiAt
LWdpdCBhL2FyY2gveHRlbnNhL2luY2x1ZGUvYXNtL3RsYi5oIGIvYXJjaC94dGVuc2EvaW5jbHVk
ZS9hc20vdGxiLmgKPiBpbmRleCA4YzNjZWI0MjcwMTguLjZmYjdiNzgxNTRmNiAxMDA2NDQKPiAt
LS0gYS9hcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS90bGIuaAo+ICsrKyBiL2FyY2gveHRlbnNhL2lu
Y2x1ZGUvYXNtL3RsYi5oCj4gQEAgLTE2LDcgKzE2LDcgQEAKPgo+ICAjaW5jbHVkZSA8YXNtLWdl
bmVyaWMvdGxiLmg+Cj4KPiAtI2RlZmluZSBfX3B0ZV9mcmVlX3RsYih0bGIsIHB0ZSwgYWRkcmVz
cykgICAgICBwdGVfZnJlZSgodGxiKS0+bW0sIHB0ZSkKPiArI2RlZmluZSBfX3B0ZV9mcmVlX3Rs
Yih0bGIsIHB0ZSwgYWRkcmVzcykgICAgICB0bGJfcmVtb3ZlX3B0ZGVzYygodGxiKSwgcGFnZV9w
dGRlc2MocHRlKSkKPgo+ICB2b2lkIGNoZWNrX3RsYl9zYW5pdHkodm9pZCk7Cj4KPgo+IC0tCj4g
Mi41NS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
