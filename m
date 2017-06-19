From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 19 Jun 2017 23:58:41 +0200
Subject: [PATCH 03/20] asm-generic: Drop getrlimit and setrlimit syscalls
 from default list
In-Reply-To: <20170619214223.GS6973@jhogan-linux.le.imgtec.org>
References: <20170619155003.13218-1-ynorov@caviumnetworks.com>
 <20170619155003.13218-4-ynorov@caviumnetworks.com>
 <20170619214223.GS6973@jhogan-linux.le.imgtec.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK8P3a0M2TkoUY4KBgmtnh3NDNj-oSNOpVagHVFuFBEYnAYp8Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Jun 19, 2017@11:42 PM, James Hogan <james.hogan@imgtec.com> wrote:
> Hi Yury,
>
> On Mon, Jun 19, 2017@06:49:46PM +0300, Yury Norov wrote:
>> The newer prlimit64 syscall provides all the functionality provided by
>> the getrlimit and setrlimit syscalls and adds the pid of target process,
>> so future architectures won't need to include getrlimit and setrlimit.
>>
>> Therefore drop getrlimit and setrlimit syscalls from the generic syscall
>> list unless __ARCH_WANT_SET_GET_RLIMIT is defined by the architecture's
>> unistd.h prior to including asm-generic/unistd.h, and adjust all architectures
>> using the generic syscall list to define it so that no in-tree architectures
>> are affected.
>
> I have a similar experimental patch lying around for the stat system
> calls which are superseded by statx (see below). If it looks acceptable
> maybe you'd like to incorporate it (or something similar) into your
> series.
>
> Cheers
> James
>
> ---
> From: James Hogan <james.hogan at imgtec.com>
> Date: Fri, 2 Jun 2017 13:07:27 +0100
> Subject: [PATCH] Deprecate stat syscalls superseded by statx
>
> Various stat system calls can now be implemented as userland wrappers
> around the new statx system call, so allow them to be removed from the
> kernel by default for new architectures / ABIs.
>
> This involves adding __ARCH_WANT_SYSCALL_UNXSTAT to each existing
> architecture, which enables the relevant stat system calls in the
> generic system call list (if used). It also conditionally defines the
> syscalls in fs/stat.c and struct stat / struct stat64 in
> asm-generic/stat.h.
>
> Signed-off-by: James Hogan <james.hogan at imgtec.com>
> Cc: David Howells <dhowells at redhat.com>
> Cc: Alexander Viro <viro at zeniv.linux.org.uk>
> Cc: Arnd Bergmann <arnd at arndb.de>
> Cc: linux-fsdevel at vger.kernel.org
> Cc: linux-arch at vger.kernel.org
> Cc: linux-api at vger.kernel.org
> Cc: linux-kernel at vger.kernel.org

Good idea:

Acked-by:  Arnd Bergmann <arnd at arndb.de>

> +/* statx deprecates the un-extended stat syscalls which use struct stat[64] */
> +#ifdef __ARCH_WANT_SYSCALL_UNXSTAT

I'm glad you explain what 'UNXSTAT' means here, since I would not
have otherwise guessed it, but I also can't think of anything more
intuitive.

         Arnd
