From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:53 -0800
Subject: [PATCH v2 13/15] build-many-glibcs.py: Enable ARC builds
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-14-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                    | 1 +
 scripts/build-many-glibcs.py | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/ChangeLog b/ChangeLog
index d8ecb7d233c5..63418806d331 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -99,6 +99,7 @@
 	* sysdeps/unix/sysv/linux/arc/configure: New file.
 	* sysdeps/unix/sysv/linux/arc/configure.ac: New file.
 	* sysdeps/unix/sysv/linux/arc/shlib-versions: New file.
+	* scripts/build-many-glibcs.py: Enable building for ARC.
 
 2019-01-25  Siddhesh Poyarekar  <siddhesh at sourceware.org>
 
diff --git a/scripts/build-many-glibcs.py b/scripts/build-many-glibcs.py
index 025876486a35..40bf9398d48d 100755
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
@@ -1265,6 +1268,7 @@ class Config(object):
     def install_linux_headers(self, cmdlist):
         """Install Linux kernel headers."""
         arch_map = {'aarch64': 'arm64',
+                    'arc': 'arc',
                     'alpha': 'alpha',
                     'arm': 'arm',
                     'csky': 'csky',
-- 
2.7.4
