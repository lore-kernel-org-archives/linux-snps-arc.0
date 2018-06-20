From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 20 Jun 2018 16:11:27 -0700
Subject: [PATCH] ARC: Enable machine_desc->init_per_cpu for non-SMP configs
In-Reply-To: <59f6fc647175e3f22f530fc4497cc4104af355e7.camel@synopsys.com>
References: <20171129082145.23327-1-abrodkin@synopsys.com>
 <ee663800-7f72-c310-2a65-d8b52a811f15@synopsys.com>
 <59f6fc647175e3f22f530fc4497cc4104af355e7.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <eb9111fb-7530-98d9-6800-8413ad90360c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/14/2018 03:26 PM, Alexey Brodkin wrote:
> Hi Vineet,
>
> On Thu, 2017-11-30@09:46 -0800, Vineet Gupta wrote:
>> On 11/29/2017 12:21 AM, Alexey Brodkin wrote:
>>> As of today we assumed that "machine_desc->init_per_cpu" calls
>>> are only usable on SMP systems when we want to run some piece of
>>> code on early boot for each and every core, I guess assumption was
>>> we have "machine_desc->init_early" for single-core cases where
>>> the one and only master core can do all the things.
>>>
>>> But it turned out for platforms which might be both UP and SMP it
>>> might be benificial to use "init_per_cpu" for both UP and SMP cases
>>> with which we achieve 2 things simultaneously:
>>>   1) Exactly the same one code will be used for UP&SMP for
>>>      things required to be done on each an every core regardless if it's
>>>      a master and the only core in UP system or any other slave core in SMP
>>>      setup.
>>>   1) There will be no "ifdef CONFIG_SMP" around "init_per_cpu".
>>>
>> Seems fine to me. However this needs to go with the actual platform change which 
>> needs it.
> Well for example this might get in the way of building kernel for HSDK with
> CONFIG_SMP disabled which is IMHO quite valid case in terms of testing
> code-base compiled with no CONFIG_SMP 

Fair enough - although world is moving away from UP.


> (something Waldemar was up to).

Really, why does he care if we are running SMP kernel - oh his simulation time
goes up. But honestly he should try and use the SMP kernel for testing as that
might uncover any system wide / SMP specific bugs in testing uclibc as well !

> Is it a strong enough reason for that patch to be applied?

Well per my original reply I didn't have any objections for this per-se and wanted
to see the platform patch. Seems we don't need platform patch as it is not under
#ifdef in hsdk/platform.c

I'll queue this up !

-Vineet
