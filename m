From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Mon, 5 Feb 2018 15:25:58 +0000
Subject: Add patch "arch: define weak abort()" to 4.14-stable tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1517844358.26739.1.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Patch subject:	"arch: define weak abort()"
Commit ID:	7c2c11b208be
Reason:?	While building mpi.ko module with lastest stable Linux 
		v4.14.17 an error occured:
		>ERROR: "abort" [lib/mpi/mpi.ko] undefined!
Kernel version: 4.14.x
