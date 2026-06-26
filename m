Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5CFCD4F26
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Jun 2026 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bvcpmVB8RPsj0h02kXvph6jpMIg90vK5ea/4nzyFAQ=; b=eW9oGWRJK1RBwu
	eaTh5MWRwiY+aOWW+t9Bdj+D8R2KN2URU0dkh8EaN3x0c6PKRkuMS7EYhVTO9e3JE2wJSvT8EoYnV
	mKwiQH05ZF/HNxoPQ8qZQPLecYsMLVtQJyk1fPnnyvprJgIq9frRu8dwDJEyUF946dAo3DXmYNjcW
	3E/+XFgiw1sUlS53p0fSmsvhZoiDm37z6YeMAW0gZkiQB69eDZuot6Tbw/+MyUfKaO+k70p6zg1Cj
	82K1Vpu1BYBdey6ztLBT9P1i7c1EmtLmR8mItCX/t8b9W2pockaOrU8XdI8I6r3zLV2VE9f9NBMS2
	fTmSmzwnPpiy+6p2gA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1pD-0000000Ap1k-1yaI;
	Fri, 26 Jun 2026 08:22:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1ov-0000000AoIf-1xoO;
	Fri, 26 Jun 2026 08:21:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 085944430E;
	Fri, 26 Jun 2026 08:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDAC1F00A3A;
	Fri, 26 Jun 2026 08:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462112;
	bh=7N6xFs6HldNaJtHXB+1so7kMQ4CsatgFOfKvzUpfQ6c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DLkaMOoe7jjLq0zrWVM7g5T3weWBVn0GKvdUrsWL1NS6Qs/YGb/jSI/OCz0xvfzqS
	 Qaym8bn+YQ7Yv3mFvqa3JZPMQyeTT1JkI61/DRV2mqoJOQ6RCZahCcrN/sZ0P41GxN
	 lQMkVEyzffwbljfjI4cRAmJFH6TA/MXXocYqdJ0r2fyaFbY7MUFYbzOT2mQ1bO9ESQ
	 aXENlZ4+KidZLyWpFEQCN/4TQ2SdvjPzYQw0gZqKyFHWnTN9MR5o7FqI9NLTieKhiJ
	 eEE7hw/g70YQVjdOMlBaDUGyYwudw/LY4An0H/3ioGWkJoeS59H947CE7rYTKgUHWr
	 baMoIKRFCt04w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199D639389E8;
	Fri, 26 Jun 2026 08:21:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/9] driver core: Fix some race conditions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246209959.3816447.5329631417058038374.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:39 +0000
References: <20260406232444.3117516-1-dianders@chromium.org>
In-Reply-To: <20260406232444.3117516-1-dianders@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-riscv@lists.infradead.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, stern@rowland.harvard.edu, aik@ozlabs.ru,
 johan@kernel.org, edumazet@google.com, leon@kernel.org, hch@lst.de,
 robin.murphy@arm.com, maz@kernel.org, aleksander.lobakin@intel.com,
 saravanak@kernel.org, akpm@linux-foundation.org, Frank.Li@kernel.org,
 jgg@ziepe.ca, alex@ghiti.fr, alexander.stein@ew.tq-group.com,
 andre.przywara@arm.com, andrew@codeconstruct.com.au, andrew@lunn.ch,
 andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu, ardb@kernel.org,
 astewart@tektelic.com, bhelgaas@google.com, brgl@kernel.org,
 broonie@kernel.org, catalin.marinas@arm.com, chleroy@kernel.org,
 davem@davemloft.net, david@kernel.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, driver-core@lists.linux.dev, gbatra@linux.ibm.com,
 gregory.clement@bootlin.com, hkallweit1@gmail.com, iommu@lists.linux.dev,
 jirislaby@kernel.org, joel@jms.id.au, joro@8bytes.org, kees@kernel.org,
 kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org, lgirdwood@gmail.com,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-usb@vger.kernel.org,
 linux@armlinux.org.uk, linuxppc-dev@lists.ozlabs.org,
 m.szyprowski@samsung.com, maddy@linux.ibm.com, mani@kernel.org,
 miko.lenczewski@arm.com, mpe@ellerman.id.au, netdev@vger.kernel.org,
 npiggin@gmail.com, osalvador@suse.de, oupton@kernel.org, pabeni@redhat.com,
 palmer@dabbelt.com, peter.ujfalusi@gmail.com, peterz@infradead.org,
 pjw@kernel.org, robh@kernel.org, sebastian.hesselbarth@gmail.com,
 tglx@kernel.org, tsbogend@alpha.franken.de, vgupta@kernel.org,
 vkoul@kernel.org, will@kernel.org, willy@infradead.org,
 yangyicong@hisilicon.com, yeoreum.yun@arm.com
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
by Danilo Krummrich <dakr@kernel.org>:

On Mon,  6 Apr 2026 16:22:53 -0700 you wrote:
> The main goal of this series is to fix the observed bug talked about
> in the first patch ("driver core: Don't let a device probe until it's
> ready"). That patch fixes a problem that has been observed in the real
> world and could land even if the rest of the patches are found
> unacceptable or need to be spun.
> 
> That said, during patch review Danilo correctly pointed out that many
> of the bitfield accesses in "struct device" are unsafe. I added a
> bunch of patches in the series to address each one.
> 
> [...]

Here is the summary with links:
  - [v5,7/9] driver core: Replace dev->dma_coherent with dev_dma_coherent()
    https://git.kernel.org/riscv/c/3e2c1e213ac2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
