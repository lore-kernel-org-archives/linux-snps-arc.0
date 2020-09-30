Return-Path: <SRS0=ZTxI=DH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E241C4741F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 20:46:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A83C92071E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 20:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFEfCyfT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hShgaqz3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A83C92071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJmB/+bsF1lAg9OI64Mt/UKw/2vheq6KNRzAtCfwpd0=; b=RFEfCyfT6gYAu1PK3EhiV13HUv
	yjoFFU4Jbfoef8sVkstsGQh3O7ySZEPUxHgvsnuYyKJdE6EkDyzSmJi57gXPqB1FA2gCXrHuXNeFm
	HS59fvcGfaGB/0j77JyoRTaLYMTeBI8FrlmbcCxD95B5vsbotpbfzSVDlDgM0ynzVc06kPPCcPjBj
	BlobaThjxwLdPl0RJySC0ZEQxZaGSlnekV30BDUUdpLCUuvXO2cHOHHEBU7M7ofNXiRPJVdcEmKvq
	DOUxU73bHUoNwjdNM9OUNSMeaYrD/JsWutx124reGJrRGVVeHT+fT5ry7gFRM0Aho57bFJoqy269d
	QeqSTsjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNizj-0004c7-0o; Wed, 30 Sep 2020 20:46:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNizh-0004bC-2Y
 for linux-snps-arc@lists.infradead.org; Wed, 30 Sep 2020 20:46:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id t17so838618wmi.4
 for <linux-snps-arc@lists.infradead.org>; Wed, 30 Sep 2020 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LrHgZkISLM1ydfwp8MrK69lTuM/ET+raTjZhevDX13M=;
 b=hShgaqz3LFp9BsOOGdloO2H+X11n4qapO8p8rfmo+pJydruUL4bDq+hOkas2f5eiLw
 ppb83XNByw2oT59mGRNlonwJGaMBObsmzuloIeP+SgI4rjPrGGx+u7rp5D9w7NF+EjHK
 JTqRwb84PksRmVKdjzwxtfLxo7ig1VmcpNe7WtRHyQVex2C8HLS6RxWUbLVo+ui20wlP
 XjDN8jGG2S1L6uTcIAGYHhd0xQuJzcXHaUk04NlETQ9J+iveb7dJf1rlXmmett2wRacU
 F/W4QD6v7FoUiaLdr6EZok7/wBKkejELBJpxwKrOUbQmKkhiBIYfUuI5GUbwQa3VF6wo
 wpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LrHgZkISLM1ydfwp8MrK69lTuM/ET+raTjZhevDX13M=;
 b=I4TmaTii9AjEU46+HQe1o/F2O0lJ1I81mME/L8Zp7dLAeogsg6IiMMsxTeqTyNqfYp
 i5wOwG9sfiN5vZEBzogk+8KVoxzO4V4fqhzDNr914JSkL8Ot97OOIF86POZKNwQ12PpH
 5jWA5n5FABLuPxW42j6j8RUO2EZCpxBypCAkAwKYYfmmVYU2SFyvKWYi7jBRzCtF3EVh
 fTofB7bL3JbCgQTTbeZD+PSEJlCc1XtsFRYSS8rXro7M5c8UeBIa09MlBn58DWuSnGDv
 MVepI+b/uu1KhucAY+OLWV1Q611wwuoW7+qZWUiZRZAl/tAEk67qKOzDs447Lpie4v4g
 PSzQ==
X-Gm-Message-State: AOAM532kU80spynRdfhZbBo/XoA0ImiQ+XhifueIK8mwEpY7alyH4FWY
 8WU2HEdtWuGjsl5uXPqMoVw=
X-Google-Smtp-Source: ABdhPJyQ0Qg2Tiy8zOwIg3lEDUXUzYngrKsxFz7UJ0sI2Kdq8eDRHwXcffoinqXO49fff0O/NtnmWg==
X-Received: by 2002:a1c:2307:: with SMTP id j7mr3834443wmj.177.1601498791886; 
 Wed, 30 Sep 2020 13:46:31 -0700 (PDT)
