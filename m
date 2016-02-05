From: noamc@ezchip.com (Noam Camus)
Date: Fri, 5 Feb 2016 11:18:52 +0000
Subject: [RFC] perf: fix building for ARCv1
In-Reply-To: <56B2CFF2.4030503@synopsys.com>
References: <C2D7FE5348E1B147BCA15975FBA23075F44C9DD2@IN01WEMBXA.internal.synopsys.com>
 <1445166916.9672.10.camel@synopsys.com> <87a8rf6a6p.fsf@tassilo.jf.intel.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44C9E9A@IN01WEMBXA.internal.synopsys.com>
 <8761235rwe.fsf@tassilo.jf.intel.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44CAFF9@IN01WEMBXA.internal.synopsys.com>
 <20151019093549.GK3816@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44CB023@IN01WEMBXA.internal.synopsys.com>
 <20151019095157.GM3816@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44CB43D@IN01WEMBXA.internal.synopsys.com>
 <20151020101133.GA17308@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44CB4BF@IN01WEMBXA.internal.synopsys.com>
 <1446134296.3203.27.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44CE67A@IN01WEMBXA.internal.synopsys.com>
 <1454516455.2811.4.camel__10775.5710989752$1454516490$gmane$org@synopsys.com>,
 <56B2CFF2.4030503@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR02MB13872D4A7A43E49B8440AEB5D6D20@HE1PR02MB1387.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org



________________________________________
>From: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
>Sent: Thursday, February 4, 2016 6:13 AM
>Noam, what's the atomic story for EZChip. Do you support such things for user
space in GNU tools. If -atomic is added to perf user space builds are you guys OK!

Well here for EZchip I also see the:
undefined reference to `__sync_add_and_fetch_4'
undefined reference to `__sync_sub_and_fetch_4'

This is since at file tools/include/asm/atomic.h we use the generic implementation
If for ARC I could use just like x86 my own header file then functions like:
atomic_inc()
atomic_dec_and_test()
Are easy to implement and you may see an example for such atomic methods in my patch set for the new platform.

You however wants to use some GCC flag -matomic which I assume somehow will implement the above __sync*.
I can't find the implementation but if it uses LLSC then it won't work for me since I am not supporting LLSC.

So seem that either I have my own header at kernel or that I need to change the GCC implementation for __sync* to use my atomic instructions.
I am personally tend to the x86 solution and not the generic one since changing GCC will require to have new compiler dependency.
 
-Noam
