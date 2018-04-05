From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Thu, 5 Apr 2018 11:10:48 +0100
Subject: DRM_UDL and GPU under Xserver
In-Reply-To: <CAKMK7uE5HHDCQ5=t5Z2TcheZd7etREUoHmTVK=q3wxMdSMZK5w@mail.gmail.com>
References: <1522872371.4851.106.camel@synopsys.com>
 <CAKMK7uG1_B-r+XxVzMusMOBd=udhp8EdL59f375AG5+MO02O4g@mail.gmail.com>
 <1522912595.4577.5.camel@synopsys.com>
 <CAKMK7uE5HHDCQ5=t5Z2TcheZd7etREUoHmTVK=q3wxMdSMZK5w@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8ddbfc6b-b6a6-b812-517c-fe959d427e38@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey, Daniel,

On 05-04-2018 10:32, Daniel Vetter wrote:
> On Thu, Apr 5, 2018 at 9:16 AM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
>> Hi Daniel,
>>
>> On Thu, 2018-04-05@08:18 +0200, Daniel Vetter wrote:
>>> On Wed, Apr 4, 2018 at 10:06 PM, Alexey Brodkin
>>> <Alexey.Brodkin@synopsys.com> wrote:
>>>> Hello,
>>>>
>>>> We're trying to use DisplayLink USB2-to-HDMI adapter to render GPU-accelerated graphics.
>>>> Hardware setup is as simple as a devboard + DisplayLink adapter.
>>>> Devboards we use for this experiment are:
>>>>  * Wandboard Quad (based on IMX6 SoC with Vivante GPU) or
>>>>  * HSDK (based on Synopsys ARC HS38 SoC with Vivante GPU as well)
>>>>
>>>> I'm sure any other board with DRM supported GPU will work, those we just used
>>>> as the very recent Linux kernels could be easily run on them both.
>>>>
>>>> Basically the problem is UDL needs to be explicitly notified about new data
>>>> to be rendered on the screen compared to typical bit-streamers that infinitely
>>>> scan a dedicated buffer in memory.
>>>>
>>>> In case of UDL there're just 2 ways for this notification:
>>>>  1) DRM_IOCTL_MODE_PAGE_FLIP that calls drm_crtc_funcs->page_flip()
>>>>  2) DRM_IOCTL_MODE_DIRTYFB that calls drm_framebuffer_funcs->dirty()
>>>>
>>>> But neither of IOCTLs happen when we run Xserver with xf86-video-armada driver
>>>> (see https://urldefense.proofpoint.com/v2/url?u=http-3A__git.arm.linux.org.uk_cgit_xf86-2Dvideo-2Darmada.git_log_-3Fh-3Dunstable-2Ddevel&d=DwIBaQ&
>>>> c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=oEAlP64L9vkuUs_k3kGwwwlN1WJbDMJbCo0uDhwKwwk&s=3ZHj-
>>>> 6JXZBLSTWg_4KMnL0VNi7z8c0RxHzj2U5ywVIw&e=).
>>>>
>>>> Is it something missing in Xserver or in UDL driver?
>>> Use the -modesetting driverr for UDL, that one works correctly.
>> If you're talking about "modesetting" driver of Xserver [1] then indeed
>> picture is displayed on the screen. But there I guess won't be any 3D acceleration.
>>
>> At least that's what was suggested to me earlier here [2] by Lucas:
>> ---------------------------->8---------------------------
>> For 3D acceleration to work under X you need the etnaviv specific DDX
>> driver, which can be found here:
>>
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__git.arm.linux.org.uk_cgit_xf86-2Dvideo-2Darmada.git_log_-3Fh-3Dunstable-2Ddevel&d=DwIGaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=yaVFU4TjGY0gVF8El1uKcisy6TPsyCl9uN7Wsis-qhY&m=NxAlhKaLZI6JlMs1pUBPHr79zFQ8ytECx0wtkVRrkeQ&s=9XSI0qYPrADUy1eUuKDexVOT98l9APph-ArYowGWwow&e=
> You definitely want to use -modesetting for UDL. And I thought with
> glamour and the corresponding mesa work you should also get
> accelaration. Insisting that you must use a driver-specific ddx is
> broken, the world doesn't work like that anymore.

I think what Alexey wants to do is not supported by -modesetting
driver. He wants to offload rendering to a Vivante GPU and then
display the result in *another* output ... For this I think full
PRIME support is needed, right? I see -modesetting has
drmPrimeFDToHandle but no drmPrimeHandleToFD support. In other
words -modesetting can not export buffers to another -modesetting
driver, it can only import them (?)

Thanks and Best Regards,
Jose Miguel Abreu

>
> Lucas, can you pls clarify? Also, why does -armada bind against all
> kms drivers, that's probaly too much.
> -Daniel
>
>> ---------------------------->8---------------------------
>>
>> [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__cgit.freedesktop.org_xorg_xserver_tree_hw_xfree86_drivers_modesetting&d=DwIGaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=yaVFU4TjGY0gVF8El1uKcisy6TPsyCl9uN7Wsis-qhY&m=NxAlhKaLZI6JlMs1pUBPHr79zFQ8ytECx0wtkVRrkeQ&s=yvnVItPaOgvVT8aJFwTO5XXLCCmlSiD89JwhcGeo7MI&e=
>> [2] https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_pipermail_linux-2Dsnps-2Darc_2017-2DNovember_003031.html&d=DwIGaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=yaVFU4TjGY0gVF8El1uKcisy6TPsyCl9uN7Wsis-qhY&m=NxAlhKaLZI6JlMs1pUBPHr79zFQ8ytECx0wtkVRrkeQ&s=8gdiQaxAN7AT_2vwaIpXpXfVPSPKPM275rlmcQZKu28&e=
>>
>> -Alexey
>
>
