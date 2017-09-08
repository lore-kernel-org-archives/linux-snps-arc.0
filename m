From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 8 Sep 2017 10:31:15 -0700
Subject: [PATCH] ARC: AXS10x: Add temporary quirk to reset ethernet IP
In-Reply-To: <1504890890.30546.15.camel@synopsys.com>
References: <20170906182108.16765-1-Eugeniy.Paltsev@synopsys.com>
 <948bc9d9-7cef-4574-2ec9-0e9b0e5e0772@synopsys.com>
 <1504890890.30546.15.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <10a90a04-5afc-9c31-6dba-6c9889412c0b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/08/2017 10:14 AM, Eugeniy Paltsev wrote:
> On Wed, 2017-09-06@12:54 -0700, Vineet Gupta wrote:
>> On 09/06/2017 11:21 AM, Eugeniy Paltsev wrote:
>>> DW ethernet controller on AXS10x hangs sometimes after SW reset, so
>>> add temporary quirk to reset DW ethernet controller IP core.
>>> This quirk can be removed after axs10x reset driver
>>> (see http://patchwork.ozlabs.org/patch/800273/)
>>> or simple reset driver
>>> (see https://patchwork.kernel.org/patch/9903375/)
>>> will be available in upstream.
>>>
>>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
>> Added to for-next !
>>
>> Thx,
> Hi Vineet,
>
> Please specify if you have plans to add this patch to 4.14?
>
> I'm asking because we mostly need this quirk in 4.14 - I hope generic simple
> reset driver will be available in 4.15.

New code can't be added during the merge window ! I've applied it locally and it 
will happen after rc1 is out !
