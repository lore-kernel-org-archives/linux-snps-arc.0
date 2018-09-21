From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 21 Sep 2018 11:31:32 +0000
Subject: [OE-core] [PATCH v2 5/9] libgpg-error: Add ARC support
In-Reply-To: <CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
 <20180920204232.10583-6-abrodkin@synopsys.com>
 <CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9bb4d4d54024982cb3a0b02222a45e12845cba85.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Ross,

On Fri, 2018-09-21@11:43 +0100, Burton, Ross wrote:
> On Thu, 20 Sep 2018 at 21:44, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
> 
> >         case ${TARGET_ARCH} in
> >           aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
> > +         arc)        TUPLE=i686-unknown-linux-gnu ;;
> >           arm)        TUPLE=arm-unknown-linux-gnueabi ;;
> >           armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
> >           i586|i686)  TUPLE=i686-pc-linux-gnu ;;
> 
> Is that right?  Just saying, it looks wrong...

That's indeed a hack :)

libgpg-error [upstream] patch mentioned in this commit
adds support of ARC architecture as an alias to "i686-unknown-linux-gnu"
(that's because headers are the same).

But since I provided generate headers only for arc-xxx-linux-uclibc
(and there's no guarantee glibc header matches uclibc) Werner only
added support for uClibc.

That said if we were building uClibc toolchain in OE then no mapping
would be required at all but for Glibc toolchain we still need to
use explicit header for ARC and the one that matches our needs is
essentially "ock-obj-pub.i686-unknown-linux-gnu.h", see
https://lists.gt.net/gnupg/devel/84636#84636

-Alexey
