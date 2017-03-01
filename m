From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 Mar 2017 11:10:16 -0800
Subject: [uclibc-ng-devel] [PATCH] ARC: Enable getpt() support in ARC
 defconfigs
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B135829452A@DE02WEMBXB.internal.synopsys.com>
References: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
 <20170301162459.5d23c09e@free-electrons.com>
 <eaea2503-3a2a-2871-7f37-c57ed6504946@synopsys.com>
 <1488392734.4659.54.camel@synopsys.com>
 <39A54937CC95F24AA2F794E2D2B66B135829452A@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0496483a-e1ed-9064-94d6-214f84fd77d8@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 03/01/2017 10:57 AM, Anton Kolesov wrote:
>> That means for building of our toolchain we'll need to have separately stored
>> "defconfigs" in some form. Let's see what Anton says on that :)

But why is that - as long as buildroot (or other build systems) pass the right cpu
flags - why do you need a seperate config ?

>> And regardless of what mr Anton says having off-the-tree defconfigs is not
>> the best idea because with time options will go in and out and occasionally
>> we'll have outdated defconfigs.

The whole out-of-tree defconfig approach is nonsense - lets not discuss it !

> [AK] Not specifying architecture via uClibc config file is good for me - I
> wanted this long ago, since I never understood why current approach was used in
> the first place.
