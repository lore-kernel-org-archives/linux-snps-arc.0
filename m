From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 20 Mar 2019 16:04:14 -0700
Subject: [PATCH] [ARC] don't force _init/_fini as DT_INIT/DT_FINI
In-Reply-To: <098ECE41A0A6114BB2A07F1EC238DE89671D3AAD@de02wembxa.internal.synopsys.com>
References: <1549052478-965-1-git-send-email-vgupta@synopsys.com>
 <098ECE41A0A6114BB2A07F1EC238DE89671D3AAD@de02wembxa.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5ad8a9e1-92a8-8b74-ca15-32c6a819bb09@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

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

Can this be backported to stable branches please !

Thx,
-Vineet
