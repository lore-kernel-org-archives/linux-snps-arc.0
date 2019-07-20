From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Sat, 20 Jul 2019 15:37:40 +0000
Subject: [TRIVIAL PATCH] of: per-file dtc preprocessor flags
In-Reply-To: <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com>
References: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
 <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b2f24f32fead8bc9f282d2beb77d58ed3b98850c.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Masahiro,

On Sat, 2019-07-20@11:40 +0900, Masahiro Yamada wrote:
> On Sat, Jul 20, 2019 at 4:28 AM Eugeniy Paltsev
> <Eugeniy.Paltsev@synopsys.com> wrote:
> > As of today we are able to pass custom flags to dtc compiler but not
> > to dtc preprocessor.
> > This ability is required for including some board-specific header files.
> > It allows us to pass defined constants to dts without their duplication
> > in several places.
> 
> How to use this option in a useful way?
> 
> I see a bunch of defined constants under include/dt-bindings/.
> 
> If you are talking about code duplication across architectures,
> you can include arm dtsi from arm64 dts, or vice versa.
> This was made possible by the symbolic links
> in scripts/dtc/include-prefixes/.
> 
> Could you please elaborate your issues if you cannot solve them
> by the current strategy?
> 

Here is the example:

We have several FPGA-based boards (haps_hs, haps_hs_idu,...) which are involved
in SW and HW automated verification. For some tests we randomize physical memory
location so we patch 'CONFIG_LINUX_RAM_BASE' kconfig variable and 'memory' node in
device tree. We want to keep number of patches as less as possible (to avoid
conflicts on their applying) so we want to avoid duplication and pass
'CONFIG_LINUX_RAM_BASE' directly to dts by including it from
'include/generated/autoconf.h':

----------------------------->8------------------------------------
memory {
	device_type = "memory";
-		/* CONFIG_LINUX_RAM_BASE needs to match low mem start */
-               reg = <0x80000000 0x20000000>;  /* 512 */
+               reg = <CONFIG_LINUX_RAM_BASE 0x20000000>;      /* 512 */
};
----------------------------->8------------------------------------

This patch allows us to extend the search path of include files to
include 'include/generated/autoconf.h'.

> 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> >  scripts/Makefile.lib | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index f1f38c8cdc74..f2595a608dce 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -166,6 +166,8 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
> >                  $(addprefix -I,$(DTC_INCLUDE))                          \
> >                  -undef -D__DTS__
> > 
> > +dtc_cpp_flags  += $(DTC_CPP_FLAGS_$(basetarget))
> > +
> >  # Useful for describing the dependency of composite objects
> >  # Usage:
> >  #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
> > --
> > 2.21.0
> > 
> 
> 
-- 
 Eugeniy Paltsev
