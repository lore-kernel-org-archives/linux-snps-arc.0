From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 17 Mar 2016 11:13:50 +0000
Subject: [PATCH v2] ARC: axs10x - add Ethernet PHY description in .dts
References: <1458207712-29435-1-git-send-email-abrodkin@synopsys.com>
 <56EA8DCC.8070308@cogentembedded.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E903A3@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 17 March 2016 04:28 PM, Sergei Shtylyov wrote:
> On 3/17/2016 12:41 PM, Alexey Brodkin wrote:
>
>> > Following commit broke DW GMAC functionality on AXS10x boards:
>> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=e34d65696d2ef13dc32f2a162556c86c461ed763
>     Note that scripts/checkpatch.pl now enforces certain format for citing 
> commits: commit <12-digit SHA1> ("<commit summary>").
>
> [...]
>
> MBR, Sergei

Indeed - I've fixed this up and added to arc for-curr !

-Vineet
