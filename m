From: sashal@kernel.org (Sasha Levin)
Date: Wed, 19 Dec 2018 18:18:38 +0000
Subject: [PATCH] ARC: adjust memblock_reserve of kernel memory
In-Reply-To: <20181219161616.10422-1-Eugeniy.Paltsev@synopsys.com>
References: <20181219161616.10422-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181219181838.D617C217D7@mail.kernel.org>
To: linux-snps-arc@lists.infradead.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v4.19.10, v4.14.89, v4.9.146, v4.4.168, v3.18.130, 

v4.19.10: Build OK!
v4.14.89: Build OK!
v4.9.146: Build OK!
v4.4.168: Failed to apply! Possible dependencies:
    26f9d5fd82ca ("ARC: support HIGHMEM even without PAE40")
    37eda9df5bd8 ("ARC: mm: Introduce explicit super page size support")
    c2ff5cf2735c ("ARC: mm: Use virt_to_pfn() for addr >> PAGE_SHIFT pattern")

v3.18.130: Failed to apply! Possible dependencies:
    09f3b37e4e3b ("ARC: entry.S: Introduce INTERRUPT_{PROLOGUE,EPILOGUE}")
    1f6ccfff6314 ("ARCv2: Support for ARCv2 ISA and HS38x cores")
    26f9d5fd82ca ("ARC: support HIGHMEM even without PAE40")
    37eda9df5bd8 ("ARC: mm: Introduce explicit super page size support")
    4bf4564b27db ("ARC: entry.S: comments cleanup")
    565a9b497c51 ("ARC: RIP broken 64bit RTSC")
    5793e273a134 ("ARC: intc: split into ARCompact ISA specific, common bits")
    6d1a20b1d237 ("ARC: entry.S: split into ARCompact ISA specific, common bits")
    820970a5aa3c ("ARCv2: [intc] HS38 core interrupt controller")
    9b8c7d1e7107 ("ARC: entry.S: FAKE_RET_FROM_EXCPN can always use r9")
    a44ec8bd2a55 ("ARC: Fix RTT boot printing")
    a615b47dbf0d ("ARC: entry.S: confine EXCEPTION_* macros to one file")
    a8717d280879 ("ARC: entry.S: Trap handler to use r10 for syscall vs. brkpt decision")
    c10d6969b095 ("ARC: entry.S: Ensure that restore_regs is local to compilation unit")
    dc9e234f91c7 ("ARC: cosmetic: Remove unused ECR bitfield masks")
    f033737e77d9 ("ARC: entry.S: canonical'ize EXCEPTION_{PROLOGUE,EPILOGUE}")
    fbfa26ae3b20 ("ARC: entry.S: common'ize scrtach reg freeup in intr + exceptions")


How should we proceed with this patch?

--
Thanks,
Sasha
