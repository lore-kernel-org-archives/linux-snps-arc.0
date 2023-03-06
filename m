Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896B5C678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psFg3nQcg+AYPpgCLibLOKflGZ8Zm47wrcjZDJl2A0Q=; b=4g6KsLzokbJUar
	J/Ie64QpFmxx31lalnzhEPqFaUoUYYiuTDNty+w2rleHefMgX8fle0i1DYGiDsKvKgnu8TZgO4MDn
	RY/mx/zY2LI46T/wk9Gpstk3fORfRgoVvT74Yj/zYfWuSZMbFcWv08pl+A0BSF5OFa0WCNCG/gxKs
	IoDMGXSVpJbR+wPcQ4KSaW6UEa5+eobhHwm0oRGJKjPEKxTMYjLLszvUwBPbhWBtMZFPPXgOTXShh
	n2XcbFu7cL5UFhZ7e9pPQiDLsyaOD65+PFrlkZZq7uJKaQcjkTo/vfQjHB5ekbeomFx2FMMDON9NQ
	4G1Cv4w+FpzTgk8v7vlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7r1-00CG0Y-66; Mon, 06 Mar 2023 10:14:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7qx-00CFyW-IJ
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:14:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so7770190wmb.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3X9BvECf+3SX0mMpHf0lthb5xJ0QkcE03vRTNH+hHOU=;
        b=TTSZLAdSQw2BSgSrJJ2o37VazWfyqoXDSSnKzELvvKdWaFxQn0hpc3xnanqgBRvl8f
         hMcTvxnJ8qqKyl8vSndcVLH7PbDn9kfgNB1VXKCuPDHcFGW4mKqFBhn/w6Sdh0Xgm1R6
         YM6vKZwjlOo0wqPzhmimn1eoNY7JrMrYeHStZ/t5ZuIOEXNPQKF0tExXRTn6cVEw2RP6
         dYsHwEH4Xe7lRfjF3at1i//BKyDky/XBdoPvehKfCtgR5rGkyIeUwTBKTSwBNVePHqZ+
         iJYXtXhBy/u8FL/m/g6gBbLtGB3IJ5+MqR+lTtHRiPq1uFWNBl/r9W3PzjkDk3EBJxIX
         xeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3X9BvECf+3SX0mMpHf0lthb5xJ0QkcE03vRTNH+hHOU=;
        b=Z/UCTgTGsHCEIwaeR1740rF0h4qBNhjK5na18ib78RAoRDeMnpsW7B08HYzwc/w8XY
         5DTSRR3cKCvheWZQdkaeUvtyck0ryFO5cugpncnt42b7H3eOVaFcuHttkQ9y15J7/Yd0
         5TFnbZvB0Omf0to/f1JjLFRJ5/sX9R6aUNxg9oYU/zTn/cQh17dWUJX/D/Iqw3ND0/w+
         7I7495DkD9YEqTOlSrqSs4lTcvpSu9FbOxNLHKgG2jpAjGh4urZlfVUUTAs9XX4HMZPe
         r6JGVMKtltFHawpSbjoY6N4wGjM+SRERGzFQWT20tx2YgUDAOxLGHQ3kjaCcUDI9Rrls
         5wmQ==
X-Gm-Message-State: AO0yUKUPk2kRLlWKKeec/CO/cpskxFzJkoWb71biewZmu3u/+++Rt2wF
	6WLw7oqxKgRSxsSyZ9S/vsNHiw==
X-Google-Smtp-Source: AK7set/l5GEMnq9janBGBy5D83Z+dadr5zaqw7qRz4/2MZ2rCQRE3vxRMNg0fQT2CV/QEN0Xv7ys6w==
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id u15-20020a05600c19cf00b003e7772d22demr8559008wmq.30.1678097637919;
        Mon, 06 Mar 2023 02:13:57 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600c46cb00b003dc1d668866sm14417931wmo.10.2023.03.06.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:13:57 -0800 (PST)
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
Subject: [PATCH v5 08/26] parisc: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:50 +0100
Message-Id: <20230306100508.1171812-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_021359_653363_29038DC7 
X-CRM114-Status: GOOD (  15.16  )
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

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpBcyBmYXIgYXMgSSBj
YW4gdGVsbCB0aGlzIGlzIG5vdCB1c2VkIGJ5IHVzZXJzcGFjZSBhbmQgdGh1cyBzaG91bGQgbm90
CmJlIHBhcnQgb2YgdGhlIHVzZXItdmlzaWJsZSBBUEkuCgpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgpBY2tlZC1ieTogSGVsZ2UgRGVsbGVyIDxkZWxs
ZXJAZ214LmRlPgotLS0KIGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NldHVwLmggICAgICB8IDcg
KysrKysrKwogYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oIHwgMiAtLQogMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vc2V0dXAuaAoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9z
ZXR1cC5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNDRlMWM0MjI0
NGJiCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vc2V0dXAuaApA
QCAtMCwwICsxLDcgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisj
aWZuZGVmIF9QQVJJU0NfU0VUVVBfSAorI2RlZmluZSBfUEFSSVNDX1NFVFVQX0gKKworI2RlZmlu
ZSBDT01NQU5EX0xJTkVfU0laRQkxMDI0CisKKyNlbmRpZiAvKiBfUEFSSVNDX1NFVFVQX0ggKi8K
ZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gv
cGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAppbmRleCA3OGIyZjRlYzdkNjUuLmJmYWQ4
OTQyOGU0NyAxMDA2NDQKLS0tIGEvYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5o
CisrKyBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaApAQCAtMiw2ICsyLDQg
QEAKICNpZm5kZWYgX1BBUklTQ19TRVRVUF9ICiAjZGVmaW5lIF9QQVJJU0NfU0VUVVBfSAogCi0j
ZGVmaW5lIENPTU1BTkRfTElORV9TSVpFCTEwMjQKLQogI2VuZGlmIC8qIF9QQVJJU0NfU0VUVVBf
SCAqLwotLSAKMi4zNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1zbnBzLWFyYwo=
