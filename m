From: ynorov@caviumnetworks.com (Yury Norov)
Date: Tue, 20 Jun 2017 17:36:35 +0300
Subject: [PATCH 03/20] asm-generic: Drop getrlimit and setrlimit syscalls
 from default list
In-Reply-To: <20170619221023.GT6973@jhogan-linux.le.imgtec.org>
References: <20170619155003.13218-1-ynorov@caviumnetworks.com>
 <20170619155003.13218-4-ynorov@caviumnetworks.com>
 <20170619214223.GS6973@jhogan-linux.le.imgtec.org>
 <CAK8P3a0M2TkoUY4KBgmtnh3NDNj-oSNOpVagHVFuFBEYnAYp8Q@mail.gmail.com>
 <20170619221023.GT6973@jhogan-linux.le.imgtec.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170620143635.nb4iy6fwhedlshcz@yury-thinkpad>
To: linux-snps-arc@lists.infradead.org

On Mon, Jun 19, 2017@11:10:23PM +0100, James Hogan wrote:
> On Mon, Jun 19, 2017@11:58:41PM +0200, Arnd Bergmann wrote:
> > On Mon, Jun 19, 2017@11:42 PM, James Hogan <james.hogan@imgtec.com> wrote:
> > > On Mon, Jun 19, 2017@06:49:46PM +0300, Yury Norov wrote:
> > > Subject: [PATCH] Deprecate stat syscalls superseded by statx
> > >
> > > Various stat system calls can now be implemented as userland wrappers
> > > around the new statx system call, so allow them to be removed from the
> > > kernel by default for new architectures / ABIs.
> > >
> > > This involves adding __ARCH_WANT_SYSCALL_UNXSTAT to each existing
> > > architecture, which enables the relevant stat system calls in the
> > > generic system call list (if used). It also conditionally defines the
> > > syscalls in fs/stat.c and struct stat / struct stat64 in
> > > asm-generic/stat.h.
> > >
> > > Signed-off-by: James Hogan <james.hogan at imgtec.com>
> > > Cc: David Howells <dhowells at redhat.com>
> > > Cc: Alexander Viro <viro at zeniv.linux.org.uk>
> > > Cc: Arnd Bergmann <arnd at arndb.de>
> > > Cc: linux-fsdevel at vger.kernel.org
> > > Cc: linux-arch at vger.kernel.org
> > > Cc: linux-api at vger.kernel.org
> > > Cc: linux-kernel at vger.kernel.org
> > 
> > Good idea:
> > 
> > Acked-by:  Arnd Bergmann <arnd at arndb.de>
> 
> Thanks,
> 
> > 
> > > +/* statx deprecates the un-extended stat syscalls which use struct stat[64] */
> > > +#ifdef __ARCH_WANT_SYSCALL_UNXSTAT
> > 
> > I'm glad you explain what 'UNXSTAT' means here, since I would not
> > have otherwise guessed it, but I also can't think of anything more
> > intuitive.
> 
> Yeh, I renamed that several times while playing around with this :-).
> 
> The stat syscalls remind me a bit of the Vicar of Dibley episode where
> the new road named "New Road" necessitates the renaming of the existing
> "New Road" to "Quite Old Road" and "Quite Old Road" to "Really Quite Old
> Road" and "Old Road" to "Very Old Road"!
> 
> Cheers
> James

(Add Palmer Dabbelt <palmer at dabbelt.com>)

The stat syscalls are full of hacks, and we have to pull that hacks
even to new architectures to deal with stat. So I'll be happy to drop
it in arm64/ilp32. But it means that I need some time to integrate
your patch and fix glibc accordingly. And it also means that we need
round 9 for ilp32... :(

Arnd, once before you told that generic unistd has some duplications
and legacy syscalls, and one day we'll have to deal with it. Do you
have the list or something on it?

I would also notice riscv people and welcome to the discussion.  

As there is more than 1 arch that goes to be added to linux soon,
maybe it's better to upstream my ans James' patches separately
from other ilp32 patches? Arnd?

Yury
