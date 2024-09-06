Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AE7CE7AF1
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Sep 2024 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LH6lRhbdyxOdLRBlS5hep/jXpNFauAzKRVeHlNxQz4U=; b=SJSuG/3Bx3H0FD
	mK3pXx0L0rIU7ihNPblfsFvGka/2acXQhaxcTK4PkwDLC/rAMalT/Oz2P8/b272kWB+JgRPwDxXmK
	ltiKCn5avorEEHm9beNhTOLTkz1n+WGJ0uMId++vyYuZo+NHqSRWJpIxJ+3H/3l3KQgV7ikcJHu+8
	I46s1gro14WAcHgJ6IxpxR274/s8D+heXRuKNzGmuOVrQby2JMGJ9Pg2mdyh39eZa3bN9NM1B4uDm
	tkJNR3L7im13NZ81339BQa5VPAsIhXBBw1XcPSj2ibjeSpQJfyLXVfpzpl4nlklU3SSQQsrYr1UuV
	eSOCD2UGDhyT9+jQhB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smV40-0000000BTfq-0VOJ;
	Fri, 06 Sep 2024 09:15:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smV3G-0000000BTQg-3x23;
	Fri, 06 Sep 2024 09:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9E2E5C5B78;
	Fri,  6 Sep 2024 09:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DECDC4AF13;
	Fri,  6 Sep 2024 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725614085;
	bh=CMKQqQlBAwt7nyxZopr8LzhXpjpqLG+zrRS2vHgL2CU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U0IYQIoeba7I86BlQCZUgY7cG6HJp2P8pN16E+8wtS4NA3f0A+QxJeNxfzeNHFQRM
	 37U8ndFZhrAIL5QhPbz7SVsS5n/Cob/pfNWiElVqKitYODD+w8EZ9qN2D3O1hXN4gK
	 BReAbislBv+hctHTQsXiB52hgiPOhjk+c8Z3eHPaI4iP3mEoJ+fd7rjqCshX2nqnqK
	 L3bRBzqKdvUGneVtGV0fYDl9qZOknFbiib428EGpUegM6MEAyR35NfQSVEh07hLw4W
	 YBmV84Au2oR3CGbwDaNWeyykhwf5vXAVAASu7T19lQ5frIbc7Bw1YDbAv76E/JfKLw
	 3czemgjWisuDQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5356bb5522bso2271780e87.1;
        Fri, 06 Sep 2024 02:14:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU11qwXG8IRQT+PiR3982LdJSko+jposttQIidu0yUM9ILZEjcpVqp6FYZgKsxWefSYF1WFHaA3t0oqXByscF1g@lists.infradead.org, AJvYcCVNvSe5WmJC5jn3O+FC0fKNS/bL8FLryvNJbCBeekhoVD7JiKeFBhwuWksZKo76qwhOULVb42JNYKkmovLz5vI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf/2LyAJTRC9thcfjSRtzwlstdUAKiMCkXCXrP3ZUzOPnX77KE
	Z7xeMve+f7JyNr702UQCqSogyiDqLFxc5ungRrUhUkl4mAB2AtI9G4YH8Pz8MdFeXjNkknXR5E3
	ExPkPDbsrbz+zWBt35gxXacVL/8U=
X-Google-Smtp-Source: AGHT+IG36wbIRnT1Ou+S3dPUzuz2yggKLEtxdYmatoEi0v4jKJk+IlFZ4GYCNU3aoE7cv9QcH4wQMa5emUdk1dRhZxo=
X-Received: by 2002:a05:6512:33cf:b0:52c:df6f:a66 with SMTP id
 2adb3069b0e04-53658815a6cmr1065929e87.58.1725614083466; Fri, 06 Sep 2024
 02:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com> <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
In-Reply-To: <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Sep 2024 17:14:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
Message-ID: <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
To: Arnd Bergmann <arnd@arndb.de>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, shuah <shuah@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek <chris.torek@gmail.com>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_021447_093332_EADE47E9 
X-CRM114-Status: GOOD (  26.22  )
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

