From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 15 Oct 2018 02:42:09 -0700
Subject: [PATCH 2/4] mm: speed up mremap by 500x on large regions (v2)
In-Reply-To: <20181013013200.206928-3-joel@joelfernandes.org>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-3-joel@joelfernandes.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181015094209.GA31999@infradead.org>
To: linux-snps-arc@lists.infradead.org

On Fri, Oct 12, 2018@06:31:58PM -0700, Joel Fernandes (Google) wrote:
> Android needs to mremap large regions of memory during memory management
> related operations.

Just curious: why?

> +	if ((old_addr & ~PMD_MASK) || (new_addr & ~PMD_MASK)
> +	    || old_end - old_addr < PMD_SIZE)

The || goes on the first line.

> +		} else if (extent == PMD_SIZE && IS_ENABLED(CONFIG_HAVE_MOVE_PMD)) {

Overly long line.
