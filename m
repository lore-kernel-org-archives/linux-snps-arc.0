From: gregkh@linuxfoundation.org (gregkh@linuxfoundation.org)
Date: Mon, 10 Dec 2018 11:16:17 +0100
Subject: Patch "ARC: [zebu] Remove CONFIG_INITRAMFS_SOURCE from defconfigs"
 has been added to the 4.9-stable tree
In-Reply-To: <20181210083349.35728-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <154443697785141@kroah.com>
To: linux-snps-arc@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    ARC: [zebu] Remove CONFIG_INITRAMFS_SOURCE from defconfigs

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arc-remove-config_initramfs_source-from-defconfigs.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable at vger.kernel.org> know about it.


>From alexey.brodkin at synopsys.com  Mon Dec 10 10:51:40 2018
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon, 10 Dec 2018 11:33:49 +0300
Subject: ARC: [zebu] Remove CONFIG_INITRAMFS_SOURCE from defconfigs
To: stable at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org, linux-kernel at vger.kernel.org, Alexey Brodkin <alexey.brodkin at synopsys.com>, Greg Kroah-Hartman <gregkh at linuxfoundation.org>, Kevin Hilman <khilman at baylibre.com>
List-ID: <linux-snps-arc@lists.infradead.org>
To: linux-snps-arc@lists.infradead.org
Message-ID: <20181210083349.35728-1-abrodkin at synopsys.com>

From: Alexey Brodkin <alexey.brodkin@synopsys.com>

Zebu boards were added in v4.9 and then renamed to "haps" in v4.10.

Thus backporting
commit 64234961c145 (ARC: configs: Remove CONFIG_INITRAMFS_SOURCE from defconfigs)
we missed "zebu" defconfigs in v4.9.

Note this is only applicable to "linux-4.9.y"!

Spotted by KerneCI, see [1].

[1] https://storage.kernelci.org/stable/linux-4.9.y/v4.9.144/arc/zebu_hs_smp_defconfig/build.log

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Kevin Hilman <khilman at baylibre.com>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
---
 arch/arc/configs/zebu_hs_defconfig     |    1 -
 arch/arc/configs/zebu_hs_smp_defconfig |    1 -
 2 files changed, 2 deletions(-)

--- a/arch/arc/configs/zebu_hs_defconfig
+++ b/arch/arc/configs/zebu_hs_defconfig
@@ -11,7 +11,6 @@ CONFIG_NAMESPACES=y
 # CONFIG_UTS_NS is not set
 # CONFIG_PID_NS is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
--- a/arch/arc/configs/zebu_hs_smp_defconfig
+++ b/arch/arc/configs/zebu_hs_smp_defconfig
@@ -11,7 +11,6 @@ CONFIG_NAMESPACES=y
 # CONFIG_UTS_NS is not set
 # CONFIG_PID_NS is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set


Patches currently in stable-queue which might be from alexey.brodkin at synopsys.com are

queue-4.9/arc-remove-config_initramfs_source-from-defconfigs.patch
