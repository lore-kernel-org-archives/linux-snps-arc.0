From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 9 May 2019 20:36:21 +0000
Subject: [GLIBC] ARC: Add multilib support
References: <20190508152333.2949-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A250BAAE@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/8/19 8:23 AM, Alexey Brodkin wrote:
> Based on preprocessor defines we determine which type of ARC core
> we're targeting and set slibdir accordingly so that on installation
> of libraries to sysroot libs for different ARC cores end up in different
> locations which match ARC Linux multilib spec.
>
> Note though it all only happens if 2 conditions happen simultaneously:
>  1. Glibc configured with "--prefix=/usr"

So how can we do this in a typical cross compile setup.

>  2. "-mcpu=xxx" exists in CC passed to Glibc's configure script
>
> I.e. when we build Glibc for default CPU libs are installed in default
> location.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  sysdeps/unix/sysv/linux/arc/configure    | 329 ++++++++++++++++++++++++++++++-
>  sysdeps/unix/sysv/linux/arc/configure.ac |  70 +++++++
>  2 files changed, 398 insertions(+), 1 deletion(-)
>  mode change 100644 => 100755 sysdeps/unix/sysv/linux/arc/configure

skipping generated file
 
> diff --git a/sysdeps/unix/sysv/linux/arc/configure.ac b/sysdeps/unix/sysv/linux/arc/configure.ac
> index a9528032d32..3615db8eabc 100644
> --- a/sysdeps/unix/sysv/linux/arc/configure.ac
> +++ b/sysdeps/unix/sysv/linux/arc/configure.ac
> @@ -2,3 +2,73 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
>  # Local configure fragment for sysdeps/unix/sysv/linux/arc.
>  
>  arch_minimum_kernel=3.9.0
> +
> +# If "-mcpu=xxx" found in passed CC assume we're building for
> +# non-default CPU and thus we need to install libs in non-default location.
> +if AC_TRY_COMMAND([echo $CC | grep -F "mcpu" > /dev/null]);
> +then
> +	libc_cv_arc_arch=no
> +
> +	# If this is ARCompact-based core
> +	AC_EGREP_CPP(yes, [#ifdef __ARC700__
> +			   yes
> +			   #endif
> +	],libc_cv_arc_arch=arc700)
> +
> +	# If this is ARCv2-based core
> +	AC_EGREP_CPP(yes, [#ifdef __ARCHS__
> +			   yes
> +			   #endif
> +	],libc_cv_arc_arch=hs)
> +
> +	if test $libc_cv_arc_arch = no; then
> +	  AC_MSG_ERROR([Unable to determine ARC architecture])
> +	fi
> +
> +	if test $libc_cv_arc_arch = arc700; then
> +		# NPS400
> +		AC_EGREP_CPP(yes, [#ifdef __NPS400__
> +				   yes
> +				   #endif
> +		],libc_cv_arc_arch=nps400)

I don't see any activity on NPS front so best to skip that in new code for now.


> +	else
> +		# Base-line HS38 + HW multiplier
> +		AC_EGREP_CPP(yes, [#ifdef __ARC_MPY__
> +				   yes
> +				   #endif
> +		],libc_cv_arc_arch=archs)
> +
> +		# Base-line HS38 + HW quad-multiplier
> +		AC_EGREP_CPP(yes, [#ifdef __ARC_MPY_QMACW__
> +				   yes
> +				   #endif
> +		],libc_cv_arc_arch=hs38)
> +
> +		# Base-line HS38 + HW quad-multiplier + FPU
> +		AC_EGREP_CPP(yes, [#ifdef __ARC_FPU_DP__
> +				   yes
> +				   #endif
> +		],libc_cv_arc_arch=hs38_linux)
> +	fi
> +

This zoo makes sense for gcc - for say baremetal stuff, but we don't want to spend
time (even machine time) building glibc for those.
You can assume MPY to be always present when running linux/glibc.

> +	case $libc_cv_arc_arch in
> +	arc700)
> +	  LIBC_SLIBDIR_RTLDDIR([lib/arc700], [lib/arc700])
> +	  ;;
> +	nps400)
> +	  LIBC_SLIBDIR_RTLDDIR([lib/nps400], [lib/nps400])


> +	  ;;
> +	hs)
> +	  LIBC_SLIBDIR_RTLDDIR([lib/hs], [lib/hs])

Looking at
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/wiki/Understanding-GCC-mcpu-optio

I'd recommend drop above


> +	  ;;
> +	archs)
> +	  LIBC_SLIBDIR_RTLDDIR([lib/archs], [lib/archs])
> +	  ;;

ditto

> +	hs38)
> +	  LIBC_SLIBDIR_RTLDDIR([lib/hs38], [lib/hs38])
> +	  ;;
> +	hs38_linux)
> +	  LIBC_SLIBDIR_RTLDDIR([lib/hs38_linux], [lib/hs38_linux])
> +	  ;;
> +	esac
> +fi

-Vineet
