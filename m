From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 08:53:52 -0800
Subject: [PATCH] testsuite fix: timezone: failing due to permissions in
 cross testing
In-Reply-To: <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
References: <1545088170-24103-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5352032b-0e36-e8e1-4526-d55d1e9388d2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/17/18 3:25 PM, Joseph Myers wrote:
> root should not be involved in running tests at all; all tests should run 
> as a normal user, the same one that owns the build directory, and thus all 
> files and directories in the build directory should be owned by that user.  
> (Some tests use user namespaces to test functionality that requires root, 
> but that's root inside a namespace, not the real user root.)

I agree with this, but it is really hard /cumbersome to do this in a cross setup,
with a busybox based system. We need the real/full blown utilities and do this
natively.
