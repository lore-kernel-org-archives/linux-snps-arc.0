From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 13 Nov 2018 10:44:24 +0000
Subject: [PATCH] locale: Allow usage of cross-localedef for ARC
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075013A5929B2@us01wembx1.internal.synopsys.com>
References: <20181112224351.2050-1-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075013A5929B2@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8490c13717fc938a38b53ecbf6e050dfc957787d.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Mon, 2018-11-12@23:22 +0000, Vineet Gupta wrote:
> 
> On 11/12/18 2:44 PM, Alexey Brodkin wrote:
> > With this it's possible to build locale data for ARC
> > and not do it instead on the first boot.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > ---
> >  meta/classes/libc-package.bbclass        | 2 ++
> >  meta/lib/oe/package_manager.py           | 2 ++
> >  meta/recipes-core/glibc/glibc-locale.inc | 2 +-
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> > index 9d09c7be6a..4c694ab5e2 100644
> > --- a/meta/classes/libc-package.bbclass
> > +++ b/meta/classes/libc-package.bbclass
> > @@ -242,6 +242,8 @@ python package_do_split_gconvs () {
> >          if use_cross_localedef == "1":
> >              target_arch = d.getVar('TARGET_ARCH')
> >              locale_arch_options = { \
> > +                "arc":     " --uint32-align=4 --little-endian ", \
> > +                "arceb":   " --uint32-align=4 --big-endian ",    \
> >                  "arm":     " --uint32-align=4 --little-endian ", \
> >                  "armeb":   " --uint32-align=4 --big-endian ",    \
> >                  "aarch64": " --uint32-align=4 --little-endian ",    \
> > diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> > index 882e7c429f..aa4de6e7c3 100644
> > --- a/meta/lib/oe/package_manager.py
> > +++ b/meta/lib/oe/package_manager.py
> > @@ -94,6 +94,8 @@ def generate_locale_archive(d, rootfs, target_arch, localedir):
> >      # Pretty sure we don't need this for locale archive generation but
> >      # keeping it to be safe...
> >      locale_arch_options = { \
> > +        "arc": ["--uint32-align=4", "--little-endian"],
> > +        "arceb": ["--uint32-align=4", "--big-endian"],
> >          "arm": ["--uint32-align=4", "--little-endian"],
> >          "armeb": ["--uint32-align=4", "--big-endian"],
> >          "aarch64": ["--uint32-align=4", "--little-endian"],
> > diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> > index 1b676dc26e..57b465dd5d 100644
> > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > @@ -27,7 +27,7 @@ ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-glibc-locale = "1"
> >  
> >  #enable locale generation on these arches
> >  # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> > -BINARY_LOCALE_ARCHES ?= "arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64"
> > +BINARY_LOCALE_ARCHES ?= "arc arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64"
> >  
> >  # set "1" to use cross-localedef for locale generation
> >  # set "0" for qemu emulation of native localedef for locale generation
> 
> Interesting: How do we do that for other buildsystems / buildroot or when building
> by hand ?

1. Buildroot

In buildroot we do pretty-much the same things, see
https://git.buildroot.org/buildroot/tree/Makefile#n640

We build localedef (with help of "host-localedef" package) and
then generate requested locales for the target.

2. Crosstool-NG

Here we just build locales on host and copy them over to
built cross-toolchain, see
https://github.com/crosstool-ng/crosstool-ng/blob/master/scripts/build/libc/glibc.sh#L482

The problem here (and this is explicitly mentioned in the script above) -
this locale only makes sense if host and target have the same uint32_t alignment
and endianess, see https://github.com/crosstool-ng/crosstool-ng/blob/master/scripts/build/libc/glibc.sh#L533

So if we're lucky we may get useful locales. Though there's another caveat:
Glibc 2.28 requires GCC 4.9+ which means you cannot build locales for target
on CentOS/RHEL machine any longer as GCC 4.8 is used by default.

3. Manually you're free to do whatever pleases you but
   since we cross-compile you'd need to use one of options discussed above:
     a) Use localedef (http://www.pengutronix.de/software/ptxdist/temporary-src/localedef-eglibc-2.14.1-r17443-ptx1.tar.bz2)
     b) Build natively on host and install on target

-Alexey
