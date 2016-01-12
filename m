From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Tue, 12 Jan 2016 09:55:27 +0000
Subject: [PATCH v4 1/2] PCI support added to ARC
In-Reply-To: <569497AE.3030405@synopsys.com>
References: <cover.1452526707.git.jpinto@synopsys.com>
 <b46c0fbfe3d383ca527e8eb7cbf953e59d346577.1452526707.git.jpinto@synopsys.com>
 <569497AE.3030405@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5694CD8F.1060706@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On 1/12/2016 6:05 AM, Vineet Gupta wrote:
> On Monday 11 January 2016 10:54 PM, Joao Pinto wrote:
>> This patch adds PCI support to ARC and updates drivers/pci Makefile enabling
>> the ARC arch to use the generic PCI setup functions.
>>
>> Signed-off-by: Joao Pinto <jpinto at synopsys.com>
> 
> BTW this patch has whitespace errors still - can you make sure they are not in the
> next version(s)

By executing checkpatch.pl no whitespaces were detected:

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#9:
This patch adds PCI support to ARC and updates drivers/pci Makefile enabling

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#132:
new file mode 100644

total: 0 errors, 2 warnings, 212 lines checked

0001-PCI-support-added-to-ARC.patch has style problems, please review.

> 
> -Vineet
> 

I am going to check your comments and make the necessary adjustments.

Thanks,
Joao
