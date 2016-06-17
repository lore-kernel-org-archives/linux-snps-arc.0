From: vgupta@synopsys.com (Vineet Gupta)
Date: Fri, 17 Jun 2016 22:22:46 +0200
Subject: Build failures in -next due to 'locking/atomic, arch/arc:
 Implement atomic_fetch_{add,sub,and,andnot,or,xor}()'
In-Reply-To: <20160617160438.GA24148@gmail.com>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <20160617160438.GA24148@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57645C16.9040300@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 17 June 2016 06:04 PM, Ingo Molnar wrote:
>> I've misplaced my arc compiler, but does this make it go again?
> There's no arc compiler on korg's cross-building directory.

Yeah, I'd requested that a few times...

However we do have ARC kernels building at atleast 2 places
1. Guenther's build service which sent this error report
2. kisskb build by Michale Ellerman

Although I don't know if it is possible to download cross tools from either of above.

@Peter, upstream buildroot allows you to build toolchain for ARC ! Trust me it
does build :-)
