From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 4 Dec 2017 14:53:40 +0000
Subject: xf86-video-armada via UDL [was: Re: UDL's fbdev doesn't work
 for user-space apps]
In-Reply-To: <c6d06ae1-a30b-c358-6c12-317688d194a5@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
 <1512393408.4977.44.camel@synopsys.com>
 <c6d06ae1-a30b-c358-6c12-317688d194a5@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512399218.4977.48.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Mon, 2017-12-04@14:02 +0000, Jose Abreu wrote:
> On 04-12-2017 13:16, Alexey Brodkin wrote:
> > 
> > ????????Option??????????"kmsdev" "/dev/dri/card1"
> 
> Which drm driver uses /dev/dri/card0? I'm seing drmOpen code and
> if you don't specify the busID it will fallback for the first
> card that matches "armada-drm" or "imx-drm" or "udl".
> 
> > 
> > But if I swap "imx-drm" to "udl" I don't see anything on my screen
> > (connected via UDL) even though Xserver seems to really start claiming the screen
> > (so I see it becomes black, effectively overriding whatever was there before) and
> > glmark benchmark prints results.
> > 
> > 
> 
> Xorg.log can help confirm if everything is ok.

That's xorg.conf:
------------------------------->8------------------------------
# cat /etc/X11/xorg.conf?
Section "Device"
????????Identifier??????"Driver0"
????????Screen??????????0
????????Driver??????????"armada"

# Support hotplugging displays?
????????Option??????????"Hotplug"???????"TRUE"

# Support hardware cursor if available?
????????Option??????????"HWCursor"??????"TRUE"

# Use GPU acceleration?
????????Option??????????"UseGPU"????????"TRUE"

# Provide Xv interfaces?
????????Option??????????"XvAccel"???????"TRUE"

# Prefer overlay for Xv (TRUE for armada-drm, FALSE for imx-drm)
????????Option??????????"XvPreferOverlay" "TRUE"

# Which accelerator module to load (automatically found if commented out)
????????Option??????????"AccelModule"???"etnadrm_gpu"
????????Option??????????"AccelModule"???"etnaviv_gpu"

# Support DRI2 interfaces?
????????Option??????????"DRI"???????????"TRUE"
EndSection
------------------------------->8------------------------------

Full log you may find below.

-Alexey


Linux version 4.14.2-00008-g95be6f762b7f-dirty (abrodkin at abrodkin-7440l) (gcc version 7.1.1 20170710 (ARCv2 ISA Linux uClibc toolchain 2017.09-rc1))
#68 SMP PREEMPT Mon Dec 4 16:12:46 MSK 2017
Memory @ 80000000 [1024M]?
OF: fdt: Machine model: snps,hsdk
earlycon: uart8250 at MMIO32 0xf0005000 (options '115200n8')
bootconsole [uart8250] enabled
archs-intc??????: 2 priority levels (default 1) FIRQ (not used)

