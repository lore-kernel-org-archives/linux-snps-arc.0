From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 19:40:25 +0300
Subject: [RFC 2/6] ARC: Fixed inline asm contraints to gcc 6.x
In-Reply-To: <alpine.DEB.2.20.1706271146120.17677@digraph.polyomino.org.uk>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-3-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271146120.17677@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <42b1e1e9-6c29-4ee8-3fc7-ab220e217908@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/27/2017 02:47 PM, Joseph Myers wrote:
> longlong.h should be kept in sync with GCC.  If the GCC version has been
> fixed we can copy the updated version verbatim from GCC.

Indeed it is fixed in upstream gcc.

	commit 608e1e3746f5242f0b0987ce64ca99969c33fb48
	Author: claziss <claziss at 138bc75d-0d04-0410-961f-82ee72b054a4>
	Date:   Fri Apr 29 10:11:25 2016 +0000

	    [ARC] Fix obsolete constrain


So I drop this patch from my series and rely on glibc upstream to have this fixed ?
