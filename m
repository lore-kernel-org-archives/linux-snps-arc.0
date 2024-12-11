Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3930BE7717D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Dec 2024 00:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2K5BT2+3/AVGtLasdpzdMnRTKBA1dCvZink7gttve1c=; b=0YU
	/a8XLNdsO9lJJv6bvvNW2REwmqqeRYYGjuzVYiaUsBoMLb8VZTOK0MTIk7hVcPN4aeo529CD0qXsk
	Se1Y6osIVAjJd5O+ohM0G4Q62o4wqZ/GE/RGugChCUt8NyWwvWEc2+XuUU0oYsfSyM963bQ/amr4J
	IfPA7My4MhM5DYR1vCeqTWRHdGLBwRAkHayBpBufALNQeoizXjI26sZ9Qfrv2SOQpTN9wW7zhtYnU
	nHMUWUTbqYlabcaNhCek2vn6YuzH6UQulDtnqHWKCDWUC7XbU7VHkJWdj33l/FMd8CVAJ7b7O4Fk8
	u0han3SO9nRonk6NWcu/uCFAL0kd5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLX5z-0000000GbSW-3BOE;
	Thu, 12 Dec 2024 00:30:23 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7b-0000000GSRw-30v1
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:01 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7f80959f894so1058137a12.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959678; x=1734564478; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Y13tezS9osfEyeZZhDu0hB4QwVrkWFM3vdAGWXDL0s=;
        b=005YUguGRwxsPz7RxssW6j3WdFTxdi2KvGm+FJxDmyTN5lFMRvkwP4XfgmbloMI1dM
         qLrBEkQ2NBHedrYe072QyxyYrI24eu17D7T9fB4MlJk8cBoDtLZ40i2JSOHYVmzYUWHn
         ZiSgIemQ9TpOVNO9pb1B0fSG4UstqHvwPjqxM/3faHkm0KO+/OdRAr91qyT73kv3TVRQ
         LTUnDQSzc6riAvAajVt4FpYqw+zfUXFZx2nb9qhL+c0yLhVjK+gjDbWLDg0AuclkxJ1M
         SIeyrjW/UA7QrhA9q8NC0lASFQV30CZSO7lfWxnETfVZ8hYpY89j8FOjVxVDtNyulp3/
         jr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959678; x=1734564478;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Y13tezS9osfEyeZZhDu0hB4QwVrkWFM3vdAGWXDL0s=;
        b=wQo0BoDI96bg5FduRgxENzP+oJtDjpeXds01Dm8fh5w9XzPGC0RNgKPL0b9NKmVw4A
         AswpEtvyoH8LvYLTr5J9haBraND4jsjI0PK1EtXbl3sbqJqPHhaTryKvCa6vcpnxUHH2
         2Chq+ZDsp+abvebZtptUPfrf5X8vvpuBadsNZgTAOHmz+gY3xMuj4RksR1+9NYZTc9t5
         Z0wxZKoJ2/6bDF58zK9u5kuZBCW0ep8QjBjY/meiT76kri5kYH07tRcZ/foOthkSFsH5
         XP6HbQBpKi3e//pwtYhJRQT8SYu+wlbxT11j1//vN5+zjy4ClIQZiCjr6z423bxhE1Qc
         u7YA==
X-Forwarded-Encrypted: i=1; AJvYcCWDRSpwDvcQB4ppuywoNyfvhDvbRazJWGQE7+zybCVaNupsOMZYn9PdXGsiuerY0xy/eFl+LeRWfQ5snhRzFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2WgPEzpKWv6K7V4dJulicEWHzhVxehfCRJ1UV2l/yRTyFWQy8
	4r0EQlAtsKvvHVwB305RVFNtXEFnaxfpN5fDXwmoBG2+esVT3Jrbd30mUWwGMEQjeeKJMu9leHR
	yV7onAJKn93rfrBYK3kUL5g==
