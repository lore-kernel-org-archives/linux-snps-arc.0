Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B6AC678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1JJTB1iEE3QSh2SL5wOROYCgekc++T7caqkZ4goc2A=; b=OwJktoaCOEKLcL
	wrp04Sij6IO2Vu3nYFlgaDlqgqpN3LZzmU4rLtSDlkjrjUeWhNkV0Z18kLQkY5t233okIfw52Zd3p
	AuRrXBXI8JvzTr5CA/t+i9bw4n5zxEtOwKTSNTVpneuJF5xO2QO+iTQXyh9XWorbeaxOss9ZOQN6L
	LqcjhK4fD1h2nLc5nRVn1fGUbGqO55kVkpSvpL8wHLW84lGep4TcjraruguZhXb5FMjcoyNfAaiRo
	QPbaTWFHd1UutbjtvtYQCB0U/QcMORwbExFzWnERE6bAVzOPARMqDh+L3F33h3hN0JVqjAruMNzOd
	Zrsua3YPWXZq5aKQ9HDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ83w-00CJQQ-Pr; Mon, 06 Mar 2023 10:27:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ83t-00CJP5-LO
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:27:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id f11so8229301wrv.8
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkOpojqO2OnrnjqWakJ/ssyTb7fIeaWwMcDQKKqwZNE=;
        b=2SGZsdegW2cBo8kqTvJjfFIjyiIe3RlAF3Yg2d3PkCw98QBaJe6s+BTqk6sAhk4Ru9
         x7fyYH3R/rrntqQj+20SwCyMBoNiJLiYg4WuOmQwPJL5b+DF3FDm/orSsIYy2QoXBVXd
         Cdzwovn8N6wE2qNxhoW3UDgdtmZP7Nh0XnCmz0czTNkoRdhMmQH5C5i4wPzm0FnSENL2
         yCQ8iTsDqS3+6TIBvW13lzxa8x1nucKgzziQ/y1owwV6sges+GmrnrvY9v4F/wR0jN9s
         dJNciHWJZZVZZq4DF3TZv9N2W4QxXz9fcom5MmwMFKt9Voj1e11JRoqNawBuW3HhlupR
         GlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkOpojqO2OnrnjqWakJ/ssyTb7fIeaWwMcDQKKqwZNE=;
        b=FiCP6NEY6st3rxRXRafZ4Fkk5yTHB6Q1jmg99L5cEaj13NyoIC+SKywbv5+jEnem3A
         pAOQDejBIg4q52T3PnzzYqAYnZ2mocHlcnkOCHnvkjJU3s+NfVBTxSawR5ZSK44kgJ8g
         JbSarTQMH89wG5dWkWd/jSTBGwycyFwxsjj9j1HmXb+1ljfo1cJxkWDaENUI10Wbk0U8
         pBjkRBCVnKEIdWrIPciSZ5IXd30oWhcY+dl+/1otwt8BvWf6yzFjm0cI+7UbgwzAM4XG
         wW9HDDnpAOlvg1DUBY1UzQhz94CmFqkaqtl2sa4+vPA2yQGbWq8Bmja8U6YVsV5EYymt
         krhg==
X-Gm-Message-State: AO0yUKUzvhYhR3KrrsP7xDqwrk4TmKLK4QAGuVLrYBEke3liPemyYO2o
	5khLZQlGFcqzRcWuPy+W7yi/oA==
X-Google-Smtp-Source: AK7set8g+/98oO5ZP6uqzBMUSmWnh62L8fRNjgLpgkBPpDr7Mkg4SnpC/vtuHWPhO/s9VWytKbeQJQ==
X-Received: by 2002:adf:f483:0:b0:2c7:46f:c410 with SMTP id l3-20020adff483000000b002c7046fc410mr6736693wro.36.1678098439964;
        Mon, 06 Mar 2023 02:27:19 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m5-20020a5d56c5000000b002be505ab59asm9431737wrw.97.2023.03.06.02.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:27:19 -0800 (PST)
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
Subject: [PATCH v5 21/26] x86: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:03 +0100
Message-Id: <20230306100508.1171812-22-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_022721_756546_4813D54D 
X-CRM114-Status: GOOD (  11.07  )
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
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gveDg2L2luY2x1
ZGUvYXNtL3NldHVwLmggICAgICB8IDIgLS0KIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5o
CmluZGV4IGYzN2NiZmY3MzU0Yy4uNDQ5YjUwYTJmMzkwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9zZXR1cC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NldHVwLmgKQEAg
LTIsOCArMiw2IEBACiAjaWZuZGVmIF9BU01fWDg2X1NFVFVQX0gKICNkZWZpbmUgX0FTTV9YODZf
U0VUVVBfSAogCi0jaW5jbHVkZSA8dWFwaS9hc20vc2V0dXAuaD4KLQogI2RlZmluZSBDT01NQU5E
X0xJTkVfU0laRSAyMDQ4CiAKICNpbmNsdWRlIDxsaW51eC9saW5rYWdlLmg+CmRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL3g4Ni9pbmNsdWRlL3Vh
cGkvYXNtL3NldHVwLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDc5YTk2MjZiNTUw
MC4uMDAwMDAwMDAwMDAwCi0tLSBhL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAor
KysgL2Rldi9udWxsCkBAIC0xICswLDAgQEAKLS8qICovCi0tIAoyLjM3LjIKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
