From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 10 Jun 2016 15:05:24 +0000
Subject: [PATCH v2 02/20] drm: arc: Rely on the default ->best_encoder()
 behavior
In-Reply-To: <1465300095-16971-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465300095-16971-3-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465571076.7097.7.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Boris,

On Tue, 2016-06-07@13:47 +0200, Boris Brezillon wrote:
> We have a 1:1 relationship between connectors and encoders and the
> driver is relying on the atomic helpers: we can drop the custom
> ->best_encoder(), and let the core call drm_atomic_helper_best_encoder()
> for us.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon at free-electrons.com>
> ---

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
