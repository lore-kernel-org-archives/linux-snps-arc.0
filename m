From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 20 Mar 2019 23:05:49 +0000
Subject: [PATCH] [ARC] don't force _init/_fini as DT_INIT/DT_FINI
References: <1549052478-965-1-git-send-email-vgupta@synopsys.com>
 <098ECE41A0A6114BB2A07F1EC238DE89671D3AAD@de02wembxa.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014643D6B2@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Claudiu,

On 2/4/19 6:52 AM, Claudiu Zissulescu wrote:
> Hi,
> 
>> bfd/
>>     2019-02-01  Vineet Gupta <vgupta at synopsys.com>
>>
>>            * elf32-arc.c: Delete init_str, fini_str
>>
>> ld/
>>     2019-02-01  Vineet Gupta <vgupta at synopsys.com>
>>
>>            * emultempl/arclinux.em : Delete special INIT/FINI handling.
>>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> 
> It looks good. I will push it asap. Thank you for your contribution,
> Claudiu

 Can this be stable backported please.

Thx,
-Vineet
