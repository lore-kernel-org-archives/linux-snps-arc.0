From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 3 Jun 2019 18:08:35 +0000
Subject: single copy atomicity for double load/stores on 32-bit systems
References: <2fd3a455-6267-5d21-c530-41964a4f6ce9@synopsys.com>
 <20190531082112.GH2623@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A2522B5B@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/31/19 1:21 AM, Peter Zijlstra wrote:
>> I'm not sure how to interpret "natural alignment" for the case of double
>> load/stores on 32-bit systems where the hardware and ABI allow for 4 byte
>> alignment (ARCv2 LDD/STD, ARM LDRD/STRD ....)
> Natural alignment: !((uintptr_t)ptr % sizeof(*ptr))
>
> For any u64 type, that would give 8 byte alignment. the problem
> otherwise being that your data spans two lines/pages etc..

Sure, but as Paul said, if the software doesn't expect them to be atomic by
default, they could span 2 hardware lines to keep the implementation simpler/sane.
