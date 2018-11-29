From: jose.abreu@synopsys.com (Jose Abreu)
Date: Thu, 29 Nov 2018 13:11:13 +0000
Subject: [PATCH] ARC: io.h: Implement reads{x}()/writes{x}()
In-Reply-To: <a35837f403f54d058dd31c901a007923@AcuMS.aculab.com>
References: <bdcc49c9eab45bda6815b1419590943e603d8dc2.1543484040.git.joabreu@synopsys.com>
 <f634eb3e39284e48923552a0c21562c6@AcuMS.aculab.com>
 <2d58c25b-60d0-4616-d2d2-ea490a7261f5@synopsys.com>
 <a35837f403f54d058dd31c901a007923@AcuMS.aculab.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e2c8c8e0-ae78-053f-0a80-311cd55927e1@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 29-11-2018 13:03, David Laight wrote:
> From: Jose Abreu [mailto:jose.abreu at synopsys.com]
>> On 29-11-2018 12:47, David Laight wrote:
>>> From: Jose Abreu
>>>> Sent: 29 November 2018 12:42
>>>>
>>>> Some ARC CPU's do not support unaligned loads/stores. Currently, generic
>>>> implementation of reads{b/w/l}()/writes{b/w/l}() is being used with ARC.
>>>> This can lead to misfunction of some drivers as generic functions do a
>>>> plain dereference of a pointer that can be unaligned.
>>>>
>>>> Let's use {get/put}_unaligned() helper instead of plain dereference of
>>>> pointer in order to fix this.
>>> Is it worth adding a check for the pointer being aligned?
>> We could but then we would need to know which CPU version is
>> currently running because some ARC processors support unaligned
>> accesses.
> Eh?
> If the CPU supports unaligned accesses you could patch the code
> to do unaligned accesses.

*Some* ARC CPU versions support unaligned memory access. The one
we tested this on does not support unaligned accesses.

>
> I was thinking of the (probably likely) case where the pointer is
> actually aligned.
> An extra check for ((pointer) & 3) is almost certainly a 'win'
> over the byte accesses and shift/mask/or use by get/put_unaligned().
>
> The IO accesses probably dominate making more complex optimisations
> less likely to have any benefit.
>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
