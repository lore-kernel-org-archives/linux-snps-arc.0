Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8124BC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Jul 2022 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzqStfTR8WEXrRGPo8737IkP8/WIz/wi93KLebuTfOw=; b=p92uhTLJh/i3Sa
	zVr356hehV5BoDTff5uUMhiETYXgsFGCj9bJijy9VN9nNsAKo3bu6wK+vPp2YIAwPI1LOpvaXUU9h
	zR6RfDwQW0zAUWvYCibRx1eJLOv/bXcsH+MQI22Dgl7+8IAPVN1CgLhrftvkvmQnsBptxpf/TlK/5
	ClFToD19H7VQg1MnZ3LDszXua2hfAKo6efqCgMdEDlSvl70QfNoaOFFt45wmEIAhLeUgROx64yqfG
	6ryad05nK5ZiIXZiJcpgKM3tJckDrQ2VQ3LymAqrEiFTP9lk822vYfBHxXoQuJhhgmOVaI0F6PBZs
	FJaQhiuxuWGXBUMi7/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9ch-005uuI-U8; Wed, 20 Jul 2022 13:20:19 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9cc-005umE-Rd; Wed, 20 Jul 2022 13:20:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id b10so6825242pjq.5;
        Wed, 20 Jul 2022 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=viMw9/WTCElOuBUWgf7y4efjBc9bSEZC5gRpiB67wHA=;
        b=ODQJItJIjIcY+Sr2KKC8dO9/zeuhSv2tY8GW3dktPurnoZJCKp+i7iI1SU9Q3jd3Un
         UoZtPuf9SRGvoelVz5lZX7O/FeDG6IxwZAMc4xEoHFpk2tZEBQS4t/32vYBQUFtoxSEc
         5cU+bKe2AtGzjMQOdTJFmexjPZ0ecAD5lvwk9hXxUVGmGLaznCnUhictw/XcPXJ6bLtP
         7FNJquxd21uXEIAEpeZfYD3EErxqfR8NEeDjVl8Ib8xbrhtGPLqLxetAqY8JC67+gE35
         la/7T3F9QpyBp3Pie19V6Xfq7mUwJtZWZPYCTJ7T8ZxMuy3kdfESTvpmiBWFu16Vqp4c
         e+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=viMw9/WTCElOuBUWgf7y4efjBc9bSEZC5gRpiB67wHA=;
        b=e2uuTzTDZIo77h5GRkxKNirt8wpkBEYTdvrXE2DsVGAysAAEYzDlW7zGS8/OHm1GXN
         g0/YBIPa3XHOUmuSwuzc+NFqDQWZmffMwVaBQS7z8nQxaFw25jVSjOyGfTR1aHZq2WN7
         IAsyvOlRhFdxlRnFJZgEI2F8yJh8Bhn7CDRt1IYPEwW/mojDcD11QDe4h31X5JpZF8+I
         WQqpo+AlWsu5Foj8lO3ubJh3tZtgIcIh0aYImmbvZtJQ2bjCQTQJTT9Yr77Scmq4Mf/N
         sfM7yNFAcXx40iL6yPxXsTiPSLQV/eiVaVvQ5XyKB5qkb4SU+8/n6XuiP9+uQn4b2L7/
         QpwA==
X-Gm-Message-State: AJIora9/faShxFApD9XWPFEgBAn3qO+wU9qAkp6DTfFHFPmQ6q42FTAp
	YyXNdOgyvKfnCiXtojiUKoo=
X-Google-Smtp-Source: AGRyM1tznMi0rwyojxcc5hKSLPNG2zRBg1G+NM3iLDF3ShK8qTbbM/YxhsBkv2iX41kZ+cYsVcOqRA==
X-Received: by 2002:a17:902:ceca:b0:16d:26ed:6f12 with SMTP id d10-20020a170902ceca00b0016d26ed6f12mr1681994plg.33.1658323211837;
        Wed, 20 Jul 2022 06:20:11 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id cp12-20020a170902e78c00b0016be6e954e8sm13889176plb.68.2022.07.20.06.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:20:11 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stafford Horne <shorne@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Richard Henderson <rth@twiddle.net>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v4 2/3] PCI: Move isa_dma_bridge_buggy out of dma.h
