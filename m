From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Fri, 03 Jun 2016 09:50:40 +0200
Subject: [RFC v3 02/45] dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <CAMuHMdXWMf7Dt77wSUj8NytQqb99jzDiAz46kJkAEz+6BX3Uvw@mail.gmail.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
 <1464881987-13203-3-git-send-email-k.kozlowski@samsung.com>
 <CAMuHMdXWMf7Dt77wSUj8NytQqb99jzDiAz46kJkAEz+6BX3Uvw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <575136D0.6000101@samsung.com>
To: linux-snps-arc@lists.infradead.org

On 06/03/2016 09:17 AM, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Jun 2, 2016 at 5:39 PM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> --- a/include/linux/dma-mapping.h
>> +++ b/include/linux/dma-mapping.h
>> @@ -5,13 +5,25 @@
> 
>> +/**
>> + * List of possible attributes associated with a DMA mapping. The semantics
>> + * of each attribute should be defined in Documentation/DMA-attributes.txt.
>> + */
>> +#define DMA_ATTR_WRITE_BARRIER         (1UL << 1)
> 
> Any particular reason they start at 2, not 1?

No reason. I'll fix this in next version (and trim Cc-list). Anyway the
values of constants won't match old ones but that should not be problem
(unless they are hard-coded somewhere).

Best regards,
Krzysztof
