From: gregkh@linuxfoundation.org (gregkh@linuxfoundation.org)
Date: Thu, 19 Sep 2019 23:11:15 +0200
Subject: Patch "ARC: export "abort" for modules" has been added to the
 4.9-stable tree
In-Reply-To: <20190919205847.4806-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <156892747510640@kroah.com>
To: linux-snps-arc@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    ARC: export "abort" for modules

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arc-export-abort-for-modules.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable at vger.kernel.org> know about it.


>From Vineet.Gupta1 at synopsys.com  Thu Sep 19 23:10:40 2019
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Thu, 19 Sep 2019 13:58:47 -0700
Subject: ARC: export "abort" for modules
To: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Cc: linux-snps-arc at lists.infradead.org, Vineet Gupta <Vineet.Gupta1 at synopsys.com>, kbuild test robot <lkp at intel.com>, stable at vger.kernel.org
List-ID: <linux-snps-arc@lists.infradead.org>
To: linux-snps-arc@lists.infradead.org
Message-ID: <20190919205847.4806-1-vgupta at synopsys.com>

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

This is a custom patch (no mainline equivalent) for stable backport only
to address 0-Day kernel test infra ARC 4.x.y builds errors.

The reason for this custom patch as that it is a single patch, touches
only ARC, vs. atleast two 7c2c11b208be09c1, dc8635b78cd8669 which touch
atleast 3 other arches (one long removed) and could potentially have a
fallout.

Reported-by: kbuild test robot <lkp at intel.com>
CC: stable at vger.kernel.org	# 4.4, 4.9
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 arch/arc/kernel/traps.c |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -163,3 +163,4 @@ void abort(void)
 {
 	__asm__ __volatile__("trap_s  5\n");
 }
+EXPORT_SYMBOL(abort);


Patches currently in stable-queue which might be from Vineet.Gupta1 at synopsys.com are

queue-4.9/arc-export-abort-for-modules.patch
