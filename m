From: joseph@codesourcery.com (Joseph Myers)
Date: Mon, 17 Dec 2018 23:42:21 +0000
Subject: [PATCH] testsuite fix: timezone: failing due to permissions in
 cross testing
In-Reply-To: <6bf15909-aac2-62ea-342b-79cf8e99f13d@synopsys.com>
References: <1545088170-24103-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
 <6bf15909-aac2-62ea-342b-79cf8e99f13d@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812172340380.9554@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, 17 Dec 2018, Vineet Gupta wrote:

> The setup is obviously is cross test, built using buildroot. The system is minimal
> with root allowed w/o password to enable tests to run quickly.
> 
> On host I do the following which certainly involves root.
> 
> | make test-wrapper='<path-to-build-folder>/scripts/cross-test-ssh.sh
> root at 192.168.0.20' xcheck
> 
> So guess it needs to be sshd or some other user on target ?

The user on target should be the same as the user on the system where you 
build glibc (you may need to create a corresponding user on the target).

-- 
Joseph S. Myers
joseph at codesourcery.com
