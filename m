From: vincent.weaver@maine.edu (Vince Weaver)
Date: Mon, 9 May 2016 09:54:30 -0400 (EDT)
Subject: [RFC 2/2] perf/core: change errno for sampling event not supported
 in hardware
In-Reply-To: <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
References: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
 <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1605090923460.27332@macbook-air>
To: linux-snps-arc@lists.infradead.org

On Mon, 9 May 2016, Vineet Gupta wrote:

> This allows userspace to identify this case specifically from the
> catch all error msg it prints currently.
> 
> This is an ABI change

An ABI change which will probably break things.

The original change from ENODEV to ENOTSUPP managed to break things 
although it took four kernel releases before anyone noticed.

The usage of ENOTSUPP was my fault, though I feel like at the time I was 
told that ENOTSUPP is for internal kernel usage and would be converted to 
EOPNOTSUPP when returning an error to userspace.  But now I 
can't find any sort of reference for that at all, except the fact that

	/usr/include/x86_64-linux-gnu/bits/errno.h

has
	/* Linux has no ENOTSUP error code.  */
	# define ENOTSUP EOPNOTSUPP

in it... but wait, that's ENOTSUP not ENOTSUPP.  Blargh.

Vince
