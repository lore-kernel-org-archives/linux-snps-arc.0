From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 17 Dec 2018 15:38:25 -0800
Subject: [PATCH] testsuite fix: timezone: failing due to permissions in
 cross testing
In-Reply-To: <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
References: <1545088170-24103-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <6bf15909-aac2-62ea-342b-79cf8e99f13d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/17/18 3:25 PM, Joseph Myers wrote:
> On Mon, 17 Dec 2018, Vineet Gupta wrote:
> 
>> timezone test driver "zic" creates testdata directory wuth umask 755, so
>> only root owner/group has write permissions. However the buildroot
> root should not be involved in running tests at all; all tests should run 
> as a normal user, the same one that owns the build directory, and thus all 
> files and directories in the build directory should be owned by that user.  
> (Some tests use user namespaces to test functionality that requires root, 
> but that's root inside a namespace, not the real user root.)
> 
> So I think you need to explain more about your test configuration that 
> results in permissions problems so we can tell if you have a valid test 
> configuration at all.

The setup is obviously is cross test, built using buildroot. The system is minimal
with root allowed w/o password to enable tests to run quickly.

On host I do the following which certainly involves root.

| make test-wrapper='<path-to-build-folder>/scripts/cross-test-ssh.sh
root at 192.168.0.20' xcheck

So guess it needs to be sshd or some other user on target ?
