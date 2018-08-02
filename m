From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 2 Aug 2018 14:54:39 -0700
Subject: [PATCH] ARC: Improve handling of fatal signals in do_page_fault()
In-Reply-To: <3760e66a23a8ec1c1eb4ad0aaaed06c9d31a3f4f.camel@synopsys.com>
References: <20180629182005.10243-1-abrodkin@synopsys.com>
 <432f2efe-e7cd-7bf1-40f5-f35f8954f224@synopsys.com>
 <3760e66a23a8ec1c1eb4ad0aaaed06c9d31a3f4f.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1520061c-5708-c19b-33e0-08a2ea2fc767@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/02/2018 12:08 AM, Alexey Brodkin wrote:
>> The fault handling is spaghetti mess of checks and more checks and has not really
>> been touched since upstreaming. I need to clean it up and essentially rewrite it
>> for v4.19
> So would you like me to send a re-spin with less changes as discussed above so
> we have something better for now and for back-porting to stable branches.

No that's fine, I'll fix it up here - minimally for the stable backports and do
the rewrite later.

BTW I tried to reproduce the Old OOM hangs from LTP (STARS 9001304674, 9001281305)
to prove that this fix solves those too, but I can't seem to reproduce the same
deadlock without this fix on 4.17 kernel.

-Vineet
