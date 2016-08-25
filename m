From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 Aug 2016 12:05:19 +0000
Subject: [PATCH] ARC: Change ld.as instruction to regular ld.
In-Reply-To: <1471415037-14544-1-git-send-email-liavr@mellanox.com>
References: <1471415037-14544-1-git-send-email-liavr@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1472126602.2600.14.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Liav,

On Wed, 2016-08-17@09:23 +0300, Liav Rehana wrote:
> From: Liav Rehana <liavr at mellanox.com>
> 
> User mode callee regs are explicitly collected before signal delivery
> or breakpoint trap. r25 is special for kernel as it serves as task
> pointer, so user mode value is clobbered very early. It is saved in
> pt_regs where generally only scratch (caller saved) res are saved.
> The code to access the corresponding pt_regs location had a subtle bug
> as it was using load/store with scaling of offset, whereas the offset
> was already byte wise correct. So fix this by replacing LD.AS with a
> standard LD
> 
> Signed-off-by: Liav Rehana <liavr at mellanox.com>

That nice patch really fixes quite annoying issue when r25 got
printed improperly in gdb!

So

Tested-by: Alexey Brodkin <abrodkin at synopsys.com>
