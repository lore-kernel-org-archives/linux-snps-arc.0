Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D05CE7D12
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Oct 2024 11:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DdbQvBgGsOv1gpJ5tW1EU2hGarfoQIfUh0kU4RtGBw=; b=GQsqElJLG/EloH
	w0VuBMf0cF0FnPXQ8Nk/moHD2QZ+iZ/8tR57q0jKNzD2xjSG60twdreZbP3c3fbhmxNerjE4bdDNb
	whowfl/jWfOUCmgCTznrwnsE27piRWMoTCfflY26Q6OXTC8Hspwpgi9+kh/MFfboz5HMnfZAgq1vN
	5bco+DNmDlAg19tNAUGZ/bFD5zbwby9m33Bl4oxqbmPeE8ai4loXllzv62opumz5YmFf80mE0UVUn
	+wsuqXh5TBOkuOHpRqJ6+jCgFUzjbQpXpavySTgnWevxneSkO7NV612js8TOfG0tbu961MBCkr97/
	To8nqIAG+14xfOI0qWfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbPU-00000002aUo-05ly;
	Tue, 01 Oct 2024 11:51:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb9r-00000002XId-1TNT;
	Tue, 01 Oct 2024 11:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12F06A435A6;
	Tue,  1 Oct 2024 11:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEABC4CECD;
	Tue,  1 Oct 2024 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782510;
	bh=ejwveurcpiVUAMtfc3MmS1K+nDymKKvZqi9zObr58qA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Idet+m9hEi7jJ4H+tzI8sgt1F12+rWXx1hzKRoo7R7Vf/Xgvmsut0lmGxVftjGc4w
	 KAkhiLDqoZFsGDzodrIzAnLMdPPxitEcu0n6U5HgYzxt4L2S6gIwY+fgfhF1k7wxoz
	 2+FBjBo+hRVPRIZWLB/GKaPvc+9QoClDEjrsbL1+t16nIotas4nqW3sqGCfYA4TNGR
	 9pY3xePlrMnjdALt+1E5qo/rLXuO3Owi1jAp6pbIHZlwfkw/tU3Xd1WZCCzW4D6drq
	 loW/aFF2yqMB9IiQJ+EExy6Z/EXu5CKGkmsKZBNhTHsfX66ugaDTc63cZsek8LSRu0
	 4d8+s1QstP60w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C33380DBF7;
	Tue,  1 Oct 2024 11:35:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers under a
 single option
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172778251300.314421.9094418199342099537.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:13 +0000
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, andi.shyti@kernel.org,
 jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, vgupta@kernel.org, linux@armlinux.org.uk,
 dinguyen@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 alexandre.belloni@bootlin.com, tsbogend@alpha.franken.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 jiawenwu@trustnetic.com, mengyuanlou@net-swift.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043511_623652_5D3B2DDA 
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andi Shyti <andi.shyti@kernel.org>:

On Tue,  3 Sep 2024 17:24:59 +0300 you wrote:
> Hi guys,
> 
> This is a proposal for Kconfig improvement regarding the Synopsys
> DesignWare I2C adapter driver.
> 
> Changes since v1:
> 
> [...]

Here is the summary with links:
  - [v2,5/7] RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
    https://git.kernel.org/riscv/c/0175b1d3c6df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
