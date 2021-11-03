Return-Path: <SRS0=3pus=PW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B4BC43217
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E9461157
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88E9461157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aet8sQ+a8dIaaZ6u0NxyUJBxYNHVpi3L4D5Gdt2d/24=; b=q/g1KKssqFi+1K
	rtrnYqHMwTCJxt9WMMD0s+vQNJiXYNpPNSc42gU/LWg28z4n2bpgF161DqiCpadAAHMsofjM6UE6B
	yGivfx+Yx/u4Z2IxoJOA9wYTMHtzy9lGN2UQq6hdVwviv0ReLTXl0GbvmXWPoCqfr82XQNWPOHDWy
	FgCx1aUGRP989VasGgW4shLpjRqNkm8E5u1L6bgPxT6CD0ug3KcMkigQfD2WKaIPq8zKVeT605tmI
	NWPXYJRyJp4x+HdXEOkcLTVaiHxisXdSJLKFKZl2nbzqlDnlHE3GX45TJ9iId/3zooSdvgJnXBFry
	6trybpHm6XogcSaWVeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miNK2-006ZBu-1T; Wed, 03 Nov 2021 20:57:26 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miNJn-006Z1t-EP; Wed, 03 Nov 2021 20:57:12 +0000
Received: by mail-pg1-x535.google.com with SMTP id j9so3471165pgh.1;
 Wed, 03 Nov 2021 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mECX+oRSHRb92wE0BJLiQDT7bINXd0Mx3xvZ2TAianQ=;
 b=a3zMJ0D8bBR20rg7rsxGuyOTYnQN37yYwmBwC3S+6aAW0QlVa7vPvgFG2bSlRyE3ix
 elmBQuwD0+9OLU0FRPq2i/CH/8YN2GJvZv6yjPKSu4EpZFIjAld18VXACn6B+kBBvgnf
 2L9uKL5q6wZ81IJaEa6Sg531mllVK78U7wuYbjyLf5w/rlGG2yhVn16rhFEv7kyt/pD2
 fsTMFuRsbWhqrWapbCNukGsQNb2+CLWZzoK6GQFF24Q5lQ5S+2TNQGz+7lLX5FyHvoN6
 DnOOuScPioxgv2oj9Q0+yZ8xc52rZqxKJ5eEKPVTkTXUcvFyMXnuk3rBZEBDCXfWKjZt
 W/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mECX+oRSHRb92wE0BJLiQDT7bINXd0Mx3xvZ2TAianQ=;
 b=zEeVzH/T8YwBk2szgpBIZwefULU12fUHe+6bOUlwuTu/DfeFa00F+F/AdbV0py0r7/
 QhJl5KqLuyRwGxkUWkahMTwaut2v9egFo0R08vIRmc58Y9xAaTYogT5nbBTAfnVlGk81
 PDozi2c2alal2M7qocgqM+TsXbdiP9+47YpFfGuyciW86MDZyP4jL0H+h+iaqaFMaOuH
 f5CtUJbshb3k8iJknLmlFihRUGA/VhFfQdkLDUQTAOL89hqnUPP/FrDo0Gwk5gKst18H
 k8AX6PIIaGsGgpbc8ZSM2qo67d6JbdmAdgNNLtIrFMvD89ojl+QqRJ7uRwyTvQaSWmvg
 WG/g==
X-Gm-Message-State: AOAM531LHAprtsXmOq09pizhjw3BCX5xs2bqbZCeRPNOp5JDRcoTlV+z
 P2HTyx7BA2O/9eiWK5CEOFA=
X-Google-Smtp-Source: ABdhPJzj2664dHG+guPVVL2qUxpAjbN+Z5lTYlwZpUGV816hc1G3rRsEFzjX162YsDh52mFdzCX7zQ==
X-Received: by 2002:a63:311:: with SMTP id 17mr24881549pgd.367.1635973030309; 
 Wed, 03 Nov 2021 13:57:10 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b18sm2554859pjo.31.2021.11.03.13.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:57:09 -0700 (PDT)
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
 Stefan Agner <stefan@agner.ch>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Rapoport <rppt@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
 linux-mips@linux-mips.org (open list:MIPS),
 linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)), 
 linux-arch@vger.kernel.org (open list:GENERIC INCLUDE/ASM HEADER FILES),
 linux-mm@kvack.org (open list:ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR)
Subject: [PATCH stable 4.14 0/2] zsmalloc MAX_POSSIBLE_PHYSMEM_BITS
Date: Wed,  3 Nov 2021 13:57:02 -0700
Message-Id: <20211103205704.374734-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_135711_520584_C1899A5C 
X-CRM114-Status: GOOD (  11.69  )
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
 arch/x86/include/asm/pgtable_64_types.h     |  2 ++
 include/asm-generic/pgtable.h               | 13 +++++++++++++
 mm/zsmalloc.c                               | 13 +++++++------
 9 files changed, 34 insertions(+), 6 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
