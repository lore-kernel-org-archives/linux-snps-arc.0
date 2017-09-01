From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 1 Sep 2017 09:55:46 -0700
Subject: [PATCH v3] arc: Re-enable MMU upon a Machine Check exception
In-Reply-To: <d0f55ba3b94de5c1bb7c93cbadb9829fa6889fed.1504281896.git.joabreu@synopsys.com>
References: <d0f55ba3b94de5c1bb7c93cbadb9829fa6889fed.1504281896.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <071bb48e-5662-a6fe-d538-de3614bd542e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

Some very minor nit picks to keep in mind for future patches.

1. all arc patches start with uppercase ARC:

On 09/01/2017 09:05 AM, Jose Abreu wrote:
> I recently came upon a scenario where I would get a double fault
> after a machine check error. It turns out that for Ksymbol lookup
> to work with modules we need to have MMU enabled because module
> address is mapped in the cached space.
> 
> This patch re-enables the MMU before calling die() so that
> stacktracing of modules work when a machine check exception happens.
> 
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> 
> Changes from v2:
> 	- Rephrased commit title and description
> Changes from v1:
> 	- Moved MMU re-enable to machine check exception handler
> ---

2. The patch revision history needs to be added *after* the line with ---, that 
way git am automatically strips them off when patch is applied.

-Vineet
