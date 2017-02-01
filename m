From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 Feb 2017 09:13:24 -0800
Subject: [PATCH 0/3] Updates for ARC VDK platform
In-Reply-To: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
References: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <67bca3fc-8d2a-16b8-d817-89585d6ab1fc@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/01/2017 08:43 AM, Alexey Brodkin wrote:
> This series improves ARC VDK support in upstream Linux kernel by:
>  1) Removal of UP configuration which is no longer supported by ARC VDK.
>     Instead SMP platform with all but master cores halted is used to mimic
>     UP system.

Is this missing from the series ?
