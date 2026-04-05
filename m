Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652F1E64012
	for <linux-snps-arc@archiver.kernel.org>; Sun,  5 Apr 2026 05:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jeQZEOdZXDKhR6a8fJ8pdm/rgq8oo34eAlglf3mCbU=; b=aZWYgt2TLz7rHI
	CpbO1t2EnOzPSx2gJAZmwE3xdIdSL8mZbz8+FDzFRjGw4nakdtI7lxNcVSgVRAGmQgUsEqgksHt4Z
	xkWQpKxsLCacuS7GSqFM9yJMn6OWCA1KW7ADQEgeLCcwYs/CRgbIBNutwMv25NgX7gDkDMGQa/Rw4
	uPOwcP6iHWd/TgppqqhUrCI4GmRwmul0+L2p8F+Ud70b9sIJRjY8uHCiBFPauP5PWJCXtiMvRIxlV
	mjrqq5WzOaF9PrInv0jwO9hXP4jXgubkuyGQUMU+IsqoUMxf1NG28nDopFDZiflVghliPjh9dr2Mv
	/SaxhQBW0c5xqLshPAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9G22-00000003yd4-0GzV;
	Sun, 05 Apr 2026 05:28:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9G1y-00000003ycV-1AAu;
	Sun, 05 Apr 2026 05:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3662A4385A;
	Sun,  5 Apr 2026 05:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B7DC116C6;
	Sun,  5 Apr 2026 05:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775366895;
	bh=ophk+hp6kRAG0U/TAGAhUuOrKmitf0U0PYwWZuudius=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bejAtE4V1Hz3lTSKLlyBcIyR+JNRKDGMc/G8Z0GN4ZPNsCF585rejSzukgcFioxub
	 QUbiyQrTx+RcM6s1+Zu0oaI1vfJoHXTXgrhOUb/YXCMVVE2KZgd+scb35TQsQF7wMb
	 a7Wf9qe7CdkvcplKMPdPqmr9WcFeVQib8uJGDZ1Y=
Date: Sun, 5 Apr 2026 07:27:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Saravana Kannan <saravanak@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>,
	Johan Hovold <johan@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, Frank.Li@kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, alex@ghiti.fr,
	alexander.stein@ew.tq-group.com, andre.przywara@arm.com,
	andrew@codeconstruct.com.au, andrew@lunn.ch,
	andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu,
	ardb@kernel.org, bhelgaas@google.com, brgl@kernel.org,
	broonie@kernel.org, catalin.marinas@arm.com, chleroy@kernel.org,
	davem@davemloft.net, david@kernel.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, driver-core@lists.linux.dev,
	gbatra@linux.ibm.com, gregory.clement@bootlin.com,
	hkallweit1@gmail.com, iommu@lists.linux.dev, jirislaby@kernel.org,
	joel@jms.id.au, joro@8bytes.org, kees@kernel.org,
	kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org,
	lgirdwood@gmail.com, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-usb@vger.kernel.org, linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com,
	maddy@linux.ibm.com, mani@kernel.org, maz@kernel.org,
	miko.lenczewski@arm.com, mpe@ellerman.id.au, netdev@vger.kernel.org,
	npiggin@gmail.com, osalvador@suse.de, oupton@kernel.org,
	pabeni@redhat.com, palmer@dabbelt.com, peter.ujfalusi@gmail.com,
	peterz@infradead.org, pjw@kernel.org, robh@kernel.org,
	sebastian.hesselbarth@gmail.com, tglx@kernel.org,
	tsbogend@alpha.franken.de, vgupta@kernel.org, vkoul@kernel.org,
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com,
	yeoreum.yun@arm.com
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
Message-ID: <2026040539-sponge-publisher-2b42@gregkh>
References: <20260404000644.522677-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260404000644.522677-1-dianders@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_222818_695864_30A7BB82 
X-CRM114-Status: GOOD (  19.15  )
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

On Fri, Apr 03, 2026 at 05:04:54PM -0700, Douglas Anderson wrote:
> NOTE: one potentially "controversial" choice I made in some patches
> was to always reserve a flag ID even if a flag is only used under
> certain CONFIG_ settings. This is a change from how things were
> before. Keeping the numbering consistent and allowing easy
> compile-testing of both CONFIG settings seemed worth it, especially
> since it won't take up any extra space until we've added a lot more
> flags.

Nah, this is fine, I don't see any problems with this as the original
code kind of was doing the same thing with the "hole" in the structure
if those options were not enabled.

> I only marked the first patch as a "Fix" since it is the only one
> fixing observed problems. Other patches could be considered fixes too
> if folks want.
> 
> I tested the first patch in the series backported to kernel 6.6 on the
> Pixel phone that was experiencing the race. I added extra printouts to
> make sure that the problem was hitting / addressed. The rest of the
> patches are tested with allmodconfig with arm32, arm64, ppc, and
> x86. I boot tested on an arm64 Chromebook running mainline.

I'm guessing your tests passed?  :)

Anyway, this looks great, unless there are any objections, other than
the "needs to be undefined", which a follow-on patch can handle, I'll
queue them up next week for 7.1-rc1.

thanks,

greg k-h

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
