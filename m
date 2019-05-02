From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 2 May 2019 09:55:26 -0700
Subject: Detecting libc in perf (was Re: perf tools build broken after
 v5.1-rc1)
In-Reply-To: <20190501031215.GZ23599@brightrain.aerifal.cx>
References: <eeb83498-f37f-e234-4941-2731b81dc78c@synopsys.com>
 <20190422152027.GB11750@kernel.org> <20190425214800.GC21829@kernel.org>
 <C2D7FE5348E1B147BCA15975FBA2307501A2505837@us01wembx1.internal.synopsys.com>
 <20190430011818.GE7857@kernel.org>
 <C2D7FE5348E1B147BCA15975FBA2307501A250601B@us01wembx1.internal.synopsys.com>
 <20190430170404.GX23599@brightrain.aerifal.cx>
 <17a86bc7-c1f9-8c3c-8f1d-711e95dac49d@synopsys.com>
 <20190501031215.GZ23599@brightrain.aerifal.cx>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <596d2166-1952-a392-ef05-d3f59abf9fd0@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/30/19 8:12 PM, Rich Felker wrote:
>>> What are you trying to achieve? I was just CC'd and I'm missing the
>>> context.
>>
>> Sorry I added you as a subject matter expert but didn't provide enough context.
>>
>> The original issue [1] was perf failing to build on ARC due to perf tools needing
>> a copy of unistd.h but this thread [2] was a small side issue of auto-detecting
>> libc variaint in perf tools where despite uClibc tools, glibc is declared to be
>> detected, due to uClibc's historical hack of defining __GLIBC__. So __GLIBC__ is
>> not sufficient (and probably not the right interface to begin wtih) to ensure glibc.
>>
>> [1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-April/005676.html
>> [2] http://lists.infradead.org/pipermail/linux-snps-arc/2019-April/005684.html
> 
> I think you misunderstood -- 

:-)

> I'm asking what you're trying to achieve
> by detecting whether the libc is glibc, rather than whether it has
> some particular interface you want to conditionally use. This is a
> major smell and is usually something wrong that shouldn't be done.

Good question indeed. Back in 2015 I initially ran into some quirks due to subtle
libc differences.  At the time perf has a fwd ref for strlcpy which exactly
matched glibc but not uClibc.  see commit  a83d869f300bf91 "(perf tools: Elide
strlcpy warning with uclibc)" or 0215d59b154 "(tools lib: Reinstate strlcpy()
header guard with __UCLIBC__)"

But this still used the libc defined symbol __UCLIBC__ or __GLIBC__

Your question however pertains to perf glibc feature check where perf generates an
alternate symbol HAVE_GLIBC_SUPPORT.

This is dubious as first of all it detects glibc even for uClibc builds.

Even of we were to improve it, there seems to be no users of this symbol.

$git grep HAVE_GLIBC_SUPPORT
perf/Makefile.config:  CFLAGS += -DHAVE_GLIBC_SUPPORT
perf/builtin-version.c: STATUS(HAVE_GLIBC_SUPPORT, glibc)

So I'd propose to remove it !
