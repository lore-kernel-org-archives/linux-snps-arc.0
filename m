From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:42 -0800
Subject: [PATCH 20/21] build-many-glibcs.py: Enable ARC builds
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-21-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                    | 4 ++++
 scripts/build-many-glibcs.py | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/ChangeLog b/ChangeLog
index 376d0e401117..46d288808153 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,3 +1,7 @@
+2018-12-17  Vineet Gupta <vgupta at synopsys.com>
+
+	* scripts/build-many-glibcs.py: Enable building for ARC.
+
 2018-12-17  Cupertino Miranda <cmiranda at synopsys.com>
 
 	* sysdeps/arc/dl-machine.h: Fix relocation.
diff --git a/scripts/build-many-glibcs.py b/scripts/build-many-glibcs.py
index 9051ff17b19d..97e9bedabe0c 100755
--- a/scripts/build-many-glibcs.py
+++ b/scripts/build-many-glibcs.py
@@ -155,6 +155,9 @@ class Context(object):
                                        'cfg': ['--disable-multi-arch']}])
         self.add_config(arch='aarch64_be',
                         os_name='linux-gnu')
+        self.add_config(arch='arc',
+                        os_name='linux-gnu',
+                        gcc_cfg=['--disable-multilib', '--with-cpu=archs'])
         self.add_config(arch='alpha',
                         os_name='linux-gnu')
         self.add_config(arch='arm',
@@ -1258,6 +1261,7 @@ class Config(object):
     def install_linux_headers(self, cmdlist):
         """Install Linux kernel headers."""
         arch_map = {'aarch64': 'arm64',
+                    'arc': 'arc',
                     'alpha': 'alpha',
                     'arm': 'arm',
                     'hppa': 'parisc',
-- 
2.7.4
