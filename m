Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EA1C54E67
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Mar 2024 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6IhEFHd2vw3pfiIUQbwjf+WSxy7CWAtACyaexE/a1Hs=; b=3319Cn3/dRNYMZ
	PvNVuMKkukHiS4v7a1+RUUXQYFX4F7VbTtDnWH3qQuvBExWEtH3c/UDTRWQy2CP1X6ZZTIG9ilQDh
	+tY/cnNFl0axLhHXFmvtPhkN0sYP5eHjbadFhCjldH6qYisU3rnmUVWmVguuI9AeTGlfg7BvqPyn9
	X73L3YVZ0MjCRrbwyLVMYOVPsEiOsOtG9xeMLNKIglmCyX0iSF+QFi+gVcza2BOOrCJ0ZJv40RN51
	8RP5W7HWvFlF3JTx0YTbX+2HG7/QxBcHXQpic/A4IdEbj4GrxsVyZ5u/jwufIQeaL5krdSGx3+ydb
	LOu9EfOWYoSQfnp2ppdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp0TI-00000003JRB-1HA1;
	Tue, 26 Mar 2024 06:39:44 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp0TD-00000003JO5-44ql
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Mar 2024 06:39:42 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4d452e2f0aeso1974472e0c.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 25 Mar 2024 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711435175; x=1712039975; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=drVZ42Pjz6m24bstfIZiE8BogPtQcG+Q1nzebdlWw4A=;
        b=gygFJCdXHs/ujuVuW4b5oH724ttDqL65S23tgFf8QrTAo4T4tFns4xA0KhNrew0lea
         be1ID8TQIUKl2kx21VTADcLAI5rbC87YAD+YfPVoCwHzZHROlYbQN6yvhzD2ckB1R97x
         HrhNJG9IqjkRE6pf8VE2o/pR7RMg5wuNo8VARoYp/ELRLpP6KXbGysL3htDagqLdvN4p
         INdAzEUt6S1lqPt3fl7VxgTK86aCwiF7/DIEItLtpp5Iq3gawZLDLamHSACSDnOQupsJ
         4rCJ4f9J9ov+Xi91gdgyzQaUogPxNmeSfaDo4FetNr17e6pC/1qPAf8S19shXScWjdTT
         IHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711435175; x=1712039975;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drVZ42Pjz6m24bstfIZiE8BogPtQcG+Q1nzebdlWw4A=;
        b=Ln9fx8Dq8N62G+/RBvsq3xb1i4OK/aDkgin1PJTlMloFs5TvZ7uKZyY7bB/HOA0cMR
         I8O+SZzbcqwbMBWPoiXy/y+mcv8mkWnqcOJmlG3uDo8bTJcpcHFmt3d7HB7K/hPV8QmG
         vBHejGv5XLnWTkWTxu7NRwx+l7Jptw1Tkkvxu6OeZ0Kpz7GGFMnx/KYh2KJ5anb1p4Np
         9cc8wQeergqrxZnxEi+HOWN0qPWNUNvTTtUbCENhX0ZpFgiWksdbMDFG1s93UQzt3geT
         C2pEvLuBqi+BItI4EmjmUJSitT3QO4on9BIi2x+Q4yMXX7VeQt2w7X+48IfypFS7aTWR
         n98g==
X-Forwarded-Encrypted: i=1; AJvYcCU4Yo6/6cL9ZkaBWG6G9ORwtBE6577qCSy/9XrihWhidITExUSWcQYABteEYO5RRH+L/12+kX/ehvIUEh9Ee6UZoHNogJUWewKRdnH/l2w6gt4e
X-Gm-Message-State: AOJu0YzNc8TU/AAk/q3R2ZIq2WtPPheCi5++bT2UmuJXDiR4QLNlYKpm
	CdhUMqm6HYJwrjadG7L+tL7JEaQ/2Hi7qvlFUrZtMnP60pPg5+3VWwyjANhaaka5tVSEiZ83/Kf
	DV39zdm9e22TWoCW31VfgfipP2tLeVcu1Lir8XC6p6krO84/zjh4=
X-Google-Smtp-Source: AGHT+IHEXqKXr2zeKfb/dcXtTpJUneKb2/8gxWMltBIlJ3SC8orv+0q/CSPQOhwnG8MsvVlHWmkE85wSNg0nDxpryiY=
X-Received: by 2002:a1f:f843:0:b0:4d8:7a5e:392f with SMTP id
 w64-20020a1ff843000000b004d87a5e392fmr6046584vkh.12.1711435174828; Mon, 25
 Mar 2024 23:39:34 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 26 Mar 2024 12:09:23 +0530
Message-ID: <CA+G9fYu49=6_L6r8hdagZHUSGk+JfjioFaqh+kRaxhce84Q5Kw@mail.gmail.com>
Subject: next: arc: defconfig - gcc-9 - mmu-arcv2.h:82:2: error: implicit
 declaration of function 'write_aux_reg' [-Werror=implicit-function-declaration]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-mm <linux-mm@kvack.org>, 
	linux-snps-arc@lists.infradead.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, vgupta@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_233940_056260_994C8DE4 
X-CRM114-Status: UNSURE (   4.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The following arc defconfig build warnings / errors noticed on today's
Linux next-20240326 tag.

Regressions:
    * arc - defconfig - gcc-9 build failed.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for
'syscall_trace_enter' [-Wmissing-prototypes]
  342 | asmlinkage int syscall_trace_enter(struct pt_regs *regs)
      |                ^~~~~~~~~~~~~~~~~~~
arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for
'arc_kprobe_handler' [-Wmissing-prototypes]
  193 | int __kprobes arc_kprobe_handler(unsigned long addr, struct
pt_regs *regs)
      |               ^~~~~~~~~~~~~~~~~~
In file included from arch/arc/include/asm/mmu.h:21,
                 from arch/arc/include/asm/pgtable.h:14,
                 from include/linux/pgtable.h:6,
                 from include/asm-generic/io.h:1047,
                 from arch/arc/include/asm/io.h:232,
                 from include/linux/io.h:13,
                 from kernel/dma/coherent.c:6:
arch/arc/include/asm/mmu-arcv2.h: In function 'mmu_setup_asid':
arch/arc/include/asm/mmu-arcv2.h:82:2: error: implicit declaration of
function 'write_aux_reg' [-Werror=implicit-function-declaration]
   82 |  write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
      |  ^~~~~~~~~~~~~
cc1: some warnings being treated as errors

Steps to reproduce:
-------
# tuxmake --runtime podman --target-arch arc --toolchain gcc-9
--kconfig defconfig


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240325/testrun/23149630/suite/build/test/gcc-9-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240325/testrun/23149630/suite/build/test/gcc-9-defconfig/history/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2eA2VSZdDsL0DMBBhjoauN9IVoK/

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
