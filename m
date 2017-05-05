From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 5 May 2017 12:57:14 -0700
Subject: PAE40 without HIGHMEM
In-Reply-To: <1494013328.3423.22.camel@synopsys.com>
References: <1493973869.3200.26.camel@synopsys.com>
 <27af61a0-fc23-a720-7b76-cfe2d742c554@synopsys.com>
 <1494013328.3423.22.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2501ccb3-2f17-9b8b-1533-e98cc89a9fbd@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 05/05/2017 12:42 PM, Alexey Brodkin wrote:
> Hi Vineet,
> 
> On Fri, 2017-05-05@12:31 -0700, Vineet Gupta wrote:
>> +CC arcml
>>
>> Hi Alexey,
>>
>> On 05/05/2017 01:44 AM, Alexey Brodkin wrote:
>>>
>>> Hi Vineet,
>>>
>>> Playing with PAE40 on axs103 v1.2-rc2 (where PAE really seems to work quite well)
>>> Eugeniy bumped into the fact that PAE could be enabled without HIGHMEM.
>>>
>>> Personally I din't face that trouble because I used to enable HIGHMEM manually before
>>> even thinking of PAE.
>>>
>>> So we were surprised why there's no dependency which I was pretty sure was there
>>> back in the day. And to no surprise I found you removed such a dependency in
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7cab91b87dd8eeee5911ec34be8bb0288ebba18b
>>> "ARCv2: Allow enabling PAE40 w/o HIGHMEM".
>>>
>>> Now what we have another [and this time real HW] platform with PAE support
>>> and DDR mapped above 4Gb do you think we may revert this change and
>>> put dependency on HIGHMEM for PAE?
>>>
>>> If you like I may send a patch to that effect.
>>
>> I understand your point, and PAE40 when really exercising > 32 bits certainly
>> needs HIGHMEM.
>>
>> However in a setup where we only had 32 bit paddr, we can technically still build
>> a PAE40 enabled kernel - which uses PAE40 enabled MMU cmds etc (with upper words
>> always happening to be 0) and should in theory work as well. Agreed it is not a
>> production config, still it is a useful "test" config or a "developer" config.
>>
>> The next question is why was Euginey seeing the errors - because he had DT setup
>> memory > 1_0000_0000 and CONFIG_HIGHMEM was not enabled ? That certainly is broken
>> and needs to be prevented at config or early run time.
> 
> Actually it was not an error that Eugeniy saw but absence of any differences after:
> 1) Adding the second memory region "0x1 0xa000_0000" in axc003_idu.dtsi
> 2) Enabling PAE40 in menuconfig
> 
> We had roughly the same situation as with PAE disabled and pristine DTS.
> Well the only difference was mention of PAE40 being in use... but still only
> 256Mb (read the same lowmem) was available.

So you mean PAE40 + !HIGHMEM behaved as !PAE40 and it didn't crash or tell the
user that it was not being in user ! I'd say this is good and cool ;-)

> I'd say for "tests" we may manually overcome HIGHMEM dependency (with local arch/arc/Kconfig mod)
> but keep the dependency in place so users who really want to access memory above 4Gb are not
> misleaded.

Fair enough, please send the revert of my orig patch to enforce the dependency: as
you rightly say now we have a PAE40 enabled platform to actually test the real
deal and not made up stuff !

-Vineet
