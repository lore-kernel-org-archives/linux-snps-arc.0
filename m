From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 22 Aug 2016 11:37:54 -0700
Subject: ARC stable backport request
In-Reply-To: <20160822180616.GA17185@sasha-lappy>
References: <2ac8d0fc-9c67-e7c7-41f0-68cb34514019@synopsys.com>
 <20160822180616.GA17185@sasha-lappy>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1a1df8bc-1d86-49e7-da27-d709c63aed52@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/22/2016 11:14 AM, Levin, Alexander wrote:
> On Mon, Aug 22, 2016@10:36:20AM -0700, Vineet Gupta wrote:
>> Hi Stable Team,
>>
>> Could you please backport upstream 20d780374c81c ("ARC: build: Better way to
>> detect ISA compatible toolchain")
>>
>> This is needed to let kernel building with newer gcc 6.x based tools.
>>
>> Thx,
>> -Vineet
> 
> What's the version range? It looks to me like it depends on 1f6ccfff6
> ("ARCv2: Support for ARCv2 ISA and HS38x cores") which means 4.2+?
> 

Correct - I realized that I missed out mentioning the range after pressing send.

Thx,
-Vineet
