From: vgupta@synopsys.com (Vineet Gupta)
Date: Thu, 27 Oct 2016 10:21:16 -0700
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <1477561144.2561.19.camel@synopsys.com>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdVety8LeBgM1ZHfqw=NMjH5_=sQR=LLypQ1-YjxnuvaiQ@mail.gmail.com>
 <00b16c44-79b8-43b8-6516-13c8bb92eb03@synopsys.com>
 <5541266.ySlPfDOezF@wuerfel>
 <9a0f80b3-adb3-36de-d59f-885ac29ea2e6@synopsys.com>
 <87inso4kxb.fsf@concordia.ellerman.id.au>
 <1476879762.26312.12.camel@synopsys.com>
 <87shriwtpp.fsf@concordia.ellerman.id.au>
 <20161027090722.3ba2badc@free-electrons.com>
 <1477559240.2561.8.camel@synopsys.com>
 <20161027111118.5c585d51@free-electrons.com>
 <CAMuHMdUER2iSdACaU6uEO=122XyBPiVyKn3gW_uJJr2xbJMHYw@mail.gmail.com>
 <1477561144.2561.19.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <dd827f68-2ad1-8193-53cd-ce7e9ac8eeb6@synopsys.com>
To: linux-snps-arc@lists.infradead.org

+CC Claudiu

On 10/27/2016 02:39 AM, Alexey Brodkin wrote:
>
> And these are functions required by U-Boot (most probably the same is applied to kernel):
> 1) so-called millicode, stuff like __ld_rX_to_rY, __st_rX_to_rX

This kicks in only at -Os and even there can be inhibited with a toggle.
I don't like it anyways, seems like a costly contraption in terms of microarch
cost of 2 extra long branches for both prologue and epilogue.

> 2) shifts: __ashldi3, __ashrdi3, __lshrdi3, 
> 3) divisions: udivmodsi4, __divsi3, __modsi3, __udivsi3, __umodsi3

Note that this list is not constant. I recently had to export another libgcc
symbol for modules, when a customer switched to ARC gnu 2016.03 for supposedly
building the same kernel code.

> Indeed it is possible to have so-called private libgcc in kernel as well but
> benefit will be only for people building kernels but not user-space because
> in absence of multilibbed toolchain 2 separate toolchains will be required anyways.

True, but a lot of people only care about builds (and not actually run), so for
them having to carry only one toolchain is an improvement.

> Still we'll have to pay an additional maintenance price to keep kernel's libgcc in
> sync with the one from gcc.

True, but libgcc math emulation is likely one off thing. GNU folks will write them
once and we use a snapshot - syncing back changes - if any around major gnu releases.

So I'm tending to include the libgcc code in kernel. @Arnd, @Claudiu do you know
of any potential licensing issues ?

-Vineet
