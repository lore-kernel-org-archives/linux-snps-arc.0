From: dalias@libc.org (Rich Felker)
Date: Tue, 27 Mar 2018 19:58:52 -0400
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180327221635.GA3790@thunk.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <20180327221635.GA3790@thunk.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180327235852.GL1436@brightrain.aerifal.cx>
To: linux-snps-arc@lists.infradead.org

On Tue, Mar 27, 2018@06:16:35PM -0400, Theodore Y. Ts'o wrote:
> On Tue, Mar 27, 2018@04:51:08PM +0300, Ilya Smith wrote:
> > > /dev/[u]random is not sufficient?
> > 
> > Using /dev/[u]random makes 3 syscalls - open, read, close. This is a performance
> > issue.
> 
> You may want to take a look at the getrandom(2) system call, which is
> the recommended way getting secure random numbers from the kernel.

Yes, while opening /dev/urandom is not acceptable due to needing an
fd, getrandom and existing fallbacks for it have this covered if
needed.

> > > Well, I am pretty sure userspace can implement proper free ranges
> > > tracking?
> > 
> > I think we need to know what libc developers will say on implementing ASLR in 
> > user-mode. I am pretty sure they will say ?nether? or ?some-day?. And problem 
> > of ASLR will stay forever.
> 
> Why can't you send patches to the libc developers?

I can tell you right now that any patch submitted for musl that
depended on trying to duplicate knowledge of the entire virtual
address space layout in userspace as part of mmap would be rejected,
and I would recommend glibc do the same.

Not only does it vastly increase complexity; it also has all sorts of
failure modes (fd exhastion, etc.) which would either introduce new
and unwanted ways for mmap to fail, or would force fallback to the
normal (no extra randomization) strategy under conditions an attacker
could potentially control, defeating the whole purpose. It would also
potentially make it easier for an attacker to examine the vm layout
for attacks, since it would be recorded in userspace.

There's also the issue of preserving AS-safety of mmap. POSIX does not
actually require mmap to be AS-safe, and on musl munmap is not fully
AS-safe anyway because of some obscure issues it compensates for, but
we may be able to make it AS-safe (this is a low-priority open issue).
If mmap were manipulating data structures representing the vm space in
userspace, though, the only way to make it anywhere near AS-safe would
be to block all signals and take a lock every time mmap or munmap is
called. This would significantly increase the cost of each call,
especially now that meltdown/spectre mitigations have greatly
increased the overhead of each syscall.

Overall, asking userspace to take a lead role in management of process
vm space is a radical change in the split of what user and kernel are
responsible for, and it really does not make sense as part of a
dubious hardening measure. Something this big would need to be really
well-motivated.

Rich
