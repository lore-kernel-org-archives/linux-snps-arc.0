From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 12 Sep 2018 13:43:09 +0000
Subject: defconfig fails if CROSS_COMPILE is set while cross-gcc is not
 avaialble
In-Reply-To: <CAK7LNAR0ghuhDXUqJ=nX0dtbtoOvFff9Eeu-hHWLkTONG09GAQ@mail.gmail.com>
References: <0854f35e92c95e552721dc6a46f4ee2bc4020bc1.camel@synopsys.com>
 <CAK7LNAR0ghuhDXUqJ=nX0dtbtoOvFff9Eeu-hHWLkTONG09GAQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2c5d00f99db07df1a8cc5168d62d5764544fb83e.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Masahiro,

On Wed, 2018-09-12@21:53 +0900, Masahiro Yamada wrote:
> Hi Alexey.
> 
> 2018-09-12 21:08 GMT+09:00 Alexey Brodkin <Alexey.Brodkin at synopsys.com>:
> > Hello Masahiro-san,
> > 
> > Starting from kernel v4.17 it is no longer possible to install kernel headers
> > for ARC architecture if there's no cross-toolchain in PATH.
> 
> 
> Really?
> 
> I can do 'make ARCH=arc headers_install'
> with the latest Linus' tree.

Indeed "headers_install" works that way but is it OK to install headers
without previous configuration. In my experiment I don't see any differences
though for example OpenEmbedded on configuration step of "linux-libc-headers"
do "ARCH=xxx make allnoconfig", see 
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc#L57

That might be some legacy but I'm not really sure,
worth asking OE people.

For the record in Buildroot no configuration happens for Linux headers,
see https://git.buildroot.org/buildroot/tree/package/linux-headers/linux-headers.mk#n106

> I see the following warnings, but possible to install kernel headers.
> 
> ./scripts/gcc-version.sh: line 26: arc-linux-gcc: command not found
> ./scripts/gcc-version.sh: line 27: arc-linux-gcc: command not found

Right... that happens because we're doing 2 hackish things:
1. Checking if current toolchain is configured for ARCompact (ARCv1) ISA
   or ARCv2. That's because we use toolchain's libgcc and so we want to warn
   a user if wrong toolchain is used early instead of leaving him to deal with
   final linkage failure.
   See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/Makefile#n23

2. Asking CC for a path to libgcc
   See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/Makefile#n82

[snip]

> I am trying to fix even those warnings
> by eliminating unneeded compiler invocation.  It is WIP.

And if (1) is not super important (in fact we used to live without it for years)
(2) requires implementation of libgcc in kernel sources (which BTW will make (1)
obsolete immediately). We do have it on our todo list though...

[snip]

> > That doesn't happen for ARM and other arches simply because for ARC
> > we define CROSS_COMPILE if it is not set by user, see:
> > 
https://urldefense.proofpoint.com/v2/url?u=https-3A__git.kernel.org_pub_scm_linux_kernel_git_torvalds_linux.git_tree_arch_arc_Makefile-23n9&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=zJsa5MrAtDiYEWr5PZNS1aGk21ETa-qXzLPIddwvoQI&s=BU0ltPPoRLn3np_ba4HRHfH9i141uZjoS8jsJrg8SNc&e=
> 
> I do not think it is a good practice
> to forcibly set CROSS_COMPILE that users may not have.

Maybe so. Still some arches or random platforms do that.

> arch/m68k/Makefile uses cc-cross-prefix helper
> to set the first found compiler.

Well I'm not really sure we need to mess with CROSS_COMPILE in kernel.
I.e. there might be tons of variations depending on who toolchain was built
etc. So I'd better get rid of CROSS_COMPILE setup in our Makefile.

> > Still if CROSS_COMPILE is set before execution of "make defconfig"
> > then the same problem happens for others.
> > 
> > I was able to find a series of commits which cause this problem,
> > here they are:
> > ----------------------------->8--------------------------
> > 59f53855babf - gcc-plugins: test plugin support in Kconfig and clean up Makefile
> > 469cb7376c06 - kconfig: add CC_IS_CLANG and CLANG_VERSION
> > a4353898980c - kconfig: add CC_IS_GCC and GCC_VERSION
> > ----------------------------->8--------------------------
> > 
> > What happen is "$(CC)" is passed as an argument and in its turn CC is
> > "$(CROSS_COMPILE)gcc", see:
> > 
https://urldefense.proofpoint.com/v2/url?u=https-3A__git.kernel.org_pub_scm_linux_kernel_git_torvalds_linux.git_tree_Makefile-23n385&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=zJsa5MrAtDiYEWr5PZNS1aGk21ETa-qXzLPIddwvoQI&s=S7zeHBpIp1P94XbyoMsaSnJWRqDGn69yGyeob-jzMJ4&e=
> > 
> > 
> > So if I substitute "CC" with "HOSTCC" in a couple of places (see below)
> > the problem goes away. But I'm not really sure if what I do is correct.
> > I.e. when we're interested in CC for target and when only host CC is of
> > our interest.
> 
> I think the log of commit 316d55d55f49eca44
> is a good source to know the background of this change.
> 
> Now Kconfig requires the target compiler.
> So, it does not make sense to
> do defconfig with non-existing compiler.

Agree, so I'll check with OpenEmbedded people if there's a reason to do "make allnoconfig"
if it's just a legacy code we'll fix it there.

Thanks a lot for all the input, much appreciated!

-Alexey
