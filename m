From: sergei.shtylyov@cogentembedded.com (Sergei Shtylyov)
Date: Thu, 17 Mar 2016 14:59:09 +0300
Subject: [PATCH v2] ARC: axs10x - add Ethernet PHY description in .dts
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E903EF@us01wembx1.internal.synopsys.com>
References: <1458207712-29435-1-git-send-email-abrodkin@synopsys.com>
 <56EA8DCC.8070308@cogentembedded.com>
 <1458214678.14496.15.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E903EF@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56EA9C0D.1090000@cogentembedded.com>
To: linux-snps-arc@lists.infradead.org

Hello.

On 3/17/2016 2:41 PM, Vineet Gupta wrote:

>>>> Following commit broke DW GMAC functionality on AXS10x boards:
>>>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=e34d65696d2ef13dc32f2a162556c86c461ed763
>>>      Note that scripts/checkpatch.pl now enforces certain format for citing
>>> commits: commit <12-digit SHA1> ("<commit summary>").

>> Frankly I haven't run that patch through checkpatch due to patch
>> simplicity.
>>
>> But I'll try to not do any assumptions from now on and will try to
>> use checkpatch for each and every thing I send :)
>>
>> Thanks for spotting all his!
>>

    Sorry for not reporting everything on the 1st review.

>> -Alexey
>
> Sergei, do you mind providing a Ack/Reviewed-by on the patch below
 >

Reviewed-by: Sergei Shtylyov <sergei.shtylyov at cogentembedded.com>

    The patch here is white space damaged however: tabs were converted to 
spaces. :-(

MBR, Sergei
