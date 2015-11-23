From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 23 Nov 2015 13:03:59 +0000
Subject: dwarf unwinder question
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D2DF8@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jan,

ARC port has kernel dwarf unwinder shamelessly copied from your original code
which existed in tree at the time (circa 2008)

I was wondering if u could answer a question in that respect: arch/arc/kernel/unwind.c

If the binary search for a PC fails, it resorts to linear search, which for our
case was taking 3 million cycles (vs. normal ~2000).
Do you remember why this linear search step was needed - after all the binary
lookup table is created out of early parsing of the same data.

The fail scenario is for hand asm symbols lacking gcc generated dwarf info and we
don't have yet the CFI pseudo ops support in assembler.
I can fix memset etc to have empty dwarf info, still unwinder needs this fixing.

In case of perf, an overflow interrupt in hand optimized memset leads into the
unwinder slow path linear search which causes RCU stalls and such.
I'm going to remove it but was wondering if u could provide some historic background.

TIA,
-Vineet
