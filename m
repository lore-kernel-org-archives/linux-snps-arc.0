From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Thu, 12 Sep 2019 17:39:13 +0530
Subject: [PATCH V2 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
In-Reply-To: <20190912110016.srrydg2krplscbgq@box>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <20190912110016.srrydg2krplscbgq@box>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0116e7b7-cee5-c821-cc54-f4e397c774b2@arm.com>
To: linux-snps-arc@lists.infradead.org



On 09/12/2019 04:30 PM, Kirill A. Shutemov wrote:
> On Thu, Sep 12, 2019@11:32:53AM +0530, Anshuman Khandual wrote:
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Anshuman Khandual <anshuman.khandual at arm.com>");
>> +MODULE_DESCRIPTION("Test architecture page table helpers");
> 
> It's not module. Why?

Not any more. Nothing in particular. Just that module_init() code gets
executed after page allocator init which is needed here. But I guess
probably not a great way to get this test started.

> 
> BTW, I think we should make all code here __init (or it's variants) so it
> can be discarded on boot. It has not use after that.

Sounds good, will change. Will mark all these functions as __init and
will trigger the test with late_initcall().
