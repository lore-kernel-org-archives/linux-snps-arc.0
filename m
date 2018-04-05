From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 5 Apr 2018 18:39:41 +0000
Subject: DRM_UDL and GPU under Xserver
In-Reply-To: <20180405134421.GV3881@phenom.ffwll.local>
References: <1522872371.4851.106.camel@synopsys.com>
 <CAKMK7uG1_B-r+XxVzMusMOBd=udhp8EdL59f375AG5+MO02O4g@mail.gmail.com>
 <1522912595.4577.5.camel@synopsys.com>
 <CAKMK7uE5HHDCQ5=t5Z2TcheZd7etREUoHmTVK=q3wxMdSMZK5w@mail.gmail.com>
 <1522924162.3779.16.camel@pengutronix.de>
 <CAKMK7uF1syoNga8wKect9E0oet2fVaj9XWFE5AA6Pu4ND56HVQ@mail.gmail.com>
 <1522926602.4587.10.camel@synopsys.com>
 <20180405134421.GV3881@phenom.ffwll.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1522953580.3977.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel, all,

On Thu, 2018-04-05@15:44 +0200, Daniel Vetter wrote:
> On Thu, Apr 05, 2018@11:10:03AM +0000, Alexey Brodkin wrote:
> > Hi Daniel, Lucas,
> > 
> > On Thu, 2018-04-05@12:59 +0200, Daniel Vetter wrote:
> > > On Thu, Apr 5, 2018@12:29 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > Am Donnerstag, den 05.04.2018, 11:32 +0200 schrieb Daniel Vetter:
> > > > > On Thu, Apr 5, 2018 at 9:16 AM, Alexey Brodkin
> > > > > <Alexey.Brodkin@synopsys.com> wrote:
> > > > > > Hi Daniel,
> > > > > > 
> > > > > > On Thu, 2018-04-05@08:18 +0200, Daniel Vetter wrote:
> > > > > > > On Wed, Apr 4, 2018 at 10:06 PM, Alexey Brodkin
> > > > > > > <Alexey.Brodkin@synopsys.com> wrote:
> > > > > > > > Hello,
> > > > > > > > 
> > > > > > > > We're trying to use DisplayLink USB2-to-HDMI adapter to render
> > > > > > > > GPU-accelerated graphics.
> > > > > > > > Hardware setup is as simple as a devboard + DisplayLink
> > > > > > > > adapter.
> > > > > > > > Devboards we use for this experiment are:
> > > > > > > >  * Wandboard Quad (based on IMX6 SoC with Vivante GPU) or
> > > > > > > >  * HSDK (based on Synopsys ARC HS38 SoC with Vivante GPU as
> > > > > > > > well)
> > > > > > > > 
> > > > > > > > I'm sure any other board with DRM supported GPU will work,
> > > > > > > > those we just used
> > > > > > > > as the very recent Linux kernels could be easily run on them
> > > > > > > > both.
> > > > > > > > 
> > > > > > > > Basically the problem is UDL needs to be explicitly notified
> > > > > > > > about new data
> > > > > > > > to be rendered on the screen compared to typical bit-streamers
> > > > > > > > that infinitely
> > > > > > > > scan a dedicated buffer in memory.
> > > > > > > > 
> > > > > > > > In case of UDL there're just 2 ways for this notification:
> > > > > > > >  1) DRM_IOCTL_MODE_PAGE_FLIP that calls drm_crtc_funcs-
> > > > > > > > > page_flip()
> > > > > > > > 
> > > > > > > >  2) DRM_IOCTL_MODE_DIRTYFB that calls drm_framebuffer_funcs-
> > > > > > > > > dirty()
> > > > > > > > 
> > > > > > > > But neither of IOCTLs happen when we run Xserver with xf86-
> > > > > > > > video-armada driver
> > > > > > > > (see https://urldefense.proofpoint.com/v2/url?u=http-3A__git.ar
> > > > > > > > m.linux.org.uk_cgit_xf86-2Dvideo-2Darmada.git_log_-3Fh-
> > > > > > > > 3Dunstable-2Ddevel&d=DwIBaQ&;
> > > > > > > > c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkh
> > > > > > > > pk5R81I&m=oEAlP64L9vkuUs_k3kGwwwlN1WJbDMJbCo0uDhwKwwk&s=3ZHj-
> > > > > > > > 6JXZBLSTWg_4KMnL0VNi7z8c0RxHzj2U5ywVIw&e=).
> > > > > > > > 
> > > > > > > > Is it something missing in Xserver or in UDL driver?
> > > > > > > 
> > > > > > > Use the -modesetting driverr for UDL, that one works correctly.
> > > > > > 
> > > > > > If you're talking about "modesetting" driver of Xserver [1] then
> > > > > > indeed
> > > > > > picture is displayed on the screen. But there I guess won't be any
> > > > > > 3D acceleration.
> > > > > > 
> > > > > > At least that's what was suggested to me earlier here [2] by Lucas:
> > > > > > ---------------------------->8---------------------------
> > > > > > For 3D acceleration to work under X you need the etnaviv specific
> > > > > > DDX
> > > > > > driver, which can be found here:
> > > > > > 
> > > > > > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.arm.linux.org.uk_cgit_xf86-2Dvideo-2Darmada.git_log_-3Fh-3Dunsta&d=DwIBaQ&c=DPL6_X
> > > > > > _6Jk
> > > > > > XFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=FleDFAQb2lBcZk5DMld7qpeSrB5Srsb4XPQecA5BPvU&s=YUzMQWe3lpC_pjGqRjb4MvRYh16ZBbe
> > > > > > alqf
> > > > > > rywlqjKE&e=
> > > > > > ble-devel
> > > > > 
> > > > > You definitely want to use -modesetting for UDL. And I thought with
> > > > > glamour and the corresponding mesa work you should also get
> > > > > accelaration. Insisting that you must use a driver-specific ddx is
> > > > > broken, the world doesn't work like that anymore.
> > > > 
> > > > On etnaviv the world definitely still works like this. The etnaviv DDX
> > > > uses the dedicated 2D hardware of the Vivante GPUs, which is much
> > > > faster and efficient than going through Glamor.
> > > > Especially since almost all X accel operations are done on linear
> > > > buffers, while the 3D GPU can only ever do tiled on both sampler and
> > > > render, where some multi-pipe 3D cores can't even read the tiling they
> > > > write out. So Glamor is an endless copy fest using the resolve engine
> > > > on those.
> > > 
> > > Ah right, I've forgotten about the vivante 2d cores again.
> > > 
> > > > If using etnaviv with UDL is a use-case that need to be supported, one
> > > > would need to port the UDL specifics from -modesetting to the -armada
> > > > DDX.
> > > 
> > > I don't think this makes sense.
> > 
> > I'm not really sure it has something to do with Etnaviv in particular.
> > Given UDL might be attached to any board with any GPU that would mean we'd
> > need to add those "UDL specifics from -modesetting" in all xf86-video-drivers,
> > right?
> 
> X server supports multiple drivers (for different devices) in parallel.
> You should be using armada for the imx-drm thing, and modesetting for udl.
> And through the magic of prime it should even figure out that the device
> 
> > > > > Lucas, can you pls clarify? Also, why does -armada bind against all
> > > > > kms drivers, that's probaly too much.
> > > > 
> > > > I think that's a local modification done by Alexey. The armada driver
> > > > only binds to armada and imx-drm by default.
> > 
> > Actually it all magically works without any modifications.
> > I just start X with the following xorg.conf [1]:
> > ------------------------>8--------------------------
> > Section "Device"
> > 	Identifier	"Driver0"
> > 	Screen		0
> > 	Driver		"armada"
> > EndSection
> > ------------------------>8--------------------------

