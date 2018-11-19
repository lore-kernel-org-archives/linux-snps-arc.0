From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 19 Nov 2018 19:47:22 +0000
Subject: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
In-Reply-To: <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
 <1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
 <20181119190835.GO11247@bill-the-cat>
 <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8a464185ba05c61c37654fcbee0783b407318425.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Otavio, Tom, all,

On Mon, 2018-11-19@17:22 -0200, Otavio Salvador wrote:
> On Mon, Nov 19, 2018@5:08 PM Tom Rini <trini@konsulko.com> wrote:
> > On Mon, Nov 19, 2018@01:51:41PM +0100, Marek Vasut wrote:
> > > On 11/19/2018 11:04 AM, Alexey Brodkin wrote:
> > > > This utility is used for creation of images containing
> > > > usable in run-time U-Boot environment.
> > > > 
> > > > As of today this utility is added per-board like here [1]
> > > > for Intel Edison board.
> > > > 
> > > > [1] 
> > > > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_meta-2Dintel-2Dedison_tree_meta-2Dintel-2Dedison-2Dbsp_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dtools-5F2014.04.bb&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=sQnruA_KoGH_aC_YyN_lCddYmWBmcOpMVXzZtSwSbWo&s=pXmv0aNPFSCoj8CwGvwcZj-4bN_Sdjob3YwHYTzxDlw&e=
> > > > 
> > > > Given there're quite some U-Boot tools that we may want to add later
> > > > this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
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

That's how we start from simple enhancement one-liner and end-up
with rework of a different scale :)

I'm still ramping-up with OE but hopefully will be able to
implement proposed tool-per-package feature sometime soon.

-Alexey
