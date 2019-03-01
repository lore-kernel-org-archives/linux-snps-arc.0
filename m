From: andrew.burgess@embecosm.com (Andrew Burgess)
Date: Fri, 1 Mar 2019 12:07:35 +0200
Subject: [PATCH] [ARC] Fix logic set UNALIGNED_ACCESS
In-Reply-To: <1551377064-30400-1-git-send-email-vgupta@synopsys.com>
References: <1551377064-30400-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190301100735.GN10887@embecosm.com>
To: linux-snps-arc@lists.infradead.org

* Vineet Gupta <vineet.gupta1 at synopsys.com> [2019-02-28 10:04:24 -0800]:

> From: Claudiu Zissulescu <claziss at gmail.com>
> 
> gcc/
> xxxx-xx-xx  Claudiu Zissulescu  <claziss at synopsys.com>
> 
> 	* config/arc/arc-c.def (__ARC_UNALIGNED__): Set it on
> 	unaligned_access variable.
> 	* config/arc/arc.c (arc_override_options): Set unaligned access
> 	default on for HS CPUs.
> 	* config/arc/arc.h (STRICT_ALIGNMENT): Fix logic.

This looks good.

Thanks,
Andrew


> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  gcc/config/arc/arc-c.def | 2 +-
>  gcc/config/arc/arc.c     | 4 ++++
>  gcc/config/arc/arc.h     | 2 +-
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/gcc/config/arc/arc-c.def b/gcc/config/arc/arc-c.def
> index 9c0ba2c9c294..9472b48aa7bc 100644
> --- a/gcc/config/arc/arc-c.def
> +++ b/gcc/config/arc/arc-c.def
> @@ -29,7 +29,7 @@ ARC_C_DEF ("__ARC_MUL64__",	TARGET_MUL64_SET)
>  ARC_C_DEF ("__ARC_MUL32BY16__", TARGET_MULMAC_32BY16_SET)
>  ARC_C_DEF ("__ARC_SIMD__",	TARGET_SIMD_SET)
>  ARC_C_DEF ("__ARC_RF16__",	TARGET_RF16)
> -ARC_C_DEF ("__ARC_UNALIGNED__", !STRICT_ALIGNMENT)
> +ARC_C_DEF ("__ARC_UNALIGNED__", unaligned_access)
>  
>  ARC_C_DEF ("__ARC_BARREL_SHIFTER__", TARGET_BARREL_SHIFTER)
>  
> diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
> index de2c8d5df9cf..3b8c29981b9a 100644
> --- a/gcc/config/arc/arc.c
> +++ b/gcc/config/arc/arc.c
> @@ -1313,6 +1313,10 @@ arc_override_options (void)
>    if (TARGET_LONG_CALLS_SET)
>      target_flags &= ~MASK_MILLICODE_THUNK_SET;
>  
> +  /* Set unaligned to all HS cpus.  */
> +  if (!global_options_set.x_unaligned_access && TARGET_HS)
> +    unaligned_access = 1;
> +
>    /* These need to be done at start up.  It's convenient to do them here.  */
>    arc_init ();
>  }
> diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
> index 12b4b62bba7b..894eb3946000 100644
> --- a/gcc/config/arc/arc.h
> +++ b/gcc/config/arc/arc.h
> @@ -285,7 +285,7 @@ if (GET_MODE_CLASS (MODE) == MODE_INT		\
>  /* On the ARC the lower address bits are masked to 0 as necessary.  The chip
>     won't croak when given an unaligned address, but the insn will still fail
>     to produce the correct result.  */
> -#define STRICT_ALIGNMENT (!unaligned_access && !TARGET_HS)
> +#define STRICT_ALIGNMENT (!unaligned_access)
>  
>  /* Layout of source language data types.  */
>  
> -- 
> 2.7.4
> 
