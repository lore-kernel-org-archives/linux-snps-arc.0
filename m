From: catalin.marinas@arm.com (Catalin Marinas)
Date: Fri, 7 Dec 2018 17:42:32 +0000
Subject: [REPOST PATCH v6 0/4] kgdb: Fix kgdb_roundup_cpus()
In-Reply-To: <20181205033828.6156-1-dianders@chromium.org>
References: <20181205033828.6156-1-dianders@chromium.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181207174231.GD11961@arrakis.emea.arm.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Dec 04, 2018@07:38:24PM -0800, Douglas Anderson wrote:
> Douglas Anderson (4):
>   kgdb: Remove irq flags from roundup
>   kgdb: Fix kgdb_roundup_cpus() for arches who used smp_call_function()
>   kgdb: Don't round up a CPU that failed rounding up before
>   kdb: Don't back trace on a cpu that didn't round up

FWIW, trying these on arm64 (ThunderX2) with CONFIG_KGDB_TESTS_ON_BOOT=y
on top of 4.20-rc5 doesn't boot. It looks like they leave interrupts
disabled when they shouldn't and it trips over the BUG at
mm/vmalloc.c:1380 (called via do_fork -> copy_process).

Now, I don't think these patches make things worse on arm64 since prior
to them the kgdb boot tests on arm64 were stuck in a loop (RUN
singlestep).

-- 
Catalin
