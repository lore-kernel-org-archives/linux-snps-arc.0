From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 9 Jun 2016 14:02:01 +0530
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Jun 09,
 17:31
In-Reply-To: <20160609073240.1.68347@7e2e7264739d>
References: <20160609073240.1.68347@7e2e7264739d>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57592981.2060604@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Michael,

On Thursday 09 June 2016 01:02 PM, noreply@ellerman.id.au wrote:
> FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Jun 09, 17:31
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/12713783/
> 
> Commit:   Add linux-next specific files for 20160609
>           8f6027f7e808ed7c1fd8c8d37fc7a5076c683c4f
> Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4
> 
> Possible errors
> ---------------
> 
> {standard input}:18606: Error: Instruction with long immediate data in delay slot
> make[2]: *** [block/cfq-iosched.o] Error 1
> make[1]: *** [block] Error 2
> make: *** [sub-make] Error 2

This problem has been fixed in tools since - can you switch to a newer toolchain -
such as one released last month. @Alexey can you point Michael to right buildroot
version ?

-Vineet
