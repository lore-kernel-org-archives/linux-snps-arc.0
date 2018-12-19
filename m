From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 19 Dec 2018 18:07:50 +0000
Subject: ARC vs. generic sigaction (was Re: [PATCH 08/21] ARC: Linux
 Syscall Interface)
In-Reply-To: <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
 <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
 <05069752-0a66-d6ca-e249-5c702eec4e99@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812191801160.27531@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, 19 Dec 2018, Vineet Gupta wrote:

> I took a stab at this but not really happy with taking this approach.
> 
> (1). Common code assumes disparate kernel and userland sigaction struct even
> though there's no reason for a *new* port to be: its not like all glibc code is
> shared/common although I agree it is best to do so as much as possible
> So this requires explicit copy over of 1 struct into other, when it could have
> been avoided altogether for some cases atleast (!SA_RESTORER).

So make the generic code optimize those cases based on appropriate 
conditionals (making sure to verify those conditionals are right for every 
architecture in glibc).

Any new architecture having much architecture-specific code for the kernel 
interface in glibc, beyond the basic definitions of how to call a syscall, 
is suspect, given that the kernel structures should be consistent across 
asm-generic architectures; we ought to make the defaults work so they are 
genuinely suitable as defaults for new architectures.  This may require 
changes to the sysdeps/unix/sysv/linux/ code if it's currently "generic" 
to old architectures but not so good for asm-generic ones.

-- 
Joseph S. Myers
joseph at codesourcery.com
