From: gizero@gmail.com (Andrea Galbusera)
Date: Sun, 25 Nov 2018 16:28:42 +0100
Subject: [OE-core] [PATCH v6] u-boot: Add mkenvimage tool
In-Reply-To: <5c54f25000309545ee74be3bc5f3e1b73296f675.camel@synopsys.com>
References: <20181122082807.39508-1-abrodkin@synopsys.com>
 <CAP9ODKo46bnbLLBrhUJHPa1QYKSc0c_TtFVd2Q-Tv7j193K+ug@mail.gmail.com>
 <5c54f25000309545ee74be3bc5f3e1b73296f675.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAC+thW1Dt93n9sX6Nw9QU-P3xvKQrx8Pk8aJokeagiP48=LY4Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 22, 2018 at 10:47 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hi Otavio,
>
> On Thu, 2018-11-22@07:30 -0200, Otavio Salvador wrote:
> > Hello Alexey,
> >
> > On Thu, Nov 22, 2018 at 6:28 AM Alexey Brodkin
> > <alexey.brodkin@synopsys.com> wrote:
> > > This utility is used for creation of images containing
> > > usable in run-time U-Boot environment.
> > >
> > > As of today this utility is added per-board like here [1]
> > > for Intel Edison board.
> > >
> > > [1]
> > > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_meta-2Dintel-2Dedison_tree_meta-2Dintel-2Dedison-2Dbsp_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dtools-5F2014.04.bb&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=0oSj04biS8fsfFjYHNTIfKozS-TUjseTTeyuKHHcljA&s=hpwGEnrX5gArYJHLxYhMZ4x6s3irTZyCMjjnFipip7k&e=
> > >
> > > Given there're quite some U-Boot tools that we may want to add later
> > > this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> > > still for compatibility we provide "u-boot-mkimage" with help
> > > of PROVIDES as well as proposed "u-boot-mkenvimage".
> > >
> > > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > > Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> > > Cc: Otavio Salvador <otavio at ossystems.com.br>
> > > Cc: Martin Jansa <martin.jansa at gmail.com>
> > > Cc: Ross Burton <ross.burton at intel.com>
> > > Cc: Marek Vasut <marex at denx.de>
> >
> > Acked-by: Otavio Salvador <otavio at ossystems.com.br>
> >
> > I'd like to thank you to keep the pace until it was ready. I know it
> > may be challenging to contribute to new projects and OpenEmbedded is
> > no different.
> >
> > You were very welcoming to comments and change requests and I believe
> > it was a great thread of changes which lead to a good patch. I look
> > forward to the new patches you'll start submitting from now on :-)
>
> I'd like to thank you guys as well for being patient and providing
> meaningful comments for my naive and sometime silly changes.
>
> And sure there will be more patches as now we start using OE
> for quite some projects basically trying to get ARC up to speed
> in OE as good as possible and given our architecture differs a bit
> from others (as any other arch) we're not only adding features but
> more fix issues that were not seen before due to pure luck...
> like we typically have 8k MMU page a bit exotic int64_t alignment
> by 32 bits etc so there'll be more stuff from us in the foreseeable
> future :)

Looking forward to show the iterations behind this series to
contribution newbies. It's a good example of when things work well
both sides! I had this little piece of u-boot-tools flying around in
several projects, but never found the time to figure out a reasonable
approach to reconcile it cleanly with the other u-boot components. Of
course, I'm first of all showing myself that I'd have better
contributed it at first to leverage all suggestions that came out of
this discussion. Thanks Alexey for taking care of this all!
