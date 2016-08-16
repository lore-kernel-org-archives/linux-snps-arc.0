From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 16 Aug 2016 13:15:33 +0000
Subject: [PATCH] ARC: Change ld.as instruction to regular ld.
In-Reply-To: <1471334135-21801-1-git-send-email-liavr@mellanox.com>
References: <1471334135-21801-1-git-send-email-liavr@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471353226.3980.42.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Liav,

On Tue, 2016-08-16@10:55 +0300, Liav Rehana wrote:
> From: Liav Rehana <liavr at mellanox.com>
> 
> The instruction ld.as takes as operands a base address and an offset,
> and doesn't access the sum of these two, but the sum of the base
> address and a shifted version of the offset.
> This isn't what we want in that case, since it causes a bug during
> the push and pop of r25, since his actual offset is given during
> resume_user_mode_begin.
> Thus, the use of ld solves this problem.
> 
> Signed-off-by: Liav Rehana <liavr at mellanox.com>
> ---

Very nice catch!

But IMHO description could be improved a little bit.
Probably something like that:
--------------------->8---------------------
"PT_user_r25" is offset in bytes within pt_regs structure.

In its turn what "ld.as r1, [r2, x]" really does is
r1 <- load_from(r2 + (x << data_size)) = load_from(r2 + x*4).

But the code in question is supposed to load_from(r2 + x).

This leads to obvious stack corruption.
--------------------->8---------------------

Reviewed-by: Alexey Brodkin <abrodkin at synopsys.com>
