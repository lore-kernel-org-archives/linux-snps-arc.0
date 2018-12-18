From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 17:17:53 +0000
Subject: [PATCH] testsuite fix: timezone: failing due to permissions in
 cross testing
In-Reply-To: <87a7l342rw.fsf@oldenburg2.str.redhat.com>
References: <1545088170-24103-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
 <87a7l342rw.fsf@oldenburg2.str.redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812181716180.2407@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Florian Weimer wrote:

> There are also some xtests that require root privileges, such as
> nptl/tst-setuid1.  Building and testing as root is supported (but

That looks like it ought to become a test using user namespaces (and so 
not an xtest).

> obviously not recommended unless you use a throwaway machine).

And the combination of some parts of the testsuite writing to the build 
directory as root and other parts as a normal user isn't supported, in 
particular.

-- 
Joseph S. Myers
joseph at codesourcery.com
