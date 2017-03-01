From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Wed, 1 Mar 2017 20:28:25 +0100
Subject: [uclibc-ng-devel] [PATCH] ARC: Enable getpt() support in ARC
 defconfigs
In-Reply-To: <0496483a-e1ed-9064-94d6-214f84fd77d8@synopsys.com>
References: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
 <20170301162459.5d23c09e@free-electrons.com>
 <eaea2503-3a2a-2871-7f37-c57ed6504946@synopsys.com>
 <1488392734.4659.54.camel@synopsys.com>
 <39A54937CC95F24AA2F794E2D2B66B135829452A@DE02WEMBXB.internal.synopsys.com>
 <0496483a-e1ed-9064-94d6-214f84fd77d8@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170301192825.GA14124@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi,
Vineet Gupta wrote,

> On 03/01/2017 10:57 AM, Anton Kolesov wrote:
> >> That means for building of our toolchain we'll need to have separately stored
> >> "defconfigs" in some form. Let's see what Anton says on that :)
> 
> But why is that - as long as buildroot (or other build systems) pass the right cpu
> flags - why do you need a seperate config ?
> 
> >> And regardless of what mr Anton says having off-the-tree defconfigs is not
> >> the best idea because with time options will go in and out and occasionally
> >> we'll have outdated defconfigs.
> 
> The whole out-of-tree defconfig approach is nonsense - lets not discuss it !
> 
> > [AK] Not specifying architecture via uClibc config file is good for me - I
> > wanted this long ago, since I never understood why current approach was used in
> > the first place.
 
I am not really sure I understand the discussion completely.
I think we discuss two points here.

Point 1.:

Rules.mak and some default CFLAGS/LDFLAGS passed to the compile and
linking of code. I favour removing any specific -march/-mcpu/-mtune
stuff, as we have done in the past for ARM/MIPS.
So if ARC people like to remove this:
ifeq ($(TARGET_ARCH),arc)
        CPU_CFLAGS-$(CONFIG_ARC_CPU_700) += -mA7
        CPU_CFLAGS-$(CONFIG_ARC_CPU_HS) += -mcpu=archs
        CPU_LDFLAGS-y += $(CPU_CFLAGS) -marclinux
endif

I would say, yes, good thing. The toolchain defaults should be
correctly set, no need to overwrite it inside uClibc-ng buildsystem.

Point 2.:

The files in extra/Configs/defconfigs/ and its use-cases.
I haven't touched or used any files here, because most of them just
contain TARGET_<arch>=y

I would rather vote either to completely remove this directory or
use it in the same way for all architectures.

At the moment only ARC, OR1K and NDS32 use full defconfigs:
wc -l uClibc-ng-git/extra/Configs/defconfigs/*/*
    1 uClibc-ng-git/extra/Configs/defconfigs/alpha/defconfig
   39 uClibc-ng-git/extra/Configs/defconfigs/arc/arcv2_defconfig
   38 uClibc-ng-git/extra/Configs/defconfigs/arc/defconfig
   38 uClibc-ng-git/extra/Configs/defconfigs/arc/tb10x_defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/arm/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/avr32/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/bfin/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/cris/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/frv/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/h8300/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/hppa/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/i386/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/ia64/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/m68k/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/metag/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/microblaze/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/mips/defconfig
  167 uClibc-ng-git/extra/Configs/defconfigs/nds32/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/nios2/defconfig
  236 uClibc-ng-git/extra/Configs/defconfigs/or1k/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/powerpc/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/sh/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/sparc/defconfig
    1 uClibc-ng-git/extra/Configs/defconfigs/x86_64/defconfig
  537 total

I think only the ARC defconfigs are really used anywhere.

All projects I know of, using uClibc-ng as a C library to create a
cross-toolchain are using some kind of own defconfigs and generated
fragments.

In OpenADK I have some target/<arch>/uclibc-ng.config for every
architecture with sane defaults to regular run and test uClibc-ng
based systems in emulators or on real hardware. 
This is used in embedded-test to do regression testing.

Buildroot has some minimal defconfig and a developer can enable or
disable some features (RPC, WCHAR, Locales, ..).
I think a developer can also supply his own uClibc-ng config
fragment.

OpenWrt/LEDE use some own defconfigs.

To have a good compatibility for a lot of applications the ARC
Synopsis toolchains might use the existing Buildroot defaults, which
allows to build a lot of software packages. We have seen before the
last release, a lot of packages fail to compile, because the
internal buildroot toolchain uses more features than the external
Synopsis toolchain. (UCLIBC_HAS_GETPT, ..)

If the default creates to big systems, Synopsis can use minimal
configs and fix any autobuild issues ;)

I think any external toolchain builders should create their own
config and the uClibc-ng project should not provide any defconfigs
anymore. Indeed when someone just use Kconfig defaults he/she should always
end with a known to work toolchain.

I still think we have too much different config possibilities and if
we find some, which can be removed, I always vote for it.

Best regards
 Waldemar
