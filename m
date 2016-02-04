From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 04 Feb 2016 16:22:19 +0100
Subject: [PATCH v7 2/2] add new platform driver for PCI RC
In-Reply-To: <56B35B96.3090005@synopsys.com>
References: <cover.1454349430.git.jpinto@synopsys.com>
 <56B33278.3000408@synopsys.com> <56B35B96.3090005@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3373582.ygj8SQ4T4P@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Thursday 04 February 2016 14:09:26 Joao Pinto wrote:
> Hi Bjorn and Arnd,
> 
> Removing the irq_handler causes the irq request to fail because in
> request_threaded_irq() both handler and thread_fn are NULL.
> 
> What's the typical procedure for this?
> 

Don't call request_irq? ;-)

	Arnd
