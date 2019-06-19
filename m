From: Claudiu.Zissulescu@synopsys.com (Claudiu Zissulescu)
Date: Wed, 19 Jun 2019 10:00:07 +0000
Subject: ARC Assembler: bundle_align_mode directive support
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501A2526536@us01wembx1.internal.synopsys.com>
References: <3962a9ad199cea45b1cfadb80be551aab83b7028.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A2525686@us01wembx1.internal.synopsys.com>
 <d79085cbc6126c2a4fad173934e1e9b29523abba.camel@synopsys.com>
 <02fcd330-8b3c-a3cb-0aa9-e91bca6b6d0f@synopsys.com>
 <8a027c250d7bd14ff107c169351af6a04a6d8334.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A2526536@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <BN8PR12MB28491137314B8D287164B516CAE50@BN8PR12MB2849.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

 
> > And x86 static calls implementation uses '.bundle_align_mode' directive
> too.
> 
> Ok then we have a case for pushing for this feature in tools !

Still, I cannot understand how you want to use bundle_align_mode without the align directive.
