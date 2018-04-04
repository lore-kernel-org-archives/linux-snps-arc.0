From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 4 Apr 2018 15:21:33 +0000
Subject: [PATCH v6 04/16] arc: Switch to generic free_initrd_mem.
In-Reply-To: <20180401145931.7932-4-shea@shealevy.com>
References: <20180329113207.30674-1-shea@shealevy.com>
 <20180401145931.7932-1-shea@shealevy.com>
 <20180401145931.7932-4-shea@shealevy.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1522855291.4851.34.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Shea,

On Sun, 2018-04-01@10:59 -0400, Shea Levy wrote:
> The first patch in this series added a weakly-defined generic
> implementation, which is functionally identical to the
> architecture-specific one removed here.
> 
> Series boot-tested on RISC-V (which now uses the generic
> implementation) and x86_64 (which doesn't).
> 
> Signed-off-by: Shea Levy <shea at shealevy.com>

Boot-tested on ARC, thus...

Tested-by: Alexey Brodkin <abrodkin at synopsys.com>

-Alexey

P.S. Note Vineet is out this week so please wait for him to return
next week to ack your patch.
