From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Mon, 5 Feb 2018 15:30:19 +0000
Subject: Add patch "kernel/exit.c: export abort() to modules" to 4.14-stable
 tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1517844619.26739.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Patch subject:	"kernel/exit.c: export abort() to modules"
Commit ID:	dc8635b78cd8
Reason:?	While building mpi.ko module with lastest stable Linux 
		v4.14.17 an error occured:
		>ERROR: "abort" [lib/mpi/mpi.ko] undefined!
Kernel version:	4.14.x
