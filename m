Return-Path: <SRS0=ZTxI=DH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A773CC4727C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 20:47:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F1422071E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 20:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YoWBLJHs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2nmI33V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F1422071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r9Sfq5AboG33/lPVB074xSD0jIG7nwen2Po7ac49KB4=; b=YoWBLJHsTraUjfzsDYDAUEEMo
	JjQfCBvIkWiNX/UAms1MaC7QrceVa0KtvOwQ0vn/LjOMOU5P8B3UdwdJHH8R//mYLRSOzMDE5jwZU
	T4tbWqErHa3j23D+5i+zOKtF3lCH9R2U348C1LZ9DPhGOV0P8qGAW2R6xYPk13dQumfyc8GOcO2Ci
	qPd7S23MbzHy3h4orAB5JJHG8S8IT8tHPF92MHxMBXJfzygBHUg6Ptcy4OV/eoBep8yBd0pN+exwQ
	C51Y7UGWPHYpJlXsfGuBcqWJnZUdkI7+VQWP9z8n+MoRQ29XmM2aBV+QlVAAQOc4NAh6RLlPNSN7p
	fifUn30sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNj0A-0004ni-Ad; Wed, 30 Sep 2020 20:47:02 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNj00-0004jJ-Jv
 for linux-snps-arc@lists.infradead.org; Wed, 30 Sep 2020 20:46:59 +0000
Received: by mail-wm1-x344.google.com with SMTP id d4so813364wmd.5
 for <linux-snps-arc@lists.infradead.org>; Wed, 30 Sep 2020 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZilmCoTEUwUIRJHegLI6wDNSXk+HaCJru/l+G4hcvQ=;
 b=I2nmI33VYZJUzNi3m5HCCtbYIqg6Nv2Jw9/bpcdnlQbNpscVU2UB8gYQ+l1lfiGlxo
 HMryDwGryJygk/a8KxBpQG6/y6T7R1hWX1KAsIomvn0fs1GvQnKvVfF0WTU6KffUddSb
 aQVsa/7qHSQNBSK2xJepZC5C8NwbXX+7g+szYSzOerSksi+rKWqEuMW+1mx0gjX4b+d7
 3gPwkLS4W45sAZGVEowENymSs8f8gQ6wLY0edmqh1Okk6JyXzbzK1V8/l6DIVDikv0jo
 Pvr2923XO7kLhqKP6t7+JyDqXPxBEzlnf7shum5B5BJgomXFjJkV+z+x/BulI6K8ijXP
 Afhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZilmCoTEUwUIRJHegLI6wDNSXk+HaCJru/l+G4hcvQ=;
 b=nlIzbFVmBk1MZKTBNA4nQBTq0b/QzJBDgiXBB3UTD65Q04VPDFHSQpf9riy0iQVu30
 4PscRb7tmTQ5y5TUPI/3aw5xP8OxrXFAKIDIaAwvVTm3jtQYFbdpIvPws6FzE626U9RB
 RAgOaS5bJnQHdwSHLrxlcZld6f/aYAWLTK6k4GDUO4I0voAUwLo9lUaQmfxAHNGLs2DN
 0SkuR9WM7BuJPX1wOTuLwjqBauGx0XPjl/YZ/H3G2rVw+rs7ny+tfivisHmw+vYDZyYu
 wSptYMrueLieOH84iYGxw244qlSBjwRZEiiQKwIK5KicIxSMGi316113JxfIG8el49qJ
 HhHQ==
X-Gm-Message-State: AOAM5302h9kAqvGQqNcdnmLZXs7R8g8/e7q7cUytk6m5oysRkZE2HE0c
 9WtCn2BxHFs8ymAbEq7ontHZynwG8biiVg==
X-Google-Smtp-Source: ABdhPJwziJuRTyoOoLVNiY8/XlF9OqVsfu6UO8lSSPi+p2Cqt2TcUy/S+UHtCnNZRDRORD7mIqwEeg==
X-Received: by 2002:a1c:7f14:: with SMTP id a20mr4898998wmd.95.1601498811663; 
 Wed, 30 Sep 2020 13:46:51 -0700 (PDT)
Received: from cmiranda-laptop.localdomain ([188.251.240.167])
 by smtp.gmail.com with ESMTPSA id v204sm5310764wmg.20.2020.09.30.13.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 13:46:51 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 13/14] arc: Add support for ARCv2
