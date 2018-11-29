From: jose.abreu@synopsys.com (Jose Abreu)
Date: Thu, 29 Nov 2018 13:19:53 +0000
Subject: [PATCH] ARC: io.h: Implement reads{x}()/writes{x}()
In-Reply-To: <e2c8c8e0-ae78-053f-0a80-311cd55927e1@synopsys.com>
References: <bdcc49c9eab45bda6815b1419590943e603d8dc2.1543484040.git.joabreu@synopsys.com>
 <f634eb3e39284e48923552a0c21562c6@AcuMS.aculab.com>
 <2d58c25b-60d0-4616-d2d2-ea490a7261f5@synopsys.com>
 <a35837f403f54d058dd31c901a007923@AcuMS.aculab.com>
 <e2c8c8e0-ae78-053f-0a80-311cd55927e1@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1fef03c6-05cb-cc9b-ffdd-cb5f7d790322@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 29-11-2018 13:11, Jose Abreu wrote
>> I was thinking of the (probably likely) case where the pointer is
>> actually aligned.
>> An extra check for ((pointer) & 3) is almost certainly a 'win'
>> over the byte accesses and shift/mask/or use by get/put_unaligned().

Oh, sorry. I was misunderstanding. You mean like adding a check
for unaligned and use get/put_unaligned() only in that case right ?

Sorry.

>>
>> The IO accesses probably dominate making more complex optimisations
>> less likely to have any benefit.
>>
>> 	David
>>
>> -
>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
>> Registration No: 1397386 (Wales)
