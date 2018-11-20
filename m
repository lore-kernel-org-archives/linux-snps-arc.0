From: peter.kjellerstedt@axis.com (Peter Kjellerstedt)
Date: Tue, 20 Nov 2018 14:29:25 +0000
Subject: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
In-Reply-To: <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
 <1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
 <20181119190835.GO11247@bill-the-cat>
 <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
To: linux-snps-arc@lists.infradead.org

> -----Original Message-----
> From: openembedded-core-bounces at lists.openembedded.org <openembedded-
> core-bounces at lists.openembedded.org> On Behalf Of Otavio Salvador
> Sent: den 19 november 2018 20:22
> To: Tom Rini <trini at konsulko.com>
> Cc: Marek Vasut <marex at denx.de>; linux-snps-arc at lists.infradead.org;
> Alexey Brodkin <alexey.brodkin at synopsys.com>; Otavio Salvador
> <otavio at ossystems.com.br>; Patches and discussions about the oe-core
> layer <openembedded-core at lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
> 
> On Mon, Nov 19, 2018@5:08 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Mon, Nov 19, 2018@01:51:41PM +0100, Marek Vasut wrote:
> > > On 11/19/2018 11:04 AM, Alexey Brodkin wrote:
> > > > This utility is used for creation of images containing
> > > > usable in run-time U-Boot environment.
> > > >
> > > > As of today this utility is added per-board like here [1]
> > > > for Intel Edison board.
> > > >
> > > > [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-
> edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-
> tools_2014.04.bb
> > > >
> > > > Given there're quite some U-Boot tools that we may want to add
> later
> > > > this recipe name switch from "u-boot-mkimage" to generic "u-boot-
> tools"
> > > > still for compatibility we provide "u-boot-mkimage" with help
> > > > of PROVIDES as well as proposed "u-boot-mkenvimage".
> > > >
> > > > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > > > Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> > > > Cc: Otavio Salvador <otavio at ossystems.com.br>
> > > > Cc: Martin Jansa <martin.jansa at gmail.com>
> > > > Cc: Ross Burton <ross.burton at intel.com>
> > > > Cc: Marek Vasut <marex at denx.de>
> > >
> > > Do we want to generate one package per tool or not ?
> >
> > I think so, yes.  Not all places will want all tools.
> 
> And a bonus to add a u-boot-tools-meta which rdepends on all. You can
> copy code to do that from gstreamer-plugins packages.

Actually, why mess with an unnecessary meta package. Just use the 
empty ${PN} package for that. That works for the GStreamer packages 
as well these days (since commit 8e1009a3), even though they do it 
by depending on the meta packages for backwards compatibility.

//Peter

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
