From: hpa@zytor.com (H. Peter Anvin)
Date: Sat, 04 Mar 2017 15:08:50 -0800
Subject: [PATCH 1/3] futex: remove duplicated code
In-Reply-To: <20170304213805.GA2449@lianli.shorne-pla.net>
References: <20170303122712.13353-1-jslaby@suse.cz>
 <20170304130550.GT21222@n2100.armlinux.org.uk>
 <3994975e-89a5-d2b5-60be-a8633ddc3733@zytor.com>
 <20170304213805.GA2449@lianli.shorne-pla.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201703042308.v24N8wvh012716@mail.zytor.com>
To: linux-snps-arc@lists.infradead.org

<davem at davemloft.net>,Chris Metcalf <cmetcalf at mellanox.com>,Thomas Gleixner <tglx at linutronix.de>,Ingo Molnar <mingo at redhat.com>,Chris Zankel <chris at zankel.net>,Max Filippov <jcmvbkbc at gmail.com>,Arnd Bergmann <arnd at arndb.de>,x86 at kernel.org,linux-alpha at vger.kernel.org,linux-snps-arc at lists.infradead.org,linux-arm-kernel at lists.infradead.org,linux-hexagon at vger.kernel.org,linux-ia64 at vger.kernel.org,linux-mips at linux-mips.org,openrisc at lists.librecores.org,linux-parisc at vger.kernel.org,linuxppc-dev at lists.ozlabs.org,linux-s390 at vger.kernel.org,linux-sh at vger.kernel.org,sparclinux at vger.kernel.org,linux-xtensa at linux-xtensa.org,linux-arch at vger.kernel.org
From: hpa@zytor.com
List-ID: <linux-snps-arc@lists.infradead.org>
To: linux-snps-arc@lists.infradead.org
Message-ID: <CF18535E-39E7-44D3-88D0-80B9961E6681 at zytor.com>

On March 4, 2017 1:38:05 PM PST, Stafford Horne <shorne@gmail.com> wrote:
>On Sat, Mar 04, 2017@11:15:17AM -0800, H. Peter Anvin wrote:
>> On 03/04/17 05:05, Russell King - ARM Linux wrote:
>> >>  
>> >> +static int futex_atomic_op_inuser(int encoded_op, u32 __user
>*uaddr)
>> >> +{
>> >> +	int op = (encoded_op >> 28) & 7;
>> >> +	int cmp = (encoded_op >> 24) & 15;
>> >> +	int oparg = (encoded_op << 8) >> 20;
>> >> +	int cmparg = (encoded_op << 20) >> 20;
>> > 
>> > Hmm.  oparg and cmparg look like they're doing these shifts to get
>sign
>> > extension of the 12-bit values by assuming that "int" is 32-bit -
>> > probably worth a comment, or for safety, they should be "s32" so
>it's
>> > not dependent on the bit-width of "int".
>> > 
>> 
>> For readability, perhaps we should make sign- and zero-extension an
>> explicit facility?
>
>There is some of this in already here, 32 and 64 bit versions:
>
>  include/linux/bitops.h
>
>Do we really need zero extension? It seems the same.
>
>Example implementation from bitops.h
>
>static inline __s32 sign_extend32(__u32 value, int index)
>{
>        __u8 shift = 31 - index;
>        return (__s32)(value << shift) >> shift;
>}
>
>> /*
>>  * Truncate an integer x to n bits, using sign- or
>>  * zero-extension, respectively.
>>  */
>> static inline __const_func__ s32 sex32(s32 x, int n)
>> {
>>   return (x << (32-n)) >> (32-n);
>> }
>> 
>> static inline __const_func__ s64 sex64(s64 x, int n)
>> {
>>   return (x << (64-n)) >> (64-n);
>> }
>> 
>> #define sex(x,y)						\
>> 	((__typeof__(x))					\
>> 	 (((__builtin_constant_p(y) && ((y) <= 32)) ||		\
>> 	   (sizeof(x) <= sizeof(s32)))				\
>> 	  ? sex32((x),(y)) : sex64((x),(y))))
>> 
>> static inline __const_func__ u32 zex32(u32 x, int n)
>> {
>>   return (x << (32-n)) >> (32-n);
>> }
>> 
>> static inline __const_func__ u64 zex64(u64 x, int n)
>> {
>>   return (x << (64-n)) >> (64-n);
>> }
>> 
>> #define zex(x,y)						\
>> 	((__typeof__(x))					\
>> 	 (((__builtin_constant_p(y) && ((y) <= 32)) ||		\
>> 	   (sizeof(x) <= sizeof(u32)))				\
>> 	  ? zex32((x),(y)) : zex64((x),(y))))
>> 

Also, i strongly believe that making it syntactically cumbersome encodes people to open-code it which is bad...
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
