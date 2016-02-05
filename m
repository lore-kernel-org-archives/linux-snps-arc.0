From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Fri, 5 Feb 2016 10:44:29 +0000
Subject: [PATCH v8 2/2] add new platform driver for PCI RC
In-Reply-To: <20160204234334.GH7031@localhost>
References: <cover.1454600622.git.jpinto@synopsys.com>
 <c7af1603d4f18d11cb0ccee1c07708a1455ea4ed.1454600622.git.jpinto@synopsys.com>
 <20160204181911.GA2143@localhost> <56B398E9.3080902@synopsys.com>
 <20160204234334.GH7031@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56B47D0D.5030204@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

On 2/4/2016 11:43 PM, Bjorn Helgaas wrote:
>> What do you think?
> 
> I don't think the "dw" part is relevant (none of the other
> DesignWare-based drivers includes it in the driver or file name).
> 
> How do people typically refer to this board?
> 
> I really like "synopsys" because it fits the pattern of being
> recognizable and pronounceable like "altera", "designware", "qcom",
> "keystone", "layerscape", "tegra", etc.  But I can't tell whether it's
> too generic.
> 
> "ipk" or "haps" would be fine with me.  I think it's OK if it doesn't
> cover 100% of the possible systems.

I think we should follow the iproc example: pcie-iproc-platform.c
In this case we would have pcie-designware-platform.c
I think this would be the best name because the driver is a non soc specific
designware platform driver.

Arnd and Bjorn agree on this name?

> 
> Bjorn
> 

Joao
