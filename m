From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 9 Jul 2018 17:34:27 +0200
Subject: [PATCH v3] devres: Explicitly align datai[] to 64-bit
In-Reply-To: <20180709152958.565weccfaktqauef@lakrids.cambridge.arm.com>
References: <20180709134550.29541-1-abrodkin@synopsys.com>
 <20180709140717.GR2476@hirez.programming.kicks-ass.net>
 <20180709141056.GR2512@hirez.programming.kicks-ass.net>
 <44727d3cebda7bee5b68fb388bd2fecfc6dc7b89.camel@synopsys.com>
 <20180709144925.GU2476@hirez.programming.kicks-ass.net>
 <20180709152958.565weccfaktqauef@lakrids.cambridge.arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180709153427.GY2476@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 09, 2018@04:29:58PM +0100, Mark Rutland wrote:
> Shouldn't that be 8? AFAICT, __alignof__(unsigned long long) is 8 on
> x86_32:

Curious, I wonder why we put that align in atomic64_32 then.
