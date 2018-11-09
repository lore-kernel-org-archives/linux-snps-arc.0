From: ldv@altlinux.org (Dmitry V. Levin)
Date: Sat, 10 Nov 2018 00:44:22 +0300
Subject: [PATCH 02/13] elf-em.h: add EM_ARC
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075013A59237C@us01wembx1.internal.synopsys.com>
References: <20181109031536.GB21511@altlinux.org>
 <C2D7FE5348E1B147BCA15975FBA23075013A59237C@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181109214422.GB1907@altlinux.org>
To: linux-snps-arc@lists.infradead.org

On Fri, Nov 09, 2018@04:41:36PM +0000, Vineet Gupta wrote:
> On 11/8/18 7:15 PM, Dmitry V. Levin wrote:
> > The uapi/linux/audit.h header is going to use EM_ARC in order
> > to define AUDIT_ARCH_ARC which is needed to implement
> > syscall_get_arch() which in turn is required to extend
> > the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
> >
> > The value for EM_ARC has been taken from
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__www.sco.com_developers_gabi_2012-2D12-2D31_ch4.eheader.html&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=c14YS-cH-kdhTOW89KozFhBtBJgs1zXscZojEZQ0THs&m=UCr-dDO1BWV4K-CXhpcDRnN4Urr4_UgSKBeEaczUAmE&s=XmSWUKeqq324aU46NSTbHc12dH-1vVnA4G3Rm-01WD4&e=
> >
> > Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
> > ---
> >  include/uapi/linux/elf-em.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
> > index ba3696e3d694..56ff3f9d9633 100644
> > --- a/include/uapi/linux/elf-em.h
> > +++ b/include/uapi/linux/elf-em.h
> > @@ -26,6 +26,7 @@
> >  #define EM_ARM		40	/* ARM 32 bit */
> >  #define EM_SH		42	/* SuperH */
> >  #define EM_SPARCV9	43	/* SPARC v9 64-bit */
> > +#define EM_ARC		45	/* Argonaut RISC Core */
> 
> Please use EM_ARCOMPACT (for original ARC ISA) and EM_ARCV2 - both defined in
> arch/arc/include/asm/elf.h

OK, but we would have to move both EM_ARCOMPACT and EM_ARCV2
to include/uapi/linux/elf-em.h file first, so they could be used
to define AUDIT_ARCH_* constants in include/uapi/linux/audit.h file.


-- 
ldv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20181110/eadacd51/attachment.sig>
