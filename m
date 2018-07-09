From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 9 Jul 2018 16:45:46 +0200
Subject: [PATCH] atomic{64}_t: Explicitly specify data storage length and
 alignment
In-Reply-To: <6762443004f96d279cba77b7c412163769c930fe.camel@synopsys.com>
References: <20180709124741.21037-1-abrodkin@synopsys.com>
 <20180709133542.GP2476@hirez.programming.kicks-ass.net>
 <6762443004f96d279cba77b7c412163769c930fe.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180709144546.GT2476@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 09, 2018@02:30:41PM +0000, Alexey Brodkin wrote:
> Hm, any thoughts on why it's "u64" for 32-bit x86?

Accident probably. It probably doesn't really matter all that much
because the kernel hard assumes 2s complement, but it is somewhat
inconsistent.
