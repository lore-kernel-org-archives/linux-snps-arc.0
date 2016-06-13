From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 13 Jun 2016 12:47:33 +0000
Subject: [PATCH 1/3 v2] drm/arcpgu: Make ARC PGU usable on simulation
 platforms
In-Reply-To: <1465568953-21893-2-git-send-email-abrodkin@synopsys.com>
References: <1465568953-21893-1-git-send-email-abrodkin@synopsys.com>
 <1465568953-21893-2-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465822003.4130.22.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On Fri, 2016-06-10@17:29 +0300, Alexey Brodkin wrote:
> From: Ruud Derwig <rderwig at synopsys.com>
> 
> In case of simulation there's no real encoder/transmitter device
> because in the model's virtual LCD??we're rendering whatever
> appears in frame-buffer memory.
> 
> Signed-off-by: Ruud Derwig <rderwig at synopsys.com>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
> 
> Changes v1 -> v2:
> ?* Got rid of dummy arcpgu_drm_encoder_helper_funcs and now rely on default
> ???best encoder

If that version looks good to you could you please provide your Ack?

-Alexey
