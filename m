Return-Path: <SRS0=9+m5=JC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF55C43470
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71C0A61284
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71C0A61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iYCYUtywnA/16uVe/67e/hjDZ72ltxDsUCElou6q8eM=; b=fzMmgbw0xCYFvj2TnenfWRE0i
	klBMAkGfxt0/Xt25JuAZ0TzSRfsD2Lyku3aC3A84sqe9h4Ub6/Eqtz09wsrCp3NDi+L9zU1aG1MM4
	vdXjTAniGlluMItYr0NAvwTTFAx5HYNrrhLlDxfH4VlJeoFUYtsGjBGXCX5AOnm5udSER7af9YwaJ
	6TGZfszUhqMpjbZE3qUPhxYiJoLWQB+uCs8E0/6+FogXcY+HchqHjpRGRUMaqakEE9ke+tpiY4Dl+
	77olm/5YWKlSmxYh12bZ5XH3V6hLQNopzJQEyqshjRBZA30nPalQip6ngmmS4bcpkfOnupXkeZcBX
	JmvELGvgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTQHW-00HPjS-V4; Mon, 05 Apr 2021 14:32:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTQHO-00HPfw-V1
 for linux-snps-arc@lists.infradead.org; Mon, 05 Apr 2021 14:32:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id c8so11088780wrq.11
 for <linux-snps-arc@lists.infradead.org>; Mon, 05 Apr 2021 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/CiqD1jKFEEZvgY8njcTGUel/aa04reDhz3I6YJxos=;
 b=mRUfwWytSNw4LIrLbTivilJQxwVt6Kdsff71C2K3caUhoB6DzQhNNkK6JD8yBoLH7q
 dHSKrpuwAFQP0uGjsUKKho4SiUC6avgBq3sYV+Jz5/WglVKfwNfCR2fvHfDTdNXRXTHp
 InDUJyBUZ1KfrtQ+NU9evuxlAo9vTkhQ8t2m5W/rmFrBGiXEtLZnPmDPvCRc9DnhUAhy
 hf+n2cxQao0wQE2TOqJqtE7NWdGwtVW9rT3b3OUf9tW1e7hu/oI3/NaJKgvH4S+E5f3N
 NYDMKpQMBdwRQZmk7lNNAwABX164Okx8OTQCTc2qbricTP9KARchA5aJIG65yX2LLljH
 ssuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/CiqD1jKFEEZvgY8njcTGUel/aa04reDhz3I6YJxos=;
 b=ajEdvcxaciqub1SeIrZCQet5IWf5ZQMbr8X1gMVmuQSfIbKx4NPUrQObNdZPWe85os
 PLeUqzcDcQ8KW5ib1Dj+RCbWAxLRnD3PlCvHbqM7KezmRsCRPLNRogQmfFD0aSEfXxYz
 HADntpC4xyo6zMj4NHaohCuPWXkzDnx8HVWObt+l882cly6BFnfxypsQkttLOflDhCXP
 jhzWOqnQZbwEEXj3JzmLRpgtr7JgaAqmn6ym4xdURQhAWW6R3Q5JnGxVs1p/79ElAl7t
 gjAgnhC4OTqgBYAllxH9foHuJNFb5OwEkTICyM4IMTvcNPmN9i7ZbV3ILM0sL0TLmuj6
 W98A==
X-Gm-Message-State: AOAM530LKB/ffIoMr/4j7FD5cVi6XfjE/iBRKzY9Qx5LIqQd+rIx/RQt
 HIXcWt6PEzyZdUBdFDl9qL0=
X-Google-Smtp-Source: ABdhPJzX5m7yWTlqKJTgAjo5zwueLdHolpcWLTkQEQPSFNnkxhpZq/kphn+5ohbCHeRUiQJQI+MytA==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr29860682wrz.77.1617633158360; 
 Mon, 05 Apr 2021 07:32:38 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:37 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Cc: linux-snps-arc@lists.infradead.org, claziss@synopsys.com,
 shahab@synopsys.com, cmiranda@synopsys.com
