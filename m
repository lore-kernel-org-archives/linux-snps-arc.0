From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Tue, 6 Feb 2018 16:34:02 +0000
Subject: Add patch "arch: define weak abort()" to 4.14-stable tree
In-Reply-To: <20180205161906.GA17767@kroah.com>
References: <1517844358.26739.1.camel@synopsys.com>
 <20180205161906.GA17767@kroah.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1517934843.14083.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello Greg,

> On Mon, Feb 05, 2018@03:25:58PM +0000, Evgeniy Didin wrote:
> > Patch subject:	"arch: define weak abort()"
> > Commit ID:	7c2c11b208be
> > Reason:?	While building mpi.ko module with lastest stable Linux?
> > 		v4.14.17 an error occured:
> > 		>ERROR: "abort" [lib/mpi/mpi.ko] undefined!
> > Kernel version: 4.14.x
> 
> What kernel config is causing this build error???I don't see it here,
> nor have I seen it reported in any other built test.
Here are config elements appended to
.config based on hsdk_defconfig
------------------------<8--------------
CONFIG_CRYPTO_RSA=m
CONFIG_CRYPTO_PCRYPT=y
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_SHA1=m
CONFIG_CRYPTO_SHA256=m
CONFIG_CRYPTO_ARC4=y
CONFIG_CRC32_SARWATE=y
------------------------<8--------------

> And what kernel version did this break on?
The issue appeared because GCC 7 was used to build kernel.
GCC 7 does more testing in particular when building with "-O3"
trying to use either __builtin_trap(), or if it does not exist?
in port for this architecture (ARC will have it only in GCC 8),?
then it uses abort().
So for all kernels builded by GCC 7.x such pathes are needed.

This error was caught building with OpenWRT:
https://www.mail-archive.com/lede-dev at lists.infradead.org/msg10945.html

This message also applies to https://www.spinics.net/lists/stable/msg213925.html

Best regards,
Evgeniy Didin
