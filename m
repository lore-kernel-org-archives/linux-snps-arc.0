From: claudiu.zissulescu@synopsys.com (Claudiu Zissulescu)
Date: Mon, 4 Feb 2019 14:52:05 +0000
Subject: [PATCH] [ARC] don't force _init/_fini as DT_INIT/DT_FINI
In-Reply-To: <1549052478-965-1-git-send-email-vgupta@synopsys.com>
References: <1549052478-965-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <098ECE41A0A6114BB2A07F1EC238DE89671D3AAD@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

> bfd/
>     2019-02-01  Vineet Gupta <vgupta at synopsys.com>
> 
>            * elf32-arc.c: Delete init_str, fini_str
> 
> ld/
>     2019-02-01  Vineet Gupta <vgupta at synopsys.com>
> 
>            * emultempl/arclinux.em : Delete special INIT/FINI handling.
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

It looks good. I will push it asap. Thank you for your contribution,
Claudiu
