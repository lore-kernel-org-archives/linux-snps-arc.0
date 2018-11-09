From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 9 Nov 2018 15:27:13 +0000
Subject: [PATCH 06/13] arc: define syscall_get_arch()
In-Reply-To: <CALCETrUzfOcLYDUW6s1Ra2xduDCQSbscKBw=vApCP2HNmfDmMw@mail.gmail.com>
References: <20181109031605.GF21511@altlinux.org>
 <e729da9ed78b6b62463a27d3012ac63c7b66be08.camel@synopsys.com>
 <CALCETrUzfOcLYDUW6s1Ra2xduDCQSbscKBw=vApCP2HNmfDmMw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <456a69c6e01a6ab5b1af6d459a249388f8b4c1f5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Andy,

On Fri, 2018-11-09@07:17 -0800, Andy Lutomirski wrote:
> On Fri, Nov 9, 2018 at 6:22 AM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
> > Hi Dmitry,
> > 
> > On Fri, 2018-11-09@06:16 +0300, Dmitry V. Levin wrote:
> > > syscall_get_arch() is required to be implemented on all architectures
> > > that use tracehook_report_syscall_entry() in order to extend
> > > the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
> > > 
> > > Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
> > > ---
> > >  arch/arc/include/asm/syscall.h | 6 ++++++
> > >  include/uapi/linux/audit.h     | 1 +
> > >  2 files changed, 7 insertions(+)
> > 
> > [snip]
> > 
> > > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > > index 818ae690ab79..a7149ceb5b98 100644
> > > --- a/include/uapi/linux/audit.h
> > > +++ b/include/uapi/linux/audit.h
> > > @@ -375,6 +375,7 @@ enum {
> > > 
> > >  #define AUDIT_ARCH_AARCH64   (EM_AARCH64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> > >  #define AUDIT_ARCH_ALPHA     (EM_ALPHA|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> > > +#define AUDIT_ARCH_ARC               (EM_ARC)
> > 
> > Similarly here we need to have:
> > ---------------------------->8-----------------------------
> > +#define AUDIT_ARCH_ARC         (EM_ARC|EM_ARCV2)
> > ---------------------------->8-----------------------------
> > 
> 
> Huh?  How does the bitwise or of two ELF machine codes make any sense?

Oops... I didn't read examples of AUDIT_ARCH_ALPHA above :(
Indeed that was stupid.

But what would be a proper fix then?

Something like that?
---------------------------->8-----------------------------
#define AUDIT_ARCH_ARC               (EM_ARC)
#define AUDIT_ARCH_ARCV2             (EM_ARCV2)


static inline int syscall_get_arch(void)
{
#ifdef __ARC700__
       return AUDIT_ARCH_ARC;
#else
       return AUDIT_ARCH_ARCV2;
#endif
}
---------------------------->8-----------------------------

-Alexey