Ok it was quite some time ago so I forgot about that completely.
I really made one trivial change in xf86-video-armada:
------------------------>8--------------------------
--- a/src/armada_module.c
+++ b/src/armada_module.c
@@ -26,7 +26,7 @@
 #define ARMADA_NAME            "armada"
 #define ARMADA_DRIVER_NAME     "armada"
 
-#define DRM_MODULE_NAMES       "armada-drm", "imx-drm"
+#define DRM_MODULE_NAMES       "armada-drm", "imx-drm", "udl"
 #define DRM_DEFAULT_BUS_ID     NULL
------------------------>8--------------------------

Otherwise Xserver fails on start which is expected given "imx-drm" is intentionally removed.

> > In fact in case of "kmscube" I had to trick Mesa like that:
> > ------------------------>8--------------------------
> > export MESA_LOADER_DRIVER_OVERRIDE=imx-drm
> 
> Yeah this shouldn't be necessary at all.
> 
> > ------------------------>8--------------------------
> > And then UDL out works perfectly fine (that's because "kmscube"
> > explicitly calls drmModePageFlip()).
> > 
> > As for Xserver nothing special was done.
> > 
> > [1] https://urldefense.proofpoint.com/v2/url?u=http-3A__git.arm.linux.org.uk_cgit_xf86-2Dvideo-2Darmada.git_tree_conf_xorg-2Dsample.conf-3Fh-3Duns
> > table-
> > 2Ddevel&d=DwIBAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=PGNfmLiN38EmKHzRyuZpX3Lsc9grXsJBx2tkJubl4t0&s=IUChhhP3eD
> > PEiH3QdN6CxhfFaBCZIya0KEWDbCcDtGI&e=
> 
> xorg.log is probably more interesting. No idea whether your Xorg.conf
> snippet is needed for armada or not.

