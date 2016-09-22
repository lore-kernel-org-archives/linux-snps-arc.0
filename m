From: acme@redhat.com (Arnaldo Carvalho de Melo)
Date: Thu, 22 Sep 2016 16:42:52 -0300
Subject: perf event grouping for dummies (was Re: [PATCH] arc: perf:
 Enable generic "cache-references" and "cache-misses" events)
In-Reply-To: <4351119f-b212-5039-9a3d-f568f6893b36@us.ibm.com>
References: <1472125647-518-1-git-send-email-abrodkin@synopsys.com>
 <6074e252-6e18-bb01-4de1-023bd7e82f03@synopsys.com>
 <5f65fa04-8d33-e525-115d-4e6991a7668e@synopsys.com>
 <20160901083324.GM10153@twins.programming.kicks-ass.net>
 <2a18ae06-3abd-c3a1-e980-f04c511b08e5@synopsys.com>
 <04f6dcd2-35c6-6e28-2dcf-bc5f0bb446dc@us.ibm.com>
 <20160922075603.GW5008@twins.programming.kicks-ass.net>
 <b15fc87b-c846-fdb5-ef6a-48fc2d797917@synopsys.com>
 <4351119f-b212-5039-9a3d-f568f6893b36@us.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160922194252.GA2441@redhat.com>
To: linux-snps-arc@lists.infradead.org

Em Thu, Sep 22, 2016 at 01:23:04PM -0500, Paul Clarke escreveu:
> On 09/22/2016 12:50 PM, Vineet Gupta wrote:
> >On 09/22/2016 12:56 AM, Peter Zijlstra wrote:
> >>On Wed, Sep 21, 2016@07:43:28PM -0500, Paul Clarke wrote:
> >>>On 09/20/2016 03:56 PM, Vineet Gupta wrote:
> >>>>On 09/01/2016 01:33 AM, Peter Zijlstra wrote:
> >>>>>>- is that what perf event grouping is ?
> >>>>>
> >>>>>Again, nope. Perf event groups are single counter (so no implicit
> >>>>>addition) that are co-scheduled on the PMU.
> >>>>
> >>>>I'm not sure I understand - does this require specific PMU/arch support - as in
> >>>>multiple conditions feeding to same counter.
> >>>
> >>>My read is that is that what Peter meant was that each event in the
> >>>perf event group is a single counter, so all the events in the group
> >>>are counted simultaneously.  (No multiplexing.)
> >>
> >>Right, sorry for the poor wording.
> >>
> >>>>Again when you say co-scheduled what do you mean - why would anyone use the event
> >>>>grouping - is it when they only have 1 counter and they want to count 2
> >>>>conditions/events at the same time - isn't this same as event multiplexing ?
> >>>
> >>>I'd say it's the converse of multiplexing.  Instead of mapping
> >>>multiple events to a single counter, perf event groups map a set of
> >>>events each to their own counter, and they are active simultaneously.
> >>>I suppose it's possible for the _groups_ to be multiplexed with other
> >>>events or groups, but the group as a whole will be scheduled together,
> >>>as a group.
> >>
> >>Correct.
> >>
> >>Each events get their own hardware counter. Grouped events are
> >>co-scheduled on the hardware.
> >
> >And if we don't group them, then they _may_ not be co-scheduled (active/counting
> >at the same time) ? But how can this be possible.
> >Say we have 2 counters, both the cmds below
> >
> >     perf -e cycles,instructions hackbench
> >     perf -e {cycles,instructions} hackbench
> >
> >would assign 2 counters to the 2 conditions which keep counting until perf asks
> >them to stop (because the profiled application ended)
> >
> >I don't understand the "scheduling" of counter - once we set them to count, there
> >is no real intervention/scheduling form software in terms of disabling/enabling
> >(assuming no multiplexing etc)

So, getting this machine as an example:

[    0.067739] smpboot: CPU0: Intel(R) Core(TM) i7-3667U CPU @ 2.00GHz (family: 0x6, model: 0x3a, stepping: 0x9)
[    0.067744] Performance Events: PEBS fmt1+, 16-deep LBR, IvyBridge events, full-width counters, Intel PMU driver.
[    0.067774] ... version:                3
[    0.067776] ... bit width:              48
[    0.067777] ... generic registers:      4
[    0.067778] ... value mask:             0000ffffffffffff
[    0.067779] ... max period:             0000ffffffffffff
[    0.067780] ... fixed-purpose events:   3
[    0.067781] ... event mask:             000000070000000f
[    0.068694] NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.

[root at zoo ~]# perf stat -e '{branch-instructions,branch-misses,bus-cycles,cache-misses}' ls a
ls: cannot access 'a': No such file or directory

 Performance counter stats for 'ls a':

           356,090      branch-instructions                                         
            17,170      branch-misses             #    4.82% of all branches        
           232,365      bus-cycles                                                  
            12,107      cache-misses                                                

       0.003624967 seconds time elapsed

