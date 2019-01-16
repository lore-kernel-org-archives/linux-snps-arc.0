From: jgross@suse.com (Juergen Gross)
Date: Wed, 16 Jan 2019 15:32:03 +0100
Subject: [Xen-devel] [PATCH 19/21] treewide: add checks for the return
 value of memblock_alloc*()
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1c04fc81-7e7c-9b4a-cab2-c9b023e1a3b1@suse.com>
To: linux-snps-arc@lists.infradead.org

On 16/01/2019 14:44, Mike Rapoport wrote:
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

For the Xen part:

Reviewed-by: Juergen Gross <jgross at suse.com>


Juergen
