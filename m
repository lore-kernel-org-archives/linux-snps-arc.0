From: luto@amacapital.net (Andy Lutomirski)
Date: Mon, 13 Mar 2017 22:37:27 -0700
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170314020709.vxeglus54k76i7rn@arch-dev>
References: <CALCETrWe8uOi3m8qXUbMA4017+rxbi1C8hzZ0bwjVHmfdE4FnQ@mail.gmail.com>
 <20170314020709.vxeglus54k76i7rn@arch-dev>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CALCETrXKvNWv1OtoSo_HWf5ZHSvyGS1NsuQod6Zt+tEg3MT5Sg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Mar 13, 2017 at 7:07 PM, Till Smejkal
<till.smejkal@googlemail.com> wrote:
> On Mon, 13 Mar 2017, Andy Lutomirski wrote:
>> This sounds rather complicated.  Getting TLB flushing right seems
>> tricky.  Why not just map the same thing into multiple mms?
>
> This is exactly what happens at the end. The memory region that is described by the
> VAS segment will be mapped in the ASes that use the segment.

So why is this kernel feature better than just doing MAP_SHARED
manually in userspace?


>> Ick.  Please don't do this.  Can we please keep an mm as just an mm
>> and not make it look magically different depending on which process
>> maps it?  If you need a trampoline (which you do, of course), just
>> write a trampoline in regular user code and map it manually.
>
> Did I understand you correctly that you are proposing that the switching thread
> should make sure by itself that its code, stack, ? memory regions are properly setup
> in the new AS before/after switching into it? I think, this would make using first
> class virtual address spaces much more difficult for user applications to the extend
> that I am not even sure if they can be used at all. At the moment, switching into a
> VAS is a very simple operation for an application because the kernel will just simply
> do the right thing.

Yes.  I think that having the same mm_struct look different from
different tasks is problematic.  Getting it right in the arch code is
going to be nasty.  The heuristics of what to share are also tough --
why would text + data + stack or whatever you're doing be adequate?
What if you're in a thread?  What if two tasks have their stacks in
the same place?

I could imagine something like a sigaltstack() mode that lets you set
a signal up to also switch mm could be useful.
