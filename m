From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 8 Jun 2017 12:00:38 -0700
Subject: [PATCH v2 11/11] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <AM5PR0502MB299646D52F2A0AF3764CEC4BAAC90@AM5PR0502MB2996.eurprd05.prod.outlook.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
 <1495954328-28736-12-git-send-email-noamca@mellanox.com>
 <ef2527da-03a3-d60e-f5dd-e5b5932d43d0@synopsys.com>
 <AM5PR0502MB299687067469E99F1A7A509EAAC80@AM5PR0502MB2996.eurprd05.prod.outlook.com>
 <ef177e34-e2ac-2e05-c136-e5b213687911@synopsys.com>
 <AM5PR0502MB2996A1F4CFE1FE6AEB433A7DAAC80@AM5PR0502MB2996.eurprd05.prod.outlook.com>
 <AM5PR0502MB2996FBD57D8591A42ED4A84CAAC90@AM5PR0502MB2996.eurprd05.prod.outlook.com>
 <15ef64f3-3b5b-a362-c520-e5316121d3d6@synopsys.com>
 <AM5PR0502MB299646D52F2A0AF3764CEC4BAAC90@AM5PR0502MB2996.eurprd05.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <67715c5d-30f2-815e-87ab-7fb4e8205a90@synopsys.com>
To: linux-snps-arc@lists.infradead.org


On 06/08/2017 11:23 AM, Noam Camus wrote:
>
>
> *> From:* Vineet Gupta <Vineet.Gupta1 at synopsys.com>
> *> Sent:* Thursday, June 8, 2017 7:38 PM
>
> >>
> >> With simulator we just turn this configuration on, so we redirect the Legacy
> >> Synopsys L2 ISR from nSIM into machine check.
> >> This way we end up just like with silicon ?
>
> >This doesn't make sense :-)
> >In simulation (where L2 interrupt is asserted), you need to handle it as such -
> >say reading out the banked regs for L2 interrupt. What you are doing here is
> >handling it like an exception which won't work . I really don't see the point of
> >this "alignment" - hardware and simulation are different. simulation semantics are
> >already supported by generic ARC code. And for silicon case, the existing vector
> >woudl MachineCheck would work for both K and U. So I'm not sure what we are trying
> >to achieve here !
> With EZsim we try to simulate NPS400 CTOP core and not ARC core, and as such we 
> strive to have similar echo system for both silicon and its simulator.

Right, but if you are using nSIM which generates L2 interrupt for user mode error 
- then it is already different from silicon and needs to handled as such.

> If we could, we would alter nSIM to behave just like our silicon.
> So in current situation where we lack doing so we suffice in single pretty small 
> adjustment in OS (platform specific code).

You are saying contradicting things here. Above u want EZSim to simulate CTOP 
(i.e. generate machinechk for U errors) but here you claim u use nSIM which will 
generates L2 intr.

So I'm still grossly confused.

What does EZSim (based on nSIM) do when bus error is triggered from User mode - 
does it raise (A) L2 interrupt or (B) MachineCheck ?

If it is (A) the the existing common code in ARC will work - mem_service() -> 
do_memory_error() -> panic()
if it is (B), again the common machinecheck handler will be called and will panic.

I don't see the need to mix both (A) and (B) i.e. use mem_service() which is a L2 
interrupt, but then handle it in MachieChekc which is for exceptions ? How is that 
supposed to work !

-Vineet
