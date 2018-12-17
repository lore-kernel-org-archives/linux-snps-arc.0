From: joseph@codesourcery.com (Joseph Myers)
Date: Mon, 17 Dec 2018 23:25:23 +0000
Subject: [PATCH] testsuite fix: timezone: failing due to permissions in
 cross testing
In-Reply-To: <1545088170-24103-1-git-send-email-vgupta@synopsys.com>
References: <1545088170-24103-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, 17 Dec 2018, Vineet Gupta wrote:

> timezone test driver "zic" creates testdata directory wuth umask 755, so
> only root owner/group has write permissions. However the buildroot

root should not be involved in running tests at all; all tests should run 
as a normal user, the same one that owns the build directory, and thus all 
files and directories in the build directory should be owned by that user.  
(Some tests use user namespaces to test functionality that requires root, 
but that's root inside a namespace, not the real user root.)

So I think you need to explain more about your test configuration that 
results in permissions problems so we can tell if you have a valid test 
configuration at all.

-- 
Joseph S. Myers
joseph at codesourcery.com
