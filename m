From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 28 Jun 2019 22:59:33 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7ef18a49-cc5a-6cd1-bed3-beec003a73c3@synopsys.com>
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
> 
> LGTM overall - nits below.

@Peter can we have your reviewed/ack or some such assuming you don't have any
objections !

Thx,
-Vineet
