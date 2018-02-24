From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 23 Feb 2018 17:38:04 -0800
Subject: [PATCH v2 1/3] ARC: mcip: halt GFRC together with ARC cores
In-Reply-To: <20180223164154.22377-1-Eugeniy.Paltsev@synopsys.com>
References: <20180223164154.22377-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <49291bc3-665b-2cd8-aabc-4adb67b73413@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/23/2018 08:41 AM, Eugeniy Paltsev wrote:
> Currently GFRC is running regardless state of ARC cores in the SMP cluster.
> That means even if ARC cores are halted when doing JTAG debugging GFRC
> [our source of wall-time] continues to run giving us unexpected warnings
> once we allow ARC cores to run due to some tasks being stuck for too
> long.
>
> Starting from ARC HS v3.0 it's possible to tie GFRC to state of up-to 4
> ARC cores with help of GFRC's CORE register where we set a mask for
> cores which state we need to rely on.
>
> We update cpu mask every time new cpu came online instead of using
> hardcoded one or using mask generated from "possible_cpus" as we
> want it set correctly even if we run kernel on HW which has fewer cores
> than expected (or we launch kernel via debugger and kick fever cores
> than HW has)
>
> Signed-off-by: Alexey Brodkin<abrodkin at synopsys.com>
> Signed-off-by: Eugeniy Paltsev<Eugeniy.Paltsev at synopsys.com>

Acked-by: vineet Gupta <vgupta at synopsys.com>
