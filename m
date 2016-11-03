From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 15:44:24 -0700
Subject: [PATCH v2 01/10] ARC: timer: rtc: implement read loop in "C" vs.
 inline asm
In-Reply-To: <20161103223523.GB15759@mai>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
 <1478208701-30923-2-git-send-email-vgupta@synopsys.com>
 <20161103215221.GM1859@mai>
 <952c1d98-2827-5127-2440-edab342e6b77@synopsys.com>
 <20161103223523.GB15759@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4ca3d740-dd75-fb4b-1967-aa3a605af62d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/03/2016 03:35 PM, Daniel Lezcano wrote:
> On Thu, Nov 03, 2016@03:23:09PM -0700, Vineet Gupta wrote:
>> On 11/03/2016 02:52 PM, Daniel Lezcano wrote:
>>> On Thu, Nov 03, 2016@02:31:32PM -0700, Vineet Gupta wrote:
>>>> The current code doesn't even compile ....
>>>
>>> Give a better description in the log, especially if this patch is supposed to
>>> go to stable@
>>
>> OK.
> 
> [ ... ]

Here's what I added

---->
    ARC: timer: rtc: implement read loop in "C" vs. inline asm

    The current code doesn't even compile as somehow the inline assembly
    can't see the register names defined as ARC_RTC_*
    I'm pretty sure It worked when I first got it merged, but the tools were
    definitely different then.

    So better to write this in "C" anyways.


> 
>>> Is the condition correct ? If I refer to your previous answer, the bit will be
>>> set for status if the counter wrapped up. So in this case, we won't exit the
>>> loop until we wrap up, no ?
>>
>> No thats not what I meant. Bit being set there means things are fine (no interrupt
>> taken, no increment of high after low was readetc). All I changed here was use of
>> 0x8000_0000 to the macro. BBIT0 in assembler means branch if bit was clear.
> 
> Fair enough. So the logic is inverted 'status' == 0 means 'not fine'.

Indeed !
