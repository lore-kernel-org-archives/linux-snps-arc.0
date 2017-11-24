From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 24 Nov 2017 16:02:50 +0000
Subject: glxgears on Etnaviv: couldn't get an RGB, Double-buffered visual
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1511539365.3497.67.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

Being in the middle of bring-up of the new board with Vivante GPU (HSDK namely,
see?https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/plat-hsdk)
I was looking at simple 3D test apps to see how Etnaviv works on the hardware.

So far I was able to get kmscube working perfectly fine and the next item I took
was glxgears (for some reason I was under impression that's de facto "Hello world" app
in the GPU world). But apparently even with Xserver up and running glxgears doesn't work.

Moreover I tried the same thing on Wandboard Quad but to no avail as well.
That's what I saw:
------------------------->8---------------------
# glxgears
Error: couldn't get an RGB, Double-buffered visual

# glxinfo
name of display: :0
Error: couldn't find RGB GLX visual or fbconfig?
------------------------->8---------------------

Googling didn't help here unfortunately so maybe some pointers could be
suggested here... like what do I do wrong and if glxgears is supposed to
work on top of DRM GPU at all?

Thanks a lot in advance!

-Alexey
