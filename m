From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 8 Aug 2016 16:27:52 -0700
Subject: [PATCH] ARC: Support R_ARC_JMP_SLOT relocations during bootstrap
In-Reply-To: <1469728748-3493-1-git-send-email-andrew.burgess@embecosm.com>
References: <1469728748-3493-1-git-send-email-andrew.burgess@embecosm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b954b586-aad0-dd7f-263f-0dfd50034ac2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/28/2016 10:59 AM, Andrew Burgess wrote:
> I ran into this issue while trying to debug a _different_ issue witin
> the uClinc(-ng) arc dynamic linker.  I turned on debugging support
> within the dynamic linker, and the linker would no longer complete its
> bootstrap phase due to a lack of support for the R_ARC_JMP_SLOT
> relocation type.
>
> To reproduce this issue it should be enough to configure uClibc(-ng)
> for ARC with 'DODEBUG=y', then try to run anything that requires
> dynamic linking.
>
> The R_ARC_JMP_SLOT relocation type is used within the .plt, so I
> believe it makes sense for these relocations to be generated.
>
> I updated the associated comment above the boostrap patching code so
> that it makes more sense (to me at least) with the extra relocation
> support.
>
> I wonder if you would consider merging this patch?
>
> Thanks,
> Andrew
>
>
> ---
>
> This commit adds support for R_ARC_JMP_SLOT relocations during the
> bootstrap phase of the dynamic linker.  These relocations will be
> generated if uClibc is configured with 'DODEBUG=y'.
> ---
>  ldso/ldso/arc/dl-startup.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/ldso/ldso/arc/dl-startup.h b/ldso/ldso/arc/dl-startup.h
> index ef89b53..fadc433 100644
> --- a/ldso/ldso/arc/dl-startup.h
> +++ b/ldso/ldso/arc/dl-startup.h
> @@ -64,10 +64,11 @@ __asm__(
>  
>  /*
>   * Dynamic loader bootstrapping:
> - * Since we don't modify text at runtime, these can only be data relos
> - * (so safe to assume that they are word aligned).
> - * And also they HAVE to be RELATIVE relos only
> - * @RELP is the relo entry being processed
> + * The only relocations that should be found are either R_ARC_RELATIVE for
> + * data relocations (.got, etc) or R_ARC_JMP_SLOT for code relocations
> + * (.plt).  It is safe to assume that all of these relocations are word
> + * aligned.
> + * @RELP is the reloc entry being processed
>   * @REL is the pointer to the address we are relocating.
>   * @SYMBOL is the symbol involved in the relocation
>   * @LOAD is the load address.
> @@ -78,6 +79,8 @@ do {									\
>  	int type = ELF32_R_TYPE((RELP)->r_info);			\
>  	if (likely(type == R_ARC_RELATIVE))				\
>  		*REL += (unsigned long) LOAD;				\
> +	else if (type == R_ARC_JMP_SLOT)                                \
> +		*REL = SYMBOL;						\
>  	else								\
>  		_dl_exit(1);						\
>  }while(0)

So I know this has been merged and all - but I'm wondering if this is PIE safe.
Cuper has been painfully fixing PIE related issues - including uClibc issues and
since we are on the topic I'm wondering if this needs some additional fixup ?

-Vineet
