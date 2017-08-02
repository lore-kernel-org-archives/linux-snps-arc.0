From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 2 Aug 2017 13:56:16 +0530
Subject: [PATCH] arc: arcv2: cache: Explicitly set MSB counterpart of
 region ops addresses
In-Reply-To: <1501661036.6345.15.camel@synopsys.com>
References: <20170801095847.6425-1-abrodkin@synopsys.com>
 <2f6ba6bb-ae07-0ff9-c2ff-0f162eab2ef0@synopsys.com>
 <1501661036.6345.15.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <52c5c123-9136-50c6-9189-6bff77cbf5ec@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/02/2017 01:33 PM, Alexey Brodkin wrote:
>
>>> -	write_aux_reg(ARC_REG_SLC_RGN_END, (paddr + sz + l2_line_sz - 1));
>>> -	write_aux_reg(ARC_REG_SLC_RGN_START, paddr);
>>> +	end = paddr + sz + l2_line_sz - 1;
>>> +	write_aux_reg(ARC_REG_SLC_RGN_END1, upper_32_bits(end));
>>> +	write_aux_reg(ARC_REG_SLC_RGN_END, lower_32_bits(end));
>>> +	write_aux_reg(ARC_REG_SLC_RGN_START1, upper_32_bits(paddr));
>>> +	write_aux_reg(ARC_REG_SLC_RGN_START, lower_32_bits(paddr));
>> Are these registers present even if PAE is not configured in hardware ?
> Apparently no :(
>
> I did test it on AXS103 but just now realized its latest firmware has PAE40.
> Retested on older firmware (still with HS 2.1) without PAE and indeed those
> AUX registers are not implemented:
> ----------------------->8----------------------
> ...
>
> So I'll respin this patch with conditional setup of those regs
> depending on PAE40 presence.

And please also do another patch which converts the existing is_pae40_enabled() 
calls to is_pae40_exists() or somesuch, as apparently these regs needs to be 
cleared if hw has PAE and kernel not using PAE is immaterial.
