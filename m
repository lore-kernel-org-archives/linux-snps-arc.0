From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Thu, 21 Sep 2017 12:46:48 +0200
Subject: [PATCH] reset: Restrict RESET_HSDK_V1 to ARC_SOC_HSDK or
 COMPILE_TEST
In-Reply-To: <1505132528-27843-1-git-send-email-geert@linux-m68k.org>
References: <1505132528-27843-1-git-send-email-geert@linux-m68k.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1505990808.10081.6.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

Hi Geert,

On Mon, 2017-09-11@14:22 +0200, Geert Uytterhoeven wrote:
> The HSDK reset driver is only useful when building for an ARC HSDK
> platform.
> 
> While at it, drop the "default n", as that is the default.
> 
> Fixes: e0be864f14240cb1 ("ARC: reset: introduce HSDKv1 reset driver")
> Signed-off-by: Geert Uytterhoeven <geert at linux-m68k.org>

Thank you for the patch. I have rebased it onto the HSDK_V1 -> HSDK name
change on the reset/fixes branch.

regards
Philipp
