Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69439C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Dec 2021 03:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52MTD7nbaAeUOVJ20lboGdohVyxsPZLuLY8dXTZhs20=; b=qz9g0rccZmTKUaa52E9l4G702x
	oOx4T5TtYDoxeMfNQO+tIEyhqB2JYAPmfhp84dBi6PGDjmIKMxtxTLDKmHW4rMmq+1J4C1msBisBD
	85AuyNrFBNhZaulYW0fQzbSHaJoAiqOhtaWJESBzQQ837JVS17X6xBWxQZUzygPptCs6JqhpVMx8q
	yR57YHhpydFml4k7NuVE99e0NQOPJBpaGrqhHwTEMUIjXJnDjp31sviKl+vJ12VI/Fk52la9UBplQ
	j3ogYlxy0XqQ7HHHF8ugA0ZwFAB1kg0xBz9z15gGPQkGBRYvOdjOoIWoMHk/6PxBLxH9+6iSMC3th
	lufyPFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Pvj-002DAH-Uu; Wed, 29 Dec 2021 03:47:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Pvh-002D9w-F1
 for linux-snps-arc@lists.infradead.org; Wed, 29 Dec 2021 03:47:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A2D6B81744;
 Wed, 29 Dec 2021 03:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71BCC36AEA;
 Wed, 29 Dec 2021 03:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640749626;
 bh=DhuMBa2+JL37Y0mjDM/VjSfJ20Hzyh5BnFk4SC4Z+C8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XIImZTBe8lh4Z7C/mX+9YVxI9x0c0NWIj0PAyq0FVnDDk2JpLzO5QGKyGKab7P/DX
 2w4gJdncbHkhdGA4AwI3L+mRpU2vrK6Yn2KJhIKkOeO501TKI2sbQn/CUaapwEb8T+
 vNQdfeisW8z9YAPW9ZeR7drBljzV3raG4Zc1kM267XwgKd5PnyH+5dRqO3OqW9748w
 f7wZElp2MhJtAfkvGbWMnMqp2Unp+/C+hosiM1mgZr2BEjtR1ki4CknT4YuTGVOBP1
 FU862o9/LaygmJO9w1TiY/KDZ5Cx8AKPaAjRgzPMJsXCqpAZGuiJMJxCMsoPv8AjlE
 q6z9WpOD+2xSg==
Subject: Re: [PATCH] arc: perf: Move static structs to where they're really
 used
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org, Stephen Rothwell
 <sfr@canb.auug.org.au>, Mischa Jonker <Mischa.Jonker@synopsys.com>,
 Vineet Gupta <vgupta@kernel.org>
References: <20211129203707.28510-1-abrodkin@synopsys.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <23a16eb8-ccbe-e000-53a4-0b0dc2ffb1ad@kernel.org>
Date: Tue, 28 Dec 2021 19:47:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129203707.28510-1-abrodkin@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_194709_682329_3BF4F771 
X-CRM114-Status: GOOD (  14.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/29/21 12:37 PM, Alexey Brodkin wrote:
> It is all well described by Stephen Rothwell who initially spotted that:
> ----------------------------->8----------------------------
> After merging the origin tree, today's linux-next build (arc
> haps_hs_smp_defconfig+kselftest) produced these warnings:
>
> arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_map' defined but not used [-Wunused-const-variable=]
> arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_map' defined but not used [-Wunused-const-variable=]
>
> Introduced by commit 0dd450fe13da ("ARC: Add perf support for ARC700 cores")
>
> The 2 static arrays should be moved into arch/arc/kernel/perf_event.c
> (the only place that uses them). We get the warning because perf_event.h
> is also included by arch/arc/kernel/unaligned.c.
> ----------------------------->8----------------------------
>
> Could be easily reproduced by running make with "W=1" on any up-to-date
> sources, when extra warnings get enabled (in particular
> "-Wunused-const-variable"), otherwise disabled by default in the top-level
> Makefile as "These warnings generated too much noise in a regular build".
>
> Signed-off-by: Alexey Brodkin<abrodkin@synopsys.com>
> Cc: Stephen Rothwell<sfr@canb.auug.org.au>
> Cc: Mischa Jonker<mjonker@synopsys.com>
> Cc: Vineet Gupta<vgupta@kernel.org>

Added to ARC tree.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
