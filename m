From: sudipm.mukherjee@gmail.com (Sudip Mukherjee)
Date: Thu, 23 Nov 2017 23:01:37 +0000
Subject: [PATCH] frv: fix build failure
In-Reply-To: <1511457437.32422.6.camel@synopsys.com>
References: <1511302233-5008-1-git-send-email-sudipm.mukherjee@gmail.com>
 <1511457437.32422.6.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171123230137.GA4525@sudip-laptop>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

On Thu, Nov 23, 2017@05:17:19PM +0000, Alexey Brodkin wrote:
> Hi Sudip,
> 
> On Tue, 2017-11-21@22:10 +0000, Sudip Mukherjee wrote:
> > The frv defconfig build is failing with the error:
> > lib/mpi/mpih-div.o: In function `mpihelp_divrem':
> > mpih-div.c:(.text+0x30c): undefined reference to `abort'
> > 
> > The function 'abort' was never defined for the frv architecture.
> > Create 'abort' as is done in other arch like 'arm' and 'unicore32'.
> > 
> > Signed-off-by: Sudip Mukherjee <sudipm.mukherjee at gmail.com>
> > ---
> 
> I'm seeing the same issue building for ARC from today's Linus' tree.
> Maybe it worth implementing abort() as a weak function for every arch/platform
> that doesn't have it explicitly defined? Otherwise we'll end-up with
> useless code duplication.

Do you mean define it for every arch or define it in a common place so
that all arch can use it?

I did a quick try with the attached patch on two different arch, one of
them (m32r) has the 'abort' defined and the other (frv) was failing due
to lack of abort, and they both built without any warnings or errors.
But I am not sure if 'kernel/exit.c' is the right place for it.
Any suggestion?

--
Regards
Sudip
-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch
Type: text/x-diff
Size: 242 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20171123/53be03c2/attachment.bin>
