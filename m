From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Thu, 4 Feb 2016 11:14:00 +0000
Subject: [PATCH v7 2/2] add new platform driver for PCI RC
In-Reply-To: <20160203183844.GC10879@localhost>
References: <cover.1454349430.git.jpinto@synopsys.com>
 <10b29adcdb0a31eb8f8071b271da267e44ad8a04.1454349430.git.jpinto@synopsys.com>
 <8223655.W63T0XOVm1@wuerfel> <20160203180514.GA10879@localhost>
 <56B242F0.6040704@synopsys.com> <20160203183844.GC10879@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56B33278.3000408@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Bjorn,

On 2/3/2016 6:38 PM, Bjorn Helgaas wrote:
> On Wed, Feb 03, 2016@06:12:00PM +0000, Joao Pinto wrote:
>> Hi Bjorn,
>>
>> Are these tasks enough?
>>
>> - replace mdelay() for msleep()
>> - remove synopsys_pcie_irq_handler()
> 
> Above are fine with me.

Ok, I'll to that.

Thanks.
