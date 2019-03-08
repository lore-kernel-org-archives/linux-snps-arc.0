From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 8 Mar 2019 10:50:44 -0800
Subject: [PATCH] ARCv2: spinlock: remove the extra smp_mb before lock,
 after unlock
In-Reply-To: <20190308083748.GP32477@hirez.programming.kicks-ass.net>
References: <1552008946-8008-1-git-send-email-vgupta@synopsys.com>
 <20190308083748.GP32477@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cb91fac9-8a7b-9f05-8958-7770d3363b25@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 3/8/19 12:37 AM, Peter Zijlstra wrote:
> I'm thinking those assignments should be WRITE_ONCE() at the very least.

Done !
