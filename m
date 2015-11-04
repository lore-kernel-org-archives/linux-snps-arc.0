From: nicolas.pitre@linaro.org (Nicolas Pitre)
Date: Wed, 4 Nov 2015 18:46:44 -0500 (EST)
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <yw1xy4ekb68f.fsf@unicorn.mansr.com>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
 <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
 <yw1xa8r0cyx8.fsf@unicorn.mansr.com>
 <alpine.LFD.2.20.1510301113530.630@knanqh.ubzr>
 <1446220442.4394.42.camel@synopsys.com>
 <alpine.LFD.2.20.1510301253140.630@knanqh.ubzr>
 <yw1xy4ekb68f.fsf@unicorn.mansr.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.LFD.2.20.1511041835380.630@knanqh.ubzr>
To: linux-snps-arc@lists.infradead.org

On Fri, 30 Oct 2015, M?ns Rullg?rd wrote:

> Nicolas Pitre <nicolas.pitre at linaro.org> writes:
> 
> > I'm going to do it anyway given that I already have it for ARM.  It'll 
> > be opt-in, so if your arch doesn't provide it then the current C 
> > implementation will be used by default.
> 
> Great.  I'll try it out on MIPS once you've posted the patch.

You should have seen the patches by now.

I've put them along with a bunch of do_div() usage fixes here:

  http://git.linaro.org/people/nicolas.pitre/linux.git


Nicolas
