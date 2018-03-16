From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Fri, 16 Mar 2018 17:10:37 +0000
Subject: mmc: block: bonnie++ runs with errors on arc/hsdk board
In-Reply-To: <c5e50711-77d9-d1d2-35f4-3b656c8e895c@intel.com>
References: <1520942674.10285.8.camel@synopsys.com>
 <486fe92e-9b53-53a4-f98d-129a97032470@intel.com>
 <1520956602.10285.10.camel@synopsys.com>
 <1521030769.10285.16.camel@synopsys.com>
 <83de0f90-0919-f449-b432-494b9bf524a1@intel.com>
 <1521126524.10304.5.camel@synopsys.com>
 <c5e50711-77d9-d1d2-35f4-3b656c8e895c@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1521220236.10304.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello Adrian,

> Yes.??Unfortunately the clock used is not accurate enough to correctly order
> the events across different CPUs, which makes it very hard to see delays
> between requests.??You could try a different clock - refer the --clockid
> option to perf record.
> 
> Nevertheless it shows there are no I/O errors which means the error recovery
> can be ruled out as a problem.
> 
> The issue could be caused by the I/O scheduler.??Under blk-mq the default
> scheduler is the mq-deadline scheduler whereas without blk-mq you would
> probably have been using cfq by default.??You could try the bfq scheduler:
> 
> 	echo bfq > /sys/block/mmcblk0/queue/scheduler
> 
> But you might need to add it to the kernel config i.e.
> 
> 	CONFIG_IOSCHED_BFQ=y
> 
Switching from mq-deadline scheduler to bfq fixed the issue.
Also bonnie++ results have changed:
-----------------------------------------------<8----------------------------------------------------------------------------
bfq scheduler:
ARCLinux,512M,6463,87,7297,0,5450,0,9827,99,342952,99,+++++,+++,16,17525,100,+++++,+++,24329,99,17621,100,+++++,+++,24001,101

mq-deadline scheduler:
ARCLinux,512M,4453,36,6474,1,5852,0,12940,99,344329,100,+++++,+++,16,22168,98,+++++,+++,32760,99,22755,100,+++++,+++,32205,100
-----------------------------------------------<8----------------------------------------------------------------------------
As I see, the performance of sequential input per char and of file operations have decreased for ~25%.

Do you have any idea what could be a reason for such a long stalling in case of mq-deadline IOscheduler? I would expect if there is 
some long async operation, kernel should not be blocked. But what we see using mq-deadline is kernel blocked in bit_wait_io().
Do you think this is a valid behavior at least in case of mq-deadline IOscheduler?

> Alternatively you could fiddle with the scheduler parameters:
> 
> With mq-deadline they are:
> 
> # grep -H . /sys/block/mmcblk0/queue/iosched/*
> /sys/block/mmcblk0/queue/iosched/fifo_batch:16
> /sys/block/mmcblk0/queue/iosched/front_merges:1
> /sys/block/mmcblk0/queue/iosched/read_expire:500
> /sys/block/mmcblk0/queue/iosched/write_expire:5000
> /sys/block/mmcblk0/queue/iosched/writes_starved:2
> 
> You could try decreasing the write_expire and/or fifo_batch.
It seems that decreasing doesn't affect on this issue.

Best regards,
Evgeniy Didin
