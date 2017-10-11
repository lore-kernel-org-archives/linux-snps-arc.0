From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 11 Oct 2017 09:23:55 -0700
Subject: [RFC] ARC: [plat-hsdk]: Increase SDIO CIU frequency to 50000000Hz
In-Reply-To: <1507656569.3555.41.camel@synopsys.com>
References: <20171010161152.5604-1-Eugeniy.Paltsev@synopsys.com>
 <a1a4863d-c9e4-5dd0-b4e0-8c5d7e7b32e3@synopsys.com>
 <1507656569.3555.41.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c00c4a48-77a1-1879-8e56-a396689692e4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/10/2017 10:29 AM, Alexey Brodkin wrote:
> Hi Vineet,
> 
> On Tue, 2017-10-10@10:09 -0700, Vineet Gupta wrote:
>> On 10/10/2017 09:11 AM, Eugeniy Paltsev wrote:
>>> Increase SDIO CIU frequency from 12500000Hz to 50000000Hz by
>>> switching from the default divisor value (div-by-8) to the
>>> minimum possible value of the divisor (div-by-2) in HSDK platform
>>> code.
>> Please describe the problem first not the solution. That some SD cards don't work
>> blah blah ....
>> You could add me as reported-by - just for completeness !
>>
>> While I will test it to see if it cures my issue, I'll need Alexey to sign off /
>> ack as well !
> Sure once you update us with your findings and we know it helps you
> (at least Bonnie++ stress-test with one of SD-cards here still works)
> there will be a "normal" patch which I'll ack.

Thx guys ! Patch cures the issue with my SD card.

Please respin with changelog and Reported-by/Tested-by for me !

-Vineet
