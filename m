From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 28 Aug 2017 19:58:05 +0300
Subject: [PATCH v2 0/2] console: don't select first registered console if
 stdout-path used
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170828165807.8408-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Don't select first registered console if one is specified by the device tree
via the stdout-path (or linux,stdout-path) chosen node properties.

Eugeniy Paltsev (2):
  OF: move extern declarations of of_stdout inside ifdef
  console: don't select first registered console if stdout-path used
  
Changes v1->v2:
 * Add exception for "tty0" console as current tty0 behavior is widely used
   by ARM and powerpc boards.

 include/linux/of.h     |  4 ++-
 kernel/printk/printk.c | 84 +++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 72 insertions(+), 16 deletions(-)

-- 
2.9.3
