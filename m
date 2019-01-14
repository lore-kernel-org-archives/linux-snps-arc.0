From: raj.khem@gmail.com (Khem Raj)
Date: Mon, 14 Jan 2019 13:12:58 -0800
Subject: [PATCH] webkitgtk: Enable building for ARC architecture
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681C58B2@DE02WEMBXB.internal.synopsys.com>
References: <20190111125014.34593-1-abrodkin@synopsys.com>
 <CAMKF1soxmbmcHx4ZQkyx4aqoNYSApjU0wGTEntfsTm08Rg4Y8A@mail.gmail.com>
 <4881796E12491D4BB15146FE0209CE64681C58B2@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMKF1spk7gEf17DAiyETbRsjsVDXfTCfi+=Y9o3Q40=0X+gBXg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Jan 14, 2019 at 12:45 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hi Khem,
>
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem at gmail.com]
> > Sent: Friday, January 11, 2019 6:32 PM
> > To: Alexey Brodkin <alexey.brodkin at synopsys.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-core at lists.openembedded.org>;
> > Richard Purdie <richard.purdie at linuxfoundation.org>; Ross Burton <ross.burton at intel.com>; linux-snps-
> > arc at lists.infradead.org; Alexander Kanavin <alex.kanavin at gmail.com>; Hongxu Jia
> > <hongxu.jia at windriver.com>
> > Subject: Re: [PATCH] webkitgtk: Enable building for ARC architecture
> >
> > On Fri, Jan 11, 2019 at 4:50 AM Alexey Brodkin
> > <alexey.brodkin@synopsys.com> wrote:
> > >
> > > For that we need 2 things:
> > >  1. Disable JIT in JS as it's not supported for ARC.
> > >
> > >  2. Compile with "-mlong-calls" so relocations with
> > >     offsets larger than 25 bits are used, otherwise
> > >     linker fails to link final binaries.
> > >
> > > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > > Cc: Alexander Kanavin <alex.kanavin at gmail.com>
> > > Cc: Hongxu Jia <hongxu.jia at windriver.com>
> > > ---
> > >  meta/recipes-sato/webkit/webkitgtk_2.22.5.bb | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb b/meta/recipes-
> > sato/webkit/webkitgtk_2.22.5.bb
> > > index fc56822f7a..56f69c7a30 100644
> > > --- a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> > > +++ b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> > > @@ -69,6 +69,13 @@ EXTRA_OECMAKE = " \
> > >  EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
> > >  EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
> > >
> > > +# Javascript JIT is not supported on ARC
> > > +EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
> > > +# By default 25-bit "medium" calls are used on ARC
> > > +# which is not enough for binaries larger than 32 MiB
> > > +CFLAGS_append_arc = " -mlong-calls"
> > > +CXXFLAGS_append_arc = " -mlong-calls"
> >
> > perhaps adding to CPPFLAGS is going to be enough for both c/c++ cases
>
> Just tried that (only CPPFLAGS_append_arc = " -mlong-calls") and
> I don't see "-mlong-calls" used during compilation at all
> (I'm looking at .../oe/build/tmp-glibc/work/archs-oe-linux/webkitgtk/2.22.5-r0/temp/log.do_compile).
>
> So I may guess webkitgtk doesn't copy CPPFLAGS to CFLAGS and CXXFLAGS.
>

yes its possible. Thanks for additional verifications

> -Alexey
