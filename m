From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 31 Jan 2019 17:57:20 -0800
Subject: Need for arch pthread-offsets.h (was Re: [PATCH v2 05/15] ARC:
 Atomics and Locking primitives)
In-Reply-To: <b7766cd4-3055-3e3b-f49b-fe870fee2740@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <1548811555-24373-6-git-send-email-vgupta@synopsys.com>
 <mvmpnse8s6s.fsf@suse.de> <b7766cd4-3055-3e3b-f49b-fe870fee2740@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8e025bb4-d86d-ba54-f937-3ae73870a71f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/30/19 9:40 AM, Vineet Gupta wrote:
> On 1/30/19 12:28 AM, Andreas Schwab wrote:
>> On Jan 29 2019, Vineet Gupta <vineet.gupta1@synopsys.com> wrote:
>>
>>> +#define __PTHREAD_MUTEX_NUSERS_AFTER_KIND  1
>>> +#define __PTHREAD_MUTEX_USE_UNION          1
>> New ports should use the preferred values for these macros.
> 
> OK, changed to 0 and 0 per commit 06be6368da16104 ("nptl: Define
> __PTHREAD_MUTEX_{NUSERS_AFTER_KIND,USE_UNION}")

So this required a bunch of tricking changes to _SIZEOF_PTHREAD_*.

However what was not obvious is adjustment to
sysdeps/<arch>/nptl/pthread-offsets.h to __PTHREAD_MUTEX_*_OFFSET. But these don't
seem to be *actually* used anywhere. Sure there are assert checks in
pthread_mutext_init.c but what's the point: the struct is generic anyways. IOW I'm
not sure what port specific errors/inconsistency they are catching, other than the
fact that they need to be hand calculating when starting a new port.

Am I missing something ?
