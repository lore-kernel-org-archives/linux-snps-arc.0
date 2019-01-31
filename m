From: jcmvbkbc@gmail.com (Max Filippov)
Date: Thu, 31 Jan 2019 07:23:02 -0800
Subject: [PATCH v2 19/21] treewide: add checks for the return value of
 memblock_alloc*()
In-Reply-To: <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMo8BfKhjwimXrGCcPjmS0+w8o6yW=ohG-hZ7caWnGpPSF6qJA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Jan 21, 2019@12:06 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
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
> +       panic("%s: Failed to allocate %lu bytes align=0x%lx\n", __func__,
> size, align);
>
> Signed-off-by: Mike Rapoport <rppt at linux.ibm.com>
> Reviewed-by: Guo Ren <ren_guo at c-sky.com>             # c-sky
> Acked-by: Paul Burton <paul.burton at mips.com>         # MIPS
> Acked-by: Heiko Carstens <heiko.carstens at de.ibm.com> # s390
> Reviewed-by: Juergen Gross <jgross at suse.com>         # Xen
> ---
>  arch/xtensa/mm/kasan_init.c               |  4 ++++
>  arch/xtensa/mm/mmu.c                      |  3 +++

For xtensa:
Acked-by: Max Filippov <jcmvbkbc at gmail.com>

-- 
Thanks.
-- Max