Below is my full Xorg.log output with change above in place:
------------------------>8--------------------------
[     8.941]
X.Org X Server 1.19.6
Release Date: 2017-12-20
[     8.941] X Protocol Version 11, Revision 0
[     8.941] Build Operating System: Linux 3.10.0-514.el7.x86_64 x86_64
[     8.941] Current Operating System: Linux buildroot 4.16.0 #3 SMP PREEMPT Thu Apr 5 21:28:25 MSK 2018 arc
[     8.941] Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1 drm.debug=0x3f
[     8.942] Build Date: 05 April 2018  06:48:58PM
[     8.942]
[     8.942] Current version of pixman: 0.34.0
[     8.942]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[     8.942] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[     8.942] (==) Log file: "/var/log/Xorg.0.log", Time: Thu Jan  1 00:00:08 1970
[     8.942] (==) Using config file: "/etc/X11/xorg.conf"
[     8.942] (==) No Layout section.  Using the first Screen section.
[     8.942] (==) No screen section available. Using defaults.
[     8.942] (**) |-->Screen "Default Screen Section" (0)
[     8.942] (**) |   |-->Monitor "<default monitor>"
[     8.944] (==) No device specified for screen "Default Screen Section".
        Using the first device section listed.
[     8.944] (**) |   |-->Device "Driver0"
[     8.944] (==) No monitor specified for screen "Default Screen Section".
        Using a default monitor configuration.
[     8.944] (==) Not automatically adding devices
[     8.944] (==) Not automatically enabling devices
[     8.944] (==) Not automatically adding GPU devices
[     8.944] (==) Max clients allowed: 256, resource mask: 0x1fffff
[     8.944] (WW) The directory "/usr/share/fonts/X11//TTF/" does not exist.
[     8.944]    Entry deleted from font path.
[     8.944] (WW) The directory "/usr/share/fonts/X11//OTF/" does not exist.
[     8.944]    Entry deleted from font path.
[     8.944] (WW) The directory "/usr/share/fonts/X11//Type1/" does not exist.
[     8.944]    Entry deleted from font path.
[     8.944] (WW) `fonts.dir' not found (or not valid) in "/usr/share/fonts/X11//100dpi/".
[     8.944]    Entry deleted from font path.
[     8.945]    (Run 'mkfontdir' on "/usr/share/fonts/X11//100dpi/").
[     8.945] (WW) `fonts.dir' not found (or not valid) in "/usr/share/fonts/X11//75dpi/".
[     8.945]    Entry deleted from font path.
[     8.945]    (Run 'mkfontdir' on "/usr/share/fonts/X11//75dpi/").
[     8.945] (==) FontPath set to:
        /usr/share/fonts/X11//misc/
