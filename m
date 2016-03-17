From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 17 Mar 2016 12:10:37 +0000
Subject: [PATCH v2] ARC: axs10x - add Ethernet PHY description in .dts
In-Reply-To: <56EA9C0D.1090000@cogentembedded.com>
References: <1458207712-29435-1-git-send-email-abrodkin@synopsys.com>
 <56EA8DCC.8070308@cogentembedded.com>
 <1458214678.14496.15.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E903EF@us01wembx1.internal.synopsys.com>
 <56EA9C0D.1090000@cogentembedded.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1458216636.14496.19.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Sergei,

On Thu, 2016-03-17@14:59 +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 3/17/2016 2:41 PM, Vineet Gupta wrote:
> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Following commit broke DW GMAC functionality on AXS10x boards:
> > > > > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=e34d65696d2ef13dc32f2a162556c86c461e
> > > > > d763
> > > > ?????Note that scripts/checkpatch.pl now enforces certain format for citing
> > > > commits: commit <12-digit SHA1> ("<commit summary>").
> > 
> > > 
> > > Frankly I haven't run that patch through checkpatch due to patch
> > > simplicity.
> > > 
> > > But I'll try to not do any assumptions from now on and will try to
> > > use checkpatch for each and every thing I send :)
> > > 
> > > Thanks for spotting all his!
> > > 
> ????Sorry for not reporting everything on the 1st review.
> 
> > 
> > > 
> > > -Alexey
> > Sergei, do you mind providing a Ack/Reviewed-by on the patch below
> ?>
> 
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov at cogentembedded.com>
> 
> ????The patch here is white space damaged however: tabs were converted to?
> spaces. :-(

Well, I'm not really sure why that substitution happened because my local patch
is indeed with tabs.

That's an output of checkpatch:
------------------------>8------------------------
./scripts/checkpatch.pl 0001-ARC-axs10x-add-Ethernet-PHY-description-in-.dts.patch?
[1]+??Done????????????????????gedit 0001-ARC-axs10x-add-Ethernet-PHY-description-in-.dts.patch
WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7:?
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=e34d65696d2ef13dc32f2a162556c86c461ed763

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit e34d65696d2e
("stmmac: create of compatible mdio bus for stmmac driver")'
#7:?
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=e34d65696d2ef13dc32f2a162556c86c461ed763

total: 1 errors, 1 warnings, 14 lines checked

0001-ARC-axs10x-add-Ethernet-PHY-description-in-.dts.patch has style problems, please review.
------------------------>8------------------------

If there were spaces we would see tons of:
------------------------>8------------------------
ERROR: code indent should use tabs where possible
#43: FILE: arch/arc/boot/dts/axs10x_mb.dtsi:50:
+????????????????????????mdio0 {$
------------------------>8------------------------
which I didn't see.

-Alexey
