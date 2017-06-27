From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 27 Jun 2017 11:47:02 +0000
Subject: [RFC 2/6] ARC: Fixed inline asm contraints to gcc 6.x
In-Reply-To: <1498550454-3560-3-git-send-email-vgupta@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1706271146120.17677@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

longlong.h should be kept in sync with GCC.  If the GCC version has been 
fixed we can copy the updated version verbatim from GCC.

-- 
Joseph S. Myers
joseph at codesourcery.com