[     8.945] (==) ModulePath set to "/usr/lib/xorg/modules"
[     8.945] (==) |-->Input Device "<default pointer>"
[     8.945] (==) |-->Input Device "<default keyboard>"
[     8.945] (==) No Layout section. Using the default mouse configuration.
[     8.945] (==) No Layout section. Using the default keyboard configuration.
[     8.945] (II) Loader magic: 0x16c510
[     8.945] (II) Module ABI versions:
[     8.945]    X.Org ANSI C Emulation: 0.4
[     8.945]    X.Org Video Driver: 23.0
[     8.945]    X.Org XInput driver : 24.1
[     8.945]    X.Org Server Extension : 10.0
[     8.945] (II) LoadModule: "armada"
[     8.946] (II) Loading /usr/lib/xorg/modules/drivers/armada_drv.so
[     8.947] (II) Module armada: vendor="X.Org Foundation"
[     8.947]    compiled for 1.19.6, module version = 0.0.0
[     8.947]    Module class: X.Org Video Driver
[     8.947]    ABI class: X.Org Video Driver, version 23.0
[     8.947] (II) LoadModule: "mouse"
[     8.948] (WW) Warning, couldn't open module mouse
[     8.948] (II) UnloadModule: "mouse"
[     8.948] (II) Unloading mouse
[     8.948] (EE) Failed to load module "mouse" (module does not exist, 0)
[     8.948] (II) LoadModule: "kbd"
[     8.948] (WW) Warning, couldn't open module kbd
[     8.948] (II) UnloadModule: "kbd"
[     8.948] (II) Unloading kbd
[     8.948] (EE) Failed to load module "kbd" (module does not exist, 0)
[     8.948] (II) armada: Support for Marvell LCD Controller: 88AP510
[     8.948] (II) armada: Support for Freescale IPU: i.MX6
[     8.949] (--) using VT number 2
[     8.949] (WW) Falling back to old probe method for armada
[     9.415] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
[     9.438] (II) armada(0): hardware: udl
[     9.438] (II) armada(0): Creating default Display subsection in Screen section
        "Default Screen Section" for depth/fbbpp 24/32
