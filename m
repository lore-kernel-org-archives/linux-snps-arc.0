From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 28 Oct 2016 12:42:25 +0200
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <dd827f68-2ad1-8193-53cd-ce7e9ac8eeb6@synopsys.com>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <1477561144.2561.19.camel@synopsys.com>
 <dd827f68-2ad1-8193-53cd-ce7e9ac8eeb6@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4261133.nGEyC6LumW@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Thursday, October 27, 2016 10:21:16 AM CEST Vineet Gupta wrote:
> 
> On 10/27/2016 02:39 AM, Alexey Brodkin wrote:
> >
> > And these are functions required by U-Boot (most probably the same is applied to kernel):
> > 1) so-called millicode, stuff like __ld_rX_to_rY, __st_rX_to_rX
> 
> This kicks in only at -Os and even there can be inhibited with a toggle.
> I don't like it anyways, seems like a costly contraption in terms of microarch
> cost of 2 extra long branches for both prologue and epilogue.
> 
> > 2) shifts: __ashldi3, __ashrdi3, __lshrdi3, 
> > 3) divisions: udivmodsi4, __divsi3, __modsi3, __udivsi3, __umodsi3
> 
> Note that this list is not constant. I recently had to export another libgcc
> symbol for modules, when a customer switched to ARC gnu 2016.03 for supposedly
> building the same kernel code.
> 
> > Indeed it is possible to have so-called private libgcc in kernel as well but
> > benefit will be only for people building kernels but not user-space because
> > in absence of multilibbed toolchain 2 separate toolchains will be required anyways.
> 
> True, but a lot of people only care about builds (and not actually run), so for
> them having to carry only one toolchain is an improvement.
> 
> > Still we'll have to pay an additional maintenance price to keep kernel's libgcc in
> > sync with the one from gcc.
> 
> True, but libgcc math emulation is likely one off thing. GNU folks will write them
> once and we use a snapshot - syncing back changes - if any around major gnu releases.
> 
> So I'm tending to include the libgcc code in kernel. @Arnd, @Claudiu do you know
> of any potential licensing issues ?
> 

I'd be surprised if there were any licensing issues, as libgcc is intentionally
meant to be included in everything built by gcc, and the architectures that don't
link against it tend to have a direct copy.

The main advantage of copying libgcc sources into the kernel instead of linking
directly to it is probably that you have better control over which functions
are actually used, as not everything in libgcc makes sense in kernel space.

The most common example is probably the 64-bit division, which is a libgcc
function on most architectures, and in the kernel we intentionally don't
implement that function in order to catch drivers trying to do that (and
change them to either explicit div_u64() or not do a 64-bit division).

Another example of a libgcc function you don't want is anything calling
abort(), which makes no sense in the kernel.

	Arnd
