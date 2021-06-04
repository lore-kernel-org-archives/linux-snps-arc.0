Return-Path: <SRS0=rV/3=K6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7263C47083
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 07:10:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7322561417
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 07:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7322561417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VqWMa9PSJ5rDEx58rehJBcwdwQRTmA8VMCI5+5ZauhQ=; b=HGefrhzfVRoKI2
	ECpPhb74+SOPvM6Cszj4tZTwcNoTawgkQZVqgQl2/c+n2qW6PjQn9KbYjlrS8j0CCNWYHEkwxvQXf
	ZrffFckE5ogVjsrRKdAtYvgMozpbI6Rv1FV/undE26IAdFda6/hwqzrfBsUCPzWSLPUU8zMHp2v3S
	pyWyYxwwDgKGMR+0XOEAMwtGig7YYaY1oaogPln7OUF1HaHOJSP7l337UqtQNMyJs+nXo9Wmk+JKM
	VEvBSj4sO9g5qnMuGu6n1xN3oZt5Z5jdSFlEHGLJNAuwnooTRtSVJc1tw3Mje34vHtaRwqhosWIeX
	+/z3HQT5TkCpeLOsClIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp3yQ-00BxSL-FZ; Fri, 04 Jun 2021 07:10:30 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp3mM-00BsER-F0; Fri, 04 Jun 2021 06:58:04 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FxD5B749vz63gb;
 Fri,  4 Jun 2021 14:54:06 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:53 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:52 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mm@kvack.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 <linux-snps-arc@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-csky@vger.kernel.org>, <uclinux-h8-devel@lists.sourceforge.jp>,
 <linux-m68k@lists.linux-m68k.org>, <openrisc@lists.librecores.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-sh@vger.kernel.org>, <linux-s390@vger.kernel.org>
Subject: [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk setup code
Date: Fri, 4 Jun 2021 15:06:18 +0800
Message-ID: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_235802_740967_B34503BF 
X-CRM114-Status: UNSURE (   5.56  )
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

Add setup_initial_init_mm() helper, then use it
to cleanup the text, data and brk setup code.

v2:
- change argument from "char *" to "void *" setup_initial_init_mm()
  suggested by Geert Uytterhoeven
- use NULL instead of (void *)0 on h8300 and m68k
- collect ACKs

Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-m68k@lists.linux-m68k.org
Cc: openrisc@lists.librecores.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Kefeng Wang (15):
  mm: add setup_initial_init_mm() helper
  arc: convert to setup_initial_init_mm()
  arm: convert to setup_initial_init_mm()
  arm64: convert to setup_initial_init_mm()
  csky: convert to setup_initial_init_mm()
  h8300: convert to setup_initial_init_mm()
  m68k: convert to setup_initial_init_mm()
  nds32: convert to setup_initial_init_mm()
  nios2: convert to setup_initial_init_mm()
  openrisc: convert to setup_initial_init_mm()
  powerpc: convert to setup_initial_init_mm()
  riscv: convert to setup_initial_init_mm()
  s390: convert to setup_initial_init_mm()
  sh: convert to setup_initial_init_mm()
  x86: convert to setup_initial_init_mm()

 arch/arc/mm/init.c                 | 5 +----
 arch/arm/kernel/setup.c            | 5 +----
 arch/arm64/kernel/setup.c          | 5 +----
 arch/csky/kernel/setup.c           | 5 +----
 arch/h8300/kernel/setup.c          | 5 +----
 arch/m68k/kernel/setup_mm.c        | 5 +----
 arch/m68k/kernel/setup_no.c        | 5 +----
 arch/nds32/kernel/setup.c          | 5 +----
 arch/nios2/kernel/setup.c          | 5 +----
 arch/openrisc/kernel/setup.c       | 5 +----
 arch/powerpc/kernel/setup-common.c | 5 +----
 arch/riscv/kernel/setup.c          | 5 +----
 arch/s390/kernel/setup.c           | 5 +----
 arch/sh/kernel/setup.c             | 5 +----
 arch/x86/kernel/setup.c            | 5 +----
 include/linux/mm_types.h           | 8 ++++++++
 16 files changed, 23 insertions(+), 60 deletions(-)

-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
