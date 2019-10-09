From: vineetg76@gmail.com (Vineet Gupta)
Date: Wed, 9 Oct 2019 11:38:37 -0700
Subject: [PATCH] ARC: mm: remove __ARCH_USE_5LEVEL_HACK
In-Reply-To: <20191008234223.wycjktby2t5gwz3o@black.fi.intel.com>
References: <20191008213836.19266-1-vgupta@synopsys.com>
 <20191008234223.wycjktby2t5gwz3o@black.fi.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <adaa82a2-b143-d49f-f38c-24ef52a200b8@gmail.com>
To: linux-snps-arc@lists.infradead.org

On 10/8/19 4:42 PM, Kirill A. Shutemov wrote:
> On Tue, Oct 08, 2019@09:38:36PM +0000, Vineet Gupta wrote:
>> Add the intermediate p4d accessors to make it 5 level compliant.
>>
>> Thi sis non-functional change anyways since ARC has software page walker
>      ^
>      Typo.

Oops, fixed now !

...

> Have you tested it with CONFIG_HIGHMEM=y? alloc_kmap_pgtable() has to be
> converted too.

No I didn't. Fixed that as well.

Thx for looking
-Vineet
