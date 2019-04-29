From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 29 Apr 2019 17:17:50 +0000
Subject: perf tools build broken after v5.1-rc1
References: <eeb83498-f37f-e234-4941-2731b81dc78c@synopsys.com>
 <20190422152027.GB11750@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A250584C@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/22/19 8:31 AM, Arnaldo Carvalho de Melo wrote:
>> A quick fix for ARC will be to create our own version but I presume all existing
>> arches using generic syscall abi are affected. Thoughts ? In lack of ideas I'll
>> send out a patch for ARC.
>>
>> P.S. Why do we need the unistd.h duplication in tools directory, given it could
>> have used the in-tree unistd headers directly ?
> I have to write down the explanation and have it in a file, but we can't
> use anything in the kernel from outside tools/ to avoid adding a burden
> to kernel developers that would then have to make sure that the changes
> that they make outside tools/ don't break things living there.

That is a sound guiding principle in general but I don't agree here. unistd is
backbone of kernel user interface it has to work and can't possibly be broken even
when kernel devs add a new syscall is added or condition-alize existing one. So
adding a copy - and deferring the propagation of in-kernel unistd to usersapce
won't necessarily help with anything and it just adds the burden of keeping them
in sync. Granted we won't necessarily need all the bleeding edge (new syscall
updates) into that header, its still more work.
