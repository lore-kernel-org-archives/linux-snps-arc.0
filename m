From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 22:52:09 +0000
Subject: [PATCH 00/21] glibc port to ARC processors
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182243320.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> | FAIL: elf/check-localplt		# passes for build-many-glibcs.py
> 					# buildroot builds with slightly different toggles (-Os)
> 					# such that gcc generates an extra memcpy PLT call

I fixed lots of such issues with -Os on various architectures; it should 
be possible to fix this one as well.  (I haven't run build-many-glibcs.py 
with -Os lately, so it's possible more problems have crept in or appear 
with current compilers.  When I was testing it, it failed for m68k - the 
m68k libm functions don't build with -Os because bits/mathinline.h doesn't 
get included then, which needs addressing anyway in some way to eliminate 
bits/mathinline.h from glibc - but worked for most or all other 
configurations.)

> (d) We currently only support soft float ABI, although I'm working on hard float
>     and hopefully will have it ready sometime during the review of this series

Could you confirm what the ABI entry or entries to go at 
<https://sourceware.org/glibc/wiki/ABIList> would look like?

Note that we generally expect new ports to use different dynamic linker 
names for each ABI.  This means separate names for hard float and soft 
float.  Since it appears you support both big and little endian, it also 
means separate dynamic linker names for each of those (and corresponding 
GCC changes will be needed to pass the right dynamic linker names to ld's 
-dynamic-linker option).  Then, each supported ABI should have a build in 
build-many-glibcs.py, and any unsupported ABI variants need to have a 
configure-time error (to avoid accidentally building a glibc incompatible 
with the correct ABI for such a port added in future).

-- 
Joseph S. Myers
joseph at codesourcery.com
