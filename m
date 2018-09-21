From: ross.burton@intel.com (Burton, Ross)
Date: Fri, 21 Sep 2018 14:20:25 +0100
Subject: [OE-core] [PATCH v2 5/9] libgpg-error: Add ARC support
In-Reply-To: <27a89d5d978dbe51cd05d7c68c067d46dcdde71e.camel@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
 <20180920204232.10583-6-abrodkin@synopsys.com>
 <CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
 <9bb4d4d54024982cb3a0b02222a45e12845cba85.camel@synopsys.com>
 <bb6c7d725f34a4bb5b08164268db7a2863aa1cf3.camel@synopsys.com>
 <CAJTo0La_MuDqcdy4brMRkiprQzAnAwo1omdGzz_=kDjgc1Hsvg@mail.gmail.com>
 <27a89d5d978dbe51cd05d7c68c067d46dcdde71e.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAJTo0Lak_--ZguDpPhdD_jMcwaoOVejfTqkNqYAjB+FwG_O1JA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Yes, that fixes it.

Ross
On Fri, 21 Sep 2018 at 14:08, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Ross,
>
> On Fri, 2018-09-21@13:53 +0100, Burton, Ross wrote:
> > Can you check that v3 works with x86-64 targets?
> >
> > ERROR: libgpg-error-1.32-r0 do_compile: Function failed: do_compile
> > (log file is located at
> > /data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345)
> > ERROR: Logfile of failure stored in:
> > /data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345
> > Log data follows:
> > > DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> >
> > 'bit-64', 'x86_64-linux', 'common']
> > > DEBUG: Executing shell function do_compile
> > > cp: cannot stat
> >
> > '/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/libgpg-error-1.32/src/syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h':
> > No such file or directory
> > > WARNING: exit code 1 from a shell command.
> > > ERROR: Function failed: do_compile (log file is located at
> >
> > /data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345)
>
> Yeah that's pretty unfortunate that "simple addition of ARC"
> broke anther arch :(
>
> What happened is in the same one commit that adds ARC quite a few
> headers for other arches get renamed, see:
> http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=48c8f8ddfc80551db7615e1eb3555c1dc3f6a657
>
> And "lock-obj-pub.x86_64-pc-linux-gnu.h" is one of them.
> So I'll update libgpg-error_1.32.bb with:
> -------------------------->8-----------------------
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> @@ -44,7 +44,7 @@ do_compile_prepend() {
>           mips64*)    TUPLE=mips64el-unknown-linux-gnuabi64 ;;
>           mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
>           mips*)      TUPLE=mips-unknown-linux-gnu ;;
> -         x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
> +         x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
>           *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
>         esac
> -------------------------->8-----------------------
>
> Care to try that change in your setup once you have eveything else built for x86_64?
>
> -Alexey
