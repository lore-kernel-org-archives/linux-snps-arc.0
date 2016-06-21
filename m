From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 21 Jun 2016 12:04:15 +0200
Subject: cross compilers [was build failure of sorts]
In-Reply-To: <20160621094537.GP30909@twins.programming.kicks-ass.net>
References: <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <20160617160438.GA24148@gmail.com> <57645C16.9040300@synopsys.com>
 <20160618070501.GC30154@twins.programming.kicks-ass.net>
 <20160618101740.GN30927@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA230750106944A6C@us01wembx1.internal.synopsys.com>
 <20160621074307.GK30154@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA230750106944BC0@us01wembx1.internal.synopsys.com>
 <20160621094537.GP30909@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160621100415.GQ30927@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Jun 21, 2016@11:45:37AM +0200, Peter Zijlstra wrote:

> Should arc-*-* list gdb in their noconfigdirs like many other archs do
> too?

Something like so I suppose.

---
 configure.ac |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 4977d97..464eab5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1088,8 +1088,9 @@ case "${target}" in
   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
     noconfigdirs="$noconfigdirs tcl tk itcl libgui sim"
     ;;
+    # The arc target doesn't support gdb yet.
   arc-*-*|arceb-*-*)
-    noconfigdirs="$noconfigdirs target-libgloss"
+    noconfigdirs="$noconfigdirs gdb target-libgloss"
     ;;
   arm-*-pe*)
     noconfigdirs="$noconfigdirs target-libgloss"
