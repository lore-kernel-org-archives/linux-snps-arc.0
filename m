Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8DDC10F27
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 12:00:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93159208E4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 12:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="msRRuF1u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FCFL15lz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93159208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UmrWpAgQrZdHIrIXKSn7jRq6KnfMaRFaG9Y4x0Ntbjs=; b=msRRuF1uWgWk2G
	OjRc/BlyBrw3eJkw/6izYYANzrB5E3hZ1KvFL8dqOdGijeOwqGBtRnlehekx5fMKPNSeeC9LaJ14U
	ygwi/U7JYAb2iTLV2Xn8aOBoO5OPOHy5aBnqqhpgi7uKgeknBoLQgQw/G+xYClOd8NZDiWSHwb6Vh
	uocAg+EJfv3HWjA8CL7WH4PR0ssy9WTFQHc/yebZ50GzZon+Mf+vqIWx8YaYed+iPe4+3LtqhHWwv
	XoD9tmNnKzJBPIOutPyp5eKE/Sk1Ivm+m6QGiZlvp6/J04Nq7ySREs42bFjMi7dFiYmnYthc/fZba
	GaH34Tks4GcFW1HcckAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC02i-0006HK-1d; Wed, 11 Mar 2020 12:00:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC02g-0006GB-1l
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 12:00:55 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 86BC643B65;
 Wed, 11 Mar 2020 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583928051; bh=o3iaNqyLSE8nbR0Re2D2nxm7H548fIrwcHLxjDTB7Es=;
 h=From:To:Cc:Subject:Date:From;
 b=FCFL15lzTnh8btssULMCaYMUImsZz6qlJ5Q1OBkoRlbHYwSMffOUFA6Z76JnJHMxS
 nH32waghVSEe+ReHDeCYURNFsO/PTyFpCFjoX+u8WK1RhNDfUjUsNzJGTO19VNvzhE
 hS/RgGl23m5ibHhaeQe7kcaRXRtvH0i4udFmlIFA7gwsopI2M1saWnnSFOxz2ewWWa
 +qqd5iPHLM2m7fdgPlegfRzNpXgEIUBpkb1lfK6cNQNrBQHvAAJITlCOPjBt3g8AcE
 94Hu2COzwQUgM9pJ7fLqfHY7u1tECkgclyxYhSx9dpqT97DLUYkjvdTqoLZsSfd+9x
 ogc2stJk4KZEw==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id ECDD9A005B;
 Wed, 11 Mar 2020 12:00:47 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: uboot-snps-arc@synopsys.com, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 0/2] ARC cache subsystem updates
Date: Wed, 11 Mar 2020 15:00:42 +0300
Message-Id: <20200311120044.10061-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_050054_102385_4D4CE36A 
X-CRM114-Status: UNSURE (   5.61  )
X-CRM114-Notice: Please train this message.
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
Cc: u-boot@lists.denx.de, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Eugeniy Paltsev (2):
  ARC: CACHE: add support for SL$ disable
  ARC: CACHE: mark IOC helper functions as inlined_cachefunc

 arch/arc/include/asm/cache.h |   7 +++
 arch/arc/lib/cache.c         | 118 ++++++++++++++++++++++++++++++++---
 2 files changed, 116 insertions(+), 9 deletions(-)

-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
