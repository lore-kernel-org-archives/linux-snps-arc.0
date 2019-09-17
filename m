From: vineetg76@gmail.com (Vineet Gupta)
Date: Tue, 17 Sep 2019 14:08:11 -0700
Subject: [PATCH 3/6] ARC: mm: TLB Miss optim: avoid re-reading ECR
In-Reply-To: <CY4PR1201MB0120D19524D7D3F184E2B181A18C0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190916213207.12792-1-vgupta@synopsys.com>
 <20190916213207.12792-4-vgupta@synopsys.com>
 <CY4PR1201MB0120D19524D7D3F184E2B181A18C0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <816b790f-f412-de6c-ee5d-df0ab3793d58@gmail.com>
To: linux-snps-arc@lists.infradead.org

On 9/16/19 4:36 PM, Alexey Brodkin wrote:
>>
>>  	;----------------------------------------------------------------
>>  	; UPDATE_PTE: Let Linux VM know that page was accessed/dirty
> 
> I'd suggest to put a BOLD comment here saying that we rely on previously
> set condition flag so that whoever reads or (even worse) modifies that or
> previous code keeps in mind that we shouldn't clobber a particular flag.

The flag setting code is only a few lines prior. It would be messy to annotate for
flag checking instruction where the flags are clobbered. This is low level
assembly code - not for faint hearted.
