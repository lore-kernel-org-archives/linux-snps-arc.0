From: carlos@redhat.com (Carlos O'Donell)
Date: Wed, 23 Jan 2019 12:24:41 -0500
Subject: misc/check-installed-headers-c failing due to upstream kernel
 change
In-Reply-To: <a8c5c359-c515-ec77-7498-4a86046bc0e1@synopsys.com>
References: <4db851ae-9bb2-2159-96bf-c4b34b505bd9@synopsys.com>
 <1548259069.3229.308.camel@codethink.co.uk>
 <26167c76-7d83-40e9-49d3-1c38b6ae3f8a@redhat.com>
 <a8c5c359-c515-ec77-7498-4a86046bc0e1@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <00b639e3-c96f-d75e-ed49-3c6ebe274228@redhat.com>
To: linux-snps-arc@lists.infradead.org

On 1/23/19 12:13 PM, Vineet Gupta wrote:
> On 1/23/19 8:51 AM, Carlos O'Donell wrote:
>> On 1/23/19 10:57 AM, Ben Hutchings wrote:
>>> On Mon, 2019-01-21@14:56 -0800, Vineet Gupta wrote:
>>>> Hi,
>>>>
>>>> It seems a recent upstream kernel change (went in 5.0-rcX) 81c9d43f9487
>>>> ("kernel/sysctl: add panic_print into sysctl") trips one of the glibc tests.
>>>>
>>>> 	FAIL: misc/check-installed-headers-c
>>>>
>>>>> :: sys/sysctl.h
>>>>> ::::
>>>>> *** Obsolete types detected:
>>>>> ~/install/compilers/arc-linux-gnu/sysroot/usr/include/linux /sysctl.h:
>>>>> KERN_PANIC_PRINT=78, /* ulong: bitmask to print system info on panic */
>>>>
>>>> It doesn't seem to like ulong (inside a comment). I don't have enough foo to fix
>>>> it, but wanted to bring it to notice anyways.
>>>
>>> This additions looks like a mistake, anyway - Linux's binary sysctl
>>> interface is only there for ancient compatibility and no new sysctls
>>> should be added to this enumeration.
>>
>> Just to be clear, this glibc test failure is a false positive [1], and
>> we're working to correct this [2]. However, if this is also not needed on
>> the kernel side, then that's also OK with us :-)
>>
> 
> [1] https://www.sourceware.org/ml/libc-alpha/2019-01/msg00413.html
> [2] https://www.sourceware.org/ml/libc-alpha/2019-01/msg00513.html
> 
> Great, I didn't skim thru the mailing list before posting this. So this is already
> known and being worked on !
> 
> Does it make sense to add the minimal fix for 2.29 ? It is likely in near future,
> people using the released glibc with newer kernel will run into this, unless
> kernel folks zap this quickly, within the current release.

I don't think there is any rush. Review [2] and give Zack any feedback
on correctness? We commit to master, and backport to the release branch
for 2.29 when ready. Developers should be using the release branches.
Distributions already use the release branches to get continued security
fixes and bug fixes.

-- 
Cheers,
Carlos.
