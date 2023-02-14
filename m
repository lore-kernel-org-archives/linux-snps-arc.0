Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98852C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lA73rmMVv8mgz/mwGBHmuIoDlbzKyZLjpGwiL4dw0aE=; b=aIgxkS6JAQhA//
	4dD6AJ2ru6nK48zwx5Bvvl6gEO/mMB8TCJa5DxtuMOcwrzRnPtG6QoKeIrRnmtSiy9taRJbh94Ndt
	rKh1yLvVFbH1+W65JjXHt5H76qVAdqstsMDzs59yjtP1GNBkkDu3qHeWDP1Ib7ij2Zkl5Ygw8dgXu
	FoQDb0jFdgNqxq78shEZWPIYaE6Na8yU5FUvOiWzCUhKuBJPIvYNgluVVg6szKeJ5Jq/PzBmvmvn/
	OkRtR/lIPWntWZRc7qqdBWkFc3fvslrW7a5EF7QQKbX2chmjxQPOLR+w5mctAh5g4qo5arIyHNojU
	ufiav07NnPi7wxgwXXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrFv-000dRm-8m; Tue, 14 Feb 2023 09:05:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrFo-000dMk-If
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 09:05:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bk16so14844281wrb.11
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 01:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UN96HvyAH3A0F2+hA45TCkXOEUd+s53tiI7+aSVqnGA=;
        b=WP20i8MASM2rCtGp2Z93dGmU3cHmgSrcGF/TuhBxt26HL8dLV8rMBWxB7sa8KBt4Tv
         IL6JfqV+420KDLNpueRS17I87wZnHynwV7GyYH2PGB5tWYRSxhfFEZxTzExAwws6mG6P
         iakcPY+GsXyCb0Vpx7GzOxxLT7GAjj6878tQ978Llodda2xKxo9vKpEvTImdNhhBzQyU
         GBTQXOLeWISX7EYhUsOut4r3WpqCivpUPrmqlCqWIZ3Nn69+5MkbHE7fIJ058QvFHCQX
         3iiN01Fw0+PayGQK0xVI5HNTUycC8oyQptZzWy5M0sPaLFpPfPKlT60lGhE8n0Vhtc/y
         UvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UN96HvyAH3A0F2+hA45TCkXOEUd+s53tiI7+aSVqnGA=;
        b=ZGqLpY2W2OQsRSp+hQtU0QbBi2o7BTiAc/ChByK6ZcXlCCv2fAejfL/ARtMp6ki9Lv
         5t/dw0XW9uJ5CuPNXLZ27ggNztBaokQ5GXm0jhvI78g+urriXPXCLNa5anWNFvXXHbYc
         97gKyjx4bcOixG8U7yQ+H/1XTv1PQvtU8ojapn5KJNIa5fMukgwPYAGWFUFVgT9DW5iz
         B8fsKybCkLJ+8taZFW0IZWg0RUuBfrNurNTINJ+h4pgo/CWKE0ypJtueCV9OYFassOAH
         ESWuFVcfjs0DbLBbMqG8d3+mZcPPR+rWx+JW1QpIFM3+PyM9VHe8V11R+H1sN10TrJc2
         LyRg==
X-Gm-Message-State: AO0yUKVp/bqVb0+O5HyLX5fm51gYHaP9C6b4hZCHJAufsEDjk8tENlk+
	ob/caNCD7OGT5QNTAq1oKZCmTA==
X-Google-Smtp-Source: AK7set/bnATx/QinUZEv/kaFr37XQ6gSjCAmEMskILGrw/zUjdr7eN5YeojitqRWgY6y+UsZcveJ9A==
X-Received: by 2002:adf:ef91:0:b0:2c3:e0a0:94f with SMTP id d17-20020adfef91000000b002c3e0a0094fmr1673667wro.37.1676365532856;
        Tue, 14 Feb 2023 01:05:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id o7-20020a056000010700b002c559def236sm3870899wrx.57.2023.02.14.01.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:05:32 -0800 (PST)
Message-ID: <34543e7d-f34f-a3bb-cb64-d47da577589e@linaro.org>
Date: Tue, 14 Feb 2023 10:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 24/24] s390: Remove empty <uapi/asm/setup.h>
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
 <20230214074925.228106-25-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-25-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010536_713281_F16663BB 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9zMzkwL2luY2x1ZGUv
YXNtL3NldHVwLmggICAgICB8IDEgLQo+ICAgYXJjaC9zMzkwL2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCB8IDEgLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+ICAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKClJldmlld2Vk
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
