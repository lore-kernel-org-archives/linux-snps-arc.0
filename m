From: jslaby@suse.cz (Jiri Slaby)
Date: Mon, 30 May 2016 16:38:48 +0200
Subject: ARC stable backport request
In-Reply-To: <57458FE3.1070205@synopsys.com>
References: <57458FE3.1070205@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fa122cb9-e516-0ab8-26c1-d38d5010f505@suse.cz>
To: linux-snps-arc@lists.infradead.org

On 05/25/2016, 01:43 PM, Vineet Gupta wrote:
> Can we please backport a6416f57ce57fb390b "ARC: use ASL assembler mnemonic".
> Newer binutils don't like ASL instruction and fail to build kernels prior to v4.4
> which added this fix.

Added to 3.12. Thanks.


-- 
js
suse labs
