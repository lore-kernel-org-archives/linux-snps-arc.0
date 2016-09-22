From: pc@us.ibm.com (Paul Clarke)
Date: Wed, 21 Sep 2016 19:43:28 -0500
Subject: perf event grouping for dummies (was Re: [PATCH] arc: perf:
 Enable generic "cache-references" and "cache-misses" events)
In-Reply-To: <2a18ae06-3abd-c3a1-e980-f04c511b08e5@synopsys.com>
References: <1472125647-518-1-git-send-email-abrodkin@synopsys.com>
 <6074e252-6e18-bb01-4de1-023bd7e82f03@synopsys.com>
 <5f65fa04-8d33-e525-115d-4e6991a7668e@synopsys.com>
 <20160901083324.GM10153@twins.programming.kicks-ass.net>
 <2a18ae06-3abd-c3a1-e980-f04c511b08e5@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <04f6dcd2-35c6-6e28-2dcf-bc5f0bb446dc@us.ibm.com>
To: linux-snps-arc@lists.infradead.org

On 09/20/2016 03:56 PM, Vineet Gupta wrote:
> On 09/01/2016 01:33 AM, Peter Zijlstra wrote:
>>> - is that what perf event grouping is ?
>>
>> Again, nope. Perf event groups are single counter (so no implicit
>> addition) that are co-scheduled on the PMU.
>
> I'm not sure I understand - does this require specific PMU/arch support - as in
> multiple conditions feeding to same counter.

My read is that is that what Peter meant was that each event in the perf event group is a single counter, so all the events in the group are counted simultaneously.  (No multiplexing.)

>> You can do it like:
>>
>> 	perf stat -e '{cycles,instructions}'
>>
>> Which will place the cycles event and the instructions event in a group
>> and thereby guarantee they're co-scheduled.
>
> Again when you say co-scheduled what do you mean - why would anyone use the event
> grouping - is it when they only have 1 counter and they want to count 2
> conditions/events at the same time - isn't this same as event multiplexing ?

I'd say it's the converse of multiplexing.  Instead of mapping multiple events to a single counter, perf event groups map a set of events each to their own counter, and they are active simultaneously.  I suppose it's possible for the _groups_ to be multiplexed with other events or groups, but the group as a whole will be scheduled together, as a group.

If you have a single counter, I don't believe you can support perf event groups, by definition.

Regards,
Paul Clarke, IBM
