Return-Path: <SRS0=3pus=PW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8316FC433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Nov 2021 20:58:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4197A6115B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Nov 2021 20:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4197A6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gvd+eQ6gZvISP4hCn0AehhCZDEtXQ3A3nnrVjFwmhzM=; b=aWIimbEtqDxgD0
	jROXE+k2QSRVWODARSElmm8gD/sBoS/cQ8WTb/EvKwNQGvgz7rkoEYyOLmvQ691O16o9DBSWFOwsm
	irnlMRGsj05vu7o8SgedGSLYO7ELPauY8eUAQTF142mpnsPD2P5uqFQSP+ohL3hmcs+A2E63SKfka
	mCxOoNK+gKelD3J3BUcmSOlykf/QL3y4OLhld1lvF0iSzh6QQeLWhsZraxLnGQmx3yIgpQIrxLjIQ
	AFT1Jly8D1rHAEP8EH41xCEgIFqKJRBVZI8mty9p4ytWlQ6WOThIyr83l8xoIIgxK98vm71MqQ8jU
	/dqjEa4QKUgT6unytZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miNKt-006Zgz-KC; Wed, 03 Nov 2021 20:58:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miNJx-006Z8g-1G; Wed, 03 Nov 2021 20:57:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id f8so3546864plo.12;
 Wed, 03 Nov 2021 13:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgkJjFPSZ0RIiVDPTncldaM4JyePze+OY2e9ObDrx7w=;
 b=fhZKtKStcdupgiOxcNB95yd9Vzfj7Wn5bRHFRNaH41aSZXHw/MYS8vuFYdDSVjGm4K
 Vk9elSX27N4++k6VjEXfy2sIVKLOxMxyB6oZKk3s9tV6tV4W5vnlyNkwQh8tLs+DepJr
 kfiJxkG++oyS7MlANxu+lvPLpZ4m3PKexHbnKEBpncSvuKt/7z0IXrdLVXNiaT9CXsWk
 kG+L0bmKvi8tAwUj7vnT2ysLIq5XuorFEASFx40pKnz1z2YG015WrdXWJpBoqgBBnz6z
 y3r88+9sR4bR58ymsxwC8ERtvqTmJ34BmFAo9Lxvk5u1EwU+Vj1hwuHgqoFhrXqlTWm0
 FUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgkJjFPSZ0RIiVDPTncldaM4JyePze+OY2e9ObDrx7w=;
 b=KgcXOfNNbkBzrsmgxXI5LAh8q8ciyztQTzTK+KmzUY81dLBG/ghYVu+MKH7fviVzBB
 KzZgiA+khCbdWFkEKiTrlgfVHEp0bdvlHCU+AOvEEd1fa/4DfcMf0Zcwzrlk4PhKnl7M
 rpdkO1FG6/QzW9g9lFGxtVwyV35lxQscnLDA/QeW3xlfkaD2Ka+CGE+TKm3w33/aEhys
 4m9/kQt6pESLGGjoN2dEmTL4HfMLlcRzxO/pNV0jY5xUnCBFMX7IhExpsY8IhOVlj668
 x//7TCFouG5zkS/V7DbNFHhfGt9QLulkC5f+grnGM8t4H9YVgEZg68eh2uiOiJFNNkQd
 b6Uw==
X-Gm-Message-State: AOAM531DQPEECVkaxwmBmgbyMwHLd6wRkVlpG5R48hqqYNxk4LXgr/5s
 neVz5YDbrNwbuiFG4YKY+4Q=
X-Google-Smtp-Source: ABdhPJycXucVgZmu6nLmid4Wm8D7owELy7xzF4D/w2z6jkZdhxTfGUfl//WngJBDuQUwCAYMBVYNdA==
X-Received: by 2002:a17:90b:3144:: with SMTP id
 ip4mr17617348pjb.153.1635973039942; 
 Wed, 03 Nov 2021 13:57:19 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n14sm2512073pgd.68.2021.11.03.13.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:57:18 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
 Arnd Bergmann <arnd@arndb.de>, Minchan Kim <minchan@kernel.org>,
 Nitin Gupta <ngupta@vflare.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Rapoport <rppt@linux.ibm.com>, Stefan Agner <stefan@agner.ch>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
 linux-mips@linux-mips.org (open list:MIPS),
 linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)), 
 linux-arch@vger.kernel.org (open list:GENERIC INCLUDE/ASM HEADER FILES),
 linux-mm@kvack.org (open list:ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR)
Subject: [PATCH stable 4.9 0/2] zsmalloc MAX_POSSIBLE_PHYSMEM_BITS
Date: Wed,  3 Nov 2021 13:57:12 -0700
Message-Id: <20211103205714.374801-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_135721_118557_BB3B78C0 
X-CRM114-Status: GOOD (  11.60  )
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

This patch series is a back port necessary to address the problem
reported by Stefan Agner:

https://lore.kernel.org/linux-mm/bdfa44bf1c570b05d6c70898e2bbb0acf234ecdf.1604762181.git.stefan@agner.ch/

but which ended up being addressed by Arnd in a slightly different way
from Stefan's submission.

The first patch from Kirill is back ported in order to have
MAX_POSSIBLE_PHYSMEM_BITS be acted on my the zsmalloc.c code.

Arnd Bergmann (1):
  arch: pgtable: define MAX_POSSIBLE_PHYSMEM_BITS where needed

Kirill A. Shutemov (1):
  mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS

 arch/arc/include/asm/pgtable.h              |  2 ++
 arch/arm/include/asm/pgtable-2level.h       |  2 ++
 arch/arm/include/asm/pgtable-3level.h       |  2 ++
 arch/mips/include/asm/pgtable-32.h          |  3 +++
 arch/powerpc/include/asm/pte-common.h       |  2 ++
 arch/x86/include/asm/pgtable-3level_types.h |  1 +
 include/asm-generic/pgtable.h               | 13 +++++++++++++
 mm/zsmalloc.c                               | 13 +++++++------
 8 files changed, 32 insertions(+), 6 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
