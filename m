From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 7 Oct 2016 14:42:07 -0700
Subject: [PATCH] ARC: [build] Support gz, lzma compressed uImage
In-Reply-To: <1475624067-17290-1-git-send-email-danielmentz@google.com>
References: <1475624067-17290-1-git-send-email-danielmentz@google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <31ddce6b-284c-1632-9384-22603ce03663@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/04/2016 04:34 PM, Daniel Mentz wrote:
> Add support for lzma compressed uImage.
> 
> Support for gzip was already available but could not be enabled because
> we were missing CONFIG_HAVE_KERNEL_GZIP in arch/arc/Kconfig.
> 
> Signed-off-by: Daniel Mentz <danielmentz at google.com>
> Cc: linux-snps-arc at lists.infradead.org
> Cc: Vineet Gupta <Vineet.Gupta1 at synopsys.com>

Applied to for-curr.

Thx Daniel
-Vineet
