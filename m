From: jhogan@kernel.org (James Hogan)
Date: Wed, 11 Apr 2018 10:54:00 +0100
Subject: [PATCH] bug.h: Work around GCC PR82365 in BUG()
In-Reply-To: <CAK8P3a0-_u7_FCj-nH0izBv4ub6krm1uA32bwi2jtBzXJePcnQ@mail.gmail.com>
References: <20171219114112.939391-1-arnd@arndb.de>
 <20180410224805.GA21429@saruman>
 <CAK8P3a0-_u7_FCj-nH0izBv4ub6krm1uA32bwi2jtBzXJePcnQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180411095359.GB21429@saruman>
To: linux-snps-arc@lists.infradead.org

On Wed, Apr 11, 2018@09:30:56AM +0200, Arnd Bergmann wrote:
> On Wed, Apr 11, 2018@12:48 AM, James Hogan <jhogan@kernel.org> wrote:
> > Before I forward port those patches to add .insn for MIPS, is that sort
> > of approach (an arch specific asm/compiler-gcc.h to allow MIPS to
> > override barrier_before_unreachable()) an acceptable fix?
> 
> That sounds fine to me. However, I would suggest making that
> asm/compiler.h instead of asm/compiler-gcc.h, so we can also
> use the same file to include workarounds for clang if needed.

Yes, though there are a few asm/compiler.h's already, and the alpha one
includes linux/compiler.h before undefining inline, so seems to have its
own specific purpose...

Cheers
James
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180411/7dd6d2d9/attachment.sig>
