Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B7CC6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YD4GzZpyroslTpf6vMRy2XcCZN2n5pLpT3ct7i3uFMY=; b=J2FIV9iJ599a5b
	s99jETelKMhLrHRzJF6IwFUTnxW1gnwhCjz4OWeDFwccJ/5PmPPNnMH2GXz55RLM7KKCV6QEwYrbL
	nJrJEp/EmfLLA+oWRiyUCeR/B9z5A0KgiC5qPOa/nzZN12UDdANOZwRn7xmJdYIo3wJav/rwtW3jA
	a6ODml4staz1NvIRCBBGvvwuQd1wfxAG0jQzyQ//IOvUy6FA2wvq3rpfXWVS0Dx6HTOqq6812JqxK
	dx7TjlyeTVVvuw+ChuWUm0YLJOYbpg5kRPe7nEhUaTxMUe/AfBKcd6oXdGFFT5HrUukql9dveKUAi
	6EIy/DsnPOu/T7c9jvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXffh-001Y8L-MC; Thu, 02 Mar 2023 09:56:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXffe-001Y6O-DW
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 09:56:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q16so15934640wrw.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEs3yIz8iEmRFY8PICbSYz9IDFM/n81OtFDX6/s/AEc=;
        b=knISX1iT2rRR106GIUlbJC06fpznhY3A4dilwlF3bmeod/OcRdwY77WLBaAulDxb61
         Pk0zUhuXMaIpdVWHqDXDoQZZ3D3QzpQ3Ruhv1clqcbP74yLjtq6jpqGX6eesH+6oHzeO
         3cFNkLpsLel0/ACtssFKIJ3XeqH1VIntoI5WTyMPUBcqLkiJqxc6DyFl45oy9ffoLcB6
         I5E/cyonnx/gqVU4jjtrDPhZyMePqvpZyhm7gZHvwM1XibslkBs+UwOXQFGzPPAsdzYb
         KpDXTSzIiVWdMGKpc9SW2D4U9Q+S2OqdMYO+45EVoUwJ0dpEVpNAY2jfr0NIemdeGfl+
         h4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEs3yIz8iEmRFY8PICbSYz9IDFM/n81OtFDX6/s/AEc=;
        b=WITShQqbUXiUUJ5lYxPmz0HODLGalcPWyorsIg1cEY7DwYzQ1t+f7YUSrlPC1ha8Bc
         VWmBNFOdBaXpgOAgqSVZI/o/w4dQJ2c1sef3gMuZYA0xcyzM04NI1Yi9b2EXFk04H1FL
         26GqHK4PzvINKeZ4PvezyHrxe3Mwmoaa/TZpa+cbbILLjz7tEM1XtREuPakVCbMLB5QP
         MJuwXLK6RKygSA1WRU+x2ZuqF5Id0JrY53zVeuD6aUR21wSdcDQiXParMP4yYgmtFSXW
         8ORfLFwz2GFnoNNz03hRIUqtjdICJ30nsYgPk/ErODZSHQczckSx1kJ4tYa8IJSM88EJ
         5Jbw==
X-Gm-Message-State: AO0yUKV0P7zHUsLt6fgaYUkacOsJb8BKWaHCfU7jIfqI9hz9Y+Nj0Ssx
	ZXu0ELppnnWMCnnJ7ZXs+/rL6w==
X-Google-Smtp-Source: AK7set+NmzGCXmV49Z+yuGoqtBuUh6WsMHapZ5sjWJvg1AxjPSuRMcddn6CMUFtPpYXviamzMTzYwg==
X-Received: by 2002:a5d:4845:0:b0:2c7:7b7:ee94 with SMTP id n5-20020a5d4845000000b002c707b7ee94mr6581157wrs.13.1677750976700;
        Thu, 02 Mar 2023 01:56:16 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b002c5d3f0f737sm14703514wri.30.2023.03.02.01.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:56:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 20/24] x86: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:35 +0100
Message-Id: <20230302093539.372962-21-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015618_499783_1CD3ECC9 
X-CRM114-Status: GOOD (  11.03  )
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
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL3g4Ni9pbmNs
dWRlL2FzbS9zZXR1cC5oICAgICAgfCAyIC0tCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3Nl
dHVwLmggfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0dXAu
aAppbmRleCBmMzdjYmZmNzM1NGMuLjQ0OWI1MGEyZjM5MCAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5oCkBA
IC0yLDggKzIsNiBAQAogI2lmbmRlZiBfQVNNX1g4Nl9TRVRVUF9ICiAjZGVmaW5lIF9BU01fWDg2
X1NFVFVQX0gKIAotI2luY2x1ZGUgPHVhcGkvYXNtL3NldHVwLmg+Ci0KICNkZWZpbmUgQ09NTUFO
RF9MSU5FX1NJWkUgMjA0OAogCiAjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oIGIvYXJjaC94ODYvaW5jbHVkZS91
YXBpL2FzbS9zZXR1cC5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3OWE5NjI2YjU1
MDAuLjAwMDAwMDAwMDAwMAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgK
KysrIC9kZXYvbnVsbApAQCAtMSArMCwwIEBACi0vKiAqLwotLSAKMi4zNy4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFp
bGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
