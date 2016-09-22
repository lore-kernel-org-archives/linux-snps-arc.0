From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 22 Sep 2016 09:56:03 +0200
Subject: perf event grouping for dummies (was Re: [PATCH] arc: perf:
 Enable generic "cache-references" and "cache-misses" events)
In-Reply-To: <04f6dcd2-35c6-6e28-2dcf-bc5f0bb446dc@us.ibm.com>
References: <1472125647-518-1-git-send-email-abrodkin@synopsys.com>
 <6074e252-6e18-bb01-4de1-023bd7e82f03@synopsys.com>
 <5f65fa04-8d33-e525-115d-4e6991a7668e@synopsys.com>
 <20160901083324.GM10153@twins.programming.kicks-ass.net>
 <2a18ae06-3abd-c3a1-e980-f04c511b08e5@synopsys.com>
 <04f6dcd2-35c6-6e28-2dcf-bc5f0bb446dc@us.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160922075603.GW5008@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Sep 21, 2016@07:43:28PM -0500, Paul Clarke wrote:
> On 09/20/2016 03:56 PM, Vineet Gupta wrote:
> >On 09/01/2016 01:33 AM, Peter Zijlstra wrote:
> >>>- is that what perf event grouping is ?
> >>
> >>Again, nope. Perf event groups are single counter (so no implicit
> >>addition) that are co-scheduled on the PMU.
> >
> >I'm not sure I understand - does this require specific PMU/arch support - as in
> >multiple conditions feeding to same counter.
> 
> My read is that is that what Peter meant was that each event in the
> perf event group is a single counter, so all the events in the group
> are counted simultaneously.  (No multiplexing.)

Right, sorry for the poor wording.

> >Again when you say co-scheduled what do you mean - why would anyone use the event
> >grouping - is it when they only have 1 counter and they want to count 2
> >conditions/events at the same time - isn't this same as event multiplexing ?
> 
> I'd say it's the converse of multiplexing.  Instead of mapping
> multiple events to a single counter, perf event groups map a set of
> events each to their own counter, and they are active simultaneously.
> I suppose it's possible for the _groups_ to be multiplexed with other
> events or groups, but the group as a whole will be scheduled together,
> as a group.

Correct.

Each events get their own hardware counter. Grouped events are
co-scheduled on the hardware.

You can multiplex groups. But if one event in a group is schedule, they
all must be.
