From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 18 Apr 2019 16:58:38 +0000
Subject: [PATCH] posix/tst-getaddrinfo4: Consider EAI_NODATA as an
 expected result
In-Reply-To: <87v9zbwm7g.fsf@oldenburg2.str.redhat.com>
References: <20180730104036.4016-1-abrodkin@synopsys.com>
 <87v9zbwm7g.fsf@oldenburg2.str.redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120AD255C752DD810E73A9FA1260@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Florian,

> -----Original Message-----
> From: Florian Weimer <fweimer at redhat.com>
> Sent: Thursday, April 18, 2019 3:08 PM
> To: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: libc-alpha at sourceware.org; linux-snps-arc at lists.infradead.org
> Subject: Re: [PATCH] posix/tst-getaddrinfo4: Consider EAI_NODATA as an expected result
> 
> * Alexey Brodkin:
> 
> > Some proxy DNS servers might not resolve IPv6 names to addresses.
> > Instead they reply with NOERROR while passing no real data.
> > That combination of NOERROR and EAI_NODATA happen because the DNS
> > server has a recored for requested name (example.net in our case)
> > but that record is not of AAAA type which was requested.
> 
> I think this invalidates the test to a large degree.  I don't think this
> is a valid test environment.  You need to fix it.

I think more interesting would be to figure out if behavior that I see
is valid or not and then decide which test is representative.

>From my Googling I didn't find any data confirming that observed
behavior is incorrect, otherwise I would have asked our IT team to fix it.

Do you have a solid understanding that NOERROR && EIA_NODATA is not
valid combination?

-Alexey
