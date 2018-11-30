From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 30 Nov 2018 19:29:44 +0000
Subject: [PATCH v3] ARC: io.h: Implement reads{x}()/writes{x}()
References: <244eba764469e8493f2d0c85a6d965aad6cd8128.1543571088.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641A449@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/30/18 1:47 AM, Jose Abreu wrote:
> Some ARC CPU's do not support unaligned loads/stores. Currently, generic
> implementation of reads{b/w/l}()/writes{b/w/l}() is being used with ARC.
> This can lead to misfunction of some drivers as generic functions do a
> plain dereference of a pointer that can be unaligned.
>
> Let's use {get/put}_unaligned() helpers instead of plain dereference of
> pointer in order to fix. The helpers allow to get and store data from an
> unaligned address whilst preserving the CPU internal alignment.
> According to [1], the use of these helpers are costly in terms of
> performance so we added an initial check for a buffer already aligned so
> that the usage of the helpers can be avoided, when possible.
>
> [1] Documentation/unaligned-memory-access.txt
>
> Changes from v2:
> - Rework commit msg (Vineet)
> - Check if count is 0 and return (Vineet)
> - Use two different loops (Vineet)
>
> Changes from v1:
> - Check if buffer is already aligned (David)
> - Remove 64 bit mention (Alexey)
>
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> Tested-by: Vitor Soares <soares at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Joao Pinto <jpinto at synopsys.com>
> Cc: Vitor Soares <soares at synopsys.com>
> Cc: David Laight <David.Laight at ACULAB.COM>

Applied to for-curr after some minor chg (added a comment about accessor)

Thx,
-Vineet
