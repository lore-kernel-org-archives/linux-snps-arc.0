Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADA0CF31A1
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Oct 2024 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K19WHCCuWwCVckETy1ecQnsgVCsLWQSxFSPAiGXZ9iw=; b=JTRrVqPjV3LFcx
	1jX1GKOKKqGIlhVgWedhCllwFeNVDz13xAIRJJi38dVZSms5TyTFImWnq+BQDy33l5aVkb/gLMG9a
	5hBpQcLYZMM6Px0hb5FNCjYrryDHggmdZr8xLOQTkw17ibQgUFInZx5o3Ah22/ZxkcD26GnUhLEy3
	AeLgipQmg5x4JydsEEnCxX05TCrms9WeKkVh1yDsFiFp1sYPYylfpVCVxw4a/oeWE5PB7PFkVx4RC
	+v5sL1mU9XiD56FmteIBOG46PW3AKIgdMyoc4QIKejaNZQZyNiSq3bKHgFtYn1VN+uIG0kDMRag6P
	Yry+tjmw8mTASFBtQUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svv0e-00000005Cy5-0vHA;
	Wed, 02 Oct 2024 08:47:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svuzN-00000005Cnv-2I0u;
	Wed, 02 Oct 2024 08:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED535A438B2;
	Wed,  2 Oct 2024 08:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDA1C4CEC5;
	Wed,  2 Oct 2024 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727858739;
	bh=ZNdZFT18mQ1lN/bjqCggbwwAzWJR89AvH5K81CBVTvQ=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=Bi2J1ZVJtG4RrRLL13E1yemINsID3cZrYStPPZxtvqYRBzbFORYjnSeY5x/OOCN9L
	 uA13xjBwIKy8Epl7WI3AWxcqUCIQimdJIeFnkrQPItiynBOj5BcynyafFjDexWS9O8
	 2zN4oFalEhI46K5cBugoawtU9P4AE1V26XZu/fsOwGyIf4Q5JOq71RwcieBs91EV7f
	 qihFccA1yuRbLaLKF3yKcpowS8IkZvpJMpwd9P/dalFHSU9sjb6uKRwJYPOWT5BjSA
	 X1mBXC9wRN+Kk//nN+nnxX+lq9b0dFiQIEFC7lMHL3KgBqiTQL9E7OKzGyytbbdKH2
	 Zqk4aVC0uaKMQ==
Date: Wed, 2 Oct 2024 10:45:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-riscv@lists.infradead.org, jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vgupta@kernel.org, linux@armlinux.org.uk, dinguyen@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, alexandre.belloni@bootlin.com, 
	tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jiawenwu@trustnetic.com, mengyuanlou@net-swift.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, UNGLinuxDriver@microchip.com, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers
 under a single option
Message-ID: <wrougv6kwuuv2ba33vyyeou5evxov7l7jvp5ezvzgpf3vra3tr@euug6qu55q2t>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
 <172778251300.314421.9094418199342099537.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <172778251300.314421.9094418199342099537.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_014541_670002_779C0C82 
X-CRM114-Status: GOOD (  13.65  )
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

Hi,

On Tue, Oct 01, 2024 at 11:35:13AM GMT, patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
> 
> This patch was applied to riscv/linux.git (fixes)
> by Andi Shyti <andi.shyti@kernel.org>:
> 
> On Tue,  3 Sep 2024 17:24:59 +0300 you wrote:
> > Hi guys,
> > 
> > This is a proposal for Kconfig improvement regarding the Synopsys
> > DesignWare I2C adapter driver.
> > 
> > Changes since v1:
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v2,5/7] RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>     https://git.kernel.org/riscv/c/0175b1d3c6df

This patch has already been taken and merged to mainline through
i2c.

Andi

> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
