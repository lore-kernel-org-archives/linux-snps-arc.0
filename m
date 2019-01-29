From: mpe@ellerman.id.au (Michael Ellerman)
Date: Tue, 29 Jan 2019 21:29:19 +1100
Subject: [PATCH v2 09/21] memblock: drop memblock_alloc_base()
In-Reply-To: <1548057848-15136-10-git-send-email-rppt@linux.ibm.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-10-git-send-email-rppt@linux.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87sgxbrc3k.fsf@concordia.ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

Mike Rapoport <rppt at linux.ibm.com> writes:

> The memblock_alloc_base() function tries to allocate a memory up to the
> limit specified by its max_addr parameter and panics if the allocation
> fails. Replace its usage with memblock_phys_alloc_range() and make the
> callers check the return value and panic in case of error.
>
> Signed-off-by: Mike Rapoport <rppt at linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c      |  6 +++++-
>  arch/powerpc/mm/hash_utils_64.c |  8 ++++++--
>  arch/s390/kernel/smp.c          |  6 +++++-
>  drivers/macintosh/smu.c         |  2 +-
>  include/linux/memblock.h        |  2 --
>  mm/memblock.c                   | 14 --------------
>  6 files changed, 17 insertions(+), 21 deletions(-)

Acked-by: Michael Ellerman <mpe at ellerman.id.au> (powerpc)

cheers
