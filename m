Return-Path: <SRS0=sN9/=LZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D348C11F66
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Jul 2021 00:23:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E35ED61451
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Jul 2021 00:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E35ED61451
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bf1hRBRUAiNMKe8f5U1SLni+5rwMrZnFXe0nnFoPl1Q=; b=cMUD2SYyPrR9li
	9qurHngDIwBQ9hMdlms0iS4hTgekHsMqEGkWVjRlX9DMjiqLLXeD6PfcJbq1orGqh/2hC/Fh2rKtp
	GBZoZkpSVYWi/EahDJD4DiCj3yhgTTwhB1gSWF4MaHIl3M2cvDTqDlXc4SBahrKZU30q11kfYWqdK
	zu80fkplz4wUFxhdbj3Toan3uAjYtqlCM4+hjXN8CeSSfGT0+Ap8uvFZhsL1OtHjD6+SyCVbO90oA
	Sc4rEqDi/Bn/XTY/w3zbni5j0jgjFY2tLvlNZADoP0nbhp4S1hx5CGPQuPaGRuHh4naTHOdlNRCzc
	0vTdL6PuB/0pyrNfYIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lykUD-00FfUm-F9; Thu, 01 Jul 2021 00:23:21 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lykU9-00FfTX-Vz
 for linux-snps-arc@lists.infradead.org; Thu, 01 Jul 2021 00:23:19 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 7882572C8B4;
 Thu,  1 Jul 2021 03:23:13 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 65B0D7CF737; Thu,  1 Jul 2021 03:23:13 +0300 (MSK)
Date: Thu, 1 Jul 2021 03:23:13 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: config-patches@gnu.org, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH] Recognize arc32
Message-ID: <20210701002313.GB15255@altlinux.org>
References: <20210604040125.323754-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604040125.323754-1-vgupta@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_172318_260461_4C862BBC 
X-CRM114-Status: UNSURE (   8.21  )
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

On Thu, Jun 03, 2021 at 09:01:25PM -0700, Vineet Gupta wrote:
> This is the 32-bit variant of ARCv3 ISA (which is not compatible with the
> 32-bit ARCv2 ISA)
> 
> | make check
> | cd testsuite && bash config-guess.sh && rm uname
> | PASS: config.guess checks (136 tests)
> | cd testsuite && bash config-sub.sh
> | PASS: config.sub checks (864 tests)
> | PASS: config.sub idempotency checks (801 tests)
> | PASS: config.sub canonicalise each config.guess testcase (136 tests)
> 
> * config.guess (arc32:Linux:*:*): Recognize.
> * config.sub (arc32): Likewise.
> * doc/config.guess.1: Regenerate.
> * doc/config.sub.1: Likewise.
> * testsuite/config-guess.data: Add a test case for arc32.
> * testsuite/config-sub.data (arc32, arc*-elf): Add test cases.

Merged, thanks!


-- 
ldv

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
