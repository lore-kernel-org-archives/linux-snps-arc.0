From: greg@kroah.com (Greg KH)
Date: Sun, 30 Apr 2017 16:08:55 +0200
Subject: 4.2+ stable inclusion request: ARCv2: save r30 on kernel entry
 as gcc uses it for code-gen
In-Reply-To: <bd36bc24-831f-a5ea-2b24-f4984a9b91cf@synopsys.com>
References: <bd36bc24-831f-a5ea-2b24-f4984a9b91cf@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170430140855.GA11186@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Apr 28, 2017@11:57:36AM -0700, Vineet Gupta wrote:
> Hi,
> 
> Can we please backport upstream ecd43afdbe72017aefe48080631eb625e177ef4d ("ARCv2:
> save r30 on kernel entry as gcc uses it for code-gen") to 4.2 to 4.9 kernels.
> 
> While the issue cites gcc, it is general deficiency of kernel as userspace
> programs can modify r30 register in hand/inline assembly and those will not be
> preserved without this change.

Queued up for 4.9 and 4.4 stable trees, thanks.

greg k-h
