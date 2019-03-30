From: lkml@sdf.org (George Spelvin)
Date: Sat, 30 Mar 2019 21:49:17 GMT
Subject: [PATCH 5/5] Lib: sort.h: replace int size with size_t size in the
 swap function
In-Reply-To: <20190330202418.GB27435@kroah.com>
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>,
 <20467491553964233@myt4-c0b480c282c8.qloud-c.yandex.net>,
 <20190330183826.GB21828@kroah.com>,
 <201903302015.x2UKFnSL003850@sdf.org>,
 <20190330202418.GB27435@kroah.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201903302149.x2ULnHN8017274@sdf.org>
To: linux-snps-arc@lists.infradead.org

On Sat, 30 Mar 2019@21:24:18 +0100, Greg KH wrote:
> On Sat, Mar 30, 2019@08:15:49PM +0000, George Spelvin wrote:
>> On Sat, 30 Mar 2019 at 19:38:26 +0100 Greh KH wrote;
>> > On Sat, Mar 30, 2019@07:43:53PM +0300, Andrey Abramov wrote:
>>>> Replace int type with size_t type of the size argument
>>>> in the swap function, also affect all its dependencies.
>>>
>>> This says _what_ the patch does, but it gives no clue as to _why_ you
>>> are doing this.  Neither did your 0/5 patch :(
>>>
>>> Why make this change?  Nothing afterward depends on it from what I can
>>> tell, so why is it needed?
>>
>> It's just a minor cleanup, making things less surprising for future
>> programmers.  As I wrote in a comment in my patches, using a signed type
>> for an object size is definitely a wart; ever since C89 it's expected
>> you'd use size_t for the purpose.
>
> You did not say that in this commit log :)

Just to clarify: Not My Patch.  I approve, but it's Andrey's patch.

Your point is taken that the commit message needs to be improved
to explain why.  I just answered because it wasn't clear how much
of your question was rhetorical.

> If you think it is a wart, wonderful, yes, let's fix it up.  But again,
> a changelog comment should explain _why_ a commit is needed, not _what_
> it does, as we can see from the diff itself exactly what the commit
> does.

It was so obvious to me that I didn't question it, but you have a
good point and I'm sure Andrey can clarify.  Thanks for the attention!
