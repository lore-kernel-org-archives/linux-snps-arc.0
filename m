From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Fri, 23 Jun 2017 00:16:12 +0200
Subject: uclibc test suite with gnu 2017.03 (was Re: [Fwd: Re: nsim
 latest free version])
In-Reply-To: <90e5eb43-8912-cb2f-fe72-9b385398f232@synopsys.com>
References: <20170622144201.GN26922@waldemar-brodkorb.de>
 <1498152714.13700.63.camel@synopsys.com>
 <90e5eb43-8912-cb2f-fe72-9b385398f232@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170622221612.GQ26922@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,
Vineet Gupta wrote,

> Hi Waldemar,
> 
> >>Hi Waldemar,
> >>
> >>On Wed, 2017-06-21@21:16 +0200, Waldemar Brodkorb wrote:
> >>>Hi Alexey,
> >>>
> >>>I have some issues lately running the testsuite in NSIM.
> >>>Is there may be some new version available?
> >>>How I can get an updated version?
> >>Let me check with our nSIM devs.
> >>But could you please elaborate a bit what is your problem?
> >It stalls / deadlocks here:
> >PASS tst-cancel23
> >FAIL tst-cancel25 got 1 expected 0
> >         Timed out: killed the child process
> >PASS tst-cancel3
> >FAIL tst-cancel4 got 1 expected 0
> >         Timed out: killed the child process
> >.... tst-cancel5
> >
> >Seems to happen since the toolchain update to 2017.03
> >(binutils/gcc). ARCv2 little endian started with the old script:
> >https://urldefense.proofpoint.com/v2/url?u=https-3A__cgit.openadk.org_cgi_cgit_openadk.git_tree_scripts_nsim.sh&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lq
> >deeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=8GRVuMbTElbNMAj_Fn7DTePw5-sVRsJ3lki2x-ofbzo&s=l2eNCzqvmvtPr63NgA0Uv-t7ze5J0eJeAq9ZcsDgu_Y&e=
> >
> >With attached uClibc-ng.config.
> 
> Can you please provide the full boot log  if possible - I could successfully
> run the "old" test suite with 2017.03 !
> 
> Also I presume there's no real evidence to attribute this is an nSIM issue -
> it could very well be a Linux kernel or tools issue.
> Can you share your vmlinux which we can try on nsim here !

Kernel+initramfs can be downloaded here:
https://debug.openadk.org/arc/nsim-arcv2-initramfspiggyback-kernel

