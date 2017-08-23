From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 23 Aug 2017 09:39:41 -0700
Subject: [PATCH 4/5] ARC: AXS103: DTS: Set cpu frequency explicitly via dts
In-Reply-To: <1503487454.2586.58.camel@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
 <20170814161213.17522-5-Eugeniy.Paltsev@synopsys.com>
 <4685c3d5-7a2f-78cd-a11b-2eda0de2dd35@synopsys.com>
 <1503487454.2586.58.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <864f955c-c4c5-c801-1d1f-119873e02827@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/23/2017 04:24 AM, Eugeniy Paltsev wrote:
>> Given that you added a generic feature as part of 1/5 - do other
>> platforms
>> abilis/nps need corresponding fixups as this one !
> Actually no.
> If cpu 0 node don't have "cpu-freq" property we simply print cpu
> frequency and don't try to change it.
> So we can left other dts untouched.

OK good. But to keep things consistent lets fix the rest of DTs, as needed, as a 
separate patch.