Received: from cmiranda-laptop.localdomain ([188.251.240.167])
 by smtp.gmail.com with ESMTPSA id v204sm5310764wmg.20.2020.09.30.13.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 13:46:31 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] *** ARC port for review ***
Date: Wed, 30 Sep 2020 21:45:50 +0100
Message-Id: <20200930204604.20663-1-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_164633_160489_7715FEF3 
X-CRM114-Status: GOOD (  14.45  )
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

From: Cupertino Miranda <cmiranda@synopsys.com>

Hello everyone,

It is with utmost pleasure that on behalf of Synopsys I initiate the
upstream process for our ARCv2 architecture QEMU port.

I am one of the main contributors to this port and member of the
Synopsys GNU toolchain team, together with Claudiu Zissulescu and 
Shahab Vahedi.

ARCv2 processors use RISC, and employ the 16-/32-bit instruction set
architecture (ISA).
ARC processors are configurable and extensible for a wide range of uses
in system on a chip (SoC) devices.
It is a common processor in deeply embedded systems, used in storage,
digital home, mobile, automotive, and Internet of Things (IoT) 
applications.

To facilitate reviewing, we split the files through several commits,
attempting to keep file size to reviewable chunks.

The port as presented implements the system softmmu hardware emulation,
capable to boot and run Linux kernel.
It has also been integrated as a patch in Zephyr project, where it is
being used.
To validate and guarantee correctness of the port through development, 
we have created TCG tests from the very beggining, covering the most 
fundamental CPU features.
For the remaining instructions we validate the port through compiler 
testsuites, like DejaGNU, comparing results with real hardware 
executions.

Would like also to thank our colleagues Vineet Gupta and Alexey Broadkin
for their contributions, which due to the collapse of the development
commits, got their contributions overcast by major ones.

Link for Synopsys ARC processor page:
 - https://www.synopsys.com/designware-ip/processor-solutions.html

ARC PRM for both HS and EM processors can be found in:
 - https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-EM.pdf
 - https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf.

Looking forward to your comments and suggestions.

Best regards,
Cupertino Miranda

*** BLURB HERE ***

Claudiu Zissulescu (5):
  arc: Decoder code
  arc: Opcode definitions table
  arc: Add IRQ and timer subsystem support
  arc: Add Synopsys ARC emulation boards
  tests/tcg: ARC: Add TCG instruction definition tests

Cupertino Miranda (5):
  arc: Add initial core cpu files
  arc: TCG and decoder glue code and helpers
  arc: TCG instruction definitions
  arc: Add BCR and AUX registers implementation
  arc: Add memory management unit (MMU) support

