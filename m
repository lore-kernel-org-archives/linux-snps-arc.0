Return-Path: <SRS0=a/ML=AU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7411C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 13:44:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA2BC207BC
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 13:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TE/nbhqc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMjqciFN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA2BC207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0i8DEqBxliLBMOtkvPn2pwuXp7FPJopRmNWZuLvBwRQ=; b=TE/nbhqcfc7jZkfmKBInNXYcNh
	9Yc1N8s8HcRVsnWUubF5Sg1g0Ccq7RGFvblqOK5cEtAQepzD18z4qUYYQEGxOjjgYaWJUgiaczkaB
	TXzk7OwoPembiMj3Gyxs04kA/sSqnVyOAyuNtIX9aarSXcsNwh9nSo7ugg9jt7/mpNhRQTRKwTAkk
	D+/Q32juFcmnA/xCM7x0uZ+qCSdWnH6j57BFvfeHAgdb+L9ufzKeC/HJNk41SxEZ2L85hgUD6dCBU
	sht8VD2oeD4c7HFe5Cf4M0Dgl1WrwHm9n4rVASPuK8usJyPy404GmpjgCQIBWL39vutNIqf7Jdgr/
	mai5ci1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtWqc-0006bi-Sw; Thu, 09 Jul 2020 13:44:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtWqa-0006aZ-7b
 for linux-snps-arc@lists.infradead.org; Thu, 09 Jul 2020 13:44:20 +0000
Received: from hump.s81c.com (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B524D20772;
 Thu,  9 Jul 2020 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594302258;
 bh=v6Vn1YgNxBgfgcIxWirvzy4yRH6zVpQpKkve958MzHg=;
 h=From:To:Cc:Subject:Date:From;
 b=lMjqciFNM1a9a8XnYPdfLoueKSxMVUUC04xe4cfAyGXumRmM6Jtyvobso2Qakeuwj
 sIBHMI9VZIZgtHqb9wOAov5RLIq1Uaq8+D3D6esAvdXjKms88zyMXvasGLfDo4XMAb
 U8RBe2jWwmIDfdzAvZCLYWce/w9R6DPhHMJw9q1g=
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: [RFC/RFT PATCH v2 0/1] arc: add sparsemem support
Date: Thu,  9 Jul 2020 16:44:11 +0300
Message-Id: <20200709134412.1464453-1-rppt@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_094420_338495_542C4DC3 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

It took me a while to get back to it, but better late than never :)

This patch adds SPARSEMEM support as an alternative to DISCONTIGMEM in
the case when there are two DRAM banks populated.

I've verified that it boots on nsim, but I could not find a way to make
nsim emulate two memory banks.

There is slight improvement in the resulting kernel size for
nsim_700_defconfig with CONFIG_HIGHMEM=y.

If sparse actually works on a system with 2 DRAM banks and does not
introduce performance regression, I suggest to update this patch to
replace DISCONTIGMEM with SPARSEMEM on arc.

$ size discontig/vmlinux  sparse/vmlinux 
   text	   data	    bss	    dec	    hex	filename
3894379	1093092	 244932	5232403	 4fd713	discontig/vmlinux
3879040	1093964	 244956	5217960	 4f9ea8	sparse/vmlinux

$ ./scripts/bloat-o-meter ~/tmp/arc/discontig/vmlinux  ~/tmp/arc/sparse/vmlinux 
add/remove: 35/23 grow/shrink: 35/384 up/down: 8110/-26438 (-18328)
...
Total: Before=4282217, After=4263889, chg -0.43%


Mike Rapoport (1):
  arc: add sparsemem support

 arch/arc/Kconfig                 | 10 ++++++++++
 arch/arc/include/asm/sparsemem.h | 13 +++++++++++++
 arch/arc/mm/init.c               |  7 ++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 arch/arc/include/asm/sparsemem.h

-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
