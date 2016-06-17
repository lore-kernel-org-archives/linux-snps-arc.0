From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 17 Jun 2016 17:22:08 +0200
Subject: Build failures in -next due to 'locking/atomic, arch/arc:
 Implement atomic_fetch_{add,sub,and,andnot,or,xor}()'
In-Reply-To: <576410AB.6050204@synopsys.com>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <57640EB5.8090604@roeck-us.net> <576410AB.6050204@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160617152208.GX30154@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org



Question; why does atomic_read() have a full memory clobber on arc?

Will thinks its because you don't use a memory constraint for *v.
