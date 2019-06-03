From: paulmck@linux.ibm.com (Paul E. McKenney)
Date: Mon, 3 Jun 2019 13:13:24 -0700
Subject: single copy atomicity for double load/stores on 32-bit systems
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501A2522B5B@us01wembx1.internal.synopsys.com>
References: <2fd3a455-6267-5d21-c530-41964a4f6ce9@synopsys.com>
 <20190531082112.GH2623@hirez.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA2307501A2522B5B@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190603201324.GN28207@linux.ibm.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Jun 03, 2019@06:08:35PM +0000, Vineet Gupta wrote:
> On 5/31/19 1:21 AM, Peter Zijlstra wrote:
> >> I'm not sure how to interpret "natural alignment" for the case of double
> >> load/stores on 32-bit systems where the hardware and ABI allow for 4 byte
> >> alignment (ARCv2 LDD/STD, ARM LDRD/STRD ....)
> > Natural alignment: !((uintptr_t)ptr % sizeof(*ptr))
> >
> > For any u64 type, that would give 8 byte alignment. the problem
> > otherwise being that your data spans two lines/pages etc..
> 
> Sure, but as Paul said, if the software doesn't expect them to be atomic by
> default, they could span 2 hardware lines to keep the implementation simpler/sane.

I could imagine 8-byte types being only four-byte aligned on 32-bit systems,
but it would be quite a surprise on 64-bit systems.

							Thanx, Paul
