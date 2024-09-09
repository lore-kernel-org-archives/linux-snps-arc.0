Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575A2ECE587
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Sep 2024 19:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82iSPajSCSifIITuc3Jmwv5Duifgu0oq1K0d6DImN+I=; b=cH60csFvpHp3cQ
	QG3y/fbwix00HUvHmodYtri9XSH0wQ2jLU46gM3gu8Y0fdIfNL57Fyu8+XoJbMHEGfTX/lvc2IIxf
	6VV2RSWGkiD62yeyPn727bEuny+23pmA5PMjkZASncBuay/kLGrXia88s8ovWT5Q6A4vKhZgaEXrX
	KQr9Kuge7/pmR3mZfj7ricUhv4gJYKUHe0+TL4fr4hKtoHJvLJZdqjKfTnpYWGORtdlBHFeFMGa1x
	0+nR1d9BMVjL1Z3Xcm7qlB9XCkrTl0t7Wsmmw5w8g09A4AKt0UVSHDE38rnxIj9LFeScST8r5nRy6
	aUe/4BKWd2vF0OYyfYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjxp-000000034BD-33c9;
	Mon, 09 Sep 2024 19:22:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjwo-0000000343B-0xfZ;
	Mon, 09 Sep 2024 19:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54A23A4322F;
	Mon,  9 Sep 2024 19:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF463C4CEC5;
	Mon,  9 Sep 2024 19:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725909672;
	bh=9bJSDQBGO7k0Jh0GnFnt1TFpIGhSJEn1itkvE6YG00w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaV47taXUvlO1IM/k32cr5uPBzJDKZbuBq1ir7Km9ali579z3EsSWJZ3uqvn4pt82
	 mrwJHXJ4Oi1oaOXPUU5TTDr5F6XrmRrUPPaAy5Vkkc03quK+06VsS4FQtazG7pYIbl
	 QxWUcd6IzmAL9nuuQjPPzYrUXLoZi3FwADB4sCrsxMmlff6xaSwNBTR+NyWTHQU0Oh
	 PAKzvKsHz8hIuiPKUjoE/h2PxenDYTMv5b3sE/TdDO1u5IHGM7mwtNsY4cDmHu16WN
	 nAKAkvv+xm63cCPYbRYmV4/nNBGpHPq9ouwePxQ0gKsEls1ZyqVd8WYD8v1U81pySk
	 HWylKm5zar/Fw==
Date: Mon, 9 Sep 2024 21:21:08 +0200
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
Message-ID: <y3b5aalxlqifobajynik3b7v4xicukuq66kwmpydvcntij4k5b@epqcjrureczj>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_122114_352844_6D2EDED2 
X-CRM114-Status: UNSURE (   6.58  )
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

Hi Heikki,

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

Merged to i2c/i2c-host.

Thanks,
Andi

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
