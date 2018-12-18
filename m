From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 15:07:04 -0800
Subject: [PATCH 00/21] glibc port to ARC processors
In-Reply-To: <alpine.DEB.2.21.1812182243320.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182243320.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <db17a8c2-fdbf-4956-f710-ad4a9d9b6501@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 2:52 PM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> | FAIL: elf/check-localplt		# passes for build-many-glibcs.py
>> 					# buildroot builds with slightly different toggles (-Os)
>> 					# such that gcc generates an extra memcpy PLT call
> 
> I fixed lots of such issues with -Os on various architectures; it should 
> be possible to fix this one as well.  (I haven't run build-many-glibcs.py 
> with -Os lately, so it's possible more problems have crept in or appear 
> with current compilers.  When I was testing it, it failed for m68k - the 
> m68k libm functions don't build with -Os because bits/mathinline.h doesn't 
> get included then, which needs addressing anyway in some way to eliminate 
> bits/mathinline.h from glibc - but worked for most or all other 
> configurations.)

The actual xcheck runs posted later on have been with buildroot built toolchain
which defaults to -Os, so it works for ARC, except for this additional entry.

At any rate, the generated code will likely be different for -Os and otherwise,
does that mean entries get added conditionally to localplt.data etc ?

>> (d) We currently only support soft float ABI, although I'm working on hard float
>>     and hopefully will have it ready sometime during the review of this series
> 
> Could you confirm what the ABI entry or entries to go at 
> <https://sourceware.org/glibc/wiki/ABIList> would look like?

soft-float LE: ld-linux-arc.so.2
hard-float LE: ld-linux-archf.so.2   (although this is just a preference)

> Note that we generally expect new ports to use different dynamic linker 
> names for each ABI.  This means separate names for hard float and soft 
> float.  Since it appears you support both big and little endian, it also 
> means separate dynamic linker names for each of those (and corresponding 
> GCC changes will be needed to pass the right dynamic linker names to ld's 
> -dynamic-linker option). 

ARC historically has supported both LE/BE, but we are kind of moving away from BE
and as far as I know, there's no-one actively working with BE (except 1 specific
customer with legact cores). It is safe to assume we won't support BE and this is
sort of easier said for ARC processors as they have many many hardware config
knobs and not all are supported for Linux usecase, so BE can be considered as such.

> Then, each supported ABI should have a build in 
> build-many-glibcs.py, and any unsupported ABI variants need to have a 
> configure-time error (to avoid accidentally building a glibc incompatible 
> with the correct ABI for such a port added in future).

Right, at this point I only have soft-float and work is ongoing for hard.

Thx for taking a look.
-Vineet