[     9.438] (==) armada(0): Depth 24, (--) framebuffer bpp 32
[     9.438] (==) armada(0): RGB weight 888
[     9.438] (==) armada(0): Default visual is TrueColor                          
[     9.438] (II) Loading sub module "etnadrm_gpu"                          
[     9.438] (II) LoadModule: "etnadrm_gpu"                                    
[     9.439] (II) Loading /usr/lib/xorg/modules/drivers/etnadrm_gpu.so         
[     9.439] (II) Module Etnaviv GPU driver (DRM): vendor="X.Org Foundation"              
[     9.439]    compiled for 1.19.6, module version = 0.0.0                               
[     9.440]    ABI class: X.Org ANSI C Emulation, version 0.4                   
[     9.774] (II) armada(0): Output DVI1 has no monitor section                          
[    10.069] (II) armada(0): EDID for output DVI1                                        
[    10.069] (II) armada(0): Manufacturer: SAM  Model: 1bb  Serial#: 1212231993
[    10.070] (II) armada(0): Year: 2005  Week: 50                            
[    10.070] (II) armada(0): EDID Version: 1.3                                    
[    10.070] (II) armada(0): Digital Display Input                                  
[    10.070] (II) armada(0): Max Image Size [cm]: horiz.: 38  vert.: 30             
[    10.070] (II) armada(0): Gamma: 2.20                                            
[    10.070] (II) armada(0): DPMS capabilities: Off                                 
[    10.070] (II) armada(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4       
[    10.070] (II) armada(0): First detailed timing is preferred mode                
[    10.070] (II) armada(0): redX: 0.640 redY: 0.329   greenX: 0.300 greenY: 0.600  
[    10.070] (II) armada(0): blueX: 0.150 blueY: 0.060   whiteX: 0.313 whiteY: 0.329
[    10.070] (II) armada(0): Supported established timings:                  
[    10.070] (II) armada(0): 720x400 at 70Hz                                       
[    10.070] (II) armada(0): 640x480 at 60Hz                                         
[    10.070] (II) armada(0): 640x480 at 67Hz                                           
[    10.070] (II) armada(0): 640x480 at 72Hz                                   
[    10.070] (II) armada(0): 640x480 at 75Hz                                     
[    10.070] (II) armada(0): 800x600 at 56Hz                                     
[    10.070] (II) armada(0): 800x600 at 60Hz                                                 
[    10.071] (II) armada(0): 800x600 at 72Hz                                                 
[    10.071] (II) armada(0): 800x600 at 75Hz                                                 
[    10.071] (II) armada(0): 832x624 at 75Hz                                                
[    10.071] (II) armada(0): 1024x768 at 60Hz                                               
[    10.071] (II) armada(0): 1024x768 at 70Hz                                               
[    10.071] (II) armada(0): 1024x768 at 75Hz                                       
[    10.071] (II) armada(0): 1280x1024 at 75Hz                                      
[    10.071] (II) armada(0): 1152x864 at 75Hz                                       
[    10.071] (II) armada(0): Manufacturer's mask: 0                                                    
[    10.071] (II) armada(0): Supported standard timings:                                               
[    10.071] (II) armada(0): #0: hsize: 1280  vsize 1024  refresh: 60  vid: 32897                         
[    10.071] (II) armada(0): #1: hsize: 1280  vsize 960  refresh: 60  vid: 16513                          
[    10.071] (II) armada(0): #2: hsize: 1152  vsize 864  refresh: 75  vid: 20337                          
[    10.071] (II) armada(0): Supported detailed timing:                                                   
[    10.071] (II) armada(0): clock: 108.0 MHz   Image Size:  376 x 301 mm                                 
[    10.071] (II) armada(0): h_active: 1280  h_sync: 1328  h_sync_end 1440 h_blank_end 1688 h_border: 0   
[    10.071] (II) armada(0): v_active: 1024  v_sync: 1025  v_sync_end 1028 v_blanking: 1066 v_border: 0   
[    10.071] (II) armada(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H max: 81 kHz, PixClock max 145 MHz
[    10.071] (II) armada(0): Monitor name: SyncMaster                               
[    10.071] (II) armada(0): Serial No: HSGYC00767                                                     
[    10.072] (II) armada(0): EDID (in hex):                                                            
[    10.072] (II) armada(0):    00ffffffffffff004c2dbb0139314148                                          
[    10.072] (II) armada(0):    320f010380261e782ade95a3544c9926  
[    10.072] (II) armada(0):    0f5054bfef8081808140714f01010101                                                                    
[    10.072] (II) armada(0):    010101010101302a009851002a403070                                                                    
[    10.072] (II) armada(0):    1300782d1100001e000000fd00384b1e                                                                    
[    10.072] (II) armada(0):    510e000a202020202020000000fc0053                                                                    
[    10.072] (II) armada(0):    796e634d61737465720a2020000000ff                                                                    
[    10.072] (II) armada(0):    00485347594330303736370a2020003c                                                                    
[    10.072] (II) armada(0): Printing probed modes for output DVI1                                                                  
[    10.072] (II) armada(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz eP)
[    10.073] (II) armada(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    10.073] (II) armada(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    10.073] (II) armada(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    10.073] (II) armada(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)      
[    10.073] (II) armada(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)     
[    10.073] (II) armada(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e) 
[    10.073] (II) armada(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)    
[    10.073] (II) armada(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)    
[    10.073] (II) armada(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)    
[    10.074] (II) armada(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)    
[    10.074] (II) armada(0): Modeline "800x600"x56.3   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    10.074] (II) armada(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e) 
[    10.074] (II) armada(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz e) 
[    10.074] (II) armada(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e) 
[    10.074] (II) armada(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e) 
[    10.074] (II) armada(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    10.074] (II) armada(0): Output DVI1 connected                                        
[    10.074] (II) armada(0): Using exact sizes for initial modes                          
[    10.074] (II) armada(0): Output DVI1 using initial mode 1280x1024 +0+0                
[    10.074] (==) armada(0): Using gamma correction (1.0, 1.0, 1.0)                      
[    10.074] (==) armada(0): DPI set to (96, 96)                                         
[    10.075] (II) Loading sub module "fb"                                                
[    10.075] (II) LoadModule: "fb"                                               
[    10.075] (II) Loading /usr/lib/xorg/modules/libfb.so                                                                            
[    10.076] (II) Module fb: vendor="X.Org Foundation"                                                                             
[    10.076]    compiled for 1.19.6, module version = 1.0.0                                                                    
[    10.076]    ABI class: X.Org ANSI C Emulation, version 0.4                                                                
[    10.083] (==) Depth 24 pixmap format is 32 bpp                                                                            
[    10.125] (==) armada(0): Backing store disabled                                                                           
[    10.125] (==) armada(0): Silken mouse enabled                                                                             
[    10.243] (--) armada(0): Vivante GC880 GPU revision 5124 (etnaviv) 2d PE2.0                                           
[    10.254] (II) armada(0): [DRI2] Setup complete                                                                        
[    10.254] (II) armada(0): [DRI2]   DRI driver: etnaviv                                                                 
[    10.254] (II) armada(0): direct rendering: DRI2 enabled                                                               
[    10.255] (II) armada(0): RandR 1.2 enabled, ignore the following RandR disabled message.                              
[    10.306] (==) armada(0): DPMS enabled                                                                                
[    10.309] (II) armada(0): etnaviv: Xv: using YUY2 format intermediate YUV target                                      
[    10.585] (--) RandR disabled                                                                                         
[    10.618] (II) armada(0): etnaviv: A8 target not supported                                                            
[    10.624] (II) armada(0): Setting screen physical size to 338 x 270                                                   
[    10.843] (II) LoadModule: "mouse"                                                                                               
[    10.843] (WW) Warning, couldn't open module mouse                                                                               
[    10.843] (II) UnloadModule: "mouse"                                                                                             
[    10.843] (II) Unloading mouse                                                                                                   
[    10.843] (EE) Failed to load module "mouse" (module does not exist, 0)                                                          
[    10.843] (EE) No input driver matching `mouse'                                                                                  
[    10.843] (II) Falling back to input driver `libinput'                                                                           
[    10.844] (II) LoadModule: "libinput"                                                                                            
[    10.844] (WW) Warning, couldn't open module libinput                                                                           
[    10.844] (II) UnloadModule: "libinput"                                                                                     
[    10.844] (II) Unloading libinput                                                                                          
[    10.844] (EE) Failed to load module "libinput" (module does not exist, 0)                                                       
[    10.844] (II) LoadModule: "kbd"                                                                                                
[    10.845] (WW) Warning, couldn't open module kbd                                                                            
[    10.845] (II) UnloadModule: "kbd"                                                                                         
[    10.845] (II) Unloading kbd                                                                                               
[    10.845] (EE) Failed to load module "kbd" (module does not exist, 0)                                                      
[    10.845] (EE) No input driver matching `kbd'                                                                              
[    10.845] (II) Falling back to input driver `libinput'                                                                 
[    10.845] (II) LoadModule: "libinput"                                                                                  
[    10.845] (WW) Warning, couldn't open module libinput                                                                  
[    10.846] (II) UnloadModule: "libinput"                                                                                
[    10.846] (II) Unloading libinput                                                                                      
[    10.846] (EE) Failed to load module "libinput" (module does not exist, 0)
------------------------>8--------------------------

-Alexey
