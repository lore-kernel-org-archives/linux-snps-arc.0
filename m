Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939A7E9D83B
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Apr 2026 05:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfM8AtGVtFYZQaYyfwuikQXQBHwy6I2eu/YKt6IhgDA=; b=iV3W8K1/pN/3Or
	85Go+Yjf+xfyUB0tHwkR5TNqrZBp4bIsB9fcEZS+3tCgchCm2dt0J7HpnYcuNf6nPoAW3xVGBBpmm
	mAW9+CYzFPZ+d4npBO0f2fPyG7y8g2qCtL835AtLyHopYy5BV96F0FM9NoYgaS8PNnxheHBTzRS6R
	wAGoyrKUAo0tD0+KF3fMkjS1wU+yMX/KfjBNElVkjD6SLdCSLIm5VN79CqzRArEpsQdk2opHhftwI
	x7cC0Udq/2paHZcgsKLLB48/lujgodO1RFmGQ42tvU54RxaFj6kMq+rfRzn4RWOyNxFVM6suoCjQt
	Ep8Tvh6LfbHDsRwz8OFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cqP-00000004p98-3kgu;
	Mon, 06 Apr 2026 05:49:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cqM-00000004p8S-348I;
	Mon, 06 Apr 2026 05:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F9B540DF5;
	Mon,  6 Apr 2026 05:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BD2C4CEF7;
	Mon,  6 Apr 2026 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775454589;
	bh=4thoVWcMmw4MkYMp3l5E6+QpX/OSrE+K9Cc8bqDe0Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgXI890rX05ktv9oPv33HQAY90wguIlq0zeVRBIbmeDKXLA/c1mE1e5ydxu7hcduI
	 kTZ9nO2+CkEVZjIDQGxe5bkfu2tmthXMLqKff1bqGFPaj+08+iHC08xjxc92g1DPEE
	 KwVzjDTLqo2zhZDXkIrcuY5ezh3/H92TsCyGn+R1UdZRVT4pOQwueRJNE+JlSFvysL
	 s3ofTuZZGE6Y2soiw9bIkJ/yTIdEF/ZL9+ftN7CICVlDH8rbwnbFFIAgWY4IyHBOsS
	 w2C3bcHMNGEXDzAizYg/NRL6FHwycOJuhBHTezD2YnqnSWkNgtd7JsDL5QtQx8LstU
	 +278O8yuLefAQ==
Date: Mon, 6 Apr 2026 11:19:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Saravana Kannan <saravanak@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>,
	Johan Hovold <johan@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Robin Murphy <robin.murphy@arm.com>, Frank.Li@kernel.org,
	alex@ghiti.fr, andre.przywara@arm.com, andrew@lunn.ch,
	aou@eecs.berkeley.edu, catalin.marinas@arm.com,
	dmaengine@vger.kernel.org, driver-core@lists.linux.dev,
	gregory.clement@bootlin.com, iommu@lists.linux.dev, jgg@ziepe.ca,
	kees@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
	linux@armlinux.org.uk, m.szyprowski@samsung.com, palmer@dabbelt.com,
	peter.ujfalusi@gmail.com, pjw@kernel.org,
	sebastian.hesselbarth@gmail.com, tsbogend@alpha.franken.de,
	vgupta@kernel.org, will@kernel.org, willy@infradead.org
Subject: Re: [PATCH v4 7/9] driver core: Replace dev->dma_coherent with
 dev_dma_coherent()
Message-ID: <adNJebiLoHqgQEyZ@vaman>
References: <20260404000644.522677-1-dianders@chromium.org>
 <20260403170432.v4.7.If839f6dde98979fce177f70c6c74689a1904ee76@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403170432.v4.7.If839f6dde98979fce177f70c6c74689a1904ee76@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_224950_811508_246660B1 
X-CRM114-Status: UNSURE (   5.81  )
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

On 03-04-26, 17:05, Douglas Anderson wrote:
> In C, bitfields are not necessarily safe to modify from multiple
> threads without locking. Switch "dma_coherent" over to the "flags"
> field so modifications are safe.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
