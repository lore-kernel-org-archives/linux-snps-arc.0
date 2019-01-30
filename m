From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 30 Jan 2019 02:29:56 +0000
Subject: [PATCH v2 00/15] glibc port to ARC processors
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

In the absence of clear consensus regarding consideration of new ports to 
undocumented architectures (which would need to result in consensus on 
suitable rules on the subject to go in 
<https://sourceware.org/glibc/wiki/NewPorts>), and in the absence of 
suitable public architecture and ABI documentation, I don't intend to 
attempt review of this or subsequent versions of the port submission.  (I 
am supposing that the documentation available at 
<http://me.bios.io/ARC_disassembly> - which in any case does not include 
an ABI reference - is for an architecture version too old to be sufficient 
for understanding and maintaining the port code as may be needed in the 
course of glibc maintenance.)

-- 
Joseph S. Myers
joseph at codesourcery.com
