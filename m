From: gregkh@linuxfoundation.org (Greg KH)
Date: Mon, 5 Feb 2018 08:19:06 -0800
Subject: Add patch "arch: define weak abort()" to 4.14-stable tree
In-Reply-To: <1517844358.26739.1.camel@synopsys.com>
References: <1517844358.26739.1.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180205161906.GA17767@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 05, 2018@03:25:58PM +0000, Evgeniy Didin wrote:
> Patch subject:	"arch: define weak abort()"
> Commit ID:	7c2c11b208be
> Reason:?	While building mpi.ko module with lastest stable Linux 
> 		v4.14.17 an error occured:
> 		>ERROR: "abort" [lib/mpi/mpi.ko] undefined!
> Kernel version: 4.14.x

What kernel config is causing this build error?  I don't see it here,
nor have I seen it reported in any other built test.

And what kernel version did this break on?

thanks,

greg k-h
