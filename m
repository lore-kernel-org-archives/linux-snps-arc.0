From: heiko.carstens@de.ibm.com (Heiko Carstens)
Date: Fri, 18 Jan 2019 09:43:02 +0100
Subject: [PATCH 19/21] treewide: add checks for the return value of
 memblock_alloc*()
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190118084302.GA4160@osiris>
To: linux-snps-arc@lists.infradead.org

On Wed, Jan 16, 2019@03:44:19PM +0200, Mike Rapoport wrote:
> Add check for the return value of memblock_alloc*() functions and call
> panic() in case of error.
> The panic message repeats the one used by panicing memblock allocators with
> adjustment of parameters to include only relevant ones.
> 
> The replacement was mostly automated with semantic patches like the one
> below with manual massaging of format strings.
> 
> @@
> expression ptr, size, align;
> @@
> ptr = memblock_alloc(size, align);
> + if (!ptr)
> + 	panic("%s: Failed to allocate %lu bytes align=0x%lx\n", __func__,
> size, align);
> 
> Signed-off-by: Mike Rapoport <rppt at linux.ibm.com>
...
> diff --git a/arch/s390/numa/toptree.c b/arch/s390/numa/toptree.c
> index 71a608c..0118c77 100644
> --- a/arch/s390/numa/toptree.c
> +++ b/arch/s390/numa/toptree.c
> @@ -31,10 +31,14 @@ struct toptree __ref *toptree_alloc(int level, int id)
>  {
>  	struct toptree *res;
> 
> -	if (slab_is_available())
> +	if (slab_is_available()) {
>  		res = kzalloc(sizeof(*res), GFP_KERNEL);
> -	else
> +	} else {
>  		res = memblock_alloc(sizeof(*res), 8);
> +		if (!res)
> +			panic("%s: Failed to allocate %zu bytes align=0x%x\n",
> +			      __func__, sizeof(*res), 8);
> +	}
>  	if (!res)
>  		return res;

Please remove this hunk, since the code _should_ be able to handle
allocation failures anyway (see end of quoted code).

Otherwise for the s390 bits:
Acked-by: Heiko Carstens <heiko.carstens at de.ibm.com>
