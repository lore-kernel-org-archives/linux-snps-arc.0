From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 5 Dec 2017 14:47:50 +0000
Subject: xf86-video-armada via UDL [was: Re: UDL's fbdev doesn't work
 for user-space apps]
In-Reply-To: <335eaaa2-b209-fb60-392f-93036050b406@synopsys.com>
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
 <1512474815.4977.90.camel@synopsys.com>
 <335eaaa2-b209-fb60-392f-93036050b406@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512485269.4977.131.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Tue, 2017-12-05@12:26 +0000, Jose Abreu wrote:
> On 05-12-2017 11:53, Alexey Brodkin wrote:
> > 
> > 
> > From my note above about udl_drm_gem_mmap() being only used in case of Xserver
> > I barely may conclude anything. Given my lack of knowledge of DRM guts
> > especially
> > when it comes to complicated cases with DMA buffer exports/imports I cannot say
> > immediately if that's just improper implementation of
> > udl_drm_gem_mmap() or not.
> > Even though I do see some differences between implementation of file_operations->mmap()
> > callback in UDL and
> > say exynos_drm_gem_mmap() or qxl_mmap() it's not clear
> > why this and that implementation was done.
> 
> Oh, I've seen this before. This is the same thing that arcpgu
> used to do in the mmap callback! Please comment out the call to
> update_vm_cache_attr() in the mmap callback and check if it works.

Actually I did it as the first thing when I spotted it in?udl_drm_gem_mmap().
But that made no difference at all :(

-Alexey
