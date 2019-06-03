From: joseph@codesourcery.com (Joseph Myers)
Date: Mon, 3 Jun 2019 15:41:22 +0000
Subject: Pass config-time variable to LIBC_SLIBDIR_RTLDDIR 
In-Reply-To: <CY4PR1201MB01200F5CBFD010ADC371E89EA1190@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB01200F5CBFD010ADC371E89EA1190@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1906031528200.14124@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Fri, 31 May 2019, Alexey Brodkin wrote:

> Hi Andreas,
> 
> I'm trying to implement multilib support for ARC port of Glibc
> and for that we seem to need to have unique slibdir/rtlddir pair per
> each machine flavor. In our case these are at least:
>  - ARC700 (legacy ARCompact architecture)
>  - ARC HS38 (new gen ARCv2 architecture)
>  - ARC HS38 with hardware floating-point
>  - ARC HS48 (binary-compatible with HS38 but with different pipeline so
>              compiler schedules instructions differently)

If two processors are binary-compatible, in general you wouldn't have 
different library directories.  (The HWCAP mechanism can be used to have a 
single dynamic linker search different directories for optimized libraries 
depending on the processor; put the relevant HWCAP bits in 
HWCAP_IMPORTANT.  And of course you can just install different library 
builds depending on the processor you'll be running the resulting OS on.)

Different library directories are intended for the case where binaries for 
different ABIs can be executed on the same system (e.g. 32-bit and 64-bit; 
<https://sourceware.org/ml/libc-alpha/2018-01/msg00008.html> gives more 
details of the various places that need updating to support such a 
configuration in glibc).  For other cases of different ABIs, there should 
be different dynamic linker names, to support multiarch configurations 
that might run different-architecture binaries under emulation, but 
different library directories are not required.

> Given we have in GCC a dedicated "-mcpu" value for each of items above
> my first thought was to "automatically" setup slibdir/rtlddir
> based on "-mcpu" value passed in CC during configuration.

Checking -mcpu in CC is a bad idea, given that the compiler might have 
been configured with a default CPU rather than passing it on the command 
line.

Rather, you should test how the compiler behaves: either run $CC $CFLAGS 
$CPPFLAGS -E -dM -xc /dev/null and extract and examine predefined macros, 
or use AC_EGREP_CPP or AC_COMPILE_IFELSE for the same purpose.  (If you 
don't have predefined macros that make all the required ABI distinctions, 
obviously you need to add them.)  There are various examples of this in 
existing configure / preconfigure fragments.

Since there should be a finite list of known ABIs (which would be listed 
on <https://sourceware.org/glibc/wiki/ABIList> for a port included in 
glibc), you can then have a finite number of LIBC_SLIBDIR_RTLDDIR calls in 
a case statement.

-- 
Joseph S. Myers
joseph at codesourcery.com
