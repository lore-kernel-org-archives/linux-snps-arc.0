From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 17 Aug 2016 10:16:44 -0700
Subject: [PATCH] ARC: Change ld.as instruction to regular ld.
In-Reply-To: <1471415037-14544-1-git-send-email-liavr@mellanox.com>
References: <1471415037-14544-1-git-send-email-liavr@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fceb8e24-0c94-a84d-5ed8-7fbe33f369d4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/16/2016 11:24 PM, Liav Rehana wrote:
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

Thx for the fix Liv.
I added it to my for-curr.

-Vineet
