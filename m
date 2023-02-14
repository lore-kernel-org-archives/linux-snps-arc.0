Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838DCC678D4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMpDjPMHlLKQqQfYPbS4arH4DQ/49OA6iNhM/vZlbus=; b=iZIZboHb1jUVTE
	6jBaFm32cLaazABVLscFsCpVv1MZz9EgA66J2uuPC1gjS4XaSkNjZjcfJZfLA4TQpAsxn/eSM7ozF
	eTd8qe7UENdr8z+RUKqdL/3+1NMzuxW6V8XKDInpYc8NQ8QBimQL7ksp39JJYQ5oMFfN5asHz0svT
	VT6QYRIy+oZpwXNQviURnq/H0M5sEBlEdGX4HawnQVj4dH2o0ecdH7uxIorhypjzW3TMcLs/RVYWJ
	MTPu52JHRvYKU6RNUWOpNreYa78KSUA415qMm83He0it73oBSkvcBzBeKHDgGeVuTXTIym/kA2b4k
	MLiobHTW7ncbOlhT+xDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrIX-000eaV-W7; Tue, 14 Feb 2023 09:08:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrIT-000eXP-4f
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 09:08:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id h16so14843686wrz.12
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 01:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJq3RRMzf3lbuS5bgQVc8NQ+nEsYjE4jNGYbXmQQw78=;
        b=Wsp4Zlb8V2Jx4m9+tXkDNgf5Lxau03xHaG+6WGxc+G8HrcJltAE2Px1QSC5XUlVOpz
         2Ng4jqNhjAJ4QJFwe7IYqEDhVP83rKHt0zthGOU/F+j+7d3lCfNC+HaTRTHh98F2fr7Y
         I1aHMaHeLfbmf2lAE+TKEJNN/s8peiJT6bIUpf+6MkHhRn0aKlK4U+gulZSfiKfbW+Eu
         wBNce34+0fI2Gh7tFdgEA0vsetKVHpBVYQ4d3RHWTRqruuVixLinnhKVyILNuRuoZPxH
         SlDA849VfSADVOOeo3f3/Yud1fZ/0yd8ncI6fO9i/ywnDuaYO8zFs36ALYL690/jjvZv
         Clag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJq3RRMzf3lbuS5bgQVc8NQ+nEsYjE4jNGYbXmQQw78=;
        b=TKmc6K8nF79XZ56fOEh4sKZhLBEZuv3AeegzSKKijkqF06naxc24tvBe06qAc6yD09
         XG96GaJd6R4h4FvAijGQBY4n89lRg7+2cOJj3r/IAC2vE2Ki4lDPojMR3GtXrgAqfVtO
         2SyeOWCePleBPJUwBhv94MV9N/uib5SrA0u5uZnwHYpzX62wqSyHwpVaFI/EJVN3f4GV
         a+9YmkQtGtWPUdcUoSVbsJso3NtB7EouH34YWqR2PnZUL6l985QlHjx4cJbHf+jES9gG
         22KLx+aNDM1pR/Zcx5OER/FKcGfZqjf58Zjt2JYAyjJ9hVVfyaNs3ZLWhSkhHtsF4Vaa
         BMBg==
X-Gm-Message-State: AO0yUKW5nfRyg1mmKe239jQxkmX5p5we5arfdxm4FQZX50ujpu1Rv2SB
	yjQRlCEq6OGHy1zSV3v5vMwVqQ==
X-Google-Smtp-Source: AK7set9xlomseTD4h4a83sLRQq4DtapmagaqXlgE7UNo4UXcLklpQodFpnducrj9Vfa/kRz/NDHZaQ==
X-Received: by 2002:a5d:4e01:0:b0:2c5:5a68:958 with SMTP id p1-20020a5d4e01000000b002c55a680958mr1356559wrt.33.1676365699836;
        Tue, 14 Feb 2023 01:08:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b003dc434900e1sm17810977wms.34.2023.02.14.01.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:08:19 -0800 (PST)
Message-ID: <f327ff48-cd50-4caa-1bea-f9906994e998@linaro.org>
Date: Tue, 14 Feb 2023 10:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-9-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-9-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010821_222465_3D7DC5A2 
X-CRM114-Status: GOOD (  12.50  )
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

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsIHRo
aXMgaXMgbm90IHVzZWQgYnkgdXNlcnNwYWNlIGFuZCB0aHVzIHNob3VsZCBub3QKPiBiZSBwYXJ0
IG9mIHRoZSB1c2VyLXZpc2libGUgQVBJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9wYXJpc2MvaW5jbHVkZS9h
c20vc2V0dXAuaCAgICAgIHwgNyArKysrKysrCj4gICBhcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkv
YXNtL3NldHVwLmggfCAyIC0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3BhcmlzYy9pbmNsdWRl
L2FzbS9zZXR1cC5oCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEBsaW5hcm8ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
