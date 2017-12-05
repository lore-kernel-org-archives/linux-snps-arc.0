From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 5 Dec 2017 11:53:37 +0000
Subject: xf86-video-armada via UDL [was: Re: UDL's fbdev doesn't work
 for user-space apps]
In-Reply-To: <c49275d9-6cb3-c6ab-15c8-c18e5a8bc0b0@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
 <1512393408.4977.44.camel@synopsys.com>
 <c6d06ae1-a30b-c358-6c12-317688d194a5@synopsys.com>
 <1512399218.4977.48.camel@synopsys.com>
 <d89c088a-a169-b49a-c331-d1bfe4329e25@synopsys.com>
 <1512403237.4977.54.camel@synopsys.com>
 <232eae49-ddbb-fd87-2b35-6db47817e23e@synopsys.com>
 <1512408586.4977.73.camel@synopsys.com>
 <c49275d9-6cb3-c6ab-15c8-c18e5a8bc0b0@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512474815.4977.90.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Tue, 2017-12-05@10:39 +0000, Jose Abreu wrote:
> Hi Alexey,
> 
> On 04-12-2017 17:29, Alexey Brodkin wrote:
> > 
> > 
> > Indeed, in case of kmscube etnaviv is a renderer while UDL
> > outputs the picture on the screen.
> 
> Thats nice :)
> 
> Ok, from your logs I was not able to see anything wrong. X server
> does not error exit and Prime seems to be working in DRM ...
> 
> Lets try one more thing: Enable all debug in DRM (drm.debug=0x3f)
> and try to correlate the log with the actions. i.e.
> 
> [boot]
> [log]
> [x start]
> [log]
> [xclock start]
> [log]
> [glmark2-es2 start]
> [log]

I think I have something like that.

Below are extracts which show at least one difference I was able to find.
And that difference is presence of "[drm:udl_drm_gem_mmap] flags = 0x1"
in case of Xserver only.

kmscube:
-------------------------->8---------------------------
[drm:drm_crtc_helper_set_config] encoder changed, full mode switch
[drm:drm_crtc_helper_set_config] crtc changed, full mode switch
[drm:drm_crtc_helper_set_config] [CONNECTOR:30:DVI-I-1] to [CRTC:28:crtc-0]
[drm:drm_crtc_helper_set_config] attempting to set mode from userspace
[drm:drm_mode_debug_printmodeline] Modeline 44:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x48 0x5
[drm:drm_crtc_helper_set_mode] [CRTC:28:crtc-0]
[drm:drm_crtc_helper_set_mode] [ENCODER:29:TMDS-29] set [MODE:44:1920x1080]
[drm] write mode info 153
[drm:drm_crtc_helper_set_config] Setting connector DPMS state to on
[drm:drm_crtc_helper_set_config]????????[CONNECTOR:30:DVI-I-1] set DPMS on
[drm:udl_attach_dma_buf] [DEV:soc:gpu-subsystem] size:8355840
[drm:udl_map_dma_buf] [DEV:soc:gpu-subsystem] size:8355840 dir=0
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
stream link to 0x000000a8 @ 0x00002000 71042000
-------------------------->8---------------------------

X:
-------------------------->8---------------------------
[drm:udl_drm_gem_mmap] flags = 0x1
[drm:drm_mode_addfb] [FB:43]
[drm:drm_mode_setcrtc] [CRTC:28:crtc-0]
[drm:drm_mode_setcrtc] [CONNECTOR:30:DVI-I-1]
[drm:drm_crtc_helper_set_config]?
[drm:drm_crtc_helper_set_config] [CRTC:28:crtc-0] [FB:43] #connectors=1 (x y) (0 0)
[drm:drm_crtc_helper_set_config] crtc has no fb, full mode set
[drm:drm_crtc_helper_set_config] connector dpms not on, full mode switch
[drm:drm_crtc_helper_set_config] encoder changed, full mode switch
[drm:drm_crtc_helper_set_config] crtc changed, full mode switch
[drm:drm_crtc_helper_set_config] [CONNECTOR:30:DVI-I-1] to [CRTC:28:crtc-0]
[drm:drm_crtc_helper_set_config] attempting to set mode from userspace
[drm:drm_mode_debug_printmodeline] Modeline 44:"" 0 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x0 0x5
[drm:drm_crtc_helper_set_mode] [CRTC:28:crtc-0]
[drm:drm_crtc_helper_set_mode] [ENCODER:29:TMDS-29] set [MODE:44:]
[drm] write mode info 153
[drm:drm_crtc_helper_set_config] Setting connector DPMS state to on
[drm:drm_crtc_helper_set_config]????????[CONNECTOR:30:DVI-I-1] set DPMS on
[drm] write mode info 153
[drm:udl_attach_dma_buf] [DEV:soc:gpu-subsystem] size:8298496
[drm:udl_map_dma_buf] [DEV:soc:gpu-subsystem] size:8298496 dir=0
etnaviv-gpu f0090000.gpu: virt 71040000 phys 0x00000000 free 0x00001ec0
stream link to 0x000001e8 @ 0x00002000 71042000
-------------------------->8---------------------------

> If that does not give any more info then maybe someone with
> better understanding of etnaviv, UDL and X can help
