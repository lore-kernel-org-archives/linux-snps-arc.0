From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri, 1 Sep 2017 13:33:42 +0100
Subject: [PATCH] arc: Re-enable MMU upon die()
In-Reply-To: <1504266488.15144.3.camel@synopsys.com>
References: <d2b588da61b35312a3126b605685f22bc30fc3ae.1504265945.git.joabreu@synopsys.com>
 <1504266488.15144.3.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c6f2e929-d431-8fc3-3940-7e2aba4d00cf@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

On 01-09-2017 12:48, Alexey Brodkin wrote:
> Hi Jose,
>
> On Fri, 2017-09-01@12:39 +0100, Jose Abreu wrote:
>> I recently came upon a scenario where I would get a double fault
>> after a machine check error. It turns out that for Ksymbol lookup
>> to work with modules we need to have MMU enabled because module
>> address is mapped in the cached space.
>>
>> This patch re-enables the MMU before start printing the stacktrace
>> making stacktracing of modules work upon a fatal exception.
> I'm wondering how do we end up with MMU disabled?
> From ARC700 databook I cannot find any condition on which MMU could be
> silently disabled by hardware and IIRC there's no code in Linux kernel
> that disables MMU.

According to ARC 700 databook a machine check exception causes
Global TLB enable to be cleared. (See ARC 700 databook, page 687).

Best regards,
Jose Miguel Abreu

>
> -Alexey
