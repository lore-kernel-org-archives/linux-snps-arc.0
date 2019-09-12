From: kirill@shutemov.name (Kirill A. Shutemov)
Date: Thu, 12 Sep 2019 14:00:16 +0300
Subject: [PATCH V2 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
In-Reply-To: <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190912110016.srrydg2krplscbgq@box>
To: linux-snps-arc@lists.infradead.org

On Thu, Sep 12, 2019@11:32:53AM +0530, Anshuman Khandual wrote:
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Anshuman Khandual <anshuman.khandual at arm.com>");
> +MODULE_DESCRIPTION("Test architecture page table helpers");

It's not module. Why?

BTW, I think we should make all code here __init (or it's variants) so it
can be discarded on boot. It has not use after that.

-- 
 Kirill A. Shutemov
