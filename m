From: adrian.hunter@intel.com (Adrian Hunter)
Date: Fri, 16 Mar 2018 09:20:35 +0200
Subject: mmc: block: bonnie++ runs with errors on arc/hsdk board
In-Reply-To: <1521134509.6358.1.camel@synopsys.com>
References: <1520942674.10285.8.camel@synopsys.com>
 <486fe92e-9b53-53a4-f98d-129a97032470@intel.com>
 <1520956602.10285.10.camel@synopsys.com>
 <1521030769.10285.16.camel@synopsys.com>
 <83de0f90-0919-f449-b432-494b9bf524a1@intel.com>
 <345e9053-9251-ad27-d05b-ec80b69ee235@synopsys.com>
 <1521134509.6358.1.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <94e11cab-8c46-4780-1413-f08e8f848342@intel.com>
To: linux-snps-arc@lists.infradead.org

On 15/03/18 19:21, Alexey Brodkin wrote:
> Hi Vineet,
> 
> On Thu, 2018-03-15@09:38 -0700, Vineet Gupta wrote:
>> On 03/15/2018 02:27 AM, Adrian Hunter wrote:
>>> Please try:
>>>
>>> 	perf record -a -e mmc:* -- bonnie++ -u root -r 256 -s 512 -x 1 -d /mnt
>>>
>>> and share the resulting perf.data file when you are able
>>> to reproduce the hung task message.
>>>
>>> You may want to add this patch first:
>>>
>>> 	https://marc.info/?l=linux-mmc&m=152110580324200
>>
>> While this SoC has perf counters, Unfortunately the overflow interrupts are not 
>> wired up. We can do perf stats but not sampling.
> 
> I guess here Adrian was asking for pure software MMC-related events which are
> orthogonal to CPU's perf interrupts.
> 
> Adrian?

Yes, these are mmc tracepoints which are software events.  The file is full
of them, so it certainly worked.
