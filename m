From: lkp@intel.com (kbuild test robot)
Date: Sun, 4 Nov 2018 00:56:59 +0800
Subject: [PATCH -next 2/3] mm: speed up mremap by 20x on large regions (v4)
In-Reply-To: <20181103040041.7085-3-joelaf@google.com>
References: <20181103040041.7085-3-joelaf@google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201811040056.QfAjkno6%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Joel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20181102]

url:    https://github.com/0day-ci/linux/commits/Joel-Fernandes/Add-support-for-fast-mremap/20181103-224908
config: openrisc-or1ksim_defconfig (attached as .config)
compiler: or1k-linux-gcc (GCC) 6.0.0 20160327 (experimental)
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=openrisc 

All errors (new ones prefixed by >>):

   mm/mremap.c: In function 'move_normal_pmd':
>> mm/mremap.c:229:2: error: implicit declaration of function 'set_pmd_at' [-Werror=implicit-function-declaration]
     set_pmd_at(mm, new_addr, new_pmd, pmd);
     ^~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/set_pmd_at +229 mm/mremap.c

   193	
   194	static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
   195			  unsigned long new_addr, unsigned long old_end,
   196			  pmd_t *old_pmd, pmd_t *new_pmd)
   197	{
   198		spinlock_t *old_ptl, *new_ptl;
   199		struct mm_struct *mm = vma->vm_mm;
   200		pmd_t pmd;
   201	
   202		if ((old_addr & ~PMD_MASK) || (new_addr & ~PMD_MASK)
   203		    || old_end - old_addr < PMD_SIZE)
   204			return false;
   205	
   206		/*
   207		 * The destination pmd shouldn't be established, free_pgtables()
   208		 * should have release it.
   209		 */
   210		if (WARN_ON(!pmd_none(*new_pmd)))
   211			return false;
   212	
   213		/*
   214		 * We don't have to worry about the ordering of src and dst
   215		 * ptlocks because exclusive mmap_sem prevents deadlock.
   216		 */
   217		old_ptl = pmd_lock(vma->vm_mm, old_pmd);
   218		new_ptl = pmd_lockptr(mm, new_pmd);
   219		if (new_ptl != old_ptl)
   220			spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
   221	
   222		/* Clear the pmd */
   223		pmd = *old_pmd;
   224		pmd_clear(old_pmd);
   225	
   226		VM_BUG_ON(!pmd_none(*new_pmd));
   227	
   228		/* Set the new pmd */
 > 229		set_pmd_at(mm, new_addr, new_pmd, pmd);
   230		flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
   231		if (new_ptl != old_ptl)
   232			spin_unlock(new_ptl);
   233		spin_unlock(old_ptl);
   234	
   235		return true;
   236	}
   237	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 7869 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20181104/26eafdad/attachment.gz>
