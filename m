From: alexander.levin@verizon.com (Levin, Alexander)
Date: Mon, 22 Aug 2016 14:14:55 -0400
Subject: ARC stable backport request
In-Reply-To: <2ac8d0fc-9c67-e7c7-41f0-68cb34514019@synopsys.com>
References: <2ac8d0fc-9c67-e7c7-41f0-68cb34514019@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160822180616.GA17185@sasha-lappy>
To: linux-snps-arc@lists.infradead.org

On Mon, Aug 22, 2016@10:36:20AM -0700, Vineet Gupta wrote:
> Hi Stable Team,
> 
> Could you please backport upstream 20d780374c81c ("ARC: build: Better way to
> detect ISA compatible toolchain")
> 
> This is needed to let kernel building with newer gcc 6.x based tools.
> 
> Thx,
> -Vineet

What's the version range? It looks to me like it depends on 1f6ccfff6
("ARCv2: Support for ARCv2 ISA and HS38x cores") which means 4.2+?

-- 

Thanks,
Sasha
