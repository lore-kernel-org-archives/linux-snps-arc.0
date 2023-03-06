Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E5EC61DA4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 10:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sC9SdG5z3OVLSfUnexnDRJBk7bd/E5EW4fWoaELOXPE=; b=Kx0tUUQVQ+mpss
	2bPhxHLJ7YnrDskO+3MCtcE3lub7E+m4sWFigWZ0QN/YYGY/rxZBF9idDwSd/KbG4KRhpzWef47x3
	DTF7Zm9nUy6iQYQwV8ycPYPikQ+ekAaIuBcf6aZ9dQExjwkrHDLf4L6I7+HtkAxb9pOf3yMwSrX+M
	o61i6Kc2H5u6nQlrxBQRAzTngPhGIyYCPr6KIe1CXEqsoZKBU2s1zsxmIEbhv3MOAD0wlE4UKPBCV
	+xsu5S9l3dlq6jk+eysiDvL3YJgRxLhO7MUUSxiG3qZ02I4utUMd6JxLYt9tFDUMMsW3TFxMjwgHs
	mEjcFHqIpU+UgLxTcrQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ82z-00CJ7v-Nc; Mon, 06 Mar 2023 10:26:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ82u-00CJ5L-5Y
	for linux-snps-arc@lists.infradead.org; Mon, 06 Mar 2023 10:26:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bw19so8203029wrb.13
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Mar 2023 02:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Swqwg1ld/osn6FVGiU0tRhJoEIYHACqIeiNcFb5PLI=;
        b=uIfY1NRXzEv+Xx/IYayWVnpzA4exJklrAwIb3ziJrRorM1XluURLNe5sRP/ryqZYpH
         a/ROxZBG/PG3wqXEXFLgmc9IwQJMtJTeJVdZkx9HkTXi3YcloRvI0Ka60lGCZWzAqitd
         s8kb5y1Al5ulup5Y9WUbhZSCqL8VLLE28WkIRRztX5wElA5K0w4aOgqjDYTJquKniuWS
         8YlGMCdIBW0itW/lFwZO+SGXFLtcZlBF8ZuhVhvpM6nHQKyjbreMrzIlhd56H2CyYJX0
         OC/OHVVFh/+iUfAq4Ek70MGaipb61JQEk8RcMhvIfK2xVIBEtu1MYjED6cGdncSMd6/n
         946Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Swqwg1ld/osn6FVGiU0tRhJoEIYHACqIeiNcFb5PLI=;
        b=wNvtnDPxEQLt+UTaAIhT8yP4MdIl3LsWR8iKFJGhFCLvZfHfHt6r7bEVngtJ/K50cm
         22Id3rTcUHGcPqjy44kZlp3lYWP/P5RetJmY+sKFqlss8NvHV+8bXZdN3enw8PHE00GV
         pS0ST/8PEX4bM9O/eGNM9/YHguJ+hIVaz64IvIGDFCNFPx9ta4YxDq9MkfDIcp9guUrn
         QEfm75/NawLyYsgM1Fx2RH253weOFEqb9l5s2Bu8HkVF8mUvtaM0Ni9QsrpogSbE+OZi
         P0zf/VAV2ZYDWz+whWPGU59aoNNPWPMXoRWnrh5nz4fgJKRX6shB1jrxvRaR3bm3FgQX
         NJcQ==
X-Gm-Message-State: AO0yUKV/wSWqOjDrnSABXNtnZmvT0MQFajHp+vpcMBhd/Lvo664byN6N
	kKoDx0G/gAmB4Iyh+DUwYAa+Qw==
X-Google-Smtp-Source: AK7set9U6fM9Xsgv6YkGBRqVzeGSi+gpLiQEhEz2I65vcVv3MM3OWhwJd6wPw1/siNKByhVwY2r8Wg==
X-Received: by 2002:a5d:6148:0:b0:2c5:5335:73f3 with SMTP id y8-20020a5d6148000000b002c5533573f3mr10413383wrt.34.1678098378256;
        Mon, 06 Mar 2023 02:26:18 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z16-20020adfdf90000000b002c707785da4sm9415798wrl.107.2023.03.06.02.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:26:18 -0800 (PST)
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
Subject: [PATCH v5 20/26] parisc: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:02 +0100
Message-Id: <20230306100508.1171812-21-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_022620_214115_F037A44F 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgpBY2tlZC1ieTogSGVsZ2UgRGVs
bGVyIDxkZWxsZXJAZ214LmRlPgotLS0KIGFyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAoKZGlmZiAtLWdp
dCBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gvcGFyaXNjL2lu
Y2x1ZGUvdWFwaS9hc20vc2V0dXAuaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYmZh
ZDg5NDI4ZTQ3Li4wMDAwMDAwMDAwMDAKLS0tIGEvYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2Fz
bS9zZXR1cC5oCisrKyAvZGV2L251bGwKQEAgLTEsNSArMCwwIEBACi0vKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLwotI2lmbmRlZiBf
UEFSSVNDX1NFVFVQX0gKLSNkZWZpbmUgX1BBUklTQ19TRVRVUF9ICi0KLSNlbmRpZiAvKiBfUEFS
SVNDX1NFVFVQX0ggKi8KLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBz
LWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
