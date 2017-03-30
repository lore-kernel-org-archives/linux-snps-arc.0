From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 30 Mar 2017 14:26:30 +0000
Subject: [PATCH] arcv2: Make sure busy bit is set properly on SLC flushing
In-Reply-To: <35ad9cda-d493-869f-c65b-9d1ad5382ff3@synopsys.com>
References: <1490796911-4848-1-git-send-email-abrodkin@synopsys.com>
 <35ad9cda-d493-869f-c65b-9d1ad5382ff3@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1490883989.7449.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2017-03-29@16:41 -0700, Vineet Gupta wrote:
> On 03/29/2017 07:15 AM, Alexey Brodkin wrote:
> > 
> > As reported in STAR 9001165532 if data cache gets disabled right before
> > L2 cache invalidation we may read wrong value of L2 cache "busy" bit.
> > So we won't wait before L2 cache gets properly flushed and so some
> > data might not reach DDR at all thus we'll use older values from DDR
> > next time they are accessed.
> > 
> > For now we use a work-around with one extra read from SLC's control
> > register which guarantees next read will return real value of "busy"
> > bit.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> 
> Thx Alexey - pushed to for-curr !

Care to add for-stable tag?

-Alexey
