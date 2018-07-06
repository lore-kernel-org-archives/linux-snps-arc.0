From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 6 Jul 2018 13:06:51 +0000
Subject: [PATCH] ARC: Remove CONFIG_INITRAMFS_SOURCE from defconfigs
In-Reply-To: <CAOi56cVxHKh4V1i8W8wS+n3E88UbzBiCo0PozhCeoN3YEnVmBw@mail.gmail.com>
References: <20180606125938.12986-1-abrodkin@synopsys.com>
 <CAOi56cVxHKh4V1i8W8wS+n3E88UbzBiCo0PozhCeoN3YEnVmBw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ebb7bf8e51d6d50ef950ad6c16bbf879b6f7ee75.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2018-06-06@09:32 -0700, Kevin Hilman wrote:
> On Wed, Jun 6, 2018 at 5:59 AM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
> > We used to have pre-set CONFIG_INITRAMFS_SOURCE with local path
> > to intramfs in ARC defconfigs. This was quite convenient for
> > in-house development but not that convenient for newcomers
> > who obviusly don't have folders like "arc_initramfs" next to
> > the Linux source tree. Which leads to quite surprising failure
> > of defconfig building:
> > ------------------------------->8-----------------------------
> >   ../scripts/gen_initramfs_list.sh: Cannot open '../../arc_initramfs_hs/'
> > ../usr/Makefile:57: recipe for target 'usr/initramfs_data.cpio.gz' failed
> > make[2]: *** [usr/initramfs_data.cpio.gz] Error 1
> > ------------------------------->8-----------------------------
> > 
> > So now when more and more people start to deal with our defconfigs
> > let's make their life easier with removal of CONFIG_INITRAMFS_SOURCE.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Kevin Hilman <khilman at baylibre.com>
> > Cc: stable at vger.kernel.org
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> 
> Reviewed-by: Kevin Hilman <khilman at baylibre.com>
> Tested-by: Kevin Hilman <khilman at baylibre.com>

Any chance for this one to hit upstream sometime soon?

-Alexey
