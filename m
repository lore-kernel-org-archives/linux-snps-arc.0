From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 7 Oct 2016 14:39:10 -0700
Subject: [PATCH] ARCv2: intc: untangle SMP, MCIP and IDU
In-Reply-To: <1475861484.2874.44.camel@synopsys.com>
References: <1475699962-11711-1-git-send-email-vgupta@synopsys.com>
 <1475745033.3301.5.camel@synopsys.com>
 <62f431fd-8c66-143b-2129-a1b996a0a98c@synopsys.com>
 <1475861484.2874.44.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1fc6dd97-3d03-c2e1-079b-efbfaee63db3@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/07/2016 10:31 AM, Alexey Brodkin wrote:
>> They are ugly I agree - but not portable - really ? The whole point is to make
>> > this work on BE w/o changing the src code - this details remains hidden in an
>> > obscure header.
> That's what I learned the hard way.
> At least I was beaten a couple of times yet in both Linux kernel community and
> U-Boot
> one.

Beaten for writing code like above - please point me to those discussions. I'd
love to be educated in art of writing portable code !
