From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 30 Jan 2019 02:20:05 +0000
Subject: [PATCH v2 15/15] make-syscalls.sh: fix comment referencing
 syscall-template
In-Reply-To: <1548811555-24373-16-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <1548811555-24373-16-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1901300218570.24454@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

This particular patch is OK after 2.29 has been released and master has 
opened for 2.30 development, but such architecture-independent fixes ought 
not be considered part of the port submission (see 
<https://sourceware.org/glibc/wiki/NewPorts>).

-- 
Joseph S. Myers
joseph at codesourcery.com
