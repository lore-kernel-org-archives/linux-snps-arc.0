From: kirill@shutemov.name (Kirill A. Shutemov)
Date: Fri, 12 Oct 2018 14:36:45 +0300
Subject: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
In-Reply-To: <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181012113644.meqy5yb3xrxyh6lh@kshutemo-mobl1>
To: linux-snps-arc@lists.infradead.org

On Fri, Oct 12, 2018@02:30:56PM +0300, Kirill A. Shutemov wrote:
> On Thu, Oct 11, 2018@06:37:56PM -0700, Joel Fernandes (Google) wrote:
> > @@ -239,7 +287,21 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
> >  			split_huge_pmd(vma, old_pmd, old_addr);
> >  			if (pmd_trans_unstable(old_pmd))
> >  				continue;
> > +		} else if (extent == PMD_SIZE) {
> 
> Hm. What guarantees that new_addr is PMD_SIZE-aligned?
> It's not obvious to me.

Ignore this :)

-- 
 Kirill A. Shutemov
