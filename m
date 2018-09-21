From: ross.burton@intel.com (Burton, Ross)
Date: Fri, 21 Sep 2018 13:53:58 +0100
Subject: [OE-core] [PATCH v2 5/9] libgpg-error: Add ARC support
In-Reply-To: <bb6c7d725f34a4bb5b08164268db7a2863aa1cf3.camel@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
 <20180920204232.10583-6-abrodkin@synopsys.com>
 <CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
 <9bb4d4d54024982cb3a0b02222a45e12845cba85.camel@synopsys.com>
 <bb6c7d725f34a4bb5b08164268db7a2863aa1cf3.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAJTo0La_MuDqcdy4brMRkiprQzAnAwo1omdGzz_=kDjgc1Hsvg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Can you check that v3 works with x86-64 targets?

ERROR: libgpg-error-1.32-r0 do_compile: Function failed: do_compile
(log file is located at
/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345)
ERROR: Logfile of failure stored in:
/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| cp: cannot stat
'/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/libgpg-error-1.32/src/syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h':
No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345)

Ross
On Fri, 21 Sep 2018 at 13:51, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Ross,
>
> On Fri, 2018-09-21@14:31 +0300, Alexey Brodkin wrote:
> > Hi Ross,
> >
> > On Fri, 2018-09-21@11:43 +0100, Burton, Ross wrote:
> > > On Thu, 20 Sep 2018 at 21:44, Alexey Brodkin
> > > <Alexey.Brodkin@synopsys.com> wrote:
> > >
> > > >         case ${TARGET_ARCH} in
> > > >           aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
> > > > +         arc)        TUPLE=i686-unknown-linux-gnu ;;
> > > >           arm)        TUPLE=arm-unknown-linux-gnueabi ;;
> > > >           armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
> > > >           i586|i686)  TUPLE=i686-pc-linux-gnu ;;
> > >
> > > Is that right?  Just saying, it looks wrong...
> >
> > That's indeed a hack :)
> >
> > libgpg-error [upstream] patch mentioned in this commit
> > adds support of ARC architecture as an alias to "i686-unknown-linux-gnu"
> > (that's because headers are the same).
> >
> > But since I provided generate headers only for arc-xxx-linux-uclibc
> > (and there's no guarantee glibc header matches uclibc) Werner only
> > added support for uClibc.
> >
> > That said if we were building uClibc toolchain in OE then no mapping
> > would be required at all but for Glibc toolchain we still need to
> > use explicit header for ARC and the one that matches our needs is
> > essentially "ock-obj-pub.i686-unknown-linux-gnu.h", see
> > https://lists.gt.net/gnupg/devel/84636#84636
>
> So this is fixed now in libgpg-error upstrema, see
> http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=f4f0da74f526d7e35cedbc2e93454df6440dbfa5
>
> I'll send v3 soonish with that patch back-ported.
>
> -Alexey