Date: Wed, 20 Jul 2022 22:19:33 +0900
Message-Id: <20220720131934.373932-3-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720131934.373932-1-shorne@gmail.com>
References: <20220720131934.373932-1-shorne@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_062014_934261_C2CE02A1 
X-CRM114-Status: GOOD (  25.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

During recent PCI cleanups we noticed that the isa_dma_bridge_buggy
symbol supported by all architectures is actually only used for x86_32.

This patch moves the symbol out of all architectures limiting usage to
only x86_32.  This is possible because only x86_32 platforms or quirks
existing in PCI devices supported on x86_32 ever set this.  A new global
header linux/isa-dma.h is added to provide a common place to maintain
the definition.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v3:
 - New patch.

 arch/alpha/include/asm/dma.h           |  9 ---------
 arch/arc/include/asm/dma.h             |  5 -----
 arch/arm/include/asm/dma.h             |  6 ------
 arch/ia64/include/asm/dma.h            |  2 --
 arch/m68k/include/asm/dma.h            |  6 ------
 arch/microblaze/include/asm/dma.h      |  6 ------
 arch/mips/include/asm/dma.h            |  8 --------
 arch/parisc/include/asm/dma.h          |  6 ------
 arch/powerpc/include/asm/dma.h         |  6 ------
 arch/s390/include/asm/dma.h            |  6 ------
 arch/sh/include/asm/dma.h              |  6 ------
 arch/sparc/include/asm/dma.h           |  8 --------
 arch/x86/include/asm/dma.h             |  8 --------
 arch/xtensa/include/asm/dma.h          |  7 -------
 drivers/comedi/drivers/comedi_isadma.c |  2 +-
 drivers/pci/pci.c                      |  2 ++
 drivers/pci/quirks.c                   |  4 +++-
 include/linux/isa-dma.h                | 14 ++++++++++++++
 sound/core/isadma.c                    |  2 +-
 19 files changed, 21 insertions(+), 92 deletions(-)
 create mode 100644 include/linux/isa-dma.h

diff --git a/arch/alpha/include/asm/dma.h b/arch/alpha/include/asm/dma.h
index 28610ea7786d..a04d76b96089 100644
--- a/arch/alpha/include/asm/dma.h
+++ b/arch/alpha/include/asm/dma.h
@@ -365,13 +365,4 @@ extern void free_dma(unsigned int dmanr);	/* release it again */
 #define KERNEL_HAVE_CHECK_DMA
 extern int check_dma(unsigned int dmanr);
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
-
 #endif /* _ASM_DMA_H */
diff --git a/arch/arc/include/asm/dma.h b/arch/arc/include/asm/dma.h
index 5b744f4b10a7..02431027ed2f 100644
--- a/arch/arc/include/asm/dma.h
+++ b/arch/arc/include/asm/dma.h
@@ -7,10 +7,5 @@
 #define ASM_ARC_DMA_H
 
 #define MAX_DMA_ADDRESS 0xC0000000
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	0
-#endif
 
 #endif
diff --git a/arch/arm/include/asm/dma.h b/arch/arm/include/asm/dma.h
index a81dda65c576..907d139be431 100644
--- a/arch/arm/include/asm/dma.h
+++ b/arch/arm/include/asm/dma.h
@@ -143,10 +143,4 @@ extern int  get_dma_residue(unsigned int chan);
 
 #endif /* CONFIG_ISA_DMA_API */
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy    (0)
-#endif
-
 #endif /* __ASM_ARM_DMA_H */
diff --git a/arch/ia64/include/asm/dma.h b/arch/ia64/include/asm/dma.h
index 59625e9c1f9c..eaed2626ffda 100644
--- a/arch/ia64/include/asm/dma.h
+++ b/arch/ia64/include/asm/dma.h
@@ -12,8 +12,6 @@
 
 extern unsigned long MAX_DMA_ADDRESS;
 
-extern int isa_dma_bridge_buggy;
-
 #define free_dma(x)
 
 #endif /* _ASM_IA64_DMA_H */
diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index f6c5e0dfb4e5..1c8d9c5bc2fa 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -6,10 +6,4 @@
    bootmem allocator (but this should do it for this) */
 #define MAX_DMA_ADDRESS PAGE_OFFSET
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy    (0)
-#endif
-
 #endif /* _M68K_DMA_H */
diff --git a/arch/microblaze/include/asm/dma.h b/arch/microblaze/include/asm/dma.h
index f801582be912..7484c9eb66c4 100644
--- a/arch/microblaze/include/asm/dma.h
+++ b/arch/microblaze/include/asm/dma.h
@@ -9,10 +9,4 @@
 /* Virtual address corresponding to last available physical memory address.  */
 #define MAX_DMA_ADDRESS (CONFIG_KERNEL_START + memory_size - 1)
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy     (0)
-#endif
-
 #endif /* _ASM_MICROBLAZE_DMA_H */
diff --git a/arch/mips/include/asm/dma.h b/arch/mips/include/asm/dma.h
index be726b943530..d6186e6bea7e 100644
--- a/arch/mips/include/asm/dma.h
+++ b/arch/mips/include/asm/dma.h
@@ -307,12 +307,4 @@ static __inline__ int get_dma_residue(unsigned int dmanr)
 extern int request_dma(unsigned int dmanr, const char * device_id);	/* reserve a DMA channel */
 extern void free_dma(unsigned int dmanr);	/* release it again */
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* _ASM_DMA_H */
diff --git a/arch/parisc/include/asm/dma.h b/arch/parisc/include/asm/dma.h
index eea80ed34e6d..9e8c101de902 100644
--- a/arch/parisc/include/asm/dma.h
+++ b/arch/parisc/include/asm/dma.h
@@ -176,10 +176,4 @@ static __inline__ void set_dma_count(unsigned int dmanr, unsigned int count)
 
 #define free_dma(dmanr)
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
 #endif /* _ASM_DMA_H */
diff --git a/arch/powerpc/include/asm/dma.h b/arch/powerpc/include/asm/dma.h
index 6161a9596196..d97c66d9ae34 100644
--- a/arch/powerpc/include/asm/dma.h
+++ b/arch/powerpc/include/asm/dma.h
@@ -340,11 +340,5 @@ extern int request_dma(unsigned int dmanr, const char *device_id);
 /* release it again */
 extern void free_dma(unsigned int dmanr);
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_DMA_H */
diff --git a/arch/s390/include/asm/dma.h b/arch/s390/include/asm/dma.h
index 6f26f35d4a71..dec1c4ce628c 100644
--- a/arch/s390/include/asm/dma.h
+++ b/arch/s390/include/asm/dma.h
@@ -11,10 +11,4 @@
  */
 #define MAX_DMA_ADDRESS         0x80000000
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* _ASM_S390_DMA_H */
diff --git a/arch/sh/include/asm/dma.h b/arch/sh/include/asm/dma.h
index 17d23ae98c77..c8bee3f985a2 100644
--- a/arch/sh/include/asm/dma.h
+++ b/arch/sh/include/asm/dma.h
@@ -137,10 +137,4 @@ extern int register_chan_caps(const char *dmac, struct dma_chan_caps *capslist);
 extern int dma_create_sysfs_files(struct dma_channel *, struct dma_info *);
 extern void dma_remove_sysfs_files(struct dma_channel *, struct dma_info *);
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* __ASM_SH_DMA_H */
diff --git a/arch/sparc/include/asm/dma.h b/arch/sparc/include/asm/dma.h
index 462e7c794a09..08043f35b110 100644
--- a/arch/sparc/include/asm/dma.h
+++ b/arch/sparc/include/asm/dma.h
@@ -82,14 +82,6 @@
 #define DMA_BURST64      0x40
 #define DMA_BURSTBITS    0x7f
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
 #ifdef CONFIG_SPARC32
 struct device;
 
diff --git a/arch/x86/include/asm/dma.h b/arch/x86/include/asm/dma.h
index 8e95aa4b0d17..8ae6e0e11b8b 100644
--- a/arch/x86/include/asm/dma.h
+++ b/arch/x86/include/asm/dma.h
@@ -307,12 +307,4 @@ extern int request_dma(unsigned int dmanr, const char *device_id);
 extern void free_dma(unsigned int dmanr);
 #endif
 
-/* From PCI */
-
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy	(0)
-#endif
-
 #endif /* _ASM_X86_DMA_H */
diff --git a/arch/xtensa/include/asm/dma.h b/arch/xtensa/include/asm/dma.h
index bb099a373b5a..172644539032 100644
--- a/arch/xtensa/include/asm/dma.h
+++ b/arch/xtensa/include/asm/dma.h
@@ -52,11 +52,4 @@
 extern int request_dma(unsigned int dmanr, const char * device_id);
 extern void free_dma(unsigned int dmanr);
 
-#ifdef CONFIG_PCI
-extern int isa_dma_bridge_buggy;
-#else
-#define isa_dma_bridge_buggy 	(0)
-#endif
-
-
 #endif
diff --git a/drivers/comedi/drivers/comedi_isadma.c b/drivers/comedi/drivers/comedi_isadma.c
index 700982464c53..020b3d1e1ac0 100644
--- a/drivers/comedi/drivers/comedi_isadma.c
+++ b/drivers/comedi/drivers/comedi_isadma.c
@@ -8,7 +8,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
-#include <asm/dma.h>
+#include <linux/isa-dma.h>
 #include <linux/comedi/comedidev.h>
 #include <linux/comedi/comedi_isadma.h>
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index cfaf40a540a8..60c55d2cb2cc 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -41,8 +41,10 @@ const char *pci_power_names[] = {
 };
 EXPORT_SYMBOL_GPL(pci_power_names);
 
+#ifdef CONFIG_X86_32
 int isa_dma_bridge_buggy;
 EXPORT_SYMBOL(isa_dma_bridge_buggy);
+#endif
 
 int pci_pci_problems;
 EXPORT_SYMBOL(pci_pci_problems);
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 41aeaa235132..6fc64509eee7 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/pci.h>
+#include <linux/isa-dma.h> /* isa_dma_bridge_buggy */
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/acpi.h>
@@ -30,7 +31,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
 #include <linux/switchtec.h>
-#include <asm/dma.h>	/* isa_dma_bridge_buggy */
 #include "pci.h"
 
 static ktime_t fixup_debug_start(struct pci_dev *dev,
@@ -239,6 +239,7 @@ static void quirk_passive_release(struct pci_dev *dev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82441,	quirk_passive_release);
 DECLARE_PCI_FIXUP_RESUME(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82441,	quirk_passive_release);
 
+#ifdef CONFIG_X86_32
 /*
  * The VIA VP2/VP3/MVP3 seem to have some 'features'. There may be a
  * workaround but VIA don't answer queries. If you happen to have good
@@ -265,6 +266,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AL,	PCI_DEVICE_ID_AL_M1533,		quirk_isa_dma
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_1,	quirk_isa_dma_hangs);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_2,	quirk_isa_dma_hangs);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC,	PCI_DEVICE_ID_NEC_CBUS_3,	quirk_isa_dma_hangs);
+#endif
 
 /*
  * Intel NM10 "TigerPoint" LPC PM1a_STS.BM_STS must be clear
diff --git a/include/linux/isa-dma.h b/include/linux/isa-dma.h
new file mode 100644
index 000000000000..61504a8c1b9e
--- /dev/null
+++ b/include/linux/isa-dma.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_ISA_DMA_H
+#define __LINUX_ISA_DMA_H
+
+#include <asm/dma.h>
+
+#if defined(CONFIG_PCI) && defined(CONFIG_X86_32)
+extern int isa_dma_bridge_buggy;
+#else
+#define isa_dma_bridge_buggy	(0)
+#endif
+
+#endif /* __LINUX_ISA_DMA_H */
diff --git a/sound/core/isadma.c b/sound/core/isadma.c
index 1f45ede023b4..18a86212e3a8 100644
--- a/sound/core/isadma.c
+++ b/sound/core/isadma.c
@@ -12,8 +12,8 @@
 #undef HAVE_REALLY_SLOW_DMA_CONTROLLER
 
 #include <linux/export.h>
+#include <linux/isa-dma.h>
 #include <sound/core.h>
-#include <asm/dma.h>
 
 /**
  * snd_dma_program - program an ISA DMA transfer
-- 
2.36.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
