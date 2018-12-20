From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 03:49:26 +0000
Subject: [PATCH] ARC: adjust memblock_reserve of kernel memory
References: <20181219161616.10422-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750146422685@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/19/18 8:16 AM, Eugeniy Paltsev wrote:
> In setup_arch_memory we reserve the memory area wherein the kernel
> is located. Current implementation may reserve more memory than
> it actually required in case of CONFIG_LINUX_LINK_BASE is not
> equal to CONFIG_LINUX_RAM_BASE. This happens because we calculate
> start of the reserved region relatively to the CONFIG_LINUX_RAM_BASE
> and end of the region relatively to the CONFIG_LINUX_RAM_BASE.
>
> For example in case of HSDK board we wasted 256MiB of physical memory:
> ------------------->8------------------------------
> Memory: 770416K/1048576K available (5496K kernel code,
>     240K rwdata, 1064K rodata, 2200K init, 275K bss,
>     278160K reserved, 0K cma-reserved)
> ------------------->8------------------------------
>
> Fix that.
>
> Cc: stable at vger.kernel.org
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

LGTM. I presume you have booted HSDK with it and done some smoke testing.

-Vineet
