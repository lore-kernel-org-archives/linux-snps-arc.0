Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7865EC678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5vEQ32spxGzWntAaJftzCcbnjyj4DeU0ygWaBUAxH0=; b=Iftr6EAb6f3FDa
	tdI0XlB2Gl7F/sjI/uvieS3bMT5RwtfPO5+tbugGFA2vI4OJu4bNSfKxYIsFpfr1GAmNSiVyICKjY
	XLuvVKL8hoHLQyJZkM0bfavo+yCYcYefWSrLewKLI/av1nCEXaMbRXUteG8lHUFV+szZC8D88BnUh
	TXB65X8MA1/3NSow0yLxw77/tSdaBD+8KN00wUK3FnezrIAjZflQ+xNGpzStc7/FrXUlAQofMMtRA
	aTbt4V/dQZynlaf2OXLvb+y+cOJMWQKVTkLYEjHv82wez92i8BBXE6UC9y8bYhst/Qo+V3tsfqwyD
	z4QaI2OvEju8rM+YS7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7y0-00CHoa-N7; Mon, 06 Mar 2023 10:21:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7xx-00CHlo-Mk
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:21:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id c18so5276453wmr.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Ect6Q4Z/51Ss7kNoue4ZgIVIoWQVVZbpFfKkrpRUw=;
        b=eKLpoO9ARR6byQoI3KfBvzhVk6oe6tP+suH4MHwkIJcy/wnL2MWwPVlq3KLS4NJYuC
         npg5z0T2YBn/ekgqpnS/gNer4hyqDKqYzgmIxENE3SgezTEwqliE0zYvr1fPH2GwQmt9
         jcx1NZi01pxBQ8XJzaRbcQsUYYsPfqsPA8Xrv5yjnuSnQHXj/GpNSw6rf6ah3jgmbxsg
         5zflN2ad7NQHZvZAnNO7AQDSJOT5MmVleuf7siqRD5syVZugGRJ+AhyVsYNsIzfeu+J7
         VpepoXaaVFgjZInk8H50HM4y5yJKfoYFvZxa+/DInESeQ0WBP4e+4PFuGrx7eKGY+RhS
         PH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+Ect6Q4Z/51Ss7kNoue4ZgIVIoWQVVZbpFfKkrpRUw=;
        b=LxyMMB21PU73U7HT0A46FxSnIQUeNjEOSs44/d3TmYI9uYkQFPfrWd7KTCgmpHYRST
         Z5l8jx1Uyzd2/RnWI0bK+w4+EuI2GvUzf2scqidokAUbT11gpaoUe4lcmOJtOatqEDXV
         S8/5Q67OTYwOi4pLYFlYo9IvSibWyoHn41Idqh033yXCg2tl2CYUKx6EH+205dmwRm9P
         2JpdMcLkPkCOIpnbehEFHGzYFeTC/oYmuWb6WYaW5shmxYs5utdd10x+r2FLzKjFok/2
         i9inCC/9VCvWMJFOgAlZn4CnBo+x6rP5GWABLHIGwuv8AaSgtJv0HG59c4tdPmVCIRmB
         NlRA==
X-Gm-Message-State: AO0yUKXAXGYF97ALGnWlPq6VIFfr42QLT71Okx7h/MWfgoy9VnVIUPvz
	slUAbKfcUa97HodLA3VuQqW6Rg==
X-Google-Smtp-Source: AK7set/wPuCwO2+/CS8VAJ7eTry4Cq+2CHA4Y8YGXKD1MQFrurlRBakmEmc3JjUrX5cCPEVIcMP5rQ==
X-Received: by 2002:a05:600c:5254:b0:3eb:432d:8279 with SMTP id fc20-20020a05600c525400b003eb432d8279mr9240197wmb.13.1678098069733;
        Mon, 06 Mar 2023 02:21:09 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c15d200b003e20a6fd604sm9521693wmf.4.2023.03.06.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:21:09 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 15/26] arc: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:04:57 +0100
Message-Id: <20230306100508.1171812-16-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_022113_810640_56C59A1D 
X-CRM114-Status: GOOD (  12.03  )
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

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gvYXJjL2luY2x1
ZGUvYXNtL3NldHVwLmggICAgICB8IDEgLQogYXJjaC9hcmMvaW5jbHVkZS91YXBpL2FzbS9zZXR1
cC5oIHwgNiAtLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKCmRpZmYgLS1naXQg
YS9hcmNoL2FyYy9pbmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vc2V0
dXAuaAppbmRleCAwMjhhOGNmNzYyMDYuLmZlNDVmZjQ2ODFiYyAxMDA2NDQKLS0tIGEvYXJjaC9h
cmMvaW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL2FyYy9pbmNsdWRlL2FzbS9zZXR1cC5o
CkBAIC03LDcgKzcsNiBAQAogCiAKICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgotI2luY2x1ZGUg
PHVhcGkvYXNtL3NldHVwLmg+CiAKICNkZWZpbmUgQ09NTUFORF9MSU5FX1NJWkUgMjU2CiAKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gvYXJjL2lu
Y2x1ZGUvdWFwaS9hc20vc2V0dXAuaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTZk
NGU0NDkzOGJlLi4wMDAwMDAwMDAwMDAKLS0tIGEvYXJjaC9hcmMvaW5jbHVkZS91YXBpL2FzbS9z
ZXR1cC5oCisrKyAvZGV2L251bGwKQEAgLTEsNiArMCwwIEBACi0vKgotICogc2V0dXAuaCBpcyBw
YXJ0IG9mIHVzZXJzcGFjZSBoZWFkZXIgQUJJIHNvIFVBUEkgc2NyaXB0cyBoYXZlIHRvIGdlbmVy
YXRlIGl0Ci0gKiBldmVuIGlmIHRoZXJlJ3Mgbm90aGluZyB0byBleHBvcnQgLSBjYXVzaW5nIGVt
cHR5IDx1YXBpL2FzbS9zZXR1cC5oPgotICogSG93ZXZlciB0byBwcmV2ZW50ICJwYXRjaCIgZnJv
bSBkaXNjYXJkaW5nIGl0IHdlIGFkZCB0aGlzIHBsYWNlaG9sZGVyCi0gKiBjb21tZW50Ci0gKi8K
LS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
