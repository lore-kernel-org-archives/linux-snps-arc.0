From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 13 Jun 2019 20:35:26 +0000
Subject: ARC Assembler: bundle_align_mode directive support
References: <3962a9ad199cea45b1cfadb80be551aab83b7028.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A2525686@us01wembx1.internal.synopsys.com>
 <d79085cbc6126c2a4fad173934e1e9b29523abba.camel@synopsys.com>
 <02fcd330-8b3c-a3cb-0aa9-e91bca6b6d0f@synopsys.com>
 <8a027c250d7bd14ff107c169351af6a04a6d8334.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A2526536@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 6/13/19 11:14 AM, Eugeniy Paltsev wrote:
> BTW:
> there is discussion in Linux ML about implementation of static calls.
> The idea is to patch immediate operand in jump instruction instead of using function pointers to optimize hot code.
> @vineet I bet you'll like this :)
>
> Current v3 patch revision is for x86 only and it's not applied yet. However I expect (based on comments to last patches)
> it'll be applied after several respins. 

Indeed when researching on jump labels I saw that and indeed like that approach a lot.


> It would be nice to implement it for ARC too.

Absolutely.

> And x86 static calls implementation uses '.bundle_align_mode' directive too.

Ok then we have a case for pushing for this feature in tools !
