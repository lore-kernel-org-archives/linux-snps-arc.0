From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 30 Oct 2015 06:21:56 +0000
Subject: [RFC] perf: fix building for ARCv1
References: <1445088959-3058-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CE691@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 17 October 2015 07:06 PM, Alexey Brodkin wrote:
> Perf uses atomic options and so it is required to have atomics enabled
> in toolchain.
>
> In case of ARC atomics are enabled by default for ARCv2 but disabled for
> ARCv1. Now we explicitly enable atomics for either ARC achitecture
> version so perf could be successfully built.
>
> Currently on attempt to build perf for ARCv1 you'll see tons of:
> ----------------->8-----------------
> undefined reference to `__sync_add_and_fetch_4'
> ----------------->8-----------------
>
> Still note if ARCv1 CPU is configured without LL/SC perf will crash on
> execution once "llock" instruction is attempted to be executed.
>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Peter Zijlstra <peterz at infradead.org>
> Cc: Arnaldo Carvalho de Melo <acme at kernel.org>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

Acked-by: Vineet Gupta <vgupta at synopsys.com>


> ---
>  tools/perf/config/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tools/perf/config/Makefile b/tools/perf/config/Makefile
> index 38a0853..dc7c0a8 100644
> --- a/tools/perf/config/Makefile
> +++ b/tools/perf/config/Makefile
> @@ -47,6 +47,11 @@ ifeq ($(ARCH),arm64)
>    LIBUNWIND_LIBS = -lunwind -lunwind-aarch64
>  endif
>  
> +# Additional ARCH settings for ARC
> +ifeq ($(ARCH),arc)
> +  CFLAGS += -matomic
> +endif
> +
>  ifeq ($(NO_PERF_REGS),0)
>    $(call detected,CONFIG_PERF_REGS)
>  endif
