Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202A3105D98A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Apr 2026 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OD49YYlcMVPNZvn+j84qncUJuBfPu8h4uzTudpQkgkQ=; b=Hs9LC6OBr0NfGA
	Cb/VDovk9JllHABgpL+acpHDTTQQSMtg8kUeU+2yGkYKg4EHtykI3WMWdUmK4S+AuLT6E5/bec86s
	l2mqFJdLFBr0jV0b3Ig0XjgET/V2RLgq9D1f7VS8R0rcga1bwZkZfz2AWnqqRw+n/OUTznL34R2be
	PPfj5oRpDtBFD4qeJpIF7e8/XU1tcl3m4B2SquXcCS8Nx69550ficB87mLAgrCeDuciW0EQZ3ZXQo
	Fbm+3GGTTHGauKEL86yXCl3ObH3RxsUr/NyD1BPOtPRvJrM7N3osPSsHxayTfgJbkCEsSt6ljRCyQ
	tpeZTRaKD8qwMAMIkMXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAFNh-00000007zty-26s8;
	Tue, 07 Apr 2026 22:58:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAFNg-00000007zti-1LSq;
	Tue, 07 Apr 2026 22:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4480660128;
	Tue,  7 Apr 2026 22:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C69C116C6;
	Tue,  7 Apr 2026 22:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775602726;
	bh=ZxMhQkn/NMJTsfUq+eNI5wRqTDBwCQBg1cjTyGaGSzA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YxT4H0gMU1uiOeHwbtOxxGkfFWJBaCzthqg03Sftf8l9d186Y09INkfJ8VCpcsjUT
	 Qfd/Qlw+XjxQGpsD/+wtJtFtyh3etr3/mtV9qhSmixByvSXfzBB7nBSEJNPsodmdHd
	 n6aWnXLqcu6DDQCkFID7N0ab2dedIpF0ftmNXCcvehsYTzafVVvpTSGtJI0Yt78qAh
	 7zcrBzbK4e2mGEgKbxfT4/RQOcj3aPhgKqv9IwN+ABisbMsvBq2hQAvVVGI9l26vIJ
	 NOji8KIk0pikMh4DCWmZrmRQsTJnp7fjTB24k9B9hx+3b4Laf7gnEUw1IEsuOG28xo
	 +wM+h43SmOleg==
Mime-Version: 1.0
Date: Wed, 08 Apr 2026 00:58:28 +0200
Message-Id: <DHNAMNISZJ9O.3B58NWX64GBGE@kernel.org>
Subject: Re: [PATCH v5 0/9] driver core: Fix some race conditions
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>, "Alexey
 Kardashevskiy" <aik@ozlabs.ru>, "Johan Hovold" <johan@kernel.org>, "Eric
 Dumazet" <edumazet@google.com>, "Leon Romanovsky" <leon@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>, <maz@kernel.org>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Saravana Kannan" <saravanak@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, <Frank.Li@kernel.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, <alex@ghiti.fr>,
 <alexander.stein@ew.tq-group.com>, <andre.przywara@arm.com>,
 <andrew@codeconstruct.com.au>, <andrew@lunn.ch>,
 <andriy.shevchenko@linux.intel.com>, <aou@eecs.berkeley.edu>,
 <ardb@kernel.org>, <astewart@tektelic.com>, <bhelgaas@google.com>,
 <brgl@kernel.org>, <broonie@kernel.org>, <catalin.marinas@arm.com>,
 <chleroy@kernel.org>, <davem@davemloft.net>, <david@kernel.org>,
 <devicetree@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <gbatra@linux.ibm.com>,
 <gregory.clement@bootlin.com>, <hkallweit1@gmail.com>,
 <iommu@lists.linux.dev>, <jirislaby@kernel.org>, <joel@jms.id.au>,
 <joro@8bytes.org>, <kees@kernel.org>, <kevin.brodsky@arm.com>,
 <kuba@kernel.org>, <lenb@kernel.org>, <lgirdwood@gmail.com>,
 <linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-cxl@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-pci@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-snps-arc@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux@armlinux.org.uk>, <linuxppc-dev@lists.ozlabs.org>,
 <maddy@linux.ibm.com>, <mani@kernel.org>, <miko.lenczewski@arm.com>,
 <mpe@ellerman.id.au>, <netdev@vger.kernel.org>, <npiggin@gmail.com>,
 <osalvador@suse.de>, <oupton@kernel.org>, <pabeni@redhat.com>,
 <palmer@dabbelt.com>, <peter.ujfalusi@gmail.com>, <peterz@infradead.org>,
 <pjw@kernel.org>, <robh@kernel.org>, <sebastian.hesselbarth@gmail.com>,
 <tglx@kernel.org>, <tsbogend@alpha.franken.de>, <vgupta@kernel.org>,
 <vkoul@kernel.org>, <will@kernel.org>, <willy@infradead.org>,
 <yangyicong@hisilicon.com>, <yeoreum.yun@arm.com>
To: "Douglas Anderson" <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260406232444.3117516-1-dianders@chromium.org>
In-Reply-To: <20260406232444.3117516-1-dianders@chromium.org>
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

On Tue Apr 7, 2026 at 1:22 AM CEST, Douglas Anderson wrote:

Applied to driver-core-testing, thanks!

> Douglas Anderson (9):
>   driver core: Don't let a device probe until it's ready
>   driver core: Replace dev->can_match with dev_can_match()
>   driver core: Replace dev->dma_iommu with dev_dma_iommu()
>   driver core: Replace dev->dma_skip_sync with dev_dma_skip_sync()
>   driver core: Replace dev->dma_ops_bypass with dev_dma_ops_bypass()
>   driver core: Replace dev->state_synced with dev_state_synced()
>   driver core: Replace dev->dma_coherent with dev_dma_coherent()

    [ Since all DEV_FLAG_DMA_COHERENT accessors are exposed unconditionally,
      also drop the CONFIG guards around dev_assign_dma_coherent() in
      device_initialize() to ensure a correct default value. - Danilo ]

>   driver core: Replace dev->of_node_reused with dev_of_node_reused()
>   driver core: Replace dev->offline + ->offline_disabled with accessors

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
