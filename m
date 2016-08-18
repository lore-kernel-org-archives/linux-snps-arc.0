From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Thu, 18 Aug 2016 06:22:55 +0200
Subject: [uclibc-ng-devel] [uClibc] ARC: Support syscall ABI v4
In-Reply-To: <1471385067-1671-1-git-send-email-vgupta@synopsys.com>
References: <1471385067-1671-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160818042255.GK22524@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,
Vineet Gupta wrote,

> The syscall ABI includes the gcc functional calling ABI since a syscall
> implies userland caller and kernel callee.
> 
> The current gcc ABI (v3) for ARCv2 ISA required 64-bit data be passed in
> even-odd register pairs, (potentially punching reg holes when passing such
> values as args). This was partly driven by the fact that the double-word
> LDD/STD instructions in ARCv2 expect the register alignment and thus gcc
> forcing this avoids extra MOV at the cost of a few unused register (which we
> have plenty anyways).
> 
> This however was rejected as part of upstreaming gcc port to HS. So the new
> ABI v4 doesn't enforce the even-odd reg restriction.
> 
> Do note that for ARCompact ISA builds v3 and v4 are practically the same in
> terms of gcc code generation.
> 
> This change is dormant for now (gcc 4.8.x based tools) and will only kick
> in with switch to gcc 6.x based tools.
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Thanks, applied and pushed,
 Waldemar
