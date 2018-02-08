From: greg@kroah.com (Greg KH)
Date: Thu, 8 Feb 2018 18:04:12 +0100
Subject: Add patch "kernel/exit.c: export abort() to modules" to
 4.14-stable tree
In-Reply-To: <1517844619.26739.5.camel@synopsys.com>
References: <1517844619.26739.5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180208170412.GA14517@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 05, 2018@03:30:19PM +0000, Evgeniy Didin wrote:
> Patch subject:	"kernel/exit.c: export abort() to modules"
> Commit ID:	dc8635b78cd8
> Reason:?	While building mpi.ko module with lastest stable Linux 
> 		v4.14.17 an error occured:
> 		>ERROR: "abort" [lib/mpi/mpi.ko] undefined!
> Kernel version:	4.14.x

The patch does not apply to the 4.14.y kernel tree :(

Can you please provide a working backport?

thanks,

greg k-h
