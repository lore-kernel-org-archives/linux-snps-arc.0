From: CARLOS.PALMINHA@synopsys.com (Carlos Palminha)
Date: Mon, 21 Dec 2015 18:30:09 +0000
Subject: ARC AXS101 problems with linux next-20151221
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56784531.1000007@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi guys,

I just compiled the kernel for axs101_defconfig based on linux next tag 'next-20151221'.
I can't boot it due to the following errors causing strange stack traces after freeing unused kernel memory (check log below).

Any clue?
Do you more info to understand the issue?

Regards,
C.Palminha


Welcome to the ARC Software Development Platform
axs101 login: mmc0: card b368 removed
mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz, actual 396825HZ div = 63)
mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 25000000Hz, actual 25000000HZ div = 1)
mmc0: new SD card at address b368
blk_queue_max_segment_size: set to minimum 8192
mmcblk0: mmc0:b368 SDC   1.83 GiB
 mmcblk0: p1


U-Boot 2015.10 (Nov 17 2015 - 19:28:48 +0100)

I2C:   ready
DRAM:  512 MiB
NAND:  512 MiB
MMC:   Synopsys Mobile storage: 0
In:    serial0 at e0022000
Out:   serial0 at e0022000
Err:   serial0 at e0022000
Net:   eth0: ethernet at e0018000
Hit any key to stop autoboot:  0
reading uImage
7285668 bytes read in 624 ms (11.1 MiB/s)
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-4.4.0-rc5-next-20151221
   Image Type:   ARC Linux Kernel Image (uncompressed)
   Data Size:    7285604 Bytes = 6.9 MiB
   Load Address: 80000000
   Entry Point:  800cc000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK

Starting kernel ...

Linux version 4.4.0-rc5-next-20151221 (palminha at palminha-vm) (gcc version 4.8.4 (Buildroot 2015.08.1) ) #2 PREEMPT Mon Dec 21 18:22:27 WET 2015
Memory @ 80000000 [512M]
Machine model: snps,axs101
earlycon: Early serial console at MMIO32 0xe0022000 (options '115200n8')
bootconsole [uart0] enabled
AXS: MainBoard v3 FPGA Date: 25-6-2015

IDENTITY        : ARCVER [0x34] ARCNUM [0x4] CHIPID [ 0x0]
processor [0]   : ARC 700 R4.10 (ARCompact ISA)
CPU speed       : 750.00 Mhz
Timers          : Timer0 Timer1
ISA Extn        : atomic
                : mpy norm barrel-shift swap minmax swape
BPU             : partial match, cache:512, Predict Table:512
MMU [v3]        : 8k PAGE, JTLB 512 (128x4), uDTLB 8, uITLB 4
I-Cache         : 32K, 2way/set, 32B Line, VIPT aliasing
D-Cache         : 32K, 4way/set, 32B Line, VIPT
Vector Table    : 0x80000000
Uncached Base   : 0xc0000000
FPU             : SP DP
DEBUG           : ActionPoint smaRT
OS ABI [v3]     : no-legacy-syscalls
CONFIG_ARC_FPU_SAVE_RESTORE needed for working apps
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65248
Kernel command line: earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0
PID hash table entries: 2048 (order: 0, 8192 bytes)
Dentry cache hash table entries: 65536 (order: 5, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 4, 131072 bytes)
Memory: 514288K/524288K available (4521K kernel code, 132K rwdata, 816K rodata, 928K init, 266K bss, 10000K reserved, 0K cma-reserved)
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Preemptible hierarchical RCU implementation.
        Build-time adjustment of leaf fanout to 32.
