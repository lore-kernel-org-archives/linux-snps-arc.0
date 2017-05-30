From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 30 May 2017 17:04:23 +0000
Subject: [PATCH] arc: Add "include chroot" for DT bindings
In-Reply-To: <CAL_Jsq+0B_xeoq9vpRLAgBTexVEeosNYO=AyWExQ6HR_Qizcyg@mail.gmail.com>
References: <1496150575-9273-1-git-send-email-abrodkin@synopsys.com>
 <CAL_Jsq+0B_xeoq9vpRLAgBTexVEeosNYO=AyWExQ6HR_Qizcyg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496163862.3204.21.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Rob,

On Tue, 2017-05-30@11:56 -0500, Rob Herring wrote:
> On Tue, May 30, 2017 at 8:22 AM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
> > 
> > Basically this extends
> > c58299aa8754 "kbuild: create an "include chroot" for DT bindings" for
> > ARC where we extensively use Device Tree and there're good reasons
> > to use DT bindings, especially if those are required.
> > 
> > Otherwise on attempt to compile .dts with something like:
> > -------------------->8---------------------
> > ?#include <dt-bindings/net/ti-dp83867.h>
> > -------------------->8---------------------
> > 
> > we inevitably see this compilation failure:
> > -------------------->8---------------------
> > arch/arc/boot/dts/hsdk.dts:16:40: fatal error: dt-bindings/net/ti-dp83867.h: No such file or directory
> > ?#include <dt-bindings/net/ti-dp83867.h>
> > ????????????????????????????????????????^
> > compilation terminated.
> > -------------------->8---------------------
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Stephen Warren <swarren at wwwdotorg.org>
> > Cc: Rob Herring <robh+dt at kernel.org>
> > ---
> > ?arch/arc/boot/dts/include/dt-bindings | 1 +
> > ?1 file changed, 1 insertion(+)
> > ?create mode 120000 arch/arc/boot/dts/include/dt-bindings
> 
> I believe commit d5d332d3f7e8 ("devicetree: Move include prefixes from
> arch to separate directory") does what you want.

Indeed that helps!
Thanks a lot for the pointer!

-Alexey
