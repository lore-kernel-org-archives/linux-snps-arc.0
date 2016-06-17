From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 17 Jun 2016 18:13:11 +0200
Subject: Build failures in -next due to 'locking/atomic, arch/arc:
 Implement atomic_fetch_{add,sub,and,andnot,or,xor}()'
In-Reply-To: <20160617160438.GA24148@gmail.com>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <20160617160438.GA24148@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160617161311.GA30154@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Fri, Jun 17, 2016@06:04:38PM +0200, Ingo Molnar wrote:

> There's no arc compiler on korg's cross-building directory.

I always build my own cross compiler set, but it looks like the last
time I build a set ARC didn't build.

This frequently happens (that a number of archs fail to build that is).
