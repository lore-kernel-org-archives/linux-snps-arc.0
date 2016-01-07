From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 7 Jan 2016 23:20:22 +0000
Subject: [PATCH] arc: Removed local initramfs source file from axs101
 configuration.
In-Reply-To: <1451919315-18115-1-git-send-email-palminha@synopsys.com>
References: <1451919315-18115-1-git-send-email-palminha@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1452208821.18725.9.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Carlos,

On Mon, 2016-01-04@14:55 +0000, palminha@synopsys.com wrote:
> From: Carlos Palminha <palminha at synopsys.com>
> 
> Cannot compile kernel with INITRAMFS SOURCE option.
> Please move this option to a buildroot patch.

First of all if your problem is only related to Buildroot then
there's not much sense in adding linux-snps-arc at lists.infradead.org
which is used for pure Linux kernel discussions.

Then even in case of Buildroot CONFIG_INITRAMFS_SOURCE could be a problem
only if you don't set Buildroot's BR2_TARGET_ROOTFS_INITRAMFS=y, see
how it is done in snps_axs101_defconfig here
https://git.busybox.net/buildroot/tree/configs/snps_axs101_defconfig#n7

What happens if BR2_TARGET_ROOTFS_INITRAMFS=y then existing in kernel's
defconfig CONFIG_INITRAMFS_SOURCE gets overridden with new value, see
https://git.busybox.net/buildroot/tree/linux/linux.mk#n217

Now if you really want to not use built-in kernel initramfs then simplest
thing to do is to run "make linux-menuconfig" from your Buildroot's folder
and disable or set with nothing CONFIG_INITRAMFS_SOURCE.

-Alexey
