From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 12 Jun 2017 11:54:51 +0200
Subject: [PATCH 00/35] defconfig: Cleanup from old entries
In-Reply-To: <20170610164351.7sxzvj4ojj3fbc7h@kozik-lap>
References: <20170608160836.12196-1-krzk@kernel.org>
 <CAK8P3a3bUeC3H2oNfdBedVY4UTCe8OgKbWmv46d5xfu8tC7tAg@mail.gmail.com>
 <20170610164351.7sxzvj4ojj3fbc7h@kozik-lap>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK8P3a3YN+5aJdqxwnpZaVpuucsmQUE3BuEpAf+q7uPXa1dgZw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Sat, Jun 10, 2017@6:43 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Jun 09, 2017@09:59:48PM +0200, Arnd Bergmann wrote:
>> On Thu, Jun 8, 2017@6:08 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> > Hi,
>> >
>> > While cleaning Samsung ARM defconfigs with savedefconfig, I encountered
>> > similar obsolete entries in other files.
>> >
>> > Except the ARM, no dependencies.
>> > For ARM, the rest of patches depend on the first change (otherwise
>> > it might not apply cleanly).
>>
>> Great work!
>>
>> I looked at all the ARM patches, and everything looks good to me (the
>> changlog linewrapping may be suboptimal for readability in some cases,
>> if I had to say anything negative ;-) ).
>>
>> Please add my Acked-by to the ARM patches and send a pull request.
>
> Thanks, I'll send you ARM part in pull request.

Ok

> As for the rest, I think respective arch/platform maintainers should
> take it.

I suspect most will apply the patches, but some architectures maintainers
are not very active. If you are motivated, you could resend the ones
that missed out to Andrew Morton, or you just leave the architectures
to bitrot more. ;-)

     Arnd
