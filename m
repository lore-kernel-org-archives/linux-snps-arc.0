From: fweimer@redhat.com (Florian Weimer)
Date: Thu, 18 Apr 2019 14:07:47 +0200
Subject: [PATCH] posix/tst-getaddrinfo4: Consider EAI_NODATA as an
 expected result
In-Reply-To: <20180730104036.4016-1-abrodkin@synopsys.com> (Alexey Brodkin's
 message of "Mon, 30 Jul 2018 13:40:36 +0300")
References: <20180730104036.4016-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87v9zbwm7g.fsf@oldenburg2.str.redhat.com>
To: linux-snps-arc@lists.infradead.org

* Alexey Brodkin:

> Some proxy DNS servers might not resolve IPv6 names to addresses.
> Instead they reply with NOERROR while passing no real data.
> That combination of NOERROR and EAI_NODATA happen because the DNS
> server has a recored for requested name (example.net in our case)
> but that record is not of AAAA type which was requested.

I think this invalidates the test to a large degree.  I don't think this
is a valid test environment.  You need to fix it.

Thanks,
Florian
