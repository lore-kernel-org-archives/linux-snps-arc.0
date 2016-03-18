From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 18 Mar 2016 11:29:54 +0100
Subject: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc 4.8
In-Reply-To: <56EBD65B.10109@synopsys.com>
References: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
 <23667289.mNa1Q2STbY@wuerfel> <56EBD65B.10109@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3287558.oO5rz13nxZ@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Friday 18 March 2016 15:50:11 Vineet Gupta wrote:
> Sure, but I prefer this to be only for gcc 4.8 as this warning seems to be
> healthy in small doses  At least it keeps the door open for future discussion
> with gcc guys !

FWIW, testing on ARM with gcc-6.0 -O3, I also get tons of maybe-uninitialized
warnings. It's unlikely that this is architecture specific or fixed in newer
compiler versions.

> The following nested construct actually works - does that look OK to you ?
> 
> ARCH_CFLAGS += -O3 $(call cc-ifversion, -lt, 0408, $(call cc-disable-warning,maybe-uninitialized,))

Yes, that seems ok.

I don't really understand why -O3 is needed though, maybe it's better to
assume that it won't be needed in future gcc versions and do

ARCH_CFLAGS += $(call cc-ifversion, -lt, 0408, -O3 $(call cc-disable-warning,maybe-uninitialized,))

	Arnd
