From: luto@amacapital.net (Andy Lutomirski)
Date: Fri, 9 Nov 2018 08:35:21 -0800
Subject: [PATCH 06/13] arc: define syscall_get_arch()
In-Reply-To: <215d66fd9a197b631973c9ff75943b4c1216b899.camel@synopsys.com>
References: <20181109031605.GF21511@altlinux.org>
 <e729da9ed78b6b62463a27d3012ac63c7b66be08.camel@synopsys.com>
 <CALCETrUzfOcLYDUW6s1Ra2xduDCQSbscKBw=vApCP2HNmfDmMw@mail.gmail.com>
 <456a69c6e01a6ab5b1af6d459a249388f8b4c1f5.camel@synopsys.com>
 <C6CF3942-3307-431F-B76C-B550BB48F472@amacapital.net>
 <215d66fd9a197b631973c9ff75943b4c1216b899.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CALCETrXCcBBTzcL_yz3agNhby1huZSn2UGtJ9Soo=8n8_rj1Tg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Nov 9, 2018 at 8:11 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hi Andy,
>
> On Fri, 2018-11-09@07:56 -0800, Andy Lutomirski wrote:
> > > On Nov 9, 2018,@7:27 AM, Alexey Brodkin <alexey.brodkin@synopsys.com> wrote:
> > >
> > > Hi Andy,
> > >
> > > > On Fri, 2018-11-09@07:17 -0800, Andy Lutomirski wrote:
> > > > On Fri, Nov 9, 2018 at 6:22 AM Alexey Brodkin
> > > > <alexey.brodkin@synopsys.com> wrote:
> > > > > Hi Dmitry,
> > > > >
> > > > > > On Fri, 2018-11-09@06:16 +0300, Dmitry V. Levin wrote:
> > > > > > syscall_get_arch() is required to be implemented on all architectures
> > > > > > that use tracehook_report_syscall_entry() in order to extend
> > > > > > the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
> > > > > >
> > > > > > Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
> > > > > > ---
> > > > > > arch/arc/include/asm/syscall.h | 6 ++++++
> > > > > > include/uapi/linux/audit.h     | 1 +
> > > > > > 2 files changed, 7 insertions(+)
> > > > >
> > > > > [snip]
> > > > >
> > > > > > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > > > > > index 818ae690ab79..a7149ceb5b98 100644
> > > > > > --- a/include/uapi/linux/audit.h
> > > > > > +++ b/include/uapi/linux/audit.h
> > > > > > @@ -375,6 +375,7 @@ enum {
> > > > > >
> > > > > > #define AUDIT_ARCH_AARCH64   (EM_AARCH64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> > > > > > #define AUDIT_ARCH_ALPHA     (EM_ALPHA|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> > > > > > +#define AUDIT_ARCH_ARC               (EM_ARC)
> > > > >
> > > > > Similarly here we need to have:
> > > > > ---------------------------->8-----------------------------
> > > > > +#define AUDIT_ARCH_ARC         (EM_ARC|EM_ARCV2)
> > > > > ---------------------------->8-----------------------------
> > > > >
> > > >
> > > > Huh?  How does the bitwise or of two ELF machine codes make any sense?
> > >
> > > Oops... I didn't read examples of AUDIT_ARCH_ALPHA above :(
> > > Indeed that was stupid.
> > >
> > > But what would be a proper fix then?
> > >
> > > Something like that?
> > > ---------------------------->8-----------------------------
> > > #define AUDIT_ARCH_ARC               (EM_ARC)
> > > #define AUDIT_ARCH_ARCV2             (EM_ARCV2)
> > >
> > >
> > > static inline int syscall_get_arch(void)
> > > {
> > > #ifdef __ARC700__
> > >       return AUDIT_ARCH_ARC;
> > > #else
> > >       return AUDIT_ARCH_ARCV2;
> > > #endif
> > > }
> > > ---------------------------->8-----------------------------
> > >
> >
> > Maybe, but I know basically nothing about ARC.  Is the syscall numbering or calling convention different on ARC vs ARCv2?
>
> Syscall numbering should be the same as we use UAPI for both ARCompact (AKA ARCv1)
> and ARCv2. As for calling convention I think it indeed differs.
>
> Note ARCompact and ARCv2 ISAs are binary incompatible!
>
> Even though assembly look pretty much the same (sans instructions
> available only for either ARCompact or ARCv2) encodings are different so
> in that sense these are completely different architectures.
>
> Also I'm wondering what could be other cases for use of syscall_get_arch().

The intent of syscall_get_arch() is that the tuple:

(arch, nr, arg1, ..., arg6)

fully identifies a system call and its arguments.  So it sounds like
we do indeed need to arch values.

>
> So I'd say it's better to report different values for ARC ISAs.
> And given we use the same values as in Binutils IMHO it would be good
> to not mix IDs here.
>
> -Alexey



-- 
Andy Lutomirski
AMA Capital Management, LLC
