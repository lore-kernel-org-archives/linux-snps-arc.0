From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 May 2017 10:55:04 +0000
Subject: [PATCH 01/10] ARC: set level of log per CPU during boot to be
 debug level
In-Reply-To: <1495679660-9598-2-git-send-email-noamca@mellanox.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-2-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495709703.5393.20.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

On Thu, 2017-05-25@05:34 +0300, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> The reasons are:
> 1) speeding up boot time, becomes critical for many CPUs machine,
> ???e.g. NPS400 with 4K CPUs
> 2) shorten kernel log at boot time, again easy to scan for large
> ???scale machines such NPS400
> 
> Signed-off-by: Noam Camus <noamca at mellanox.com>

I do understand your concern on getting 4k instances of pretty much the same
boiler plates for each core in NPS. But even in real life those headers
provide quite important information on what is user's HW and SW configuration.
That said for more generic use-cases especially when we have just a few cores
I'd say those messages really make sense.

What we may also do for example add "ccflags += -DDEBUG" in arch/arc/Makefile
so all pr_debug() instances again start to print messages in console. But do it say
only if !EzChip's platform is selected. So it keeps everything as it is for non-EzChip
cases and makes you guys happy as you no longer see those 4096 headers.

Let's see what Vineet says.

-Alexey
