From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Wed, 8 May 2019 07:28:57 +0000
Subject: [PATCH] ARC: [plat-hsdk]: Add missing multicast filter bins
 number to GMAC node
In-Reply-To: <1557166759.17021.9.camel@synopsys.com>
References: <7f36bbadc0df4c93c396690dab59f34775de3874.1556788240.git.joabreu@synopsys.com>
 <56933076-879c-78a0-4bae-2613203b93b1@synopsys.com>
 <1557166759.17021.9.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B478870@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Eugeniy Paltsev <paltsev@synopsys.com>
Date: Mon, May 06, 2019 at 19:19:20

> Hi,
> 
> I'll check this in the next few days.
> 

I also noticed that FIFO size entry is missing. DWMAC1000 does not 
support automatic FIFO size detection so this entry needs to be added.

Thanks,
Jose Miguel Abreu
