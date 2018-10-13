From: dancol@google.com (Daniel Colascione)
Date: Fri, 12 Oct 2018 18:54:33 -0700
Subject: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
In-Reply-To: <20181013014429.GB207108@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
 <20181012125046.GA170912@joelaf.mtv.corp.google.com>
 <20181012.111836.1569129998592378186.davem@davemloft.net>
 <20181013013540.GA207108@joelaf.mtv.corp.google.com>
 <CAKOZueuNvWvn18vffJWpbpg7h-uScT8gXrrudTB2pnT4M2HJ_w@mail.gmail.com>
 <20181013014429.GB207108@joelaf.mtv.corp.google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAKOZues25aaKz3_AiyfJ=r2QBd5MghgY3ky_ptg4Z8=ST4DCgw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

I wonder whether it makes sense to expose to userspace somehow whether
mremap is "fast" for a particular architecture. If a feature relies on
fast mremap, it might be better for some userland component to disable
that feature entirely rather than blindly use mremap and end up
performing very poorly. If we're disabling fast mremap when THP is
enabled, the userland component can't just rely on an architecture
switch and some kind of runtime feature detection becomes even more
important.

On Fri, Oct 12, 2018@6:44 PM, Joel Fernandes <joel@joelfernandes.org> wrote:
> On Fri, Oct 12, 2018@06:39:45PM -0700, Daniel Colascione wrote:
>> Not 32-bit ARM?
>
> Well, I didn't want to enable every possible architecture we could in a
> single go. Certainly arm32 can be a follow on enablement as can be other
> architectures. The point of this series is to upstream this feature and
> enable a hand-picked few architectures as a first step.
>
> thanks,
>
>  - Joel
>
