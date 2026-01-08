Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCFCD14893
	for <linux-snps-arc@archiver.kernel.org>; Thu,  8 Jan 2026 02:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEpXmuTk2Pq45j0k3kDP9+yA3ViBtMG2FJHT2nEHoK0=; b=VRclfI2FeG3f+J
	twUnsMT0V8XXzEs3YPUiazdXAnJ3A81qXVbNvsvGlsifmSX2BYeIuwdE4Kvq0PsH3s+AMNWZuIGjY
	aA/ZWt/fXjqBQlLjUbquOwPrwNT4t3Ley5q7Gjj6FqQ0Ak35vvXyJIu79qyv1zuLYmItidMc2vAr1
	cnDKxg4Ei5U0dr+ia1djbDRqafRYX7TLDZYgEK+o3dnS4jpQZZEIGQPHqp4ddTFlL6FZA0Etb2abw
	/l0VbWwen7zWSOSzgQ0D7mcD6GApOptXfsTT8rNGo+L6hne5xu6myo6U69Vg/jKnVcavzK33vAj3i
	qNy+oNjlRsZeIfaChPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdfgn-0000000FpvK-3bN5;
	Thu, 08 Jan 2026 02:23:53 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdfgk-0000000Fptp-0sqx
	for linux-snps-arc@lists.infradead.org;
	Thu, 08 Jan 2026 02:23:53 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-78c66bdf675so27815607b3.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 07 Jan 2026 18:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767839029; x=1768443829; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WPMqEgbiq/1nCGoqJgHIPGVbxZP1MvEMarO5Hdi07w=;
        b=ZcqmtyBLPyrKPNZaaRrhvxCONjGAiP2J4uKyNynlgW5cnWSThRTnnJPuNuADGQtRWu
         bw/eKjATnqzQ2hphlKyJKNK/EfseUzMVrXJtJ1u22o33pQIyWhFdSS63TIHmPngVYhC2
         80iE0Ja9hsxNwSgRzkrnGZBXBvnf2qvb5P3Nq+URxNwgz/f08r72f/egn4GjXcuUaZ9H
         ME5fytAZwIxd03ckvSDjxxEQZXL5S414YXWwgOaixEvYBE54g4KIiukkTgU5O/yeags7
         dRTOv59EJ5fGXWTFaY97Kl7GpSYVa7nuMio6gX6KsBTQpKt83YrqXbLJpVkUA6thkmTl
         HtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767839029; x=1768443829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WPMqEgbiq/1nCGoqJgHIPGVbxZP1MvEMarO5Hdi07w=;
        b=FMtfVdw1CS1r5Ws4dGAfPRNNoHobgF6y+f7j0+DbXr7z8MK3s5qhWxmGe7gIu5YMar
         GzzImCVb4+NbZ/KqSi0nzSN+zouUY9NkIWy5h5q+JYGUyE+XmMdlaBdF2AFDo3ocN8j8
         5Mq2MzBDNLOfuBeUMjqbvvEfohccXaFwH3uG0cg1LjXWMjfNwWU6U9l+an8WqGR2IVY4
         XvOV9MTtmbsygtbAObsM/SK1/cqdyIThuLkwac34ACTdYJXWEntbms4yZjMjNpU/XduV
         znsetC/DMPZz0ZK6qAacYh85gptsVZmlHBrHdd2x8u1zqAM6Kv83On6jHGkKOljrnmM4
         3T7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV70fnAtq8eood2EQJ8JqeAFcYPDFxzWPPPfdl2VJ83upavZ9SBPMdCmInPiJJIihq5C7KSPkHG50wPAwIfNw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8dmxLonbp4PylbJlGl0LVpnQ1LVqdZcmABGE0SGu6oDkHRTtD
	YqA8v/J7NohTPzwKzS0ovxXTQvlJ2l4Ghp5XXQJZWDDD6Vx1YlDIEjA6
X-Gm-Gg: AY/fxX76LTKSZbQkX8JKyTx1m3vhyYruKX7mImXOIHv3j3hQmaVQR1Dfy5G4+8NtAKn
	M3VupHEYNbGv7RVcu6eQWQjRLJBAqZ0Yxqcwr3Cn6XFJ7wReT8RFfFOP78OJrfclavEMLUAMG+C
	9DluCKHltAfLOfX6MDIq8n0p6Em5NIgT/ti8KQRburMsTYYtGMsIzOUePnxgFy5XL1f1H9bEDCX
	/0I+6AlKDjfr/cKl5jeyCLGgxKQhiiimyWqjKqMgXDgglpjsUlkHQCBKXQajPDsrJC9lB3P11S7
	5Ac3q9kQKt44GDDT79eUI5UN+Xc5/Uf/l/uqxVlTIx0Nf+2mLUpgr6VytTJXGT4O9DiFroUXnye
	p3gnNXWUPiJAymWCQ2BsT8aJYfCkh0/7WePASQrNOrI2EkXsS2dCJ9L1kqCf0ilQslXotQ9vdz0
	KpXOK5rCfvUaTKOjUxEBN68Ok6CUSPgesctomn/g==
X-Google-Smtp-Source: AGHT+IGgMpL+kZMdvF4ADTgetvjR8KjnRPwe3Xe2CKlVvJLk69qHA2NQZ4MxPPVQYhnVGWyKjWzQjw==
X-Received: by 2002:a05:690e:1c06:b0:644:6b68:f126 with SMTP id 956f58d0204a3-64716cacb29mr3927712d50.77.1767839028925;
        Wed, 07 Jan 2026 18:23:48 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790ae603282sm21321087b3.13.2026.01.07.18.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 18:23:48 -0800 (PST)
