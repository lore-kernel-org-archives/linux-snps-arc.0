From: joseph@codesourcery.com (Joseph Myers)
Date: Mon, 3 Jun 2019 17:50:22 +0000
Subject: Pass config-time variable to LIBC_SLIBDIR_RTLDDIR 
In-Reply-To: <CY4PR1201MB0120B0A953107C8047BCCDF1A1140@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB01200F5CBFD010ADC371E89EA1190@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <alpine.DEB.2.21.1906031528200.14124@digraph.polyomino.org.uk>
 <CY4PR1201MB0120B0A953107C8047BCCDF1A1140@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1906031745340.14124@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, 3 Jun 2019, Alexey Brodkin wrote:

> Well I'm trying to solve a little bit different problem - to build
> a universal multilib cross-toolchain which will be usable for building
> binaries optimized for different ARC cores. Different I mean:
>  - Binary-incompatible architecture generations: ARCv1/ARCv2 (both still 32-bit)
>  - Hard/soft floating-point
>  - etc.

That sort of thing generally uses a separate sysroot for each multilib.  
(Using GCC's t-sysroot-suffix avoids needing to define SYSROOT_SUFFIX_SPEC 
manually yourself.)

Then the libraries don't need to use separate library directories if only 
one ABI makes sense on a target at a time.  (But cases with different 
endianness / different function calling ABI / different struct layout etc. 
should still use different dynamic linker names.)

> > Checking -mcpu in CC is a bad idea, given that the compiler might have
> > been configured with a default CPU rather than passing it on the command
> > line.
> 
> Well this case (no "-mcpu" in CC) is handled - then we just installed
> libs in default non-multilib location, i.e. simple "/lib".

The locations should be a function of the ABI - *not* of whether the ABI 
is the default one for the compiler.  (For example, /lib64 is the 
directory for non-x32 x86_64 libraries - both in an x86_64-linux-gnu 
toolchain, and also for the -m64 multilib of an i686-linux-gnu toolchain 
configured --enable-targets=all.  If you use Debian-style multiarch 
layout, the locations are still a function of the ABI, just a different 
function.)

-- 
Joseph S. Myers
joseph at codesourcery.com
