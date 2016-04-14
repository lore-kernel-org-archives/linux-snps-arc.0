From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 14 Apr 2016 15:06:10 +0530
Subject: [PATCH v4 2/5] ARC: clocksource: DT based probe
In-Reply-To: <570F63A1.3070904@arm.com>
References: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
 <1460547605-26184-3-git-send-email-vgupta@synopsys.com>
 <570E7263.8070108@arm.com> <570F623B.3000105@synopsys.com>
 <570F63A1.3070904@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570F648A.2060307@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 14 April 2016 03:02 PM, Marc Zyngier wrote:
>> This is clocksource, not clockevent. cs needs to synchronized across all cores so
>> > that concurrent gtod call from threads on different cores gives you similar
>> > values. This obviously is not true for the local RTC hardware timer.
> Unsynchronized counters on SMP HW, who would have thought! ;-) I guess
> each and every architecture has to repeat the same mistakes.

Not really - hardware wise the SMP support is pretty recent and before that we
only had UP cores. So transition from 32 TIMER1 to 64 bit RTC was only a natural
progression in improvements and in theory SoC guys throw in this local timer into
the config. We just prevent SMP linux from using it.
