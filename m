From: joseph@codesourcery.com (Joseph Myers)
Date: Thu, 26 Jul 2018 15:01:31 +0000
Subject: [PATCH] Fix the ld flags not be applied to
 tst-execstack-mod.so
In-Reply-To: <CA+ZOyag4f-VxpX84UDb7tO9EKsXSLV3CCwo+WTyiXk==h==EiA@mail.gmail.com>
References: <1532081682-25895-1-git-send-email-zong@andestech.com>
 <469dcf75-d652-62ee-8310-ea59ec878a0a@synopsys.com>
 <alpine.DEB.2.20.1807252021030.4746@digraph.polyomino.org.uk>
 <C2D7FE5348E1B147BCA15975FBA23075012B083DE0@us01wembx1.internal.synopsys.com>
 <alpine.DEB.2.20.1807252055380.4746@digraph.polyomino.org.uk>
 <CA+ZOyag4f-VxpX84UDb7tO9EKsXSLV3CCwo+WTyiXk==h==EiA@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1807261500580.25831@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, 26 Jul 2018, Zong Li wrote:

> In glibc now, this option doesn't pass to linker, the module is still 
> not executable on stack. I think that we need this patch to fix up it or 
> another patch to remove the variable in Makefile if it is not necessary. 
> Both are fine for me. For now, it is a little bit strange because it 
> present in Makefile but has no effect.

I think we should have the option in a properly named variable.  But the 
patch will need review and we're currently in a release freeze.

-- 
Joseph S. Myers
joseph at codesourcery.com
