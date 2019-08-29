From: gustavo@embeddedor.com (Gustavo A. R. Silva)
Date: Wed, 28 Aug 2019 20:47:33 -0500
Subject: [PATCH] ARC: unwind: Mark expected switch fall-through
In-Reply-To: <20190821012907.GA29165@embeddedor>
References: <20190821012907.GA29165@embeddedor>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2c3ef09b-bd07-6caf-05a9-908700a60afd@embeddedor.com>
To: linux-snps-arc@lists.infradead.org

Hi,

Friendly ping:

Who can take this, please?

Thanks
--
Gustavo

On 8/20/19 8:29 PM, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warnings (Building: haps_hs_defconfig arc):
> 
> arch/arc/kernel/unwind.c: In function ?read_pointer?:
> ./include/linux/compiler.h:328:5: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   do {        \
>      ^
> ./include/linux/compiler.h:338:2: note: in expansion of macro ?__compiletime_assert?
>   __compiletime_assert(condition, msg, prefix, suffix)
>   ^~~~~~~~~~~~~~~~~~~~
> ./include/linux/compiler.h:350:2: note: in expansion of macro ?_compiletime_assert?
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>   ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro ?compiletime_assert?
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:50:2: note: in expansion of macro ?BUILD_BUG_ON_MSG?
>   BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>   ^~~~~~~~~~~~~~~~
> arch/arc/kernel/unwind.c:573:3: note: in expansion of macro ?BUILD_BUG_ON?
>    BUILD_BUG_ON(sizeof(u32) != sizeof(value));
>    ^~~~~~~~~~~~
> arch/arc/kernel/unwind.c:575:2: note: here
>   case DW_EH_PE_native:
>   ^~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo at embeddedor.com>
> ---
>  arch/arc/kernel/unwind.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
> index 445e4d702f43..dc05a63516f5 100644
> --- a/arch/arc/kernel/unwind.c
> +++ b/arch/arc/kernel/unwind.c
> @@ -572,6 +572,7 @@ static unsigned long read_pointer(const u8 **pLoc, const void *end,
>  #else
>  		BUILD_BUG_ON(sizeof(u32) != sizeof(value));
>  #endif
> +		/* Fall through */
>  	case DW_EH_PE_native:
>  		if (end < (const void *)(ptr.pul + 1))
>  			return 0;
> 
