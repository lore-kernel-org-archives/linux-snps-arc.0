From: rep.dot.nop@gmail.com (Bernhard Reutner-Fischer)
Date: Fri, 29 Jul 2016 00:04:46 +0200
Subject: [PATCH 0/2] ARC Moving to @pcl relocations
In-Reply-To: <16492d6d-b4d4-39af-18dd-15f78c1abeff@synopsys.com>
References: <cover.1469729044.git.andrew.burgess@embecosm.com>
 <16492d6d-b4d4-39af-18dd-15f78c1abeff@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <A3C16EF4-41C6-4E69-B8E7-6B2DEC457064@gmail.com>
To: linux-snps-arc@lists.infradead.org

On July 28, 2016 8:50:41 PM GMT+02:00, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>Hi Andrew,
>
>On 07/28/2016 11:20 AM, Andrew Burgess wrote:
>> This is a slightly odd series of 2 patches.  The two patches are
>> actually alternative solutions to the same problem.  I'm keen to see
>> one of these merged, but I don't know which method would be
>preferred.
>>
>> This commit aims to address an issue that was introduced / mentioned
>> in commit 20554a78a9bba278c6b9cbbb4cfc5bde3772c56d (ARC:
>> Conditionalise certain relocations as provided by TLS tools only).
>>
>> The problem is that not all historic versions of binutils have
>> supported the @pcl relocation type.  This problem is compounded by
>the
>> fact that the arithmetic construct that was previously used to
>> synthesise an @pcl like behaviour, does not work on recent versions
>of
>> binutils.
>>
>> In the commit 20554a78a code was added that selects between the new
>> style @pcl relocations, and the old style arithmetic construct,
>> however, this selection is done based on whether the uClibc user has
>> configured with native threads or not.
>
>Right - the idea at the time was @pcl was added to tools for TLS/NPTL
>support and
>thus uClibc NPTL loosely implied that your tools will have that support
>- but this
>was not the ideal choice I agree.
>
>> Of course, a uClibc user could choose to use a modern version of
>> binutils AND configure without native thread support, in which case
>> uClibc will not compile.
>>
>> I have two proposed solutions.  In patch 1/2 I simply drop support
>for
>> the older versions of binutils in favour of the new @pcl relocation
>> type.  This feels the cleanest solution, but I don't know how
>strongly
>> the uClibc(-ng) community feels about maintaining compatibility for
>> older versions of the tools.
>
>So this was reported recently by Waldemar's build service too.
>
>http://mailman.uclibc-ng.org/pipermail/devel/2016-July/001072.html
>
>And we have an exact same patch floated internally which Vlad sent out
>earlier
>this week
>
>> Given that I anticipated push back against the first patch I took a
>> look at how I might maintain compatibility.
>
>Not really - while indeed 1/2 opens up a non-compatibilty window, there
>is less
>likelihood people will mix-n-match different baselines of uclibc and
>gcc/gas. So
>Vlad's patch does exactly that.
>
>> It turns out to be pretty
>> easy, and that is patch 2/2.  In this patch I drew inspiration from
>> similar examples in the Rules.mak file to check if the toolchain
>> supports @pcl relocations or not.  With this done we have a new
>define
>> based on the specific toolchain feature being supported or not, which
>> can then be used to conditionalise the code.
>
>Indeed your 2/2 seems to be the most "past-proof" code change. So I
>would think it
>is indeed better and is something I should have done in the first
>place.
>
>@Alexey, @Vlad what say you ?

uClibc traditionally supports the current stable release of binutils, which would make it patch #1 I think.

Thanks,
>
>-Vineet
>
>> Would you consider merging one of these patches?
>>
>> Thanks,
>> Andrew
