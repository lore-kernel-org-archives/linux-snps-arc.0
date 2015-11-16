From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Nov 2015 13:30:10 +0530
Subject: using IS_ENABLED(CONFIG_xyz) effectively
In-Reply-To: <1444165543-2209-1-git-send-email-linux@rasmusvillemoes.dk>
References: <5613F3DE.4010406@suse.cz>
 <1444165543-2209-1-git-send-email-linux@rasmusvillemoes.dk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56498D0A.3070000@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

I've been using IS_ENABLED for some time and once in a while run into an issue
which prevents seamless use. Hence posing this question to experts in the area.

C macro processor evaluates the ensuing control block even if IS_ENABLED evaluates
to false. This requires dummy #defines or worse still removing usage of IS_ENABLED
altogether.

e.g. In example below even for ARCOMPACT builds, we need the ARCV2 specific define
ARCV2_IRQ_DEF_PRIO.

void arch_cpu_idle(void)
{
        if (is_isa_arcompact()) {    <---- IS_ENABLED(CONFIG_ISA_ARCOMPACT)
                __asm__("sleep 0x3");
        } else {
		const int arg = 0x10 | ARCV2_IRQ_DEF_PRIO;
               __asm__("sleep 0x10");
	}
}

One could argue that the interface needs to be cleanly defined to not have such
specific #defines in common code in first place. However sometime that becomes
just too tedious.

Is there a way to get around by this ?

Thx,
-Vineet
