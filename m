Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65EBE64019
	for <linux-snps-arc@archiver.kernel.org>; Sun,  5 Apr 2026 12:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xm/U70m7y4HIcgzf25G0H03WtFbD0A/6BOdJLNHM1M=; b=0bpIrHXFJjctIb
	wCtalJ0B4wGXKgI3xe/2gbXwmEWxI3mWqe02zEj+LqFft+j/PZKAoEhLtlShTzxKfnplSOi4uI1fe
	bPKZDQMUcY9rW64t+tfeKcMm7/6vS4FbznlaUn9vD8Kxrugpiu2YQFcMfh1xwAR8Z2CnGxJQ5LmyO
	APcUzkTqtvAULkdWcNAuviKtYpgMXloA136qbNWZfjO6DbpZ/dXWsJSg0iJv1f8aSDYgODZM1Y5jI
	+ezp5NkVpC87Ki/R7bjp2TgPVcksoAI3Q97wbZWiypgdz9EUVinUSCHWeVpnv8eIxISXdYcbTtB5+
	JnK7jhRKcODtZYSpRZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9MBr-00000004BPx-0u9U;
	Sun, 05 Apr 2026 12:02:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9MBn-00000004BPN-2fHH;
	Sun, 05 Apr 2026 12:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0569436C8;
	Sun,  5 Apr 2026 12:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E64C19424;
	Sun,  5 Apr 2026 12:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775390569;
	bh=VwXIPBbp0EIzPNtpB2Kh8OUpJCymQVJw7CRWHLQnyH0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=qQwwCeNj+saJT57yAG47jboL8X78w4/j6WpBJ1RZ4sp8PWbMz7XsL9EDbWtj55Eiv
	 28aGEHxX84zqCSRKzt5WxDYhK2mKne18FSkXEYY++OZ6+IBYaBKFZkA86MS9bLh9Oc
	 BYyORiDakrz6RnLk4LVZHvUx8P1LQpa7pCp8fHnA1nA9F6ZvrAlepEALLMXhhTHNG5
	 7JaVWay0RJB3NcEhdmqtS8VF3DnUGPXm4QkCgawXIaUT/QfRxlFCiXeEIfDZt6r6xg
	 I3uj6fM0ROLbqxk5+qZJNhPISl9Q1iNQvp6vF94UFTOtVMPHy01bKsqbxAmGzThrrM
	 mtqWeRGNpMg3w==
Mime-Version: 1.0
Date: Sun, 05 Apr 2026 14:02:33 +0200
Message-Id: <DHL7FCNQ20PA.2K03T8MNSO9TT@kernel.org>
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
Cc: "Douglas Anderson" <dianders@chromium.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>, "Saravana
 Kannan" <saravanak@kernel.org>, "Christoph Hellwig" <hch@lst.de>, "Eric
 Dumazet" <edumazet@google.com>, "Johan Hovold" <johan@kernel.org>, "Leon
 Romanovsky" <leon@kernel.org>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Alexey Kardashevskiy" <aik@ozlabs.ru>,
 "Robin Murphy" <robin.murphy@arm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, <Frank.Li@kernel.org>, "Jason Gunthorpe"
 <jgg@ziepe.ca>, <alex@ghiti.fr>, <alexander.stein@ew.tq-group.com>,
 <andre.przywara@arm.com>, <andrew@codeconstruct.com.au>, <andrew@lunn.ch>,
 <andriy.shevchenko@linux.intel.com>, <aou@eecs.berkeley.edu>,
 <ardb@kernel.org>, <bhelgaas@google.com>, <brgl@kernel.org>,
 <broonie@kernel.org>, <catalin.marinas@arm.com>, <chleroy@kernel.org>,
 <davem@davemloft.net>, <david@kernel.org>, <devicetree@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <gbatra@linux.ibm.com>, <gregory.clement@bootlin.com>,
 <hkallweit1@gmail.com>, <iommu@lists.linux.dev>, <jirislaby@kernel.org>,
 <joel@jms.id.au>, <joro@8bytes.org>, <kees@kernel.org>,
 <kevin.brodsky@arm.com>, <kuba@kernel.org>, <lenb@kernel.org>,
 <lgirdwood@gmail.com>, <linux-acpi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-cxl@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-serial@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <linux@armlinux.org.uk>,
 <linuxppc-dev@lists.ozlabs.org>, <m.szyprowski@samsung.com>,
 <maddy@linux.ibm.com>, <mani@kernel.org>, <maz@kernel.org>,
 <miko.lenczewski@arm.com>, <mpe@ellerman.id.au>, <netdev@vger.kernel.org>,
 <npiggin@gmail.com>, <osalvador@suse.de>, <oupton@kernel.org>,
 <pabeni@redhat.com>, <palmer@dabbelt.com>, <peter.ujfalusi@gmail.com>,
 <peterz@infradead.org>, <pjw@kernel.org>, <robh@kernel.org>,
 <sebastian.hesselbarth@gmail.com>, <tglx@kernel.org>,
 <tsbogend@alpha.franken.de>, <vgupta@kernel.org>, <vkoul@kernel.org>,
 <will@kernel.org>, <willy@infradead.org>, <yangyicong@hisilicon.com>,
 <yeoreum.yun@arm.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260404000644.522677-1-dianders@chromium.org>
 <2026040539-sponge-publisher-2b42@gregkh>
In-Reply-To: <2026040539-sponge-publisher-2b42@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_050251_701990_0A71BC2F 
X-CRM114-Status: UNSURE (   4.12  )
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

On Sun Apr 5, 2026 at 7:27 AM CEST, Greg Kroah-Hartman wrote:
> Anyway, this looks great, unless there are any objections, other than
> the "needs to be undefined", which a follow-on patch can handle, I'll
> queue them up next week for 7.1-rc1.

Sounds good, for the series:

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