IDENTITY????????: ARCVER [0x52] ARCNUM [0x0] CHIPID [ 0x0]
processor [0]???: ARC HS38 R2.1 (ARCv2 ISA)?
Timers??????????: Timer0 Timer1 RTC [UP 64-bit] GFRC [SMP 64-bit]?
ISA Extn????????: atomic ll64 unalign (not used)
????????????????: mpy[opt 9] div_rem norm barrel-shift swap minmax swape
BPU?????????????: full match, cache:2048, Predict Table:16384
MMU [v4]????????: 8k PAGE, 2M Super Page (not used) JTLB 1024 (256x4), uDTLB 8, uITLB 4, PAE40 (not used)?
I-Cache?????????: 64K, 4way/set, 64B Line, VIPT aliasing
D-Cache?????????: 64K, 2way/set, 64B Line, PIPT
SLC?????????????: 512K, 128B Line
Peripherals?????: 0xf0000000, IO-Coherency (disabled)?
Vector Table????: 0x90000000
FPU?????????????: SP DP?
DEBUG???????????: ActionPoint smaRT RTT?
OS ABI [v4]?????: 64-bit data any register aligned
Extn [SMP]??????: ARConnect (v2): 4 cores with IPI IDU DEBUG GFRC
Enable CONFIG_ARC_HAS_ACCL_REGS for working apps
On node 0 totalpages: 131072
free_area_init_node: node 0, pgdat 91cf1080, node_mem_map bfb80000
? Normal zone: 576 pages used for memmap
? Normal zone: 0 pages reserved
? Normal zone: 131072 pages, LIFO batch:15
random: fast init done
percpu: Embedded 7 pages/cpu @bfb1c000 s25088 r8192 d24064 u57344
pcpu-alloc: s25088 r8192 d24064 u57344 alloc=7*8192
pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3?
Built 1 zonelists, mobility grouping on.??Total pages: 130496
Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1 drm.debug=0x1e
PID hash table entries: 4096 (order: 1, 16384 bytes)
Dentry cache hash table entries: 131072 (order: 6, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 5, 262144 bytes)
Memory: 749864K/1048576K available (5319K kernel code, 270K rwdata, 1048K rodata, 23040K init, 293K bss, 298712K reserved, 0K cma-reserved)
Preemptible hierarchical RCU implementation.
????????Tasks RCU enabled.
NR_IRQS: 512
MCIP: IDU supports 64 common irqs
clocksource: ARConnect GFRC: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
Console: colour dummy device 80x25
Calibrating delay loop... 996.14 BogoMIPS (lpj=4980736)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 2048 (order: 0, 8192 bytes)
Mountpoint-cache hash table entries: 2048 (order: 0, 8192 bytes)
Hierarchical SRCU implementation.
smp: Bringing up secondary CPUs ...
Idle Task [1] bf04da80
Trying to bring up CPU1 ...
archs-intc??????: 2 priority levels (default 1) FIRQ (not used)

IDENTITY????????: ARCVER [0x52] ARCNUM [0x1] CHIPID [ 0x0]
processor [1]???: ARC HS38 R2.1 (ARCv2 ISA)?
Timers??????????: Timer0 Timer1 RTC [UP 64-bit]?
ISA Extn????????: atomic ll64 unalign (not used)
????????????????: mpy[opt 9] div_rem norm barrel-shift swap minmax swape
BPU?????????????: full match, cache:2048, Predict Table:16384
MMU [v4]????????: 8k PAGE, 2M Super Page (not used) JTLB 1024 (256x4), uDTLB 8, uITLB 4, PAE40 (not used)?
I-Cache?????????: 64K, 4way/set, 64B Line, VIPT aliasing
D-Cache?????????: 64K, 2way/set, 64B Line, PIPT
SLC?????????????: 512K, 128B Line
Peripherals?????: 0xf0000000, IO-Coherency (disabled)?
Vector Table????: 0x90000000
FPU?????????????: SP DP?
DEBUG???????????: ActionPoint smaRT RTT?
Extn [CCM]??????: DCCM @ 80000000, 256 KB / ICCM: @ 70000000, 256 KB
OS ABI [v4]?????: 64-bit data any register aligned
Extn [SMP]??????: ARConnect (v2): 4 cores with IPI IDU DEBUG GFRC
Enable CONFIG_ARC_HAS_ACCL_REGS for working apps
## CPU1 LIVE ##: Executing Code...
Idle Task [2] bf04d540
Trying to bring up CPU2 ...
archs-intc??????: 2 priority levels (default 1) FIRQ (not used)

