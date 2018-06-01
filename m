From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 1 Jun 2018 16:43:14 +0000
Subject: [PATCH] ARC: Explicitly specify OUTPUT_FORMAT in the linker script
In-Reply-To: <05b33c2b-6fb4-6a51-c52b-a0b1012a1000@synopsys.com>
References: <20180601104904.48481-1-abrodkin@synopsys.com>
 <05b33c2b-6fb4-6a51-c52b-a0b1012a1000@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fa3f7d80855306d96dcaea52f5dc2b783d5bceb1.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Fri, 2018-06-01@09:12 -0700, Vineet Gupta wrote:
> On 06/01/2018 03:49 AM, Alexey Brodkin wrote:
> > It might be a good idea to explicitly specify BFD format
> > depending on -EB/-EL option passed to the linker and not rely on
> > default behavior as we have now.
> 
> What exactly is the problem we are trying to solve here ?
> Is this preventive or did you run into something - if latter can u explain it here
> please ?

Right, this is preventive patch.
As Claus mentioned that's good to have this explicit information for BFD but
otherwise there's no clear requirement or even recommendation on OUTPUT_FORMAT
usage so that might not be needed.

-Alexey