[root at zoo ~]# perf stat -e '{branch-instructions,branch-misses,bus-cycles,cache-misses,cpu-cycles}' ls a
ls: cannot access 'a': No such file or directory

 Performance counter stats for 'ls a':

     <not counted>      branch-instructions                                           (0.00%)
     <not counted>      branch-misses                                                 (0.00%)
     <not counted>      bus-cycles                                                    (0.00%)
     <not counted>      cache-misses                                                  (0.00%)
     <not counted>      cpu-cycles                                                    (0.00%)

       0.003659678 seconds time elapsed

[root at zoo ~]#

That was as a group, i.e. those {} enclosing it, if you run it with -vv, among
other things you'll see the "group_fd" parameter to the sys_perf_event_open
syscall:

[root at zoo ~]# perf stat -vv -e '{branch-instructions,branch-misses,bus-cycles,cache-misses,cpu-cycles}' ls a
sys_perf_event_open: pid 28581  cpu -1  group_fd -1  flags 0x8
sys_perf_event_open: pid 28581  cpu -1  group_fd 3  flags 0x8
sys_perf_event_open: pid 28581  cpu -1  group_fd 3  flags 0x8
sys_perf_event_open: pid 28581  cpu -1  group_fd 3  flags 0x8
sys_perf_event_open: pid 28581  cpu -1  group_fd 3  flags 0x8
ls: cannot access 'a': No such file or directory

 Performance counter stats for 'ls a':

     <not counted>      branch-instructions                                           (0.00%)
     <not counted>      branch-misses                                                 (0.00%)
     <not counted>      bus-cycles                                                    (0.00%)
     <not counted>      cache-misses                                                  (0.00%)
     <not counted>      cpu-cycles                                                    (0.00%)

       0.002883209 seconds time elapsed

[root at zoo ~]#

So, the first one passes -1, to create the group, the fd it returns is '3',
that is used as group_fd for the other events in that group.

So the workload runs but nothing is counted, the kernel can't do what was
asked, i.e. schedule all those 5 hardware events _at the same time_, no
multiplexing of counters that can count different hardware events is performed
_for that task_.

If we remove that {}, i.e. say, no need to enable all those counters _at the
same time_, multiplex them _in the same task_ to be able to measure them all
to some degree, it "works":

[root at zoo ~]# perf stat -vv -e 'branch-instructions,branch-misses,bus-cycles,cache-misses,cpu-cycles' ls a
perf_event_attr: (For the first event:)
  config                           0x4
  read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING
sys_perf_event_open: pid 28594  cpu -1  group_fd -1  flags 0x8
sys_perf_event_open: pid 28594  cpu -1  group_fd -1  flags 0x8
sys_perf_event_open: pid 28594  cpu -1  group_fd -1  flags 0x8
sys_perf_event_open: pid 28594  cpu -1  group_fd -1  flags 0x8
sys_perf_event_open: pid 28594  cpu -1  group_fd -1  flags 0x8

 Performance counter stats for 'ls a':

           317,892      branch-instructions                                           (53.01%)
            13,400      branch-misses             #    4.22% of all branches        
           201,578      bus-cycles                                                  
            11,326      cache-misses                                                
         2,203,482      cpu-cycles                                                    (78.44%)

       0.003026840 seconds time elapsed

[root at zoo ~]#

See the read_format? Those percentages? the group_fd = -1?

It all depends on these PMU resources:

[    0.067777] ... generic registers:      4
[    0.067780] ... fixed-purpose events:   3

Its this part of 'man perf_event_open':

  The  group_fd  argument  allows  event groups to be created.  An event group
has one event which is the group leader.  The leader is created first, with
group_fd = -1.  The rest of the group members are created with subsequent
perf_event_open() calls with group_fd being set to the file descrip? tor  of
the group leader.  (A single event on its own is created with group_fd = -1 and
is considered to be a group with only 1 member.)  An event group is scheduled
onto the CPU as a unit: it will be put onto the CPU only if all of the events
in the group can be put onto the CPU.  This  means that  the  values  of  the
member  events  can be meaningfully compared?added, divided (to get ratios),
and so on?with each other, since they have counted events for the same set of
executed instructions.

- Arnaldo
 
> If you assume no multiplexing, then this discussion on grouping is moot.
 
> It depends on how many events you specify, how many counters there
> are, and which counters can count which events.  If you specify a set
> of events for which every event can be counted simultaneously, they
> will be scheduled simultaneously and continuously.  If you specify
> more events than counters, there's multiplexing.  AND, if you specify

There is multiplexing if group_fd is set to -1 in all events.

> a set of events, some of which cannot be counted simultaneously due to
> hardware limitations, they'll be multiplexed.

Not if group_fd is set to a group leader.
 
> PC