IDENTITY????????: ARCVER [0x52] ARCNUM [0x2] CHIPID [ 0x0]
processor [2]???: ARC HS38 R2.1 (ARCv2 ISA)?
Timers??????????: Timer0 Timer1 RTC [UP 64-bit]?
ISA Extn????????: atomic ll64 unalign (not used)
????????????????: mpy[opt 9] div_rem norm barrel-shift swap minmax swape
BPU?????????????: full match, cache:2048, Predict Table:16384
MMU [v4]????????: 8k PAGE, 2M Super Page (not used) JTLB 1024 (256x4), uDTLB 8, uITLB 4, PAE40 (not used)?
I-Cache?????????: 64K, 4way/set, 64B Line, VIPT aliasing
D-Cache?????????: 64K, 2way/set, 64B Line, PIPT
SLC?????????????: 512K, 128B Line
Peripherals?????: 0xf0000000, IO-Coherency (disabled)?
Vector Table????: 0x90000000
FPU?????????????: SP DP?
DEBUG???????????: ActionPoint smaRT RTT?
OS ABI [v4]?????: 64-bit data any register aligned
Extn [SMP]??????: ARConnect (v2): 4 cores with IPI IDU DEBUG GFRC
Enable CONFIG_ARC_HAS_ACCL_REGS for working apps
## CPU2 LIVE ##: Executing Code...
Idle Task [3] bf04d000
Trying to bring up CPU3 ...
archs-intc??????: 2 priority levels (default 1) FIRQ (not used)

