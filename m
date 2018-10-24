From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 24 Oct 2018 10:37:16 +0200
Subject: [PATCH 1/4] treewide: remove unused address argument from
 pte_alloc functions (v2)
In-Reply-To: <20181013013200.206928-2-joel@joelfernandes.org>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-2-joel@joelfernandes.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181024083716.GN3109@worktop.c.hoisthospitality.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Oct 12, 2018@06:31:57PM -0700, Joel Fernandes (Google) wrote:
> This series speeds up mremap(2) syscall by copying page tables at the
> PMD level even for non-THP systems. There is concern that the extra
> 'address' argument that mremap passes to pte_alloc may do something
> subtle architecture related in the future that may make the scheme not
> work.  Also we find that there is no point in passing the 'address' to
> pte_alloc since its unused. So this patch therefore removes this
> argument tree-wide resulting in a nice negative diff as well. Also
> ensuring along the way that the enabled architectures do not do anything
> funky with 'address' argument that goes unnoticed by the optimization.

Did you happen to look at the history of where that address argument
came from? -- just being curious here. ISTR something vague about
architectures having different paging structure for different memory
ranges.