Subject: [PATCH 27/27] arcv3: Add support for ARCv3
Date: Mon,  5 Apr 2021 15:31:38 +0100
Message-Id: <20210405143138.17016-28-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_153239_102008_F6E4A14F 
X-CRM114-Status: GOOD (  14.86  )
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

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 configure                                 | 2 ++
 default-configs/devices/arcv3-softmmu.mak | 7 +++++++
 default-configs/targets/arcv3-softmmu.mak | 3 +++
 include/disas/dis-asm.h                   | 2 ++
 include/elf.h                             | 1 +
 meson.build                               | 3 ++-
 6 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 default-configs/devices/arcv3-softmmu.mak
 create mode 100644 default-configs/targets/arcv3-softmmu.mak

diff --git a/configure b/configure
index 80d993fac7..cec3199434 100755
--- a/configure
+++ b/configure
@@ -682,6 +682,8 @@ elif check_define __aarch64__ ; then
   cpu="aarch64"
 elif check_define __arc__ ; then
   cpu="arc"
+elif check_define __arc64__ ; then
+  cpu="arc64"
 else
   cpu=$(uname -m)
 fi
diff --git a/default-configs/devices/arcv3-softmmu.mak b/default-configs/devices/arcv3-softmmu.mak
new file mode 100644
index 0000000000..0ce4176b2d
--- /dev/null
+++ b/default-configs/devices/arcv3-softmmu.mak
@@ -0,0 +1,7 @@
+# Default configuration for arc-softmmu
+
+CONFIG_SEMIHOSTING=n
+
+# Boards:
+#
+CONFIG_ARC_VIRT=y
diff --git a/default-configs/targets/arcv3-softmmu.mak b/default-configs/targets/arcv3-softmmu.mak
new file mode 100644
index 0000000000..af39b7c34d
--- /dev/null
+++ b/default-configs/targets/arcv3-softmmu.mak
@@ -0,0 +1,3 @@
+TARGET_ARCH=arcv3
+TARGET_BASE_ARCH=arc
+TARGET_XML_FILES= gdb-xml/arc-core-v3.xml gdb-xml/arc64-aux-minimal.xml gdb-xml/arc64-aux-other.xml
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 8a0aa19bc2..15ec34c185 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -214,6 +214,8 @@ enum bfd_architecture
 #define bfd_mach_arc_arcv2     5
 #define bfd_mach_arc_arcv2em   6
 #define bfd_mach_arc_arcv2hs   7
+#define bfd_mach_arcv3_64      0x10
+#define bfd_mach_arcv3_32      0x20
   bfd_arch_m32r,       /* Mitsubishi M32R/D */
 #define bfd_mach_m32r          0  /* backwards compatibility */
   bfd_arch_mn10200,    /* Matsushita MN10200 */
diff --git a/include/elf.h b/include/elf.h
index 8c7c4ab8a9..14643f4c17 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -210,6 +210,7 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_ARC_COMPACT  93  /* Synopsys ARCompact */
 #define EM_ARC_COMPACT2 195 /* Synopsys ARCompact V2 */
+#define EM_ARC_COMPACT3_64 253 /* Synopsys ARCompact V3 ARC64 */
 
 #define EM_MOXIE           223     /* Moxie processor family */
 #define EM_MOXIE_OLD       0xFEED
diff --git a/meson.build b/meson.build
index a25425022e..5290ad9939 100644
--- a/meson.build
+++ b/meson.build
@@ -57,7 +57,7 @@ python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'sparc64', 'riscv32', 'riscv64', 'x86', 'x86_64',
-  'arc', 'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+  'arc', 'arc64', 'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
 targetos = host_machine.system()
@@ -1191,6 +1191,7 @@ config_target_mak = {}
 disassemblers = {
   'alpha' : ['CONFIG_ALPHA_DIS'],
   'arc' : ['CONFIG_ARC_DIS'],
+  'arc64' : ['CONFIG_ARC_DIS'],
   'arm' : ['CONFIG_ARM_DIS'],
   'avr' : ['CONFIG_AVR_DIS'],
   'cris' : ['CONFIG_CRIS_DIS'],
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
