From: hch@lst.de (hch@lst.de)
Date: Fri, 18 May 2018 18:50:46 +0200
Subject: arc dma mapping cleanups/fixes and generic noncohernt dma code
In-Reply-To: <dfa0f4a194553f9bdd7bf4d56ac75d91cedc2609.camel@synopsys.com>
References: <20180518134545.5036-1-hch@lst.de>
 <dfa0f4a194553f9bdd7bf4d56ac75d91cedc2609.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180518165046.GA4671@lst.de>
To: linux-snps-arc@lists.infradead.org

On Fri, May 18, 2018@02:49:36PM +0000, Alexey Brodkin wrote:
> So if we set aside my complaints about direction in arch_sync_dma_for_{device|cpu}()...

Many other architectures use the argument.  Various of those look bogus,
but for now I want to be able to do straight forward conversions.  If
we end up not needing the argument in the end we can still remove it
eventually.
