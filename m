From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 3 Jul 2019 16:15:09 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <991ace9d-ef6d-0f29-d4f4-03ba47a7f7ff@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 6/18/19 9:16 AM, Vineet Gupta wrote:
> On 6/14/19 9:41 AM, Eugeniy Paltsev wrote:
>> Implement jump label patching for ARC. Jump labels provide
>> an interface to generate dynamic branches using
>> self-modifying code.
>>
>> This allows us to implement conditional branches where
>> changing branch direction is expensive but branch selection
>> is basically 'free'
>>
>> This implementation uses 32-bit NOP and BRANCH instructions
>> which forced to be aligned by 4 to guarantee that they don't
>> cross L1 cache line and can be update atomically.
>>
>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> LGTM overall - nits below.
> 

Can you address the review comments soon so this gets merged in 5.3 whose merge
window is looming !
