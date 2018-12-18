From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 23:24:13 +0000
Subject: [PATCH 04/21] ARC: startup and dynamic linking code
In-Reply-To: <1545167083-16764-5-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-5-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182323370.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> +/*
> + * Dynamic Linking ABI for ARCv2 ISA
> + *

glibc does not use leading '*' on each line of a comment (needs fixing 
throughout this file).

-- 
Joseph S. Myers
joseph at codesourcery.com
