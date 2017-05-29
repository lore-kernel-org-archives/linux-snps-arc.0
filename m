From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 29 May 2017 13:21:54 +0200
Subject: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
In-Reply-To: <20170529105509.GC2192@mai>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
 <CAK8P3a3QACHYqtCO1z_FpW0nXEtx356wCDha_=SNXU872=q1UQ@mail.gmail.com>
 <20170529084809.GA2192@mai>
 <CAK8P3a1Kv_RhKL43ie6co_N5pDXvRHd7Uq8g70qt80WkxuhzLw@mail.gmail.com>
 <20170529105509.GC2192@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK8P3a3MdvWMJyVqE63Ur330mC2wPZO7nFXjd_LukbTjiZtGdg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, May 29, 2017 at 12:55 PM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On Mon, May 29, 2017@11:57:25AM +0200, Arnd Bergmann wrote:
>> On Mon, May 29, 2017 at 10:48 AM, Daniel Lezcano
>> <daniel.lezcano@linaro.org> wrote:
>> Things that could go wrong include:
>>
>> - A platform maintainer wants to add a new platform and has a for-next
>>   branch that gets merged into linux-next, with parts of it going through
>>   different maintainers, and now they have to choose between a branch
>>   that doesn't build without the timer branch, or one that break for-next
>>   unless Stephen applies a fixup
>>
>> - Some architecture maintainer didn't get the memo and adds an instance of
>>   CLOCKSOUCE_OF_DECLARE in architecture specific code without asking
>>   having the patch reviewed first
>>
>> - A platform has a branch with complex cross-tree dependencies and
>>   it need to get merged in an unconventional way.
>>
>> - You make a mistake and accidentally merge one driver for an unusual
>>   architecture that escapes your test matrix.
>>
>> While those all are unlikely to happen in a particular merge window, they do
>> happen occasionally and tend to cause a lot of pain.
>
> Hmm, that sounds scary :)
>
> There is no guarantee, when removing the alias, none of the above happens,
> right?

No, it's just both less likely and easier to work around.

> If the timer branch is in linux-next, that could be caugth before any of the
> above happens, no?

linux-next will find most of these problems, but it will still be more work
for the people that run into build failures when testing linux-next.

     Arnd
