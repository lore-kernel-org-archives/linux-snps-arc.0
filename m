From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 1 Apr 2019 18:08:30 +0000
Subject: [PATCH] ARC: PAE40: don't panic and instead turn off hw ioc
References: <1553892336-29596-1-git-send-email-vgupta@synopsys.com>
 <1554141887.2797.3.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014643FA2D@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/1/19 11:04 AM, Eugeniy Paltsev wrote:
>> +		if (IS_ENABLED(CONFIG_HIGHMEM) || is_pae40_enabled())
> As for today PAE40 couldn't be enabled without HIGHMEM for ARC, so probably we can
> simplify this to
>
> ----------------------------->8----------------------------------
> if (IS_ENABLED(CONFIG_HIGHMEM))
> 	ioc_enable = 0;

That is true, but mentioning both sort of documents the requirements.
Also these checks are compile time only so don't add any extra code whatsoever.

-Vineet
