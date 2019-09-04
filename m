From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 4 Sep 2019 16:14:08 -0700
Subject: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
In-Reply-To: <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
References: <1567497706-8649-1-git-send-email-anshuman.khandual@arm.com>
 <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3b67e4d8-ba67-e7b2-f4d1-1276262d349e@intel.com>
To: linux-snps-arc@lists.infradead.org

On 9/3/19 1:01 AM, Anshuman Khandual wrote:
> This adds a test module which will validate architecture page table helpers
> and accessors regarding compliance with generic MM semantics expectations.
> This will help various architectures in validating changes to the existing
> page table helpers or addition of new ones.

This looks really cool.  The "only" complication on x86 is the large
number of compile and runtime options that we have.  When this gets
merged, it would be really nice to make sure that the 0day guys have
good coverage of all the configurations.

I'm not _quite_ sure what kind of bugs it will catch on x86 and I
suspect it'll have more value for the other architectures, but it seems
harmless enough.
