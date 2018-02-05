From: gregkh@linuxfoundation.org (Greg KH)
Date: Mon, 5 Feb 2018 08:20:41 -0800
Subject: Add patch "kernel/exit.c: export abort() to modules" to
 4.14-stable tree
In-Reply-To: <1517844619.26739.5.camel@synopsys.com>
References: <1517844619.26739.5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180205162041.GB17767@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 05, 2018@03:30:19PM +0000, Evgeniy Didin wrote:
> Patch subject:	"kernel/exit.c: export abort() to modules"
> Commit ID:	dc8635b78cd8
> Reason:?	While building mpi.ko module with lastest stable Linux 
> 		v4.14.17 an error occured:
> 		>ERROR: "abort" [lib/mpi/mpi.ko] undefined!
> Kernel version:	4.14.x

Same questions as before, what config is causing this, and when did it
break?

thanks,

greg k-h
