Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC8FC6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtloT7DnN7JyRZVpDywatbH4YULOxvxh15x/hZvM8kQ=; b=OhtLIW4+WdtozZ
	Mqo0vfEWkUSWb35+eeMbydPLXxN5fouGvFLTLJ451j4LSbuOKTTH3bM7SIYx7HAF+wq6AqXviMVat
	ODr9OgIp/ZXmq0mPS3tTvq+hTpCerKkzwc75AFP3ASIs1EQMJ3hWh1w0uli/iHOL3nhmwjUVEIS4r
	5e9fgRelZg6rIysIG/QWX4ItAav5/fgGNYMJANjFE7vRg6bR/aC5mVFjU3ry6F1O6yibM5jFPDIFO
	Q3rHmf72EK+KtA7fhcoLy8fzA1S08lhMKPxZZCUKYG60c7CJ6deukMl0FgOJr2NXPZeH5gvhxszy+
	qFIqnrFo2wVRvmAK8LQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfjh-001a0I-Lw; Thu, 02 Mar 2023 10:00:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfjd-001Zxp-6P
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 10:00:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id g3so7046180wri.6
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 02:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677751223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjatsIL5XK1QQSQeDPGE4hkKEq8N3SCj7VakQ0NSqR4=;
        b=Joyk5NhrHhXbmkVlsjdNjv7dcYw86m4IQXIHczn/d6XUPDtRe82TXjk6QIyr/nAcFn
         MX2FQnoHCLHYesMqTw42aFXg8FeamIT9bJtNWCT4XKrQMXs/jktz5/Nx+swnuYN1PRth
         GdeUYDHU8Rq2h+VUt3Z5AaXI0poDy3pXFui49SUz3kEebQhq8gsyZLkWdwQ6+seP70Nd
         CC4VM7zZtrGV37YSvEdV6WxtBpL6mc7M0o8rXEYbsdrz8Cp7qphJJB2Eo6BdJN1Hp8LY
         31w6Brsh9FbsVAudFSGz2JlUD2vPhmH7ibCYajgltR1FOyaPhYccx8K4QTf4rZalSKJ6
         MX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677751223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjatsIL5XK1QQSQeDPGE4hkKEq8N3SCj7VakQ0NSqR4=;
        b=gbQrpJV4R2FrlhgYHD24vLbqPi5juOCZCEP/buc5dWwQ2qkRanA3dR3ArdXvyKY6mO
         +O6gTI+4WJKdZZvsW8BhsD374bV53RfBU1YfK7SKL8RSWIfZs9kGt4ZNCZZTuja2uSUL
         U0SEP9HaXakLVz2s0Tix2kxiInJm5bYpzchDD+nyNXNgaToQDCtvODEPl+wGC4C+xzaL
         LOCZSKT1ltC+2woccNQmESwQTuraoTvqqYzjsuhtF8MRfITS6cFy9my1l2ao3rmaQraG
         TfbgNLNT154qnpklb2FrBfifusuSng94ZqHGZeiRQAHgQysksX0FWk5aumfO5C49LLKb
         q9Og==
X-Gm-Message-State: AO0yUKXh8eL9fPgQ7ectSry84mfP3m8HXAnFY2ATCj2lXpYIu1mrwGIf
	fxBYLNm9yp0eOCGpti0As7I84Q==
X-Google-Smtp-Source: AK7set/CkJN9ffHE13FKP+VJpVHJ02VAHrAXz8N5LmAg/BmaZS6Y4p/fBx2ye/D55AcGQcIeL/RfNg==
X-Received: by 2002:adf:ce82:0:b0:2cb:85ba:24f9 with SMTP id r2-20020adfce82000000b002cb85ba24f9mr5152414wrn.66.1677751223633;
        Thu, 02 Mar 2023 02:00:23 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g9-20020a056000118900b002c794495f6fsm14428724wrx.117.2023.03.02.02.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 02:00:23 -0800 (PST)
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
Subject: [PATCH v4 24/24] s390: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:39 +0100
Message-Id: <20230302093539.372962-25-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_020025_282279_E0DC6425 
X-CRM114-Status: GOOD (  11.57  )
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
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IEhlaWtvIENh
cnN0ZW5zIDxoY2FAbGludXguaWJtLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL3MzOTAvaW5jbHVkZS9hc20vc2V0
dXAuaCAgICAgIHwgMSAtCiBhcmNoL3MzOTAvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oIHwgMSAt
CiAyIGZpbGVzIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgYXJj
aC9zMzkwL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAoKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9p
bmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3NldHVwLmgKaW5kZXgg
MTc3YmY2ZGVhYTI3Li45OWMxY2M5NzM1MGEgMTAwNjQ0Ci0tLSBhL2FyY2gvczM5MC9pbmNsdWRl
L2FzbS9zZXR1cC5oCisrKyBiL2FyY2gvczM5MC9pbmNsdWRlL2FzbS9zZXR1cC5oCkBAIC03LDcg
KzcsNiBAQAogI2RlZmluZSBfQVNNX1MzOTBfU0VUVVBfSAogCiAjaW5jbHVkZSA8bGludXgvYml0
cy5oPgotI2luY2x1ZGUgPHVhcGkvYXNtL3NldHVwLmg+CiAjaW5jbHVkZSA8bGludXgvYnVpbGRf
YnVnLmg+CiAKICNkZWZpbmUgUEFSTUFSRUEJCTB4MTA0MDAKZGlmZiAtLWdpdCBhL2FyY2gvczM5
MC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL3MzOTAvaW5jbHVkZS91YXBpL2FzbS9z
ZXR1cC5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1OThkNzY5ZTc2ZGYuLjAwMDAw
MDAwMDAwMAotLS0gYS9hcmNoL3MzOTAvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCisrKyAvZGV2
L251bGwKQEAgLTEgKzAsMCBAQAotLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
V0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlz
dApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
