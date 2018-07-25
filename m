From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 25 Jul 2018 20:22:12 +0000
Subject: [PATCH] Fix the ld flags not be applied to
 tst-execstack-mod.so
In-Reply-To: <469dcf75-d652-62ee-8310-ea59ec878a0a@synopsys.com>
References: <1532081682-25895-1-git-send-email-zong@andestech.com>
 <469dcf75-d652-62ee-8310-ea59ec878a0a@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1807252021030.4746@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, 25 Jul 2018, Vineet Gupta wrote:

> Chiming in as I'm looking into these things myself in context of testing 
> for ARC port submission. Do we really need to fix this part - in this 
> way. I'd vote to not force the execstack through linker and rely on gcc 
> generating this itself when it knows it doing something for trampolines. 
> And only if target gcc doesn't support it (detected via configure test) 
> should this be done.

The whole point of this test is to verify executable stack changes on 
dlopen of a module requiring an executable stack.  Thus, for this test to 
work correctly, this module must be forced to have a marking as needing an 
executable stack.

-- 
Joseph S. Myers
joseph at codesourcery.com
