From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 12 Jun 2017 10:40:00 -0700
Subject: [PATCH v2 11/11] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <AM5PR0502MB2996B6DA5530C4B37A7B1AF0AACE0@AM5PR0502MB2996.eurprd05.prod.outlook.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
 <1495954328-28736-12-git-send-email-noamca@mellanox.com>
 <ef2527da-03a3-d60e-f5dd-e5b5932d43d0@synopsys.com>
 <AM5PR0502MB299687067469E99F1A7A509EAAC80@AM5PR0502MB2996.eurprd05.prod.outlook.com>
 <ef177e34-e2ac-2e05-c136-e5b213687911@synopsys.com>
 <AM5PR0502MB2996A1F4CFE1FE6AEB433A7DAAC80@AM5PR0502MB2996.eurprd05.prod.outlook.com>
 <AM5PR0502MB2996FBD57D8591A42ED4A84CAAC90@AM5PR0502MB2996.eurprd05.prod.outlook.com>
 <15ef64f3-3b5b-a362-c520-e5316121d3d6@synopsys.com>
 <AM5PR0502MB299646D52F2A0AF3764CEC4BAAC90@AM5PR0502MB2996.eurprd05.prod.outlook.com>
 <67715c5d-30f2-815e-87ab-7fb4e8205a90@synopsys.com>
 <AM5PR0502MB2996B6DA5530C4B37A7B1AF0AACE0@AM5PR0502MB2996.eurprd05.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <01e7716b-291c-08b2-fe93-5c5982ba4a11@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/08/2017 08:17 PM, Noam Camus wrote:
>
> *> From:*Vineet Gupta <Vineet.Gupta1 at synopsys.com>
>
> *> Sent:* Thursday, June 8, 2017 10:00 PM
>
>
> >> With EZsim we try to simulate NPS400 CTOP core and not ARC core, and as such we
> >> strive to have similar echo system for both silicon and its simulator.
>
> >Right, but if you are using nSIM which generates L2 interrupt for user mode error
> >- then it is already different from silicon and needs to handled as such.
> Why so, this is something I wish to minimize and not just live with.
> So I handle difference by redirecting back to the track I want to.
>
> >> If we could, we would alter nSIM to behave just like our silicon.
> >> So in current situation where we lack doing so we suffice in single pretty small
> >> adjustment in OS (platform specific code).
>
> >You are saying contradicting things here. Above u want EZSim to simulate CTOP
> >(i.e. generate machinechk for U errors) but here you claim u use nSIM which will
> >generates L2 intr.
>
> >So I'm still grossly confused.
> Sorry, for confusion.
> I am using nSIM which creates L2 interrupt and not machine check because I got 
> no alternative.
> At the first chance I get the opportunity, I put execution back to my desired 
> direction.
> Since the direction as our silicon dictate is ending with die() it is a clear 
> path without a risk.

OK I understand now - you want the die semantics not try and continue... but the 
patch is simply wrong. From L2 interrupt you jump to machine check vector which 
reads ECR. In this case it would be bogus - with some old stale value. What you 
really want is an NPS version of do_memory_error - since platforms can have their 
way of dealing with such errors - but the low level machine handling is just not 
in their control.

I'd propose the patch below and then you can define your own version of 
do_memory_error() and handle as appropriate !

---->
diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
index ff83e78d0cfb..5a8042784ee9 100644
--- a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -80,11 +80,26 @@ int name(unsigned long address, struct pt_regs *regs) \
  DO_ERROR_INFO(SIGILL, "Priv Op/Disabled Extn", do_privilege_fault, ILL_PRVOPC)
  DO_ERROR_INFO(SIGILL, "Invalid Extn Insn", do_extension_fault, ILL_ILLOPC)
  DO_ERROR_INFO(SIGILL, "Illegal Insn (or Seq)", insterror_is_error, ILL_ILLOPC)
-DO_ERROR_INFO(SIGBUS, "Invalid Mem Access", do_memory_error, BUS_ADRERR)
  DO_ERROR_INFO(SIGTRAP, "Breakpoint Set", trap_is_brkpt, TRAP_BRKPT)
  DO_ERROR_INFO(SIGBUS, "Misaligned Access", do_misaligned_error, BUS_ADRALN)

  /*
+ * Entry point for bus errors
+ * opencoded DO_ERROR_INFO() but __weak to allow possible plarform override
+ */
+int __weak do_memory_error(unsigned long address, struct pt_regs *regs)
+{
+       siginfo_t info = {
+               .si_signo = SIGBUS,
+               .si_errno = 0,
+               .si_code  = BUS_ADRERR,
+               .si_addr = (void __user *)address,
+       };
+
+       return unhandled_exception("Invalid Mem Access", regs, &info);
+}
+
+/*
