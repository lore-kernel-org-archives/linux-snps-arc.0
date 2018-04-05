From: daniel.vetter@ffwll.ch (Daniel Vetter)
Date: Thu, 5 Apr 2018 11:32:39 +0200
Subject: DRM_UDL and GPU under Xserver
In-Reply-To: <1522912595.4577.5.camel@synopsys.com>
References: <1522872371.4851.106.camel@synopsys.com>
 <CAKMK7uG1_B-r+XxVzMusMOBd=udhp8EdL59f375AG5+MO02O4g@mail.gmail.com>
 <1522912595.4577.5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAKMK7uE5HHDCQ5=t5Z2TcheZd7etREUoHmTVK=q3wxMdSMZK5w@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Apr 5, 2018 at 9:16 AM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> Hi Daniel,
>
> On Thu, 2018-04-05@08:18 +0200, Daniel Vetter wrote:
>> On Wed, Apr 4, 2018 at 10:06 PM, Alexey Brodkin
>> <Alexey.Brodkin@synopsys.com> wrote:
>> > Hello,
>> >
>> > We're trying to use DisplayLink USB2-to-HDMI adapter to render GPU-accelerated graphics.
>> > Hardware setup is as simple as a devboard + DisplayLink adapter.
>> > Devboards we use for this experiment are:
>> >  * Wandboard Quad (based on IMX6 SoC with Vivante GPU) or
>> >  * HSDK (based on Synopsys ARC HS38 SoC with Vivante GPU as well)
>> >
>> > I'm sure any other board with DRM supported GPU will work, those we just used
>> > as the very recent Linux kernels could be easily run on them both.
>> >
>> > Basically the problem is UDL needs to be explicitly notified about new data
>> > to be rendered on the screen compared to typical bit-streamers that infinitely
>> > scan a dedicated buffer in memory.
>> >
>> > In case of UDL there're just 2 ways for this notification:
>> >  1) DRM_IOCTL_MODE_PAGE_FLIP that calls drm_crtc_funcs->page_flip()
>> >  2) DRM_IOCTL_MODE_DIRTYFB that calls drm_framebuffer_funcs->dirty()
>> >
>> > But neither of IOCTLs happen when we run Xserver with xf86-video-armada driver
>> > (see https://urldefense.proofpoint.com/v2/url?u=http-3A__git.arm.linux.org.uk_cgit_xf86-2Dvideo-2Darmada.git_log_-3Fh-3Dunstable-2Ddevel&d=DwIBaQ&
>> > c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=oEAlP64L9vkuUs_k3kGwwwlN1WJbDMJbCo0uDhwKwwk&s=3ZHj-
>> > 6JXZBLSTWg_4KMnL0VNi7z8c0RxHzj2U5ywVIw&e=).
>> >
>> > Is it something missing in Xserver or in UDL driver?
>>
>> Use the -modesetting driverr for UDL, that one works correctly.
>
> If you're talking about "modesetting" driver of Xserver [1] then indeed
> picture is displayed on the screen. But there I guess won't be any 3D acceleration.
>
> At least that's what was suggested to me earlier here [2] by Lucas:
> ---------------------------->8---------------------------
> For 3D acceleration to work under X you need the etnaviv specific DDX
> driver, which can be found here:
>
> http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/log/?h=unstable-devel

You definitely want to use -modesetting for UDL. And I thought with
glamour and the corresponding mesa work you should also get
accelaration. Insisting that you must use a driver-specific ddx is
broken, the world doesn't work like that anymore.

Lucas, can you pls clarify? Also, why does -armada bind against all
kms drivers, that's probaly too much.
-Daniel

> ---------------------------->8---------------------------
>
> [1] https://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/drivers/modesetting
> [2] http://lists.infradead.org/pipermail/linux-snps-arc/2017-November/003031.html
>
> -Alexey



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
