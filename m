From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 27 Nov 2017 10:25:16 -0800
Subject: [PATCH] frv: fix build failure
In-Reply-To: <1511457437.32422.6.camel@synopsys.com>
References: <1511302233-5008-1-git-send-email-sudipm.mukherjee@gmail.com>
 <1511457437.32422.6.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3a6fe86e-7a66-56df-3b1d-e2e8cd3e6eae@synopsys.com>
To: linux-snps-arc@lists.infradead.org

+CC linux-arch, Arnd

On 11/23/2017 09:17 AM, Alexey Brodkin wrote:
> Hi Sudip,
> 
> On Tue, 2017-11-21@22:10 +0000, Sudip Mukherjee wrote:
>> The frv defconfig build is failing with the error:
>> lib/mpi/mpih-div.o: In function `mpihelp_divrem':
>> mpih-div.c:(.text+0x30c): undefined reference to `abort'
>>
>> The function 'abort' was never defined for the frv architecture.
>> Create 'abort' as is done in other arch like 'arm' and 'unicore32'.
>>
>> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee at gmail.com>
>> ---
> 
> I'm seeing the same issue building for ARC from today's Linus' tree.

With which compiler ? Claudiu implemented __builtin_trap recently so ARC builds 
should not get abort() but a trap 5 instruction instead.

> Maybe it worth implementing abort() as a weak function for every arch/platform
> that doesn't have it explicitly defined? Otherwise we'll end-up with
> useless code duplication.

I understand the case/need for adding a weak/common abort() as a quick fix for 
handling such cases, but perhaps we should not and instead fix the rootcause. In 
this specific case, Claudiu mentioned that gcc was generating abort due to 
something like this (flagging a possible divide by zero due to 
-fno-isolate-erroneous-paths-dereference.

a;

fn1() {
   switch (a)
   case 0:
   return 1 / a;
}

Sudeep can you confirm that removing this hacking FRV build to not have this 
toggle fixes the abort issue.

So the offending code needs to be fixed as in the end when that code path is taken 
system is hosed.

-Vineet
