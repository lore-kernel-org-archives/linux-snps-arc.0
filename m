Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC76C05027
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bABoyVbT89vxNxHSvLsIikDNWwL+NdvdEwN78fQjWc=; b=YlsWaHCuM3/ELH
	oJosjyF/8uxzBiy+yAjGt/Wa946JWy7x0tSh5Y1/FOWi55+Bw4BCZwOBHXfIHxpViuVLIbWMXMAxz
	04EroM/bw+ZL953jvCdA4QIfbjvrZ16+ldQGRjf8kB+m37GT3341fLIHUncoJ5PfHPCCbWU3vwSB0
	qXH3V+lImKD5KQCFPmZ7YwC8OANnFXn4jA3au0RzVQ8W8spMErTVZBbzBLuJJS7WDby2B5tDVyb9Y
	6t1ukBfYoPFwQYXxaSLfI44S9ovDOJY9UsHBrHJqtxmJTeWJAHHlMykCluf09YAVF1Uk69CgZfd8q
	4lk0TZtgK3M86x4vICsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrFH-000dDv-9F; Tue, 14 Feb 2023 09:05:03 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrFC-000dAQ-2M
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 09:04:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id y1so14877181wru.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 01:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZk18aUwfr/crPnHPA/QNPK0H4tWzNL+2OmakVamCi8=;
        b=FuqeOAA0zOBxZDuVrmVbvP8dKvoEf0MRrKKfm5NpFSyLOS1syMedD57gIqKmrL5zko
         qHpdqh+1Qi4vk3xY+Y+b00Y3rfjpVOFAPuWKFoaNHXYX+NhTIfQLIuO5WcCVUFUjRwy7
         xMFDBg0c617IjgdOAOjwaUswIiGz5V4UI7DfJ8LBDe8ExR38WilQf/7hqV4J4nMfP3dK
         +NkXzLhRfCI4LG9OC+J6fTkyG/7he+OYSDs5hlMQV6UXzYF2Dol240t6thsBMIDBZKNF
         mf4lP1Tmk2bhebKijyv57HPqf77+Ml7M9RiO9cyGc/K41l5a0L/IdrW6ctCufCt4MQrg
         Mpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZk18aUwfr/crPnHPA/QNPK0H4tWzNL+2OmakVamCi8=;
        b=VJGf9u7nc+u8eU7ejMPUC6lbSg+H/ZCFkCQdRX6PoqTTxMLJThV3q87VtfodWU9tFN
         WewA9guCatwxJgoU2VfM+HIT1CH1nXDs87DDTP/EKZ/S2KMKnacjJ4ZNDB3ML3tJFpv/
         Nm97AgnZ1fo8Xncs9b+bnXay8pD/1HA06mvQnG5w6W/ZJ8PpMUA+GPf5fO936EZrVi5E
         x1hEiNF3B1tBjk8aBrW6evz8aMmQ4pvsYm5b2fhDH/NHMIqYqIQKuSAV/o12e5ccq0jC
         LJ+tSFjDczFrFWh/w1kN/69c2mxA5f/9w64I16sBVzgbrnWtoHQjxy6lXHCtjPv/r30x
         5aPQ==
X-Gm-Message-State: AO0yUKWYB6Bs+3lYg7bf5L6guRAViy0fzlPWx6XJPd1IQ66xKuxhxlkr
	I7r8sEDRkSww04eabOUb6nVfTQ==
X-Google-Smtp-Source: AK7set+jlADAGeMno/J4b9rMaQi1OSFbGE2cOeHJ3WYCoMJkKRkmj2/GQpc+G+sprep4ghyf/aRSVg==
X-Received: by 2002:a05:6000:8b:b0:2bd:f5bd:5482 with SMTP id m11-20020a056000008b00b002bdf5bd5482mr1310606wrx.28.1676365493352;
        Tue, 14 Feb 2023 01:04:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id d13-20020adfe88d000000b002c54f4d0f71sm7494931wrm.38.2023.02.14.01.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:04:52 -0800 (PST)
Message-ID: <a018ab25-b545-1227-951b-a7b4e1c25d5e@linaro.org>
Date: Tue, 14 Feb 2023 10:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 20/24] x86: Remove empty <uapi/asm/setup.h>
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
 <20230214074925.228106-21-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-21-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010458_121185_E675874A 
X-CRM114-Status: UNSURE (   9.61  )
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
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC94ODYvaW5jbHVkZS9h
c20vc2V0dXAuaCAgICAgIHwgMiAtLQo+ICAgYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9zZXR1
cC5oIHwgMSAtCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gICBkZWxldGUg
bW9kZSAxMDA2NDQgYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCgpSZXZpZXdlZC1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
