From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 25 Jul 2018 20:56:23 +0000
Subject: [PATCH] Fix the ld flags not be applied to
 tst-execstack-mod.so
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B083DE0@us01wembx1.internal.synopsys.com>
References: <1532081682-25895-1-git-send-email-zong@andestech.com>
 <469dcf75-d652-62ee-8310-ea59ec878a0a@synopsys.com>
 <alpine.DEB.2.20.1807252021030.4746@digraph.polyomino.org.uk>
 <C2D7FE5348E1B147BCA15975FBA23075012B083DE0@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1807252055380.4746@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, 25 Jul 2018, Vineet Gupta wrote:

> But given the dso code has nested function, a well equipped gcc when generating
> trampoline code would also generate the GNU_STACK segment for the dso
> automatically, without need to force the same via the linker flags as is done in
> the Makefile currently. Only when a port's gcc doesn't support this (ARC gcc
> didn't until recently), should we need ld assist, and this could be detected using
> a configure test - No ?

The test should achieve the executable stack markings independent of 
whether nested functions require them on that architecture (for example, 
it should still have the markings on architectures with function 
descriptors).

-- 
Joseph S. Myers
joseph at codesourcery.com