NR_IRQS:128
clocksource: ARC Timer1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 2548347262 ns
Console: colour dummy device 80x25
console [tty0] enabled
Calibrating delay loop... 743.83 BogoMIPS (lpj=3719168)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 2048 (order: 0, 8192 bytes)
Mountpoint-cache hash table entries: 2048 (order: 0, 8192 bytes)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
NET: Registered protocol family 16
irq: no irq domain found for /cpu_card/dw-apb-gpio at 0x2000/gpio-controller at 0 !
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
i2c_designware e001e000.i2c: Unknown Synopsys component type: 0x00000030
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti at linux.it>
PTP clock support registered
clocksource: Switched to clocksource ARC Timer1
NET: Registered protocol family 2
TCP established hash table entries: 4096 (order: 1, 16384 bytes)
TCP bind hash table entries: 4096 (order: 1, 16384 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
UDP hash table entries: 512 (order: 0, 8192 bytes)
UDP-Lite hash table entries: 512 (order: 0, 8192 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
ARC perf        : 8 counters (48 bits), 199 conditions
futex hash table entries: 256 (order: -2, 3072 bytes)
ntfs: driver 2.1.32 [Flags: R/O].
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
f0005000.dw-apb-uart: ttyS0 at MMIO 0xf0005000 (irq = 60, base_baud = 2083312) is a 16550A
e0020000.uart: ttyS1 at MMIO 0xe0020000 (irq = 35, base_baud = 2083333) is a 16550A
e0021000.uart: ttyS2 at MMIO 0xe0021000 (irq = 36, base_baud = 2083333) is a 16550A
console [ttyS3] disabled
e0022000.uart: ttyS3 at MMIO 0xe0022000 (irq = 37, base_baud = 2083333) is a 16550A
console [ttyS3] enabled
console [ttyS3] enabled
bootconsole [uart0] disabled
bootconsole [uart0] disabled
stmmaceth e0018000.ethernet: no reset control found
stmmac - user ID: 0x10, Synopsys ID: 0x37
 Ring mode enabled
 DMA HW capability register supported
 Normal descriptors
 RX Checksum Offload Engine supported (type 2)
 TX Checksum insertion supported
 Enable RX Mitigation via HW Watchdog Timer
stmmaceth e0018000.ethernet eth0: NO MDIO subnode
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-platform: EHCI generic platform driver
ehci-platform e0040000.ehci: EHCI Host Controller
ehci-platform e0040000.ehci: new USB bus registered, assigned bus number 1
ehci-platform e0040000.ehci: irq 33, io mem 0xe0040000
ehci-platform e0040000.ehci: USB 2.0 started, EHCI 1.00
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-platform: OHCI generic platform driver
ohci-platform e0060000.ohci: Generic Platform OHCI controller
ohci-platform e0060000.ohci: new USB bus registered, assigned bus number 2
ohci-platform e0060000.ohci: irq 33, io mem 0xe0060000
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
usbcore: registered new interface driver usb-storage
mousedev: PS/2 mouse device common for all mice
usbcore: registered new interface driver synaptics_usb
i2c /dev entries driver
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
Synopsys Designware Multimedia Card Interface Driver
dw_mmc e0015000.mmc: IDMAC supports 32-bit address mode.
dw_mmc e0015000.mmc: Using internal DMA controller.
dw_mmc e0015000.mmc: Version ID is 270a
dw_mmc e0015000.mmc: DW MMC controller at irq 34,32 bit host data width,16 deep fifo
dw_mmc e0015000.mmc: 1 slots initialized
sdhci-pltfm: SDHCI platform and OF driver helper
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
NET: Registered protocol family 17
NET: Registered protocol family 15
ttyS3 - failed to request DMA
Freeing unused kernel memory: 928K (80002000 - 800ea000)
INFO: rcu_preempt self-detected stall on CPU
        0-...: (2100 ticks this GP) idle=011/140000000000001/0 softirq=92/92 fqs=0
         (t=2100 jiffies g=-261 c=-262 q=60)
rcu_preempt kthread starved for 2100 jiffies! g4294967035 c4294967034 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x1
rcu_preempt     S 8053879e     0     7      2 0x00000000

Stack Trace:
  __switch_to+0x0/0x94
  __schedule+0x1c2/0x724
  schedule+0x2a/0x74
  schedule_timeout+0x126/0x198
  rcu_gp_kthread+0x5fa/0xee8
  kthread+0xe2/0xf4
  ret_from_fork+0x18/0x1c
Task dump for CPU 0:
kworker/0:1     R running      0    19      2 0x00000008
Workqueue: events_freezable mmc_rescan

Stack Trace:
  __switch_to+0x0/0x94
NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [kworker/0:1:19]
Modules linked in:
Path: (null)
CPU: 0 PID: 19 Comm: kworker/0:1 Not tainted 4.4.0-rc5-next-20151221 #2
Workqueue: events_freezable mmc_rescan
task: 9f0ce000 ti: 9f0d0000 task.ti: 9f0d0000

[ECR   ]: 0x0031abcd => Check Programmer's Manual
[EFA   ]: 0x00000000
[BLINK ]: arc_dma_map_sg+0x50/0xe4
[ERET  ]: arc_dma_map_page+0x5e/0x98
[STAT32]: 0x00000006 : K         E2 E1
BTA: 0x800f57c8  SP: 0x9f0d1d00  FP: 0x00000000
LPS: 0x80323e80 LPE: 0x80323e84 LPC: 0x00000000
r00: 0x9f04310c r01: 0x9ffeeda4 r02: 0x00001a40
r03: 0x00000040 r04: 0x00000002 r05: 0x9fdc0000
r06: 0x800f5794 r07: 0x00000000 r08: 0x23b345fc
r09: 0x00000000 r10: 0x00000007 r11: 0x00000000
r12: 0x00000000
NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [kworker/0:1:19]
Modules linked in:
Path: (null)
CPU: 0 PID: 19 Comm: kworker/0:1 Tainted: G             L  4.4.0-rc5-next-20151221 #2
Workqueue: events_freezable mmc_rescan
task: 9f0ce000 ti: 9f0d0000 task.ti: 9f0d0000

[ECR   ]: 0x0031abcd => Check Programmer's Manual
[EFA   ]: 0x00000000
[BLINK ]: arc_dma_map_sg+0x50/0xe4
[ERET  ]: arc_dma_map_page+0x3c/0x98
[STAT32]: 0x00000006 : K         E2 E1
BTA: 0x800f57c8  SP: 0x9f0d1cfc  FP: 0x00000000
LPS: 0x80323e80 LPE: 0x80323e84 LPC: 0x00000000
r00: 0x9f04310c r01: 0x0008bb69 r02: 0x1f0c3a40
r03: 0x00000040 r04: 0x00000002 r05: 0x9fdc0000
r06: 0x800f5794 r07: 0x00000000 r08: 0x23b345fc
r09: 0x00000000 r10: 0x00000007 r11: 0x00000000
r12: 0x00000000
random: nonblocking pool is initialized
INFO: rcu_preempt self-detected stall on CPU
        0-...: (8386 ticks this GP) idle=011/140000000000001/0 softirq=92/92 fqs=0
         (t=8403 jiffies g=-261 c=-262 q=60)
rcu_preempt kthread starved for 8403 jiffies! g4294967035 c4294967034 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x1
rcu_preempt     S 8053879e     0     7      2 0x00000000

Stack Trace:
  __switch_to+0x0/0x94
  __schedule+0x1c2/0x724
  schedule+0x2a/0x74
  schedule_timeout+0x126/0x198
  rcu_gp_kthread+0x5fa/0xee8
  kthread+0xe2/0xf4
  ret_from_fork+0x18/0x1c
Task dump for CPU 0:
kworker/0:1     R running      0    19      2 0x00000008
Workqueue: events_freezable mmc_rescan

Stack Trace:
  __switch_to+0x0/0x94
NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [kworker/0:1:19]
Modules linked in:
Path: (null)
CPU: 0 PID: 19 Comm: kworker/0:1 Tainted: G             L  4.4.0-rc5-next-20151221 #2
Workqueue: events_freezable mmc_rescan
task: 9f0ce000 ti: 9f0d0000 task.ti: 9f0d0000

[ECR   ]: 0x0031abcd => Check Programmer's Manual
[EFA   ]: 0x00000000
[BLINK ]: arc_dma_map_sg+0x50/0xe4
[ERET  ]: arc_dma_map_page+0x1c/0x98
[STAT32]: 0x00000006 : K         E2 E1
BTA: 0x800f5795  SP: 0x9f0d1d00  FP: 0x00000000
LPS: 0x80323e80 LPE: 0x80323e84 LPC: 0x00000000
r00: 0x9f04310c r01: 0x0008bb69 r02: 0x00001a40
r03: 0x00000040 r04: 0x00000002 r05: 0x9fdc0000
r06: 0x800f5794 r07: 0x00000000 r08: 0x23b345fc
r09: 0x00000000 r10: 0x00000007 r11: 0x00000000
r12: 0x00000000
NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [kworker/0:1:19]
Modules linked in:
Path: (null)
CPU: 0 PID: 19 Comm: kworker/0:1 Tainted: G             L  4.4.0-rc5-next-20151221 #2
Workqueue: events_freezable mmc_rescan
task: 9f0ce000 ti: 9f0d0000 task.ti: 9f0d0000

[ECR   ]: 0x0031abcd => Check Programmer's Manual
[EFA   ]: 0x00000000
[BLINK ]: arc_dma_map_sg+0x50/0xe4
[ERET  ]: arc_dma_map_page+0x8/0x98
[STAT32]: 0x00000006 : K         E2 E1
BTA: 0x800f5795  SP: 0x9f0d1d10  FP: 0x00000000
LPS: 0x80323e80 LPE: 0x80323e84 LPC: 0x00000000
r00: 0x9f04310c r01: 0x9ffeeda4 r02: 0x00001a40
r03: 0x00000040 r04: 0x00000002 r05: 0x9fdc0000
r06: 0x800f5794 r07: 0x00000000 r08: 0x23b345fc
r09: 0x00000000 r10: 0x00000007 r11: 0x00000000
r12: 0x00000000
INFO: rcu_preempt self-detected stall on CPU
        0-...: (14672 ticks this GP) idle=011/140000000000001/0 softirq=92/92 fqs=0
         (t=14706 jiffies g=-261 c=-262 q=60)
rcu_preempt kthread starved for 14706 jiffies! g4294967035 c4294967034 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x1
rcu_preempt     S 8053879e     0     7      2 0x00000000

Stack Trace:
  __switch_to+0x0/0x94
  __schedule+0x1c2/0x724
  schedule+0x2a/0x74
  schedule_timeout+0x126/0x198
  rcu_gp_kthread+0x5fa/0xee8
  kthread+0xe2/0xf4
  ret_from_fork+0x18/0x1c
Task dump for CPU 0:
kworker/0:1     R running      0    19      2 0x00000008
Workqueue: events_freezable mmc_rescan

Stack Trace:
  __switch_to+0x0/0x94
NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:1:19]
Modules linked in:
Path: (null)
CPU: 0 PID: 19 Comm: kworker/0:1 Tainted: G             L  4.4.0-rc5-next-20151221 #2
Workqueue: events_freezable mmc_rescan
task: 9f0ce000 ti: 9f0d0000 task.ti: 9f0d0000

[ECR   ]: 0x0031abcd => Check Programmer's Manual
[EFA   ]: 0x00000000
[BLINK ]: arc_dma_map_sg+0x50/0xe4
[ERET  ]: arc_dma_map_page+0x28/0x98
[STAT32]: 0x00000006 : K         E2 E1
BTA: 0x800f5795  SP: 0x9f0d1d00  FP: 0x00000000
LPS: 0x80323e80 LPE: 0x80323e84 LPC: 0x00000000
r00: 0x9f04310c r01: 0x0008bb69 r02: 0x00001a40
r03: 0x00000040 r04: 0x00000002 r05: 0x9fdc0000
r06: 0x800f5794 r07: 0x00000000 r08: 0x23b345fc
r09: 0x00000000 r10: 0x00000007 r11: 0x00000000
r12: 0x00000000
NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:1:19]
Modules linked in:
Path: (null)
CPU: 0 PID: 19 Comm: kworker/0:1 Tainted: G             L  4.4.0-rc5-next-20151221 #2
Workqueue: events_freezable mmc_rescan
task: 9f0ce000 ti: 9f0d0000 task.ti: 9f0d0000

