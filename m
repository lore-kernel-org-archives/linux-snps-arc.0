From: luto@amacapital.net (Andy Lutomirski)
Date: Wed, 15 Mar 2017 09:51:31 -0700
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170314161229.tl6hsmian2gdep47@arch-dev>
References: <CALCETrXKvNWv1OtoSo_HWf5ZHSvyGS1NsuQod6Zt+tEg3MT5Sg@mail.gmail.com>
 <20170314161229.tl6hsmian2gdep47@arch-dev>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CALCETrX5gv+zdhOYro4-u3wGWjVCab28DFHPSm5=BVG_hKxy3A@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Mar 14, 2017 at 9:12 AM, Till Smejkal
<till.smejkal@googlemail.com> wrote:
> On Mon, 13 Mar 2017, Andy Lutomirski wrote:
>> On Mon, Mar 13, 2017 at 7:07 PM, Till Smejkal
>> <till.smejkal@googlemail.com> wrote:
>> > On Mon, 13 Mar 2017, Andy Lutomirski wrote:
>> >> This sounds rather complicated.  Getting TLB flushing right seems
>> >> tricky.  Why not just map the same thing into multiple mms?
>> >
>> > This is exactly what happens at the end. The memory region that is described by the
>> > VAS segment will be mapped in the ASes that use the segment.
>>
>> So why is this kernel feature better than just doing MAP_SHARED
>> manually in userspace?
>
> One advantage of VAS segments is that they can be globally queried by user programs
> which means that VAS segments can be shared by applications that not necessarily have
> to be related. If I am not mistaken, MAP_SHARED of pure in memory data will only work
> if the tasks that share the memory region are related (aka. have a common parent that
> initialized the shared mapping). Otherwise, the shared mapping have to be backed by a
> file.

What's wrong with memfd_create()?

> VAS segments on the other side allow sharing of pure in memory data by
> arbitrary related tasks without the need of a file. This becomes especially
> interesting if one combines VAS segments with non-volatile memory since one can keep
> data structures in the NVM and still be able to share them between multiple tasks.

What's wrong with regular mmap?

>
>> >> Ick.  Please don't do this.  Can we please keep an mm as just an mm
>> >> and not make it look magically different depending on which process
>> >> maps it?  If you need a trampoline (which you do, of course), just
>> >> write a trampoline in regular user code and map it manually.
>> >
>> > Did I understand you correctly that you are proposing that the switching thread
>> > should make sure by itself that its code, stack, ? memory regions are properly setup
>> > in the new AS before/after switching into it? I think, this would make using first
>> > class virtual address spaces much more difficult for user applications to the extend
>> > that I am not even sure if they can be used at all. At the moment, switching into a
>> > VAS is a very simple operation for an application because the kernel will just simply
>> > do the right thing.
>>
>> Yes.  I think that having the same mm_struct look different from
>> different tasks is problematic.  Getting it right in the arch code is
>> going to be nasty.  The heuristics of what to share are also tough --
>> why would text + data + stack or whatever you're doing be adequate?
>> What if you're in a thread?  What if two tasks have their stacks in
>> the same place?
>
> The different ASes that a task now can have when it uses first class virtual address
> spaces are not realized in the kernel by using only one mm_struct per task that just
> looks differently but by using multiple mm_structs - one for each AS that the task
> can execute in. When a task attaches a first class virtual address space to itself to
> be able to use another AS, the kernel adds a temporary mm_struct to this task that
> contains the mappings of the first class virtual address space and the one shared
> with the task's original AS. If a thread now wants to switch into this attached first
> class virtual address space the kernel only changes the 'mm' and 'active_mm' pointers
> in the task_struct of the thread to the temporary mm_struct and performs the
> corresponding mm_switch operation. The original mm_struct of the thread will not be
> changed.
>
> Accordingly, I do not magically make mm_structs look differently depending on the
> task that uses it, but create temporary mm_structs that only contain mappings to the
> same memory regions.

This sounds complicated and fragile.  What happens if a heuristically
shared region coincides with a region in the "first class address
space" being selected?

I think the right solution is "you're a user program playing virtual
address games -- make sure you do it right".

--Andy
