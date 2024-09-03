Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9B6CD343F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Sep 2024 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnKzrs1DrnXyPkoC1V+10m88MMVFuj39ILLQo1m+J1k=; b=XiIkHGhG+q3YIZ
	ou3KsWj4SE2DKnLOZvODLW02tZPPrl8Iwihc80Cl0bxpt2xWBaR3u+4d7RgSOAgmY8zWqchx3l1Gk
	RCT5tRZpOU539kIfOIJTb9G9siSSKnZ9gp3GAik17Q/5A8RjLpZw/SY3hbIByPFJsYdxufMvk59Oq
	p4k7L42uTsGJbnRhA7OjhnTBlec4qTc/e9S9hChGIg0YIN40YLkvP2sxKj/DM3EbndnGyVBzrZHtU
	RHoT7WfAGLD6oFEFI7ZOydCo1ovT9cETSIyUPDEYmaYWJFnY/DYYl6Uc3i6RAqiYIxPQio6Hx0yRl
	TL7AltZCLlY1vX14av9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slafy-00000001uQy-29Di;
	Tue, 03 Sep 2024 21:02:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaf1-00000001uEc-0AI1;
	Tue, 03 Sep 2024 21:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1A8CA43F2D;
	Tue,  3 Sep 2024 21:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD49DC4CEC4;
	Tue,  3 Sep 2024 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725397317;
	bh=YlgYWrov2J1Ssj0+EKTW9v1CpfXqfqZj60bm9Xzp8gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=figUKZY/IW8+qj7UyVP2DYHB0tHl/V0Pgl7XXGOIlJCbEkzSModtPUp0dan0N5Myq
	 Q7rk+ptZvZZSVnYv3dSL3VCISr8aMuhGm92zZCxaA6oLTVHLOgWQWGPCWuqrB+VVUK
	 YbjcW2ZsfYoYx9vadxljtW++8Rmn7juctFToFEUFzLwpfx8pADCMx2XMQWif7Rp10D
	 516BJHWIOMlx/QI7FXzzITM5Hb6YmryY8/YcMj9jdcv02+EkIGTa+uiwEtOpJXdhuG
	 sms353NOhmcFQ8tdzyfUcKzEVhO51qCmV4Zc+Ed1Nl6edZeevKQKcJn4WhY4yXh4TU
	 fH+9xY7y2v5zA==
Date: Tue, 3 Sep 2024 23:01:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Dinh Nguyen <dinguyen@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, UNGLinuxDriver@microchip.com, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers
 under a single option
Message-ID: <3phynd24wmymhqugikbdwdzoa6vlzxwv5a6n6bk4446atbf7nu@c2kb766j3pcc>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_140159_169312_0FAD34D2 
X-CRM114-Status: UNSURE (   7.27  )
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

Hi Jarkko, Andy,

...

> Heikki Krogerus (7):
>   ARC: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>   ARM: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>   arm64: defconfig: enable I2C_DESIGNWARE_CORE with
>     I2C_DESIGNWARE_PLATFORM
>   mips: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>   RISC-V: configs: enable I2C_DESIGNWARE_CORE with
>     I2C_DESIGNWARE_PLATFORM
>   net: txgbe: Fix I2C Kconfig dependencies
>   i2c: designware: Group all DesignWare drivers under a single option

I believe you know this code already, do you mind giving it an
ack?

Thanks,
Andi

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
