From: jose.abreu@synopsys.com (Jose Abreu)
Date: Thu, 29 Nov 2018 16:13:04 +0000
Subject: [PATCH v2] ARC: io.h: Implement reads{x}()/writes{x}()
In-Reply-To: <89122bd8-bca2-2ae1-0dd0-160abbebcace@synopsys.com>
References: <19fb2e394afcb073bbc109e432417fbbc03323f6.1543499759.git.joabreu@synopsys.com>
 <ff1e11923e92405d883474d715008c0a@AcuMS.aculab.com>
 <89122bd8-bca2-2ae1-0dd0-160abbebcace@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d2d133e5-267c-c42a-7329-22892bbbdee4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 29-11-2018 14:42, Jose Abreu wrote:
> On 29-11-2018 14:38, David Laight wrote:
>> From: Jose Abreu
>>> Sent: 29 November 2018 14:29
>>>
>>> Some ARC CPU's do not support unaligned loads/stores. Currently, generic
>>> implementation of reads{b/w/l}()/writes{b/w/l}() is being used with ARC.
>>> This can lead to misfunction of some drivers as generic functions do a
>>> plain dereference of a pointer that can be unaligned.
>>>
>>> Let's use {get/put}_unaligned() helper instead of plain dereference of
>>> pointer in order to fix this.
>> ...
>>> +#define __raw_readsx(t,f) \
>>> +static inline void __raw_reads##f(const volatile void __iomem *addr, \
>>> +				  void *buffer, unsigned int count) \
>>> +{ \
>>> +	if (count) { \
>>> +		const unsigned long bptr = (unsigned long)buffer; \
>>> +		u##t *buf = buffer; \
>>> +\
>>> +		do { \
>>> +			u##t x = __raw_read##f(addr); \
>>> +\
>>> +			/* Some ARC CPU's don't support unaligned accesses */ \
>>> +			if (bptr % ((t) / 8)) { \
>>> +				put_unaligned(x, buf++); \
>>> +			} else { \
>>> +				*buf++ = x; \
>>> +			} \
>>> +		} while (--count); \
>>> +	} \
>>> +}
>> Does the compiler move the alignment test outside the loop?
>> You really want two copies of the loop body.
> Hmm, I would expect so because the if condition takes two const
> args ... I will try check that.

And it did optimize :)

Sample C Source:
--->8--
static noinline void test_readsl(char *buf, int len)
{
        readsl(0xdeadbeef, buf, len);
}
--->8---

And the disassembly:
--->8---
00000e88 <test_readsl>:
 e88:    breq.dr1,0,eac <0xeac>        /* if (count) */
 e8c:    and r2,r0,3

 e90:    mov_s lp_count,r1            /* r1 = count */
 e92:    brne r2,0,eb0 <0xeb0>        /* if (bptr % ((t) / 8)) */

 e96:    sub r0,r0,4
 e9a:    nop_s
 
 e9c:    lp eac <0xeac>                /* first loop */
 ea0:    ld r2,[0xdeadbeef]
 ea8:    st.a r2,[r0,4]
 eac:    j_s [blink]
 eae:    nop_s

 eb0:    lp ed6 <0xed6>                /* second loop */
 eb4:    ld r2,[0xdeadbeef]
 ebc:    lsr r5,r2,8
 ec0:    lsr r4,r2,16
 ec4:    lsr r3,r2,24
 ec8:    stb_s r2,[r0,0]
 eca:    stb r5,[r0,1]
 ece:    stb r4,[r0,2]
 ed2:    stb_s r3,[r0,3]
 ed4:    add_s r0,r0,4
 ed6:    j_s [blink]

--->8---

See how the if condition added in this version is checked in
<test_readsl+0xe92> and then it takes two different loops.

Thanks and Best Regards,
Jose Miguel Abreu

>
> Thanks and Best Regards,
> Jose Miguel Abreu
>
>> 	David
>>
>> -
>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
>> Registration No: 1397386 (Wales)
>>
