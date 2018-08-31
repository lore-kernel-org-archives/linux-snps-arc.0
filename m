From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 31 Aug 2018 00:52:08 +0000
Subject: [PATCH] arc: remove redundant GCC version checks
References: <1535339257-17620-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B09102E@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/26/2018 08:08 PM, Masahiro Yamada wrote:
> Commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
> bumped the minimum GCC version to 4.6 for all architectures.
>
> With GCC >= 4.6 assumed, 'upto_gcc44' is empty, 'atleast_gcc44' is y.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>

Added to ARC/for-curr

Thx,
-Vineet