T24gRnJpLCBTZXAgNiwgMjAyNCBhdCAzOjE44oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCA1LCAyMDI0LCBhdCAyMToxNSwgQ2hhcmxpZSBK
ZW5raW5zIHdyb3RlOgo+ID4gQ3JlYXRlIGEgcGVyc29uYWxpdHkgZmxhZyBBRERSX0xJTUlUXzQ3
QklUIHRvIHN1cHBvcnQgYXBwbGljYXRpb25zCj4gPiB0aGF0IHdpc2ggdG8gdHJhbnNpdGlvbiBm
cm9tIHJ1bm5pbmcgaW4gZW52aXJvbm1lbnRzIHRoYXQgc3VwcG9ydCBhdAo+ID4gbW9zdCA0Ny1i
aXQgVkFzIHRvIGVudmlyb25tZW50cyB0aGF0IHN1cHBvcnQgbGFyZ2VyIFZBcy4gVGhpcwo+ID4g
cGVyc29uYWxpdHkgY2FuIGJlIHNldCB0byBjYXVzZSBhbGwgYWxsb2NhdGlvbnMgdG8gYmUgYmVs
b3cgdGhlIDQ3LWJpdAo+ID4gYm91bmRhcnkuIFVzaW5nIE1BUF9GSVhFRCB3aXRoIG1tYXAoKSB3
aWxsIGJ5cGFzcyB0aGlzIHJlc3RyaWN0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJs
aWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4KPiBJIHRoaW5rIGhhdmluZyBhbiBh
cmNoaXRlY3R1cmUtaW5kZXBlbmRlbnQgbWVjaGFuaXNtIHRvIGxpbWl0IHRoZSBzaXplCj4gb2Yg
dGhlIDY0LWJpdCBhZGRyZXNzIHNwYWNlIGlzIHVzZWZ1bCBpbiBnZW5lcmFsLCBhbmQgd2UndmUg
ZGlzY3Vzc2VkCj4gdGhlIHNhbWUgdGhpbmcgZm9yIGFybTY0IGluIHRoZSBwYXN0LCB0aG91Z2gg
d2UgaGF2ZSBub3QgYWN0dWFsbHkKPiByZWFjaGVkIGFuIGFncmVlbWVudCBvbiB0aGUgQUJJIHBy
ZXZpb3VzbHkuCj4KPiA+IEBAIC0yMiw2ICsyMiw3IEBAIGVudW0gewo+ID4gICAgICAgV0hPTEVf
U0VDT05EUyA9ICAgICAgICAgMHgyMDAwMDAwLAo+ID4gICAgICAgU1RJQ0tZX1RJTUVPVVRTID0g
ICAgICAgMHg0MDAwMDAwLAo+ID4gICAgICAgQUREUl9MSU1JVF8zR0IgPSAgICAgICAgMHg4MDAw
MDAwLAo+ID4gKyAgICAgQUREUl9MSU1JVF80N0JJVCA9ICAgICAgMHgxMDAwMDAwMCwKPiA+IH07
Cj4KPiBJJ20gYSBiaXQgd29ycmllZCBhYm91dCBoYXZpbmcgdGhpcyBkb25lIHNwZWNpZmljYWxs
eSBpbiB0aGUKPiBwZXJzb25hbGl0eSBmbGFnIGJpdHMsIGFzIHRoZXkgYXJlIHJhdGhlciBsaW1p
dGVkLiBXZSBvYnZpb3VzbHkKPiBkb24ndCB3YW50IHRvIGFkZCBtYW55IG1vcmUgc3VjaCBmbGFn
cyB3aGVuIHRoZXJlIGNvdWxkIGJlCj4gYSB3YXkgdG8ganVzdCBzZXQgdGhlIGRlZmF1bHQgbGlt
aXQuCj4KPiBJdCdzIGFsc28gdW5jbGVhciB0byBtZSBob3cgd2Ugd2FudCB0aGlzIGZsYWcgdG8g
aW50ZXJhY3Qgd2l0aAo+IHRoZSBleGlzdGluZyBsb2dpYyBpbiBhcmNoX2dldF9tbWFwX2VuZCgp
LCB3aGljaCBhdHRlbXB0cyB0bwo+IGxpbWl0IHRoZSBkZWZhdWx0IG1hcHBpbmcgdG8gYSA0Ny1i
aXQgYWRkcmVzcyBzcGFjZSBhbHJlYWR5LgoKVG8gb3B0aW1pemUgUklTQy1WIHByb2dyZXNzLCBJ
IHJlY29tbWVuZDoKClN0ZXAgMTogQXBwcm92ZSB0aGUgcGF0Y2guClN0ZXAgMjogVXBkYXRlIEdv
IGFuZCBPcGVuSkRLJ3MgUklTQy1WIGJhY2tlbmQgdG8gdXRpbGl6ZSBpdC4KU3RlcCAzOiBXYWl0
IGFwcHJveGltYXRlbHkgc2V2ZXJhbCBpdGVyYXRpb25zIGZvciBHbyAmIE9wZW5KREsKU3RlcCA0
OiBSZW1vdmUgdGhlIDQ3LWJpdCBjb25zdHJhaW50IGluIGFyY2hfZ2V0X21tYXBfZW5kKCkKCgo+
Cj4gRm9yIHNvbWUgcmVhc29uLCBpdCBhcHBlYXJzIHRoYXQgdGhlIGFyY2hfZ2V0X21tYXBfZW5k
KCkKPiBsb2dpYyBvbiBSSVNDLVYgZGVmYXVsdHMgdG8gdGhlIG1heGltdW0gYWRkcmVzcwo+IHNw
YWNlIGZvciB0aGUgJ2FkZHI9PTAnIGNhc2Ugd2hpY2ggaXMgaW5jb25zaXN0ZW50biB3aXRoCj4g
dGhlIG90aGVyIGFyY2hpdGVjdHVyZXMsIHNvIHdlIHNob3VsZCBwcm9iYWJseSBmaXggdGhhdAo+
IHBhcnQgZmlyc3QsIHBvc3NpYmx5IG1vdmluZyBtb3JlIG9mIHRoYXQgbG9naWMgaW50byBhCj4g
c2hhcmVkIGltcGxlbWVudGF0aW9uLgo+Cj4gICAgICAgQXJuZAo+CgoKLS0gCkJlc3QgUmVnYXJk
cwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
