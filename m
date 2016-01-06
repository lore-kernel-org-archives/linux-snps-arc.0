From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 6 Jan 2016 11:51:39 +0530
Subject: AXS101: Problems with next-20160104
In-Reply-To: <568ABBAB.6090706@synopsys.com>
References: <568ABBAB.6090706@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <568CB273.7040900@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 05 January 2016 12:06 AM, Carlos Palminha wrote:
> Hi guys,
> 
> I just tried to boot next-20160104 with ARC AXS101 and it goes on a loop when freeing boot mem... (check log below).
> 
....

> Starting kernel ...
> 
> Linux version 4.4.0-rc7-next-20160104 (palminha at palminha-vm) (gcc version 4.8.4 (Buildroot 2015.08.1) ) #2 PREEMPT Mon Jan 4 17:41:19 WET 2016
> Memory @ 80000000 [512M]
> Machine model: snps,axs101
> earlycon: Early serial console at MMIO32 0xe0022000 (options '115200n8')
> bootconsole [uart0] enabled
> AXS: MainBoard v3 FPGA Date: 25-6-2015
> 
> IDENTITY        : ARCVER [0x34] ARCNUM [0x4] CHIPID [ 0x0]
> processor [0]   : ARC 700 R4.10 (ARCompact ISA)
> CPU speed       : 750.00 Mhz
> Timers          : Timer0 Timer1

...

> Stack Trace:
>   arc_unwind_core.constprop.1+0xa4/0x110
>   bad_page+0xda/0x120
>   free_pages_prepare+0x218/0x244
>   __free_pages_ok+0x1c/0x300
>   free_all_bootmem+0x13c/0x1b8
> BUG: Bad page state in process swapper  pfn:403bb
> page:9fdc864c count:0 mapcount:1 mapping:  (null) index:0x0
> flags: 0x0()
> page dumped because: nonzero mapcount
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Tainted: G    B           4.4.0-rc7-next-20160104 #2
> 

Hi Carlos,

Thx for the report.  This is an upstream bug which is being discussed on mailing
list since yesterday !

-Vineet