IDENTITY????????: ARCVER [0x52] ARCNUM [0x3] CHIPID [ 0x0]
processor [3]???: ARC HS38 R2.1 (ARCv2 ISA)?
Timers??????????: Timer0 Timer1 RTC [UP 64-bit]?
ISA Extn????????: atomic ll64 unalign (not used)
????????????????: mpy[opt 9] div_rem norm barrel-shift swap minmax swape
BPU?????????????: full match, cache:2048, Predict Table:16384
MMU [v4]????????: 8k PAGE, 2M Super Page (not used) JTLB 1024 (256x4), uDTLB 8, uITLB 4, PAE40 (not used)?
I-Cache?????????: 64K, 4way/set, 64B Line, VIPT aliasing
D-Cache?????????: 64K, 2way/set, 64B Line, PIPT
SLC?????????????: 512K, 128B Line
Peripherals?????: 0xf0000000, IO-Coherency (disabled)?
Vector Table????: 0x90000000
FPU?????????????: SP DP?
DEBUG???????????: ActionPoint smaRT RTT?
Extn [CCM]??????: DCCM @ 80000000, 256 KB / ICCM: @ 70000000, 256 KB
OS ABI [v4]?????: 64-bit data any register aligned
Extn [SMP]??????: ARConnect (v2): 4 cores with IPI IDU DEBUG GFRC
Enable CONFIG_ARC_HAS_ACCL_REGS for working apps
## CPU3 LIVE ##: Executing Code...
smp: Brought up 1 node, 4 CPUs
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 1024 (order: 3, 65536 bytes)
NET: Registered protocol family 16
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti at linux.it>
PTP clock support registered
clocksource: Switched to clocksource ARConnect GFRC
NET: Registered protocol family 2
TCP established hash table entries: 8192 (order: 2, 32768 bytes)
TCP bind hash table entries: 8192 (order: 3, 65536 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
UDP hash table entries: 512 (order: 1, 16384 bytes)
UDP-Lite hash table entries: 512 (order: 1, 16384 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
ARC perf????????: 8 counters (48 bits), 113 conditions
workingset: timestamp_bits=30 max_order=17 bucket_order=0
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
io scheduler mq-deadline registered
io scheduler kyber registered
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
console [ttyS0] disabled
f0005000.serial: ttyS0 at MMIO 0xf0005000 (irq = 6, base_baud = 2083125) is a 16550A
console [ttyS0] enabled
console [ttyS0] enabled
bootconsole [uart8250] disabled
bootconsole [uart8250] disabled
usbcore: registered new interface driver udl
etnaviv soc:gpu-subsystem: bound f0090000.gpu (ops 0x91be058c)
etnaviv-gpu f0090000.gpu: model: GC880, revision: 5124
[drm] Initialized etnaviv 1.1.0 20151214 for soc:gpu-subsystem on minor 0
libphy: Fixed MDIO Bus: probed
stmmaceth f0008000.ethernet: PTP uses main clock
stmmac - user ID: 0x10, Synopsys ID: 0x37
stmmaceth f0008000.ethernet: Ring mode enabled
stmmaceth f0008000.ethernet: DMA HW capability register supported
stmmaceth f0008000.ethernet: Normal descriptors
stmmaceth f0008000.ethernet: RX Checksum Offload Engine supported
stmmaceth f0008000.ethernet: COE Type 2
stmmaceth f0008000.ethernet: TX Checksum insertion supported
stmmaceth f0008000.ethernet: Enable RX Mitigation via HW Watchdog Timer
libphy: stmmac: probed
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-platform: EHCI generic platform driver
ehci-platform f0040000.ehci: EHCI Host Controller
ehci-platform f0040000.ehci: new USB bus registered, assigned bus number 1
ehci-platform f0040000.ehci: irq 15, io mem 0xf0040000
ehci-platform f0040000.ehci: USB 2.0 started, EHCI 1.00
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-platform: OHCI generic platform driver
ohci-platform f0060000.ohci: Generic Platform OHCI controller
ohci-platform f0060000.ohci: new USB bus registered, assigned bus number 2
ohci-platform f0060000.ohci: irq 15, io mem 0xf0060000
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
usbcore: registered new interface driver usb-storage
IR NEC protocol handler initialized
IR RC5(x/sz) protocol handler initialized
IR RC6 protocol handler initialized
IR JVC protocol handler initialized
IR Sony protocol handler initialized
IR SANYO protocol handler initialized
IR Sharp protocol handler initialized
IR MCE Keyboard/mouse protocol handler initialized
IR XMP protocol handler initialized
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
Synopsys Designware Multimedia Card Interface Driver
dw_mmc f000a000.mmc: 'num-slots' was deprecated.
dw_mmc f000a000.mmc: IDMAC supports 32-bit address mode.
dw_mmc f000a000.mmc: Using internal DMA controller.
dw_mmc f000a000.mmc: Version ID is 290a
dw_mmc f000a000.mmc: DW MMC controller at irq 12,32 bit host data width,16 deep fifo
mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 400000Hz, actual 396825HZ div = 63)
sdhci-pltfm: SDHCI platform and OF driver helper
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
NET: Registered protocol family 10
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
ttyS0 - failed to request DMA
Freeing unused kernel memory: 23040K
This architecture does not have kernel memory protection.
Starting logging: OK
Initializing random number generator... done.
Starting network: stmmaceth f0008000.ethernet eth0: device MAC address a6:6c:7e:40:c6:86
mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 25000000Hz, actual 25000000HZ div = 1)
usb 1-1: new high-speed USB device number 2 using ehci-platform
mmc0: new SDHC card at address aaaa
blk_queue_max_segment_size: set to minimum 8192
mmcblk0: mmc0:aaaa SL08G 7.40 GiB?
?mmcblk0: p1 p2
Micrel KSZ9031 Gigabit PHY stmmac-0:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=stmmac-0:00, irq=POLL)
stmmaceth f0008000.ethernet eth0: PTP not supported by HW
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
udhcpc: started, v1.27.2
udhcpc: sending discover
hub 1-1:1.0: USB hub found
hub 1-1:1.0: 2 ports detected
usb 1-1.1: new high-speed USB device number 3 using ehci-platform
[drm] vendor descriptor length:2e data:2e 5f 01 00 2c 00 04 04 01 00 03
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
[drm] Initialized udl 0.0.1 20120220 for 1-1.1:1.0 on minor 1
[drm] Initialized udl on minor 1
stmmaceth f0008000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

udhcpc: sending discover


udhcpc: sending discover
udhcpc: sending select for 10.42.0.122
udhcpc: lease of 10.42.0.122 obtained, lease time 3600
deleting routers
adding dns 10.42.0.1
OK

Welcome to the ARC Software Development Platform
axs103 login: root
# cat /etc/X11/xorg.conf?
Section "Device"
????????Identifier??????"Driver0"
????????Screen??????????0
????????Driver??????????"armada"

