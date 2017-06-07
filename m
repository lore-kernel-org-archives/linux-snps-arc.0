From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 7 Jun 2017 09:15:49 -0700
Subject: [PATCH v2 11/11] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <AM5PR0502MB299687067469E99F1A7A509EAAC80@AM5PR0502MB2996.eurprd05.prod.outlook.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
 <1495954328-28736-12-git-send-email-noamca@mellanox.com>
 <ef2527da-03a3-d60e-f5dd-e5b5932d43d0@synopsys.com>
 <AM5PR0502MB299687067469E99F1A7A509EAAC80@AM5PR0502MB2996.eurprd05.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ef177e34-e2ac-2e05-c136-e5b213687911@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/07/2017 04:14 AM, Noam Camus wrote:
>>>> +config EZNPS_MEM_ERROR
>>>> +       bool "ARC-EZchip Memory error as an exception"
>>>> +       depends on ARC_PLAT_EZNPS
>>>> +       default n
>>> So you set default to "n" - thus by default it works for the simulator not silicon ?
>> Correct, this way I "align" Sim environment to react as close as possible to how it work with silicon.
> Sorry, but It is not correct.
> Default is for silicon where it is naturally emits machine check and unlike simulator do not need OS to redirect the ISR L2 to machine check handler.
> Above motivation of "align" is true, but default is silicon and not sim, as I wrote in my original configuration help.
> Please re-update this CONFIG help section.



So NPS *hardware* generates exception, jumps to vector mem_service(), which you 
redirect to the machine check handler - which simply panics.
But this redirection is under EZNPS_MEM_ERROR, which you have defaulted to "n". So 
how is the default working for hardware ? Doesn't it need to be "y"

BTW it seems your patch is wrong otherwise too. So the userspace bus error will go 
to machine check handler which currently just panic's. You really want to kill the 
user space process and continue, thus need to call do_memory_error()

-Vineet
