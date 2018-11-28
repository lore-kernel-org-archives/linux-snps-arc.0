From: otavio.salvador@ossystems.com.br (Otavio Salvador)
Date: Wed, 28 Nov 2018 08:58:15 -0200
Subject: [OE-core] [PATCH] u-boot-tools: Improve build preparation
In-Reply-To: <33b52a810fe1248322362e401b7138024caca0cc.camel@synopsys.com>
References: <20181127191255.39052-1-abrodkin@synopsys.com>
 <CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
 <CAP9ODKo+3XpTqsVpUB3s2OhUuV2039J-RefKOBvDNVABQB18+w@mail.gmail.com>
 <33b52a810fe1248322362e401b7138024caca0cc.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAP9ODKpJ83gkrLfcAxVo9VonZbAyLcYvrV-5taX7yTJyM4w4kA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 27, 2018 at 6:49 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
> On Tue, 2018-11-27@17:52 -0200, Otavio Salvador wrote:
> > On Tue, Nov 27, 2018@5:30 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
> > > On Tue, Nov 27, 2018 at 5:13 PM Alexey Brodkin
> > > <alexey.brodkin@synopsys.com> wrote:
> > > > Even though we're not going to build here real U-Boot binary
> > > > it is still required to "configure" U-Boot to get get to the
> > > > tools building.
> > > >
> > > > We used to use "sandbox_defconfig" for that purpose but
> > > > since U-Boot v2018.11 it started to cause problems [1] due to [2].
> > > >
> > > > So to have less dependencies let's create super minimalistic
> > > > configuration which is good enough to allow us to run "make tools".
> > > >
> > > > [1]
> > > > https://urldefense.proofpoint.com/v2/url?u=http-3A__errors.yoctoproject.org_Errors_Details_202185_&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=6GBkAGgxs4IOh0rJ4joj36Xukb_msE_tdIIJQXh8Gbg&s=vuvAMfkM9WIKHek7mwuwSjWKKpUcKJ-zCcKypEfxCuw&e=
> > > > [2]
> > > > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.denx.de_-3Fp-3Du-2Dboot.git-3Ba-3Dcommitdiff-3Bh-3Da4958a71017fb142542f977c843c5fce769fc6ea&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=6GBkAGgxs4IOh0rJ4joj36Xukb_msE_tdIIJQXh8Gbg&s=GN4U6Of_hi-W_5CEu3RvRUIVEjgaNwnK8CarkwIly4Y&e=
> > > >
> > > > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > >
> > > To allow extended use, we need to enable CONFIG_FIT_SIGNATURE
> > > otherwise we won't have the support.
> > >
> > > See:
> > >
> > > # MXSImage needs LibSSL
> > > ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_ARMADA_38X)$(CONFIG_ARMADA_39X)$(CONFIG_FIT_SIGNATURE),)
> > > HOSTLOADLIBES_mkimage += \
> > >         $(shell pkg-config --libs libssl libcrypto 2> /dev/null ||
> > > echo "-lssl -lcrypto")
> > >
> > > If you do that, we can likely rely on this and avoid some extra tools
> > > packages (for example on meta-freescale).
> >
> > Looking at this, I am wondering if folowing wouldn't be a generic
> > solution capable of upstreaming:
> >
> > diff --git a/configs/nativetools_defconfig b/configs/nativetools_defconfig
> > new file mode 100644
> > index 0000000000..be69bdf43a
> > --- /dev/null
> > +++ b/configs/nativetools_defconfig
> > @@ -0,0 +1,3 @@
> > +CONFIG_SYS_TEXT_BASE=0
> > +CONFIG_FIT=y
> > +CONFIG_FIT_SIGNATURE=y
> > diff --git a/tools/Makefile b/tools/Makefile
> > index 3c0521f655..e916d0cebb 100644
> > --- a/tools/Makefile
> > +++ b/tools/Makefile
> > @@ -124,7 +124,7 @@ fit_info-objs   := $(dumpimage-mkimage-objs) fit_info.o
> >  fit_check_sign-objs   := $(dumpimage-mkimage-objs) fit_check_sign.o
> >  file2include-objs := file2include.o
> >
> > -ifneq ($(CONFIG_MX23)$(CONFIG_MX28),)
> > +ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_FIT_SIGNATURE),)
> >  # Add CONFIG_MXS into host CFLAGS, so we can check whether or not register
> >  # the mxsimage support within tools/mxsimage.c .
> >  HOSTCFLAGS_mxsimage.o += -DCONFIG_MXS
>
> So do you think there's a room for improvement in my patch for OE?
> Or before we get a missing part for tools/Makefile there's nothing more
> to be done in OE?

You could use this attached patch (marking as Pending as it is still
RFC). It allow us to drop or 'mxsboot' recipe on meta-freescale, for
example.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