Last lines of strace:
[pid   228] setrlimit(RLIMIT_CORE, {rlim_cur=0, rlim_max=0}) = 0
[pid   228] setpgid(0, 0)               = 0
[pid   228] socketpair(AF_UNIX, SOCK_STREAM, 1, [3, 4]) = 0
[pid   228] setsockopt(4, SOL_SOCKET, SO_SNDBUF, [1], 4) = 0
[pid   228] getsockopt(4, SOL_SOCKET, SO_SNDBUF, [4480], [4]) = 0
[pid   228] setsockopt(4, SOL_SOCKET, SO_SNDBUF, [4480], 4) = 0
[pid   228] mmap2(NULL, 2097152, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0) = 0x20082000
[pid   228] mprotect(0x20082000, 8192, PROT_NONE) = 0
[pid   228] clone(child_stack=0x202810e8,
flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID,
parent_tidptr=0x20281590, tls=0x20281968, child_tidptr=0x20281590) =
229
strace: Process 229 attached
[pid   229] set_robust_list(0x20281594, 12) = 0
[pid   229] futex(0x181e8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
[pid   229] read(3,  <unfinished ...>
[pid   228] futex(0x181e8, FUTEX_WAIT_PRIVATE, 0, NULL) = -1 EAGAIN
(Resource temporarily unavailable)
[pid   228] nanosleep({tv_sec=0, tv_nsec=100000000}, 0x5fa27d9c) = 0
[pid   228] openat(AT_FDCWD, "/usr/lib/libgcc_s.so.1", O_RDONLY) =
-1 ENOENT (No such file or directory)
[pid   228] openat(AT_FDCWD, "/usr/lib/libgcc_s.so.1", O_RDONLY) =
-1 ENOENT (No such file or directory)
[pid   228] openat(AT_FDCWD, "/lib//libgcc_s.so.1", O_RDONLY) = 5
[pid   228] fstat64(5, {st_mode=S_IFREG|0644, st_size=50740, ...}) =
0
[pid   228] mmap2(NULL, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0x2000c000
[pid   228] read(5,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\303\0\1\0\0\0@
\0\0004\0\0\0"..., 8192) = 8192
[pid   228] mmap2(NULL, 65536, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x20282000
[pid   228] mmap2(0x20282000, 42156, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED, 5, 0) = 0x20282000
[pid   228] mmap2(0x2028e000, 8520, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 5, 0xa000) = 0x2028e000
[pid   228] close(5)                    = 0
[pid   228] munmap(0x2000c000, 8192)    = 0
[pid   228] mprotect(0x2028e000, 8192, PROT_READ) = 0
[pid   228] getpid()                    = 228
[pid   228] tgkill(228, 229, SIGRTMIN <unfinished ...>
[pid   229] <... read resumed> 0x20281014, 100) = ? ERESTARTSYS (To
be restarted if SA_RESTART is set)
[pid   229] --- SIGRTMIN {si_signo=SIGRTMIN, si_code=SI_TKILL,
si_pid=228, si_uid=0} ---
[pid   229] getpid()                    = 228
[pid   229] futex(0x20290168, FUTEX_WAKE_PRIVATE, 2147483647) = 0
[pid   228] <... tgkill resumed> )      = 0
[pid   228] futex(0x20281590, FUTEX_WAIT, 229, NULL

Seems a deadlock, I can stop the test with ctrl-c.

I do not see this issue on other architectures.
See https://tests.embedded-test.org/uClibc-ng/1.0.25/

Dmesg:
uname -a
Linux openadk 4.9.32-1 #4 Thu Jun 22 22:42:15 CEST 2017 arc GNU/Linux
dmroot at openadk:/ # dmesg
[    0.000000] Linux version 4.9.32-1 (wbx at vopenadk) (gcc version 6.3.0 (GCC) ) #4 Thu Jun 22 22:42:15 CEST 2017
[    0.000000] Memory @ 80000000 [512M]
[    0.000000] Memory @ 100000000 [1024M] Not used
[    0.000000] OF: fdt:Machine model: snps,nsim_hs
[    0.000000] earlycon: arc_uart0 at MMIO32 0xc0fc1000 (options '115200n8')
[    0.000000] bootconsole [arc_uart0] enabled
[    0.000000] archs-intc       : 15 priority levels (default 14)
[    0.000000]   
[    0.000000] IDENTITY : ARCVER [0x51] ARCNUM [0x0] CHIPID [0xffff]
[    0.000000] processor [0]    : ARC HS38 R2.0 (ARCv2 ISA)
[    0.000000] Timers           : Timer0 Timer1
[    0.000000] ISA Extn : atomic (not used) ll64 (not used) unalign (not used)
[    0.000000]          : mpy[opt 9] div_rem norm barrel-shift swap minmax swape(not used)
[    0.000000] BPU              : partial match, cache:2048, Predict Table:16384
[    0.000000] MMU [v4] : 8k PAGE, 2M Super Page (not used) JTLB 512 (128x4), uDTLB 8, uITLB 4
[    0.000000] I-Cache          : 32K, 4way/set, 64B Line, VIPT(not used)
[    0.000000] D-Cache          : 16K, 2way/set, 64B Line, PIPT(not used)
[    0.000000] Peripherals      : 0xc0000000
[    0.000000] Vector Table     : 0x80000000
[    0.000000] DEBUG            : ActionPoint
[    0.000000] OS ABI [v4]      : 64-bit data any register aligned
[    0.000000] On node 0 totalpages: 65536
[    0.000000] free_area_init_node: node 0, pgdat 802d2f20, node_mem_map 9fdc0000
[    0.000000]   Normal zone: 288 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 65536 pages, LIFO batch:15
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65248
[    0.000000] Kernel command line: earlycon=arc_uart,mmio32,0xc0fc1000,115200n8 console=ttyARC0,115200n8
[    0.000000] PID hash table entries: 2048 (order: 0, 8192 bytes)
[    0.000000] Dentry cache hash table entries: 65536 (order: 5, 262144 bytes)
[    0.000000] Inode-cache hash table entries: 32768 (order: 4, 131072 bytes)
[    0.000000] Memory: 518424K/524288K available (1176K kernel code, 79K rwdata, 240K rodata, 1400K init, 225K bss, 5864K reserved, 0K
cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:128
[    0.000000] clocksource: ARC Timer1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 23890755578 ns
[    0.070000] Calibrating delay loop... 159.12 BogoMIPS (lpj=795648)
[    0.080000] pid_max: default: 4096 minimum: 301
[    0.080000] Mount-cache hash table entries: 2048 (order: 0, 8192 bytes)
[    0.080000] Mountpoint-cache hash table entries: 2048 (order: 0, 8192 bytes)
[    0.080000] devtmpfs: initialized
[    0.090000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.090000] futex hash table entries: 16 (order: -6, 192 bytes)
[    0.090000] NET: Registered protocol family 16
[    0.110000] clocksource: Switched to clocksource ARC Timer1
[    0.110000] NET: Registered protocol family 2
[    0.120000] TCP established hash table entries: 4096 (order: 1, 16384 bytes)
[    0.120000] TCP bind hash table entries: 4096 (order: 1, 16384 bytes)
[    0.120000] TCP: Hash tables configured (established 4096 bind 4096)
[    0.120000] UDP hash table entries: 512 (order: 0, 8192 bytes)
[    0.120000] UDP-Lite hash table entries: 512 (order: 0, 8192 bytes)
[    0.120000] NET: Registered protocol family 1
[    2.550000] random: fast init done
[   22.880000] devtmpfs: mounted
[   22.910000] workingset: timestamp_bits=30 max_order=16 bucket_order=0
[   23.530000] c0fc1000.serial: ttyARC0 at MMIO 0x0 (irq = 24, base_baud = 5000000) is a arc-uart
[   23.530000] console [ttyARC0] enabled
[   23.530000] bootconsole [arc_uart0] disabled
[   23.530000] NET: Registered protocol family 17
[   23.600000] Starting Linux (built with OpenADK).
[   23.600000] Freeing unused kernel memory: 1400K (80002000 - 80160000)
[   23.600000] This architecture does not have kernel memory protection.
[  231.060000] random: crng init done

best regards
 Waldemar
