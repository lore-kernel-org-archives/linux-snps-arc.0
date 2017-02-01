From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 1 Feb 2017 17:15:57 +0000
Subject: [PATCH 0/3] Updates for ARC VDK platform
In-Reply-To: <67bca3fc-8d2a-16b8-d817-89585d6ab1fc@synopsys.com>
References: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
 <67bca3fc-8d2a-16b8-d817-89585d6ab1fc@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485969357.5515.29.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2017-02-01@09:13 -0800, Vineet Gupta wrote:
> On 02/01/2017 08:43 AM, Alexey Brodkin wrote:
> > 
> > This series improves ARC VDK support in upstream Linux kernel by:
> > ?1) Removal of UP configuration which is no longer supported by ARC VDK.
> > ????Instead SMP platform with all but master cores halted is used to mimic
> > ????UP system.
> 
> Is this missing from the series ?

Indeed, I was doing 2 things in parallel and so missed -1 patch :(
I may either send v2 with missing patch included or save it for another series
that ditches most of UP configs as well. What suits you better?

-Alexey
