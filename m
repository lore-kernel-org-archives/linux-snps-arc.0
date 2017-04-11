From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Tue, 11 Apr 2017 22:09:25 +0200
Subject: [uclibc-ng-devel] [PATCH] ldso/arc: fix debug prints
In-Reply-To: <1491426019-17377-1-git-send-email-vgupta@synopsys.com>
References: <1491426019-17377-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170411200925.GA5361@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,
Vineet Gupta wrote,

> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  ldso/ldso/arc/elfinterp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/ldso/ldso/arc/elfinterp.c b/ldso/ldso/arc/elfinterp.c
> index 2f0cf7f6635b..c164d5dae6bf 100644
> --- a/ldso/ldso/arc/elfinterp.c
> +++ b/ldso/ldso/arc/elfinterp.c
> @@ -179,8 +179,8 @@ _dl_do_reloc(struct elf_resolve *tpnt, struct r_scope_elem *scope,
>  log_entry:
>  #if defined __SUPPORT_LD_DEBUG__
>  	if (_dl_debug_detail)
> -		_dl_dprintf(_dl_debug_file,"\tpatched: %lx ==> %lx @ %pl: addend %x ",
> -				old_val, *reloc_addr, reloc_addr, rpnt->r_addend);
> +		_dl_dprintf(_dl_debug_file,"\tpatched: %x ==> %x @ %x",
> +				old_val, *reloc_addr, reloc_addr);
>  #endif
>  
>  	return 0;
> @@ -215,7 +215,7 @@ _dl_do_lazy_reloc(struct elf_resolve *tpnt, struct r_scope_elem *scope,
>  
>  #if defined __SUPPORT_LD_DEBUG__
>  	if (_dl_debug_reloc && _dl_debug_detail)
> -		_dl_dprintf(_dl_debug_file, "\tpatched: %lx ==> %lx @ %pl\n",
> +		_dl_dprintf(_dl_debug_file, "\tpatched: %x ==> %x @ %x\n",
>  				old_val, *reloc_addr, reloc_addr);
>  #endif

Applied and pushed,
 Waldemar