[ECR   ]: 0x0031abcd => Check Programmer's Manual
[EFA   ]: 0x00000000
[BLINK ]: arc_dma_map_sg+0x50/0xe4
[ERET  ]: arc_dma_map_page+0x4e/0x98
[STAT32]: 0x00000006 : K         E2 E1
BTA: 0x800f57c8  SP: 0x9f0d1d00  FP: 0x00000000
LPS: 0x80323e80 LPE: 0x80323e84 LPC: 0x00000000
r00: 0x9f04310c r01: 0x0008bb69 r02: 0x00001a40
r03: 0x00000040 r04: 0x00000002 r05: 0x9fdc0000
r06: 0x800f5794 r07: 0x00000000 r08: 0x23b345fc
r09: 0x00000000 r10: 0x00000007 r11: 0x00000000
r12: 0x00000000
INFO: rcu_preempt self-detected stall on CPU
        0-...: (20958 ticks this GP) idle=011/140000000000001/0 softirq=92/92 fqs=0
         (t=21009 jiffies g=-261 c=-262 q=60)
rcu_preempt kthread starved for 21009 jiffies! g4294967035 c4294967034 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x1
rcu_preempt     S 8053879e     0     7      2 0x00000000

Stack Trace:
  __switch_to+0x0/0x94
  __schedule+0x1c2/0x724
  schedule+0x2a/0x74
  schedule_timeout+0x126/0x198
  rcu_gp_kthread+0x5fa/0xee8
  kthread+0xe2/0xf4
  ret_from_fork+0x18/0x1c
Task dump for CPU 0:
kworker/0:1     R running      0    19      2 0x00000008
Workqueue: events_freezable mmc_rescan

Stack Trace:
  __switch_to+0x0/0x94
