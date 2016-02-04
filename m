From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Thu, 4 Feb 2016 14:09:26 +0000
Subject: [PATCH v7 2/2] add new platform driver for PCI RC
In-Reply-To: <56B33278.3000408@synopsys.com>
References: <cover.1454349430.git.jpinto@synopsys.com>
 <10b29adcdb0a31eb8f8071b271da267e44ad8a04.1454349430.git.jpinto@synopsys.com>
 <8223655.W63T0XOVm1@wuerfel> <20160203180514.GA10879@localhost>
 <56B242F0.6040704@synopsys.com> <20160203183844.GC10879@localhost>
 <56B33278.3000408@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56B35B96.3090005@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Bjorn and Arnd,

Removing the irq_handler causes the irq request to fail because in
request_threaded_irq() both handler and thread_fn are NULL.

What's the typical procedure for this?

Joao

On 2/4/2016 11:14 AM, Joao Pinto wrote:
> Hi Bjorn,
> 
> On 2/3/2016 6:38 PM, Bjorn Helgaas wrote:
>> On Wed, Feb 03, 2016@06:12:00PM +0000, Joao Pinto wrote:
>>> Hi Bjorn,
>>>
>>> Are these tasks enough?
>>>
>>> - replace mdelay() for msleep()
>>> - remove synopsys_pcie_irq_handler()
>>
>> Above are fine with me.
> 
> Ok, I'll to that.
> 
> Thanks.
> 
