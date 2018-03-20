From: adrian.hunter@intel.com (Adrian Hunter)
Date: Tue, 20 Mar 2018 10:29:16 +0200
Subject: mmc: block: bonnie++ runs with errors on arc/hsdk board
In-Reply-To: <1521220236.10304.10.camel@synopsys.com>
References: <1520942674.10285.8.camel@synopsys.com>
 <486fe92e-9b53-53a4-f98d-129a97032470@intel.com>
 <1520956602.10285.10.camel@synopsys.com>
 <1521030769.10285.16.camel@synopsys.com>
 <83de0f90-0919-f449-b432-494b9bf524a1@intel.com>
 <1521126524.10304.5.camel@synopsys.com>
 <c5e50711-77d9-d1d2-35f4-3b656c8e895c@intel.com>
 <1521220236.10304.10.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e00cf7f1-6ed8-124d-54b7-81e3d5722b10@intel.com>
To: linux-snps-arc@lists.infradead.org

On 16/03/18 19:10, Evgeniy Didin wrote:
> Hello Adrian,
> 
>> Yes.??Unfortunately the clock used is not accurate enough to correctly order
>> the events across different CPUs, which makes it very hard to see delays
>> between requests.??You could try a different clock - refer the --clockid
>> option to perf record.
>>
>> Nevertheless it shows there are no I/O errors which means the error recovery
>> can be ruled out as a problem.
>>
>> The issue could be caused by the I/O scheduler.??Under blk-mq the default
>> scheduler is the mq-deadline scheduler whereas without blk-mq you would
>> probably have been using cfq by default.??You could try the bfq scheduler:
>>
>> 	echo bfq > /sys/block/mmcblk0/queue/scheduler
>>
>> But you might need to add it to the kernel config i.e.
>>
>> 	CONFIG_IOSCHED_BFQ=y
>>
> Switching from mq-deadline scheduler to bfq fixed the issue.
> Also bonnie++ results have changed:
> -----------------------------------------------<8----------------------------------------------------------------------------
> bfq scheduler:
> ARCLinux,512M,6463,87,7297,0,5450,0,9827,99,342952,99,+++++,+++,16,17525,100,+++++,+++,24329,99,17621,100,+++++,+++,24001,101
> 
> mq-deadline scheduler:
> ARCLinux,512M,4453,36,6474,1,5852,0,12940,99,344329,100,+++++,+++,16,22168,98,+++++,+++,32760,99,22755,100,+++++,+++,32205,100
> -----------------------------------------------<8----------------------------------------------------------------------------
> As I see, the performance of sequential input per char and of file
> operations have decreased for ~25%.

You may need to aggregate more runs, and also compare to BFQ with blk-mq
against CFQ without blk-mq.  If you think BFQ is under-performing, then
contact the BFQ maintainers.

> 
> Do you have any idea what could be a reason for such a long stalling in
> case of mq-deadline IOscheduler?

Write starvation.

>                                 I would expect if there is some long
> async operation, kernel should not be blocked.

The kernel is not blocked.  AFAICT it is the EXT4 journal that is
blocked waiting on a write.

>                                                But what we see using
> mq-deadline is kernel blocked in bit_wait_io(). Do you think this is a
> valid behavior at least in case of mq-deadline IOscheduler?

mq-deadline is designed to favour reads over writes, so in that sense some
amount of write-starvation is normal.

> 
>> Alternatively you could fiddle with the scheduler parameters:
>>
>> With mq-deadline they are:
>>
>> # grep -H . /sys/block/mmcblk0/queue/iosched/*
>> /sys/block/mmcblk0/queue/iosched/fifo_batch:16
>> /sys/block/mmcblk0/queue/iosched/front_merges:1
>> /sys/block/mmcblk0/queue/iosched/read_expire:500
>> /sys/block/mmcblk0/queue/iosched/write_expire:5000
>> /sys/block/mmcblk0/queue/iosched/writes_starved:2
>>
>> You could try decreasing the write_expire and/or fifo_batch.
> It seems that decreasing doesn't affect on this issue.

That is surprising.  You could also try writes_starved=1 or
writes_starved=0.
