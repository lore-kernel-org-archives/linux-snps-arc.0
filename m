From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 12 Jan 2016 10:49:07 +0000
Subject: [PATCH v4 1/2] PCI support added to ARC
References: <cover.1452526707.git.jpinto@synopsys.com>
 <b46c0fbfe3d383ca527e8eb7cbf953e59d346577.1452526707.git.jpinto@synopsys.com>
 <569497AE.3030405@synopsys.com> <5694CD8F.1060706@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E84825@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 12 January 2016 03:25 PM, Joao Pinto wrote:
> Hi Vineet,
>
> On 1/12/2016 6:05 AM, Vineet Gupta wrote:
>> On Monday 11 January 2016 10:54 PM, Joao Pinto wrote:
>>> This patch adds PCI support to ARC and updates drivers/pci Makefile enabling
>>> the ARC arch to use the generic PCI setup functions.
>>>
>>> Signed-off-by: Joao Pinto <jpinto at synopsys.com>
>> BTW this patch has whitespace errors still - can you make sure they are not in the
>> next version(s)
> By executing checkpatch.pl no whitespaces were detected:
>
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #9:
> This patch adds PCI support to ARC and updates drivers/pci Makefile enabling
>
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #132:
> new file mode 100644
>
> total: 0 errors, 2 warnings, 212 lines checked
>
> 0001-PCI-support-added-to-ARC.patch has style problems, please review.

git am /tmp/1.eml  
Applying: PCI support added to ARC
~/k.org/.git/rebase-apply/patch:167: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