# Support hotplugging displays?
????????Option??????????"Hotplug"???????"TRUE"

# Support hardware cursor if available?
????????Option??????????"HWCursor"??????"TRUE"

# Use GPU acceleration?
????????Option??????????"UseGPU"????????"TRUE"

# Provide Xv interfaces?
????????Option??????????"XvAccel"???????"TRUE"

# Prefer overlay for Xv (TRUE for armada-drm, FALSE for imx-drm)
????????Option??????????"XvPreferOverlay" "TRUE"

# Which accelerator module to load (automatically found if commented out)
????????Option??????????"AccelModule"???"etnadrm_gpu"
????????Option??????????"AccelModule"???"etnaviv_gpu"

# Support DRI2 interfaces?
????????Option??????????"DRI"???????????"TRUE"
EndSection

# X&
#?
X.Org X Server 1.19.5
Release Date: 2017-10-12
X Protocol Version 11, Revision 0
Build Operating System: Linux 3.10.0-514.el7.x86_64 x86_64?
Current Operating System: Linux axs1[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:30:DVI-I-1]
03 4.14.2-00008-g95be6f762b7f-di[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:30:DVI-I-1] status updated from unknown to connected
rty #68 SMP PREEMPT Mon Dec 4 16:12:46 MSK 2017 arc
Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1 drm.debug=0x1e
Build Date: 01 December 2017??12:21:28PM
?
Current version of pixman: 0.34.0
????????Before reporting problems, check http://wiki.x.org
????????to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
????????(++) from command line, (!!) notice, (II) informational,
????????(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:30:DVI-I-1] probed modes :
var/log/Xorg.0.log", Time: Thu J[drm:drm_mode_debug_printmodeline] Modeline 32:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x48 0x5
an??1 00:00:30 1970
(==) Using [drm:drm_mode_debug_printmodeline] Modeline 39:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40 0x5
config file: "/etc/X11/xorg.conf[drm:drm_mode_debug_printmodeline] Modeline 34:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40 0x5
"
(==) Using system config dire[drm:drm_mode_debug_printmodeline] Modeline 33:"1152x864" 75 108000 1152 1216 1344 1600 864 865 868 900 0x40 0x5
ctory "/usr/share/X11/xorg.conf.[drm:drm_mode_debug_printmodeline] Modeline 40:"1024x768" 75 78750 1024 1040 1136 1312 768 769 772 800 0x40 0x5
d"
[drm:drm_mode_debug_printmodeline] Modeline 41:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[drm:drm_mode_debug_printmodeline] Modeline 42:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[drm:drm_mode_debug_printmodeline] Modeline 35:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[drm:drm_mode_debug_printmodeline] Modeline 36:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[drm:drm_mode_debug_printmodeline] Modeline 37:"640x480" 60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[drm:drm_mode_debug_printmodeline] Modeline 38:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:30:DVI-I-1]
[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:30:DVI-I-1] probed modes :
[drm:drm_mode_debug_printmodeline] Modeline 32:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x48 0x5
[drm:drm_mode_debug_printmodeline] Modeline 39:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40 0x5
[drm:drm_mode_debug_printmodeline] Modeline 34:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40 0x5
[drm:drm_mode_debug_printmodeline] Modeline 33:"1152x864" 75 108000 1152 1216 1344 1600 864 865 868 900 0x40 0x5
[drm:drm_mode_debug_printmodeline] Modeline 40:"1024x768" 75 78750 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[drm:drm_mode_debug_printmodeline] Modeline 41:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[drm:drm_mode_debug_printmodeline] Modeline 42:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[drm:drm_mode_debug_printmodeline] Modeline 35:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[drm:drm_mode_debug_printmodeline] Modeline 36:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[drm:drm_mode_debug_printmodeline] Modeline 37:"640x480" 60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[drm:drm_mode_debug_printmodeline] Modeline 38:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[drm:udl_drm_gem_mmap] flags = 0x1
[drm:drm_mode_addfb] [FB:31]
[drm:drm_mode_setcrtc] [CRTC:28:crtc-0]
[drm:drm_mode_setcrtc] [CONNECTOR:30:DVI-I-1]
[drm:drm_crtc_helper_set_config]?
[drm:drm_crtc_helper_set_config] [CRTC:28:crtc-0] [FB:31] #connectors=1 (x y) (0 0)
[drm:drm_crtc_helper_set_config] crtc has no fb, full mode set
[drm:drm_crtc_helper_set_config] modes are different, full mode set
[drm:drm_mode_debug_printmodeline] Modeline 0:"" 0 0 0 0 0 0 0 0 0 0 0x0 0x0
[drm:drm_mode_debug_printmodeline] Modeline 44:"" 0 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x0 0x5
[drm:drm_crtc_helper_set_config] encoder changed, full mode switch
[drm:drm_crtc_helper_set_config] crtc changed, full mode switch
[drm:drm_crtc_helper_set_config] [CONNECTOR:30:DVI-I-1] to [CRTC:28:crtc-0]
[drm:drm_crtc_helper_set_config] attempting to set mode from userspace
[drm:drm_mode_debug_printmodeline] Modeline 44:"" 0 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x0 0x5
[drm:drm_crtc_helper_set_mode] [CRTC:28:crtc-0]
[drm:drm_crtc_helper_set_mode] [ENCODER:29:TMDS-29] set [MODE:44:]
[drm] write mode info 153
[drm:drm_crtc_helper_set_config] Setting connector DPMS state to on
[drm:drm_crtc_helper_set_config]????????[CONNECTOR:30:DVI-I-1] set DPMS on
[drm:udl_attach_dma_buf] [DEV:soc:gpu-subsystem] size:8298496
[drm:udl_map_dma_buf] [DEV:soc:gpu-subsystem] size:8298496 dir=0
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
cmd 00000000: 380000c8 00000000 40000002 00000000
...
cmd 00000130: 48000000 00000701 08010e01 00000040
stream link to 0x00000050 @ 0x00002000 71042000
cmd 00000000: 08010e03 00000008 08010e02 00000701
...
cmd 000000b0: 40000007 00000050
link op: 71040000
addr: 0x00000010
back: 0x00000050
event: 0
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
cmd 00000000: 40000008 00000010 40000002 00000000
...
cmd 00000130: 48000000 00000701 08010e01 00000040