Date: Wed, 30 Sep 2020 21:46:03 +0100
Message-Id: <20200930204604.20663-14-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930204604.20663-1-cupertinomiranda@gmail.com>
References: <20200930204604.20663-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_164652_715519_B4776643 
X-CRM114-Status: GOOD (  19.36  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Cupertino Miranda <cupertinomiranda@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Shahab Vahedi <shahab@synopsys.com>

Add remaining bits of the Synopsys ARCv2 (EM/HS) support into QEMU,
configure bits, arch_init and configuration files for softmmu (hardware
emulation).

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
 configure                       |  5 +++++
 default-configs/arc-softmmu.mak |  5 +++++
 disas.c                         |  2 ++
 disas/meson.build               |  1 +
 hw/meson.build                  |  1 +
 include/disas/dis-asm.h         | 10 +++++++++-
 include/elf.h                   |  3 +++
 include/exec/poison.h           |  2 ++
 include/sysemu/arch_init.h      |  1 +
 meson.build                     |  3 ++-
 softmmu/arch_init.c             |  2 ++
 target/meson.build              |  1 +
 12 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 default-configs/arc-softmmu.mak

diff --git a/configure b/configure
index ecc8e90e8b..65862d8371 100755
--- a/configure
+++ b/configure
@@ -7570,6 +7570,9 @@ case "$target_name" in
     mttcg="yes"
     TARGET_SYSTBL_ABI=common
   ;;
+  arc)
+    gdb_xml_files="arc-core-v2.xml arc-aux-minimal.xml arc-aux-other.xml"
+  ;;
   arm|armeb)
     TARGET_ARCH=arm
     TARGET_SYSTBL_ABI=common,oabi
@@ -7852,8 +7855,10 @@ DIRS="$DIRS docs docs/interop fsdev scsi"
 DIRS="$DIRS pc-bios/optionrom pc-bios/s390-ccw"
 DIRS="$DIRS roms/seabios"
 DIRS="$DIRS contrib/plugins/"
+#DIRS="$DIRS tests/tcg/arc"
 LINKS="Makefile"
 LINKS="$LINKS tests/tcg/lm32/Makefile"
+#LINKS="$LINKS tests/tcg/arc/Makefile.target"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
diff --git a/default-configs/arc-softmmu.mak b/default-configs/arc-softmmu.mak
new file mode 100644
index 0000000000..4300a90c93
--- /dev/null
+++ b/default-configs/arc-softmmu.mak
@@ -0,0 +1,5 @@
+# Default configuration for arc-softmmu
+
+CONFIG_VIRTIO_MMIO=y
+CONFIG_SERIAL=y
+CONFIG_OPENCORES_ETH=y
diff --git a/disas.c b/disas.c
index c1397d3933..41aabbca63 100644
--- a/disas.c
+++ b/disas.c
@@ -671,6 +671,8 @@ void disas(FILE *out, void *code, unsigned long size, const char *note)
     print_insn = print_insn_s390;
 #elif defined(__hppa__)
     print_insn = print_insn_hppa;
