From: Claudiu.Zissulescu@synopsys.com (Claudiu Zissulescu)
Date: Mon, 29 Jan 2018 14:03:39 +0000
Subject: [LEDE-DEV] [PATCH] archs38: bump kernel to 4.14.
In-Reply-To: <1517233067.3210.2.camel@synopsys.com>
References: <20180123164848.33426-1-Evgeniy.Didin@synopsys.com>
 <826f0003-fb27-56a7-22c5-e41f12ff79a2@hauke-m.de>
 <1517233067.3210.2.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <098ECE41A0A6114BB2A07F1EC238DE89667BDF3C@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

The compiler generates calls to special functions (like the one in question _multi3) if it doesn?t have a way how to solve it (via compiler backend rules). This function is implemented by the libgcc which will have a default method to address the functionality in question.
Now, from the link which you gave me, I understand users are not very happy with the _multi3 implementation (128 bit multiplication) in MIPS cores, therefore, they come up with an patched implementation. In ARC backend we try to address these issues, but if there is a problem, I will be happy to fix it.
Anyhow, if you see any issue with code gen (improvements/bugs), I would recommend you to send it over and I will spend some time in fixing them directly in the compiler.

Cheers,
Claudiu

> -----Original Message-----
> From: Alexey Brodkin
> Sent: Monday, January 29, 2018 2:38 PM
> To: Claudiu Zissulescu <claziss at synopsys.com>
> Cc: john at phrozen.org; lede-dev at lists.infradead.org; hauke at hauke-m.de;
> Evgeniy.Didin at synopsys.com; linux-snps-arc at lists.infradead.org
> Subject: Re: [LEDE-DEV] [PATCH] archs38: bump kernel to 4.14.
> 
> Hi Claudiu,
> 
> Could you please comment on the question from Hauke below?
> 
> On Sat, 2018-01-27@16:36 +0100, Hauke Mehrtens wrote:
> > Does the arc CPU also need some special handling like some MIPS CPUs:
> >
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?i
> d=bbc25bee37d2b32cf3a1fab9195b6da3a185614a
> 
> -Alexey
