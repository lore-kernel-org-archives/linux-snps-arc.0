From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 14 May 2019 17:29:27 -0700
Subject: [PATCH 0/9] ARC do_page_fault rework
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This was on my todo list and Eugeniy's patch in this area pestered me to
finish it finally.

The ideas it to cleanup/tidyup ancient do_page_fault() code and make
it more readable and hopefully better generated code. There are only
a few/subtle functional changes
 - Eugeniy's fix to prevent user space looping
 - reduction in mmap_sem hold times

Also this could have been 1 single patch but this is tricky part of mm
handling so better done as bite sized pieces to track down any regressions

Eugeniy Paltsev (1):
  ARC: mm: SIGSEGV userspace trying to access kernel virtual memory

Vineet Gupta (8):
  ARC: mm: do_page_fault refactor #1: remove label @good_area
  ARC: mm: do_page_fault refactor #2: remove short lived variable
  ARC: mm: do_page_fault refactor #3: tidyup vma access permission code
  ARC: mm: do_page_fault refactor #4: consolidate retry related logic
  ARC: mm: do_page_fault refactor #5: scoot no_context to end
  ARC: mm: do_page_fault refactor #6: error handlers to use same pattern
  ARC: mm: do_page_fault refactor #7: fold the various error handling
  ARC: mm: do_page_fault refactor #8: release mmap_sem sooner

 arch/arc/mm/fault.c | 192 +++++++++++++++++++++-------------------------------
 1 file changed, 79 insertions(+), 113 deletions(-)

-- 
2.7.4
