From: joel@joelfernandes.org (Joel Fernandes)
Date: Wed, 24 Oct 2018 19:13:50 -0700
Subject: [PATCH 2/4] mm: speed up mremap by 500x on large regions (v2)
In-Reply-To: <20181024115733.GN8537@350D>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-3-joel@joelfernandes.org>
 <20181024101255.it4lptrjogalxbey@kshutemo-mobl1>
 <20181024115733.GN8537@350D>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181025021350.GB13560@joelaf.mtv.corp.google.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Oct 24, 2018@10:57:33PM +1100, Balbir Singh wrote:
[...]
> > > +		pmd_t pmd;
> > > +
> > > +		new_ptl = pmd_lockptr(mm, new_pmd);
> 
> 
> Looks like this is largely inspired by move_huge_pmd(), I guess a lot of
> the code applies, why not just reuse as much as possible? The same comments
> w.r.t mmap_sem helping protect against lock order issues applies as well.

I thought about this and when I looked into it, it seemed there are subtle
differences that make such sharing not worth it (or not possible).

 - Joel
