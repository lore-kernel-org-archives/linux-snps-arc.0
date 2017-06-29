From: joseph@codesourcery.com (Joseph Myers)
Date: Thu, 29 Jun 2017 15:29:19 +0000
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <5a738e1a-fac6-3dbb-3c3f-744b12966dd7@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
 <5a738e1a-fac6-3dbb-3c3f-744b12966dd7@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1706291526330.7727@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, 29 Jun 2017, Vineet Gupta wrote:

> I regenerated the ABI files, but it seems generated  libc abilist is lacking
> malloc_{get,set}_stated and had to be added manually - which causes a
> subsequent testsuite failure. Is this (manual addition of entries to abi file)
> correct or is this a deficiency of ARC port.

malloc_get_state and malloc_set_state have been obsoleted, meaning that 
they are not included in any new ports, are not included in static libc 
for any port and in shared libc in existing ports they are compat symbols 
that new binaries can't be linked against.  (Yes, the testsuite work to 
support ports postdating that obsoletion is still needed.)

> Speaking of testsuite, since this is bootstrapping a glibc system we have to
> resort to using scripts/cross-test-ssh.sh which is a serious pain in the neck.
> Is there no easy way to build the whole test suite first and then just run it
> on target.

You can probably build the testsuite with "make check" without setting 
test-wrapper, presuming you've fixed all issues with compilation of the 
testsuite, then rerun "make check" with test-wrapper specified to run the 
execution tests.  I don't know whether transferring the build directory to 
a different system for a native "make check" would work, but at least lots 
of tools would be required on the target to do so.

-- 
Joseph S. Myers
joseph at codesourcery.com
