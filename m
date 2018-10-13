From: dancol@google.com (Daniel Colascione)
Date: Fri, 12 Oct 2018 18:39:45 -0700
Subject: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
In-Reply-To: <20181013013540.GA207108@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
 <20181012125046.GA170912@joelaf.mtv.corp.google.com>
 <20181012.111836.1569129998592378186.davem@davemloft.net>
 <20181013013540.GA207108@joelaf.mtv.corp.google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAKOZueuNvWvn18vffJWpbpg7h-uScT8gXrrudTB2pnT4M2HJ_w@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Not 32-bit ARM?

On Fri, Oct 12, 2018@6:35 PM, Joel Fernandes <joel@joelfernandes.org> wrote:
> On Fri, Oct 12, 2018@11:18:36AM -0700, David Miller wrote:
>> From: Joel Fernandes <joel at joelfernandes.org>
> [...]
>> > Also, do we not flush the caches from any path when we munmap
>> > address space?  We do call do_munmap on the old mapping from mremap
>> > after moving to the new one.
>>
>> Sparc makes sure that shared mapping have consistent colors.  Therefore
>> all that's left are private mappings and those will be initialized by
>> block stores to clear the page out or similar.
>>
>> Also, when creating new mappings, we flush the D-cache when necessary
>> in update_mmu_cache().
>>
>> We also maintain a bit in the page struct to track when a page which
>> was potentially written to on one cpu ends up mapped into another
>> address space and flush as necessary.
>>
>> The cache is write-through, which simplifies the preconditions we have
>> to maintain.
>
> Makes sense, thanks. For the moment I sent patches to enable this on arm64
> and x86. We can enable it on sparc as well at a later time as it sounds it
> could be a safe optimization to apply to that architecture as well.
>
> thanks,
>
>  - Joel
>
