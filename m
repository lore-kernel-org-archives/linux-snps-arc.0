From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 3 Jun 2019 11:43:20 -0700
Subject: single copy atomicity for double load/stores on 32-bit systems
In-Reply-To: <20190531082112.GH2623@hirez.programming.kicks-ass.net>
References: <2fd3a455-6267-5d21-c530-41964a4f6ce9@synopsys.com>
 <20190531082112.GH2623@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <77b30ed2-3211-222b-1342-051a6cde4f77@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/31/19 1:21 AM, Peter Zijlstra wrote:
> And I'll stand by my earlier conviction that any architecture that has a
> native u64 (be it a 64bit arch or a 32bit with double-width
> instructions) but has an ABI that allows u32 alignment on them is daft.

Why ? For 64-bit data on 32-bit systems, hardware doesn't claim to provide any
single-copy atomicity for such data and software doesn't expect either.
