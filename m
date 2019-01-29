From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 15:36:30 -0800
Subject: [PATCH 13/21] ARC: Build Infrastructure
In-Reply-To: <alpine.DEB.2.21.1812202323290.24773@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-14-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182340110.30183@digraph.polyomino.org.uk>
 <23aece37-8497-8b48-dadb-3e73667ff3e4@synopsys.com>
 <alpine.DEB.2.21.1812192214410.10617@digraph.polyomino.org.uk>
 <98eef4d3-93a2-0ad5-fef1-912cede85650@synopsys.com>
 <alpine.DEB.2.21.1812202323290.24773@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <eed47c81-a417-2e6f-d159-a10c59e5167d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/20/18 3:24 PM, Joseph Myers wrote:
> On Thu, 20 Dec 2018, Vineet Gupta wrote:
> 
>> On 12/19/18 2:17 PM, Joseph Myers wrote:
>>> I should note a separate issue to consider: that of *static* PIE support.  
>>> That doesn't need to be working, but if it's not working,
>>
>> Aren't there directed test cases for that already ?
>>
>> PASS: elf/tst-tls1-static
>> PASS: elf/tst-tls1-static-non-pie
>> FAIL: gmon/tst-gmon-pie-gprof
> 
> The key point on the PortStatus page is "If linker can correctly generate 
> static PIE, glibc test results should be identical with and without 
> --enable-static-pie.".  You need to test a build configured with 
> --enable-static-pie to see if this is fully working.

Unfortunately this doesn't seem to work.

ld bails out when linking elf/sln. It can't seem to resolve the _DYNAMIC at pcl in
elf_machine_load_address(). We can look into this but presume it is not a deal
breaker.


~/BR/host/bin/arc-buildroot-linux-gnu-gcc
-nostdlib -nostartfiles
*-static*
-o ~/BR/build/glibc-2f9a78f208a7/build/elf/sln
*-static-pie*
~/BR/build/glibc-2f9a78f208a7/build/csu/rcrt1.o
~/BR/build/glibc-2f9a78f208a7/build/csu/crti.o
`~/BR/host/bin/arc-buildroot-linux-gnu-gcc  --print-file-name=crtbeginS.o`
~/BR/build/glibc-2f9a78f208a7/build/elf/sln.o
~/BR/build/glibc-2f9a78f208a7/build/elf/static-stubs.o
-Wl,--start-group
~/BR/build/glibc-2f9a78f208a7/build/libc.a -lgcc
-Wl,--end-group
`~/BR/host/bin/arc-buildroot-linux-gnu-gcc  --print-file-name=crtendS.o`
~/BR/build/glibc-2f9a78f208a7/build/csu/crtn.o

~/BR/host/lib/gcc/arc-buildroot-linux-gnu/8.2.1/../../../../arc-buildroot-linux-gnu/bin/ld:
~/BR/build/glibc-2f9a78f208a7/build/libc.a(dl-reloc-static-pie.o): in function
`elf_machine_load_address':
~/BR/build:/glibc-2f9a78f208a7/elf/../sysdeps/arc/dl-machine.h:115: undefined
reference to `_DYNAMIC'
~/BR/host/lib/gcc/arc-buildroot-linux-gnu/8.2.1/../../../../arc-buildroot-linux-gnu/bin/ld:
~/BR/build/glibc-2f9a78f208a7/elf/../sysdeps/arc/dl-machine.h:115: undefined
reference to `_DYNAMIC'
collect2: error: ld returned 1 exit status