Shahab Vahedi (4):
  arc: TCG instruction generator and hand-definitions
  arc: Add memory protection unit (MPU) support
  arc: Add gdbstub and XML for debugging support
  arc: Add support for ARCv2

 configure                             |     5 +
 default-configs/arc-softmmu.mak       |     5 +
 disas.c                               |     2 +
 disas/arc.c                           |   460 +
 disas/meson.build                     |     1 +
 gdb-xml/arc-aux-minimal.xml           |    32 +
 gdb-xml/arc-aux-other.xml             |   235 +
 gdb-xml/arc-core-v2.xml               |    45 +
 hw/arc/Makefile.objs                  |    21 +
 hw/arc/arc_sim.c                      |   143 +
 hw/arc/arc_uart.c                     |   267 +
 hw/arc/board-hsdk.c                   |   107 +
 hw/arc/boot.c                         |    95 +
 hw/arc/boot.h                         |    21 +
 hw/arc/meson.build                    |    13 +
 hw/arc/nsim.c                         |    86 +
 hw/arc/pic_cpu.c                      |   111 +
 hw/arc/sample.c                       |    77 +
 hw/arc/sim-hs.c                       |   107 +
 hw/meson.build                        |     1 +
 include/disas/dis-asm.h               |    10 +-
 include/elf.h                         |     3 +
 include/exec/poison.h                 |     2 +
 include/hw/arc/arc_uart.h             |    43 +
 include/hw/arc/cpudevs.h              |    10 +
 include/sysemu/arch_init.h            |     1 +
 meson.build                           |     3 +-
 softmmu/arch_init.c                   |     2 +
 target/arc/Makefile.objs              |    34 +
 target/arc/arc-common.h               |    55 +
 target/arc/cache.c                    |   180 +
 target/arc/cache.h                    |    42 +
 target/arc/cpu-param.h                |    20 +
 target/arc/cpu-qom.h                  |    53 +
 target/arc/cpu.c                      |   468 +
 target/arc/cpu.h                      |   532 +
 target/arc/decoder.c                  |  1276 ++
 target/arc/decoder.h                  |   350 +
 target/arc/extra_mapping.def          |    40 +
 target/arc/flags.def                  |    85 +
 target/arc/gdbstub.c                  |   421 +
 target/arc/helper.c                   |   293 +
 target/arc/helper.h                   |    46 +
 target/arc/internals.h                |    37 +
 target/arc/irq.c                      |   658 +
 target/arc/irq.h                      |    37 +
 target/arc/meson.build                |    20 +
 target/arc/mmu.c                      |   775 +
 target/arc/mmu.h                      |   165 +
 target/arc/mpu.c                      |   653 +
 target/arc/mpu.h                      |   140 +
 target/arc/op_helper.c                |   749 +
 target/arc/opcodes.def                | 19976 ++++++++++++++++++++++++
 target/arc/operands.def               |   123 +
 target/arc/regs-detail.def            |   542 +
 target/arc/regs.c                     |   139 +
 target/arc/regs.def                   |   399 +
 target/arc/regs.h                     |   118 +
 target/arc/semfunc-helper.c           |   492 +
 target/arc/semfunc-helper.h           |   280 +
 target/arc/semfunc.c                  |  8474 ++++++++++
 target/arc/semfunc.h                  |    61 +
 target/arc/semfunc_mapping.def        |   329 +
 target/arc/timer.c                    |   456 +
 target/arc/timer.h                    |    32 +
 target/arc/translate.c                |  1344 ++
 target/arc/translate.h                |   202 +
 target/meson.build                    |     1 +
 tests/Makefile.include                |     1 +
 tests/tcg/Makefile.qemu               |    16 +-
 tests/tcg/Makefile.target             |     9 +-
 tests/tcg/arc/Makefile                |   112 +
 tests/tcg/arc/Makefile.softmmu-target |    36 +
 tests/tcg/arc/Makefile.target         |   101 +
 tests/tcg/arc/check_add.S             |    11 +
 tests/tcg/arc/check_addx.S            |    71 +
 tests/tcg/arc/check_andx.S            |    36 +
 tests/tcg/arc/check_aslx.S            |    57 +
 tests/tcg/arc/check_asrx.S            |    86 +
 tests/tcg/arc/check_basic1.S          |    30 +
 tests/tcg/arc/check_basic2.S          |    26 +
 tests/tcg/arc/check_beq.S             |    14 +
 tests/tcg/arc/check_beqx.S            |    26 +
 tests/tcg/arc/check_big_tb.S          |   173 +
 tests/tcg/arc/check_bnex.S            |    26 +
 tests/tcg/arc/check_breqx.S           |    26 +
 tests/tcg/arc/check_brgex.S           |    26 +
 tests/tcg/arc/check_brhsx.S           |    27 +
 tests/tcg/arc/check_brlox.S           |    26 +
 tests/tcg/arc/check_brltx.S           |    26 +
 tests/tcg/arc/check_brnex.S           |    26 +
 tests/tcg/arc/check_bta.S             |   294 +
 tests/tcg/arc/check_carry.S           |    15 +
 tests/tcg/arc/check_enter_leave.S     |   715 +
 tests/tcg/arc/check_excp.S            |    17 +
 tests/tcg/arc/check_excp_1.c          |    15 +
 tests/tcg/arc/check_excp_jumpdl_mmu.S |    44 +
 tests/tcg/arc/check_excp_mmu.S        |    69 +
 tests/tcg/arc/check_flags.S           |    23 +
 tests/tcg/arc/check_ldaw_mmu.S        |    71 +
 tests/tcg/arc/check_ldstx.S           |    37 +
 tests/tcg/arc/check_lp.S              |    12 +
 tests/tcg/arc/check_lp02.S            |    72 +
 tests/tcg/arc/check_lp03.S            |    49 +
 tests/tcg/arc/check_lp04.S            |    48 +
 tests/tcg/arc/check_lp05.S            |    23 +
 tests/tcg/arc/check_lp06.S            |   163 +
 tests/tcg/arc/check_lsrx.S            |    33 +
 tests/tcg/arc/check_mac.S             |   228 +
 tests/tcg/arc/check_manip_10_mmu.S    |   173 +
 tests/tcg/arc/check_manip_4_mmu.S     |   158 +
 tests/tcg/arc/check_manip_5_mmu.S     |   166 +
 tests/tcg/arc/check_manip_mmu.S       |   565 +
 tests/tcg/arc/check_mmu.S             |    59 +
 tests/tcg/arc/check_mpu.S             |   703 +
 tests/tcg/arc/check_mpyd.S            |   543 +
 tests/tcg/arc/check_mpyw.S            |    41 +
 tests/tcg/arc/check_norm.S            |    40 +
 tests/tcg/arc/check_orx.S             |    34 +
 tests/tcg/arc/check_prefetch.S        |    37 +
 tests/tcg/arc/check_rolx.S            |    47 +
 tests/tcg/arc/check_rorx.S            |    64 +
 tests/tcg/arc/check_rtc.S             |    29 +
 tests/tcg/arc/check_rtie_user.S       |    30 +
 tests/tcg/arc/check_stld.S            |    10 +
 tests/tcg/arc/check_subf.S            |    67 +
 tests/tcg/arc/check_subx.S            |    43 +
 tests/tcg/arc/check_swi.S             |   115 +
 tests/tcg/arc/check_swirq.S           |    27 +
 tests/tcg/arc/check_swirq1.S          |    31 +
 tests/tcg/arc/check_swirq3.S          |    49 +
 tests/tcg/arc/check_t01.S             |    12 +
 tests/tcg/arc/check_t02.S             |     9 +
 tests/tcg/arc/check_timer0.S          |    36 +
 tests/tcg/arc/check_timer0_loop.S     |    34 +
 tests/tcg/arc/check_timer0_loop3.S    |    46 +
 tests/tcg/arc/check_timer0_retrig.S   |    29 +
 tests/tcg/arc/check_timer0_sleep.S    |    33 +
 tests/tcg/arc/check_timerX_freq.S     |    87 +
 tests/tcg/arc/check_vadd.S            |   510 +
 tests/tcg/arc/check_vsub.S            |   510 +
 tests/tcg/arc/check_xorx.S            |    32 +
 tests/tcg/arc/ivt.S                   |    38 +
 tests/tcg/arc/macros.inc              |   261 +
 tests/tcg/arc/memory.x                |    12 +
 tests/tcg/arc/mmu.inc                 |   132 +
 tests/tcg/arc/mpu.inc                 |   269 +
 tests/tcg/arc/tarc.ld                 |    15 +
 tests/tcg/arc/tarc_mmu.ld             |    15 +
 tests/tcg/arc/test_macros.h           |   257 +
 tests/tcg/configure.sh                |     3 +-
 151 files changed, 50283 insertions(+), 9 deletions(-)
 create mode 100644 default-configs/arc-softmmu.mak
 create mode 100644 disas/arc.c
 create mode 100644 gdb-xml/arc-aux-minimal.xml
 create mode 100644 gdb-xml/arc-aux-other.xml
 create mode 100644 gdb-xml/arc-core-v2.xml
 create mode 100644 hw/arc/Makefile.objs
 create mode 100644 hw/arc/arc_sim.c
 create mode 100644 hw/arc/arc_uart.c
 create mode 100644 hw/arc/board-hsdk.c
 create mode 100644 hw/arc/boot.c
 create mode 100644 hw/arc/boot.h
 create mode 100644 hw/arc/meson.build
 create mode 100644 hw/arc/nsim.c
 create mode 100644 hw/arc/pic_cpu.c
 create mode 100644 hw/arc/sample.c
 create mode 100644 hw/arc/sim-hs.c
 create mode 100644 include/hw/arc/arc_uart.h
 create mode 100644 include/hw/arc/cpudevs.h
 create mode 100644 target/arc/Makefile.objs
 create mode 100644 target/arc/arc-common.h
 create mode 100644 target/arc/cache.c
 create mode 100644 target/arc/cache.h
 create mode 100644 target/arc/cpu-param.h
 create mode 100644 target/arc/cpu-qom.h
 create mode 100644 target/arc/cpu.c
 create mode 100644 target/arc/cpu.h
 create mode 100644 target/arc/decoder.c
 create mode 100644 target/arc/decoder.h
 create mode 100644 target/arc/extra_mapping.def
 create mode 100644 target/arc/flags.def
 create mode 100644 target/arc/gdbstub.c
 create mode 100644 target/arc/helper.c
 create mode 100644 target/arc/helper.h
 create mode 100644 target/arc/internals.h
 create mode 100644 target/arc/irq.c
 create mode 100644 target/arc/irq.h
 create mode 100644 target/arc/meson.build
 create mode 100644 target/arc/mmu.c
 create mode 100644 target/arc/mmu.h
 create mode 100644 target/arc/mpu.c
 create mode 100644 target/arc/mpu.h
 create mode 100644 target/arc/op_helper.c
 create mode 100644 target/arc/opcodes.def
 create mode 100644 target/arc/operands.def
 create mode 100644 target/arc/regs-detail.def
 create mode 100644 target/arc/regs.c
 create mode 100644 target/arc/regs.def
 create mode 100644 target/arc/regs.h
 create mode 100644 target/arc/semfunc-helper.c
 create mode 100644 target/arc/semfunc-helper.h
 create mode 100644 target/arc/semfunc.c
 create mode 100644 target/arc/semfunc.h
 create mode 100644 target/arc/semfunc_mapping.def
 create mode 100644 target/arc/timer.c
 create mode 100644 target/arc/timer.h
 create mode 100644 target/arc/translate.c
 create mode 100644 target/arc/translate.h
 create mode 100644 tests/tcg/arc/Makefile
 create mode 100644 tests/tcg/arc/Makefile.softmmu-target
 create mode 100644 tests/tcg/arc/Makefile.target
 create mode 100644 tests/tcg/arc/check_add.S
 create mode 100644 tests/tcg/arc/check_addx.S
 create mode 100644 tests/tcg/arc/check_andx.S
 create mode 100644 tests/tcg/arc/check_aslx.S
 create mode 100644 tests/tcg/arc/check_asrx.S
 create mode 100644 tests/tcg/arc/check_basic1.S
 create mode 100644 tests/tcg/arc/check_basic2.S
 create mode 100644 tests/tcg/arc/check_beq.S
 create mode 100644 tests/tcg/arc/check_beqx.S
 create mode 100644 tests/tcg/arc/check_big_tb.S
 create mode 100644 tests/tcg/arc/check_bnex.S
 create mode 100644 tests/tcg/arc/check_breqx.S
 create mode 100644 tests/tcg/arc/check_brgex.S
 create mode 100644 tests/tcg/arc/check_brhsx.S
 create mode 100644 tests/tcg/arc/check_brlox.S
 create mode 100644 tests/tcg/arc/check_brltx.S
 create mode 100644 tests/tcg/arc/check_brnex.S
 create mode 100644 tests/tcg/arc/check_bta.S
 create mode 100644 tests/tcg/arc/check_carry.S
 create mode 100644 tests/tcg/arc/check_enter_leave.S
 create mode 100644 tests/tcg/arc/check_excp.S
 create mode 100644 tests/tcg/arc/check_excp_1.c
 create mode 100644 tests/tcg/arc/check_excp_jumpdl_mmu.S
 create mode 100644 tests/tcg/arc/check_excp_mmu.S
 create mode 100644 tests/tcg/arc/check_flags.S
 create mode 100644 tests/tcg/arc/check_ldaw_mmu.S
 create mode 100644 tests/tcg/arc/check_ldstx.S
 create mode 100644 tests/tcg/arc/check_lp.S
 create mode 100644 tests/tcg/arc/check_lp02.S
 create mode 100644 tests/tcg/arc/check_lp03.S
 create mode 100644 tests/tcg/arc/check_lp04.S
 create mode 100644 tests/tcg/arc/check_lp05.S
 create mode 100644 tests/tcg/arc/check_lp06.S
 create mode 100644 tests/tcg/arc/check_lsrx.S
 create mode 100644 tests/tcg/arc/check_mac.S
 create mode 100644 tests/tcg/arc/check_manip_10_mmu.S
 create mode 100644 tests/tcg/arc/check_manip_4_mmu.S
 create mode 100644 tests/tcg/arc/check_manip_5_mmu.S
 create mode 100644 tests/tcg/arc/check_manip_mmu.S
 create mode 100644 tests/tcg/arc/check_mmu.S
 create mode 100644 tests/tcg/arc/check_mpu.S
 create mode 100644 tests/tcg/arc/check_mpyd.S
 create mode 100644 tests/tcg/arc/check_mpyw.S
 create mode 100644 tests/tcg/arc/check_norm.S
 create mode 100644 tests/tcg/arc/check_orx.S
 create mode 100644 tests/tcg/arc/check_prefetch.S
 create mode 100644 tests/tcg/arc/check_rolx.S
 create mode 100644 tests/tcg/arc/check_rorx.S
 create mode 100644 tests/tcg/arc/check_rtc.S
 create mode 100644 tests/tcg/arc/check_rtie_user.S
 create mode 100644 tests/tcg/arc/check_stld.S
 create mode 100644 tests/tcg/arc/check_subf.S
 create mode 100644 tests/tcg/arc/check_subx.S
 create mode 100644 tests/tcg/arc/check_swi.S
 create mode 100644 tests/tcg/arc/check_swirq.S
 create mode 100644 tests/tcg/arc/check_swirq1.S
 create mode 100644 tests/tcg/arc/check_swirq3.S
 create mode 100644 tests/tcg/arc/check_t01.S
 create mode 100644 tests/tcg/arc/check_t02.S
 create mode 100644 tests/tcg/arc/check_timer0.S
 create mode 100644 tests/tcg/arc/check_timer0_loop.S
 create mode 100644 tests/tcg/arc/check_timer0_loop3.S
 create mode 100644 tests/tcg/arc/check_timer0_retrig.S
 create mode 100644 tests/tcg/arc/check_timer0_sleep.S
 create mode 100644 tests/tcg/arc/check_timerX_freq.S
 create mode 100644 tests/tcg/arc/check_vadd.S
 create mode 100644 tests/tcg/arc/check_vsub.S
 create mode 100644 tests/tcg/arc/check_xorx.S
 create mode 100644 tests/tcg/arc/ivt.S
 create mode 100644 tests/tcg/arc/macros.inc
 create mode 100644 tests/tcg/arc/memory.x
 create mode 100644 tests/tcg/arc/mmu.inc
 create mode 100644 tests/tcg/arc/mpu.inc
 create mode 100644 tests/tcg/arc/tarc.ld
 create mode 100644 tests/tcg/arc/tarc_mmu.ld
 create mode 100644 tests/tcg/arc/test_macros.h

-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
