From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Mon, 24 Jun 2019 09:53:56 +0200
Subject: [uclibc-ng-devel] state of uClibc ARC soft-float support
In-Reply-To: <CY4PR1201MB012024B8104F1540F0DBB10BA1E70@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <8544debf-dfb6-ebb5-a80e-aa9f860949ff@synopsys.com>
 <20190621102538.GZ29045@waldemar-brodkorb.de>
 <CY4PR1201MB012024B8104F1540F0DBB10BA1E70@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190624075356.GC29045@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,
Alexey Brodkin wrote,

> Hi Waldemar,
> 
> > -----Original Message-----
> > From: Waldemar Brodkorb <wbx at uclibc-ng.org>
> > Sent: Friday, June 21, 2019 1:26 PM
> > To: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
> > Cc: devel at uclibc-ng.org; arcml <linux-snps-arc at lists.infradead.org>; Alexey Brodkin
> > <abrodkin at synopsys.com>
> > Subject: Re: [uclibc-ng-devel] state of uClibc ARC soft-float support
> > 
> > Hi Vineet,
> > 
> > I tried to sync the libm tests from glibc to uClibc-ng, but I think
> > I broke it. May be we should revert the commit?
> > 3384c45e66ddf18f235654b67ae34ac7dcb07534
> 
> There seems to be no commit with such hash:
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=3384c45e66ddf18f235654b67ae34ac7dcb07534
> 
> Did you mean something else?

This one:

https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng-test.git/commit/?id=3384c45e66ddf18f235654b67ae34ac7dcb07534

best regards
 Waldemar