+#elif defined(__arc__)
+    print_insn = print_insn_arc;
 #endif
 
     if (s.info.cap_arch >= 0 && cap_disas_host(&s.info, code, size, note)) {
diff --git a/disas/meson.build b/disas/meson.build
index bde8280c73..47ff300d0f 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -4,6 +4,7 @@ subdir('libvixl')
 common_ss.add(when: 'CONFIG_ALPHA_DIS', if_true: files('alpha.c'))
 common_ss.add(when: 'CONFIG_ARM_A64_DIS', if_true: files('arm-a64.cc'))
 common_ss.add_all(when: 'CONFIG_ARM_A64_DIS', if_true: libvixl_ss)
+common_ss.add(when: 'CONFIG_ARC_DIS', if_true: files('arc.c'))
 common_ss.add(when: 'CONFIG_ARM_DIS', if_true: files('arm.c'))
 common_ss.add(when: 'CONFIG_CRIS_DIS', if_true: files('cris.c'))
 common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
diff --git a/hw/meson.build b/hw/meson.build
index 010de7219c..e2b14a9ed8 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -43,6 +43,7 @@ subdir('xen')
 subdir('xenpv')
 
 subdir('alpha')
+subdir('arc')
 subdir('arm')
 subdir('avr')
 subdir('cris')
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 9856bf7921..621164c510 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -206,7 +206,14 @@ enum bfd_architecture
   bfd_arch_v850,       /* NEC V850 */
 #define bfd_mach_v850          0
   bfd_arch_arc,        /* Argonaut RISC Core */
-#define bfd_mach_arc_base 0
+#define bfd_mach_arc_a4        0
+#define bfd_mach_arc_a5        1
+#define bfd_mach_arc_arc600    2
+#define bfd_mach_arc_arc601    4
+#define bfd_mach_arc_arc700    3
+#define bfd_mach_arc_arcv2     5
+#define bfd_mach_arc_arcv2em   6
+#define bfd_mach_arc_arcv2hs   7
   bfd_arch_m32r,       /* Mitsubishi M32R/D */
 #define bfd_mach_m32r          0  /* backwards compatibility */
   bfd_arch_mn10200,    /* Matsushita MN10200 */
@@ -460,6 +467,7 @@ int print_insn_xtensa           (bfd_vma, disassemble_info*);
 int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
 int print_insn_rx(bfd_vma, disassemble_info *);
+int print_insn_arc              (bfd_vma, disassemble_info*);
 
 #if 0
 /* Fetch the disassembler for a given BFD, if that support is available.  */
diff --git a/include/elf.h b/include/elf.h
index c117a4d1ab..5f6165da37 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -201,6 +201,9 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_TILEGX   191 /* TILE-Gx */
 
+#define EM_ARC_COMPACT  93  /* Synopsys ARCompact */
+#define EM_ARC_COMPACT2 195 /* Synopsys ARCompact V2 */
+
 #define EM_MOXIE           223     /* Moxie processor family */
 #define EM_MOXIE_OLD       0xFEED
 
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 7b9ac361dc..635ccc66a1 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -9,6 +9,7 @@
 #pragma GCC poison TARGET_X86_64
 #pragma GCC poison TARGET_AARCH64
 #pragma GCC poison TARGET_ALPHA
+#pragma GCC poison TARGET_ARC
 #pragma GCC poison TARGET_ARM
 #pragma GCC poison TARGET_CRIS
 #pragma GCC poison TARGET_HPPA
@@ -70,6 +71,7 @@
 
 #pragma GCC poison CONFIG_ALPHA_DIS
 #pragma GCC poison CONFIG_ARM_A64_DIS
+#pragma GCC poison CONFIG_ARC_DIS
 #pragma GCC poison CONFIG_ARM_DIS
 #pragma GCC poison CONFIG_CRIS_DIS
 #pragma GCC poison CONFIG_HPPA_DIS
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 54f069d491..5fbedebcb0 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -26,6 +26,7 @@ enum {
     QEMU_ARCH_RISCV = (1 << 19),
     QEMU_ARCH_RX = (1 << 20),
     QEMU_ARCH_AVR = (1 << 21),
+    QEMU_ARCH_ARC = (1 << 22),
 
     QEMU_ARCH_NONE = (1 << 31),
 };
diff --git a/meson.build b/meson.build
index 5b586afc38..81f42b7429 100644
--- a/meson.build
+++ b/meson.build
@@ -36,7 +36,7 @@ python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'sparc64', 'riscv32', 'riscv64', 'x86', 'x86_64',
-  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+  'arc', 'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
 targetos = host_machine.system()
@@ -482,6 +482,7 @@ config_target_mak = {}
 
 disassemblers = {
   'alpha' : ['CONFIG_ALPHA_DIS'],
+  'arc' : ['CONFIG_ARC_DIS'],
   'arm' : ['CONFIG_ARM_DIS'],
   'avr' : ['CONFIG_AVR_DIS'],
   'cris' : ['CONFIG_CRIS_DIS'],
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 7fd5c09b2b..27faed5edd 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -92,6 +92,8 @@ int graphic_depth = 32;
 #define QEMU_ARCH QEMU_ARCH_XTENSA
 #elif defined(TARGET_AVR)
 #define QEMU_ARCH QEMU_ARCH_AVR
+#elif defined(TARGET_ARC)
+#define QEMU_ARCH QEMU_ARCH_ARC
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
diff --git a/target/meson.build b/target/meson.build
index 9f0ae93b75..f4a3a6425c 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -1,4 +1,5 @@
 subdir('alpha')
+subdir('arc')
 subdir('arm')
 subdir('avr')
 subdir('cris')
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
