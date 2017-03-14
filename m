From: till.smejkal@googlemail.com (Till Smejkal)
Date: Mon, 13 Mar 2017 17:39:35 -0700
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <73f62aca-d442-9e4b-3e2c-6269e2632e68@twiddle.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170314003935.2jwycgajo7eojmvm@arch-dev>
To: linux-snps-arc@lists.infradead.org

On Tue, 14 Mar 2017, Richard Henderson wrote:
> On 03/14/2017 08:14 AM, Till Smejkal wrote:
> > At the current state of the development, first class virtual address spaces
> > have one limitation, that we haven't been able to solve so far. The feature
> > allows, that different threads of the same process can execute in different
> > AS at the same time. This is possible, because the VAS-switch operation
> > only changes the active mm_struct for the task_struct of the calling
> > thread. However, when a thread switches into a first class virtual address
> > space, some parts of its original AS are duplicated into the new one to
> > allow the thread to continue its execution at its current state.
> > Accordingly, parts of the processes AS (e.g. the code section, data
> > section, heap section and stack sections) exist in multiple AS if the
> > process has a VAS attached to it. Changes to these shared memory regions
> > are synchronized between the address spaces whenever a thread switches
> > between two of them. Unfortunately, in some scenarios the kernel is not
> > able to properly synchronize all these shared memory regions because of
> > conflicting changes. One such example happens if there are two threads, one
> > executing in an attached first class virtual address space, the other in
> > the tasks original address space. If both threads make changes to the heap
> > section that cause expansion of the underlying vm_area_struct, the kernel
> > cannot correctly synchronize these changes, because that would cause parts
> > of the virtual address space to be overwritten with unrelated data. In the
> > current implementation such conflicts are only detected but not resolved
> > and result in an error code being returned by the kernel during the VAS
> > switch operation. Unfortunately, that means for the particular thread that
> > tried to make the switch, that it cannot do this anymore in the future and
> > accordingly has to be killed.
> 
> This sounds like a fairly fundamental problem to me.

Yes I agree. This is a significant limitation of first class virtual address spaces.
However, conflict like this can be mitigated by being careful in the application
that uses multiple first class virtual address spaces. If all threads make sure that
they never resize shared memory regions when executing inside a VAS such conflicts do
not occur. Another possibility that I investigated but not yet finished is that such
resizes of shared memory regions have to be synchronized more frequently than just at
every switch between VASes. If one for example "forward" memory region resizes to all
AS that share this particular memory region during the resize operation, one can
completely eliminate this problem. Unfortunately, this introduces a significant cost
and introduces a difficult to handle race condition.

> Is this an indication that full virtual address spaces are useless?  It
> would seem like if you only use virtual address segments then you avoid all
> of the problems with executing code, active stacks, and brk.

What do you mean with *virtual address segments*? The nice part of first class
virtual address spaces is that one can share/reuse collections of address space
segments easily.

Till