Message-ID: <1d110134-89ab-474b-bca6-cfbfd4b5057f@gmail.com>
Date: Thu, 8 Jan 2026 10:23:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pgtable: convert pgtable_t to ptdesc pointer
To: Matthew Wilcox <willy@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, alexs@kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-arch@vger.kernel.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-mm@kvack.org>,
 "open list:C-SKY ARCHITECTURE" <linux-csky@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON ARCHITECTURE" <linux-hexagon@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:OPENRISC ARCHITECTURE" <linux-openrisc@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:USER-MODE LINUX (UML)" <linux-um@lists.infradead.org>
References: <20260107064642.15771-1-alexs@kernel.org>
 <aV4h5vQUNXn5cpMY@kernel.org>
 <080e493a-e4f1-4c97-a3e1-f76f126b5213@gmail.com>
 <aV5yIuGi9Ni5YP5E@casper.infradead.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <aV5yIuGi9Ni5YP5E@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_182351_132590_48A68ED1 
X-CRM114-Status: GOOD (  15.43  )
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

CgpPbiAyMDI2LzEvNyAyMjo0OCwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gT24gV2VkLCBKYW4g
MDcsIDIwMjYgYXQgMDU6Mjg6MzZQTSArMDgwMCwgQWxleCBTaGkgd3JvdGU6Cj4+IFJpZ2h0LCBJ
IHdpbGwgZml4IHRoaXMuIGFuZCBzZW50IHRoZSAybmQgdmVyc2lvbi4KPiBObywgdGhlIHBhdGNo
IGlzIHN0dXBpZCBhbmQgd3JvbmcuICBEb24ndCBzZW5kIGEgdjIuICBZb3Ugc2VlbSB0byBoYXZl
IGEKPiBoYWlydHJpZ2dlciByZXNlbmQsIHNvIEknbSB0cnlpbmcgdG8gcHJldmVudCBhIHYyIGJl
aW5nIHNlbnQgaW5zdGVhZCBvZgo+IHNlbmRpbmcgYSBwYXRpZW50IHJlcGx5LgoKSGkgTWF0dGhl
dywKCkkgaGVhciB5b3XigJRubyB2MiB3aWxsIGJlIHNlbnQuCmJ1dCBzb3JyeSBmb3IgYSBiaXQg
Y29uZnVzaW5nLCB3aGF0J3MgeW91ciBleHBlY3RlZCBmaXg/IGlzIHRoZSB0b28gCnF1aWNrIHJl
c2VudGluZz8gb3IgdGhlIGRpcmVjdGlvbiB0byBhbGlnbm1lbnQgcGd0YWJsZV90IHdpdGggcHRk
ZXNjIGlzIAp3cm9uZz8KCklmIGl0J3MgdGhlIGZpcnN0LiB0aGUgbmV3IGNoYW5nZSBmb3IgcmV2
aWV3IGFkZHJlc3MgTWlrZSdzIGNvbmNlcm4uCmRpZmYgLS1naXQgYS9hcmNoL2FybS9pbmNsdWRl
L2FzbS9wZ2FsbG9jLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKaW5kZXggYTE3
ZjAxMjM1YzI5Li5hMjA0YzNhYzgwMGEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L3BnYWxsb2MuaAorKysgYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKQEAgLTk0LDEz
ICs5NCwxMyBAQCBwdGVfYWxsb2Nfb25lX2tlcm5lbChzdHJ1Y3QgbW1fc3RydWN0ICptbSkKICBz
dGF0aWMgaW5saW5lIHBndGFibGVfdAogIHB0ZV9hbGxvY19vbmUoc3RydWN0IG1tX3N0cnVjdCAq
bW0pCiAgewotICAgICAgIHN0cnVjdCBwYWdlICpwdGU7CisgICAgICAgc3RydWN0IHB0ZGVzYyAq
cHRlOwoKICAgICAgICAgcHRlID0gX19wdGVfYWxsb2Nfb25lKG1tLCBHRlBfUEdUQUJMRV9VU0VS
IHwgUEdUQUJMRV9ISUdITUVNKTsKICAgICAgICAgaWYgKCFwdGUpCiAgICAgICAgICAgICAgICAg
cmV0dXJuIE5VTEw7Ci0gICAgICAgaWYgKCFQYWdlSGlnaE1lbShwdGUpKQotICAgICAgICAgICAg
ICAgY2xlYW5fcHRlX3RhYmxlKHBhZ2VfYWRkcmVzcyhwdGUpKTsKKyAgICAgICBpZiAoIVBhZ2VI
aWdoTWVtKHB0ZGVzY19wYWdlKHB0ZSkpKQorICAgICAgICAgICAgICAgY2xlYW5fcHRlX3RhYmxl
KHB0ZGVzY19hZGRyZXNzKHB0ZSkpOwogICAgICAgICByZXR1cm4gcHRlOwogIH0KCkBAIC0xNDEs
NyArMTQxLDcgQEAgcG1kX3BvcHVsYXRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwbWRfdCAqcG1k
cCwgCnBndGFibGVfdCBwdGVwKQogICAgICAgICBlbHNlCiAgICAgICAgICAgICAgICAgcHJvdCA9
IF9QQUdFX1VTRVJfVEFCTEU7CgotICAgICAgIF9fcG1kX3BvcHVsYXRlKHBtZHAsIHBhZ2VfdG9f
cGh5cyhwdGVwKSwgcHJvdCk7CisgICAgICAgX19wbWRfcG9wdWxhdGUocG1kcCwgcGFnZV90b19w
aHlzKHB0ZGVzY19wYWdlKHB0ZXApKSwgcHJvdCk7CiAgfQoKICAjZW5kaWYgLyogQ09ORklHX01N
VSAqLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
