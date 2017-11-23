From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 23 Nov 2017 17:17:19 +0000
Subject: [PATCH] frv: fix build failure
In-Reply-To: <1511302233-5008-1-git-send-email-sudipm.mukherjee@gmail.com>
References: <1511302233-5008-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1511457437.32422.6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Sudip,

On Tue, 2017-11-21@22:10 +0000, Sudip Mukherjee wrote:
> The frv defconfig build is failing with the error:
> lib/mpi/mpih-div.o: In function `mpihelp_divrem':
> mpih-div.c:(.text+0x30c): undefined reference to `abort'
> 
> The function 'abort' was never defined for the frv architecture.
> Create 'abort' as is done in other arch like 'arm' and 'unicore32'.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee at gmail.com>
> ---

I'm seeing the same issue building for ARC from today's Linus' tree.
Maybe it worth implementing abort() as a weak function for every arch/platform
that doesn't have it explicitly defined? Otherwise we'll end-up with
useless code duplication.

-Alexey