X-Google-Smtp-Source: AGHT+IH+hxwnbTejsd5rMe6ZdiiLsQVYXh76CpSNZ1O0EO7ZME4Z+uiov/c6u6U8sBeYTnWqfHb7LFZNMZjeMUedcw==
X-Received: from pjj11.prod.google.com ([2002:a17:90b:554b:b0:2ef:9866:6155])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1f81:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-2f13abc6e43mr1624666a91.5.1733959677870;
 Wed, 11 Dec 2024 15:27:57 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:38 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-1-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_152759_762119_428140EA 
X-CRM114-Status: UNSURE (   8.66  )
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

Hi all,

This is v2 othe the arch_mmap_hint() series.

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate most of the error handling in arch_mmap_hint().
  - Patch 16 ("mm: Fallback to generic_mmap_hint()") was folded into
    Patch 2 ("mm: x86: Introduce arch_mmap_hint()")

v1: https://lore.kernel.org/r/20241210024119.2488608-1-kaleshsingh@google.com/

=======

This series introduces arch_mmap_hint() to handle allocating VA space
for the hint address.

Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
issue of mmap hint being ignored in some cases due to THP alignment [1]

[1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/

Thanks,
Kalesh


Kalesh Singh (16):
  mm: Introduce generic_mmap_hint()
  mm: x86: Introduce arch_mmap_hint()
  mm: arm: Introduce arch_mmap_hint()
  mm: alpha: Introduce arch_mmap_hint()
  mm: arc: Use generic_mmap_hint()
  mm: csky: Introduce arch_mmap_hint()
  mm: loongarch: Introduce arch_mmap_hint()
  mm: mips: Introduce arch_align_mmap_hint()
  mm: parisc: Introduce arch_align_mmap_hint()
  mm: s390: Use generic_mmap_hint()
  mm: sh: Introduce arch_mmap_hint()
  mm: sparc32: Introduce arch_mmap_hint()
  mm: sparc64: Introduce arch_mmap_hint()
  mm: xtensa: Introduce arch_mmap_hint()
  mm: powerpc: Introduce arch_mmap_hint()
  mm: Respect mmap hint before THP alignment if allocation is possible

 arch/alpha/include/asm/pgtable.h           |   1 +
 arch/alpha/kernel/osf_sys.c                |  31 +++---
 arch/arc/include/asm/pgtable.h             |   1 +
 arch/arc/mm/mmap.c                         |  43 +++++----
 arch/arm/include/asm/pgtable.h             |   1 +
 arch/arm/mm/mmap.c                         | 107 +++++++++------------
 arch/csky/abiv1/inc/abi/pgtable-bits.h     |   1 +
 arch/csky/abiv1/mmap.c                     |  68 +++++++------
 arch/loongarch/include/asm/pgtable.h       |   1 +
 arch/loongarch/mm/mmap.c                   |  49 +++++-----
 arch/mips/include/asm/pgtable.h            |   1 +
 arch/mips/mm/mmap.c                        |  50 +++++-----
 arch/parisc/include/asm/pgtable.h          |   1 +
 arch/parisc/kernel/sys_parisc.c            |  53 +++++-----
 arch/powerpc/include/asm/book3s/64/slice.h |   1 +
 arch/powerpc/mm/book3s64/slice.c           |  31 ++++++
 arch/s390/include/asm/pgtable.h            |   1 +
 arch/s390/mm/mmap.c                        |  51 +++++-----
 arch/sh/include/asm/pgtable.h              |   1 +
 arch/sh/mm/mmap.c                          |  83 ++++++----------
 arch/sparc/include/asm/pgtable_32.h        |   1 +
 arch/sparc/include/asm/pgtable_64.h        |   1 +
 arch/sparc/kernel/sys_sparc_32.c           |  33 ++++---
 arch/sparc/kernel/sys_sparc_64.c           |  96 +++++++-----------
 arch/x86/include/asm/pgtable_64.h          |   1 +
 arch/x86/kernel/sys_x86_64.c               |  64 ++++++------
 arch/xtensa/kernel/syscall.c               |  31 ++++--
 include/linux/sched/mm.h                   |   9 ++
 mm/huge_memory.c                           |  17 ++--
 mm/mmap.c                                  |  86 +++++++++++------
 30 files changed, 491 insertions(+), 424 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
