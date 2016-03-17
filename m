From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 17 Mar 2016 11:37:58 +0000
Subject: [PATCH v2] ARC: axs10x - add Ethernet PHY description in .dts
In-Reply-To: <56EA8DCC.8070308@cogentembedded.com>
References: <1458207712-29435-1-git-send-email-abrodkin@synopsys.com>
 <56EA8DCC.8070308@cogentembedded.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1458214678.14496.15.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Sergei,

On Thu, 2016-03-17@13:58 +0300, Sergei Shtylyov wrote:
> On 3/17/2016 12:41 PM, Alexey Brodkin wrote:
> 
> > 
> > Following commit broke DW GMAC functionality on AXS10x boards:
> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=e34d65696d2ef13dc32f2a162556c86c461ed763
> ????Note that scripts/checkpatch.pl now enforces certain format for citing?
> commits: commit <12-digit SHA1> ("<commit summary>").

Frankly I haven't run that patch through checkpatch due to patch
simplicity.

But I'll try to not do any assumptions from now on and will try to
use checkpatch for each and every thing I send :)

Thanks for spotting all his!

-Alexey
