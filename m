From: joseph@codesourcery.com (Joseph Myers)
Date: Thu, 20 Dec 2018 21:59:13 +0000
Subject: test related questions (was Re: [PATCH 00/21] glibc port to ARC
 processors)
In-Reply-To: <70d4ad50-ac0a-1f75-ee5f-537ba67570a8@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <70d4ad50-ac0a-1f75-ee5f-537ba67570a8@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812202152340.24773@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, 20 Dec 2018, Vineet Gupta wrote:

> On 12/18/18 1:04 PM, Vineet Gupta wrote:
> > (a) build-many-glibcs.py check results are clean
> > 
> > | Summary of test results:
> > |   1173 PASS
> > |      15 XFAIL
> > |
> > | PASS: glibcs-arc-linux-gnu check
> 
> One of the issues in running build-many incrementally, i.e. "host-libraries",
> "compilers" only once but "glibcs" again to quickly test fixes is that for 2nd
> run, target c++ compiler is picked up for support/links-dso-program vs.
> links-dso-program-c which fails as the cpp headers are not present. Is there a
> solution to that ?

I'm not aware of that problem.  The C++ headers certainly should be 
available in the compilers installed by the "compilers" step.  My bots 
using GCC 7 and 8 branches only rebuild the compilers once a week unless 
build-many-glibcs.py itself changes.

> One of the pesky issues with cross testing is localedata/gen-locale.sh 
> kicking on target, which despite being 1GHz gets in the way of quick 
> iterations. Is there a way to build those on host and simply 
> reference/install them on target. I understand this is more of a 
> buildsystem question (buildroot), but any pointers would be appreciated.

It's possible to set up an external build system that extracts the list of 
locales for testing from localedata/Makefile, builds them using the same 
version of localedef built for the build system and appropriate options 
for endianness and uint32_t alignment (if necessary) and copies them into 
the right places in the glibc build tree before running the glibc tests.  
It does have to be the same version of localedef since the binary locale 
format can change depending on the glibc version.

-- 
Joseph S. Myers
joseph at codesourcery.com
