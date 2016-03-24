From: jslaby@suse.cz (Jiri Slaby)
Date: Thu, 24 Mar 2016 14:05:03 +0100
Subject: [PATCH 3/4] exit_thread: accept a task parameter to be exited
In-Reply-To: <20160324130303.GS6356@twins.programming.kicks-ass.net>
References: <1458824294-29733-1-git-send-email-jslaby@suse.cz>
 <20160324130303.GS6356@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56F3E5FF.9030105@suse.cz>
To: linux-snps-arc@lists.infradead.org

On 03/24/2016, 02:03 PM, Peter Zijlstra wrote:
> On Thu, Mar 24, 2016@01:58:13PM +0100, Jiri Slaby wrote:
>>  void
>> -exit_thread(void)
>> +exit_thread(struct task_struct *me)
>>  {
>>  }
> 
> task_struct arguments are called: tsk, task, p
> 'me' seems very wrong, as that could only mean 'current', and its
> clearly not that.

Ah, OK. I will wait for more feedback and will fix this.

thanks,
-- 
js
suse labs
