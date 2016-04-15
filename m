From: daniel@ffwll.ch (Daniel Vetter)
Date: Fri, 15 Apr 2016 18:42:03 +0200
Subject: Allocation of frame buffer at a specific memory range or address
In-Reply-To: <1460735338.3248.21.camel@synopsys.com>
References: <1460735338.3248.21.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAKMK7uE0LQZgvSBz_0A00JLXXUA-v_4ob3uNxnxT5d6O5i3ybQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Apr 15, 2016 at 5:48 PM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> Hello,
>
> I'm wondering if there's a way to force kernel to allocate backing
> memory for frame buffer in a special location?
>
> A little bit of background below.
> I continue to work on DRM driver for ARC PGU, latest
> is v5 and available here - https://lkml.org/lkml/2016/3/28/170
>
> In current state everything more or less works but I'd like to
> implement one improvement - I'd like to have an ability to specify
> where in memory will be allocated frame-buffer's backing storage area.
> I.e. buffer which will be read by PGU hardware.
>
> Currently we use whatever DRM susbsystem put in "gem->paddr".
> That's a snippet of the code which tells PGU hardware
> which memory location to scan for data:
> --------------------->8--------------------
>         arcpgu = crtc_to_arcpgu_priv(plane->state->crtc);
>         gem = drm_fb_cma_get_gem_obj(plane->state->fb, 0);
>
>         /* Telling PGU hardware where is data to read */
>         arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
> --------------------->8--------------------
>
> But we may use a special memory area which works better
> for that case, i.e. for example could be accessed faster by both
> CPU and PGU hardware (like on-chip SRAM as opposed to external DDR).
>
> And now the question is how to force DRM subsystem or just that driver
> to use whatever predefined (say via device tree) location in memory
> for data buffer allocation.
>
> All thoughts on this are more than welcome.

Instead of using cma, you need to create your own gem buffer objects
and allocate the memory for those from wherever you want to. Or you
can do a mix of cma gem allocations and other objects (e.g. omapdrm
does that). Using cma (which simply uses dma_alloc_coherent
underneath) is just a convenient way, and generally the right choice
on SoC display drivers. There's no need to use that at all, KMS is
fully agnostic to how/what your underlying buffer objects even are.
You could have allocations in some sepcial secure memory that only the
gpu could even read/write, as another example.

Maybe we need to make this part in the overview docs better?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
