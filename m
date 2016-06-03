From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Fri, 03 Jun 2016 09:55:48 +0200
Subject: [RFC v3 01/45] powerpc: dma-mapping: Don't hard-code the value of
 DMA_ATTR_WEAK_ORDERING
In-Reply-To: <1464881987-13203-2-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
 <1464881987-13203-2-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57513804.9020309@samsung.com>
To: linux-snps-arc@lists.infradead.org

On 06/02/2016 05:39 PM, Krzysztof Kozlowski wrote:
> Hard-coded value of DMA_ATTR_WEAK_ORDERING is then compared with the
> symbol.  This will stop matching if the value of symbol is changed (when
> switching DMA attributes to unsigned long).
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
> ---
>  arch/powerpc/platforms/cell/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
> index 14a582b21274..0c2794d2b6c0 100644
> --- a/arch/powerpc/platforms/cell/iommu.c
> +++ b/arch/powerpc/platforms/cell/iommu.c
> @@ -1162,7 +1162,7 @@ static int __init setup_iommu_fixed(char *str)
>  	pciep = of_find_node_by_type(NULL, "pcie-endpoint");
>  
>  	if (strcmp(str, "weak") == 0 || (pciep && strcmp(str, "strong") != 0))
> -		iommu_fixed_is_weak = 1;
> +		iommu_fixed_is_weak = DMA_ATTR_WEAK_ORDERING;

After some more thoughts given to this, I think my fix is not correct.
The 'iommu_fixed_is_weak' stores the bool and it is used to compare with
result of test_bit().

Please ignore this patch.

Best regards,
Krzysztof
