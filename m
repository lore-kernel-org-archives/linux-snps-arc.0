From: vbabka@suse.cz (Vlastimil Babka)
Date: Tue, 16 Oct 2018 13:29:52 +0200
Subject: [PATCH 2/4] mm: speed up mremap by 500x on large regions (v2)
In-Reply-To: <20181015223303.GA164293@joelaf.mtv.corp.google.com>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-3-joel@joelfernandes.org>
 <20181015094209.GA31999@infradead.org>
 <20181015223303.GA164293@joelaf.mtv.corp.google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <35b9c85a-b366-9ca3-5647-c2568c811961@suse.cz>
To: linux-snps-arc@lists.infradead.org

On 10/16/18 12:33 AM, Joel Fernandes wrote:
> On Mon, Oct 15, 2018@02:42:09AM -0700, Christoph Hellwig wrote:
>> On Fri, Oct 12, 2018@06:31:58PM -0700, Joel Fernandes (Google) wrote:
>>> Android needs to mremap large regions of memory during memory management
>>> related operations.
>>
>> Just curious: why?
> 
> In Android we have a requirement of moving a large (up to a GB now, but may
> grow bigger in future) memory range from one location to another.

I think Christoph's "why?" was about the requirement, not why it hurts
applications. I admit I'm now also curious :)

> This move
> operation has to happen when the application threads are paused for this
> operation. Therefore, an inefficient move like it is now (for example 250ms
> on arm64) will cause response time issues for applications, which is not
> acceptable. Huge pages cannot be used in such memory ranges to avoid this
> inefficiency as (when the application threads are running) our fault handlers
> are designed to process 4KB pages at a time, to keep response times low. So
> using huge pages in this context can, again, cause response time issues.
> 
> Also, the mremap syscall waiting for quarter of a second for a large mremap
> is quite weird and we ought to improve it where possible.
