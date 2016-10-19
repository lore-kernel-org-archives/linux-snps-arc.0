From: thomas.petazzoni@free-electrons.com (Thomas Petazzoni)
Date: Wed, 19 Oct 2016 22:32:00 +0200
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <1476879762.26312.12.camel@synopsys.com>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdVety8LeBgM1ZHfqw=NMjH5_=sQR=LLypQ1-YjxnuvaiQ@mail.gmail.com>
 <00b16c44-79b8-43b8-6516-13c8bb92eb03@synopsys.com>
 <5541266.ySlPfDOezF@wuerfel>
 <9a0f80b3-adb3-36de-d59f-885ac29ea2e6@synopsys.com>
 <87inso4kxb.fsf@concordia.ellerman.id.au>
 <1476879762.26312.12.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161019223200.21003f60@free-electrons.com>
To: linux-snps-arc@lists.infradead.org

Hello,

On Wed, 19 Oct 2016 12:23:12 +0000, Alexey Brodkin wrote:

> > I tried building a new toolchain with buildroot, using the instructions
> > from last time, but the resulting toolchain doesn't relocate, ie. it has
> > hard-coded paths in it. Any ideas?  
> 
> Hm... that's strange - it used to work but doesn't work with newer Buildroot...
> 
> Anyways if something very simple (i.e. with no extra libraries) works for you just go
> ahead and grab pre-built image that Thomas Petazzoni builds.
> 
> That's the most recent one:
> http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2016.08-613-ge98b4dd.tar.bz2
> 
> If I'm not mistaken Thomas runs some post-processing script to make these toolchains
> relocatable.
> 
> Maybe Thomas may comment on that and even maybe will share his post-processing technique
> so you'll be able to build your customized toolchain.

I simply have two patches on top of Buildroot to build the toolchains
available at http://autobuild.buildroot.org/toolchains/tarballs/ :

 - One patch that builds mpc, gmp and mpfr statically. This is needed
   since the host tools are built with an absolute rpath, so once the
   toolchain is moved, it can't find the host shared libraries that
   have been built for it. Using static linking is a temporary
   work-around, our idea is to fix the rpath to use relative path using
   $ORIGIN. There are some patches from Samuel Martin doing this, we
   have discussed them during the Buildroot Developers Meeting last
   week-end, and we proposed to Samuel to investigate a slightly
   different approach (namely add more features to the upstream
   patchelf utility).

 - One patch that fixes the toolchain wrapper logic so that it works
   fine when the toolchain is moved out of the usr/ sub-directory. We
   started discussing it during the meeting, but I got drowned into
   other discussions, so we haven't had the time to get to the bottom
   of it.

If people are interested, I can prepare a tutorial on how to build
re-usable and relocatable toolchains with Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
