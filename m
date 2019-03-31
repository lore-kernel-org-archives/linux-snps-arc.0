From: st5pub@yandex.ru (Andrey Abramov)
Date: Sun, 31 Mar 2019 10:00:18 +0300
Subject: [PATCH 5/5] Lib: sort.h: replace int size with size_t size in the
 swap function
In-Reply-To: <201903302015.x2UKFnSL003850@sdf.org>
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>,
 <20467491553964233@myt4-c0b480c282c8.qloud-c.yandex.net>,
 <20190330183826.GB21828@kroah.com> <201903302015.x2UKFnSL003850@sdf.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20434561554015618@myt1-cd60b8ae9bb9.qloud-c.yandex.net>
To: linux-snps-arc@lists.infradead.org

30.03.2019, 23:17, "George Spelvin" <lkml at sdf.org>:
> On Sat, 30 Mar 2019 at 19:38:26 +0100 greh k-h wrote;
>> ?On Sat, Mar 30, 2019@07:43:53PM +0300, Andrey Abramov wrote:
>>> ?Replace int type with size_t type of the size argument
>>> ?in the swap function, also affect all its dependencies.
>>
>> ?This says _what_ the patch does, but it gives no clue as to _why_ you
>> ?are doing this. Neither did your 0/5 patch :(
>>
>> ?Why make this change? Nothing afterward depends on it from what I can
>> ?tell, so why is it needed?
>
> It's just a minor cleanup, making things less surprising for future
> programmers. As I wrote in a comment in my patches, using a signed type
> for an object size is definitely a wart; ever since C89 it's expected
> you'd use size_t for the purpose.
>
> The connection is that it's a natural consequence of doing a pass over
> every call site.
>
> You're right it could be dropped from the series harmlessly, but it
> comes from the same work. But it's all of *three* call sites in the kernel
> which are affected. Surely that's not an unreasonable amount of churn
> to clean up a wart?

George Spelvin is absolutely right: "It's just a minor cleanup, making things less surprising for future programmers."

31.03.2019, 00:51, "George Spelvin" <lkml at sdf.org>:
> It was so obvious to me that I didn't question it, but you have a
> good point and I'm sure Andrey can clarify. Thanks for the attention!

I thought that it is obvious enough (argument called "size" should be of type size_t in the 90% of cases).
Should I resend this patch with better explanation "why"?

-- 
With Best Regards,
Andrey Abramov
