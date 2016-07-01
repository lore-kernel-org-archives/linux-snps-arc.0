From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 1 Jul 2016 12:06:06 +0530
Subject: Handling Machine check
In-Reply-To: <DB3PR05MB0953FF620928D24A19514D33AA250@DB3PR05MB0953.eurprd05.prod.outlook.com>
References: <DB3PR05MB0953FF620928D24A19514D33AA250@DB3PR05MB0953.eurprd05.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57760F56.7000600@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 01 July 2016 09:29 AM, Noam Camus wrote:
>
> Hi Vineet,
>
>
> I wish to ask about how kernel should handle machine check.
>
> Why it is a dead end unlike other exceptions e.g. " mem error", "inst err"?
>
>
> What will happen if I do call ret_from_exception?
>
> Where I going to find my self after the rtie?
>
> should all relevant auxiliary registers needed for proper return from rtie are
> expected to be valid?
>
>
> Is there any difference if such exception caused during user or kernel mode?
>
>
> All above comes from special case we have:
>
> Our chip creates machine check when user code goes beyound memory space 
> boundary, Inside EV handler I called to FAKE, do_memory_error and
> ret_from_exception and I got SIGBUS as expected and I didn't noticed any thing
> strange, so I am not sure why we treat this as DEAD END?
>
>
> Note: it is not double fault but rather first exception.
>
>

With standard ARCompact ISA / ARC cores, machine check is typically for fatal
errors in *kernel* mode and this by definition is non-recoverable. e.g. if Bus
returned error in kernel mode- how do u handle it - i mean u can't RTIE to same
instruction and it is not correct to assume to return to next one either.

Moreover machine check is taken for nested exceptions - where system is really
hosed as ERET/ERSTATUS of orig exception are already clobbered/lost.

So the umbrella handling for machine check is halt - otherwise at time of crash -
code just keeps spinning/running.
If there are new cases where it can be gracefully handled - I'm open to patches to
same effect !

-Vineet
