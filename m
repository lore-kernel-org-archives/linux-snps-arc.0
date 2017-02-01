From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 Feb 2017 09:37:06 -0800
Subject: [PATCH 1/3] arc: vdk: Disable halt on reset
In-Reply-To: <1485969247.5515.27.camel@synopsys.com>
References: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
 <1485967373-15273-2-git-send-email-abrodkin@synopsys.com>
 <8b857bc4-71f0-9b3b-0cd5-19b49edb2910@synopsys.com>
 <1485969247.5515.27.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0c458950-5558-0dc2-4323-c5faba757083@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/01/2017 09:14 AM, Alexey Brodkin wrote:
>>> -# CONFIG_ARC_TIMERS_64BIT is not set
>>
>> Are you sure abut this part. Ater the timers driver rework, this would enable GFRC
>> for SMP builds and AFAIKR there were some issues with time with GFRC + nSIM etc..
> 
> Not anymore :)
> 
> Probably I missed something in discussions.

STAR 9000879565, 9000879563

> As a matter of fact I did run-test resulting vmlinux and it worked very nice.
> More over ARC_TIMERS_64BIT is selected automatically by ISA_ARCV2, see
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arc/Kconfig#n119
> 
> That said even if "# CONFIG_ARC_TIMERS_64BIT is not set" is left in place the option will be
> effectively enabled, no?

The whole point of adding this to defconfig is to override the default from Kconfig ?
