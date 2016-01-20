From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 20 Jan 2016 13:35:49 +0530
Subject: [PATCH 2/2] arc770: move arc patches to taregt/linux/generic
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E851F3@us01wembx1.internal.synopsys.com>
References: <1452813142-9857-1-git-send-email-abrodkin@synopsys.com>
 <1452813142-9857-3-git-send-email-abrodkin@synopsys.com>
 <5698CDBD.2010908@openwrt.org> <1452854954.18381.37.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8518B@us01wembx1.internal.synopsys.com>
 <5698ED16.1040107@openwrt.org>
 <C2D7FE5348E1B147BCA15975FBA23075F4E851F3@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <569F3FDD.6090805@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 15 January 2016 06:47 PM, Vineet Gupta wrote:
>>  I also don't think there's anything architecture
>> > specific about requiring DEVTMPFS or not, so I'd say it doesn't make any
>> > sense to select it from arch/arc/Kconfig.
> You are indeed right - Kconfig is not the "ideal" place to add this (it's not like
> we support PCI or not) and it best belongs to *defconfigs.

Alexey do u mind spinning a patchset which
1. Adds DEVTMFS to our defconfigs where we need them
2. Removes the select for same from Kconfig

-Vineet
