From: adrian.hunter@intel.com (Adrian Hunter)
Date: Fri, 16 Mar 2018 14:12:20 +0200
Subject: mmc: block: bonnie++ runs with errors on arc/hsdk board
In-Reply-To: <1521126524.10304.5.camel@synopsys.com>
References: <1520942674.10285.8.camel@synopsys.com>
 <486fe92e-9b53-53a4-f98d-129a97032470@intel.com>
 <1520956602.10285.10.camel@synopsys.com>
 <1521030769.10285.16.camel@synopsys.com>
 <83de0f90-0919-f449-b432-494b9bf524a1@intel.com>
 <1521126524.10304.5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c5e50711-77d9-d1d2-35f4-3b656c8e895c@intel.com>
To: linux-snps-arc@lists.infradead.org

On 15/03/18 17:08, Evgeniy Didin wrote:
> Hi Adrian,
> 
>> On 14/03/18 14:32, Evgeniy Didin wrote:
>>> Hi Adrian,
>>>>>
>>>>> Was the performance affected? i.e. the results from bonnie++
>>>>
>>>> I have run bonnie++ several times before and after mentioned commit. Here is output:
>>>> --------------------------------------------------<8-------------------------------------------------------------------------
>>>> Before commit:
>>>> ARCLinux,512M,6442,50,7211,0,5333,0,12954,99,345638,100,+++++,+++,16,22322,100,+++++,+++,32735,99,22921,100,+++++,+++,32211,100
>>>> ARCLinux,512M,6611,51,7248,0,5162,0,12951,99,344763,99,+++++,+++,16,22649,99,+++++,+++,32723,99,22572,100,+++++,+++,31697,100
>>>> ARCLinux,512M,6597,52,7307,0,5368,0,12934,99,343987,99,+++++,+++,16,22775,100,+++++,+++,32713,99,22832,100,+++++,+++,31899,99
>>>> After commit:
>>>> ARCLinux,512M,4453,36,6474,1,5852,0,12940,99,344329,100,+++++,+++,16,22168,98,+++++,+++,32760,99,22755,100,+++++,+++,32205,100
>>>> ARCLinux,512M,5159,42,6944,1,5658,0,12945,99,344290,100,+++++,+++,16,22295,100,+++++,+++,32715,99,22888,99,+++++,+++,32007,99
>>>> ARCLinux,512M,5170,42,6840,2,5315,0,12946,99,343889,100,+++++,+++,16,22445,100,+++++,+++,32681,99,22967,100,+++++,+++,32117,99
>>>> --------------------------------------------------<8------------------------------------------------------------------------
>>>> ??????????????^^^^?
>>>> If i understand correctly, in third column is shown "sequential output" per character speed (K/sec), which decreased.
>>>>
>>>>> What mount options did you use?
>>>>
>>>> I didn't use any options. Simply:
>>>> # mount /dev/mmcblk0p1 /mnt
>>>
>>> Note that the file system on SDcard was ext4.?
>>
>> Please try:
>>
>> 	perf record -a -e mmc:* -- bonnie++ -u root -r 256 -s 512 -x 1 -d /mnt
>> and share the resulting perf.data file when you are able
>> to reproduce the hung task message.
>>
> 
> I have applied the patch below and collected perf.data using command above, hung message also appeared. Is this the information you needed?
> (perf.data is in attachments to this
> message).

Yes.  Unfortunately the clock used is not accurate enough to correctly order
the events across different CPUs, which makes it very hard to see delays
between requests.  You could try a different clock - refer the --clockid
option to perf record.

Nevertheless it shows there are no I/O errors which means the error recovery
can be ruled out as a problem.

The issue could be caused by the I/O scheduler.  Under blk-mq the default
scheduler is the mq-deadline scheduler whereas without blk-mq you would
probably have been using cfq by default.  You could try the bfq scheduler:

	echo bfq > /sys/block/mmcblk0/queue/scheduler

But you might need to add it to the kernel config i.e.

	CONFIG_IOSCHED_BFQ=y

Alternatively you could fiddle with the scheduler parameters:

With mq-deadline they are:

# grep -H . /sys/block/mmcblk0/queue/iosched/*
/sys/block/mmcblk0/queue/iosched/fifo_batch:16
/sys/block/mmcblk0/queue/iosched/front_merges:1
/sys/block/mmcblk0/queue/iosched/read_expire:500
/sys/block/mmcblk0/queue/iosched/write_expire:5000
/sys/block/mmcblk0/queue/iosched/writes_starved:2

You could try decreasing the write_expire and/or fifo_batch.

>  
>> You may want to add this patch first:
>>
>> 	https://urldefense.proofpoint.com/v2/url?u=https-3A__marc.info_-3Fl-3Dlinux-2Dmmc-26m-3D152110580324200&d=DwIDaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=vQk-RIbjwN0zvlwiMSpq3LYUTNf7Gqc4
>> ujhosYITtAw&m=LeVFmgzU0ydw-qHaAVh-kZI-v4mldnCycYxIGxqDexU&s=SyGvsVJBOzegO2Mz3hQ5j6CY8KrjLWJERVHfosSmKSs&e=
> 
> Best regards,
> Evgeniy Didin
> 
