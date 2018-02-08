From: greg@kroah.com (Greg KH)
Date: Thu, 8 Feb 2018 18:05:48 +0100
Subject: Add patch "kernel/exit.c: export abort() to modules" to
 4.14-stable tree
In-Reply-To: <20180208170412.GA14517@kroah.com>
References: <1517844619.26739.5.camel@synopsys.com>
 <20180208170412.GA14517@kroah.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180208170548.GB14517@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Feb 08, 2018@06:04:12PM +0100, Greg KH wrote:
> On Mon, Feb 05, 2018@03:30:19PM +0000, Evgeniy Didin wrote:
> > Patch subject:	"kernel/exit.c: export abort() to modules"
> > Commit ID:	dc8635b78cd8
> > Reason:?	While building mpi.ko module with lastest stable Linux 
> > 		v4.14.17 an error occured:
> > 		>ERROR: "abort" [lib/mpi/mpi.ko] undefined!
> > Kernel version:	4.14.x
> 
> The patch does not apply to the 4.14.y kernel tree :(
> 
> Can you please provide a working backport?

Ah, the other patch needs to go first, please always tell me what order
to apply patches in.  Otherwise I will get it wrong (as this just proved
to be the case...)

thanks,

greg k-h
