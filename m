From: cmetcalf@mellanox.com (Chris Metcalf)
Date: Tue, 14 Mar 2017 15:53:44 -0400
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170314161229.tl6hsmian2gdep47@arch-dev>
References: <20170314161229.tl6hsmian2gdep47@arch-dev>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8d9333d6-2f81-a9de-484e-e1d655e1d3c3@mellanox.com>
To: linux-snps-arc@lists.infradead.org

On 3/14/2017 12:12 PM, Till Smejkal wrote:
> On Mon, 13 Mar 2017, Andy Lutomirski wrote:
>> On Mon, Mar 13, 2017 at 7:07 PM, Till Smejkal
>> <till.smejkal@googlemail.com> wrote:
>>> On Mon, 13 Mar 2017, Andy Lutomirski wrote:
>>>> This sounds rather complicated.  Getting TLB flushing right seems
>>>> tricky.  Why not just map the same thing into multiple mms?
>>> This is exactly what happens at the end. The memory region that is described by the
>>> VAS segment will be mapped in the ASes that use the segment.
>> So why is this kernel feature better than just doing MAP_SHARED
>> manually in userspace?
> One advantage of VAS segments is that they can be globally queried by user programs
> which means that VAS segments can be shared by applications that not necessarily have
> to be related. If I am not mistaken, MAP_SHARED of pure in memory data will only work
> if the tasks that share the memory region are related (aka. have a common parent that
> initialized the shared mapping). Otherwise, the shared mapping have to be backed by a
> file.

True, but why is this bad?  The shared mapping will be memory resident
regardless, even if backed by a file (unless swapped out under heavy
memory pressure, but arguably that's a feature anyway).  More importantly,
having a file name is a simple and consistent way of identifying such
shared memory segments.

With a little work, you can also arrange to map such files into memory
at a fixed address in all participating processes, thus making internal
pointers work correctly.

> VAS segments on the other side allow sharing of pure in memory data by
> arbitrary related tasks without the need of a file. This becomes especially
> interesting if one combines VAS segments with non-volatile memory since one can keep
> data structures in the NVM and still be able to share them between multiple tasks.

I am not fully up to speed on NV/pmem stuff, but isn't that exactly what
the DAX mode is supposed to allow you to do?  If so, isn't sharing a
mapped file on a DAX filesystem on top of pmem equivalent to what
you're proposing?

-- 
Chris Metcalf, Mellanox Technologies
http://www.mellanox.com
