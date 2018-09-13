From: Claudiu.Zissulescu@synopsys.com (Claudiu Zissulescu)
Date: Thu, 13 Sep 2018 07:59:37 +0000
Subject: [PATCH] [ARC] Fix generation of specs
In-Reply-To: <20180913074110.6431-1-abrodkin@synopsys.com>
References: <20180913074110.6431-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <098ECE41A0A6114BB2A07F1EC238DE89667FCC57@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

The patch is missing the entry change log. Otherwise is ok. I'll push it with the mentioned changes.

Thank you,
Claudiu

> -----Original Message-----
> From: Alexey Brodkin [mailto:abrodkin at synopsys.com]
> Sent: Thursday, September 13, 2018 9:41 AM
> To: gcc-patches at gcc.gnu.org
> Cc: linux-snps-arc at lists.infradead.org; Alexey Brodkin
> <abrodkin at synopsys.com>; Andrew Burgess
> <andrew.burgess at embecosm.com>; Claudiu Zissulescu
> <claziss at synopsys.com>
> Subject: [PATCH] [ARC] Fix generation of specs
> 
> With no trailing space in LINK_EH_SPEC linker spec gets generated as:
> ------------------------>8---------------------
> %{!r:--build-id} --eh-frame-hdr%{h*} ...
> ------------------------>8---------------------
> 
> or even worse if hash style is added:
> ------------------------>8---------------------
> %{!r:--build-id} --eh-frame-hdr--hash-style=sysv %{h*} ...
> ------------------------>8---------------------
> 
> Now if that spec is really used by LD then it fails inevitably
> saying that it doesn't know option "--eh-frame-hdr--hash-style=sysv".
> 
> Cc: Andrew Burgess <andrew.burgess at embecosm.com>
> Cc: Claudiu Zissulescu <claziss at synopsys.com>
> ---
>  gcc/config/arc/linux.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
> index 96d548eae341..62ebe4de0fc7 100644
> --- a/gcc/config/arc/linux.h
> +++ b/gcc/config/arc/linux.h
> @@ -98,7 +98,7 @@ along with GCC; see the file COPYING3.  If not see
>     Signalize that because we have fde-glibc, we don't need all C shared libs
>     linked against -lgcc_s.  */
>  #undef LINK_EH_SPEC
> -#define LINK_EH_SPEC "--eh-frame-hdr"
> +#define LINK_EH_SPEC "--eh-frame-hdr "
>  #endif
> 
>  #undef SUBTARGET_CPP_SPEC
> --
> 2.17.1
