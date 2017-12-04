From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 4 Dec 2017 13:16:48 +0000
Subject: xf86-video-armada via UDL [was: Re: UDL's fbdev doesn't work for
 user-space apps]
In-Reply-To: <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512393408.4977.44.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Mon, 2017-12-04@11:50 +0000, Jose Abreu wrote:
> Hi Alexey,
> 
> On 04-12-2017 11:32, Alexey Brodkin wrote:
> > 
> > My first [probably incorrect] assumption is Xserver requires fbdev (/dev/fbX)
> > and it cannot use DRI video card natively. Is that correct?
> > 
> > 
> 
> Xserver can use DRI directly, you need to enable modesetting
> driver in Xorg config or use the designated driver for your card
> (if there is any).

Ok that makes sense. I didn't think about generic modesetting driver for Xserver.
And that indeed works. This is my xorg.conf:
----------------------->8----------------------
# cat /etc/X11/xorg.conf?
Section "Device"
????????Identifier??????"Driver0"
????????Screen??????????0
????????Driver??????????"modesetting"
????????Option??????????"kmsdev" "/dev/dri/card1"
EndSection
----------------------->8----------------------

I do see xclock is rendered fine.

Now I guess is getting closer to what I really need :)
In the end I wanted to get 3D rendered by Vivante GPU
to be displayed on UDL. My assumption was very simple - if IMX-DRM+Etnaviv
work fine it should be straight-forward to swap IMX-DRM bitstreamer with UDL
and we're golden.

That might be more a question to Lucas now.
I use xorg.conf as found here:
http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/tree/conf/xorg-sample.conf?h=unstable-devel
That's what it has:
----------------------->8----------------------
Section "Device"
	Identifier	"Driver0"
	Screen		0
	Driver		"armada"

# Support hotplugging displays?
#	Option		"Hotplug"	"TRUE"

# Support hardware cursor if available?
#	Option		"HWCursor"	"TRUE"

# Use GPU acceleration?
#	Option		"UseGPU"	"TRUE"

# Provide Xv interfaces?
#	Option		"XvAccel"	"TRUE"

# Prefer overlay for Xv (TRUE for armada-drm, FALSE for imx-drm)
#	Option		"XvPreferOverlay" "TRUE"

# Which accelerator module to load (automatically found if commented out)
#	Option		"AccelModule"	"etnadrm_gpu"
#	Option		"AccelModule"	"etnaviv_gpu"

# Support DRI2 interfaces?
#	Option		"DRI"		"TRUE"
EndSection
----------------------->8----------------------

Indeed I uncommented all the lines and then it allows to see
for example glmark2-es2 working on Wandboard (that's exactly where
"imx-drm + etnaviv" combo is used).

But if I swap "imx-drm" to "udl" I don't see anything on my screen
(connected via UDL) even though Xserver seems to really start claiming the screen
(so I see it becomes black, effectively overriding whatever was there before) and
glmark benchmark prints results.

Maybe I'm missing some additional glue for UDL in "xf86-video-armada" except the simple one:
----------------------->8----------------------
--- a/src/armada_module.c
+++ b/src/armada_module.c
@@ -26,7 +26,7 @@
?#define ARMADA_NAME????????????"armada"
?#define ARMADA_DRIVER_NAME?????"armada"
?
-#define DRM_MODULE_NAMES???????"armada-drm", "imx-drm"
+#define DRM_MODULE_NAMES???????"armada-drm", "imx-drm", "udl"
?#define DRM_DEFAULT_BUS_ID?????NULL
?
?static const char *drm_module_names[] = { DRM_MODULE_NAMES };
@@ -43,6 +43,11 @@ static SymTabRec ipu_chipsets[] = {
????????{ -1, NULL }
?};
?
+static SymTabRec udl_chipsets[] = {
+???????{??0, "UDL" },
+???????{ -1, NULL }
+};
+
?static const OptionInfoRec * const options[] = {
????????armada_drm_options,
????????common_drm_options,
@@ -115,6 +120,8 @@ static void armada_identify(int flags)
??????????????????????????armada_chipsets);
????????xf86PrintChipsets(ARMADA_NAME, "Support for Freescale IPU",
??????????????????????????ipu_chipsets);
+???????xf86PrintChipsets(ARMADA_NAME, "Support DisplayLink USB2.0",
+?????????????????????????udl_chipsets);
?}
----------------------->8----------------------

-Alexey
