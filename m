Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F99C678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcHTawehqabMhaQ3/469cvPwRtzZxv14DaPYBmQvXFY=; b=O86E2R6ZxB+gSr
	yNzVeXqMzwKBya40xFOb6W300Fh1YgzKk7yeSePT0Ep51V+yOSwz4zl2J+kpUt/dZ0yv0ZlmBV0S4
	w5J/vlhE7xddN1mJq35hei5hJ4LeaATe/5gXLCYo0dWUzTO0LuVvlK4dvgV2IZQdUHSjT6K5SvUNp
	c4rWQVmQqsZ46GMJqUFzdSEKlwzYjjgRg2MlxxVg45s0tjHUw5+GsNL9fomgk8orXFGyBzfCf+7hE
	0qQufZ6cekR3ujVdYs+JK94bbGtgWPFk98xNkyBLJQkZfvggaPjuaaIU8ePHjOUlJzGqecGkv7haV
	74BgfSiAabJLxusYGrRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7q2-00CFjN-Ue; Mon, 06 Mar 2023 10:13:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7py-00CFgq-88
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:13:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id v16so8250776wrn.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpWo932tuk1D2POoIh3SqR6//enYEECaor8dEe11NsU=;
        b=vhZCFKWfGvUSFsDhwWjJlH3hyhWGt7HLROOh778mTjNL4gufsnGp53NJud40dToGnL
         8qeC6NM2iT55IerKG49oK2vLQT27iAmsasr2ot41mlOSG5YUL8p/DoV2zIOqsjUJN70B
         iUNvLxug4rs0TE8uXJSZn2y/hL+ydY2fsar06hmtO2Uh2XPxMhySCU9kPXtTJmyZZJcH
         r9474lsQdRJ0C1FBrn3WG5vVYQBWXu1Jdki7lFNTTENCldpadEIDTXWSqH1uoKwoJR9g
         2LLGa0YGt4DGUA5hFaNPatUSHD4DOzvgtiIvwoB1Z6VTUA6hmBwFZHLc3uL05jusP5nK
         Sjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpWo932tuk1D2POoIh3SqR6//enYEECaor8dEe11NsU=;
        b=i5Mz3ayUqN1aldqlbQwDabFwyHTTSPfMtKAdDBvCe5C/bwa+4KJDeRkJc+1VkuedaG
         yvUTEKJeNG+3sQnuO3XXOJy3U6DzS2q6KrlIyL/39pBcnGRVppLvh/fzKt/NawgEnoow
         P+09lCGf85oDwS/N5sRsVAFIr/2y351/Gk5KfoqQJlvsGz/8Q7E8aBgVd34EdSWVE1/X
         48A5P6mcvGJ4noiSKEh8Ib8MicRr7vGwkm558zi4hTttdu0EYf7Q0AsxRefDbm8xQokc
         l8jUQ36zn7lfUftnDtKB1ZyBbeXw+hdkUWnqBW26nv4FLZH0oHoNo0tFffSQ+IQlzLOy
         9O3w==
X-Gm-Message-State: AO0yUKVwD+0t5cZOr450OKahLnIT87S/9MFZXgy1EyPUOqefQm+in5H+
	D9ebVoTZ6RBzkwdS6nM9mDbP2g==
X-Google-Smtp-Source: AK7set+31TNEuPO6s3cfa55rRLYq6o+G/3pR5nmNea15dX1hG89weq3ojmUgEkCYiX0LzcBMJ05hsg==
X-Received: by 2002:a05:6000:110f:b0:2cb:5f2a:274e with SMTP id z15-20020a056000110f00b002cb5f2a274emr6011928wrw.41.1678097576202;
        Mon, 06 Mar 2023 02:12:56 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u18-20020a5d6ad2000000b002c5539171d1sm9171191wrw.41.2023.03.06.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:12:56 -0800 (PST)
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
Subject: [PATCH v5 07/26] mips: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:49 +0100
Message-Id: <20230306100508.1171812-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_021258_302429_F9F566E6 
X-CRM114-Status: GOOD (  12.47  )
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
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9z
ZXR1cC5oICAgICAgfCAzICsrLQogYXJjaC9taXBzL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCB8
IDMgLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gvbWlwcy9p
bmNsdWRlL2FzbS9zZXR1cC5oCmluZGV4IDhjNTZiODYyZmQ5Yy4uYTEzYjkyNTliNDc2IDEwMDY0
NAotLS0gYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL21pcHMvaW5j
bHVkZS9hc20vc2V0dXAuaApAQCAtMyw3ICszLDggQEAKICNkZWZpbmUgX01JUFNfU0VUVVBfSAog
CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KLSNpbmNsdWRlIDx1YXBpL2FzbS9zZXR1cC5oPgor
CisjZGVmaW5lIENPTU1BTkRfTElORV9TSVpFCTQwOTYKIAogZXh0ZXJuIHZvaWQgcHJvbV9wdXRj
aGFyKGNoYXIpOwogZXh0ZXJuIHZvaWQgc2V0dXBfZWFybHlfcHJpbnRrKHZvaWQpOwpkaWZmIC0t
Z2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gvbWlwcy9pbmNs
dWRlL3VhcGkvYXNtL3NldHVwLmgKaW5kZXggN2Q0OGM0MzNiMGMyLi4xNTdjM2MzOTJmYjQgMTAw
NjQ0Ci0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKKysrIGIvYXJjaC9t
aXBzL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaApAQCAtMiw3ICsyLDQgQEAKICNpZm5kZWYgX1VB
UElfTUlQU19TRVRVUF9ICiAjZGVmaW5lIF9VQVBJX01JUFNfU0VUVVBfSAogCi0jZGVmaW5lIENP
TU1BTkRfTElORV9TSVpFCTQwOTYKLQotCiAjZW5kaWYgLyogX1VBUElfTUlQU19TRVRVUF9IICov
Ci0tIAoyLjM3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
