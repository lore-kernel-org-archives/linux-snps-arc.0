From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Thu, 28 Jan 2016 17:00:53 +0000
Subject: [PATCH v6 1/2] PCI support added to ARC
In-Reply-To: <20160127215956.GB4875@localhost>
References: <cover.1452611234.git.jpinto@synopsys.com>
 <24c9b782dfade515bbed20ce75d85200a00a2e66.1452611234.git.jpinto@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E84E0E@us01wembx1.internal.synopsys.com>
 <56A8D441.8080608@synopsys.com> <20160127215956.GB4875@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56AA4945.9060203@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Bjorn,

Thanks for the info.

Joao

On 1/27/2016 9:59 PM, Bjorn Helgaas wrote:
> Hi Joao,
> 
> On Wed, Jan 27, 2016@02:29:21PM +0000, Joao Pinto wrote:
>> Hi Bjorn,
>> Could you please tell me what are the perspectives of pulling this patch set to
>> mainline?
> 
> Sorry for the delay.  I try to handle bug fixes before I look at
> functionality, so sometimes things get backed up a little bit.  But I
> should be able to take a look later this week or early next week.
> 
> Bjorn
> 
>> On 1/14/2016 11:11 AM, Vineet Gupta wrote:
>>> On Thursday 14 January 2016 04:34 PM, Joao Pinto wrote:
>>>> This patch adds PCI support to ARC and updates drivers/pci Makefile
>>>> enabling the ARC arch to use the generic PCI setup functions.
>>>>
>>>> Signed-off-by: Joao Pinto <jpinto at synopsys.com>
>>>
>>> Acked-by: Vineet Gupta <vgupta at synopsys.com>
>>>
>>> @Bjorn are you happy with the driver bits.
>>> Although ARC support is independent of driver, and I can pick it up separately,
>>> it would be better if you took it along with the driver. I don't see potential
>>> for any conflicts.
>>>
>>> Thx,
>>> -Vineet
>>
>> Thanks,
>> Joao
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
>> the body of a message to majordomo at vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
