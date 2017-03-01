From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 Mar 2017 10:35:00 -0800
Subject: [uclibc-ng-devel] [PATCH] ARC: Enable getpt() support in ARC
 defconfigs
In-Reply-To: <1488392734.4659.54.camel@synopsys.com>
References: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
 <20170301162459.5d23c09e@free-electrons.com>
 <eaea2503-3a2a-2871-7f37-c57ed6504946@synopsys.com>
 <1488392734.4659.54.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <69062690-9359-afcd-3849-61ba7d62e5dd@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 03/01/2017 10:25 AM, Alexey Brodkin wrote:
>> That was
>> a fair requirement on their part but it kept bloating uClibc for our typical
>> embedded use. But this idea of minimal vs. full featured is exactly what we need.
>> @Alexey / @vlad can we take this up please !
> Probably Waldemar's opinion might be useful here.
> @Waldemar are there any plans for busting arch-specific defconfigs in favor
> to generic defconfigs like those "minimal" and "full" mentioned above?

I didn't read Thomas' proposal that way. IMHO it would be better to stage it by
first folding arch defconfigs into arch min/full and later if possible merge them
in arch independent min/full ?
