From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 23 Jan 2019 11:55:49 -0800
Subject: Semantics of symbol address in perf report -v
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <da403654-f21d-9959-067f-b76581600741@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

I noticed a small anomaly in perf report -v output on ARC and x86 as well.

A simple program which sits in tight loop, compiled for x86_64

void main() { while(1) {} }

$ gcc -g tight.c
$ ./a.out &
$ perf record -e cycles -p 26703
$ perf report -n -v  --stdio  | egrep "(main|Symbol)"

|# Overhead Samples Command  Shared Object         Symbol

|  99.93%    55753   a.out   /home/arc/test/a.out  0x4da     B [.] main

|                                                  ^^^^^

The printer address for Symbols is *not* the actual address in elf, but rather VMA
start offset.

0x4da = 0x4004da - 0x0000000000400000

$ objdump -d ./a.out

| 00000000004004d6 <main>:
|  4004d6:	55                   	push   %rbp
|  4004d7:	48 89 e5             	mov    %rsp,%rbp
|  4004da:	eb fe                	jmp    4004da <main+0x4>
|  4004dc:	0f 1f 40 00          	nopl   0x0(%rax)

$ readelf -a ./a.out

| Program Headers:
|  Type           Offset             VirtAddr           PhysAddr
|                 FileSiz            MemSiz              Flags  Align
| Program Headers:
|  LOAD           0x0000000000000000 0x0000000000400000 0x0000000000400000
                 0x000000000000068c 0x000000000000068c  R E    200000


This is problematic in narrowing down the hotspot instruction, when the binary
itself is. One needs to do the offset addition manually to find the actual hotspot
location.

|   99.79%  100064  a.out  /home/arc/test/a.out  0x4da  B [.] 0x00000000000004da

                                                               ^^^^^^^^^^^^^^^^

Is this considered an issue ? Would the fix to print the actual symbol address
(and recorded in raw perf event data) break some existing tooling etc.

-Vineet
