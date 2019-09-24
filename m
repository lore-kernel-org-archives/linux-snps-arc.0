From: kirill@shutemov.name (Kirill A. Shutemov)
Date: Tue, 24 Sep 2019 14:51:01 +0300
Subject: [PATCH V3 0/2] mm/debug: Add tests for architecture exported
 page table helpers
In-Reply-To: <1568961203-18660-1-git-send-email-anshuman.khandual@arm.com>
References: <1568961203-18660-1-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190924115101.p6y7vpbtgmj5qjku@box>
To: linux-snps-arc@lists.infradead.org

On Fri, Sep 20, 2019@12:03:21PM +0530, Anshuman Khandual wrote:
> This series adds a test validation for architecture exported page table
> helpers. Patch in the series adds basic transformation tests at various
> levels of the page table. Before that it exports gigantic page allocation
> function from HugeTLB.
> 
> This test was originally suggested by Catalin during arm64 THP migration
> RFC discussion earlier. Going forward it can include more specific tests
> with respect to various generic MM functions like THP, HugeTLB etc and
> platform specific tests.
> 
> https://lore.kernel.org/linux-mm/20190628102003.GA56463 at arrakis.emea.arm.com/
> 
> Testing:
> 
> Successfully build and boot tested on both arm64 and x86 platforms without
> any test failing. Only build tested on some other platforms. Build failed
> on some platforms (known) in pud_clear_tests() as there were no available
> __pgd() definitions.
> 
> - ARM32
> - IA64

Hm. Grep shows __pgd() definitions for both of them. Is it for specific
config?


-- 
 Kirill A. Shutemov
