From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 18 May 2018 17:03:18 -0700
Subject: arc dma mapping cleanups/fixes and generic noncohernt dma code
In-Reply-To: <20180518134545.5036-1-hch@lst.de>
References: <20180518134545.5036-1-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9c4eabb9-e44e-4f1b-f7ee-250eba0ec4cb@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 05/18/2018 06:45 AM, Christoph Hellwig wrote:
> Hi all,
>
> this series continues consolidating the dma-mapping code, with a focus
> on architectures that do not (always) provide cache coherence for DMA.
> Three architectures (arm, mips and powerpc) are still left to be
> converted later due to complexity of their dma ops selection.
>
> The dma-noncoherent ops calls the dma-direct ops for the actual
> translation of streaming mappins and allow the architecture to provide
> any cache flushing required for cpu to device and/or device to cpu
> ownership transfers.  The dma coherent allocator is for now still left
> entirely to architecture supplied implementations due the amount of
> variations.  Hopefully we can do some consolidation for them later on
> as well.
>
> Because this series sits on top of two previously submitted series
> a git tree might be useful to actually test it.  It is provided here:
>
>      git://git.infradead.org/users/hch/misc.git arc-dma
>
> Gitweb:
>
>      https://urldefense.proofpoint.com/v2/url?u=http-3A__git.infradead.org_users_hch_misc.git_shortlog_refs_heads_arc-2Ddma&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=7FgpX6o3vAhwMrMhLh-4ZJey5kjdNUwOL2CWsFwR4T8&m=9mEjcnTLzOrHy9MqruvxfxgCZQ1c0Bs4EQ8F7G-F4M8&s=TV7HWlNcSsk79JReNvLa5u1vsIkJxrk_s6RsL5CMNW4&e=
>
> Changes since previous bigger series:
>   - take the offset into account in noncoherent_dma_map_page (Alexey Brodkin)
>   - fix dma directions in arc (Alexey Brodkin)
>   - split arc changes into smaller patches
>

LGTM !

Acked-by: Vineet Gupta <vgupta at synopsys.com>

Thx,
-Vineet
