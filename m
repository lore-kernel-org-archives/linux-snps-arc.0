From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 22 Sep 2017 09:16:24 -0700
Subject: [PATCH] arch: remove unused *_segments() macros/functions
In-Reply-To: <20170922074242.20868-1-tklauser@distanz.ch>
References: <20170922074242.20868-1-tklauser@distanz.ch>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9d3545c5-367c-da94-bbbf-b260ef4bf2d8@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/22/2017 12:42 AM, Tobias Klauser wrote:
> Some architectures define the no-op macros/functions copy_segments,
> release_segments and forget_segments. These are used nowhere in the
> tree, so removed them.
> 
> Signed-off-by: Tobias Klauser <tklauser at distanz.ch>
> ---
>   arch/arc/include/asm/processor.h        |  3 ---

Acked-by: Vineet Gupta <vgupta at synopsys.com>   [for arch/arc]

Thx,
-Vineet
