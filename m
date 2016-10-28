From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 28 Oct 2016 14:44:13 -0700
Subject: [PATCH] lpfc: use %zd format string for size_t
In-Reply-To: <18294392.WY3416IpNg@wuerfel>
References: <20161017123605.2217411-1-arnd@arndb.de>
 <26e675e3-af5b-eaf7-fea0-b4aff9767332@synopsys.com>
 <18294392.WY3416IpNg@wuerfel>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <27a8ca4b-3259-17bd-acbf-ee809ec4f67b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/28/2016 02:33 PM, Arnd Bergmann wrote:
> On Friday, October 28, 2016 2:03:21 PM CEST Vineet Gupta wrote:
>>
>> I'm trying to use about to be released ARC gcc 6.x with current kernels and see a
>> flood of warnings due to these legit fixes - i.e.g arc gcc 6.2 complains when it
>> sees -zx formats.
>>
>> CC      mm/percpu.o
>> ../mm/percpu.c: In function ?pcpu_alloc?:
>> ../mm/percpu.c:890:14: warning: format ?%zu? expects argument of type ?size_t?,
>> but argument 4 has type ?unsigned int? [-Wformat=]
>>    WARN(true, "illegal size (%zu) or align (%zu) for percpu allocation\n",
>>
>> I'm not sure what is going on since the data type is size_t alright - although
>> from posix_types.h is
>>
>> typedef unsigned int __kernel_size_t;
>> typedef __kernel_size_t size_t;
>>
>> And this seems to be same for ARC as well as ARM. I tried ARM gcc 6.1 @
>> https://snapshots.linaro.org/components/toolchain/binaries/6.1-2016.08-rc1/arm-linux-gnueabihf/
>>
>> which doesn't seem to be complaining.
>>
>> With V=1, I checked the respective ARM and ARC toggles in play, but nothing
>> related to this seems to be standing out.
>>
>> I know this is more of a question to our GNU folks, but was wondering if you had
>> more insight into it - which you almost always do 
> 
> I've seen the problem you describe before, but I don't remember the
> exact details. I think what happened is that the compiler knows
> what type size_t is supposed to be, either unsigned int or unsigned
> long, regardless of what our kernel headers say it is.
> 
> This is configuration specific, and something caused your compiler to
> be built assuming that size_t is unsigned long, while the kernel
> headers are assuming it should be unsigned int.
> 
> You can try overriding __kernel_size_t in your asm/posix_types.h
> to define it as unsigned long, 


Indeed if I hack include/linux/types.h

-typedef __kernel_size_t                size_t;
+typedef unsigned long          size_t;

then the warning goes away, so gcc is indeed assuming size_t to be unsigned long
and not unsigned int. That helps a lot.

or try to build your compiler
> to match the kernel headers, but the first step would be to find
> out why the compiler changed in the first place, assuming that older
> compiler versions were matching the kernel here.
> 
> 	Arnd
