From: richard@nod.at (Richard Weinberger)
Date: Sat, 03 Nov 2018 10:15:11 +0100
Subject: [PATCH -next 0/3] Add support for fast mremap
In-Reply-To: <20181103040041.7085-1-joelaf@google.com>
References: <20181103040041.7085-1-joelaf@google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <6886607.O3ZT5bM3Cy@blindfold>
To: linux-snps-arc@lists.infradead.org

Joel,

Am Samstag, 3. November 2018, 05:00:38 CET schrieb Joel Fernandes:
> Hi,
> Here is the latest "fast mremap" series. This just a repost with Kirill's
> Acked-bys added. I would like this to be considered for linux -next.  I also
> dropped the CONFIG enablement patch for arm64 since I am yet to test it with
> the new TLB flushing code that is in very recent kernel releases. (None of my
> arm64 devices run mainline right now.) so I will post the arm64 enablement once
> I get to that. The performance numbers in the series are for x86.
> 
> List of patches in series:
> 
> (1) mm: select HAVE_MOVE_PMD in x86 for faster mremap
> 
> (2) mm: speed up mremap by 20x on large regions (v4)
> v1->v2: Added support for per-arch enablement (Kirill Shutemov)
> v2->v3: Updated commit message to state the optimization may also
> 	run for non-thp type of systems (Daniel Col).
> v3->v4: Remove useless pmd_lock check (Kirill Shutemov)
> 	Rebased ontop of Linus's master, updated perf results based
>         on x86 testing. Added Kirill's Acks.
> 
> (3) mm: treewide: remove unused address argument from pte_alloc functions (v2)
> v1->v2: fix arch/um/ prototype which was missed in v1 (Anton Ivanov)
>         update changelog with manual fixups for m68k and microblaze.
> 
> not included - (4) mm: select HAVE_MOVE_PMD in arm64 for faster mremap
>     This patch is dropped since last posting pending further performance
>     testing on arm64 with new TLB gather updates. See notes in patch
>     titled "mm: speed up mremap by 500x on large regions" for more
>     details.
> 

This breaks UML build:
  CC      mm/mremap.o
mm/mremap.c: In function ?move_normal_pmd?:
mm/mremap.c:229:2: error: implicit declaration of function ?set_pmd_at?; did you mean ?set_pte_at?? [-Werror=implicit-function-declaration]
  set_pmd_at(mm, new_addr, new_pmd, pmd);
  ^~~~~~~~~~
  set_pte_at
  CC      crypto/rng.o
  CC      fs/direct-io.o
cc1: some warnings being treated as errors

To test yourself, just run on a x86 box:
$ make defconfig ARCH=um
$ make linux ARCH=um

Thanks,
//richard
