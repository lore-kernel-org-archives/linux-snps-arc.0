From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 12 Jul 2018 18:03:00 +0000
Subject: [PATCH] ARC: [plat-axs10x] Get rid of auto-selected
 CONFIG_AX10x options
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA230750110F6680C@us01wembx1.internal.synopsys.com>
References: <20180711171333.1745-1-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA230750110F6680C@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b0aeb56112386c4301951df8b02603a8e8f124ca.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Thu, 2018-07-12@10:36 -0700, Vineet Gupta wrote:
> On 07/11/2018 10:13 AM, Alexey Brodkin wrote:
> > Commit 4fbaf649ebbc ("ARC: [plat-axs10x] auto-select AXS101 or AXS103 given the  ISA config")
> > made selection of CONFIG_AXS10x option automatic so there's no point
> > in keeping them in defconfigs.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> 
> Can you regenerate the defconfigs - there seem to be more changes now than just those.

The only thing left is this one:
------------------------->8----------------------
@@ -63,7 +63,6 @@ CONFIG_MOUSE_PS2_TOUCHKIT=y
 CONFIG_MOUSE_SERIAL=y
 CONFIG_MOUSE_SYNAPTICS_USB=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
------------------------->8----------------------

But I was going to investigate a bit more on why this one became
not needed. Shouldn't be rocket science but I'd like to understand what
am I doing :)

> Also for the other patch for FUSE, is this something we will need day in day out -
> I'm afraid we will start bloating stuff .

For me the main usage of FUSE is SSHFS which allows to mount file-system of
whatever SSH-enabled server to the board. The point is it's quite a rare occasion
when one may start and use NFS server on machine he/she doesn't own.

As an example I may build stuff on powerful server and still use results
on target.

> If you insist I can add it - but i's still prefer you build them using modules and
> start testing that infra as well.

Modules are all fine with one important note - on every kernel source change we
need to copy every module in rootfs otherwise older ones won't be even loaded.
So for development modules are not super convenient.

Another reason to add more pretty common options to at least HSDK (and I guess
AX10x stuff is on not much interest for you as compared to HSDK) is more and more
people start to play with the board and to make their (and thus ours) life easier
we'd better have basics in place from day one rather than explaining people how
to overcome "unexpected" difficulties.

We may indeed one again agree on having an additional defconfig for demos, distros
and so on together with bare-minimal config we'll be using for our development but
this will mean that fuller defconfig won't be daily tested which is not what we want.
Also keeping in sync multiple configs is not the best idea ever especially if there're
subtle differences here and there.

-Alexey
