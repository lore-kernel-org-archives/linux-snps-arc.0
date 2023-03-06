Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF0AC6FD19
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KliMgNpSRXd7Pos+due9biHzbZQQX3dD1Dub05CDNJg=; b=fbYCBU9MQ1xQyc
	6usswW/C+R5Rt8Yit5ME6yYzFDdCvSNgZFdAtOJWhKoN4TFzTMZ2VZxj3mbEmvr2R7BACJ3TScDaN
	Wt9AyU7umvi3uxzT+SmmD1fFHCwEk9i194mDReAJq8jH0G3dA73JX2p4aMrebWAN+1mQSq9EkVuGt
	MzmhzvGizao4Sbvh9k1leoGhQ03BDCE/f+VhgMlzbqeUbx6iE/YDVvS+Arsy5vMNwcDc3wSzLHTtq
	xNo//2oly4w8I3gmGQMfZUqAbISWZlVMLinBqEcisCHwyhaMo889syMpcxQBCs10AHN+gVOzj8InA
	gJriGOoalYiZF1NoJD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7kL-00CDtL-Qm; Mon, 06 Mar 2023 10:07:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7k1-00CDnL-VZ
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:06:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bw19so8142468wrb.13
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvcuE3NOD15vbspLQ8i+J1fU+muK56CBG8DLmUrfpXo=;
        b=GzMxr2yRyn0pUrItv7OQBxxlp7MvVuswU+fzM1LMzGFbYRZuR5wh9SVD334RTDZGAW
         48MUaqgcpAf2R+uUEUeOUuluXFdYq6etu7QIB4iz7yjZxaU9h0eBsUJqiH27IKG5Dvx2
         Nxfgu2m/Z0YLZvmYF4EC+rac6DkSXECFqI32UFqa1g1sBiEcr+UZFNNYTPhtQULlrVTN
         YhwU2VOjKYo21s/2wh1Rg/PC6i/jPfxPzxtT1FpSUglSki/BEpLby0k7NyJEdSkcHXV5
         IJ/y15DnIJ5IbmKM21jaTQOBzpt7dTEQ68G3ILKQAvzhDrPvTGAKu0ykHMvPHxDrcfTg
         UKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvcuE3NOD15vbspLQ8i+J1fU+muK56CBG8DLmUrfpXo=;
        b=eT7YJq0ikg8OQwt7NhIrkAiS+7W+emWUG16A8G8Xil8GyLG2V2AnYfuBgHFP23IAjx
         whJavyj5dtULgN4QQuIEQ7bwhVfM/pkfHuk5KkP/kEMjJyN6+6rswHFfBkLKVSgKAzbk
         dTAfpkiq1rZbFY2T46coeX6/aem1gE4IVpOuR1owWntpgHN2KtWxQzlWhwXqbW+I26aZ
         4guTB3z4goS4femM1ZZtvFTaRBePUA/MMGczIEbm2MBmbdGBwo0S4ZiHm/PE7ZI0ts4I
         LEy9KDX6yP+/Kg0/cl0ZrNUsxoDzqN2O7KFhba6zN79V7kvU4foA3W8q5mC6bvVnzao5
         w+8w==
X-Gm-Message-State: AO0yUKW1CkMiHL67oOrpYaEWiNYDQvLZd1wlrRq2ODNhF4qKZdTTUIeA
	t8Wgwak6tB3A2lDs5rbsRhnDOA==
X-Google-Smtp-Source: AK7set8I9B88OKBP6atULLTLf+lVGQejvnuz60ddU68PPN7BboGVQ7x9xON9rTOBbgBH8tLFC+u3iw==
X-Received: by 2002:adf:da42:0:b0:2c7:16c3:175e with SMTP id r2-20020adfda42000000b002c716c3175emr6451817wrl.64.1678097206117;
        Mon, 06 Mar 2023 02:06:46 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e17-20020a5d4e91000000b002c559626a50sm9596269wru.13.2023.03.06.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:06:45 -0800 (PST)
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
Subject: [PATCH v5 01/26] alpha: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:43 +0100
Message-Id: <20230306100508.1171812-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_020650_020333_537379E3 
X-CRM114-Status: GOOD (  13.70  )
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
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gvYWxwaGEvaW5jbHVkZS9hc20v
c2V0dXAuaCAgICAgIHwgNCArKy0tCiBhcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAu
aCB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gvYWxw
aGEvaW5jbHVkZS9hc20vc2V0dXAuaAppbmRleCAyNjJhYWI5OWUzOTEuLmVhMDhjYTQ1ZWZhOCAx
MDA2NDQKLS0tIGEvYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9zZXR1cC5oCisrKyBiL2FyY2gvYWxw
aGEvaW5jbHVkZS9hc20vc2V0dXAuaApAQCAtMiw4ICsyLDYgQEAKICNpZm5kZWYgX19BTFBIQV9T
RVRVUF9ICiAjZGVmaW5lIF9fQUxQSEFfU0VUVVBfSAogCi0jaW5jbHVkZSA8dWFwaS9hc20vc2V0
dXAuaD4KLQogLyoKICAqIFdlIGxlYXZlIG9uZSBwYWdlIGZvciB0aGUgaW5pdGlhbCBzdGFjayBw
YWdlLCBhbmQgb25lIHBhZ2UgZm9yCiAgKiB0aGUgaW5pdGlhbCBwcm9jZXNzIHN0cnVjdHVyZS4g
QWxzbywgdGhlIGNvbnNvbGUgZWF0cyAzIE1CIGZvcgpAQCAtMTQsNiArMTIsOCBAQAogLyogUmVt
b3ZlIHdoZW4gb2ZmaWNpYWwgTUlMTyBzb3VyY2VzIGhhdmUgRUxGIHN1cHBvcnQ6ICovCiAjZGVm
aW5lIEJPT1RfU0laRQkoMTYqMTAyNCkKIAorI2RlZmluZSBDT01NQU5EX0xJTkVfU0laRQkyNTYK
KwogI2lmZGVmIENPTkZJR19BTFBIQV9MRUdBQ1lfU1RBUlRfQUREUkVTUwogI2RlZmluZSBLRVJO
RUxfU1RBUlRfUEhZUwkweDMwMDAwMCAvKiBPbGQgYm9vdGxvYWRlcnMgaGFyZGNvZGVkIHRoaXMu
ICAqLwogI2Vsc2UKZGlmZiAtLWdpdCBhL2FyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9zZXR1
cC5oIGIvYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKaW5kZXggZjg4MWVhNTk0
N2NiLi45YjNiNWJhMzliMWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2Fz
bS9zZXR1cC5oCisrKyBiL2FyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCkBAIC0y
LDYgKzIsNCBAQAogI2lmbmRlZiBfVUFQSV9fQUxQSEFfU0VUVVBfSAogI2RlZmluZSBfVUFQSV9f
QUxQSEFfU0VUVVBfSAogCi0jZGVmaW5lIENPTU1BTkRfTElORV9TSVpFCTI1NgotCiAjZW5kaWYg
LyogX1VBUElfX0FMUEhBX1NFVFVQX0ggKi8KLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlz
dApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