#?
# export DISPLAY=:0
# glmark2-es2random: crng init done

=======================================================
????glmetnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
ark2 2014.03
==================cmd 00000000: 40000008 00000010 40000002 00000000
================================cmd 00000010: 08010061 00000118 08010e02 00000701
=====
????OpenGL Information
?cmd 00000020: 48000000 00000701 08010e03 00000000
???GL_VENDOR:?????etnaviv
????Gcmd 00000030: 08010e02 00000701 48000000 00000701
L_RENDERER:???Vivante GC880 rev cmd 00000040: 08010e00 00000001 40000017 00002000
5124
????GL_VERSION:????OpenGL cmd 00000050: 08010e03 00000008 08010e02 00000701
ES 2.0 Mesa 17.2.4
============cmd 00000060: 48000000 00000701 08010e01 00000040
================================cmd 00000070: 380000c8 00000701 40000002 00000070
===========
cmd 00000080: 40000013 00002000 40000002 00000080
...
cmd 00000130: 48000000 00000701 08010e01 00000040
stream link to 0x000000c0 @ 0x00002000 71042000
cmd 00000000: 08010e13 00000000 08010e05 00000001
...
cmd 00000110: 40000007 000000c0
link op: 71040070
addr: 0x00000080
back: 0x000000c0
event: 0
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
etnaviv-gpu f0090000.gpu: MMU fault status 0x00002000
etnaviv-gpu f0090000.gpu: MMU 0 fault addr 0x00000000
etnaviv-gpu f0090000.gpu: MMU 1 fault addr 0x00000000
etnaviv-gpu f0090000.gpu: MMU 2 fault addr 0x00000000
etnaviv-gpu f0090000.gpu: MMU 3 fault addr 0x0082a000
cmd 00000000: 40000008 00000010 40000002 00000000
...
cmd 00000130: 48000000 00000701 08010e01 00000040
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
cmd 00000000: 40000008 00000010 40000002 00000000
...
cmd 00000130: 48000000 00000701 08010e01 00000040
stream link to 0x000000f8 @ 0x00003000 71043000
cmd 00000000: 08010e13 00000000 08010e05 00000001
cmd 00000010: 08010382 00000031 0801028b 34000001
cmd 00000020: 080105ae 00000000 40000007 000000f8
link op: 710400e8
addr: 0x00003000
back: 0x000000f8
event: 1
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
cmd 00000000: 40000008 00000010 40000002 00000000
...
cmd 00000130: 48000000 00000701 08010e01 00000040
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
cmd 00000000: 40000008 00000010 40000002 00000000
...
cmd 00000130: 48000000 00000701 08010e01 00000040
stream link to 0x00000170 @ 0x00004000 71044000
cmd 00000000: 0804048a 00040000 00001e00 00000000
...
cmd 00000090: 40000007 00000170
link op: 71040120
addr: 0x00000130
back: 0x00000170
event: 2
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
cmd 00000000: 40000008 00000010 40000002 00000000
...
cmd 00000130: 08010061 00000118 08010e02 00000701
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
cmd 00000000: 40000008 00000010 40000002 00000000
...
cmd 00000130: 08010061 00000118 08010e02 00000701
stream link to 0x000001e0 @ 0x00005000 71045000
cmd 00000000: 08010e13 00000000 08010e05 00000001
cmd 00000010: 08010382 00000031 0801028b 34000001
cmd 00000020: 080105ae 00000000 40000007 000001e0
link op: 71040190
addr: 0x000001a0
back: 0x000001e0
event: 3
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
cmd 00000000: 40000008 00000010 40000002 00000000
...
cmd 00000130: 08010061 00000118 08010e02 00000701
[build] use-vbo=false:etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
cmd 00000000: 40000008 00000010 40000002 00000000
...

