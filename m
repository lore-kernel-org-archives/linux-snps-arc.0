From: Claudiu.Zissulescu@synopsys.com (Claudiu Zissulescu)
Date: Thu, 8 Mar 2018 10:28:11 +0000
Subject: uClibc-ng testsuite failures
In-Reply-To: <20180307201056.GB2114@waldemar-brodkorb.de>
References: <20180226005009.GR12535@waldemar-brodkorb.de>
 <1519647108.3740.8.camel@synopsys.com>
 <20180226195907.GU12535@waldemar-brodkorb.de>
 <4aa73094-21c0-99a4-6d00-76d8c63c16c7@synopsys.com>
 <20180226205038.GV12535@waldemar-brodkorb.de>
 <1520350866.5110.16.camel@synopsys.com>,
 <20180307201056.GB2114@waldemar-brodkorb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <098ECE41A0A6114BB2A07F1EC238DE89667E9A24@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Waldemar,

The GCC master branch can be broken from time to time, and this is the reason why we get a snapshot in our Synopsys git account for testing and stability. But once we get the gcc 8.x release, this shouldn't be the case, and you can use the official release with maybe some 1-2 extra patches on top. 
As for Binutils mainline master version, we discovered a number of issues which needs to be addressed on our side. The good news is we have patches which we are testing them right now, and I expect those patches to be quickly send to binutils mailing list and integrated once we have the confidence we brake nothing extra:)

Cheers,
Claudiu
________________________________________
From: Waldemar Brodkorb [wbx@uclibc-ng.org]
Sent: Wednesday, March 07, 2018 9:10 PM
To: Alexey Brodkin
Cc: wbx at uclibc-ng.org; Claudiu.Zissulescu at synopsys.com; Vineet.Gupta1 at synopsys.com; Cupertino.Miranda at synopsys.com; linux-snps-arc at lists.infradead.org
Subject: Re: uClibc-ng testsuite failures

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
> GCC: https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_foss-2Dfor-2Dsynopsys-2Ddwc-2Darc-2Dprocessors_gcc_tree_dev&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=vsTQvy464niXQOCG9XdhJKeuxCBV79v90MX02K5iS8c&m=_qQm4vhacQM7bpvyZpeTGtLVQgNJjGuNoIu2MvUPZtk&s=newu1wiEsGLnIQEDEu46XlHB6VWi0brY-2QsKEOKQB0&e=
> Binutils: https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_foss-2Dfor-2Dsynopsys-2Ddwc-2Darc-2Dprocessors_binutils-2Dgdb_tree_arc-2D2018.03&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=vsTQvy464niXQOCG9XdhJKeuxCBV79v90MX02K5iS8c&m=_qQm4vhacQM7bpvyZpeTGtLVQgNJjGuNoIu2MvUPZtk&s=k_NRmaNGVWc_ZubuKXGnT6r7r6EpntzQKDPFKbvH9hk&e=
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
https://urldefense.proofpoint.com/v2/url?u=https-3A__debug.openadk.org_arc_arc-2Dgcc-2Dgit-2Dmake.log&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=vsTQvy464niXQOCG9XdhJKeuxCBV79v90MX02K5iS8c&m=_qQm4vhacQM7bpvyZpeTGtLVQgNJjGuNoIu2MvUPZtk&s=uwHpsnYFIE23M9pCrxMIBu0QjlYriNeX6J54uYQWk7g&e=

best regards
 Waldemar
