From: CARLOS.PALMINHA@synopsys.com (Carlos Palminha)
Date: Wed, 6 Jan 2016 17:03:26 +0000
Subject: AXS101: Problems with next-20160104
In-Reply-To: <568ABBAB.6090706@synopsys.com>
References: <568ABBAB.6090706@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <568D48DE.2010208@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

Thanks for the feedback.
I'll wait for some conclusion... :)

B.t.w., in what LKML is the discussion going?

Regards,
C.Palminha


On 04-01-2016 18:36, Carlos Palminha wrote:
> Hi guys,
> 
> I just tried to boot next-20160104 with ARC AXS101 and it goes on a loop when freeing boot mem... (check log below).
> 
> Regards,
> C.Palminha
> 
> 
> U-Boot 2015.10 (Nov 17 2015 - 19:28:48 +0100)
> 
> I2C:   ready
> DRAM:  512 MiB
> NAND:  512 MiB
> MMC:   Synopsys Mobile storage: 0
> In:    serial0 at e0022000
> Out:   serial0 at e0022000
> Err:   serial0 at e0022000
> Net:   eth0: ethernet at e0018000
> Hit any key to stop autoboot:  0
> reading uImage
> 7774496 bytes read in 664 ms (11.2 MiB/s)
> ## Booting kernel from Legacy Image at 82000000 ...
>    Image Name:   Linux-4.4.0-rc7-next-20160104
>    Image Type:   ARC Linux Kernel Image (uncompressed)
>    Data Size:    7774432 Bytes = 7.4 MiB
>    Load Address: 80000000
>    Entry Point:  800de000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> 
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
> ISA Extn        : atomic
>                 : mpy norm barrel-shift swap minmax swape
> BPU             : partial match, cache:512, Predict Table:512
> MMU [v3]        : 8k PAGE, JTLB 512 (128x4), uDTLB 8, uITLB 4
> I-Cache         : 32K, 2way/set, 32B Line, VIPT aliasing
> D-Cache         : 32K, 4way/set, 32B Line, VIPT
> Vector Table    : 0x80000000
> Uncached Base   : 0xc0000000
> FPU             : SP DP
> DEBUG           : ActionPoint smaRT
> OS ABI [v3]     : no-legacy-syscalls
> CONFIG_ARC_FPU_SAVE_RESTORE needed for working apps
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65248
> Kernel command line: earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0
> PID hash table entries: 2048 (order: 0, 8192 bytes)
> Dentry cache hash table entries: 65536 (order: 5, 262144 bytes)
> Inode-cache hash table entries: 32768 (order: 4, 131072 bytes)
> BUG: Bad page state in process swapper  pfn:403b6
> page:9fdc8598 count:0 mapcount:1 mapping:  (null) index:0x0
> flags: 0x0()
> page dumped because: nonzero mapcount
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Not tainted 4.4.0-rc7-next-20160104 #2
> 
> Stack Trace:
>   arc_unwind_core.constprop.1+0xa4/0x110
>   bad_page+0xda/0x120
>   free_pages_prepare+0x232/0x244
>   __free_pages_ok+0x1c/0x300
>   free_all_bootmem+0x13c/0x1b8
> Disabling lock debugging due to kernel taint
> BUG: Bad page state in process swapper  pfn:403b7
> page:9fdc85bc count:0 mapcount:1 mapping:  (null) index:0x0
> flags: 0x0()
> page dumped because: nonzero mapcount
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Tainted: G    B           4.4.0-rc7-next-20160104 #2
> 
> Stack Trace:
>   arc_unwind_core.constprop.1+0xa4/0x110
>   bad_page+0xda/0x120
>   free_pages_prepare+0x218/0x244
>   __free_pages_ok+0x1c/0x300
>   free_all_bootmem+0x13c/0x1b8
> BUG: Bad page state in process swapper  pfn:403b8
> page:9fdc85e0 count:0 mapcount:1 mapping:  (null) index:0x0
> flags: 0x0()
> page dumped because: nonzero mapcount
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Tainted: G    B           4.4.0-rc7-next-20160104 #2
> 
> Stack Trace:
>   arc_unwind_core.constprop.1+0xa4/0x110
>   bad_page+0xda/0x120
>   free_pages_prepare+0x232/0x244
>   __free_pages_ok+0x1c/0x300
>   free_all_bootmem+0x13c/0x1b8
> BUG: Bad page state in process swapper  pfn:403b9
> page:9fdc8604 count:0 mapcount:1 mapping:  (null) index:0x0
> flags: 0x0()
> page dumped because: nonzero mapcount
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Tainted: G    B           4.4.0-rc7-next-20160104 #2
> 
> Stack Trace:
>   arc_unwind_core.constprop.1+0xa4/0x110
>   bad_page+0xda/0x120
>   free_pages_prepare+0x218/0x244
>   __free_pages_ok+0x1c/0x300
>   free_all_bootmem+0x13c/0x1b8
> BUG: Bad page state in process swapper  pfn:403ba
> page:9fdc8628 count:0 mapcount:1 mapping:  (null) index:0x0
> flags: 0x0()
> page dumped because: nonzero mapcount
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Tainted: G    B           4.4.0-rc7-next-20160104 #2
> 
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
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc
> 
