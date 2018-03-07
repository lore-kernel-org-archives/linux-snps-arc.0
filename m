From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Wed, 7 Mar 2018 21:10:56 +0100
Subject: uClibc-ng testsuite failures
In-Reply-To: <1520350866.5110.16.camel@synopsys.com>
References: <20180226005009.GR12535@waldemar-brodkorb.de>
 <1519647108.3740.8.camel@synopsys.com>
 <20180226195907.GU12535@waldemar-brodkorb.de>
 <4aa73094-21c0-99a4-6d00-76d8c63c16c7@synopsys.com>
 <20180226205038.GV12535@waldemar-brodkorb.de>
 <1520350866.5110.16.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180307201056.GB2114@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,
Alexey Brodkin wrote,

> Hi Waldemar,
> 
> On Mon, 2018-02-26@21:50 +0100, Waldemar Brodkorb wrote:
> > Hi Vineet,
> > Vineet Gupta wrote,
> > 
> > > On 02/26/2018 11:59 AM, Waldemar Brodkorb wrote:
> > > > > > The syscall cancellation failures are still there with gcc 7.3.0 and
> > > > > > binutils 2.30. Do you have any patches on top of it?
> > > > > 
> > > > > Are you talking about these results?
> > > > > https://urldefense.proofpoint.com/v2/url?u=https-3A__downloads.uclibc-2Dng.org_reports_1.0.28_REPORT.arcv2.libc.uClibc-2Dng-2D1.0.28&d=DwIBaQ&
> > > > > c=DPL6_X_6JkXFx7AXWqB0tg&r=7FgpX6o3vAhwMrMhLh-4ZJey5kjdNUwOL2CWsFwR4T8&m=TsxZS2Izf4LUrQfQCh9Iw8-L0zYXeJLdRhvUfyiWw2A&s=BGT84AxTG_-
> > > > > ymRw4CytOO7g6kTy7PXKYBrHbGF_pTR4&e=
> > > > 
> > > > No.
> > > > > But the link above points to stuff built with gcc 7.2 but not 7.3.
> > > > > Could you please share your results with gcc 7.2 and binutils 2.30?
> > > > 
> > > > Here with gcc 7.3.0 and binutils 2.30:
> > > > https://urldefense.proofpoint.com/v2/url?u=https-3A__downloads.uclibc-2Dng.org_reports_git_&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=7FgpX6o3vAhwMrMh
> > > > Lh-4ZJey5kjdNUwOL2CWsFwR4T8&m=TsxZS2Izf4LUrQfQCh9Iw8-L0zYXeJLdRhvUfyiWw2A&s=Ni7_rqZq4c0mvnYsOyvZoZEIddMnIOEsSmopG9m9LwU&e=
> > > 
> > > I ran into similar issues with glibc test suite. It seems gcc 7.x released
> > > won't cut it - it misses tons of upstream patches including
> > > 
> > > 2017-11-03 e892f4fac605 [ARC] Fix to unwinding.
> > > 
> > > So your best bet is to use upstream gcc master !
> > 
> > gcc 7 branch or gcc 8 latest greatest?
> > 
> > Last time there was some issue with gcc8 and you told me to use gcc7
> > with some patches.
> > 
> > /me is confused.
> 
> 
> Could you please elaborate a bit on how do you build ARC toolchain?
> That way we'll try to reproduce your problem locally.
> 
> Also may I ask you to try the very latest GCC and Binutils from 
> 
> GCC: https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/tree/dev
> Binutils: https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/tree/arc-2018.03
> 
> With these sources I can build everything successfully and run entire test-suite
> with that following results:
> -------------->8------------
> Total skipped: 15
> Total failed: 19
> Total passed: 397
> -------------->8------------

Yes, that are the results I get when using the synopsys sources.
My idea is to forecast the results with upstream binutils and gcc in
the hope everything will be fine when gcc8 and binutils 2.31 is
released.

Here is the full log using binutils/gcc git master:
https://debug.openadk.org/arc/arc-gcc-git-make.log

best regards
 Waldemar
