From: gregkh@linuxfoundation.org (Greg KH)
Date: Mon, 5 Sep 2016 15:02:37 +0200
Subject: ARC stable backport request
In-Reply-To: <2ac8d0fc-9c67-e7c7-41f0-68cb34514019@synopsys.com>
References: <2ac8d0fc-9c67-e7c7-41f0-68cb34514019@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160905130237.GB29724@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Aug 22, 2016@10:36:20AM -0700, Vineet Gupta wrote:
> Hi Stable Team,
> 
> Could you please backport upstream 20d780374c81c ("ARC: build: Better way to
> detect ISA compatible toolchain")
> 
> This is needed to let kernel building with newer gcc 6.x based tools.

Applied to 4.4-stable, thanks.

greg k-h
