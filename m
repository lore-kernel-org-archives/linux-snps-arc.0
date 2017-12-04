From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 4 Dec 2017 16:00:38 +0000
Subject: xf86-video-armada via UDL [was: Re: UDL's fbdev doesn't work
 for user-space apps]
In-Reply-To: <d89c088a-a169-b49a-c331-d1bfe4329e25@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
 <1512393408.4977.44.camel@synopsys.com>
 <c6d06ae1-a30b-c358-6c12-317688d194a5@synopsys.com>
 <1512399218.4977.48.camel@synopsys.com>
 <d89c088a-a169-b49a-c331-d1bfe4329e25@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512403237.4977.54.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Mon, 2017-12-04@15:55 +0000, Jose Abreu wrote:
> On 04-12-2017 14:53, Alexey Brodkin wrote:
> > 
> > Full log you may find below.
> 
> Sorry but I meant /var/log/Xorg.0.log file.

Ooops... sorry... here is it.

-Alexey



# cat /var/log/Xorg.0.log?
[????30.345]?
X.Org X Server 1.19.5
Release Date: 2017-10-12
[????30.345] X Protocol Version 11, Revision 0
[????30.345] Build Operating System: Linux 3.10.0-514.el7.x86_64 x86_64?
[????30.346] Current Operating System: Linux axs103 4.14.2-00008-g95be6f762b7f-dirty #68 SMP PREEMPT Mon Dec 4 16:12:46 MSK 2017 arc
[????30.346] Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1 drm.debug=0x1e
[????30.346] Build Date: 01 December 2017??12:21:28PM
[????30.346]??
[????30.346] Current version of pixman: 0.34.0
[????30.346]????Before reporting problems, check http://wiki.x.org
????????to make sure that you have the latest version.
[????30.346] Markers: (--) probed, (**) from config file, (==) default setting,
????????(++) from command line, (!!) notice, (II) informational,
????????(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[????30.346] (==) Log file: "/var/log/Xorg.0.log", Time: Thu Jan??1 00:00:30 1970
[????30.346] (==) Using config file: "/etc/X11/xorg.conf"
[????30.346] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[????30.347] (==) No Layout section.??Using the first Screen section.
[????30.347] (==) No screen section available. Using defaults.
[????30.347] (**) |-->Screen "Default Screen Section" (0)
[????30.347] (**) |???|-->Monitor "<default monitor>"
[????30.348] (==) No device specified for screen "Default Screen Section".
????????Using the first device section listed.
[????30.348] (**) |???|-->Device "Driver0"
[????30.348] (==) No monitor specified for screen "Default Screen Section".
????????Using a default monitor configuration.
[????30.349] (==) Not automatically adding devices
[????30.349] (==) Not automatically enabling devices
[????30.349] (==) Not automatically adding GPU devices
[????30.349] (==) Max clients allowed: 256, resource mask: 0x1fffff
[????30.349] (WW) The directory "/usr/share/fonts/X11//TTF/" does not exist.
[????30.349]????Entry deleted from font path.
[????30.349] (WW) The directory "/usr/share/fonts/X11//OTF/" does not exist.
[????30.349]????Entry deleted from font path.
[????30.349] (WW) `fonts.dir' not found (or not valid) in "/usr/share/fonts/X11//100dpi/".
[????30.349]????Entry deleted from font path.
[????30.349]????(Run 'mkfontdir' on "/usr/share/fonts/X11//100dpi/").
[????30.349] (WW) `fonts.dir' not found (or not valid) in "/usr/share/fonts/X11//75dpi/".
[????30.349]????Entry deleted from font path.
[????30.350]????(Run 'mkfontdir' on "/usr/share/fonts/X11//75dpi/").
[????30.350] (==) FontPath set to:
????????/usr/share/fonts/X11//misc/,
????????/usr/share/fonts/X11//Type1/
[????30.350] (==) ModulePath set to "/usr/lib/xorg/modules"
[????30.350] (==) |-->Input Device "<default pointer>"
[????30.350] (==) |-->Input Device "<default keyboard>"
[????30.350] (==) No Layout section. Using the default mouse configuration.
[????30.350] (==) No Layout section. Using the default keyboard configuration.
[????30.350] (II) Loader magic: 0x178528
[????30.350] (II) Module ABI versions:
[????30.350]????X.Org ANSI C Emulation: 0.4
[????30.350]????X.Org Video Driver: 23.0
[????30.350]????X.Org XInput driver : 24.1
[????30.350]????X.Org Server Extension : 10.0
[????30.350] (II) LoadModule: "armada"
[????30.351] (II) Loading /usr/lib/xorg/modules/drivers/armada_drv.so
[????30.352] (II) Module armada: vendor="X.Org Foundation"
[????30.352]????compiled for 1.19.5, module version = 0.0.0
[????30.352]????Module class: X.Org Video Driver
[????30.352]????ABI class: X.Org Video Driver, version 23.0
[????30.352] (II) LoadModule: "mouse"
[????30.352] (II) Loading /usr/lib/xorg/modules/input/mouse_drv.so
[????30.353] (II) Module mouse: vendor="X.Org Foundation"
[????30.353]????compiled for 1.19.5, module version = 1.9.2
[????30.353]????Module class: X.Org XInput Driver
[????30.353]????ABI class: X.Org XInput driver, version 24.1
[????30.353] (II) LoadModule: "kbd"
[????30.353] (II) Loading /usr/lib/xorg/modules/input/kbd_drv.so
[????30.353] (II) Module kbd: vendor="X.Org Foundation"
[????30.353]????compiled for 1.19.5, module version = 1.9.0
[????30.354]????Module class: X.Org XInput Driver
[????30.354]????ABI class: X.Org XInput driver, version 24.1
[????30.354] (II) armada: Support for Marvell LCD Controller: 88AP510
[????30.354] (II) armada: Support for Freescale IPU: i.MX6
[????30.354] (II) armada: Support DisplayLink USB2.0: UDL
[????30.354] (--) using VT number 2

[????30.354] (WW) Falling back to old probe method for armada
[????30.357] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
[????30.357] (II) armada(0): hardware: udl
[????30.357] (II) armada(0): Creating default Display subsection in Screen section
????????"Default Screen Section" for depth/fbbpp 24/32
[????30.357] (==) armada(0): Depth 24, (--) framebuffer bpp 32
[????30.357] (==) armada(0): RGB weight 888
[????30.357] (==) armada(0): Default visual is TrueColor
[????30.358] (**) armada(0): Option "XvAccel" "TRUE"
[????30.358] (**) armada(0): Option "XvPreferOverlay" "TRUE"
[????30.358] (**) armada(0): Option "UseGPU" "TRUE"
[????30.358] (**) armada(0): Option "AccelModule" "etnadrm_gpu"
[????30.358] (II) Loading sub module "etnadrm_gpu"
[????30.358] (II) LoadModule: "etnadrm_gpu"
[????30.358] (II) Loading /usr/lib/xorg/modules/drivers/etnadrm_gpu.so
[????30.359] (II) Module Etnaviv GPU driver (DRM): vendor="X.Org Foundation"
[????30.359]????compiled for 1.19.5, module version = 0.0.0
[????30.359]????ABI class: X.Org ANSI C Emulation, version 0.4
[????30.359] (**) armada(0): Option "DRI" "TRUE"
[????30.558] (II) armada(0): Output DVI1 has no monitor section
[????30.727] (II) armada(0): EDID for output DVI1
[????30.727] (II) armada(0): Manufacturer: DEL??Model: 4072??Serial#: 1110979404
[????30.727] (II) armada(0): Year: 2011??Week: 32
[????30.728] (II) armada(0): EDID Version: 1.3
[????30.728] (II) armada(0): Digital Display Input
[????30.728] (II) armada(0): Max Image Size [cm]: horiz.: 51??vert.: 29
[????30.728] (II) armada(0): Gamma: 2.20
[????30.728] (II) armada(0): DPMS capabilities: StandBy Suspend Off
[????30.728] (II) armada(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4?
[????30.728] (II) armada(0): First detailed timing is preferred mode
[????30.728] (II) armada(0): redX: 0.638 redY: 0.330???greenX: 0.312 greenY: 0.623
[????30.728] (II) armada(0): blueX: 0.150 blueY: 0.068???whiteX: 0.313 whiteY: 0.329
[????30.728] (II) armada(0): Supported established timings:
[????30.728] (II) armada(0): 720x400 at 70Hz
[????30.728] (II) armada(0): 640x480 at 60Hz
[????30.728] (II) armada(0): 640x480 at 75Hz
[????30.728] (II) armada(0): 800x600 at 60Hz
[????30.728] (II) armada(0): 800x600 at 75Hz
[????30.728] (II) armada(0): 1024x768 at 60Hz
[????30.729] (II) armada(0): 1024x768 at 75Hz
[????30.729] (II) armada(0): 1280x1024 at 75Hz
[????30.729] (II) armada(0): Manufacturer's mask: 0
[????30.729] (II) armada(0): Supported standard timings:
[????30.729] (II) armada(0): #0: hsize: 1152??vsize 864??refresh: 75??vid: 20337
[????30.729] (II) armada(0): #1: hsize: 1280??vsize 1024??refresh: 60??vid: 32897
[????30.729] (II) armada(0): #2: hsize: 1920??vsize 1080??refresh: 60??vid: 49361
[????30.729] (II) armada(0): Supported detailed timing:
[????30.729] (II) armada(0): clock: 148.5 MHz???Image Size:??510 x 287 mm
[????30.729] (II) armada(0): h_active: 1920??h_sync: 2008??h_sync_end 2052 h_blank_end 2200 h_border: 0
[????30.729] (II) armada(0): v_active: 1080??v_sync: 1084??v_sync_end 1089 v_blanking: 1125 v_border: 0
[????30.729] (II) armada(0): Serial No: 59DJP189B83L
[????30.729] (II) armada(0): Monitor name: DELL U2312HM
[????30.729] (II) armada(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 83 kHz, PixClock max 175 MHz
[????30.729] (II) armada(0): EDID (in hex):
[????30.729] (II) armada(0):????00ffffffffffff0010ac72404c333842
[????30.729] (II) armada(0):????2015010380331d78ea6ea5a3544f9f26
[????30.730] (II) armada(0):????115054a54b00714f8180d1c001010101
[????30.730] (II) armada(0):????010101010101023a801871382d40582c
[????30.730] (II) armada(0):????4500fe1f1100001e000000ff00353944
[????30.730] (II) armada(0):????4a503138394238334c0a000000fc0044
[????30.730] (II) armada(0):????454c4c205532333132484d0a000000fd
[????30.730] (II) armada(0):????00384c1e5311000a2020202020200060
[????30.730] (II) armada(0): Printing probed modes for output DVI1
[????30.730] (II) armada(0): Modeline "1920x1080"x60.0??148.50??1920 2008 2052 2200??1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[????30.730] (II) armada(0): Modeline "1280x1024"x75.0??135.00??1280 1296 1440 1688??1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[????30.731] (II) armada(0): Modeline "1280x1024"x60.0??108.00??1280 1328 1440 1688??1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[????30.731] (II) armada(0): Modeline "1152x864"x75.0??108.00??1152 1216 1344 1600??864 865 868 900 +hsync +vsync (67.5 kHz e)
[????30.731] (II) armada(0): Modeline "1024x768"x75.0???78.75??1024 1040 1136 1312??768 769 772 800 +hsync +vsync (60.0 kHz e)
[????30.731] (II) armada(0): Modeline "1024x768"x60.0???65.00??1024 1048 1184 1344??768 771 777 806 -hsync -vsync (48.4 kHz e)
[????30.731] (II) armada(0): Modeline "800x600"x75.0???49.50??800 816 896 1056??600 601 604 625 +hsync +vsync (46.9 kHz e)
[????30.731] (II) armada(0): Modeline "800x600"x60.3???40.00??800 840 968 1056??600 601 605 628 +hsync +vsync (37.9 kHz e)
[????30.731] (II) armada(0): Modeline "640x480"x75.0???31.50??640 656 720 840??480 481 484 500 -hsync -vsync (37.5 kHz e)
[????30.731] (II) armada(0): Modeline "640x480"x59.9???25.18??640 656 752 800??480 490 492 525 -hsync -vsync (31.5 kHz e)
[????30.731] (II) armada(0): Modeline "720x400"x70.1???28.32??720 738 846 900??400 412 414 449 -hsync +vsync (31.5 kHz e)
[????30.731] (II) armada(0): Output DVI1 connected
[????30.731] (II) armada(0): Using exact sizes for initial modes
[????30.732] (II) armada(0): Output DVI1 using initial mode 1920x1080 +0+0
[????30.732] (==) armada(0): Using gamma correction (1.0, 1.0, 1.0)
[????30.732] (==) armada(0): DPI set to (96, 96)
[????30.732] (II) Loading sub module "fb"
[????30.732] (II) LoadModule: "fb"
[????30.732] (II) Loading /usr/lib/xorg/modules/libfb.so
[????30.734] (II) Module fb: vendor="X.Org Foundation"
[????30.734]????compiled for 1.19.5, module version = 1.0.0
[????30.734]????ABI class: X.Org ANSI C Emulation, version 0.4
[????30.734] (==) Depth 24 pixmap format is 32 bpp
[????30.757] (**) armada(0): Option "HWcursor" "TRUE"
[????30.757] (**) armada(0): Option "HotPlug" "TRUE"
[????30.758] (==) armada(0): Backing store enabled
[????30.758] (==) armada(0): Silken mouse enabled
[????30.758] (--) armada(0): Vivante GC880 GPU revision 5124 (etnaviv) 2d PE2.0
[????30.759] (II) armada(0): [DRI2] Setup complete
[????30.759] (II) armada(0): [DRI2]???DRI driver: etnaviv
[????30.759] (II) armada(0): direct rendering: DRI2 enabled
[????30.759] (II) armada(0): No hardware cursor support - disabling hardware cursors
[????30.759] (II) armada(0): RandR 1.2 enabled, ignore the following RandR disabled message.
[????30.760] (==) armada(0): DPMS enabled
[????30.763] (II) armada(0): etnaviv: Xv: using YUY2 format intermediate YUV target
[????30.917] (--) RandR disabled
[????30.932] (II) armada(0): etnaviv: A8 target not supported
[????30.932] (II) armada(0): Setting screen physical size to 508 x 285
[????31.175] (II) Using input driver 'mouse' for '<default pointer>'
[????31.175] (**) Option "CorePointer" "on"
[????31.175] (**) <default pointer>: always reports core events
[????31.175] (WW) <default pointer>: No Device specified, looking for one...
[????31.175] (EE) <default pointer>: Cannot find which device to use.
[????31.175] (==) <default pointer>: Protocol: "Auto"
[????31.175] (**) <default pointer>: always reports core events
[????31.175] (EE) xf86OpenSerial: No Device specified.
[????31.176] (EE) <default pointer>: cannot open input device
[????31.176] (EE) PreInit returned 2 for "<default pointer>"
[????31.176] (II) UnloadModule: "mouse"
[????31.176] (II) Using input driver 'kbd' for '<default keyboard>'
[????31.176] (**) Option "CoreKeyboard" "on"
[????31.176] (**) <default keyboard>: always reports core events
[????31.176] (**) <default keyboard>: always reports core events
[????31.176] (**) Option "Protocol" "standard"
[????31.176] (**) Option "XkbRules" "base"
[????31.176] (**) Option "XkbModel" "pc105"
[????31.176] (**) Option "XkbLayout" "us"
[????31.176] (II) XINPUT: Adding extended input device "<default keyboard>" (type: KEYBOARD, id 6)
[????54.810] (II) UnloadModule: "kbd"
[????55.265] (--) armada(0): Vivante GC880 GPU revision 5124 (etnaviv) 2d PE2.0
[????55.265] (II) armada(0): [DRI2] Setup complete
[????55.265] (II) armada(0): [DRI2]???DRI driver: etnaviv
[????55.265] (II) armada(0): direct rendering: DRI2 enabled
[????55.266] (II) armada(0): No hardware cursor support - disabling hardware cursors
[????55.266] (II) armada(0): RandR 1.2 enabled, ignore the following RandR disabled message.
[????55.266] (==) armada(0): DPMS enabled
[????55.269] (II) armada(0): etnaviv: Xv: using YUY2 format intermediate YUV target
[????55.410] (--) RandR disabled
[????55.425] (II) armada(0): etnaviv: A8 target not supported
[????55.425] (II) armada(0): Setting screen physical size to 508 x 285
[????55.648] (II) Using input driver 'mouse' for '<default pointer>'
[????55.648] (**) Option "CorePointer" "on"
[????55.648] (**) <default pointer>: always reports core events
[????55.649] (WW) <default pointer>: No Device specified, looking for one...
[????55.649] (EE) <default pointer>: Cannot find which device to use.
[????55.649] (==) <default pointer>: Protocol: "Auto"
[????55.649] (**) <default pointer>: always reports core events
[????55.649] (EE) xf86OpenSerial: No Device specified.
[????55.649] (EE) <default pointer>: cannot open input device
[????55.649] (EE) PreInit returned 2 for "<default pointer>"
[????55.649] (II) UnloadModule: "mouse"
[????55.649] (II) Using input driver 'kbd' for '<default keyboard>'
[????55.649] (**) Option "CoreKeyboard" "on"
[????55.649] (**) <default keyboard>: always reports core events
[????55.649] (**) <default keyboard>: always reports core events
[????55.649] (**) Option "Protocol" "standard"
[????55.649] (**) Option "XkbRules" "base"
[????55.650] (**) Option "XkbModel" "pc105"
[????55.650] (**) Option "XkbLayout" "us"