^C??<-- Ctrl-C

# [drm:udl_drm_gem_mmap] flags = 0x1
[drm:drm_mode_addfb] [FB:31]
[drm:drm_mode_setcrtc] [CRTC:28:crtc-0]
[drm:drm_mode_setcrtc] [CONNECTOR:30:DVI-I-1]
[drm:drm_crtc_helper_set_config]?
[drm:drm_crtc_helper_set_config] [CRTC:28:crtc-0] [FB:31] #connectors=1 (x y) (0 0)
[drm:drm_crtc_helper_set_config] crtc has no fb, full mode set
[drm:drm_crtc_helper_set_config] connector dpms not on, full mode switch
[drm:drm_crtc_helper_set_config] encoder changed, full mode switch
[drm:drm_crtc_helper_set_config] crtc changed, full mode switch
[drm:drm_crtc_helper_set_config] [CONNECTOR:30:DVI-I-1] to [CRTC:28:crtc-0]
[drm:drm_crtc_helper_set_config] attempting to set mode from userspace
[drm:drm_mode_debug_printmodeline] Modeline 44:"" 0 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x0 0x5
[drm:drm_crtc_helper_set_mode] [CRTC:28:crtc-0]
[drm:drm_crtc_helper_set_mode] [ENCODER:29:TMDS-29] set [MODE:44:]
[drm] write mode info 153
[drm:drm_crtc_helper_set_config] Setting connector DPMS state to on
[drm:drm_crtc_helper_set_config]????????[CONNECTOR:30:DVI-I-1] set DPMS on
[drm] write mode info 153
[drm:udl_attach_dma_buf] [DEV:soc:gpu-subsystem] size:8298496
[drm:udl_map_dma_buf] [DEV:soc:gpu-subsystem] size:8298496 dir=0
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
