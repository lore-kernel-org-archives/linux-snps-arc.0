From: joseph@codesourcery.com (Joseph Myers)
Date: Mon, 6 Nov 2017 23:08:53 +0000
Subject: [RFC 0/6] glibc port to ARC architecture
In-Reply-To: <5a247430-83e7-8a75-3935-6307233ffbd1@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <357a6f84-3f71-d3b7-9c19-4f0390e5db8d@redhat.com>
 <alpine.DEB.2.20.1706271157100.17677@digraph.polyomino.org.uk>
 <5a247430-83e7-8a75-3935-6307233ffbd1@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1711062303011.30112@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, 6 Nov 2017, Vineet Gupta wrote:

>   - How do I call it the first time, with my existing version of glibc.
>     The checkout process, gets upstream glibc and tries to build that instead.

build-many-glibcs.py <dir> checkout
[replace the src/glibc directory there with a different branch if desired]
build-many-glibcs.py <dir> host-libraries
build-many-glibcs.py <dir> compilers <targets>
build-many-glibcs.py <dir> glibcs <targets>

(It won't actually check that components are checked out from the 
repositories / branches it thinks they are, so replacing by a checkout 
from a different location should work fine.)

It's expected that upstream glibc should work with upstream versions of 
the relevant other toolchain components; we don't want a repeat of the 
NaCl situation, or the situation with MicroBlaze for a long time, where 
required changes either never got upstream or took a very long time to get 
upstream.  It's possible for very new ports that it only works with 
upstream mainline and not the most recent releases, although I'd encourage 
you to act like the RISC-V maintainers and e.g. actively backport 
important fixes to the most recent binutils release branch.

"work" should include clean results from the compilation tests, as run by 
build-many-glibcs.py for the "glibcs" action.

-- 
Joseph S. Myers
joseph at codesourcery.com
